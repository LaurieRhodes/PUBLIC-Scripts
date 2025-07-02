# Azure Functions profile.ps1
#
# This profile.ps1 will get executed every "cold start" of your Function App.
# "cold start" occurs when:
#
# * A Function App starts up for the very first time
# * A Function App starts up after being de-allocated due to inactivity
#
# You can define helper functions, run commands, or specify environment variables
# NOTE: any variables defined that are not environment variables will get reset after the first execution

# Authenticate with Azure PowerShell using MSI.
# Remove this if you are not planning on using MSI or Azure PowerShell.
#if ($env:MSI_SECRET) {
#    Disable-AzContextAutosave -Scope Process | Out-Null
#    Connect-AzAccount -Identity
#}

# Uncomment the next line to enable legacy AzureRm alias in Azure PowerShell.
# Enable-AzureRmAlias

# You can also define functions or aliases that can be referenced in any of your PowerShell functions.
Import-Module AzureFunctions.PowerShell.Durable.SDK -ErrorAction Stop


<#
  Initialise Custom Powershell Modules
#>

# Get the path to the current script directory

$scriptDirectory = Split-Path -Parent $PsScriptRoot
Write-Information "ScriptDirectory = $($scriptDirectory)"

# Define the relative path to the modules directory
$modulesPath = Join-Path $scriptDirectory '\wwwroot\modules'
Write-Information "modulesPath = $($modulesPath)"

# Resolve the full path to the modules directory
$resolvedModulesPath = (Get-Item $modulesPath).FullName
Write-Information "resolvedModulesPath = $($resolvedModulesPath)"

# Recursively import all PowerShell modules (.psm1 files) in the modules directory
Get-ChildItem -Path $resolvedModulesPath -Filter *.psm1 -Recurse | ForEach-Object {
    Write-Information "Importing module: $($_)"
    Import-Module "$_"
}


# Load the System.Web assembly to enable UrlEncode
[Reflection.Assembly]::LoadWithPartialName("System.Web") | Out-Null