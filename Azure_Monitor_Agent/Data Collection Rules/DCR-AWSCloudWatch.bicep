@description('The location of the resources')
param location string 

@description('The name of the Data Collection Endpoint Id')
param dataCollectionEndpointId string

@description('The Log Analytics Workspace Id used for Sentinel')
param workspaceResourceId string



resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-AWSCloudWatch'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-AWSCloudWatch': {
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
            name: 'Message'
            type: 'string'
          }
          {
            name: 'ExtractedTime'
            type: 'datetime'
          }
        ]
      }
    }
    destinations: {
      logAnalytics: [
        {
          workspaceResourceId: workspaceResourceId
          name: 'Sentinel-AWSCloudWatch'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-AWSCloudWatch'
        ]
        destinations: [
          'Sentinel-AWSCloudWatch'
        ]
        transformKql: 'source | project TenantId= toguid(TenantId), TimeGenerated, SourceSystem, Message, ExtractedTime'
        outputStream: 'Microsoft-AWSCloudWatch'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId 
