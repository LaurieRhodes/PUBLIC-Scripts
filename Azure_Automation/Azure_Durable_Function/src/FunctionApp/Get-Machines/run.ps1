param($params)
<#
.SYNOPSIS
    Activity function to retrieve all active machines from Microsoft Defender.

.DESCRIPTION
    This function queries the Microsoft Defender API to get a list of all active machines.
    It handles pagination and returns machine details including device ID, name, and OS information.
    The function is part of the durable function pattern for vulnerability assessment.

.PARAMETER params
    Base64 encoded JSON string containing function parameters from the orchestrator.
#>

# Enable debug output for troubleshooting
$DebugPreference = 'Continue'

#region Module Import
# Get the path to the current script directory
$scriptDirectory = Split-Path -Parent $PsScriptRoot

# Define the relative path to the modules directory
$modulesPath = Join-Path $scriptDirectory '\modules'

# Resolve the full path to the modules directory
$resolvedModulesPath = (Get-Item $modulesPath).FullName

# Import all custom PowerShell modules (.psm1 files) recursively
# These modules contain helper functions for authentication and API calls
Get-ChildItem -Path $resolvedModulesPath -Filter *.psm1 -Recurse | ForEach-Object {
    Write-Information "Importing module: $_"
    Import-Module "$_"
}
#endregion

#region Parameter Processing
# Decode and parse the base64 encoded parameters from the orchestrator
$DecodedText = [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($params))
write-information "(Get-Machines) run with decoded parameters: `n $($DecodedText)"
$params = ConvertFrom-Json -inputobject $DecodedText

# Get the Managed Identity Client ID from environment variables
$ClientId = $env:CLIENTID
write-information "(Get-Machines) ClientID = $($ClientId )"
#endregion

#region API Authentication
# Define the Microsoft Defender API endpoint
$resourceURL = "https://api.securitycenter.microsoft.com/"

# Get authentication token using managed identity
$Token = Get-AzureADToken -resource $resourceURL -clientId $ClientId

# Prepare authentication header for API requests
$authHeader = @{
    'Authorization' = "Bearer $($token)"
}
#endregion

#region Machine Data Collection
$machineRecordCollection = @()

# Initial API URL with filter for active machines only
# Using Australia endpoint - modify if needed for different regions
$apiUrl = "https://au.api.security.microsoft.com/api/machines?`$filter=healthStatus+eq+'Active'"

# Retrieve all pages of machine data
do {
    # Get current page of machine data
    write-debug "Retrieving Machine List $($apiUrl)"
    $response = Invoke-RestMethod -Uri $apiUrl -Headers $authHeader -Method Get
    write-debug "Machine List Received"

    # Process each machine in the current page
    foreach ($machinerecord in $response.value) {
        # Create custom object with relevant machine properties
        $tmpobj = [PSCustomObject]@{
            DeviceId       = $machinerecord.id          # Unique identifier for the device
            DeviceName     = $machinerecord.computerDnsName  # DNS name of the computer
            OSPlatform     = $machinerecord.osPlatform      # Operating system (e.g., Windows10)
            OSArchitecture = $machinerecord.osArchitecture  # Architecture (e.g., x64)
        }
        $machineRecordCollection += $tmpobj
    }

    # Rate limiting - prevent hitting API limits
    Start-Sleep -Seconds 2

    # Get URL for next page if it exists
    $apiUrl = $response.'@odata.nextLink'

} while ($apiUrl -ne $null)
#endregion

#region Return Results
# Convert machine collection to JSON and encode as base64
# This format is required for durable function output binding
$Text = $machineRecordCollection | convertto-json
$Bytes = [System.Text.Encoding]::ASCII.GetBytes($Text)
$EncodedText = [Convert]::ToBase64String($Bytes)

# Return the encoded data to the orchestrator
$EncodedText
#endregion