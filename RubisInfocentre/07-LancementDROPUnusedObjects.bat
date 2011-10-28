rem **
echo 07-LancementDROPUnusedObjects.bat %1 %2 %3 %4
rem suppression des objets non utilisés

echo EmptyUnusedFields
OSQL -E -e -n -u -S %1 -d %2 -i %3\EmptyUnusedFields.sql -o %4\EmptyUnusedFields.out
echo AddHopToRensComp
OSQL -E -e -n -u -S %1 -d %2 -i %3\AddHopToRensComp.sql -o %4\AddHopToRensComp.out
echo Update_UCD
OSQL -E -e -n -u -S %1 -d %2 -i %3\Update_UCD.sql -o %4\Update_UCD.out
echo Update_Saumon
OSQL -E -e -n -u -S %1 -d %2 -i %3\Update_Saumon.sql -o %4\Update_Saumon.out
echo FillTermeRechPhonetique
OSQL -E -e -n -u -S %1 -d %2 -i %3\FillTermeRechPhonetique.sql -o %4\FillTermeRechPhonetique.out
echo FillMarqueurs
OSQL -E -e -n -u -S %1 -d %2 -i %3\FillMarqueurs.sql -o %4\FillMarqueurs.out
