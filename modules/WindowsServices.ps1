#region ServicesInfo
#* ************************************** Windows Services Info ***************************************
$ServicesInfo = Get-CimInstance -ClassName Win32_Service | Sort-Object DisplayName | ConvertTo-Html -Fragment -Property DisplayName,Name,State,StartMode,StartName -PreContent "<h2 id='servicesInfo'>Services Information</h2>"
$ServicesInfo = $ServicesInfo -replace '<table>','<div class="container"><input type="text" id="serviceInput" onkeyup="myServicesFunction()" placeholder="Search based Services Display Names.." title="Type in some text"></input><table id="servicesTable" class="table table-dark table-hover table-striped table-bordered">'
$ServicesInfo = $ServicesInfo -replace '<tr><th>','<thead><tr><th>'
$ServicesInfo = $ServicesInfo -replace '</th></tr>','</th></tr></thead><tbody>'
$ServicesInfo = $ServicesInfo -replace '</table>','</tbody></table></div>'
$ServicesInfo = $ServicesInfo -replace '<td>Running</td>','<td class="RunningStatus">Running</td>'
$ServicesInfo = $ServicesInfo -replace '<td>Stopped</td>','<td class="StopStatus">Stopped</td>'
#! ************************************** Windows Services Info ***************************************
#endregion