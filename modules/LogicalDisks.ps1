#region LogicalDiskInfo
#* ************************************** Disk/Drive Details ***************************************
$diskArray = @()
$diskInfo = Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object DeviceID,DriveType,ProviderName,VolumeName,Size,FreeSpace

for ($i = 0; $i -lt $diskInfo.Count; $i++) {
    $d = "" | Select-Object MountLetter,VolumeName,DriveType,Path,Size,FreeSpace
    $d.MountLetter = $diskInfo.DeviceID[$i]
    $d.Path = $diskInfo.ProviderName[$i]
    $d.VolumeName = $diskInfo.VolumeName[$i]
    $d.Size = "$([math]::Round($diskInfo.Size[$i]/1GB,2)) GB"
    $d.FreeSpace = "$([math]::Round($diskInfo.FreeSpace[$i]/1GB,2)) GB"
    switch ($diskInfo.DriveType[$i]) {
        1 { $d.DriveType = "No Root Directory" }
        2 { $d.DriveType = "Removable Drive" }
        3 { $d.DriveType = "Local Hard Drive" }
        4 { $d.DriveType = "Network Drive" }
        5 { $d.DriveType = "Compact Disk" }
        6 { $d.DriveType = "RAM Disk" }
        Default {}
    }
    $diskArray += $d
}

$diskArray = $diskArray | ConvertTo-Html -Fragment -PreContent "<h2 id='diskInfo'>Disk Information</h2>"
$diskArray = $diskArray -replace '<table>','<div class="container"><table id="diskTable" class="table table-dark table-hover table-striped table-bordered">'
$diskArray = $diskArray -replace '<tr><th>','<thead><tr><th>'
$diskArray = $diskArray -replace '</th></tr>','</th></tr></thead><tbody>'
$diskArray = $diskArray -replace '</table>','</tbody></table></div>'
#! ************************************** Disk/Drive Details ***************************************
#endregion