@echo OFF
rem convutf2ansii.bat
rem V1.2
rem JFO 13/05/2006
rem convertion des fichiers en ANSII pour pouvoir être pris en compte dans SVN
set ExtDt=270406

if exist Z:\RUBISInfocentre\_CreationComplete_RUBISInfocentre.bat goto BAT
net use Z: /DEL
net use Z: \\BARBARA\Automatisation

:BAT
cd ..
del *.bat
xcopy Z:\RUBISInfocentre\*.bat .
dir /b *.bat >listfic_bat.txt
for /F %%f in (listfic_bat.txt) do type %%f >%%f.ansii 
del *.old
for /F %%f in (listfic_bat.txt) do ren %%f %%f.old
for /F %%f in (listfic_bat.txt) do ren %%f.ansii %%f
del listfic_bat.txt
del *.old
:SQL
cd sql
del *.sql
xcopy Z:\RUBISInfocentre\sql\*.sql .
dir /b *.sql >listfic_sql.txt
for /F %%f in (listfic_sql.txt) do type %%f >%%f.ansii 
del *.old
for /F %%f in (listfic_sql.txt) do ren %%f %%f.old
for /F %%f in (listfic_sql.txt) do ren %%f.ansii %%f
del listfic_sql.txt
del *.old

:SauvegardesAPI
type "N:\dev web\vidalcim\Sauvegarde_API\Sauvegarde_ApiRubis\Exp_Livret\ExpSaLivret%ExtDt%.sql" >"E:\Production\WC Prod_RubisExtraction\RubisInfocentre\oracle\Exp_API_LIVRET_VIDALCIM_ORACLE.txt"
type "N:\dev web\vidalcim\Sauvegarde_API\Sauvegarde_ApiRubis\Exp_Livret\ExpSARubis%ExtDt%.sql" >"E:\Production\WC Prod_RubisExtraction\RubisInfocentre\oracle\Exp_API_VIDALCIM_ORACLE.txt"

:sourcesAPI
rem mettre ajour le chemin d'origine si changement d'API !
:API_sql
type "N:\dev web\sources\api\sql\2.11\API VIDALCIM 2-10 SQL serveur.sql" >"E:\Production\WC Prod_RubisExtraction\RubisInfocentre\oracle\API_VIDALCIM_SQL.txt"
type "N:\dev web\sources\api\sql\2.11\info.txt" >"E:\Production\WC Prod_RubisExtraction\RubisInfocentre\oracle\info_API_VIDALCIM_SQL.txt"
:API_oracle
type "N:\dev web\sources\api\oracle\2.11\info.txt" >"E:\Production\WC Prod_RubisExtraction\RubisInfocentre\oracle\info_API_VIDALCIM_ORACLE.txt"
type "N:\dev web\sources\api\oracle\2.11\API VIDALCIM 2-11 ORACLE.sql" >"E:\Production\WC Prod_RubisExtraction\RubisInfocentre\oracle\API_VIDALCIM_ORACLE.txt"
type "N:\dev web\sources\api\oracle\2.11\PACKAGE AVIDAL_LIVRET.sql" >"E:\Production\WC Prod_RubisExtraction\RubisInfocentre\oracle\API_LIVRET_VIDALCIM_ORACLE.txt"

:LIVRET
type "N:\dev web\Production_Bases_VidalCim\Traitement post Extraction-SQLSERVER\CreateTablesLivretVCIM_SQL.sql" >"E:\Production\WC Prod_RubisExtraction\RubisInfocentre\oracle\post-SQL\CreateTablesLivretVCIM_SQL.txt"
:fin
echo fin convutf2ansii.bat
pause