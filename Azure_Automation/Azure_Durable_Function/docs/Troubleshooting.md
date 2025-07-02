# Troubleshooting Guide

## Common Issues

### Authentication Failures

1. **Managed Identity Issues**
   - Verify managed identity is properly configured
   - Check role assignments in Azure AD
   - Validate ClientId in OrchestratorFunction
   ```powershell
   # Verify managed identity
   Get-AzureADServicePrincipal -ObjectId $MIGuid
   ```

2. **Event Hub Access**
   - Verify "Azure Event Hubs Data Sender" role assignment
   - Check Event Hub connection string format
   - Validate EventHubNameSpace and EventHubName variables

### Function Execution Issues

1. **Timer Trigger Not Firing**
   - Check NCRONTAB expression in function.json
   - Verify function app is running
   - Check Application Insights logs

2. **Activity Function Failures**
   - Review Application Insights exceptions
   - Check function timeouts
   - Verify API endpoint accessibility

## Monitoring

### Application Insights Queries

1. **Check Function Execution**
```kusto
requests
| where timestamp > ago(24h)
| where cloud_RoleName startswith "YourFunctionAppName"
| summarize count() by name, success
```

2. **View Exceptions**
```kusto
exceptions
| where timestamp > ago(24h)
| where cloud_RoleName startswith "YourFunctionAppName"
| project timestamp, type, message, details
```

### Event Hub Monitoring

1. **Verify Data Flow**
   - Check Event Hub metrics in Azure Portal
   - Monitor incoming messages
   - Verify message format

## Performance Optimization

1. **Parallel Processing**
   - Adjust batch sizes in orchestrator
   - Monitor memory usage
   - Check function timeout settings

2. **Resource Scaling**
   - Monitor CPU and memory metrics
   - Adjust function app service plan
   - Consider premium plan for better performance