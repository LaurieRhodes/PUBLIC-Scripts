@description('The location of the resources')
param location string 

@description('The name of the Data Collection Endpoint Id')
param dataCollectionEndpointId string

@description('The Log Analytics Workspace Id used for Sentinel')
param workspaceResourceId string



resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-ASimFileEventLogs'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-ASimFileEventLogs': {
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
            name: 'TargetFilePath'
            type: 'string'
          }
          {
            name: 'EventSubType'
            type: 'string'
          }
          {
            name: 'TargetFilePathType'
            type: 'string'
          }
          {
            name: 'EventResult'
            type: 'string'
          }
          {
            name: 'TargetFileName'
            type: 'string'
          }
          {
            name: 'EventResultDetails'
            type: 'string'
          }
          {
            name: 'HashType'
            type: 'string'
          }
          {
            name: 'EventOriginalUid'
            type: 'string'
          }
          {
            name: 'SrcFileName'
            type: 'string'
          }
          {
            name: 'EventOriginalType'
            type: 'string'
          }
          {
            name: 'SrcFilePath'
            type: 'string'
          }
          {
            name: 'SrcFilePathType'
            type: 'string'
          }
          {
            name: 'EventOriginalSubType'
            type: 'string'
          }
          {
            name: 'TargetFileCreationTime'
            type: 'datetime'
          }
          {
            name: 'EventOriginalResultDetails'
            type: 'string'
          }
          {
            name: 'TargetFileDirectory'
            type: 'string'
          }
          {
            name: 'EventSeverity'
            type: 'string'
          }
          {
            name: 'TargetFileExtension'
            type: 'string'
          }
          {
            name: 'EventOriginalSeverity'
            type: 'string'
          }
          {
            name: 'TargetFileMimeType'
            type: 'string'
          }
          {
            name: 'TargetFileMD5'
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
            name: 'TargetFileSHA1'
            type: 'string'
          }
          {
            name: 'TargetFileSHA256'
            type: 'string'
          }
          {
            name: 'EventVendor'
            type: 'string'
          }
          {
            name: 'TargetFileSHA512'
            type: 'string'
          }
          {
            name: 'EventSchemaVersion'
            type: 'string'
          }
          {
            name: 'TargetFileSize'
            type: 'long'
          }
          {
            name: 'EventOwner'
            type: 'string'
          }
          {
            name: 'SrcFileCreationTime'
            type: 'datetime'
          }
          {
            name: 'EventReportUrl'
            type: 'string'
          }
          {
            name: 'SrcFileDirectory'
            type: 'string'
          }
          {
            name: 'RuleNumber'
            type: 'int'
          }
          {
            name: 'SrcFileExtension'
            type: 'string'
          }
          {
            name: 'ThreatId'
            type: 'string'
          }
          {
            name: 'SrcFileMimeType'
            type: 'string'
          }
          {
            name: 'ThreatName'
            type: 'string'
          }
          {
            name: 'SrcFileMD5'
            type: 'string'
          }
          {
            name: 'SrcFileSHA1'
            type: 'string'
          }
          {
            name: 'ThreatCategory'
            type: 'string'
          }
          {
            name: 'SrcFileSHA256'
            type: 'string'
          }
          {
            name: 'ThreatRiskLevel'
            type: 'int'
          }
          {
            name: 'SrcFileSHA512'
            type: 'string'
          }
          {
            name: 'ThreatOriginalRiskLevel'
            type: 'string'
          }
          {
            name: 'SrcFileSize'
            type: 'long'
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
            name: 'NetworkApplicationProtocol'
            type: 'string'
          }
          {
            name: 'ThreatField'
            type: 'string'
          }
          {
            name: 'ThreatFilePath'
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
            name: 'HttpUserAgent'
            type: 'string'
          }
          {
            name: 'AdditionalFields'
            type: 'dynamic'
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
            name: 'TargetAppId'
            type: 'string'
          }
          {
            name: 'TargetAppName'
            type: 'string'
          }
          {
            name: 'TargetAppType'
            type: 'string'
          }
          {
            name: 'TargetOriginalAppType'
            type: 'string'
          }
          {
            name: 'TargetUrl'
            type: 'string'
          }
          {
            name: 'SrcIpAddr'
            type: 'string'
          }
          {
            name: 'SrcPortNumber'
            type: 'int'
          }
          {
            name: 'SrcHostname'
            type: 'string'
          }
          {
            name: 'SrcDomain'
            type: 'string'
          }
          {
            name: 'SrcDomainType'
            type: 'string'
          }
          {
            name: 'SrcFQDN'
            type: 'string'
          }
          {
            name: 'SrcDescription'
            type: 'string'
          }
          {
            name: 'SrcDvcId'
            type: 'string'
          }
          {
            name: 'SrcDvcIdType'
            type: 'string'
          }
          {
            name: 'SrcDvcScopeId'
            type: 'string'
          }
          {
            name: 'SrcDvcScope'
            type: 'string'
          }
          {
            name: 'SrcDeviceType'
            type: 'string'
          }
          {
            name: 'SrcGeoCountry'
            type: 'string'
          }
          {
            name: 'SrcGeoLatitude'
            type: 'string'
          }
          {
            name: 'SrcGeoLongitude'
            type: 'string'
          }
          {
            name: 'SrcGeoRegion'
            type: 'string'
          }
          {
            name: 'SrcGeoCity'
            type: 'string'
          }
          {
            name: 'SrcRiskLevel'
            type: 'int'
          }
          {
            name: 'SrcOriginalRiskLevel'
            type: 'string'
          }
          {
            name: 'SrcMacAddr'
            type: 'string'
          }
          {
            name: 'EventSchema'
            type: 'string'
          }
        ]
      }
    }
    destinations: {
      logAnalytics: [
        {
          workspaceResourceId: workspaceResourceId
          name: 'Sentinel-ASimFileEventLogs'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-ASimFileEventLogs'
        ]
        destinations: [
          'Sentinel-ASimFileEventLogs'
        ]
        transformKql: 'source | project TenantId= toguid(TenantId), TimeGenerated, EventType, SourceSystem, EventMessage, RuleName, EventCount, EventStartTime, EventEndTime, TargetFilePath, EventSubType, TargetFilePathType, EventResult, TargetFileName, EventResultDetails, HashType, EventOriginalUid, SrcFileName, EventOriginalType, SrcFilePath, SrcFilePathType, EventOriginalSubType, TargetFileCreationTime, EventOriginalResultDetails, TargetFileDirectory, EventSeverity, TargetFileExtension, EventOriginalSeverity, TargetFileMimeType, TargetFileMD5, EventProduct, EventProductVersion, TargetFileSHA1, TargetFileSHA256, EventVendor, TargetFileSHA512, EventSchemaVersion, TargetFileSize, EventOwner, SrcFileCreationTime, EventReportUrl, SrcFileDirectory, RuleNumber, SrcFileExtension, ThreatId, SrcFileMimeType, ThreatName, SrcFileMD5, SrcFileSHA1, ThreatCategory, SrcFileSHA256, ThreatRiskLevel, SrcFileSHA512, ThreatOriginalRiskLevel, SrcFileSize= tolong(SrcFileSize), ThreatConfidence, ActingProcessCommandLine, ThreatOriginalConfidence, ActingProcessName, ThreatIsActive, ActingProcessId, ThreatFirstReportedTime, ActingProcessGuid, ThreatLastReportedTime, NetworkApplicationProtocol, ThreatField, ThreatFilePath, DvcIpAddr, DvcHostname, DvcDomain, DvcDomainType, DvcFQDN, DvcDescription, DvcId, DvcIdType, DvcMacAddr, DvcZone, DvcOs, DvcOsVersion, DvcAction, DvcOriginalAction, DvcInterface, DvcScopeId, DvcScope, ActorUserId, ActorUserAadId, HttpUserAgent, AdditionalFields, ActorUserSid, ActorUserIdType, ActorScopeId, ActorScope, ActorUsername, ActorUsernameType, ActorUserType, ActorOriginalUserType, ActorSessionId, TargetAppId, TargetAppName, TargetAppType, TargetOriginalAppType, TargetUrl, SrcIpAddr, SrcPortNumber, SrcHostname, SrcDomain, SrcDomainType, SrcFQDN, SrcDescription, SrcDvcId, SrcDvcIdType, SrcDvcScopeId, SrcDvcScope, SrcDeviceType, SrcGeoCountry, SrcGeoLatitude= todouble(SrcGeoLatitude), SrcGeoLongitude= todouble(SrcGeoLongitude), SrcGeoRegion, SrcGeoCity, SrcRiskLevel, SrcOriginalRiskLevel, SrcMacAddr, EventSchema'
        outputStream: 'Microsoft-ASimFileEventLogs'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId 
