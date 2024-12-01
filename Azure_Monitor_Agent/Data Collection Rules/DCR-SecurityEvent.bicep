param location string
param workspaceResourceId string
param dataCollectionEndpointId string

resource dataCollectionRule 'Microsoft.Insights/dataCollectionRules@2022-06-01' = {
  name: 'write-to-SecurityEvent'
  location: location
  properties: {
    dataCollectionEndpointId: dataCollectionEndpointId
    streamDeclarations: {
      'Custom-SecurityEvent': {
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
            name: 'AccessList'
            type: 'string'
          }
          {
            name: 'AccessMask'
            type: 'string'
          }
          {
            name: 'AccessReason'
            type: 'string'
          }
          {
            name: 'Account'
            type: 'string'
          }
          {
            name: 'AccountDomain'
            type: 'string'
          }
          {
            name: 'AccountExpires'
            type: 'string'
          }
          {
            name: 'AccountName'
            type: 'string'
          }
          {
            name: 'AccountType'
            type: 'string'
          }
          {
            name: 'AccountSessionIdentifier'
            type: 'string'
          }
          {
            name: 'Activity'
            type: 'string'
          }
          {
            name: 'AdditionalInfo'
            type: 'string'
          }
          {
            name: 'AdditionalInfo2'
            type: 'string'
          }
          {
            name: 'AllowedToDelegateTo'
            type: 'string'
          }
          {
            name: 'Attributes'
            type: 'string'
          }
          {
            name: 'AuditPolicyChanges'
            type: 'string'
          }
          {
            name: 'AuditsDiscarded'
            type: 'int'
          }
          {
            name: 'AuthenticationLevel'
            type: 'int'
          }
          {
            name: 'AuthenticationPackageName'
            type: 'string'
          }
          {
            name: 'AuthenticationProvider'
            type: 'string'
          }
          {
            name: 'AuthenticationServer'
            type: 'string'
          }
          {
            name: 'AuthenticationService'
            type: 'int'
          }
          {
            name: 'AuthenticationType'
            type: 'string'
          }
          {
            name: 'AzureDeploymentID'
            type: 'string'
          }
          {
            name: 'AzureTableName'
            type: 'string'
          }
          {
            name: 'CACertificateHash'
            type: 'string'
          }
          {
            name: 'CalledStationID'
            type: 'string'
          }
          {
            name: 'CallerProcessId'
            type: 'string'
          }
          {
            name: 'CallerProcessName'
            type: 'string'
          }
          {
            name: 'CallingStationID'
            type: 'string'
          }
          {
            name: 'CAPublicKeyHash'
            type: 'string'
          }
          {
            name: 'CategoryId'
            type: 'string'
          }          
          {
            name: 'CertificateDatabaseHash'
            type: 'string'
          }
          {
            name: 'Channel'
            type: 'string'
          }
          {
            name: 'ClassId'
            type: 'string'
          }
          {
            name: 'ClassName'
            type: 'string'
          }
          {
            name: 'ClientAddress'
            type: 'string'
          }
          {
            name: 'ClientIPAddress'
            type: 'string'
          }
          {
            name: 'ClientName'
            type: 'string'
          }
          {
            name: 'CommandLine'
            type: 'string'
          }
          {
            name: 'CompatibleIds'
            type: 'string'
          }
          {
            name: 'Computer'
            type: 'string'
          }
          {
            name: 'DCDNSName'
            type: 'string'
          }
          {
            name: 'DeviceDescription'
            type: 'string'
          }
          {
            name: 'DeviceId'
            type: 'string'
          }
          {
            name: 'DisplayName'
            type: 'string'
          }
          {
            name: 'Disposition'
            type: 'string'
          }
          {
            name: 'DomainBehaviorVersion'
            type: 'string'
          }
          {
            name: 'DomainName'
            type: 'string'
          }          
          {
            name: 'DomainPolicyChanged'
            type: 'string'
          }
          {
            name: 'DomainSid'
            type: 'string'
          }
          {
            name: 'EAPType'
            type: 'string'
          }
          {
            name: 'ElevatedToken'
            type: 'string'
          }
          {
            name: 'ErrorCode'
            type: 'int'
          }
          {
            name: 'EventData'
            type: 'string'
          }
          {
            name: 'EventID'
            type: 'int'
          }
          {
            name: 'EventOriginId'
            type: 'string'
          }
          {
            name: 'EventSourceName'
            type: 'string'
          }
          {
            name: 'ExtendedQuarantineState'
            type: 'string'
          }
          {
            name: 'FailureReason'
            type: 'string'
          }
          {
            name: 'FileHash'
            type: 'string'
          }
          {
            name: 'FilePath'
            type: 'string'
          }
          {
            name: 'FilePathNoUser'
            type: 'string'
          }
          {
            name: 'Filter'
            type: 'string'
          }
          {
            name: 'ForceLogoff'
            type: 'string'
          }
          {
            name: 'Fqbn'
            type: 'string'
          }
          {
            name: 'FullyQualifiedSubjectMachineName'
            type: 'string'
          }
          {
            name: 'FullyQualifiedSubjectUserName'
            type: 'string'
          }
          {
            name: 'GroupMembership'
            type: 'string'
          }
          {
            name: 'HandleId'
            type: 'string'
          }
          {
            name: 'HardwareIds'
            type: 'string'
          }
          {
            name: 'HomeDirectory'
            type: 'string'
          }
          {
            name: 'HomePath'
            type: 'string'
          }
          {
            name: 'ImpersonationLevel'
            type: 'string'
          }
          {
            name: 'InterfaceUuid'
            type: 'string'
          }
          {
            name: 'IpAddress'
            type: 'string'
          }
          {
            name: 'IpPort'
            type: 'string'
          }
          {
            name: 'KeyLength'
            type: 'int'
          }
          {
            name: 'Level'
            type: 'string'
          }
          {
            name: 'LmPackageName'
            type: 'string'
          }
          {
            name: 'LocationInformation'
            type: 'string'
          }
          {
            name: 'LockoutDuration'
            type: 'string'
          }
          {
            name: 'LockoutObservationWindow'
            type: 'string'
          }
          {
            name: 'LockoutThreshold'
            type: 'string'
          }
          {
            name: 'LoggingResult'
            type: 'string'
          }
          {
            name: 'LogonGuid'
            type: 'string'
          }
          {
            name: 'LogonHours'
            type: 'string'
          }
          {
            name: 'LogonID'
            type: 'string'
          }
          {
            name: 'LogonProcessName'
            type: 'string'
          }
          {
            name: 'LogonType'
            type: 'int'
          }
          {
            name: 'LogonTypeName'
            type: 'string'
          }
          {
            name: 'MachineAccountQuota'
            type: 'string'
          }
          {
            name: 'MachineInventory'
            type: 'string'
          }
          {
            name: 'MachineLogon'
            type: 'string'
          }
          {
            name: 'ManagementGroupName'
            type: 'string'
          }
          {
            name: 'MandatoryLabel'
            type: 'string'
          }
          {
            name: 'MaxPasswordAge'
            type: 'string'
          }
          {
            name: 'MemberName'
            type: 'string'
          }
          {
            name: 'MemberSid'
            type: 'string'
          }
          {
            name: 'MG'
            type: 'string'
          }
          {
            name: 'MinPasswordAge'
            type: 'string'
          }
          {
            name: 'MinPasswordLength'
            type: 'string'
          }
          {
            name: 'MixedDomainMode'
            type: 'string'
          }
          {
            name: 'NASIdentifier'
            type: 'string'
          }
          {
            name: 'NASIPv4Address'
            type: 'string'
          }
          {
            name: 'NASIPv6Address'
            type: 'string'
          }
          {
            name: 'NASPort'
            type: 'string'
          }
          {
            name: 'NASPortType'
            type: 'string'
          }
          {
            name: 'NetworkPolicyName'
            type: 'string'
          }
          {
            name: 'NewDate'
            type: 'string'
          }
          {
            name: 'NewMaxUsers'
            type: 'string'
          }
          {
            name: 'NewProcessId'
            type: 'string'
          }
          {
            name: 'NewProcessName'
            type: 'string'
          }
          {
            name: 'NewRemark'
            type: 'string'
          }
          {
            name: 'NewShareFlags'
            type: 'string'
          }
          {
            name: 'NewTime'
            type: 'string'
          }
          {
            name: 'NewUacValue'
            type: 'string'
          }
          {
            name: 'NewValue'
            type: 'string'
          }
          {
            name: 'NewValueType'
            type: 'string'
          }
          {
            name: 'ObjectName'
            type: 'string'
          }
          {
            name: 'ObjectServer'
            type: 'string'
          }
          {
            name: 'ObjectType'
            type: 'string'
          }
          {
            name: 'ObjectValueName'
            type: 'string'
          }
          {
            name: 'OemInformation'
            type: 'string'
          }
          {
            name: 'OldMaxUsers'
            type: 'string'
          }
          {
            name: 'OldRemark'
            type: 'string'
          }
          {
            name: 'OldShareFlags'
            type: 'string'
          }
          {
            name: 'OldUacValue'
            type: 'string'
          }
          {
            name: 'OldValue'
            type: 'string'
          }
          {
            name: 'OldValueType'
            type: 'string'
          }
          {
            name: 'OperationType'
            type: 'string'
          }
          {
            name: 'PackageName'
            type: 'string'
          }
          {
            name: 'ParentProcessName'
            type: 'string'
          }
          {
            name: 'PartitionKey'
            type: 'string'
          }
          {
            name: 'PasswordHistoryLength'
            type: 'string'
          }
          {
            name: 'PasswordLastSet'
            type: 'string'
          }
          {
            name: 'PasswordProperties'
            type: 'string'
          }
          {
            name: 'PreviousDate'
            type: 'string'
          }
          {
            name: 'PreviousTime'
            type: 'string'
          }
          {
            name: 'PrimaryGroupId'
            type: 'string'
          }
          {
            name: 'PrivateKeyUsageCount'
            type: 'string'
          }
          {
            name: 'PrivilegeList'
            type: 'string'
          }
          {
            name: 'Process'
            type: 'string'
          }
          {
            name: 'ProcessId'
            type: 'string'
          }
          {
            name: 'ProcessName'
            type: 'string'
          }
          {
            name: 'Properties'
            type: 'string'
          }
          {
            name: 'ProfilePath'
            type: 'string'
          }
          {
            name: 'ProtocolSequence'
            type: 'string'
          }
          {
            name: 'ProxyPolicyName'
            type: 'string'
          }
          {
            name: 'QuarantineHelpURL'
            type: 'string'
          }
          {
            name: 'QuarantineSessionID'
            type: 'string'
          }
          {
            name: 'QuarantineSessionIdentifier'
            type: 'string'
          }
          {
            name: 'QuarantineState'
            type: 'string'
          }
          {
            name: 'QuarantineSystemHealthResult'
            type: 'string'
          }
          {
            name: 'RelativeTargetName'
            type: 'string'
          }
          {
            name: 'RemoteIpAddress'
            type: 'string'
          }
          {
            name: 'RemotePort'
            type: 'string'
          }
          {
            name: 'Requester'
            type: 'string'
          }
          {
            name: 'RequestId'
            type: 'string'
          }
          {
            name: 'RestrictedAdminMode'
            type: 'string'
          }
          {
            name: 'RowKey'
            type: 'string'
          }
          {
            name: 'RowsDeleted'
            type: 'string'
          }
          {
            name: 'SamAccountName'
            type: 'string'
          }
          {
            name: 'ScriptPath'
            type: 'string'
          }
          {
            name: 'SecurityDescriptor'
            type: 'string'
          }
          {
            name: 'ServiceAccount'
            type: 'string'
          }
          {
            name: 'ServiceFileName'
            type: 'string'
          }
          {
            name: 'ServiceName'
            type: 'string'
          }
          {
            name: 'ServiceStartType'
            type: 'int'
          }
          {
            name: 'ServiceType'
            type: 'string'
          }
          {
            name: 'SessionName'
            type: 'string'
          }
          {
            name: 'ShareLocalPath'
            type: 'string'
          }
          {
            name: 'ShareName'
            type: 'string'
          }
          {
            name: 'SidHistory'
            type: 'string'
          }
          {
            name: 'SourceComputerId'
            type: 'string'
          }
          {
            name: 'SourceSystem'
            type: 'string'
          }
          {
            name: 'Status'
            type: 'string'
          }
          {
            name: 'StorageAccount'
            type: 'string'
          }
          {
            name: 'SubjectAccount'
            type: 'string'
          }
          {
            name: 'SubcategoryGuid'
            type: 'string'
          }
          {
            name: 'SubcategoryId'
            type: 'string'
          }
          {
            name: 'Subject'
            type: 'string'
          }
          {
            name: 'SubjectDomainName'
            type: 'string'
          }
          {
            name: 'SubjectKeyIdentifier'
            type: 'string'
          }
          {
            name: 'SubjectLogonId'
            type: 'string'
          }
          {
            name: 'SubjectMachineName'
            type: 'string'
          }
          {
            name: 'SubjectMachineSID'
            type: 'string'
          }
          {
            name: 'SubjectUserName'
            type: 'string'
          }
          {
            name: 'SubjectUserSid'
            type: 'string'
          }
          {
            name: 'SubStatus'
            type: 'string'
          }
          {
            name: 'TableId'
            type: 'string'
          }
          {
            name: 'TargetAccount'
            type: 'string'
          }
          {
            name: 'TargetDomainName'
            type: 'string'
          }
          {
            name: 'TargetInfo'
            type: 'string'
          }
          {
            name: 'TargetLinkedLogonId'
            type: 'string'
          }
          {
            name: 'TargetLogonGuid'
            type: 'string'
          }
          {
            name: 'TargetLogonId'
            type: 'string'
          }
          {
            name: 'TargetOutboundDomainName'
            type: 'string'
          }
          {
            name: 'TargetOutboundUserName'
            type: 'string'
          }
          {
            name: 'TargetServerName'
            type: 'string'
          }
          {
            name: 'TargetSid'
            type: 'string'
          }
          {
            name: 'TargetUser'
            type: 'string'
          }
          {
            name: 'TargetUserName'
            type: 'string'
          }
          {
            name: 'TargetUserSid'
            type: 'string'
          }
          {
            name: 'Task'
            type: 'int'
          }
          {
            name: 'TemplateContent'
            type: 'string'
          }
          {
            name: 'TemplateDSObjectFQDN'
            type: 'string'
          }
          {
            name: 'TemplateInternalName'
            type: 'string'
          }
          {
            name: 'TemplateOID'
            type: 'string'
          }
          {
            name: 'TemplateSchemaVersion'
            type: 'string'
          }
          {
            name: 'TemplateVersion'
            type: 'string'
          }
          {
            name: 'TimeCollected'
            type: 'datetime'
          }
          {
            name: 'TokenElevationType'
            type: 'string'
          }
          {
            name: 'TransmittedServices'
            type: 'string'
          }
          {
            name: 'Type'
            type: 'string'
          }
          {
            name: 'UserAccountControl'
            type: 'string'
          }
          {
            name: 'UserParameters'
            type: 'string'
          }
          {
            name: 'UserPrincipalName'
            type: 'string'
          }
          {
            name: 'UserWorkstations'
            type: 'string'
          }
          {
            name: 'VirtualAccount'
            type: 'string'
          }
          {
            name: 'VendorIds'
            type: 'string'
          }
          {
            name: 'Workstation'
            type: 'string'
          }
          {
            name: 'WorkstationName'
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
          name: 'Sentinel-SecurityEvent'
        }
      ]
    }
    dataFlows: [
      {
        streams: [
          'Custom-SecurityEvent'
        ]
        destinations: [
          'Sentinel-SecurityEvent'
        ]
        transformKql: 'source | project TenantId = toguid(TenantId), TimeGenerated, SourceSystem, Account, AccountType, Computer, EventSourceName, Channel, Task, Level, EventData, EventID, Activity, PartitionKey, RowKey, StorageAccount, AzureDeploymentID, AzureTableName, AccessList, AccessMask, AccessReason, AccountDomain, AccountExpires, AccountName, AccountSessionIdentifier, AdditionalInfo, AdditionalInfo2, AllowedToDelegateTo, Attributes, AuditPolicyChanges, AuditsDiscarded, AuthenticationLevel, AuthenticationPackageName, AuthenticationProvider, AuthenticationServer, AuthenticationService, AuthenticationType, CACertificateHash, CalledStationID, CallerProcessId, CallerProcessName, CallingStationID, CAPublicKeyHash, CategoryId, CertificateDatabaseHash, ClassId, ClassName, ClientAddress, ClientIPAddress, ClientName, CommandLine, CompatibleIds, DCDNSName, DeviceDescription, DeviceId, DisplayName, Disposition, DomainBehaviorVersion, DomainName, DomainPolicyChanged, DomainSid, EAPType, ElevatedToken, ErrorCode, ExtendedQuarantineState, FailureReason, FileHash, FilePath, FilePathNoUser, Filter, ForceLogoff, Fqbn, FullyQualifiedSubjectMachineName, FullyQualifiedSubjectUserName, GroupMembership, HandleId, HardwareIds, HomeDirectory, HomePath, ImpersonationLevel, InterfaceUuid = toguid(InterfaceUuid), IpAddress, IpPort, KeyLength, LmPackageName, LocationInformation, LockoutDuration, LockoutObservationWindow, LockoutThreshold, LoggingResult, LogonGuid = toguid(LogonGuid), LogonHours, LogonID, LogonProcessName, LogonType, LogonTypeName, MachineAccountQuota, MachineInventory, MachineLogon, MandatoryLabel, MaxPasswordAge, MemberName, MemberSid, MinPasswordAge, MinPasswordLength, MixedDomainMode, NASIdentifier, NASIPv4Address, NASIPv6Address, NASPort, NASPortType, NetworkPolicyName, NewDate, NewMaxUsers, NewProcessId, NewProcessName, NewRemark, NewShareFlags, NewTime, NewUacValue, NewValue, NewValueType, ObjectName, ObjectServer, ObjectType, ObjectValueName, OemInformation, OldMaxUsers, OldRemark, OldShareFlags, OldUacValue, OldValue, OldValueType, OperationType, PackageName, ParentProcessName, PasswordHistoryLength, PasswordLastSet, PasswordProperties, PreviousDate, PreviousTime, PrimaryGroupId, PrivateKeyUsageCount, PrivilegeList, Process, ProcessId, ProcessName, Properties, ProfilePath, ProtocolSequence, ProxyPolicyName, QuarantineHelpURL, QuarantineSessionID, QuarantineSessionIdentifier, QuarantineState, QuarantineSystemHealthResult, RelativeTargetName, RemoteIpAddress, RemotePort, Requester, RequestId, RestrictedAdminMode, RowsDeleted, SamAccountName, ScriptPath, SecurityDescriptor, ServiceAccount, ServiceFileName, ServiceName, ServiceStartType, ServiceType, SessionName, ShareLocalPath, ShareName, SidHistory, Status, SubjectAccount, SubcategoryGuid = toguid(SubcategoryGuid), SubcategoryId, Subject, SubjectDomainName, SubjectKeyIdentifier, SubjectLogonId, SubjectMachineName, SubjectMachineSID, SubjectUserName, SubjectUserSid, SubStatus, TableId, TargetAccount, TargetDomainName, TargetInfo, TargetLinkedLogonId, TargetLogonGuid = toguid(TargetLogonGuid), TargetLogonId, TargetOutboundDomainName, TargetOutboundUserName, TargetServerName, TargetSid, TargetUser, TargetUserName, TargetUserSid, TemplateContent, TemplateDSObjectFQDN, TemplateInternalName, TemplateOID, TemplateSchemaVersion, TemplateVersion, TokenElevationType, TransmittedServices, UserAccountControl, UserParameters, UserPrincipalName, UserWorkstations, VirtualAccount, VendorIds, Workstation, WorkstationName, SourceComputerId = toguid(SourceComputerId), EventOriginId, MG = toguid(MG), TimeCollected, ManagementGroupName, Type'
        outputStream: 'Microsoft-SecurityEvent'
      }
    ]
  }
}

output immutableId string = dataCollectionRule.properties.immutableId
