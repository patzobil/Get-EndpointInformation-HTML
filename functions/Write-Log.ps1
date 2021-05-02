<#
.SYNOPSIS
    A function to write to an external .log file for everytime the script runs
.DESCRIPTION
    Write-Log helps you make sure to track any actions in a .log file
    The logs are stored in the installation directory under logs folder

    "-LogType I" : Use this switch to define if the LOG entry is [INFO] - Default
    "-LogType W" : Use this switch to define if the LOG entry is [WARNING]
    "-LogType E" : Use this switch to define if the LOG entry is [ERROR]
.EXAMPLE
    Write-Log -LogText "Getting PowerShell Version Table"
    This will write an INFO LogEntry (default if LogEntry is neglected)
.EXAMPLE
    Write-Log -LogType W -LogText "Getting PowerShell Version Table"
    This will override the default INFO LogEntry and will write an WARNING LogEntry
.EXAMPLE
    Write-Log -LogType E -LogText "Getting PowerShell Version Table"
    This will override the default INFO LogEntry and will write an ERROR LogEntry
#>
function Write-Log {
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateSet("I","E","W")]
        [string]$LogType = "I",

        [Parameter(Mandatory)]
        [String]$LogText
        
    )
    
    begin {
        $date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        # Write-Host $date
    }
    
    process {
        # Write-Host $LogType
        switch ($LogType) {
            "I" { $LogEntry = "$date - [INFO]: $LogText" }
            "E" { $LogEntry = "$date - [ERROR]: $LogText" }
            "W" { $LogEntry = "$date - [WARNING]: $LogText" }
        }
        # Write-Host $LogEntry
    }
    
    end {
        if ($logging -eq 1 ){
            $LogEntry | Out-File -FilePath $logFilePath -Append
        }

    }
}