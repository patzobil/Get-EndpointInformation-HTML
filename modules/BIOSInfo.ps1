#region BIOSInfo
#* ************************************** BIOS Info ***************************************
$BiosInfo = Get-CimInstance -ClassName Win32_BIOS | ConvertTo-Html -Fragment -As List -Property SMBIOSBIOSVersion,Manufacturer,Name,SerialNumber -PreContent "<h2 id='biosInfo'>BIOS Information</h2>"
$BiosInfo = $BiosInfo -replace '<table>','<div class="container"><table id="biosTable" class="table table-dark table-hover table-striped table-bordered"><tbody>'
$BiosInfo = $BiosInfo -replace '</table>','</tbody></table></div>'
#! ************************************** BIOS Info ***************************************
#endregion