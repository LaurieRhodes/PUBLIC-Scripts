@description('The location of the resources')
param location string 

@description('The name of the Data Collection Endpoint Id')
param dataCollectionEndpointId string

@description('The Log Analytics Workspace Id used for Sentinel')
param workspaceResourceId string



resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-ASimRegistryEventLogs'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-ASimRegistryEventLogs': {
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
            name: 'EventType'
            type: 'string'
          }
          {
            name: 'SourceSystem'
            type: 'string'
          }
          {
            name: 'EventMessage'
            type: 'string'
          }
          {
            name: 'RuleName'
            type: 'string'
          }
          {
            name: 'EventCount'
            type: 'int'
          }
          {
            name: 'EventStartTime'
            type: 'datetime'
          }
          {
            name: 'EventEndTime'
            type: 'datetime'
          }
          {
            name: 'EventSubType'
            type: 'string'
          }
          {
            name: 'EventResult'
            type: 'string'
          }
          {
            name: 'EventResultDetails'
            type: 'string'
          }
          {
            name: 'EventOriginalUid'
            type: 'string'
          }
          {
            name: 'EventOriginalType'
            type: 'string'
          }
          {
            name: 'EventOriginalSubType'
            type: 'string'
          }
          {
            name: 'EventOriginalResultDetails'
            type: 'string'
          }
          {
            name: 'EventSeverity'
            type: 'string'
          }
          {
            name: 'EventOriginalSeverity'
            type: 'string'
          }
          {
            name: 'EventProduct'
            type: 'string'
          }
          {
            name: 'EventProductVersion'
            type: 'string'
          }
          {
            name: 'EventVendor'
            type: 'string'
          }
          {
            name: 'EventSchemaVersion'
            type: 'string'
          }
          {
            name: 'EventOwner'
            type: 'string'
          }
          {
            name: 'EventReportUrl'
            type: 'string'
          }
          {
            name: 'RuleNumber'
            type: 'int'
          }
          {
            name: 'ThreatId'
            type: 'string'
          }
          {
            name: 'ThreatName'
            type: 'string'
          }
          {
            name: 'ThreatCategory'
            type: 'string'
          }
          {
            name: 'ThreatRiskLevel'
            type: 'int'
          }
          {
            name: 'ThreatOriginalRiskLevel'
            type: 'string'
          }
          {
            name: 'ThreatConfidence'
            type: 'int'
          }
          {
            name: 'ActingProcessCommandLine'
            type: 'string'
          }
          {
            name: 'ThreatOriginalConfidence'
            type: 'string'
          }
          {
            name: 'ActingProcessName'
            type: 'string'
          }
          {
            name: 'ThreatIsActive'
            type: 'boolean'
          }
          {
            name: 'ActingProcessId'
            type: 'string'
          }
          {
            name: 'ThreatFirstReportedTime'
            type: 'datetime'
          }
          {
            name: 'ActingProcessGuid'
            type: 'string'
          }
          {
            name: 'ThreatLastReportedTime'
            type: 'datetime'
          }
          {
            name: 'ThreatField'
            type: 'string'
          }
          {
            name: 'DvcIpAddr'
            type: 'string'
          }
          {
            name: 'DvcHostname'
            type: 'string'
          }
          {
            name: 'DvcDomain'
            type: 'string'
          }
          {
            name: 'DvcDomainType'
            type: 'string'
          }
          {
            name: 'DvcFQDN'
            type: 'string'
          }
          {
            name: 'DvcDescription'
            type: 'string'
          }
          {
            name: 'DvcId'
            type: 'string'
          }
          {
            name: 'DvcIdType'
            type: 'string'
          }
          {
            name: 'DvcMacAddr'
            type: 'string'
          }
          {
            name: 'DvcZone'
            type: 'string'
          }
          {
            name: 'DvcOs'
            type: 'string'
          }
          {
            name: 'DvcOsVersion'
            type: 'string'
          }
          {
            name: 'DvcAction'
            type: 'string'
          }
          {
            name: 'DvcOriginalAction'
            type: 'string'
          }
          {
            name: 'DvcInterface'
            type: 'string'
          }
          {
            name: 'DvcScopeId'
            type: 'string'
          }
          {
            name: 'DvcScope'
            type: 'string'
          }
          {
            name: 'ActorUserId'
            type: 'string'
          }
          {
            name: 'ActorUserAadId'
            type: 'string'
          }
          {
            name: 'RegistryPreviousValueType'
            type: 'string'
          }
          {
            name: 'RegistryPreviousValueData'
            type: 'string'
          }
          {
            name: 'ParentProcessCommandLine'
            type: 'string'
          }
          {
            name: 'AdditionalFields'
            type: 'dynamic'
          }
          {
            name: 'RegistryKey'
            type: 'string'
          }
          {
            name: 'RegistryValueData'
            type: 'string'
          }
          {
            name: 'ActorUserSid'
            type: 'string'
          }
          {
            name: 'ActorUserIdType'
            type: 'string'
          }
          {
            name: 'ActorScopeId'
            type: 'string'
          }
          {
            name: 'ActorScope'
            type: 'string'
          }
          {
            name: 'ActorUsername'
            type: 'string'
          }
          {
            name: 'ActorUsernameType'
            type: 'string'
          }
          {
            name: 'ActorUserType'
            type: 'string'
          }
          {
            name: 'ActorOriginalUserType'
            type: 'string'
          }
          {
            name: 'ActorSessionId'
            type: 'string'
          }
          {
            name: 'EventSchema'
            type: 'string'
          }
          {
            name: 'ParentProcessName'
            type: 'string'
          }
          {
            name: 'ParentProcessId'
            type: 'string'
          }
          {
            name: 'ParentProcessGuid'
            type: 'string'
          }
          {
            name: 'RegistryValue'
            type: 'string'
          }
          {
            name: 'RegistryValueType'
            type: 'string'
          }
          {
            name: 'RegistryPreviousKey'
            type: 'string'
          }
          {
            name: 'RegistryPreviousValue'
            type: 'string'
          }
        ]
      }
    }
    destinations: {
      logAnalytics: [
        {
          workspaceResourceId: workspaceResourceId
          name: 'Sentinel-ASimRegistryEventLogs'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-ASimRegistryEventLogs'
        ]
        destinations: [
          'Sentinel-ASimRegistryEventLogs'
        ]
        transformKql: 'source | project TenantId= toguid(TenantId), TimeGenerated, EventType, SourceSystem, EventMessage, RuleName, EventCount, EventStartTime, EventEndTime, EventSubType, EventResult, EventResultDetails, EventOriginalUid, EventOriginalType, EventOriginalSubType, EventOriginalResultDetails, EventSeverity, EventOriginalSeverity, EventProduct, EventProductVersion, EventVendor, EventSchemaVersion, EventOwner, EventReportUrl, RuleNumber, ThreatId, ThreatName, ThreatCategory, ThreatRiskLevel, ThreatOriginalRiskLevel, ThreatConfidence, ActingProcessCommandLine, ThreatOriginalConfidence, ActingProcessName, ThreatIsActive, ActingProcessId, ThreatFirstReportedTime, ActingProcessGuid, ThreatLastReportedTime, ThreatField, DvcIpAddr, DvcHostname, DvcDomain, DvcDomainType, DvcFQDN, DvcDescription, DvcId, DvcIdType, DvcMacAddr, DvcZone, DvcOs, DvcOsVersion, DvcAction, DvcOriginalAction, DvcInterface, DvcScopeId, DvcScope, ActorUserId, ActorUserAadId, RegistryPreviousValueType, RegistryPreviousValueData, ParentProcessCommandLine, AdditionalFields, RegistryKey, RegistryValueData, ActorUserSid, ActorUserIdType, ActorScopeId, ActorScope, ActorUsername, ActorUsernameType, ActorUserType, ActorOriginalUserType, ActorSessionId, EventSchema, ParentProcessName, ParentProcessId, ParentProcessGuid, RegistryValue, RegistryValueType, RegistryPreviousKey, RegistryPreviousValue```'
        outputStream: 'Microsoft-ASimRegistryEventLogs'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId 
