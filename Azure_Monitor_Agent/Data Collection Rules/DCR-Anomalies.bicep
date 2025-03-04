@description('The location of the resources')
param location string 

@description('The name of the Data Collection Endpoint Id')
param dataCollectionEndpointId string

@description('The Log Analytics Workspace Id used for Sentinel')
param workspaceResourceId string



resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-Anomalies'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-Anomalies': {
        columns: [ 
          {
            name: 'TenantId'
            type: 'string'
          }
          {
            name: 'TimeGenerated'
            type: 'datetime'
          }
          {
            name: 'SourceSystem'
            type: 'string'
          }
          {
            name: 'Id'
            type: 'string'
          }
          {
            name: 'UserPrincipalName'
            type: 'string'
          }
          {
            name: 'UserName'
            type: 'string'
          }
          {
            name: 'Description'
            type: 'string'
          }
          {
            name: 'StartTime'
            type: 'datetime'
          }
          {
            name: 'EndTime'
            type: 'datetime'
          }
          {
            name: 'ExtendedProperties'
            type: 'dynamic'
          }
          {
            name: 'RuleName'
            type: 'string'
          }
          {
            name: 'RuleId'
            type: 'string'
          }
          {
            name: 'WorkspaceId'
            type: 'string'
          }
          {
            name: 'VendorName'
            type: 'string'
          }
          {
            name: 'AnomalyTemplateId'
            type: 'string'
          }
          {
            name: 'AnomalyTemplateName'
            type: 'string'
          }
          {
            name: 'AnomalyTemplateVersion'
            type: 'string'
          }
          {
            name: 'RuleStatus'
            type: 'string'
          }
          {
            name: 'RuleConfigVersion'
            type: 'string'
          }
          {
            name: 'Score'
            type: 'string'
          }
          {
            name: 'ExtendedLinks'
            type: 'dynamic'
          }
          {
            name: 'Tactics'
            type: 'string'
          }
          {
            name: 'Techniques'
            type: 'string'
          }
          {
            name: 'SourceIpAddress'
            type: 'string'
          }
          {
            name: 'SourceLocation'
            type: 'dynamic'
          }
          {
            name: 'SourceDevice'
            type: 'string'
          }
          {
            name: 'DestinationIpAddress'
            type: 'string'
          }
          {
            name: 'DestinationLocation'
            type: 'dynamic'
          }
          {
            name: 'DestinationDevice'
            type: 'string'
          }
          {
            name: 'ActivityInsights'
            type: 'dynamic'
          }
          {
            name: 'DeviceInsights'
            type: 'dynamic'
          }
          {
            name: 'UserInsights'
            type: 'dynamic'
          }
          {
            name: 'AnomalyReasons'
            type: 'dynamic'
          }
          {
            name: 'Entities'
            type: 'dynamic'
          }
          {
            name: 'AnomalyDetails'
            type: 'dynamic'
          }
        ]
      }
    }
    destinations: {
      logAnalytics: [
        {
          workspaceResourceId: workspaceResourceId
          name: 'Sentinel-Anomalies'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-Anomalies'
        ]
        destinations: [
          'Sentinel-Anomalies'
        ]
        transformKql: 'source | project TenantId= toguid(TenantId), TimeGenerated, SourceSystem, Id, UserPrincipalName, UserName, Description, StartTime, EndTime, ExtendedProperties, RuleName, RuleId, WorkspaceId, VendorName, AnomalyTemplateId, AnomalyTemplateName, AnomalyTemplateVersion, RuleStatus, RuleConfigVersion, Score= todouble(Score), ExtendedLinks, Tactics, Techniques, SourceIpAddress, SourceLocation, SourceDevice, DestinationIpAddress, DestinationLocation, DestinationDevice, ActivityInsights, DeviceInsights, UserInsights, AnomalyReasons, Entities, AnomalyDetails'
        outputStream: 'Microsoft-Anomalies'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId 
