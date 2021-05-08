if ($logging -eq 1 ){ 
    try {
        Write-Log -LogText "Compressing HTML and log file in archive: $ZIPArchive"
        Compress-Archive $HTMLExportLocation -DestinationPath $ZIPArchive -ErrorAction Stop
        Write-Log -LogText "Compressed HTML in archive"
        try {
            Compress-Archive $logFilePath -DestinationPath $ZIPArchive -Update -ErrorAction Stop
            Write-Log -LogText "Compressed log file in archive"
            Write-Log -LogText "****************************END****************************"
            Compress-Archive $logFilePath -DestinationPath $ZIPArchive -Update -ErrorAction Stop
        }
        catch {
            Write-Log -LogType E -LogText "Could not compress log file in archive: $ZIPArchive"
            Write-Log -LogType E -LogText $_.Exception
            Write-Log -LogText "****************************END****************************"
        }
    }
    catch {
        Write-Log -LogType E -LogText "Could not compress HTML and log file in archive: $ZIPArchive"
        Write-Log -LogType E -LogText $_.Exception
        Write-Log -LogText "****************************END****************************"
    }
}
else { 
    try { Compress-Archive $HTMLExportLocation -DestinationPath $ZIPArchive -ErrorAction Stop }
    catch {}
}