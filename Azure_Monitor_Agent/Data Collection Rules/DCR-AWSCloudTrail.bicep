param location string
param workspaceResourceId string
param dataCollectionEndpointId string

resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-AWSCloudTrail'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-AWSCloudTrail': {
        columns: [
          {
            name: 'TimeGenerated'
            type: 'datetime'
          }
          {
            name: 'AwsEventId'
            type: 'string'
          }
          {
            name: 'EventVersion'
            type: 'string'
          }
          {
            name: 'AccessReason'
            type: 'string'
          }
          {
            name: 'EventSource'
            type: 'string'
          }
          {
            name: 'AccountDomain'
            type: 'string'
          }
          {
            name: 'EventTypeName'
            type: 'string'
          }
          {
            name: 'EventName'
            type: 'string'
          }
          {
            name: 'AccountType'
            type: 'string'
          }
          {
            name: 'UserIdentityType'
            type: 'string'
          }
          {
            name: 'UserIdentityPrincipalid'
            type: 'string'
          }
          {
            name: 'UserIdentityArn'
            type: 'string'
          }
          {
            name: 'UserIdentityAccountId'
            type: 'string'
          }
          {
            name: 'UserIdentityInvokedBy'
            type: 'string'
          }
          {
            name: 'UserIdentityAccessKeyId'
            type: 'string'
          }
          {
            name: 'UserIdentityUserName'
            type: 'string'
          }
          {
            name: 'SessionMfaAuthenticated'
            type: 'boolean'
          }
          {
            name: 'SessionCreationDate'
            type: 'datetime'
          }
          {
            name: 'SessionIssuerType'
            type: 'string'
          }
          {
            name: 'SessionIssuerPrincipalId'
            type: 'string'
          }
          {
            name: 'SessionIssuerArn'
            type: 'string'
          }
          {
            name: 'SessionIssuerAccountId'
            type: 'string'
          }
          {
            name: 'SessionIssuerUserName'
            type: 'string'
          }
          {
            name: 'AWSRegion'
            type: 'string'
          }
          {
            name: 'SourceIpAddress'
            type: 'string'
          }
          {
            name: 'UserAgent'
            type: 'string'
          }
          {
            name: 'ErrorCode'
            type: 'string'
          }
          {
            name: 'ErrorMessage'
            type: 'string'
          }
          {
            name: 'RequestParameters'
            type: 'string'
          }
          {
            name: 'ResponseElements'
            type: 'string'
          }
          {
            name: 'AdditionalEventData'
            type: 'string'
          }
          {
            name: 'AwsRequestId'
            type: 'string'
          }
          {
            name: 'AwsRequestId_'
            type: 'string'
          }
          {
            name: 'Resources'
            type: 'string'
          }
          {
            name: 'APIVersion'
            type: 'string'
          }
          {
            name: 'ReadOnly'
            type: 'boolean'
          }
          {
            name: 'RecipientAccountId'
            type: 'string'
          }
          {
            name: 'ServiceEventDetails'
            type: 'string'
          }
          {
            name: 'SharedEventId'
            type: 'string'
          }
          {
            name: 'VpcEndpointId'
            type: 'string'
          }
          {
            name: 'ManagementEvent'
            type: 'boolean'
          }
          {
            name: 'TenantId'
            type: 'string'
          }
          {
            name: 'SourceSystem'
            type: 'string'
          }
          {
            name: 'OperationName'
            type: 'string'
          }
          {
            name: 'Category'
            type: 'string'
          }
          {
            name: 'EC2RoleDelivery'
            type: 'string'
          }
          {
            name: 'TlsVersion'
            type: 'string'
          }
          {
            name: 'CipherSuite'
            type: 'string'
          }
          {
            name: 'ClientProvidedHostHeader'
            type: 'string'
          }
          {
            name: 'IpProtocol'
            type: 'string'
          }
          {
            name: 'SourcePort'
            type: 'string'
          }
          {
            name: 'DestinationPort'
            type: 'string'
          }
          {
            name: 'CidrIp'
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
          name: 'Sentinel-AWSCloudTrail'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-AWSCloudTrail'
        ]
        destinations: [
          'Sentinel-AWSCloudTrail'
        ]
       transformKql: 'source | project TimeGenerated, toguid(AwsEventId), EventVersion, EventSource, EventTypeName, EventName, UserIdentityType, UserIdentityPrincipalid, UserIdentityArn, UserIdentityAccountId, UserIdentityInvokedBy, UserIdentityAccessKeyId, UserIdentityUserName, SessionMfaAuthenticated, SessionCreationDate, SessionIssuerType, SessionIssuerPrincipalId, SessionIssuerArn, SessionIssuerAccountId, SessionIssuerUserName, AWSRegion, SourceIpAddress, UserAgent, ErrorCode, ErrorMessage, RequestParameters, ResponseElements, AdditionalEventData, AwsRequestId = toguid(AwsRequestId), AwsRequestId_, Resources, APIVersion, ReadOnly, RecipientAccountId, ServiceEventDetails, toguid(SharedEventId), VpcEndpointId, ManagementEvent, toguid(TenantId), SourceSystem, OperationName, Category, EC2RoleDelivery, TlsVersion, CipherSuite, ClientProvidedHostHeader, IpProtocol, SourcePort, DestinationPort, CidrIp, Type'
        outputStream: 'Microsoft-AWSCloudTrail'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId