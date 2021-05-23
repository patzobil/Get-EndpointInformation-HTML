#region lastBootTimeInfo
#* ************************************** Last Boot Time ***************************************
$OSLastBoot = Get-CimInstance -Class Win32_OperatingSystem | Select-Object LastBootUpTime
$OSLastBootDate = $OSLastBoot.LastBootUpTime.ToShortDateString()
$OSLastBootTime = $OSLastBoot.LastBootUpTime.ToShortTimeString()
$OSLastBootJoin = "$OSLastBootDate $OSLastBootTime"

if (($OSLastBootJoin -match "AM") -or ($OSLastBootJoin -match "PM") ) {
    try {
        $bootdate = ([datetime]::ParseExact($OSLastBootJoin,'M/d/yyyy h:mm tt', $null)).ToString("dd-MMM-yyyy hh:mm tt")
        $bootInfo = "<p class=lastBoot>Last Boot Time: $bootdate</p>"
    }
    catch {
        # Write-Output $_.Exception
        Write-Log -LogType E -LogText "Could not parse date"
    }
}else {
    try {
        $bootdate = ([datetime]::ParseExact($OSLastBootJoin,'d/M/yyyy h:mm', $null)).ToString("dd-MMM-yyyy hh:mm tt")
        $bootInfo = "<p class=lastBoot>Last Boot Time: $bootdate</p>"
    }
    catch {
        # Write-Output $_.Exception
        Write-Log -LogType E -LogText "Could not parse date"
    }
}
#! ************************************** Last Boot Time ***************************************
#endregion