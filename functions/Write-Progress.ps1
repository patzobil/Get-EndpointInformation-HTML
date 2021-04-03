#region Write-ProgressFunction
#* ************************************** Write-Progress Function ***************************************
function Write-ProgressHelper {
	param (
        [int]$StepNumber,
        [string]$Message
	)

	Write-Progress -Activity "Collecting Software and Hardware Info for $env:computername" -Status $Message -PercentComplete (($StepNumber / $steps) * 100) 
}

#! ************************************** Write-Progress Function ***************************************
#endregion