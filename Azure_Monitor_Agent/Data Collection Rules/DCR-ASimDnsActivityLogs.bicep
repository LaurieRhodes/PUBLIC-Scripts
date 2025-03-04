@description('The location of the resources')
param location string 

@description('The name of the Data Collection Endpoint Id')
param dataCollectionEndpointId string

@description('The Log Analytics Workspace Id used for Sentinel')
param workspaceResourceId string



resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-ASimDnsActivityLogs'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-ASimDnsActivityLogs': {
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
            name: 'DstGeoRegion'
            type: 'string'
          }
          {
            name: 'DstGeoCity'
            type: 'string'
          }
          {
            name: 'DstGeoLatitude'
            type: 'real'
          }
          {
            name: 'DstGeoLongitude'
            type: 'real'
          }
          {
            name: 'DnsQuery'
            type: 'string'
          }
          {
            name: 'DnsQueryType'
            type: 'int'
          }
          {
            name: 'DnsQueryTypeName'
            type: 'string'
          }
          {
            name: 'DnsResponseCode'
            type: 'int'
          }
          {
            name: 'DnsResponseName'
            type: 'string'
          }
          {
            name: 'TransactionIdHex'
            type: 'string'
          }
          {
            name: 'DstDescription'
            type: 'string'
          }
          {
            name: 'DstDvcScope'
            type: 'string'
          }
          {
            name: 'DstOriginalRiskLevel'
            type: 'string'
          }
          {
            name: 'DstRiskLevel'
            type: 'int'
          }
          {
            name: 'NetworkProtocolVersion'
            type: 'string'
          }
          {
            name: 'DnsResponseIpCountry'
            type: 'string'
          }
          {
            name: 'DnsResponseIpLatitude'
            type: 'real'
          }
          {
            name: 'DnsResponseIpLongitude'
            type: 'real'
          }
          {
            name: 'NetworkProtocol'
            type: 'string'
          }
          {
            name: 'DnsQueryClass'
            type: 'int'
          }
          {
            name: 'DnsQueryClassName'
            type: 'string'
          }
          {
            name: 'DnsNetworkDuration'
            type: 'int'
          }
          {
            name: 'DnsFlagsAuthenticated'
            type: 'boolean'
          }
          {
            name: 'DnsFlagsAuthoritative'
            type: 'boolean'
          }
          {
            name: 'DnsFlagsRecursionDesired'
            type: 'boolean'
          }
          {
            name: 'DnsSessionId'
            type: 'string'
          }
          {
            name: 'UrlCategory'
            type: 'string'
          }
          {
            name: 'ThreatOriginalRiskLevel_s'
            type: 'string'
          }
          {
            name: 'ThreatFirstReportedTime_d'
            type: 'datetime'
          }
          {
            name: 'ThreatLastReportedTime_d'
            type: 'datetime'
          }
          {
            name: 'Dvc'
            type: 'string'
          }
          {
            name: 'DnsResponseIpCity'
            type: 'string'
          }
          {
            name: 'DnsResponseIpRegion'
            type: 'string'
          }
          {
            name: 'Src'
            type: 'string'
          }
          {
            name: 'SrcProcessName'
            type: 'string'
          }
          {
            name: 'SrcProcessId'
            type: 'string'
          }
          {
            name: 'SrcProcessGuid'
            type: 'string'
          }
          {
            name: 'Dst'
            type: 'string'
          }
          {
            name: 'DstPortNumber'
            type: 'int'
          }
          {
            name: 'DstHostname'
            type: 'string'
          }
          {
            name: 'DstDomain'
            type: 'string'
          }
          {
            name: 'DstDomainType'
            type: 'string'
          }
          {
            name: 'DstFQDN'
            type: 'string'
          }
          {
            name: 'DstDvcId'
            type: 'string'
          }
          {
            name: 'DstDvcScopeId'
            type: 'string'
          }
          {
            name: 'DstDvcIdType'
            type: 'string'
          }
          {
            name: 'DstDeviceType'
            type: 'string'
          }
          {
            name: 'DnsFlags'
            type: 'string'
          }
          {
            name: 'DnsFlagsCheckingDisabled'
            type: 'boolean'
          }
          {
            name: 'EventCount'
            type: 'int'
          }
          {
            name: 'DnsFlagsRecursionAvailable'
            type: 'boolean'
          }
          {
            name: 'EventStartTime'
            type: 'datetime'
          }
          {
            name: 'DnsFlagsTruncated'
            type: 'boolean'
          }
          {
            name: 'EventEndTime'
            type: 'datetime'
          }
          {
            name: 'DnsFlagsZ'
            type: 'boolean'
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
            type: 'int'
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
            type: 'string'
          }
          {
            name: 'ThreatLastReportedTime'
            type: 'string'
          }
          {
            name: 'ThreatField'
            type: 'string'
          }
          {
            name: 'ThreatIpAddr'
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
            name: 'AdditionalFields'
            type: 'dynamic'
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
            name: 'SrcOriginalUserType'
            type: 'string'
          }
          {
            name: 'SrcUserId'
            type: 'string'
          }
          {
            name: 'SrcUserIdType'
            type: 'string'
          }
          {
            name: 'SrcUsername'
            type: 'string'
          }
          {
            name: 'SrcUsernameType'
            type: 'string'
          }
          {
            name: 'SrcUserScope'
            type: 'string'
          }
          {
            name: 'SrcUserScopeId'
            type: 'string'
          }
          {
            name: 'SrcUserSessionId'
            type: 'string'
          }
          {
            name: 'SrcUserType'
            type: 'string'
          }
          {
            name: 'DstIpAddr'
            type: 'string'
          }
          {
            name: 'DstGeoCountry'
            type: 'string'
          }
        ]
      }
    }
    destinations: {
      logAnalytics: [
        {
          workspaceResourceId: workspaceResourceId
          name: 'Sentinel-ASimDnsActivityLogs'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-ASimDnsActivityLogs'
        ]
        destinations: [
          'Sentinel-ASimDnsActivityLogs'
        ]
        transformKql: 'source | project TenantId= toguid(TenantId), TimeGenerated, EventType, SourceSystem, EventMessage, RuleName, DstGeoRegion, DstGeoCity, DstGeoLatitude, DstGeoLongitude, DnsQuery, DnsQueryType, DnsQueryTypeName, DnsResponseCode, DnsResponseName, TransactionIdHex, DstDescription, DstDvcScope, DstOriginalRiskLevel, DstRiskLevel, NetworkProtocolVersion, DnsResponseIpCountry, DnsResponseIpLatitude, DnsResponseIpLongitude, NetworkProtocol, DnsQueryClass, DnsQueryClassName, DnsNetworkDuration, DnsFlagsAuthenticated, DnsFlagsAuthoritative, DnsFlagsRecursionDesired, DnsSessionId, UrlCategory, ThreatOriginalRiskLevel_s, ThreatFirstReportedTime_d, ThreatLastReportedTime_d, Dvc, DnsResponseIpCity, DnsResponseIpRegion, Src, SrcProcessName, SrcProcessId, SrcProcessGuid, Dst, DstPortNumber, DstHostname, DstDomain, DstDomainType, DstFQDN, DstDvcId, DstDvcScopeId, DstDvcIdType, DstDeviceType, DnsFlags, DnsFlagsCheckingDisabled, EventCount, DnsFlagsRecursionAvailable, EventStartTime, DnsFlagsTruncated, EventEndTime, DnsFlagsZ, EventSubType, EventResult, EventResultDetails, EventOriginalUid, EventOriginalType, EventSeverity, EventOriginalSeverity, EventProduct, EventProductVersion, EventVendor, EventSchemaVersion, EventOwner, EventReportUrl, RuleNumber, ThreatId, ThreatName, ThreatCategory, ThreatRiskLevel, ThreatOriginalRiskLevel, ThreatConfidence, ThreatOriginalConfidence, ThreatIsActive, ThreatFirstReportedTime, ThreatLastReportedTime, ThreatField, ThreatIpAddr, DvcIpAddr, DvcHostname, DvcDomain, DvcDomainType, DvcFQDN, DvcDescription, DvcId, DvcIdType, DvcMacAddr, DvcZone, DvcOs, DvcOsVersion, DvcAction, DvcOriginalAction, DvcInterface, DvcScopeId, DvcScope, AdditionalFields, SrcIpAddr, SrcPortNumber, SrcHostname, SrcDomain, SrcDomainType, SrcFQDN, SrcDescription, SrcDvcId, SrcDvcIdType, SrcDvcScopeId, SrcDvcScope, SrcDeviceType, SrcGeoCountry, SrcGeoLatitude= todouble(SrcGeoLatitude), SrcGeoLongitude= todouble(SrcGeoLongitude), SrcGeoRegion, SrcGeoCity, SrcRiskLevel, SrcOriginalRiskLevel, SrcOriginalUserType, SrcUserId, SrcUserIdType, SrcUsername, SrcUsernameType, SrcUserScope, SrcUserScopeId, SrcUserSessionId, SrcUserType, DstIpAddr, DstGeoCountry'
        outputStream: 'Microsoft-ASimDnsActivityLogs'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId 
