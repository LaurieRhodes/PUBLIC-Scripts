# Managed Identity Configuration

## Required Permissions

The function requires two application permissions to access Microsoft Defender APIs:

| Permission | Purpose | Description |
|------------|---------|-------------|
| Vulnerability.Read.All | Read vulnerability data | Allows reading vulnerability information from Defender |
| Machine.Read.All | Read machine data | Allows listing and accessing machine information |

## Configuration Steps

### 1. Create User Assigned Managed Identity

1. Navigate to **Managed Identities** in Azure Portal
2. Click **Create**
3. Configure:
   - Resource Group
   - Region
   - Name (e.g., 'Defender-Vulnerability-Reader')
4. Click **Review + Create**

### 2. Assign Defender Roles

The following PowerShell script configures necessary permissions:

```powershell
# Install and import Azure AD module
Install-Module -Name AzureAD -Force -AllowClobber
Import-Module AzureAD
Connect-AzureAD

# Configure variables
$MIGuid = '<your-managed-identity-object-id>'
$MDEAppId = 'fc780465-2017-40d4-a0c5-307022471b92'  # Defender Enterprise Application ID

# Get Managed Identity service principal
$MI = Get-AzureADServicePrincipal -ObjectId $MIGuid

# Get Defender service principal
$MDEServicePrincipal = Get-AzureADServicePrincipal -Filter "appId eq '$MDEAppId'"

# Assign Vulnerability.Read.All
$VulnPermission = 'Vulnerability.Read.All'
$VulnRole = $MDEServicePrincipal.AppRoles | 
    Where-Object {$_.Value -eq $VulnPermission -and $_.AllowedMemberTypes -contains 'Application'}
New-AzureAdServiceAppRoleAssignment -ObjectId $MI.ObjectId `
    -PrincipalId $MI.ObjectId `
    -ResourceId $MDEServicePrincipal.ObjectId `
    -Id $VulnRole.Id

# Assign Machine.Read.All
$MachinePermission = 'Machine.Read.All'
$MachineRole = $MDEServicePrincipal.AppRoles |
    Where-Object {$_.Value -eq $MachinePermission -and $_.AllowedMemberTypes -contains 'Application'}
New-AzureAdServiceAppRoleAssignment -ObjectId $MI.ObjectId `
    -PrincipalId $MI.ObjectId `
    -ResourceId $MDEServicePrincipal.ObjectId `
    -Id $MachineRole.Id
```

### 3. Verify Configuration

1. Check role assignments in Azure Portal:
   - Navigate to Enterprise Applications
   - Search for "Windows Defender ATP"
   - Check Users and groups
   - Verify managed identity has both roles

2. Test permissions using Azure Cloud Shell:
```powershell
# Get managed identity details
Get-AzureADServicePrincipal -ObjectId $MIGuid

# List role assignments
Get-AzureADServiceAppRoleAssignment -ObjectId $MDEServicePrincipal.ObjectId |
    Where-Object {$_.PrincipalId -eq $MI.ObjectId}
```

## Troubleshooting

Common issues and solutions:

1. **Permission Assignment Fails**
   - Verify Azure AD permissions
   - Check for typos in AppIds
   - Ensure proper Azure AD role

2. **Missing Permissions**
   - Re-run permission script
   - Check for error messages
   - Verify service principal exists