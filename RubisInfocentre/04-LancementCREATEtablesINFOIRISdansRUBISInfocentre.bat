@echo OFF
rem **
echo 04-LancementCREATEtablesINFOIRISdansRUBISInfocentre.bat %1 %2 %3 %4
rem V2.0 JFO 09/02/2007
rem Creation de la structure vide pour le chargement

echo INFOIRIS_Tables
OSQL -E -e -n -u -S %1 -d %2 -i %3\INFOIRIS_Tables.sql -o %4\INFOIRIS_Tables.out
echo INFOIRIS_Tables_Dictionnaires
OSQL -E -e -n -u -S %1 -d %2 -i %3\INFOIRIS_Tables_Dictionnaires.sql -o %4\INFOIRIS_Tables_Dictionnaires.out
echo INFOIRIS_Tables_RMC
OSQL -E -e -n -u -S %1 -d %2 -i %3\INFOIRIS_Tables_RMC.sql -o %4\INFOIRIS_Tables_RMC.out

rem creation de T_SUB_Etendue (avant fusion) et UCD faites dans INFOIRIS_Tables.sql
rem OSQL -E -e -n -u -S %1 -d %2 -i %3\CreateNewTables.sql -o %4\CreateNewTables.out

echo CreateTermeRechPhonetique
OSQL -E -e -n -u -S %1 -d %2 -i %3\CreateTermeRechPhonetique.sql -o %4\CreateTermeRechPhonetique.out
echo SaumonCREATE
OSQL -E -e -n -u -S %1 -d %2 -i %3\SaumonCREATE.sql -o %4\SaumonCREATE.out
echo INFOIRIS_Cles_Primaires
OSQL -E -e -n -u -S %1 -d %2 -i %3\INFOIRIS_Cles_Primaires.sql -o %4\INFOIRIS_Cles_Primaires.out
echo INFOIRIS_Index
OSQL -E -e -n -u -S %1 -d %2 -i %3\INFOIRIS_Index.sql -o %4\INFOIRIS_Index.out
echo INFOIRIS_Constraints
OSQL -E -e -n -u -S %1 -d %2 -i %3\INFOIRIS_Constraints.sql -o %4\INFOIRIS_Constraints.out


rem OSQL -E -e -n -u -S %1 -d %2 -i %3\CreateLivret.sql -o %4\CreateLivret.out
rem OSQL -E -e -n -u -S %1 -d %2 -i %3\CREATEConstraintWeb.sql -o %4\CREATEConstraintWeb.out


