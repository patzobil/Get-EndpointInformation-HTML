#* ************************************** OPEN HTML ***************************************
#* OPEN HTML FILE ON BROWSER AFTER COLLECTION
try {
    Write-Log -LogText "Opening HTML Export in Default Browser"
    Invoke-Item $HTMLExportLocation -ErrorAction Stop
}
catch {
    Write-Log -LogType E -LogText "Could not open HTML..."
    Write-Log -LogType E -LogText $_.Exception
}
#! ************************************** OPEN HTML ***************************************