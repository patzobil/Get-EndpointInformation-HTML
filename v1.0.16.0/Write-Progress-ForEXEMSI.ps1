#region Write-ProgressFunction
#* ************************************** Write-Progress Function ***************************************
function Write-ProgressHelper {
	param (
        [int]$StepNumber,
        [string]$Message
	)

	Write-Progress -Activity "Collecting Software and Hardware Info for $env:computername" -Status $Message -PercentComplete (($StepNumber / $steps) * 100) 
}
$script:steps = ([System.Management.Automation.PsParser]::Tokenize((Get-Content "$PSScriptRoot\Get-EndpointInfo-HTML.ps1$($MyInvocation.MyCommand.Name)"), [ref]$null) | Where-Object { $_.Type -eq 'Command' -and $_.Content -eq 'Write-ProgressHelper' }).Count
$stepCounter = 0
#! ************************************** Write-Progress Function ***************************************
#endregion