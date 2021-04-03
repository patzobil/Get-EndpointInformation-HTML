#region ChipsetInfo
#* ************************************** Chipset Info ***************************************
$ProcessorInfo = Get-CimInstance -ClassName Win32_Processor | ConvertTo-Html -Fragment -As List -Property DeviceID,Name,Caption,@{l="Max Clock Speed";e={$_.MaxClockSpeed -join " Mhz"}},SocketDesignation,Manufacturer -PreContent "<h2 id='CPUInfo'>Processor Information</h2>"
$ProcessorInfo = $ProcessorInfo -replace '<table>','<div class="container"><table id="chipsetTable" class="table table-dark table-hover table-striped table-bordered"><tbody>'
$ProcessorInfo = $ProcessorInfo -replace '</table>','</tbody></table></div>'
#! ************************************** Chipset Info ***************************************
#endregion