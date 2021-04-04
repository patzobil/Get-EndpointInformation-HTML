#region ApplicationsInfo
#* ************************************** Installed Applications Info ***************************************
$AppInfo = @()
$w = Get-CimInstance -ClassName Win32_Product | Sort-Object Name | Select-Object Name,Vendor,Version,InstallDate 
# $r = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, Publisher, DisplayVersion, InstallDate

for ($i = 0; $i -lt $w.Count; $i++) {
    $t = "" | Select-Object Name,Vendor, Version, InstallDate
    if($w.Name[$i]){
        # $AppInfo += @{'Name' = $w.Name[$i];'Vendor' = $w.Vendor[$i];'Version' = $w.Version[$i];'Install Date' = $w.InstallDate[$i] }
        $t.Name = $w.Name[$i]
        $t.Vendor = $w.Vendor[$i]
        $t.Version = $w.Version[$i]
        $dateString = [datetime]::parseexact($w.InstallDate[$i], 'yyyyMMdd', $null)
        $t.InstallDate = $dateString.ToString('dd-MMM-yyyy')
        $AppInfo += $t
    }
}

<# for ($j = 0; $j -lt $r.Count; $j++) {
    $g = "" | Select-Object Name,Vendor, Version, InstallDate
    if($r.DisplayName[$j]){
        # $AppInfo += @{'Name' = ($r.DisplayName[$j]).ToString();'Vendor' = $r.Publisher[$j];'Version' = $r.DisplayVersion[$j];'Install Date' = $r.InstallDate[$j]}
        $g.Name = $r.DisplayName[$j]
        $g.Vendor = $r.Publisher[$j]
        $g.Version = $r.DisplayVersion[$j]
        if($r.InstallDate[$j]){
            $dateString = [datetime]::parseexact($r.InstallDate[$j], 'yyyyMMdd', $null)
            $g.InstallDate = $dateString.ToString('dd-MMM-yyyy')
        }else {
            $g.InstallDate = $r.InstallDate[$j]
        }
        $AppInfo += $g
    }
}
#>
$AppInfo = $AppInfo | Sort-Object Name | ConvertTo-Html -Fragment -PreContent "<h2 id='appsInfo'>Installed Applications</h2>"
$AppInfo = $AppInfo -replace '<table>','<div class="container"><input type="text" id="applicationsInput" onkeyup="myAppsFunction()" placeholder="Search for Application Names..." title="Type in some text"></input><table id="appsTable" class="table table-dark table-hover table-striped table-bordered">'
$AppInfo = $AppInfo -replace '<tr><th>','<thead><tr><th>'
$AppInfo = $AppInfo -replace '</th></tr>','</th></tr></thead><tbody>'
$AppInfo = $AppInfo -replace '</table>','</tbody></table></div>' 
#! ************************************** Installed Applications Info ***************************************
#endregion
