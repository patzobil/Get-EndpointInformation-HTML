#* Progress Bar
. .\functions\Write-Progress.ps1
$script:steps = ([System.Management.Automation.PsParser]::Tokenize((Get-Content "$PSScriptRoot\$($MyInvocation.MyCommand.Name)"), [ref]$null) | Where-Object { $_.Type -eq 'Command' -and $_.Content -eq 'Write-ProgressHelper' }).Count
$stepCounter = 0

#* Get Date and Time
Write-ProgressHelper "Getting Date & Time" -StepNumber ($stepCounter++)
. .\modules\DateTime.ps1

#region FilePaths
#* ************************************** PATHS & LOGS ***************************************
$exportLocation = "$env:USERPROFILE\Desktop\exports"
$cssBaseFolder = "$PSScriptRoot\css"
$cssFinalFolder = "$exportLocation\css"
$cssBaseLocation = "$cssBaseFolder\style.css"
$cssFinalLocation = "$cssFinalFolder\style.css"
$logFileFolder = "$PSScriptRoot\logs"
$logFilePath = "$logFileFolder\$env:computername-$fileDate-Log.log"
$HTMLExportLocation = "$exportLocation\$env:computername-$fileDate-Report.html"
# $ZIPArchive = "$exportLocation\$env:computername-$fileDate-Report.zip"

#* Try to start a log file
try {
    Out-File $logFilePath -ErrorAction Stop
    $logging = 1
    Write-ProgressHelper "Starting a Log: $logFilePath" -StepNumber ($stepCounter++)
    . .\functions\Write-Log.ps1
    Write-Log -LogText "****************************START****************************"
}catch { 
    Write-Output "Log will not be kept, as an error occured while creating the log file in $logFileFolder"
    $logging = 0
    . .\functions\Write-Log.ps1
}

#* Check the exportLocation exists, if not create it before proceeding!
if (-not(Test-Path $exportLocation)){
    Write-Log -LogType W -LogText "Directory does not exist : $exportLocation"
    try { 
        New-Item $exportLocation -ItemType Directory -Force -ErrorAction Stop | Out-Null
        Write-Log -LogText "Directory Created : $exportLocation"
    }catch { 
        Write-Log -LogType E -LogText ($_.Exception).ToString()
        Write-Output "Directory could not be created.... Stopping script"
        Write-Log -LogText "****************************END****************************"
        exit
    }
}
#! ************************************** PATHS & LOGS ***************************************
#endregion

#region MODULES
#* ************************************** MODULES ***************************************
Write-ProgressHelper "Getting Computer Name" -StepNumber ($stepCounter++)
. .\modules\Hostname.ps1
Write-Log -LogText "Getting Computer Name"

Write-ProgressHelper "Getting Last Boot Time" -StepNumber ($stepCounter++)
. .\modules\LastBootInfo.ps1
Write-Log -LogText "Getting Last Boot Time"

Write-ProgressHelper "Getting OS Info" -StepNumber ($stepCounter++)
. .\modules\OSInfo.ps1
Write-Log -LogText "Getting OS Info"

Write-ProgressHelper "Getting PowerShell Version Table" -StepNumber ($stepCounter++)
. .\modules\PSVersionTable.ps1
Write-Log -LogText "Getting PowerShell Version Table"

Write-ProgressHelper "Getting Chipset Info" -StepNumber ($stepCounter++)
. .\modules\ChipsetInfo.ps1
Write-Log -LogText "Getting Chipset Info"

Write-ProgressHelper "Getting RAM Info" -StepNumber ($stepCounter++)
. .\modules\RAMInfo.ps1
Write-Log -LogText "Getting RAM Info"

Write-ProgressHelper "Getting BIOS Info" -StepNumber ($stepCounter++)
. .\modules\BIOSInfo.ps1
Write-Log -LogText "Getting BIOS Info"

Write-ProgressHelper "Getting Disk Info" -StepNumber ($stepCounter++)
. .\modules\LogicalDisks.ps1
Write-Log -LogText "Getting Disk Info"

Write-ProgressHelper "Getting NIC Info" -StepNumber ($stepCounter++)
. .\modules\NetworkAdapters.ps1
Write-Log -LogText "Getting NIC Info"

Write-ProgressHelper "Getting Hosts File Info" -StepNumber ($stepCounter++)
. .\modules\HostsFile.ps1
Write-Log -LogText "Getting Hosts File Info"

Write-ProgressHelper "Getting Application Info" -StepNumber ($stepCounter++)
. .\modules\ApplicationsInfo.ps1
Write-Log -LogText "Getting Application Info"

Write-ProgressHelper "Getting Windows Services Info" -StepNumber ($stepCounter++)
. .\modules\WindowsServices.ps1
Write-Log -LogText "Getting Windows Services Info"
#! ************************************** MODULES ***************************************
#endregion

#region Get-PublicIP
#* ************************************** Get-PublicIP Function ***************************************
Write-ProgressHelper "Getting Public IP Address" -StepNumber ($stepCounter++)
. .\functions\Get-PublicIP.ps1
$publicIP = Get-PublicIP
#! ************************************** Get-PublicIP Function ***************************************
#endregion

#region HTML tags
#* ************************************** HTML TAGS ***************************************
Write-ProgressHelper "Creating HTML Head" -StepNumber ($stepCounter++)
. .\html\HTMLHead.ps1
Write-ProgressHelper "Creating the Header" -StepNumber ($stepCounter++)
. .\html\TopHeader.ps1
Write-ProgressHelper "Creating the Side Navigation Bar" -StepNumber ($stepCounter++)
. .\html\SideNavigationBar.ps1
Write-ProgressHelper "Creating SearchForms" -StepNumber ($stepCounter++)
. .\html\SearchForms.ps1
Write-ProgressHelper "Writing Table Sorting Function" -StepNumber ($stepCounter++)
. .\html\SortTables.ps1
Write-ProgressHelper "Adding a BackToTop Button" -StepNumber ($stepCounter++)
. .\html\TopButton.ps1
#! ************************************** HTML TAGS ***************************************
#endregion

#region BuildHTML
#* ************************************** BUILD HTML ***************************************
Write-ProgressHelper "Building fragments into one HTML" -StepNumber ($stepCounter++)
Write-Log -LogText "Building fragments into one HTML"
. .\html\HTMLBuild.ps1
#! ************************************** BUILD HTML ***************************************
#endregion

#region ExportHTML
#* ************************************** EXPORT HTML ***************************************
Write-ProgressHelper "Exporting HTML file to $exportLocation..." -StepNumber ($stepCounter++)
Write-Log -LogText "Exporting HTML file to $exportLocation..."
. .\html\HTMLExport.ps1
#! ************************************** EXPORT HTML ***************************************
#endregion

#* OPEN HTML FILE ON BROWSER AFTER COLLECTION
Write-Log -LogText "Opening HTML Export in Default Browser"
Invoke-Item $HTMLExportLocation

#* ************************************** COMPRESS / ARCHIVE ***************************************
# Compress-Archive $HTMLExportLocation -DestinationPath $ZIPArchive
#! ************************************** COMPRESS / ARCHIVE ***************************************

#* ************************************** SHOW WIN10 NOTIFICATION ***************************************
. .\functions\Show-Notification.ps1
try {
    Show-Notification "Script Get-PCInfo-HTML complete, please find the exported file at $HTMLExportLocation"
    Write-Log -LogText "Script Complete Windows 10 Notification Sent"
}
catch {
    
}
#! ************************************** SHOW WIN10 NOTIFICATION ***************************************

Write-Log -LogText "****************************END****************************"