set DMP=E:\Production\RUBISInfoCentre\dmp
if exist "%DMP%\RubisInfocentreProduit.dmp" del "%DMP%\RubisInfocentreProduit.dmp"
call BackupRubisInfocentreProduit.bat SRV-VID-FAB1 RubisInfocentreProduit Sql Out
pause