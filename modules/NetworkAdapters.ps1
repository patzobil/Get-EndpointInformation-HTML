#region NetworkAdaptersInfo
#*************************************** Network Adapters Info ***************************************
$NetAdapterInfo = Get-CimInstance -classname Win32_NetworkAdapterConfiguration | Sort-Object InterfaceIndex |`
 ConvertTo-Html -Fragment -Property InterfaceIndex,Name,Description,DHCPEnabled,MACAddress,DNSDomain,DNSHostName,`
 @{l="IP Address";e={$_.IPAddress[0] -join " "}},@{l="Subnet Mask";e={$_.IPSubnet[0] -join " "}},`
 @{l="Default Gateway";e={$_.DefaultIPGateway[0] -join " "}} -PreContent "<h2 id='NICInfo'>Network Adapters Information</h2>"
 $NetAdapterInfo = $NetAdapterInfo -replace '<table>','<div class="container"><table id="nicTable" class="table table-dark table-hover table-striped table-bordered">'
$NetAdapterInfo = $NetAdapterInfo -replace '<tr><th>','<thead><tr><th>'
$NetAdapterInfo = $NetAdapterInfo -replace '</th></tr>','</th></tr></thead><tbody>'
$NetAdapterInfo = $NetAdapterInfo -replace '</table>','</tbody></table></div>'
#! ************************************** Network Adapters Info ***************************************
#endregion