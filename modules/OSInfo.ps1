#region OSInfo
#* ************************************** OS Info ***************************************
$OSinfo = Get-CimInstance -Class Win32_OperatingSystem |`
 ConvertTo-Html -As List -Property Version,Caption,BuildNumber,Manufacturer,LastBootUpTime -Fragment -PreContent "<h2 id='OSInfo'>Operating System Information</h2>"
 $OSinfo = $OSinfo -replace '<table>','<div class="container"><table id="osTable" class="table table-dark table-hover table-striped table-bordered"><tbody>'
#  $OSinfo = $OSinfo -replace '<tr><th>','<thead><tr><th>'
#  $OSinfo = $OSinfo -replace '</th></tr>','</th></tr></thead><tbody>'
 $OSinfo = $OSinfo -replace '</table>','</tbody></table></div>'
 #! ************************************** OS Info ***************************************
#endregion