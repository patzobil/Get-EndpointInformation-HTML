<#
.SYNOPSIS
    A function to display a progress bar for every step of the way
.DESCRIPTION
    Write-ProgressHelper : A function to display a progress bar for every step of the way
	Every time it is invoked it counts towards the total times the Write-ProgressHelper Function runs.
	That way Write-Progress -PercentComplete will show how far the script is in the progress bar.
.EXAMPLE
    Write-Progress -Activity "Progress Bar Title" -Status "Current Action"
    Basic Progress Bar Title and Action
.EXAMPLE
    Write-ProgressHelper "Current Action" -StepNumber ($stepCounter++)
    Pre-defined Progress bar Title, Current Action and Step Counter
#>
function Write-ProgressHelper {
	param (
        [int]$StepNumber,
        [string]$Message
	)
	Write-Progress -Activity "Collecting Software and Hardware Info for $env:computername" -Status $Message -PercentComplete (($StepNumber / $steps) * 100) 
}