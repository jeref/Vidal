rem **
echo _BackupRubisInfocentreProduit_BARBARA.bat
rem JFO 03/03/2008
echo Cette sauvegarde ne fonctionne que sur BARBARA !

if exist ".\dmp\RubisInfocentreProduit_BARBARA.dmp" echo Attention : la sauvegarde de RubisInfocentreProduit_BARBARA.dmp a-t-elle ete bien faite ?
if exist ".\dmp\RubisInfocentreProduit_BARBARA.dmp" pause
if exist ".\dmp\RubisInfocentreProduit_BARBARA.dmp" del ".\dmp\RubisInfocentreProduit_BARBARA.dmp"
call BackupRubisInfocentreProduit.bat BARBARA RubisInfocentreProduit Sql Out
move E:\Automatisation\RubisInfocentreProduit.dmp "\\SRV-VID-FAB1\Production\RubisExtraction\RubisInfoCentre\dmp\RubisInfocentreProduit_BARBARA.dmp"
dir ".\dmp\RubisInfocentreProduit_BARBARA.dmp"
pause