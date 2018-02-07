@echo OFF
rem **
echo 03-LancementDROPtablesINFOIRISdansRUBISInfocentre.bat %1 %2 %3 %4
rem V2.0 JFO 09/02/2007
rem suppression des tables qui vont êtres refaites entièrement
cd

echo DropConstraintWeb
OSQL -E -e -n -u -S %1 -d %2 -i %3\DropConstraintWeb.sql -o %4\DropConstraintWeb.out
echo DropLivret
OSQL -E -e -n -u -S %1 -d %2 -i %3\DropLivret.sql -o %4\DropLivret.out
echo DropNewTables
OSQL -E -e -n -u -S %1 -d %2 -i %3\DropNewTables.sql -o %4\DropNewTables.out
echo DropSaumon
OSQL -E -e -n -u -S %1 -d %2 -i %3\DropSaumon.sql -o %4\DropSaumon.out
echo DropINFOIRIS
OSQL -E -e -n -u -S %1 -d %2 -i %3\DropINFOIRIS.sql -o %4\DropINFOIRIS.out
echo DropTermeRechPhonetique
OSQL -E -e -n -u -S %1 -d %2 -i %3\DropTermeRechPhonetique.sql -o %4\DropTermeRechPhonetique.out
echo controleDropTables
OSQL -E -e -n -u -S %1 -d %2 -i %3\controleDropTables.sql -o %4\controleDropTables.out