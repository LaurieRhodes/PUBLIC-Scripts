param($req)

$body = @"
{"context": "value"}
"@

# Validate the input (if necessary)
if (-not $body) {
    return @{
        statusCode = 400
        body = "Please provide a valid input in the request body."
    }
}

# Start the orchestrator function
$instanceId = Start-DurableOrchestration -FunctionName "OrchestratorFunction" -Input $body

# Return the instance ID to the caller
@{
    statusCode = 202
    body = @{
        instanceId = $instanceId
    } | ConvertTo-Json
}
