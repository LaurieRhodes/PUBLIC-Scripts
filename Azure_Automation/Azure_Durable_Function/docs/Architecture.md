# Solution Architecture

## Overview

This solution uses Azure Durable Functions to orchestrate the retrieval and processing of vulnerability data from Microsoft Defender. The solution follows a fan-out/fan-in pattern to efficiently process large datasets.

## Function Components

### TimerTriggerFunction

- Triggers the orchestration daily at 3 AM
- Initiates the orchestrator function

### OrchestratorFunction

- Controls the workflow orchestration
- Manages the fan-out/fan-in pattern
- Key variables:
  - EventHubNameSpace
  - EventHubName
  - ClientId

### Activity Functions

1. **Get-Machines**
   
   - Retrieves list of machines from Defender API
   - Uses managed identity authentication
   - Returns machine data for processing

2. **Get-Vulnerabilities**
   
   - Retrieves vulnerability data for each machine
   - Processes data in parallel for efficiency
   - Handles API pagination

3. **Send-toEventHub**
   
   - Writes processed vulnerability data to Event Hub
   - Uses managed identity for Event Hub authentication

## Data Flow

1. Timer trigger starts orchestration
2. Orchestrator retrieves machine list
3. For each machine, vulnerability data is retrieved in parallel
4. Processed data is aggregated
5. Data is written to Event Hub for downstream processing

## Authentication Flow

1. Managed Identity provides authentication to:
   - Microsoft Defender APIs
   - Azure Event Hub
2. No secrets are stored in the application

## Error Handling

- Built-in retry logic for transient failures
- Logging via Application Insights
- Failed activities are tracked and can be monitored

## Monitoring

- Application Insights provides:
  - Function execution metrics
  - Dependency tracking
  - Exception logging
  - Performance metrics