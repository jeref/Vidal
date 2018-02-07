rem **
echo corrige1Document.bat
rem V1.2.2- JFO 16/10/2009 [DEV]
rem intégration du document manquant dans la table DVPLoader de Oracle (étape 2)
rem [Warning] cette partie doit être intégrée à sqlLoader.bat (qui utilise sqlLOADER_controle.txt)  !
echo ne plus utiliser ce script (automatise dans sqlLOADER_FI74185.bat a modifier) !
:variables
rem set DOC=FI150
set DOC=FI74185
set ORCL_HOME=C:\oracle\HOME816\bin
:warning
if not "%COMPUTERNAME%" == "SRV-VID-FABORA1" echo ce script doit etre passe sur SRV-VID-FABORA1 !
if not "%COMPUTERNAME%" == "SRV-VID-FABORA1" pause
copy Z:\RubisExtraction\ProdIRIS_Extraction\FicheIRIS\%DOC%.htm "%ORCL_HOME%\"
dir "%ORCL_HOME%\%DOC%.htm" "%ORCL_HOME%\CTRLimp%DOC%.txt"
echo OK ?
pause
"%ORCL_HOME%\SQLLDR.EXE" sa/oracle@RUBIS control=CTRLimp%DOC%.txt log=log.txt bad=bad.txt discard=discard.txt direct=y errors=0
echo FIN %~nx0
pause