function Set-IdSubscription(){
param(
    [OutputType([hashtable])]
    [parameter( Mandatory = $true)]
    [string]$Subscription,
    [parameter( Mandatory = $true)]
    [string]$IdString
)

<#
  Function: Set-IdSubscription

  Purpose:  Changes the subscription of the Id Property with an Azure object.  

  Parameters:   -object        = The PowerShell custom object / Azure object to be modified
                -subscription  = The new subscription gui to deploy to


  Example:  
    
          $object = Set-IdSubscription -object $object -Subscription "2be53ae5-6e46-47df-beb9-6f3a795387b8"
#> 
    
    
  #Get Id property and split by '/' subscription
    $IdArray = $IdString.split('/')
     
  If ($IdArray[1] -eq 'subscriptions'){
    # substitute the subscription id with the new version
    $IdArray[2] = $Subscription

    #reconstruct the Id
    $id = ""
        for ($i=1;$i -lt $IdArray.Count; $i++) {
        $id = "$($id)/$($IdArray[$i])" 
    }


   $IdString = $id


  }
     $IdString
 #    }
}