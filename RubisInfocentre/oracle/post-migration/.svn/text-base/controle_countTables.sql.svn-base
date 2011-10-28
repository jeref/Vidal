--**
print 'controle_countTables.sql'
-- V1.3 JFO29/08/2009
-- Après la prod Oracle
--Vérification de la base Oracle
--Exécuter cette requête qui crée un script (affichage du select final) à exécuter sur Oracle.
--ex : ed controle sur SQL+ de PC-jforicheur1
/*
select name into msdb..RubisInfoCentreProduitTABLES from RubisInfoCentreProduit.sys.tables
Alter table msdb..RubisInfoCentreProduitTABLES Add cpt int
*/
use RubisInfoCentreProduit;
GO
set NOCOUNT ON
Declare @tb CURSOR
Declare @ltb Varchar(255)
Declare @cp int
set @tb = CURSOR LOCAL FOR select name from msdb..RubisInfoCentreProduitTABLES order by name
open @tb
FETCH NEXT FROM @tb INTO @ltb
WHILE (@@FETCH_STATUS = 0)
BEGIN
-- print 'update cpt ' +@ltb
exec('update msdb..RubisInfoCentreProduitTABLES set cpt=(select count(*) from ' +@ltb +') where name = ''' +@ltb +''' ')
FETCH NEXT FROM @tb INTO @ltb
END
close @tb
--select final :
select cast('select count(*), ''Microsoft : ' + name +' doit avoir ' +cast(cpt As Varchar) +' lignes !'' As flag from ' + name +' having count(*) != ' +cast(cpt As Varchar) +' ;'  As Varchar(4000)) As sql from msdb..RubisInfoCentreProduitTABLES
--, ''#erreur [M'' +''icrosoft] : ' +name + ' ne possede pas ' +cast(cpt As Varchar) +' lignes !'' As erreur '
--test supplementaire manuel :
print 'select max(ID_DOCUMENT) As ''MAX de id_Document'' from documents'
select max(ID_DOCUMENT) As 'MAX de id_Document' from documents
/*
+' OR count(*) < ' +cast(cpt As Varchar) from msdb..RubisInfoCentreProduitTABLES
select 'select count(*), ''' +name + ' '  +cast(cpt As Varchar) +' lignes !'' As erreur from ' + name from msdb..RubisInfoCentreProduitTABLES
*/