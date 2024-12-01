param location string
param workspaceResourceId string
param dataCollectionEndpointId string

resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-Syslog'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-Syslog': {
        columns: [
          {
            name: 'TenantId'
            type: 'string'
          }          
          {
            name: 'SourceSystem'
            type: 'string'
          }
          {
            name: 'TimeGenerated'
            type: 'datetime'
          }
          {
            name: 'Computer'
            type: 'string'
          }
          {
            name: 'EventTime'
            type: 'datetime'
          }
          {
            name: 'Facility'
            type: 'string'
          }
          {
            name: 'HostName'
            type: 'string'
          }
          {
            name: 'SeverityLevel'
            type: 'string'
          }
          {
            name: 'SyslogMessage'
            type: 'string'
          }
          {
            name: 'ProcessID'
            type: 'int'
          }
          {
            name: 'HostIP'
            type: 'string'
          }
          {
            name: 'ProcessName'
            type: 'string'
          }
          {
            name: 'CollectorHostName'
            type: 'string'
          }
          {
            name: 'Type'
            type: 'string'
          }
        ]
      }
    }
    dataSources: {}
    destinations: {
      logAnalytics: [
        {
          workspaceResourceId: workspaceResourceId
          name: 'Sentinel-Syslog'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-Syslog'
        ]
        destinations: [
          'Sentinel-Syslog'
        ]
        transformKql: 'source | project TenantId = toguid(TenantId), SourceSystem, TimeGenerated, Computer, EventTime, Facility, HostName, SeverityLevel, SyslogMessage, ProcessID, HostIP, ProcessName, CollectorHostName, Type'
        outputStream: 'Microsoft-Syslog'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId