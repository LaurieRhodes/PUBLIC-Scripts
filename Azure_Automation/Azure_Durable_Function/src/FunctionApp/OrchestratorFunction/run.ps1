param($context)
<#
.SYNOPSIS
    Orchestrator function for the Defender vulnerability assessment process.

.DESCRIPTION
    This function orchestrates the end-to-end process of:
    1. Retrieving machine data from Defender
    2. Getting vulnerability data for each machine
    3. Processing and sending data to Event Hub
    
    Uses the fan-out/fan-in pattern for parallel processing of machines.

.PARAMETER context
    The durable function context object containing orchestration details
#>

#region Environment Setup
# Get configuration from environment variables
$EventHubName = $env:EVENTHUB           # Name of the Event Hub
$EventHubNameSpace = $env:EVENTHUBNAMESPACE  # Event Hub Namespace
$ClientId = $env:CLIENTID               # Managed Identity Client ID

# Enable detailed debugging
$DebugPreference = 'Continue'
    
Write-Debug "Orchestrator function started at: $(Get-Date)"
Write-Debug "Environment Variables: EventHub=$EventHubName, Namespace=$EventHubNameSpace, ClientID=$ClientId"
#endregion

#region Task 1: Get Machine List
# Prepare parameters for Get-Machines activity
# This task retrieves all active machines from Defender
$params = @{
    ClientId = $ClientId
}

# Base64 encode parameters for passing to activity function
# Activity functions expect base64 encoded JSON input
$Text = $params | convertto-json
$Bytes = [System.Text.Encoding]::ASCII.GetBytes($Text)
$EncodedText = [Convert]::ToBase64String($Bytes)

# Call Get-Machines activity function
# This will return a list of all active machines in Defender
write-debug "Starting Invoke-DurableActivity -FunctionName Get-Machines"
$GetMachineTask = Invoke-DurableActivity -FunctionName "Get-Machines" -Input $EncodedText 

# Decode and parse the response from Get-Machines
# Convert the base64 encoded JSON back into PowerShell objects
$DecodedText = [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($GetMachineTask))
$machineRecordCollection = ConvertFrom-Json -inputobject $DecodedText
write-debug "Invoke-DurableActivity Get-Machines complete"
#endregion

#region Task 2: Process Vulnerabilities
# Initialize collection for parallel task outputs
# This will store the results from each parallel execution
$ParallelOutput = @()

# Process each machine in parallel using fan-out pattern
# This allows us to process multiple machines simultaneously
foreach ($WorkItem in $machineRecordCollection) {
    # Prepare parameters for Get-Vulnerabilities activity
    # Each parallel execution gets its own machine data and client ID
    $params = @{
        ClientId = $ClientId
        data = $WorkItem  # Individual machine data
    }
    
    # Base64 encode parameters and start vulnerability assessment
    # The Get-Vulnerabilities function will:
    # 1. Query vulnerabilities for the specific machine
    # 2. Process the vulnerability data
    # 3. Send the data to Event Hub
    $EncodedText = [Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes((ConvertTo-Json -InputObject $params -Depth 10)))
    $output = Invoke-DurableActivity -FunctionName "Get-Vulnerabilities" -Input $EncodedText
}
#endregion