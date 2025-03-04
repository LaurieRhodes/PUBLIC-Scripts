@description('The location of the resources')
param location string 

@description('The name of the Data Collection Endpoint Id')
param dataCollectionEndpointId string

@description('The Log Analytics Workspace Id used for Sentinel')
param workspaceResourceId string



resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-GoogleCloudSCC'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-GoogleCloudSCC': {
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
            name: 'Findings'
            type: 'dynamic'
          }
          {
            name: 'FindingsResource'
            type: 'dynamic'
          }
          {
            name: 'SourceProperties'
            type: 'dynamic'
          }
        ]
      }
    }
    destinations: {
      logAnalytics: [
        {
          workspaceResourceId: workspaceResourceId
          name: 'Sentinel-GoogleCloudSCC'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-GoogleCloudSCC'
        ]
        destinations: [
          'Sentinel-GoogleCloudSCC'
        ]
        transformKql: 'source | project TenantId= toguid(TenantId), TimeGenerated, SourceSystem, Findings, FindingsResource, SourceProperties'
        outputStream: 'Microsoft-GoogleCloudSCC'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId 
