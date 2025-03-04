@description('The location of the resources')
param location string 

@description('The name of the Data Collection Endpoint Id')
param dataCollectionEndpointId string

@description('The Log Analytics Workspace Id used for Sentinel')
param workspaceResourceId string



resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-AWSGuardDuty'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-AWSGuardDuty': {
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
            name: 'Description'
            type: 'string'
          }
          {
            name: 'ActivityType'
            type: 'string'
          }
          {
            name: 'SchemaVersion'
            type: 'string'
          }
          {
            name: 'Severity'
            type: 'int'
          }
          {
            name: 'Region'
            type: 'string'
          }
          {
            name: 'AccountId'
            type: 'string'
          }
          {
            name: 'Partition'
            type: 'string'
          }
          {
            name: 'Arn'
            type: 'string'
          }
          {
            name: 'ResourceDetails'
            type: 'dynamic'
          }
          {
            name: 'ServiceDetails'
            type: 'dynamic'
          }
          {
            name: 'TimeCreated'
            type: 'datetime'
          }
          {
            name: 'Title'
            type: 'string'
          }
        ]
      }
    }
    destinations: {
      logAnalytics: [
        {
          workspaceResourceId: workspaceResourceId
          name: 'Sentinel-AWSGuardDuty'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-AWSGuardDuty'
        ]
        destinations: [
          'Sentinel-AWSGuardDuty'
        ]
        transformKql: 'source | project TenantId= toguid(TenantId), TimeGenerated, SourceSystem, Id, Description, ActivityType, SchemaVersion, Severity, Region, AccountId, Partition, Arn, ResourceDetails, ServiceDetails, TimeCreated, Title'
        outputStream: 'Microsoft-AWSGuardDuty'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId 
