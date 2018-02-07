@echo OFF
rem **
echo 05-TransfertTAbles.bat %1 %2 %3 %4

echo TransfertTables
OSQL -E -e -n -u -S %1 -d %2 -i %3\TransfertTables.sql -o %4\TransfertTables.out
