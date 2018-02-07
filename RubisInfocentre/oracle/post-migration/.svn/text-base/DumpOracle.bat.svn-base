rem @echo OFF
rem **
echo DumpOracle.bat
rem JFO 02/10/2006 : Dump Oracle
rem set REPINST=E:\Oracle\Ora81\BIN

:variables
call "%~dp0..\..\..\ProdIRIS_Livraison\setEnv.bat"
set EXP=exp.exe
for /F %%h in ('hostname') do (
echo %%h
if "%%h" == "srv-vid-fabora1" set EXP=C:\Oracle\Ora81\bin\exp.exe
)

:DUMP
rem "%REPINST%\
if exist sadump.dmp del sadump.dmp
echo %EXP%" sa/oracle@rubis file=sadump.dmp log=exportsa.log
"%EXP%" sa/oracle@rubis file=sadump.dmp log=exportsa.log >"%~dp0DumpOracle_%annee%%mois%%jour%.log
dir sadump.dmp

:ZIP
if not exist "%WINZIP%" ECHO Erreur : WINZIP n'est pas installe ou pas configure sur "%COMPUTERNAME%" !
if not exist "%WINZIP%" echo WINZIP=%WINZIP%
if not exist "%WINZIP%" PAUSE

if not exist "X:\Fiches Web\%annee%%mois%%jour% Dump ORACLE extraction du %jour% %rep_mois% %annee%\sadump.zip" mkdir "X:\Fiches Web\%annee%%mois%%jour% Dump ORACLE extraction du %jour% %rep_mois% %annee%"
"%WINZIP%" -min -a sadump.zip sadump.dmp
move sadump.zip "X:\Fiches Web\%annee%%mois%%jour% Dump ORACLE extraction du %jour% %rep_mois% %annee%\sadump.zip"


dir "X:\Fiches Web\%annee%%mois%%jour% Dump ORACLE extraction du %jour% %rep_mois% %annee%\sadump.zip"
echo SI le fichier a bien été recopie, continuer pour supprimer le fichier dmp, SINON arrêter et faire le zip manuellement.
pause
del sadump.dmp