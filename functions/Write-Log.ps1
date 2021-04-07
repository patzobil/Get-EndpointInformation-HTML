#Create/Define LOG file in the main PS1
#Start the LOG caprture before any of the code runs
#Append each command to the LOG file - USE ERROR HANDLING
    #Use a switch to define if the LOG entry is [INFO] or [ERROR]


<#
.SYNOPSIS
    A function to write to an external log file
.DESCRIPTION
    Long description
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    General notes
#>
function Write-Log {
    [CmdletBinding()]
    param (
        [String]$logText
    )
    
    begin {
        
    }
    
    process {
        
    }
    
    end {
        
    }
}