#region ExportHTML
#* ************************************** EXPORT HTML ***************************************
#* Export the HTML File at the $exportLocation
try {
    $HTML | Out-File $HTMLExportLocation -Encoding ascii -ErrorAction Stop
    Write-Log -LogText "Generated HTML File Export"
}catch{
    Write-Log -LogType E -LogText "Could not generate HTML File Export."
    Write-Log -LogType E -LogText "$_.Exception"
    exit
}
#! ************************************** EXPORT HTML ***************************************
#endregion