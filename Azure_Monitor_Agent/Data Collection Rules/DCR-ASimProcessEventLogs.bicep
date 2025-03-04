@description('The location of the resources')
param location string 

@description('The name of the Data Collection Endpoint Id')
param dataCollectionEndpointId string

@description('The Log Analytics Workspace Id used for Sentinel')
param workspaceResourceId string



resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-ASimProcessEventLogs'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-ASimProcessEventLogs': {
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
            name: 'AdditionalFields'
            type: 'dynamic'
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
            name: 'TargetUserId'
            type: 'string'
          }
          {
            name: 'TargetUserIdType'
            type: 'string'
          }
          {
            name: 'TargetUsername'
            type: 'string'
          }
          {
            name: 'TargetUsernameType'
            type: 'string'
          }
          {
            name: 'TargetUserType'
            type: 'string'
          }
          {
            name: 'TargetOriginalUserType'
            type: 'string'
          }
          {
            name: 'TargetScopeId'
            type: 'string'
          }
          {
            name: 'TargetScope'
            type: 'string'
          }
          {
            name: 'TargetUserSessionId'
            type: 'string'
          }
          {
            name: 'TargetUserSessionGuid'
            type: 'string'
          }
          {
            name: 'ActingProcessFileCompany'
            type: 'string'
          }
          {
            name: 'ActingProcessFileDescription'
            type: 'string'
          }
          {
            name: 'ActingProcessFileProduct'
            type: 'string'
          }
          {
            name: 'ActingProcessFileVersion'
            type: 'string'
          }
          {
            name: 'ActingProcessFileInternalName'
            type: 'string'
          }
          {
            name: 'ActingProcessFileOriginalName'
            type: 'string'
          }
          {
            name: 'ActingProcessFilename'
            type: 'string'
          }
          {
            name: 'ActingProcessIsHidden'
            type: 'boolean'
          }
          {
            name: 'ActingProcessInjectedAddress'
            type: 'string'
          }
          {
            name: 'ActingProcessIntegrityLevel'
            type: 'string'
          }
          {
            name: 'ActingProcessMD5'
            type: 'string'
          }
          {
            name: 'ActingProcessSHA1'
            type: 'string'
          }
          {
            name: 'ActingProcessSHA256'
            type: 'string'
          }
          {
            name: 'ActingProcessSHA512'
            type: 'string'
          }
          {
            name: 'ActingProcessIMPHASH'
            type: 'string'
          }
          {
            name: 'ActingProcessCreationTime'
            type: 'datetime'
          }
          {
            name: 'ActingProcessTokenElevation'
            type: 'string'
          }
          {
            name: 'ActingProcessFileSize'
            type: 'long'
          }
          {
            name: 'ParentProcessName'
            type: 'string'
          }
          {
            name: 'ParentProcessFileCompany'
            type: 'string'
          }
          {
            name: 'ParentProcessFileDescription'
            type: 'string'
          }
          {
            name: 'ParentProcessFileProduct'
            type: 'string'
          }
          {
            name: 'ParentProcessFileVersion'
            type: 'string'
          }
          {
            name: 'ParentProcessIsHidden'
            type: 'boolean'
          }
          {
            name: 'ParentProcessInjectedAddress'
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
            name: 'ParentProcessIntegrityLevel'
            type: 'string'
          }
          {
            name: 'ParentProcessMD5'
            type: 'string'
          }
          {
            name: 'ParentProcessSHA1'
            type: 'string'
          }
          {
            name: 'ParentProcessSHA256'
            type: 'string'
          }
          {
            name: 'ParentProcessSHA512'
            type: 'string'
          }
          {
            name: 'ParentProcessIMPHASH'
            type: 'string'
          }
          {
            name: 'ParentProcessCreationTime'
            type: 'datetime'
          }
          {
            name: 'ParentProcessTokenElevation'
            type: 'string'
          }
          {
            name: 'TargetProcessCommandLine'
            type: 'string'
          }
          {
            name: 'TargetProcessName'
            type: 'string'
          }
          {
            name: 'TargetProcessFileCompany'
            type: 'string'
          }
          {
            name: 'TargetProcessFileDescription'
            type: 'string'
          }
          {
            name: 'TargetProcessFileProduct'
            type: 'string'
          }
          {
            name: 'TargetProcessFileVersion'
            type: 'string'
          }
          {
            name: 'TargetProcessFileInternalName'
            type: 'string'
          }
          {
            name: 'TargetProcessFileOriginalName'
            type: 'string'
          }
          {
            name: 'TargetProcessFilename'
            type: 'string'
          }
          {
            name: 'TargetProcessIsHidden'
            type: 'boolean'
          }
          {
            name: 'TargetProcessInjectedAddress'
            type: 'string'
          }
          {
            name: 'TargetProcessId'
            type: 'string'
          }
          {
            name: 'TargetProcessGuid'
            type: 'string'
          }
          {
            name: 'TargetProcessIntegrityLevel'
            type: 'string'
          }
          {
            name: 'TargetProcessMD5'
            type: 'string'
          }
          {
            name: 'TargetProcessSHA1'
            type: 'string'
          }
          {
            name: 'TargetProcessSHA256'
            type: 'string'
          }
          {
            name: 'TargetProcessSHA512'
            type: 'string'
          }
          {
            name: 'TargetProcessIMPHASH'
            type: 'string'
          }
          {
            name: 'TargetProcessCreationTime'
            type: 'datetime'
          }
          {
            name: 'TargetProcessTokenElevation'
            type: 'string'
          }
          {
            name: 'TargetProcessFileSize'
            type: 'long'
          }
          {
            name: 'TargetProcessCurrentDirectory'
            type: 'string'
          }
          {
            name: 'TargetProcessStatusCode'
            type: 'string'
          }
        ]
      }
    }
    destinations: {
      logAnalytics: [
        {
          workspaceResourceId: workspaceResourceId
          name: 'Sentinel-ASimProcessEventLogs'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-ASimProcessEventLogs'
        ]
        destinations: [
          'Sentinel-ASimProcessEventLogs'
        ]
        transformKql: 'source | project TenantId= toguid(TenantId), TimeGenerated, EventType, SourceSystem, EventMessage, RuleName, EventCount, EventStartTime, EventEndTime, EventSubType, EventResult, EventResultDetails, EventOriginalUid, EventOriginalType, EventOriginalSubType, EventOriginalResultDetails, EventSeverity, EventOriginalSeverity, EventProduct, EventProductVersion, EventVendor, EventSchemaVersion, EventOwner, EventReportUrl, RuleNumber, ThreatId, ThreatName, ThreatCategory, ThreatRiskLevel, ThreatOriginalRiskLevel, ThreatConfidence, ActingProcessCommandLine, ThreatOriginalConfidence, ActingProcessName, ThreatIsActive, ActingProcessId, ThreatFirstReportedTime, ActingProcessGuid, ThreatLastReportedTime, ThreatField, DvcIpAddr, DvcHostname, DvcDomain, DvcDomainType, DvcFQDN, DvcDescription, DvcId, DvcIdType, DvcMacAddr, DvcZone, DvcOs, DvcOsVersion, DvcAction, DvcOriginalAction, DvcInterface, DvcScopeId, DvcScope, ActorUserId, AdditionalFields, ActorUserIdType, ActorScopeId, ActorScope, ActorUsername, ActorUsernameType, ActorUserType, ActorOriginalUserType, ActorSessionId, TargetUserId, TargetUserIdType, TargetUsername, TargetUsernameType, TargetUserType, TargetOriginalUserType, TargetScopeId, TargetScope, TargetUserSessionId, TargetUserSessionGuid, ActingProcessFileCompany, ActingProcessFileDescription, ActingProcessFileProduct, ActingProcessFileVersion, ActingProcessFileInternalName, ActingProcessFileOriginalName, ActingProcessFilename, ActingProcessIsHidden, ActingProcessInjectedAddress, ActingProcessIntegrityLevel, ActingProcessMD5, ActingProcessSHA1, ActingProcessSHA256, ActingProcessSHA512, ActingProcessIMPHASH, ActingProcessCreationTime, ActingProcessTokenElevation, ActingProcessFileSize, ParentProcessName, ParentProcessFileCompany, ParentProcessFileDescription, ParentProcessFileProduct, ParentProcessFileVersion, ParentProcessIsHidden, ParentProcessInjectedAddress, ParentProcessId, ParentProcessGuid, ParentProcessIntegrityLevel, ParentProcessMD5, ParentProcessSHA1, ParentProcessSHA256, ParentProcessSHA512, ParentProcessIMPHASH, ParentProcessCreationTime, ParentProcessTokenElevation, TargetProcessCommandLine, TargetProcessName, TargetProcessFileCompany, TargetProcessFileDescription, TargetProcessFileProduct, TargetProcessFileVersion, TargetProcessFileInternalName, TargetProcessFileOriginalName, TargetProcessFilename, TargetProcessIsHidden, TargetProcessInjectedAddress, TargetProcessId, TargetProcessGuid, TargetProcessIntegrityLevel, TargetProcessMD5, TargetProcessSHA1, TargetProcessSHA256, TargetProcessSHA512, TargetProcessIMPHASH, TargetProcessCreationTime, TargetProcessTokenElevation, TargetProcessFileSize, TargetProcessCurrentDirectory, TargetProcessStatusCode'
        outputStream: 'Microsoft-ASimProcessEventLogs'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId 
