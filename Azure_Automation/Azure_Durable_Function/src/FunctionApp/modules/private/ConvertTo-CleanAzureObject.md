### Function:  Convertto-CleanAzureObject

### Purpose:

Parsing function to remove read only properties from an object so the exported defintion may be used for redeployment.  This function is called by the Get-AzureObject function.

### Parameters:

-azobject      = The PowerShell object representation of an Azure object.

### Example:

```powershell
 $object = Convertto-CleanAzureObject `-azobject  $object
```

### General Usage:

This module is only used for cleaning results from the Get-AzureObject function.
If you have problems deploying objects because of Read Only properties, this is the location to add / alter the list of properties to be deleted. 