#region RAMInfo
#* ************************************** RAM Info ***************************************
$RAMInfo = @()
$RAMDevices = @()
$RAMArrayInfo = @()

$d = "" | Select-Object DIMMSlots,PopulatedSlots
$colSlots = Get-WmiObject -Class "win32_PhysicalMemoryArray" 
$counter=0
Foreach ($objSlot In $colSlots){
    #  "Total Number of DIMM Slots: " + $objSlot.MemoryDevices
     $counter ++
}
$d.DIMMSlots = $colSlots.MemoryDevices
$d.PopulatedSlots = $counter
$RAMArrayInfo += $d
# $RAMArrayInfo = $RAMArrayInfo | Format-List
$RAMArrayInfo = $RAMArrayInfo | ConvertTo-Html -Fragment -As List -PreContent "<h2 id='RAMInfo'>RAM Information</h2>"
$RAMArrayInfo = $RAMArrayInfo -replace '<table>','<div class="container"><table id="RAMTable" class="table table-dark table-hover table-striped table-bordered"><tbody>'
$RAMArrayInfo = $RAMArrayInfo -replace '</table>','</tbody></table></div>'

$RAMDevices = Get-CimInstance -Class Win32_PhysicalMemory  | ConvertTo-Html -Fragment -As Table `
 -Property BankLabel, Capacity, DeviceLocator, PartNumber, SerialNumber, PositionInRow, `
 @{l="Configured Clock Speed";e={$_.ConfiguredClockSpeed -join " Mhz"}}, `
 @{l="Clock Speed";e={$_.Speed -join " Mhz"}}, Tag

$RAMDevices = $RAMDevices -replace '<table>','<div class="container"><table id="RAMTable" class="table table-dark table-hover table-striped table-bordered"><tbody>'
$RAMDevices = $RAMDevices -replace '<tr><th>','<thead><tr><th>'
$RAMDevices = $RAMDevices -replace '</th></tr>','</th></tr></thead><tbody>'
$RAMDevices = $RAMDevices -replace '</table>','</tbody></table></div>'

$RAMInfo += $RAMArrayInfo
$RAMInfo += $RAMDevices


#! ************************************** RAM Info ***************************************
#endregion
<# 
Get-WmiObject -Class Win32_PhysicalMemory | ft BankLabel, Capacity, DeviceLocator, PartNumber, SerialNumber, PositionInRow, @{l="Configured Clock Speed";e={$_.ConfiguredClockSpeed -join "Mhz"}} ,@{l="Clock Speed";e={$_.Speed -join "Mhz"}}, Tag

$strComputer = Read-Host "Enter Computer Name"
$colSlots = Get-WmiObject -Class "win32_PhysicalMemoryArray"
$colRAM = Get-WmiObject -Class "win32_PhysicalMemory"

$counter=0
Foreach ($objSlot In $colSlots){
     "Total Number of DIMM Slots: " + $objSlot.MemoryDevices
     $counter ++

}
Write-Host "Total Populated DIMM Slots: $counter"

Foreach ($objRAM In $colRAM) {
     "Memory Installed: " + $objRAM.DeviceLocator
     "Memory Size: " + ($objRAM.Capacity / 1GB) + " GB"
} #>