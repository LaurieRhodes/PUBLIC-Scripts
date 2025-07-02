param($myTimer)
<#
.SYNOPSIS
    Timer trigger function that initiates the vulnerability assessment process.

.DESCRIPTION
    This function:
    1. Runs on a schedule defined in function.json (default: 3 AM daily)
    2. Starts the orchestrator function that manages the vulnerability assessment
    3. Logs the orchestration instance ID for tracking

.PARAMETER myTimer
    Timer trigger binding parameter containing schedule information
#>

# Log execution time for monitoring and debugging
Write-Output "Timer trigger function executed at: $(Get-Date)"

# Start the orchestrator function
try {
    # Start-DurableOrchestration creates new instance of the orchestrator
    # The orchestrator will manage the entire vulnerability assessment process
    $instanceId = Start-DurableOrchestration -FunctionName "OrchestratorFunction"
    
    # Log the instance ID for tracking and debugging
    Write-Output "Started orchestration with ID = $instanceId"
} catch {
    # Log any failures in starting the orchestration
    # This helps with monitoring and troubleshooting
    Write-Error "Failed to start orchestration: $_"
}