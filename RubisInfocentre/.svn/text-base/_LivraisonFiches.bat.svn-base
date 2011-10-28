@echo OFF
rem **
echo _LivraisonFiches.bat
rem V1.0 JFO 10/01/2010
rem  echainemant séparé des batch de création des fiches Vidal.fr (précdemment dans  _CreationComplete_RUBISInfoCentre.bat)
rem -----------------------------------------------------------------------------------------------------------------------------------------------------------------
echo la creation des fiches vidal.fr doivent etre lancees : ..\ProdIRIS_Extraction\createFichesVidalFr.bat
echo c'est fait ?
echo Les fiches (IRIS et Vidal.fr) sont-elles pretes a etre livrees (cf. ..\ProdIRIS_Extraction\Laboratoire\*.htm, Medicament, Substance et Sommaires) ?
:WaitFinFiches
echo Dev : Attendre la fin de la creation des fiches pour lancer la suite (Creation des zip).
call "%~dp0..\ProdIRIS_Livraison\setENV.bat"
rem vérification du fichier des fiches Vidal.fr
echo Attente de la fin de createFichesVidalFr.bat (create fiches Vidal.fr)
%JAVA% WaitForFile "%~dp0..\ProdIRIS_Extraction\FINcreateFichesVidalFr.flag"
:iris
echo creation archive HTML IRIS
start "creation archive HTML IRIS" /WAIT "%~dp0..\ProdIRIS_Livraison\AutoHTML_IRIS.bat"
echo creation archive XML IRIS (nouvelle fenetre d'execution !)
rem fenetre non bloquante
start "creation archive XML IRIS" "%~dp0..\ProdIRIS_Livraison\AutoXML_IRIS.bat"
echo Livraison Software Fiches IRIS (nouvelle fenetre d'execution !)
start "Livraison Software Fiches IRIS" /WAIT "%~dp0..\ProdIRIS_Livraison\maj_Web_IRIS.bat"
:vfr
echo Creation archive XML VidalFR (nouvelle fenetre d'execution !)
rem fenetre non bloquante
start "Creation archive XML VidalFR" "%~dp0..\ProdIRIS_Livraison\AutoXML_VidalFR.bat"
rem fenetres bloquantes
:debug
echo %~dp0..\ProdIRIS_Livraison\AutoHTML_VidalFR.bat
start "Creation archive HTML VidalFR" /WAIT "%~dp0..\ProdIRIS_Livraison\AutoHTML_VidalFR.bat"
:LivraisonSoftware
echo "Livraison Software Fiches VidalFR (nouvelle fenetre d'execution !) ...
start "Livraison Software Fiches VidalFR" /WAIT "%~dp0..\ProdIRIS_Livraison\maj_Web_VidalFr.bat"
:FIN
echo FIN %~nx0
pause 