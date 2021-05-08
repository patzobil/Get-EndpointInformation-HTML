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
Write-Log -LogText "Getting Computer Name"
. .\modules\Hostname.ps1

Write-ProgressHelper "Getting Last Boot Time" -StepNumber ($stepCounter++)
Write-Log -LogText "Getting Last Boot Time"
. .\modules\LastBootInfo.ps1

Write-ProgressHelper "Getting OS Info" -StepNumber ($stepCounter++)
Write-Log -LogText "Getting OS Info"
. .\modules\OSInfo.ps1

Write-ProgressHelper "Getting PowerShell Version Table" -StepNumber ($stepCounter++)
Write-Log -LogText "Getting PowerShell Version Table"
. .\modules\PSVersionTable.ps1

Write-ProgressHelper "Getting Chipset Info" -StepNumber ($stepCounter++)
Write-Log -LogText "Getting Chipset Info"
. .\modules\ChipsetInfo.ps1

Write-ProgressHelper "Getting RAM Info" -StepNumber ($stepCounter++)
Write-Log -LogText "Getting RAM Info"
. .\modules\RAMInfo.ps1

Write-ProgressHelper "Getting BIOS Info" -StepNumber ($stepCounter++)
Write-Log -LogText "Getting BIOS Info"
. .\modules\BIOSInfo.ps1

Write-ProgressHelper "Getting Disk Info" -StepNumber ($stepCounter++)
Write-Log -LogText "Getting Disk Info"
. .\modules\LogicalDisks.ps1

Write-ProgressHelper "Getting NIC Info" -StepNumber ($stepCounter++)
Write-Log -LogText "Getting NIC Info"
. .\modules\NetworkAdapters.ps1

Write-ProgressHelper "Getting Hosts File Info" -StepNumber ($stepCounter++)
Write-Log -LogText "Getting Hosts File Info"
. .\modules\HostsFile.ps1

Write-ProgressHelper "Getting Windows Services Info" -StepNumber ($stepCounter++)
Write-Log -LogText "Getting Windows Services Info"
. .\modules\WindowsServices.ps1

Write-ProgressHelper "Getting Application Info" -StepNumber ($stepCounter++)
Write-Log -LogText "Getting Application Info"
. .\modules\ApplicationsInfo.ps1
#! ************************************** MODULES ***************************************
#endregion

#region Get-PublicIP
#* ************************************** Get-PublicIP Function ***************************************
Write-ProgressHelper "Getting Public IP Address" -StepNumber ($stepCounter++)
Write-Log -LogText "Getting Public IP Address"
. .\functions\Get-PublicIP.ps1
#! ************************************** Get-PublicIP Function ***************************************
#endregion

#region HTML tags
#* ************************************** HTML TAGS ***************************************
Write-ProgressHelper "Creating HTML Head" -StepNumber ($stepCounter++)
Write-Log -LogText "Creating HTML Head"
. .\html\HTMLHead.ps1

Write-ProgressHelper "Creating the Header" -StepNumber ($stepCounter++)
Write-Log -LogText "Creating the Header"
. .\html\TopHeader.ps1

Write-ProgressHelper "Creating the Side Navigation Bar" -StepNumber ($stepCounter++)
Write-Log -LogText "Creating the Side Navigation Bar"
. .\html\SideNavigationBar.ps1

Write-ProgressHelper "Creating SearchForms" -StepNumber ($stepCounter++)
Write-Log -LogText "Creating SearchForms"
. .\html\SearchForms.ps1

Write-ProgressHelper "Writing Table Sorting Function" -StepNumber ($stepCounter++)
Write-Log -LogText "Writing Table Sorting Function"
. .\html\SortTables.ps1

Write-ProgressHelper "Adding a BackToTop Button" -StepNumber ($stepCounter++)
Write-Log -LogText "Adding a BackToTop Button"
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
Write-ProgressHelper "Opening HTML Export in Default Browser" -StepNumber ($stepCounter++)
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
catch {}
#! ************************************** SHOW WIN10 NOTIFICATION ***************************************

Write-Log -LogText "****************************END****************************"