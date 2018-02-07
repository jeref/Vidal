@echo OFF
rem **
echo BackupRubisInfocentreProduit.bat %1 %2 %3 %4
rem V1.0 - JFO 01/03/2007 - production numérique - BackOffice VIDAL
rem sauvegarde de RubisInfocentreProduit
rem ------------------------------------------------------------------
:variables
echo serveur = %1
echo dataBase = %2
if "%1" == "" echo #Erreur : serveur non défini !
if "%1" == "" pause
if "%2" == "" echo #Erreur : dataBase non définie !
if "%2" == "" pause
:BackupRubisInfocentreproduit
echo OSQL -E -e -n -u -S %1 -d %2  -i "%~dp0sql\BackupBaseRubisInfocentreProduit.sql" -o "%~dp0out\BackupBaseRubisInfocentreProduit.out"
OSQL -E -e -n -u -S %1 -d %2  -i "%~dp0sql\BackupBaseRubisInfocentreProduit.sql" -o "%~dp0out\BackupBaseRubisInfocentreProduit.out" 
date /T
time /T