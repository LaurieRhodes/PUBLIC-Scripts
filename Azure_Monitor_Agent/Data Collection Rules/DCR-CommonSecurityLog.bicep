param location string
param workspaceResourceId string
param dataCollectionEndpointId string

resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-CommonSecurityLog'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-CommonSecurityLog': {
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
            name: 'DeviceVendor'
            type: 'string'
          }
          {
            name: 'DeviceProduct'
            type: 'string'
          }
          {
            name: 'DeviceVersion'
            type: 'string'
          }
          {
            name: 'DeviceEventClassID'
            type: 'string'
          }
          {
            name: 'Activity'
            type: 'string'
          }
          {
            name: 'LogSeverity'
            type: 'string'
          }
          {
            name: 'OriginalLogSeverity'
            type: 'string'
          }
          {
            name: 'AdditionalExtensions'
            type: 'string'
          }
          {
            name: 'DeviceAction'
            type: 'string'
          }
          {
            name: 'ApplicationProtocol'
            type: 'string'
          }
          {
            name: 'EventCount'
            type: 'int'
          }
          {
            name: 'DestinationDnsDomain'
            type: 'string'
          }
          {
            name: 'DestinationServiceName'
            type: 'string'
          }
          {
            name: 'DestinationTranslatedAddress'
            type: 'string'
          }
          {
            name: 'DestinationTranslatedPort'
            type: 'int'
          }
          {
            name: 'CommunicationDirection'
            type: 'string'
          }
          {
            name: 'DeviceDnsDomain'
            type: 'string'
          }
          {
            name: 'DeviceExternalID'
            type: 'string'
          }
          {
            name: 'DeviceFacility'
            type: 'string'
          }
          {
            name: 'DeviceInboundInterface'
            type: 'string'
          }
          {
            name: 'DeviceNtDomain'
            type: 'string'
          }
          {
            name: 'DeviceOutboundInterface'
            type: 'string'
          }
          {
            name: 'DevicePayloadId'
            type: 'string'
          }
          {
            name: 'ProcessName'
            type: 'string'
          }
          {
            name: 'DeviceTranslatedAddress'
            type: 'string'
          }
          {
            name: 'DestinationHostName'
            type: 'string'
          }
          {
            name: 'DestinationMACAddress'
            type: 'string'
          }
          {
            name: 'DestinationNTDomain'
            type: 'string'
          }
          {
            name: 'DestinationProcessId'
            type: 'int'
          }
          {
            name: 'DestinationUserPrivileges'
            type: 'string'
          }
          {
            name: 'DestinationProcessName'
            type: 'string'
          }
          {
            name: 'DestinationPort'
            type: 'int'
          }
          {
            name: 'DestinationIP'
            type: 'string'
          }
          {
            name: 'DeviceTimeZone'
            type: 'string'
          }
          {
            name: 'DestinationUserID'
            type: 'string'
          }
          {
            name: 'DestinationUserName'
            type: 'string'
          }
          {
            name: 'DeviceAddress'
            type: 'string'
          }
          {
            name: 'DeviceName'
            type: 'string'
          }
          {
            name: 'DeviceMacAddress'
            type: 'string'
          }
          {
            name: 'ProcessID'
            type: 'int'
          }
          {
            name: 'EndTime'
            type: 'datetime'
          }
          {
            name: 'ExternalID'
            type: 'int'
          }
          {
            name: 'ExtID'
            type: 'string'
          }
          {
            name: 'FileCreateTime'
            type: 'string'
          }
          {
            name: 'FileHash'
            type: 'string'
          }
          {
            name: 'FileID'
            type: 'string'
          }
          {
            name: 'FileModificationTime'
            type: 'string'
          }
          {
            name: 'FilePath'
            type: 'string'
          }
          {
            name: 'FilePermission'
            type: 'string'
          }
          {
            name: 'FileType'
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
            name: 'ReceivedBytes'
            type: 'long'
          }
          {
            name: 'Message'
            type: 'string'
          }
          {
            name: 'OldFileCreateTime'
            type: 'string'
          }
          {
            name: 'OldFileHash'
            type: 'string'
          }
          {
            name: 'OldFileID'
            type: 'string'
          }
          {
            name: 'OldFileModificationTime'
            type: 'string'
          }
          {
            name: 'OldFileName'
            type: 'string'
          }
          {
            name: 'OldFilePath'
            type: 'string'
          }
          {
            name: 'OldFilePermission'
            type: 'string'
          }
          {
            name: 'OldFileSize'
            type: 'int'
          }
          {
            name: 'OldFileType'
            type: 'string'
          }
          {
            name: 'SentBytes'
            type: 'long'
          }
          {
            name: 'EventOutcome'
            type: 'string'
          }
          {
            name: 'Protocol'
            type: 'string'
          }
          {
            name: 'Reason'
            type: 'string'
          }
          {
            name: 'RequestURL'
            type: 'string'
          }
          {
            name: 'RequestClientApplication'
            type: 'string'
          }
          {
            name: 'RequestContext'
            type: 'string'
          }
          {
            name: 'RequestCookies'
            type: 'string'
          }
          {
            name: 'RequestMethod'
            type: 'string'
          }
          {
            name: 'ReceiptTime'
            type: 'string'
          }
          {
            name: 'SourceMACAddress'
            type: 'string'
          }
          {
            name: 'SourceNTDomain'
            type: 'string'
          }
          {
            name: 'SourceDnsDomain'
            type: 'string'
          }
          {
            name: 'SourceServiceName'
            type: 'string'
          }
          {
            name: 'SourceTranslatedAddress'
            type: 'string'
          }
          {
            name: 'SourceTranslatedPort'
            type: 'int'
          }
          {
            name: 'SourceProcessId'
            type: 'int'
          }
          {
            name: 'SourceUserPrivileges'
            type: 'string'
          }
          {
            name: 'SourceProcessName'
            type: 'string'
          }
          {
            name: 'SourcePort'
            type: 'int'
          }
          {
            name: 'SourceIP'
            type: 'string'
          }
          {
            name: 'StartTime'
            type: 'datetime'
          }
          {
            name: 'SourceUserID'
            type: 'string'
          }
          {
            name: 'SourceUserName'
            type: 'string'
          }
          {
            name: 'EventType'
            type: 'int'
          }
          {
            name: 'DeviceEventCategory'
            type: 'string'
          }
          {
            name: 'DeviceCustomIPv6Address1'
            type: 'string'
          }
          {
            name: 'DeviceCustomIPv6Address1Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomIPv6Address2'
            type: 'string'
          }
          {
            name: 'DeviceCustomIPv6Address2Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomIPv6Address3'
            type: 'string'
          }
          {
            name: 'DeviceCustomIPv6Address3Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomIPv6Address4'
            type: 'string'
          }
          {
            name: 'DeviceCustomIPv6Address4Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomFloatingPoint1'
            type: 'real'
          }
          {
            name: 'DeviceCustomFloatingPoint1Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomFloatingPoint2'
            type: 'real'
          }
          {
            name: 'DeviceCustomFloatingPoint2Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomFloatingPoint3'
            type: 'real'
          }
          {
            name: 'DeviceCustomFloatingPoint3Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomFloatingPoint4'
            type: 'real'
          }
          {
            name: 'DeviceCustomFloatingPoint4Label'
            type: 'string'
          }          
          {
            name: 'DeviceCustomNumber1'
            type: 'int'
          }
          {
            name: 'FieldDeviceCustomNumber1'
            type: 'long'
          }
          {
            name: 'DeviceCustomNumber1Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomNumber2'
            type: 'int'
          }
          {
            name: 'FieldDeviceCustomNumber2'
            type: 'long'
          }
          {
            name: 'DeviceCustomNumber2Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomNumber3'
            type: 'int'
          }
          {
            name: 'FieldDeviceCustomNumber3'
            type: 'long'
          }
          {
            name: 'DeviceCustomNumber3Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomString1'
            type: 'string'
          }
          {
            name: 'DeviceCustomString1Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomString2'
            type: 'string'
          }
          {
            name: 'DeviceCustomString2Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomString3'
            type: 'string'
          }
          {
            name: 'DeviceCustomString3Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomString4'
            type: 'string'
          }
          {
            name: 'DeviceCustomString4Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomString5'
            type: 'string'
          }
          {
            name: 'DeviceCustomString5Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomString6'
            type: 'string'
          }
          {
            name: 'DeviceCustomString6Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomDate1'
            type: 'string'
          }
          {
            name: 'DeviceCustomDate1Label'
            type: 'string'
          }
          {
            name: 'DeviceCustomDate2'
            type: 'string'
          }
          {
            name: 'DeviceCustomDate2Label'
            type: 'string'
          }
          {
            name: 'FlexDate1'
            type: 'string'
          }
          {
            name: 'FlexDate1Label'
            type: 'string'
          }
          {
            name: 'FlexNumber1'
            type: 'int'
          }
          {
            name: 'FlexNumber1Label'
            type: 'string'
          }
          {
            name: 'FlexNumber2'
            type: 'int'
          }
          {
            name: 'FlexNumber2Label'
            type: 'string'
          }
          {
            name: 'FlexString1'
            type: 'string'
          }
          {
            name: 'FlexString1Label'
            type: 'string'
          }
          {
            name: 'FlexString2'
            type: 'string'
          }
          {
            name: 'FlexString2Label'
            type: 'string'
          }
          {
            name: 'RemoteIP'
            type: 'string'
          }
          {
            name: 'RemotePort'
            type: 'string'
          }
          {
            name: 'MaliciousIP'
            type: 'string'
          }
          {
            name: 'ThreatSeverity'
            type: 'int'
          }
          {
            name: 'IndicatorThreatType'
            type: 'string'
          }
          {
            name: 'ThreatDescription'
            type: 'string'
          }
          {
            name: 'ThreatConfidence'
            type: 'string'
          }
          {
            name: 'ReportReferenceLink'
            type: 'string'
          }
          {
            name: 'MaliciousIPLongitude'
            type: 'real'
          }
          {
            name: 'MaliciousIPLatitude'
            type: 'real'
          }
          {
            name: 'MaliciousIPCountry'
            type: 'string'
          }
          {
            name: 'Computer'
            type: 'string'
          }
          {
            name: 'SourceSystem'
            type: 'string'
          }
          {
            name: 'SimplifiedDeviceAction'
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
          name: 'Sentinel-CommonSecurityLog'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-CommonSecurityLog'
        ]
        destinations: [
          'Sentinel-CommonSecurityLog'
        ]
        transformKql: 'source | project TenantId = toguid(TenantId), TimeGenerated, DeviceVendor, DeviceProduct, DeviceVersion, DeviceEventClassID, Activity, LogSeverity, OriginalLogSeverity, AdditionalExtensions, DeviceAction, ApplicationProtocol, EventCount, DestinationDnsDomain, DestinationServiceName, DestinationTranslatedAddress, DestinationTranslatedPort, CommunicationDirection, DeviceDnsDomain, DeviceExternalID, DeviceFacility, DeviceInboundInterface, DeviceNtDomain, DeviceOutboundInterface, DevicePayloadId, ProcessName, DeviceTranslatedAddress, DestinationHostName, DestinationMACAddress, DestinationNTDomain, DestinationProcessId, DestinationUserPrivileges, DestinationProcessName, DestinationPort, DestinationIP, DeviceTimeZone, DestinationUserID, DestinationUserName, DeviceAddress, DeviceName, DeviceMacAddress, ProcessID, EndTime, ExternalID, ExtID, FileCreateTime, FileHash, FileID, FileModificationTime, FilePath, FilePermission, FileType, FileName, FileSize, ReceivedBytes, Message, OldFileCreateTime, OldFileHash, OldFileID, OldFileModificationTime, OldFileName, OldFilePath, OldFilePermission, OldFileSize, OldFileType, SentBytes, EventOutcome, Protocol, Reason, RequestURL, RequestClientApplication, RequestContext, RequestCookies, RequestMethod, ReceiptTime, SourceMACAddress, SourceNTDomain, SourceDnsDomain, SourceServiceName, SourceTranslatedAddress, SourceTranslatedPort, SourceProcessId, SourceUserPrivileges, SourceProcessName, SourcePort, SourceIP, StartTime, SourceUserID, SourceUserName, EventType, DeviceEventCategory, DeviceCustomIPv6Address1, DeviceCustomIPv6Address1Label, DeviceCustomIPv6Address2, DeviceCustomIPv6Address2Label, DeviceCustomIPv6Address3, DeviceCustomIPv6Address3Label, DeviceCustomIPv6Address4, DeviceCustomIPv6Address4Label, DeviceCustomFloatingPoint1, DeviceCustomFloatingPoint1Label, DeviceCustomFloatingPoint2, DeviceCustomFloatingPoint2Label, DeviceCustomFloatingPoint3, DeviceCustomFloatingPoint3Label, DeviceCustomFloatingPoint4, DeviceCustomFloatingPoint4Label, DeviceCustomNumber1, FieldDeviceCustomNumber1, DeviceCustomNumber1Label, DeviceCustomNumber2, FieldDeviceCustomNumber2, DeviceCustomNumber2Label, DeviceCustomNumber3, FieldDeviceCustomNumber3, DeviceCustomNumber3Label, DeviceCustomString1, DeviceCustomString1Label, DeviceCustomString2, DeviceCustomString2Label, DeviceCustomString3, DeviceCustomString3Label, DeviceCustomString4, DeviceCustomString4Label, DeviceCustomString5, DeviceCustomString5Label, DeviceCustomString6, DeviceCustomString6Label, DeviceCustomDate1, DeviceCustomDate1Label, DeviceCustomDate2, DeviceCustomDate2Label, FlexDate1, FlexDate1Label, FlexNumber1, FlexNumber1Label, FlexNumber2, FlexNumber2Label, FlexString1, FlexString1Label, FlexString2, FlexString2Label, RemoteIP, RemotePort, MaliciousIP, ThreatSeverity, IndicatorThreatType, ThreatDescription, ThreatConfidence, ReportReferenceLink, MaliciousIPLongitude, MaliciousIPLatitude, MaliciousIPCountry, Computer, SourceSystem, SimplifiedDeviceAction, CollectorHostName, Type'
        outputStream: 'Microsoft-CommonSecurityLog'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId