function Get-PublicIP {
    [CmdletBinding()]
    param (
        [string]$uri = 'https://api.ipify.org'
    )
    try {
        Write-Log -LogText "Retrieving Public IP Address from $uri"
        $invokeRestMethodSplat = @{
            Uri         = $uri
            ErrorAction = 'Stop'
        }
        $publicIP = Invoke-RestMethod @invokeRestMethodSplat
    }
    catch {
        Write-Log -LogType E -LogText "Could not retrieve Public IP Address from: $uri"
        Write-Log -LogType E -LogText $_.Exception
    }
    return $publicIP
}
$publicIP = Get-PublicIP