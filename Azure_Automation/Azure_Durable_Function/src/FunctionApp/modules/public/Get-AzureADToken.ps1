function Get-AzureADToken {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, HelpMessage = "The resource identifier for which the token is requested.")]
        [string]$resource,

        [Parameter(Mandatory = $false, HelpMessage = "The API version to use for the request.")]
        [string]$apiVersion = "2019-08-01",

        [Parameter(Mandatory = $true, HelpMessage = "The client ID of the user-assigned managed identity.")]
        [string]$clientId
    )

    # Load the necessary .NET assemblies
    Add-Type -AssemblyName 'System.Net.Http'
    Add-Type -AssemblyName 'System.Net'
    Add-Type -AssemblyName 'System.Net.Primitives'

    try {
        # Construct the URL for the request
        $url = "$($env:IDENTITY_ENDPOINT)?resource=$($resource)&client_id=$($clientId)&api-version=$($apiVersion)"
        Write-Debug "Constructed URL: $url"

        # Create the headers for the request
        $headers = @{
            "Metadata" = "True"
            "X-IDENTITY-HEADER" = $env:IDENTITY_HEADER
        }

        Write-Debug "Calling Azure AD to obtain the token..."

        # Make the GET request to obtain the token
        $tokenResponse = Invoke-RestMethod -Method 'GET' -Headers $headers -Uri $url -DisableKeepAlive

        if (-not $tokenResponse -or -not $tokenResponse.access_token) {
            throw "No access token returned in the response."
        }

        $accessToken = $tokenResponse.access_token
        Write-Debug "Access token successfully obtained."

        # Return the access token
        return $accessToken
    } catch {
        Write-Error "Failed to obtain Azure AD token: $_"
        throw $_  # Re-throw the error for further handling if necessary
    }
}
