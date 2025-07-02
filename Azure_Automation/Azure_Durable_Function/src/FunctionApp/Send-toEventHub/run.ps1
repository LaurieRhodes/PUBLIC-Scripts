param($params)
<#
  Send-toEventhub

#>


<#
  Get Parameters
#>

$DebugPreference = 'Continue'

$DecodedText = [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($params))
write-debug "(Send-toEventHub) run with decoded parameters: `n $($DecodedText)"
$params = ConvertFrom-Json -inputobject $DecodedText

$EventHubNameSpace = $params.EventHubNameSpace
$EventHubName      = $params.EventHubName
$ClientId          = $params.ClientId
$data              = $params.data 

write-debug "EventHubNameSpace = $($EventHubNameSpace)"
write-debug "EventHubName  = $($EventHubName  )"
write-debug "ClientId = $($ClientId )"
write-debug "data = $($data )"

$VulnerabilityCollection = $params.data 


# Set Event Hub URI
#$URI = "https://$($EventHubNameSpace).servicebus.windows.net/$($EventHubName)/messages?timeout=60&api-version=2014-01"
$URI = "https://$($EventHubNameSpace).servicebus.windows.net/$($EventHubName)/messages?timeout=60"

<#
  Get Token for Event Hub
#>


$resourceURL = "https://eventhubs.azure.net" #The resource name to request a token for Event Hubs


# Iterate through each record
foreach ($record in $VulnerabilityCollection) {

    $token = Get-AzureADToken -resource $resourceURL -clientId $ClientId

    $headers = @{
        "Authorization" = "Bearer $($token)"
        "Content-Type" = "application/json"
    }

    # Execute the Azure REST API
    $method = "POST"

    $result = Invoke-RestMethod -Uri $URI  -Method $method -Headers $headers -Body $(Convertto-json -inputobject $record) -Verbose -SkipHeaderValidation                

   $result =  $null
}









