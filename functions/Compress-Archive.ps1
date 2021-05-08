#* ************************************** COMPRESS / ARCHIVE ***************************************

if ($logging -eq 1 ){ Compress-Archive $HTMLExportLocation,$logFilePath -DestinationPath $ZIPArchive }
else { Compress-Archive $HTMLExportLocation -DestinationPath $ZIPArchive }

#! ************************************** COMPRESS / ARCHIVE ***************************************