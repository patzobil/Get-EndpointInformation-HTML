#* ************************************** COMPRESS / ARCHIVE ***************************************
if ($logging -eq 1 ){ 
    try {
        Compress-Archive $HTMLExportLocation,$logFilePath -DestinationPath $ZIPArchive -ErrorAction Stop
        Write-Log -LogText "Compressed HTML and log in archive: $ZIPArchive"
    }
    catch {
        Write-Log -LogText "Could not compress HTML and/or log in archive: $ZIPArchive"
        Write-Log -LogType E -LogText $_.Exception
    }
    
}
else { 
    try {
        Compress-Archive $HTMLExportLocation -DestinationPath $ZIPArchive -ErrorAction Stop
        Write-Log -LogText "Compressed HTML in archive: $ZIPArchive"
    }
    catch {
        Write-Log -LogText "Could not compress HTML in archive: $ZIPArchive"
        Write-Log -LogType E -LogText $_.Exception
    }
    
}
#! ************************************** COMPRESS / ARCHIVE ***************************************