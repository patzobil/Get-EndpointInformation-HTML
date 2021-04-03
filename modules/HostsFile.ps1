#region HostsFileInfo
#*************************************** Hosts File Info ***************************************
$hostFile = Get-Content -Path "$env:windir\System32\drivers\etc\hosts"
$hostsInfo = @()
foreach($line in $hostFile){
    $h = "" | Select-Object IPAddress,Hostname,Comments
    if($line -like '#*' -or $line -eq ''){continue}
    $entrytext = $line.ToString().Trim()
    [System.Collections.ArrayList]$entryArray = $entrytext -split "\s+"
    $IPAddress = $entryArray[0]
    $HostName = $entryArray[1]
    if ( $entryArray.Count -ge 2 ) {
        $entryArray.RemoveRange(0,2)
        $Comments = [string]$entryArray
    }
    $h.IPAddress = $IPAddress
    $h.HostName = $HostName
    $h.Comments = $Comments
    $hostsInfo += $h
}

$hostsInfo = $hostsInfo | ConvertTo-Html -Fragment -PreContent "<h2 id='hostsInfo'>Hosts File</h2>"
$hostsInfo = $hostsInfo -replace '<table>','<div class="container"><table id="hostsTable" class="table table-dark table-hover table-striped table-bordered">'
$hostsInfo = $hostsInfo -replace '<tr><th>','<thead><tr><th>'
$hostsInfo = $hostsInfo -replace '</th></tr>','</th></tr></thead><tbody>'
$hostsInfo = $hostsInfo -replace '</table>','</tbody></table></div>'
#! ************************************** Hosts File Info ***************************************
#endregion