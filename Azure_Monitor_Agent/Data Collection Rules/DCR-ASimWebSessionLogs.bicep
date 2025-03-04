@description('The location of the resources')
param location string 

@description('The name of the Data Collection Endpoint Id')
param dataCollectionEndpointId string

@description('The Log Analytics Workspace Id used for Sentinel')
param workspaceResourceId string



resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-ASimWebSessionLogs'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-ASimWebSessionLogs': {
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
            name: 'HttpVersion'
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
            name: 'DstDvcScope'
            type: 'string'
          }
          {
            name: 'NetworkProtocolVersion'
            type: 'string'
          }
          {
            name: 'NetworkProtocol'
            type: 'string'
          }
          {
            name: 'UrlCategory'
            type: 'string'
          }
          {
            name: 'Dvc'
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
            name: 'NetworkApplicationProtocol'
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
            name: 'NetworkDirection'
            type: 'string'
          }
          {
            name: 'DvcIpAddr'
            type: 'string'
          }
          {
            name: 'NetworkIcmpCode'
            type: 'int'
          }
          {
            name: 'DvcHostname'
            type: 'string'
          }
          {
            name: 'NetworkIcmpType'
            type: 'string'
          }
          {
            name: 'DvcDomain'
            type: 'string'
          }
          {
            name: 'NetworkConnectionHistory'
            type: 'string'
          }
          {
            name: 'DvcDomainType'
            type: 'string'
          }
          {
            name: 'DstBytes'
            type: 'long'
          }
          {
            name: 'DvcFQDN'
            type: 'string'
          }
          {
            name: 'SrcBytes'
            type: 'long'
          }
          {
            name: 'NetworkBytes'
            type: 'long'
          }
          {
            name: 'DvcId'
            type: 'string'
          }
          {
            name: 'DstPackets'
            type: 'long'
          }
          {
            name: 'DvcIdType'
            type: 'string'
          }
          {
            name: 'SrcPackets'
            type: 'long'
          }
          {
            name: 'NetworkPackets'
            type: 'long'
          }
          {
            name: 'NetworkSessionId'
            type: 'string'
          }
          {
            name: 'DvcAction'
            type: 'string'
          }
          {
            name: 'DstMacAddr'
            type: 'string'
          }
          {
            name: 'DvcOriginalAction'
            type: 'string'
          }
          {
            name: 'UrlOriginal'
            type: 'string'
          }
          {
            name: 'HttpRequestMethod'
            type: 'string'
          }
          {
            name: 'HttpContentType'
            type: 'string'
          }
          {
            name: 'HttpContentFormat'
            type: 'string'
          }
          {
            name: 'HttpReferrer'
            type: 'string'
          }
          {
            name: 'HttpRequestXff'
            type: 'string'
          }
          {
            name: 'HttpRequestTime'
            type: 'int'
          }
          {
            name: 'HttpResponseTime'
            type: 'int'
          }
          {
            name: 'FileMD5'
            type: 'string'
          }
          {
            name: 'FileSHA1'
            type: 'string'
          }
          {
            name: 'FileSHA256'
            type: 'string'
          }
          {
            name: 'FileSHA512'
            type: 'string'
          }
          {
            name: 'FileContentType'
            type: 'string'
          }
          {
            name: 'Rule'
            type: 'string'
          }
          {
            name: 'HttpHost'
            type: 'string'
          }
          {
            name: 'HttpUserAgent'
            type: 'string'
          }
          {
            name: 'Url'
            type: 'string'
          }
          {
            name: 'FileName'
            type: 'string'
          }
          {
            name: 'FileSize'
            type: 'int'
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
            name: 'SrcMacAddr'
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
          {
            name: 'DstUserId'
            type: 'string'
          }
          {
            name: 'DstUserIdType'
            type: 'string'
          }
          {
            name: 'DstUsername'
            type: 'string'
          }
          {
            name: 'DstUsernameType'
            type: 'string'
          }
          {
            name: 'DstUserType'
            type: 'string'
          }
          {
            name: 'DstOriginalUserType'
            type: 'string'
          }
          {
            name: 'DstAppName'
            type: 'string'
          }
          {
            name: 'DstAppId'
            type: 'string'
          }
          {
            name: 'DstAppType'
            type: 'string'
          }
          {
            name: 'SrcAppName'
            type: 'string'
          }
          {
            name: 'SrcAppId'
            type: 'string'
          }
          {
            name: 'SrcAppType'
            type: 'string'
          }
          {
            name: 'DstNatIpAddr'
            type: 'string'
          }
          {
            name: 'DstNatPortNumber'
            type: 'int'
          }
          {
            name: 'SrcNatIpAddr'
            type: 'string'
          }
          {
            name: 'SrcNatPortNumber'
            type: 'int'
          }
          {
            name: 'NetworkDuration'
            type: 'int'
          }
        ]
      }
    }
    destinations: {
      logAnalytics: [
        {
          workspaceResourceId: workspaceResourceId
          name: 'Sentinel-ASimWebSessionLogs'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-ASimWebSessionLogs'
        ]
        destinations: [
          'Sentinel-ASimWebSessionLogs'
        ]
        transformKql: 'source | project TenantId= toguid(TenantId), TimeGenerated, EventType, SourceSystem, EventMessage, HttpVersion, RuleName, DstGeoRegion, DstGeoCity, DstGeoLatitude, DstGeoLongitude, DstDvcScope, NetworkProtocolVersion, NetworkProtocol, UrlCategory, Dvc, SrcProcessName, SrcProcessId, SrcProcessGuid, DstPortNumber, DstHostname, DstDomain, DstDomainType, DstFQDN, DstDvcId, DstDvcScopeId, DstDvcIdType, DstDeviceType, EventCount, EventStartTime, EventEndTime, EventSubType, EventResult, EventResultDetails, EventOriginalUid, EventOriginalType, EventOriginalSubType, EventOriginalResultDetails, EventSeverity, EventOriginalSeverity, EventProduct, EventProductVersion, EventVendor, EventSchemaVersion, EventOwner, EventReportUrl, RuleNumber, ThreatId, ThreatName, ThreatCategory, ThreatRiskLevel, ThreatOriginalRiskLevel, ThreatConfidence, ThreatOriginalConfidence, ThreatIsActive, ThreatFirstReportedTime, ThreatLastReportedTime, NetworkApplicationProtocol, ThreatField, ThreatIpAddr, NetworkDirection, DvcIpAddr, NetworkIcmpCode, DvcHostname, NetworkIcmpType, DvcDomain, NetworkConnectionHistory, DvcDomainType, DstBytes, DvcFQDN, SrcBytes, NetworkBytes, DvcId, DstPackets, DvcIdType, SrcPackets, NetworkPackets, NetworkSessionId, DvcAction, DstMacAddr, DvcOriginalAction, UrlOriginal, HttpRequestMethod, HttpContentType, HttpContentFormat, HttpReferrer, HttpRequestXff, HttpRequestTime, HttpResponseTime, FileMD5, FileSHA1, FileSHA256, FileSHA512, FileContentType, Rule, HttpHost, HttpUserAgent, Url, FileName, FileSize, AdditionalFields, SrcIpAddr, SrcPortNumber, SrcHostname, SrcDomain, SrcDomainType, SrcFQDN, SrcDvcId, SrcDvcIdType, SrcDvcScopeId, SrcDvcScope, SrcDeviceType, SrcGeoCountry, SrcGeoLatitude= todouble(SrcGeoLatitude), SrcGeoLongitude= todouble(SrcGeoLongitude), SrcGeoRegion, SrcGeoCity, SrcMacAddr, SrcOriginalUserType, SrcUserId, SrcUserIdType, SrcUsername, SrcUsernameType, SrcUserScope, SrcUserScopeId, SrcUserType, DstIpAddr, DstGeoCountry, DstUserId, DstUserIdType, DstUsername, DstUsernameType, DstUserType, DstOriginalUserType, DstAppName, DstAppId, DstAppType, SrcAppName, SrcAppId, SrcAppType, DstNatIpAddr, DstNatPortNumber, SrcNatIpAddr, SrcNatPortNumber, NetworkDuration'
        outputStream: 'Microsoft-ASimWebSessionLogs'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId 
