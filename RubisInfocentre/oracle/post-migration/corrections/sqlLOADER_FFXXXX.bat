@echo OFF
rem **
echo sqlLOADER_FFXXXX.bat
rem V1.2 JFO 09/08/2009
rem automatise la correction des documents absents de la base Oracle !
rem à passer suite à la détection de la détection des documents absents avec le controle : @selDocAbsents.sql
rem -------------------------------------------------------------------
:variables
set FI=FFXXXX
set ID_DOCUMENT=nnnnn
set rep=C:\Oracle\Ora81\bin\
set ctrl=sqlLOADER_%FI%.txt
rem Attention : Document de Pharma, si autre : modifier ci dessous
set rFI=N:\_prod2010\Cumul\htmlPharma\
rem exemple : Z:\RubisExtraction\ProdIRIS_Extraction\FicheIRIS\ pour Fiche IRIS

:Warning
if not "%COMPUTERNAME%" == "SRV-VID-FABORA1" echo ce script doit etre passe sur SRV-VID-FABORA1 !
if not "%COMPUTERNAME%" == "SRV-VID-FABORA1" pause
echo a executer avec SQL+ SI la table DVP_loader n'existe pas deja !
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
echo "1 ligne créée." ? alors executer "drop table DVP_loader;" s'il n'y a pas d'autres document manquant.
echo FIN %~nx0
pause