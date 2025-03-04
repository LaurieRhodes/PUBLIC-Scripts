@description('The location of the resources')
param location string 

@description('The name of the Data Collection Endpoint Id')
param dataCollectionEndpointId string

@description('The Log Analytics Workspace Id used for Sentinel')
param workspaceResourceId string



resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-ASimUserManagementActivityLogs'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-ASimUserManagementActivityLogs': {
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
            name: 'ThreatOriginalConfidence'
            type: 'string'
          }
          {
            name: 'ThreatIsActive'
            type: 'boolean'
          }
          {
            name: 'ThreatFirstReportedTime'
            type: 'datetime'
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
            name: 'TargetUserUid'
            type: 'string'
          }
          {
            name: 'GroupId'
            type: 'string'
          }
          {
            name: 'GroupIdType'
            type: 'string'
          }
          {
            name: 'GroupName'
            type: 'string'
          }
          {
            name: 'GroupNameType'
            type: 'string'
          }
          {
            name: 'GroupType'
            type: 'string'
          }
          {
            name: 'GroupOriginalType'
            type: 'string'
          }
          {
            name: 'PreviousPropertyValue'
            type: 'string'
          }
          {
            name: 'NewPropertyValue'
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
            name: 'ActingAppId'
            type: 'string'
          }
          {
            name: 'ActingAppName'
            type: 'string'
          }
          {
            name: 'ActingAppType'
            type: 'string'
          }
          {
            name: 'ActingOriginalAppType'
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
            name: 'TargetUserId'
            type: 'string'
          }
          {
            name: 'TargetUserIdType'
            type: 'string'
          }
          {
            name: 'TargetUserScopeId'
            type: 'string'
          }
          {
            name: 'TargetUserScope'
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
            name: 'SrcMacAddr'
            type: 'string'
          }
          {
            name: 'EventSchema'
            type: 'string'
          }
          {
            name: 'TargetUserSessionId'
            type: 'string'
          }
        ]
      }
    }
    destinations: {
      logAnalytics: [
        {
          workspaceResourceId: workspaceResourceId
          name: 'Sentinel-ASimUserManagementActivityLogs'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-ASimUserManagementActivityLogs'
        ]
        destinations: [
          'Sentinel-ASimUserManagementActivityLogs'
        ]
        transformKql: 'source | project TenantId= toguid(TenantId), TimeGenerated, EventType, SourceSystem, EventMessage, RuleName, EventCount, EventStartTime, EventEndTime, EventSubType, EventResult, EventResultDetails, EventOriginalUid, EventOriginalType, EventOriginalSubType, EventOriginalResultDetails, EventSeverity, EventOriginalSeverity, EventProduct, EventProductVersion, EventVendor, EventSchemaVersion, EventOwner, EventReportUrl, RuleNumber, ThreatId, ThreatName, ThreatCategory, ThreatRiskLevel, ThreatOriginalRiskLevel, ThreatConfidence, ThreatOriginalConfidence, ThreatIsActive, ThreatFirstReportedTime, ThreatLastReportedTime, ThreatField, DvcIpAddr, DvcHostname, DvcDomain, DvcDomainType, DvcFQDN, DvcDescription, DvcId, DvcIdType, DvcMacAddr, DvcZone, DvcOs, DvcOsVersion, DvcAction, DvcOriginalAction, DvcInterface, DvcScopeId, DvcScope, ActorUserId, ActorUserAadId, TargetUserUid, GroupId, GroupIdType, GroupName, GroupNameType, GroupType, GroupOriginalType, PreviousPropertyValue, NewPropertyValue, HttpUserAgent, AdditionalFields, ActorUserSid, ActorUserIdType, ActorScopeId, ActorScope, ActorUsername, ActorUsernameType, ActorUserType, ActorOriginalUserType, ActorSessionId, ActingAppId, ActingAppName, ActingAppType, ActingOriginalAppType, SrcIpAddr, SrcPortNumber, SrcHostname, SrcDomain, SrcDomainType, SrcFQDN, SrcDescription, SrcDvcId, SrcDvcIdType, SrcDvcScopeId, SrcDvcScope, SrcDeviceType, SrcGeoCountry, SrcGeoLatitude= todouble(SrcGeoLatitude), SrcGeoLongitude= todouble(SrcGeoLongitude), SrcGeoRegion, SrcGeoCity, SrcRiskLevel, SrcOriginalRiskLevel, TargetUserId, TargetUserIdType, TargetUserScopeId, TargetUserScope, TargetUsername, TargetUsernameType, TargetUserType, TargetOriginalUserType, SrcMacAddr, EventSchema, TargetUserSessionId```'
        outputStream: 'Microsoft-ASimUserManagementActivityLogs'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId 
