param location string
param workspaceResourceId string
param dataCollectionEndpointId string

resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-OktaV2'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-OktaV2_CL': {
        columns: [
          {
            name: 'ActingAppName'
            type: 'string'
          }
          {
            name: 'ActingAppType'
            type: 'string'
          }
          {
            name: 'ActorDetailEntry'
            type: 'dynamic'
          }
          {
            name: 'ActorDisplayName'
            type: 'string'
          }
          {
            name: 'ActorSessionId'
            type: 'string'
          }
          {
            name: 'ActorUserId'
            type: 'string'
          }
          {
            name: 'ActorUserIdType'
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
            name: 'AuthenticationContextAuthenticationProvider'
            type: 'string'
          }
          {
            name: 'AuthenticationContextAuthenticationStep'
            type: 'int'
          }
          {
            name: 'AuthenticationContextCredentialProvider'
            type: 'string'
          }
          {
            name: 'AuthenticationContextInterface'
            type: 'string'
          }
          {
            name: 'AuthenticationContextIssuerId'
            type: 'string'
          }
          {
            name: 'AuthenticationContextIssuerType'
            type: 'string'
          }
          {
            name: 'DebugData'
            type: 'dynamic'
          }
          {
            name: 'DomainName'
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
            name: 'EventOriginalResultDetails'
            type: 'string'
          }
          {
            name: 'EventOriginalType'
            type: 'string'
          }
          {
            name: 'EventOriginalUid'
            type: 'string'
          }
          {
            name: 'EventResult'
            type: 'string'
          }
          {
            name: 'EventSeverity'
            type: 'string'
          }
          {
            name: 'HttpUserAgent'
            type: 'string'
          }
          {
            name: 'LegacyEventType'
            type: 'string'
          }
          {
            name: 'LogonMethod'
            type: 'string'
          }
          {
            name: 'OriginalActorAlternateId'
            type: 'string'
          }          
          {
            name: 'OriginalClientDevice'
            type: 'string'
          }
          {
            name: 'OriginalOutcomeResult'
            type: 'string'
          }
          {
            name: 'OriginalSeverity'
            type: 'string'
          }
          {
            name: 'OriginalTarget'
            type: 'dynamic'
          }
          {
            name: 'OriginalUserId'
            type: 'string'
          }
          {
            name: 'OriginalUserType'
            type: 'string'
          }
          {
            name: 'Request'
            type: 'dynamic'
          }
          {
            name: 'SecurityContextAsNumber'
            type: 'int'
          }
          {
            name: 'SecurityContextAsOrg'
            type: 'string'
          }
          {
            name: 'SecurityContextDomain'
            type: 'string'
          }
          {
            name: 'SecurityContextIsProxy'
            type: 'boolean'
          }
          {
            name: 'SrcDeviceType'
            type: 'string'
          }
          {
            name: 'SrcDvcId'
            type: 'string'
          }
          {
            name: 'SrcDvcOs'
            type: 'string'
          }
          {
            name: 'SrcGeoCity'
            type: 'string'
          }
          {
            name: 'SrcGeoCountry'
            type: 'string'
          }
          {
            name: 'SrcGeoLatitude'
            type: 'real'
          }
          {
            name: 'SrcGeoLongitude'
            type: 'string'
          }
          {
            name: 'SrcGeoPostalCode'
            type: 'string'
          }
          {
            name: 'SrcGeoRegion'
            type: 'string'
          }
          {
            name: 'SrcIpAddr'
            type: 'string'
          }
          {
            name: 'SrcIsp'
            type: 'string'
          }
          {
            name: 'SrcZone'
            type: 'string'
          }
          {
            name: 'TimeGenerated'
            type: 'datetime'
          }
          {
            name: 'TransactionDetail'
            type: 'string'
          }
          {
            name: 'TransactionId'
            type: 'string'
          }
          {
            name: 'TransactionType'
            type: 'string'
          }
          {
            name: 'Version'
            type: 'string'
          }
          {
            name: 'SrcDvcIdType'
            type: 'string'
          }
          {
            name: 'TenantId'
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
          name: 'Sentinel-OktaV2'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-OktaV2_CL'
        ]
        destinations: [
          'Sentinel-OktaV2'
        ]
        transformKql: 'source | project TenantId = toguid(TenantId), TimeGenerated, ActingAppName, ActingAppType, ActorDetailEntry, ActorDisplayName, ActorSessionId, ActorUserId, ActorUserIdType, ActorUsername, ActorUsernameType, ActorUserType, AuthenticationContextAuthenticationProvider, AuthenticationContextAuthenticationStep, AuthenticationContextCredentialProvider, AuthenticationContextInterface, AuthenticationContextIssuerId, AuthenticationContextIssuerType, DebugData, DomainName, DvcAction, EventMessage, EventOriginalResultDetails, EventOriginalType, EventOriginalUid, EventResult, EventSeverity, HttpUserAgent, LegacyEventType, LogonMethod, OriginalActorAlternateId, OriginalClientDevice, OriginalOutcomeResult, OriginalSeverity, OriginalTarget, OriginalUserId, OriginalUserType, Request, SecurityContextAsNumber, SecurityContextAsOrg, SecurityContextDomain, SecurityContextIsProxy, SrcDeviceType, SrcDvcId, SrcDvcOs, SrcGeoCity, SrcGeoCountry, SrcGeoLatitude, SrcGeoLongitude=todouble(SrcGeoLongitude), SrcGeoPostalCode, SrcGeoRegion, SrcIpAddr, SrcIsp, SrcZone, TransactionDetail, TransactionId, TransactionType, Version, SrcDvcIdType'
        outputStream: 'Custom-OktaV2_CL'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId
