param location string
param workspaceResourceId string
param dataCollectionEndpointId string

resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-ASimNetworkSessionLogs'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-ASimNetworkSessionLogs': {
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
            name: 'EventCount'
            type: 'int'
          }
          {
            name: 'EventSchemaVersion'
            type: 'string'
          }
          {
            name: 'DvcAction'
            type: 'string'
          }
          {
            name: 'EventMessage'
            type: 'string'
          }
          {
            name: 'EventSeverity'
            type: 'string'
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
            name: 'DvcMacAddr'
            type: 'string'
          }
          {
            name: 'Dvc'
            type: 'string'
          }
          {
            name: 'DvcZone'
            type: 'string'
          }
          {
            name: 'EventProductVersion'
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
            name: 'DvcSubscriptionId'
            type: 'string'
          }
          {
            name: 'EventOriginalSeverity'
            type: 'string'
          }
          {
            name: 'EventOriginalSubType'
            type: 'string'
          }
          {
            name: 'NetworkApplicationProtocol'
            type: 'string'
          }
          {
            name: 'NetworkProtocolVersion'
            type: 'string'
          }
          {
            name: 'NetworkDirection'
            type: 'string'
          }
          {
            name: 'NetworkIcmpCode'
            type: 'int'
          }
          {
            name: 'NetworkIcmpType'
            type: 'string'
          }
          {
            name: 'NetworkConnectionHistory'
            type: 'string'
          }
          {
            name: 'DstBytes'
            type: 'long'
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
            name: 'DstPackets'
            type: 'long'
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
            name: 'DstZone'
            type: 'string'
          }
          {
            name: 'DstInterfaceName'
            type: 'string'
          }
          {
            name: 'DstInterfaceGuid'
            type: 'string'
          }
          {
            name: 'DstMacAddr'
            type: 'string'
          }
          {
            name: 'DstVlanId'
            type: 'string'
          }
          {
            name: 'DstSubscriptionId'
            type: 'string'
          }
          {
            name: 'DstGeoCountry'
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
            name: 'SrcZone'
            type: 'string'
          }
          {
            name: 'SrcInterfaceName'
            type: 'string'
          }
          {
            name: 'SrcInterfaceGuid'
            type: 'string'
          }
          {
            name: 'SrcMacAddr'
            type: 'string'
          }
          {
            name: 'SrcVlanId'
            type: 'string'
          }
          {
            name: 'SrcSubscriptionId'
            type: 'string'
          }
          {
            name: 'SrcGeoCountry'
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
            name: 'SrcGeoLatitude'
            type: 'real'
          }
          {
            name: 'SrcGeoLongitude'
            type: 'real'
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
            name: 'DvcInboundInterface'
            type: 'string'
          }
          {
            name: 'DvcOutboundInterface'
            type: 'string'
          }          
          {
            name: 'NetworkRuleName'
            type: 'string'
          }
          {
            name: 'NetworkRuleNumber'
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
            name: 'EventType'
            type: 'string'
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
            name: 'EventOriginalType'
            type: 'string'
          }
          {
            name: 'EventProduct'
            type: 'string'
          }
          {
            name: 'EventVendor'
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
            name: 'DvcOs'
            type: 'string'
          }
          {
            name: 'DvcOsVersion'
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
            name: 'DstIpAddr'
            type: 'string'
          }
          {
            name: 'NetworkProtocol'
            type: 'string'
          }
          {
            name: 'EventOriginalUid'
            type: 'string'
          }
          {
            name: 'EventReportUrl'
            type: 'string'
          }
          {
            name: 'DvcFQDN'
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
            name: 'ThreatIpAddr'
            type: 'string'
          }
          {
            name: 'SrcDeviceType'
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
            name: 'SrcUserType'
            type: 'string'
          }
          {
            name: 'SrcOriginalUserType'
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
            name: 'DstDvcIdType'
            type: 'string'
          }
          {
            name: 'DstDeviceType'
            type: 'string'
          }
          {
            name: 'TcpFlagsAck'
            type: 'boolean'
          }
          {
            name: 'TcpFlagsFin'
            type: 'boolean'
          }
          {
            name: 'TcpFlagsPsh'
            type: 'boolean'
          }
          {
            name: 'TcpFlagsRst'
            type: 'boolean'
          }
          {
            name: 'TcpFlagsUrg'
            type: 'boolean'
          }
          {
            name: 'TcpFlagsSyn'
            type: 'boolean'
          }
          {
            name: 'ThreatField'
            type: 'string'
          }
          {
            name: 'ThreatIsActive'
            type: 'boolean'
          }
          {
            name: 'ThreatConfidence'
            type: 'int'
          }
          {
            name: 'NetworkDuration'
            type: 'int'
          }
          {
            name: 'DvcDescription'
            type: 'string'
          }
          {
            name: 'EventOriginalResultDetails'
            type: 'string'
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
            name: 'ThreatOriginalConfidence'
            type: 'string'
          }
          {
            name: 'DstDescription'
            type: 'string'
          }
          {
            name: 'SrcDescription'
            type: 'string'
          }
          {
            name: 'SourceSystem'
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
          name: 'Sentinel-ASimNetworkSessionLogs'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-ASimNetworkSessionLogs'
        ]
        destinations: [
          'Sentinel-ASimNetworkSessionLogs'
        ]
        transformKql: 'source | project TenantId = toguid(TenantId), TimeGenerated, EventCount, EventSchemaVersion, DvcAction, EventMessage, EventSeverity, EventStartTime, EventEndTime, DvcMacAddr, Dvc, DvcZone, EventProductVersion, DvcOriginalAction, DvcInterface, DvcSubscriptionId, EventOriginalSeverity, EventOriginalSubType, NetworkApplicationProtocol, NetworkProtocolVersion, NetworkDirection, NetworkIcmpCode, NetworkIcmpType, NetworkConnectionHistory, DstBytes, SrcBytes, NetworkBytes, DstPackets, SrcPackets, NetworkPackets, NetworkSessionId, DstZone, DstInterfaceName, DstInterfaceGuid, DstMacAddr, DstVlanId, DstSubscriptionId, DstGeoCountry, DstGeoRegion, DstGeoCity, DstGeoLatitude, DstGeoLongitude, DstUserId, DstUserIdType, DstUsername, DstUsernameType, DstUserType, DstOriginalUserType, DstAppName, DstAppId, DstAppType, SrcZone, SrcInterfaceName, SrcInterfaceGuid, SrcMacAddr, SrcVlanId, SrcSubscriptionId, SrcGeoCountry, SrcGeoRegion, SrcGeoCity, SrcGeoLatitude, SrcGeoLongitude, SrcAppName, SrcAppId, SrcAppType, DstNatIpAddr, DstNatPortNumber, SrcNatIpAddr, SrcNatPortNumber, DvcInboundInterface, DvcOutboundInterface, NetworkRuleName, NetworkRuleNumber, ThreatId, ThreatName, ThreatCategory, ThreatRiskLevel, ThreatOriginalRiskLevel, EventType, EventSubType, EventResult, EventResultDetails, EventOriginalType, EventProduct, EventVendor, DvcIpAddr, DvcHostname, DvcDomain, DvcDomainType, DvcOs, DvcOsVersion, AdditionalFields, SrcIpAddr, SrcPortNumber, DstIpAddr, NetworkProtocol, EventOriginalUid, EventReportUrl, DvcFQDN, DvcId, DvcIdType, SrcHostname, SrcDomain, SrcDomainType, SrcFQDN, SrcDvcId, SrcDvcIdType, ThreatIpAddr, SrcDeviceType, SrcUserId, SrcUserIdType, SrcUsername, SrcUsernameType, SrcUserType, SrcOriginalUserType, DstPortNumber, DstHostname, DstDomain, DstDomainType, DstFQDN, DstDvcId, DstDvcIdType, DstDeviceType, TcpFlagsAck, TcpFlagsFin, TcpFlagsPsh, TcpFlagsRst, TcpFlagsUrg, TcpFlagsSyn, ThreatField, ThreatIsActive, ThreatConfidence, NetworkDuration, DvcDescription,     EventOriginalResultDetails, ThreatFirstReportedTime,     ThreatLastReportedTime, ThreatOriginalConfidence, DstDescription, SrcDescription, SourceSystem, Type'
        outputStream: 'Microsoft-ASimNetworkSessionLogs'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId
