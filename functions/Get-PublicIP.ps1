#region Get-PublicIPFunction
#* ************************************** Get-PublicIP Function ***************************************
function Get-PublicIP {
    [CmdletBinding()]
    param (
    )
    $uri = 'https://api.ipify.org'
    Write-Verbose -Message "Pulling public IP from $uri"
    try {
        $invokeRestMethodSplat = @{
            Uri         = $uri
            ErrorAction = 'Stop'
        }
        $publicIP = Invoke-RestMethod @invokeRestMethodSplat
    }
    catch {
        Write-Error $_
    }
 
    return $publicIP
}
$publicIP = Get-PublicIP
#! ************************************** Get-PublicIP Function ***************************************
#endregion