function Convertto-CleanAzureObject(){ 
    [CmdletBinding()]
    param(
        [Parameter(mandatory=$true)]
        [psobject]$azobject
    )

<#
    Purpose:  Parsing function to remove read only properties from an object so the exported defintion may be used for redeployment
              Not neceassry for a basic audit.

              Also provides the ability to perform additional GET against specific object types

#>

# Remove typical Read Only properties from Azure Objects if they exist
    

 foreach($property in $($object.PSObject.properties.name)){

   switch ($property) {
     'changedTime'      {$azobject.PSObject.properties.remove('changedTime')}
     'creationTime'     {$azobject.PSObject.properties.remove('creationTime')}
     'CreatedAt'        {$azobject.PSObject.properties.remove('CreatedAt')}
     'CreatedAtUTC'     {$azobject.PSObject.properties.remove('CreatedAtUTC')}
     'createdBy'        {$azobject.PSObject.properties.remove('createdBy')}   
     'createdByType'    {$azobject.PSObject.properties.remove('createdByType')}      
     'etag'             {$azobject.PSObject.properties.remove('etag')}
     'lastModifiedAt'   {$azobject.PSObject.properties.remove('lastModifiedAt')}
     'lastModifiedBy'   {$azobject.PSObject.properties.remove('lastModifiedBy')}   
     'lastModifiedByType'{$azobject.PSObject.properties.remove('lastModifiedByType')}     
     'lastModifiedTime' {$azobject.PSObject.properties.remove('lastModifiedTime')}
     'lastStatusChange' {$azobject.PSObject.properties.remove('lastStatusChange')}
     'provisioningState'{$azobject.PSObject.properties.remove('provisioningState')}
     'resourceGuid'     {$azobject.PSObject.properties.remove('resourceGuid')}
     'state'            {$azobject.PSObject.properties.remove('state')}
     'systemData'       {$azobject.PSObject.properties.remove('systemData')}     
     'timeCreated'      {$azobject.PSObject.properties.remove('timeCreated')}   
     'updatedAt'        {$azobject.PSObject.properties.remove('updatedAt')}

     default {} # Considered to be a rw property
  }

 } 
    
<#
 Different Object types have different Read Only Properties that must be removed if they are to deploy successfully
 There doesnt seem to be a programatic way to discover these so I'm adding them as new object types are tested.

 Also note that I will use a separate function to potentially separate some objects into multiple objects so they can be deployed.
 Comments that some elements are cleaned "in place" indicate that I don't expect nested or attached objects to be removed.
#>
    switch($azobject.type){
       "Microsoft.ApiManagement/service" {
       }
       "Microsoft.Automation/AutomationAccounts" {
       }
       "Microsoft.Automation/AutomationAccounts/Runbooks" {
       }
       "Microsoft.Cache/Redis" {
       }
       "Microsoft.Compute/virtualMachines/extensions" {
       }
       "Microsoft.Compute/virtualMachines" {
            ($object.properties).PSObject.properties.remove('vmId')
            ($object.identity).PSObject.properties.remove('principalId')
            ($object.identity).PSObject.properties.remove('tenantId')
            #
            ($object.properties.osProfile).PSObject.properties.remove('requireGuestProvisionSignal')

            #Disks will be managed separately & before the VM.  Disk option attach will need to be used.
            #more work will be needed to accomodate data disks
            ($object.properties.storageProfile.osDisk.managedDisk).PSObject.properties.remove('id')
       }
       "Microsoft.Compute/disks" {
            ($object.properties).PSObject.properties.remove('uniqueId')
            ($object.properties).PSObject.properties.remove('diskSizeBytes')
       }

       "Microsoft.ContainerInstance/containerGroups" {
       }
       "Microsoft.DataFactory/factories" {
       }
       "Microsoft.DesktopVirtualization/applicationgroups" {
            ($object.properties).PSObject.properties.remove('objectId')
       }
       "Microsoft.DocumentDB/databaseAccounts" {
       }
       "Microsoft.EventHub" {
       }
       "Microsoft.EventHub/clusters" {
       }
       "Microsoft.EventHub/Namespaces" {
       }
       "Microsoft.EventHub/Namespaces/PrivateEndpointConnections" {
       }
       "Microsoft.HybridCompute/machines" {
            ($object.identity).PSObject.properties.remove('principalId')
       }
       "microsoft.insights/components" {
       }
       "Microsoft.Insights/scheduledqueryrules" {
            ($object).PSObject.properties.remove('systemData')
       }
       "Microsoft.Insights/dataCollectionRules" {
            ($object.properties).PSObject.properties.remove('immutableId')  
            ($object.properties).PSObject.properties.remove('provisioningState')       
       }       
       "Microsoft.Insights/workbooks" {
       }
       "Microsoft.KeyVault/vaults" {
            $object.PSObject.properties.remove('systemData')
       }
       "Microsoft.Logic/workflows" {
            ($object.properties).PSObject.properties.remove('endpointsConfiguration')
            ($object.properties).PSObject.properties.remove('version')
       }
       "Microsoft.MachineLearningServices/workspaces" {
       }
       "Microsoft.Network/loadBalancers" {
       }
       "Microsoft.Network/networkInterfaces" {
            ($object.properties).PSObject.properties.remove('macAddress')

            # IP Configurations must exist in a Network interface for deployment
            # Clean inplace
            # duplicate with export to aid auditing
            For ($i=0; $i -le ($object.properties.ipConfigurations.Count -1); $i++) {
                ($object.properties.ipConfigurations[$i].properties).PSObject.properties.remove('provisioningState')
                ($object.properties.ipConfigurations[$i]).PSObject.properties.remove('etag')
           }
            
       }
       "Microsoft.Network/loadBalancers/inboundNatRules" {
       }
       "Microsoft.Network/networkInterfaces/ipConfigurations" {
       }
       "Microsoft.Network/networkProfiles" {
            # Clean inplace
            For ($i=0; $i -le ($object.properties.containerNetworkInterfaceConfigurations.Count -1); $i++) {
                ($object.properties.containerNetworkInterfaceConfigurations[$i].properties).PSObject.properties.remove('provisioningState')
                ($object.properties.containerNetworkInterfaceConfigurations[$i]).PSObject.properties.remove('etag')
            }
            For ($i=0; $i -le ($object.properties.containerNetworkInterfaces.Count -1); $i++) {
                ($object.properties.containerNetworkInterfaces[$i].properties).PSObject.properties.remove('provisioningState')
                ($object.properties.containerNetworkInterfaces[$i]).PSObject.properties.remove('etag')
            }
       }
       "Microsoft.Network/networkSecurityGroups" {
            # Handle each security rule as separate objects
            For ($i=0; $i -le ($object.properties.securityRules.Count -1); $i++) {
                 ($object.properties.SecurityRules[$i]).PSObject.properties.remove('etag')
                 ($object.properties.SecurityRules[$i].properties).PSObject.properties.remove('provisioningState')
            }
            # Handle each default security rules - must be part of the nsg
            # questions if some objects (like nsg rules shouldnt be separated for deployment
            # Just clean the rules in place
            For ($i=0; $i -le ($object.properties.defaultSecurityRules.Count -1); $i++) {
                 ($object.properties.defaultSecurityRules[$i]).PSObject.properties.remove('etag')
                 ($object.properties.defaultSecurityRules[$i].properties).PSObject.properties.remove('provisioningState')
            }
       }
       "Microsoft.Network/networkSecurityGroups/defaultSecurityRules" {
       }
       "Microsoft.Network/networkSecurityGroups/securityRules" {
       }

       # Sentinel
       "Microsoft.OperationsManagement/solutions" {
            if ($object.plan.product -eq "OMSGallery/SecurityInsights"){
            }
       }
       "Microsoft.Network/privateEndpoints" {
            # Handle each default service connections - must be part of the private endpoint
            # Just clean the rules in place
            For ($i=0; $i -le ($object.properties.privateLinkServiceConnections.Count -1); $i++) {
                 ($object.properties.privateLinkServiceConnections[$i]).PSObject.properties.remove('etag')
                 ($object.properties.privateLinkServiceConnections[$i].properties).PSObject.properties.remove('provisioningState')
            }
       }
       "Microsoft.Network/privateDnsZones" {
       }
       "Microsoft.Network/publicIPAddresses" {
            ($object.properties).PSObject.properties.remove('ipAddress')
       }
       "Microsoft.Network/routeTables" {
       }
       "Microsoft.Network/virtualNetworks" {
       }
       "Microsoft.Network/virtualNetworks/subnets" {
            ($object.properties).PSObject.properties.remove('provisioningState')
       }
       "Microsoft.Network/virtualNetworks/virtualNetworkPeerings" {
            ($object.properties).PSObject.properties.remove('provisioningState')
            ($object.properties).PSObject.properties.remove('resourceGuid')
       }
       "Microsoft.OperationsManagement/solutions" {
            ($object.properties).PSObject.properties.remove('provisioningState')
            ($object.properties).PSObject.properties.remove('creationTime')
            ($object.properties).PSObject.properties.remove('lastModifiedTime')
       }
       "Microsoft.OperationalInsights/workspaces" {
            ($object.properties).PSObject.properties.remove('provisioningState')
            ($object.properties).PSObject.properties.remove('createdDate')
            ($object.properties).PSObject.properties.remove('modifiedDate')
            ($object.properties.sku).PSObject.properties.remove('lastSkuUpdate')
            ($object.properties.workspaceCapping).PSObject.properties.remove('quotaNextResetTime')
       }
       "Microsoft.Portal/dashboards" {

       }
       "Microsoft.RecoveryServices/vaults" {

         write-debug " Microsoft.RecoveryServices/vaults clean routine"

            try{
               ($object.properties).PSObject.properties.remove('provisioningState')
            }
            catch{
                write-warning "clean object provisioningState failed"
            }

            try{
               ($object.identity).PSObject.properties.remove('tenantId')
            }
            catch{
                write-warning "clean object tenantId failed"
            }

            try{
               ($object.identity).PSObject.properties.remove('principalId')
            }
            catch{
                write-warning "clean object principalId failed"
            }
            
            write-debug " Microsoft.RecoveryServices/vaults clean complete"


       }


       "Microsoft.Resources/resourceGroups" {
       }
       "Microsoft.SecurityInsights/alertRules" {
       }
       "Microsoft.Storage/storageAccounts" {
            ($object.properties).PSObject.properties.remove('secondaryLocation')
            ($object.properties).PSObject.properties.remove('statusOfSecondary')
       }
       "Microsoft.SqlVirtualMachine/sqlVirtualMachines" {
       }
       "Microsoft.Web/connections" {
       }

    }

if ($object ){ return $object }else{ return $null}



}