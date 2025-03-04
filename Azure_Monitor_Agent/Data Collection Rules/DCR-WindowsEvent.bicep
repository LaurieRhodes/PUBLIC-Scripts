@description('The location of the resources')
param location string 

@description('The name of the Data Collection Endpoint Id')
param dataCollectionEndpointId string

@description('The Log Analytics Workspace Id used for Sentinel')
param workspaceResourceId string



resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-WindowsEvent'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-WindowsEvent': {
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
            name: 'Channel'
            type: 'string'
          }
          {
            name: 'Computer'
            type: 'string'
          }
          {
            name: 'Version'
            type: 'int'
          }
          {
            name: 'Data'
            type: 'string'
          }
          {
            name: 'Opcode'
            type: 'string'
          }
          {
            name: 'RawEventData'
            type: 'string'
          }
          {
            name: 'SystemUserId'
            type: 'string'
          }
          {
            name: 'TimeCreated'
            type: 'datetime'
          }
          {
            name: 'ManagementGroupName'
            type: 'string'
          }
          {
            name: 'Keywords'
            type: 'string'
          }
          {
            name: 'Correlation'
            type: 'string'
          }
          {
            name: 'SystemProcessId'
            type: 'int'
          }
          {
            name: 'SystemThreadId'
            type: 'int'
          }
          {
            name: 'EventRecordId'
            type: 'string'
          }
          {
            name: 'Provider'
            type: 'string'
          }
          {
            name: 'EventID'
            type: 'int'
          }
          {
            name: 'Task'
            type: 'int'
          }
          {
            name: 'EventOriginId'
            type: 'string'
          }
          {
            name: 'EventLevel'
            type: 'int'
          }
          {
            name: 'EventLevelName'
            type: 'string'
          }
          {
            name: 'EventData'
            type: 'string'
          }
        ]
      }
    }
    destinations: {
      logAnalytics: [
        {
          workspaceResourceId: workspaceResourceId
          name: 'Sentinel-WindowsEvent'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-WindowsEvent'
        ]
        destinations: [
          'Sentinel-WindowsEvent'
        ]
        transformKql: 'source | project TenantId= toguid(TenantId), TimeGenerated, SourceSystem, Channel, Computer, Version, Data, Opcode, RawEventData, SystemUserId, TimeCreated, ManagementGroupName, Keywords, Correlation, SystemProcessId, SystemThreadId, EventRecordId, Provider, EventID, Task, EventOriginId, EventLevel, EventLevelName, EventData'
        outputStream: 'Microsoft-WindowsEvent'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId 
