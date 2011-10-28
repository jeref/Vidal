@echo OFF
rem **
echo sqlLOADER_ID10941.bat
rem V1.2.2 JFO 12/02/2010
rem automatise la correction de la base Oracle : 1 documents absents !
rem à passer suite au controle : selDocAbsents.sql
rem passer aussi le controle général : controle_countTables.sql
:variables
rem Attention : Document de Pharma : modifier rFI , ci-dessous!
set FI=ID10941
set ID_DOCUMENT=45918
set rep=C:\Oracle\Ora81\bin\
set ctrl=sqlLOADER_%FI%.txt
set rFI=N:\_prod2010\Cumul\htmlPharma\

:Warning
if not "%COMPUTERNAME%" == "SRV-VID-FABORA1" echo ce script doit etre passe sur SRV-VID-FABORA1 !
if not "%COMPUTERNAME%" == "SRV-VID-FABORA1" pause
echo a executer avec SQL+ :
echo drop table DVP_loader;
echo create table DVP_loader ( ID_Document Number,fic Varchar(250), html CLOB);
pause

:importFile
cd/D "%rep%"
copy "%rFI%%FI%.htm" "%rep%%FI%.htm"
:fichierCommandSqlLdr
echo LOAD DATA INFILE * >"%rep%%ctrl%"
echo TRUNCATE >>"%rep%%ctrl%"
echo INTO TABLE DVP_loader >>"%rep%%ctrl%"
echo FIELDS TERMINATED BY ';' >>"%rep%%ctrl%"
echo (  ID_Document, >>"%rep%%ctrl%"
echo fic, >>"%rep%%ctrl%"
echo html LOBFILE(fic) TERMINATED BY EOF >>"%rep%%ctrl%"
echo ) >>"%rep%%ctrl%"
echo BEGINDATA >>"%rep%%ctrl%"
echo %ID_DOCUMENT%;%FI%.htm >>"%rep%%ctrl%"
:controlFiles
dir %FI%.htm "%rep%%ctrl%"
echo le fichier existe ?
echo lancer sqlldt ? (vérifier que %repctrl%%ctrl% est bien à jour !)
pause

sqlldr userid="sa/oracle@RUBIS" control="%rep%%ctrl%" log="%repctrl%log.txt" bad="%repctrl%bad.txt" discard="%repctrl%disard.txt"
rem errors=0
echo OK ?
pause

:insert
echo executer avec SQL+ : @insert_%FI%
echo insert into Documents (id_document, Nom_Fichier, id_Type, html, valide) >%rep%insert_%FI%.sql
echo select %ID_DOCUMENT% As id_document, '%FI%' As Nom_fichier, 1 As id_type, dbms_lob.substr(html, 4000,1) As html, '1' As valide >>%rep%insert_%FI%.sql
echo from DVP_loader where id_document = %ID_DOCUMENT%; >>%rep%insert_%FI%.sql
:drop
echo "1 ligne créée." ? alors executer "drop table DVP_loader;"
echo FIN %~nx0
pause