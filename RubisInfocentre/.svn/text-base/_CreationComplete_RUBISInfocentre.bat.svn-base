@echo OFF
rem **
echo _CreationComplete_RUBISInfoCentre.bat
REM -----------------------------------------------------------------------------------------------------
rem V2.0 - JFO 09/02/2007 : prise en compte d'un serveur différent de BARBARA
rem V2.2 - JFO 10/07/2009 : Log et commentaires refaits + controleVersion
rem prod RubisInfoCentreProduit
REM -----------------------------------------------------------------------------------------------------
:variables
set base=RubisInfoCentreProduit
rem COMPUTERNAME est la machine sur lequel s'execute le .bat
set server=%COMPUTERNAME%
:repcourant
cd /D "%~dp0"
rem echo #Debug waitForBundles en cours !
rem pause
rem goto waitForBundles
rem pause
:warning
echo prod RubisInfoCentreProduit sur %base% du serveur %server%
echo Verifier le repertoire en cours : %CD%
rem echo DEBUG LivraisonFiches !
rem echo DEBUG vfr
rem pause
rem goto vfr
rem goto LivraisonFiches
echo toDo : verif automatique des anciennes sauvegardes
:RAZ
echo Menage des .out et des .err !
pause
date /T
time /T
:DelOldOutputFiles
call 01-Menage.bat
:DROPtables
call 03-LancementDROPtablesINFOIRISdansRUBISInfoCentre.bat %server% %base% Sql Out Err Dat
echo Fin de 03-LancementDROPtablesINFOIRISdansRUBISInfoCentre.bat
pause
:createTables
call 04-LancementCREATEtablesINFOIRISdansRUBISInfoCentre.bat %server% %base% Sql Out Err Dat
:Transfert
call 05-TransfertTables.bat %server% %base% Sql Out Err Dat
:DropUnused
echo 07 en cours
call 07-LancementDROPUnusedObjects.bat %server% %base% Sql Out Err Dat
:Securite
call 08-SecuriteGlobale.bat %server% %base% Sql Out Err Dat
:Livrets
echo OSQL -E -e -n -u -S %server% -d %base% -i oracle\post-SQL\CreateTablesLivretVCIM_SQL.sql -o Out\CreateTablesLivretVCIM_SQL_1.out
OSQL -E -e -n -u -S %server% -d %base% -i oracle\post-SQL\CreateTablesLivretVCIM_SQL.sql -o Out\CreateTablesLivretVCIM_SQL_1.out
OSQL -E -e -n -u -S %server% -d %base% -i oracle\post-SQL\CreateTablesLivretVCIM_SQL.sql -o Out\CreateTablesLivretVCIM_SQL_2.out
echo fin Livrets
:Version
echo Verifier que version.sql est bien passe sur RubisInfoCentre (..\RubisExtraction\Automatisation\valid_base.bat):
OSQL -E -e -n -u -S %server% -d %base% -i "%~dp0controleVersion.sql" -o "%~dp0Out\controleVersion.out"
TYPE "%~dp0Out\controleVersion.out"
echo OK ? Sinon lancer Automatisation\valid_base\Maj_version.bat (n'est pas lance dans ce script, mais dans valid_base.bat)
echo Suite : controle_countTables + BackupRubisInfocentreProduit
pause
:controleCounttables
echo controle_countTables
OSQL -E -e -n -u -S %server% -d %base% -i "%~dp0oracle\post-migration\controle_countTables.sql" -o "%~dp0oracle\post-migration\controle_countTables.out"
:Backup
start "Sauvegarde de la base RubisInfocentreProduit" "%~dp0BackupRubisInfocentreProduit.bat" %server% %base% Sql Out
date /T
time /T
echo MajSQL7.bat peut etre lance (manuellement)...
:LivraisonFiches
start "Livraison des fiches Vidal.fr et IRIS" "%~dp0_LivraisonFiches.bat"
:waitForBundles
rem variables  de livraison
call "%~dp0..\ProdIRIS_Livraison\setENV.bat"
rem vérification du fichier des fiches Vidal.fr
set chemin=x:\Fiches Web\%DATE_EXTRACT% Fiches Vidal.fr Extraction du %jour% %rep_mois% %annee%
echo Attente du fichier de Livraison des Fiches VidalFR (%chemin%\%FILE_VIDAL_FR%)
%JAVA% WaitForFile "%chemin%\%FILE_VIDAL_FR%"
rem vérification du fichier des fiches IRIS
set chemin=x:\Fiches Web\%DATE_EXTRACT% Fiches IRISEES Extraction du %jour% %rep_mois% %annee%
echo Attente du fichier de Livraison des Fiches IRIS (%chemin%\FicheIRIS.zip)
%JAVA% WaitForFile "%chemin%\FicheIRIS.zip"
rem vérification du fichier dump Oracle
echo Attente du fichier dump Oracle (X:\Fiches Web\%annee%%mois%%jour% Dump ORACLE extraction du %jour% %rep_mois% %annee%\sadump.zip)
%JAVA% WaitForFile "X:\Fiches Web\%annee%%mois%%jour% Dump ORACLE extraction du %jour% %rep_mois% %annee%\sadump.zip"
:sendMail
echo OK pour mail de livraison ?
call "%~dp0..\ProdIRIS_Livraison\sendMsg.bat"
:SauvegardesFichesWEB
call "%~dp0..\ProdIRIS_Livraison\SauvegardesFichesWEB.bat"
:FIN
echo FIN %~nx0
pause
