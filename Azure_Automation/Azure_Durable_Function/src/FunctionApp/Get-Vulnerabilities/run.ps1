param($params)
<#
.SYNOPSIS
    Activity function to retrieve vulnerability data for specified machines from Microsoft Defender.

.DESCRIPTION
    This function:
    1. Retrieves vulnerability data for each machine from Microsoft Defender API
    2. Processes and formats the vulnerability information
    3. Sends each vulnerability record to Azure Event Hub
    Part of the durable function pattern for vulnerability assessment.

.PARAMETER params
    Base64 encoded JSON string containing:
    - Machine data from Get-Machines function
    - Configuration parameters from orchestrator
#>

# Enable debug output for troubleshooting
$DebugPreference = 'Continue'

#region Parameter Processing
# Decode and parse the base64 encoded parameters
$DecodedText = [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($params))
$params = ConvertFrom-Json -inputobject $DecodedText

# Get configuration from environment variables and parameters
$ClientId = $env:CLIENTID
$data = $params.data 
$EventHubName = $env:EVENTHUB
$EventHubNameSpace = $env:EVENTHUBNAMESPACE

write-debug "ClientId = $($ClientId )"

# Extract machine data from parameters
$machineRecordCollection = $params.data 
#endregion

#region Data Structures
$vulnerabilityCollection = @()

# Define class for vulnerability data structure
# This ensures consistent data format for Event Hub messages
class DeviceTvmSoftwareVulnerabilities {
    [String]$DeviceId                     # Unique identifier for the device
    [String]$DeviceName                   # DNS name of the computer
    [String]$OSPlatform                   # Operating system platform
    [String]$OSArchitecture               # OS architecture (e.g., x64)
    [String]$SoftwareVendor               # Vendor of the vulnerable software
    [String]$SoftwareName                 # Name of the vulnerable software
    [String]$SoftwareVersion              # Version of the vulnerable software
    [String]$CveId                        # Common Vulnerabilities and Exposures ID
    [String]$VulnerabilitySeverityLevel   # Severity level of the vulnerability
    [String]$RecommendedSecurityUpdate    # Description of the recommended update
    [String]$RecommendedSecurityUpdateId  # KB or update ID for the fix
    [String]$CveTags                      # Additional CVE categorization
    [String]$CveMitigationStatus          # Current mitigation status
}
#endregion

#region Vulnerability Processing
function Get-MachineVulnerabilities {
    <#
    .SYNOPSIS
        Retrieves vulnerability data for a specific machine from Defender API.
    
    .DESCRIPTION
        Queries the Defender API for all vulnerabilities associated with a given machine ID.
        Handles pagination and rate limiting.
    #>
    param (
        [string]$DeviceId,
        [string]$DeviceName,
        [string]$OSPlatform,
        [string]$OSArchitecture
    )

    # Set up authentication for Defender API
    $resourceURL = "https://api.securitycenter.microsoft.com/" 
    $Token = Get-AzureADToken -resource $resourceURL -clientId $ClientId
    $authHeader = @{
        'Authorization' = "Bearer $($token)"
    }

    $OutputArray = @()

    # Initial API URL - filter for specific machine ID
    $apiUrl = "https://au.api.security.microsoft.com/api/vulnerabilities/machinesVulnerabilities?`$filter=machineId+eq+'$($DeviceId)'"

    do {
        # Retrieve current page of vulnerabilities
        write-debug "Retrieving vulnerability List $($apiUrl)"
        # DisableKeepAlive prevents connection hanging issues
        $response = Invoke-RestMethod -Uri $apiUrl -Headers $authHeader -Method Get -DisableKeepAlive
        write-debug "vulnerability List Received"

        # Rate limiting - prevent hitting API limits
        Start-Sleep -Seconds 5

        # Process each vulnerability in the response
        foreach($vulnerability in $($response.value)){
            # Create new vulnerability object with machine and vulnerability details
            $tmpobject = [DeviceTvmSoftwareVulnerabilities]::New()
            $tmpobject.DeviceId = $DeviceId
            $tmpobject.DeviceName = $DeviceName
            $tmpobject.OSPlatform = $OSPlatform
            $tmpobject.OSArchitecture = $OSArchitecture
            $tmpobject.SoftwareVendor = $vulnerability.productVendor
            $tmpobject.SoftwareName = $vulnerability.productName
            $tmpobject.SoftwareVersion = $vulnerability.productVersion
            $tmpobject.CveId = $vulnerability.cveId
            $tmpobject.VulnerabilitySeverityLevel = $vulnerability.severity
            $tmpobject.RecommendedSecurityUpdate = ''
            $tmpobject.RecommendedSecurityUpdateId = $vulnerability.fixingKbId
            $tmpobject.CveTags = ''
            $tmpobject.CveMitigationStatus = ''

            $OutputArray += $tmpobject
        }

        # Get URL for next page if it exists
        $apiUrl = $response.'@odata.nextLink'
            
        # Release response object to free memory
        $response = $null
    
    } while ($apiUrl -ne $null)

    return $OutputArray
}
#endregion

#region Event Hub Configuration
# Set up authentication for Event Hub
$EventHubresourceURL = "https://eventhubs.azure.net"
$EventHubURI = "https://$($EventHubNameSpace).servicebus.windows.net/$($EventHubName)/messages?timeout=60"

$EventHubtoken = Get-AzureADToken -resource $EventHubresourceURL -clientId $ClientId

$EventHubheader = @{
    "Authorization" = "Bearer $($EventHubtoken)"
    "Content-Type" = "application/json"
}
#endregion

#region Main Processing Loop
# Process each machine and its vulnerabilities
foreach ($machinerecord in $machineRecordCollection) {
    # Extract machine details
    $DeviceId = $machinerecord.DeviceId 
    $DeviceName = $machinerecord.DeviceName 
    $OSPlatform = $machinerecord.OSPlatform
    $OSArchitecture = $machinerecord.OSArchitecture

    # Get vulnerabilities for current machine
    $vulnerabilities = Get-MachineVulnerabilities -DeviceId $DeviceId -DeviceName $DeviceName -OSPlatform $OSPlatform -OSArchitecture $OSArchitecture 

    # Process each vulnerability and send to Event Hub
    foreach ($vulnerability in $vulnerabilities){
        $vulnerabilityCollection += $vulnerability
        # Send individual vulnerability record to Event Hub
        Invoke-RestMethod -Uri $EventHubURI -Method POST -Headers $EventHubheader -Body $(Convertto-json -inputobject $vulnerability) -Verbose -SkipHeaderValidation  
        write-debug "Event Hub data sent"
    }
} 
#endregion