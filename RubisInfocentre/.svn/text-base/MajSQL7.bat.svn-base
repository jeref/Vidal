@echo OFF
echo MajSQL7.bat
rem transformation de la base SQL9 en SQL7
rem etape suivante : importation dans une base ORACLE (SRV-VID-FABORA1)
:variables
set SRV=srv-vid-fabsql7
set BASE=RubisInfoCentreProduit
cd/D E:\production\RubisExtraction\RubisInfoCentre

rem echo debug restore en cours
rem pause
rem goto restore

dir sql\MSSQL7\*.sql
echo ce traitement doit être lancé de FAB1 ou CALCUL...

rem echo debug en cours :restore
rem goto BackupRubisInfocentreProduit
rem goto restore
echo Attention ! Vérifier que la sauvegarde de la précédente base a bien été faite.
pause
:reset
echo 1 : reset base %BASE%  de %SRV%
echo ReCreate_RubisInfocentreProduit.sql
OSQL -E -e -n -u -S %SRV% -d %BASE% -i sql\MSSQL7\ReCreate_RubisInfocentreProduit.sql -o out\ReCreate_RubisInfocentreProduit.out
echo import Brut (DTS)
:DTS
echo dtsrun /S %SRV% /E /N import_Data_RubisInfoCentreProduit == out\import_Data_RubisInfoCentreProduit.out
dtsrun /S %SRV% /E /N import_Data_RubisInfoCentreProduit >out\import_Data_RubisInfoCentreProduit.out
:controles
echo controles...
echo controleTablesVides
OSQL -E -e -n -u -S srv-vid-fab1 -i sql\controleTablesVides.sql -o out\controleTablesVides.out
echo controle_importTables
OSQL -E -e -n -u -S srv-vid-fab1 -i sql\MSSQL7\controles\controle_importTables.sql -o out\controle_importTables.out
echo Verifier que les DTS ont bien tourné (controleTablesVides.out et controle_importTables.out)
echo puis ReCreate_RubisInfocentreProduit_FK.sql :
pause
:recreateFK
echo ReCreate_RubisInfocentreProduit_FK.sql
OSQL -E -e -n -u -S %SRV% -d %BASE% -i sql\MSSQL7\ReCreate_RubisInfocentreProduit_FK.sql -o out\ReCreate_RubisInfocentreProduit_FK.out
:selectVersion
echo selectVersion.sql
OSQL -E -e -n -u -S %SRV% -d %BASE% -i sql\selectVersion.sql -o out\selectVersion.out
echo verifier out\selectVersion.out
more out\selectVersion.out
:BackupRubisInfocentreProduit
echo call BackupRubisInfocentreProduit.bat %SRV% %BASE% sql out
dir BackupRubisInfocentreProduit.bat
pause
call BackupRubisInfocentreProduit.bat %SRV% %BASE% sql out
:restore
echo copy \\%SRV%\SauvegardesBases\RubisInfocentreProduit.dmp \\barbara\Automatisation\RubisInfocentreProduit.dmp
copy \\%SRV%\SauvegardesBases\RubisInfocentreProduit.dmp \\barbara\Automatisation\RubisInfocentreProduit.dmp
dir \\barbara\Automatisation\RubisInfocentreProduit.dmp
echo Restore sur BARBARA ?
pause
echo OSQL -E -e -n -u -S BARBARA -d msdb -i sql\Restore_RUBISInfoCentreProduit.sql -o out\Restore_RUBISInfoCentreProduit.out
OSQL -E -e -n -u -S BARBARA -d msdb -i sql\Restore_RUBISInfoCentreProduit.sql -o out\Restore_RUBISInfoCentreProduit.out
echo controler "%~dp0out\Restore_RUBISInfoCentreProduit.out"
echo fin MajSQL7.bat
pause