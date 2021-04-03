. .\functions\Write-Progress.ps1
$script:steps = ([System.Management.Automation.PsParser]::Tokenize((Get-Content "$PSScriptRoot\$($MyInvocation.MyCommand.Name)"), [ref]$null) | Where-Object { $_.Type -eq 'Command' -and $_.Content -eq 'Write-ProgressHelper' }).Count
$stepCounter = 0

. .\functions\Show-Notification.ps1

#region FilePaths
#* File Names and Paths
$exportLocation = "$env:USERPROFILE\Desktop\exports"
# $exportLocation = "$PSScriptRoot\exports"
$cssBaseFolder = "$PSScriptRoot\css"
$cssFinalFolder = "$exportLocation\css"

$cssBaseLocation = "$cssBaseFolder\style.css"
$cssFinalLocation= "$cssFinalFolder\style.css"
<# 
#When the exportlocation is the User's desktop the files will be created fine,`
#but if it is another folder where the user has no access then the css files won't be able to be created.

try {
    Test-Path $cssFinalLocation -ErrorAction Stop
}
catch {
    Write-Output $_.Exception
    $cssFinalLocation = $cssBaseLocation
} #>
#endregion

#* Get Date and Time
Write-ProgressHelper "Getting Date & Time" -StepNumber ($stepCounter++)
. .\modules\DateTime.ps1


# $transcriptLocation = "$env:USERPROFILE\Desktop\exports\$env:computername-$fileDate-Console Transcript.txt"
# Start-Transcript $transcriptLocation -IncludeInvocationHeader -NoClobber
# Start-Transcript $transcriptLocation -Append


#region Get-PublicIP
#* ************************************** Get-PublicIP Function ***************************************
Write-ProgressHelper "Getting Public IP Address" -StepNumber ($stepCounter++)
. .\functions\Get-PublicIP.ps1
$publicIP = Get-PublicIP
#! ************************************** Get-PublicIP Function ***************************************
#endregion

#* MODULES
Write-ProgressHelper "Getting Computer Name" -StepNumber ($stepCounter++)
. .\modules\Hostname.ps1
Write-ProgressHelper "Getting Last Boot Time" -StepNumber ($stepCounter++)
. .\modules\LastBootInfo.ps1
Write-ProgressHelper "Getting OS Info" -StepNumber ($stepCounter++)
. .\modules\OSInfo.ps1
Write-ProgressHelper "Getting PowerShell Version Table" -StepNumber ($stepCounter++)
. .\modules\PSVersionTable.ps1
Write-ProgressHelper "Getting Chipset Info" -StepNumber ($stepCounter++)
. .\modules\ChipsetInfo.ps1
Write-ProgressHelper "Getting BIOS Info" -StepNumber ($stepCounter++)
. .\modules\BIOSInfo.ps1
Write-ProgressHelper "Getting Disk Info" -StepNumber ($stepCounter++)
. .\modules\LogicalDisks.ps1
Write-ProgressHelper "Getting NIC Info" -StepNumber ($stepCounter++)
. .\modules\NetworkAdapters.ps1
Write-ProgressHelper "Getting Hosts File Info" -StepNumber ($stepCounter++)
. .\modules\HostsFile.ps1
Write-ProgressHelper "Getting Application Info" -StepNumber ($stepCounter++)
. .\modules\ApplicationsInfo.ps1
Write-ProgressHelper "Getting Services Info" -StepNumber ($stepCounter++)
. .\modules\WindowsServices.ps1

#* HTML
Write-ProgressHelper "Creating HTML Head" -StepNumber ($stepCounter++)
. .\html\HTMLHead.ps1
Write-ProgressHelper "Creating the Header" -StepNumber ($stepCounter++)
. .\html\TopHeader.ps1
Write-ProgressHelper "Creating the Side Navigation Bar" -StepNumber ($stepCounter++)
. .\html\SideNavigationBar.ps1
Write-ProgressHelper "Creating SearchForms" -StepNumber ($stepCounter++)
. .\html\SearchForms.ps1
Write-ProgressHelper "Adding a BackToTop Button" -StepNumber ($stepCounter++)
. .\html\TopButton.ps1


#region BuildAndExport HTML
#* ************************************** BUILD HTML ***************************************
$HTML =`
 ConvertTo-HTML -Body " $topHeader $sideNavigation $BiosInfo $ProcessorInfo $OSinfo $PSversion $diskArray $NetAdapterInfo $hostsInfo $searchScripts $ServicesInfo $topButton"`
 -Head $header -Title "Computer Information Report"`
 -PostContent "<p id='Footer'>Report generated by $env:USERNAME at $footerDate</p>"
#! ************************************** BUILD HTML ***************************************
#$Title $bootInfo $sideNavigation $topHeader
#endregion

#region ExportHTML
#* ************************************** EXPORT HTML ***************************************
$HTMLexport = "$exportLocation\$env:computername-$fileDate-Report.html"
# $ZIPArchive = "$exportLocation\$env:computername-$fileDate-Report.zip"

#* Generate HTML File
try {
    $HTML | Out-File $HTMLexport -Encoding ascii -ErrorAction Stop
    Copy-Item $cssBaseFolder $exportLocation -Recurse -Force -ErrorAction Stop
}
catch [System.IO.DirectoryNotFoundException]{
    Write-Output $_.Exception
    try {
        New-Item $exportLocation -ItemType Directory -ErrorAction Stop
        $HTML | Out-File $HTMLexport -Encoding ascii -ErrorAction Stop
    }
    catch {
        Write-Output $_.Exception
    }
}
# $HTML | Out-File "$env:USERPROFILE\Desktop\$env:computername-Basic-Computer-Information-Report.html"

#! ************************************** EXPORT HTML ***************************************
#endregion

#* OPEN HTML FILE ON BROWSER AFTER COLLECTION
# invoke-item "$env:USERPROFILE\Desktop\$env:computername-Basic-Computer-Information-Report.html"
Invoke-Item $HTMLexport

#* ************************************** COMPRESS / ARCHIVE ***************************************
#* Compress To Archive
# Compress-Archive $HTMLexport -DestinationPath $ZIPArchive
#! ************************************** COMPRESS / ARCHIVE ***************************************

Show-Notification "Script Get-PCInfo-HTML complete, please find the exported file at $HTMLexport"
# Stop-Transcript

# PAUSE