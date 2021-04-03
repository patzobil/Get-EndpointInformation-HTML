#region PSVersionTableInfo
#* ************************************** PS Version Info ***************************************
Write-ProgressHelper "Getting PowerShell Info" -StepNumber ($stepCounter++)
$PSversion = $PSVersionTable | ConvertTo-Html -Fragment -As List -Property @{l="PS Version";e={$_.PSVersion -join " "}},`
 @{l="PSEdition";e={$_.PSEdition -join " "}},@{l="PSCompatibleVersions";e={$_.PSCompatibleVersions -join ", "}},`
 @{l="Build Version";e={$_.BuildVersion -join " "}},@{l="CLR Version";e={$_.CLRVersion -join " "}},`
 @{l="WSManStackVersion";e={$_.WSManStackVersion -join " "}},@{l="PSRemotingProtocolVersion";e={$_.PSRemotingProtocolVersion  -join " "}} -PreContent "<h2 id='PSInfo'>PowerShell Version</h2>"
$PSversion = $PSversion -replace '<table>','<div class="container"><table id="psTable" class="table table-dark table-hover table-striped table-bordered"><tbody>'
$PSversion = $PSversion -replace '</table>','</tbody></table></div>'
#! ************************************** PS Version Info ***************************************
#endregion
