@{
    # For latest supported version, go to 'https://www.powershellgallery.com/packages/Az'. 
    # To use the Az module in your function app, please uncomment the line below.

   # 'Az' = '10.*' - Dont want to load ALL Azure modules

   # AzTable - Required for managing and querying Azure Storage Tables
   'AzTable' = '2.*'

   # Az.OperationalInsights - Enables querying Azure Monitor and Log Analytics
   'Az.OperationalInsights' = '3.*'

   # Az.Resources - Used for resource management operations in Azure
   'Az.Resources' = '5.*'

   # Az.Storage - Required for managing Azure Storage accounts and blobs
   'Az.Storage' = '5.*'


   'Az.Accounts' = '3.*' 

   'AzureFunctions.PowerShell.Durable.SDK' = '1.*'
}