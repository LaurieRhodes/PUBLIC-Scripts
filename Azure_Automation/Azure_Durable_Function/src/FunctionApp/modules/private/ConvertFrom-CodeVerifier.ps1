function ConvertFrom-CodeVerifier {

    [OutputType([String])]
    param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True)]
        [String]$codeVerifier,
        [ValidateSet(
            "plain",
            "s256"
        )]$Method = "s256"
    )

<#
  Function:  ConvertFrom-CodeVerifier

  Purpose:  Determines code-challenge from code-verifier for Azure Authentication

  Example:  
    
           ConvertFrom-CodeVerifier -Method s256 -codeVerifier XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

  Author  https://gist.github.com/watahani
#>
    
    process {
        switch($Method){
            "plain" {
                return $codeVerifier
            }
            "s256" {
                # https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-filehash?view=powershell-7
                $stringAsStream = [System.IO.MemoryStream]::new()
                $writer = [System.IO.StreamWriter]::new($stringAsStream)
                $writer.write($codeVerifier)
                $writer.Flush()
                $stringAsStream.Position = 0
                $hash = Get-FileHash -InputStream $stringAsStream | Select-Object Hash
                $hex = $hash.Hash
        
                $bytes = [byte[]]::new($hex.Length / 2)
                    
                For($i=0; $i -lt $hex.Length; $i+=2){
                    $bytes[$i/2] = [convert]::ToByte($hex.Substring($i, 2), 16)
                }
                $b64enc = [Convert]::ToBase64String($bytes)
                $b64url = $b64enc.TrimEnd('=').Replace('+', '-').Replace('/', '_')
                return $b64url     
            }
            default {
                throw "not supported method: $Method"
            }
        }
    }
}
 