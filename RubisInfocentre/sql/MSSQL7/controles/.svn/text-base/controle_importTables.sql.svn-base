--**
print 'controle_importTables.sql'
--JFO 01/09/2005 : pour trouver les tables vides de RubisInfocentreProduit
--Il ne faut avoir en résultat que :
--dtproperties, RMC_THE_REG, tampon
--Speposo, SpePosoIndic
--LIVRET*, SPEPRESENTATIONHOP*, T_SUBHOP*, COMPOHOP*, COMPOVIDAL*
--Attention à ne pas laisser les tables temporaires!
-----------------------------------------------------------------------------------------
use RubisInfocentreProduit
GO
declare @table Nvarchar(50)
declare @sql Nvarchar(500)
declare @serverSQL7 Nvarchar(50)
------------------------------------------------
--------VARIABLE :
------------------------------------------------
set @serverSQL7=N'[SRV-VID-FABSQL7]'
--set @serverSQL7=N'[BARBARA]'
------------------------------------------------
print 'traitement sur ' + @@servername
if (@@servername != 'SRV-VID-FAB1') 
BEGIN
	print 'Ces requetes doivent êtres passées sur SRV-VID-FAB1 (serveur de prod principal)'
	print 'car elles utilisent le serveur lié ' +@serverSQL7
	goto EndTest
END
Set NoCount ON
--Table utilisee pour la comparaison :
create table #MyTable1(nombre_lignes integer,nom_table Nvarchar(50), serveur VARCHAR(50))

--#MyTable = liste des tables de la base RubisInfocentreProduit en cours
select name into #MyTable from sysobjects 
where type = 'U' And name not like 'tmp_%' And name != 'dtproperties'
--
select 'NB tables from FAB1=' + cast(count(*) As varchar) from #MyTable 
--407
set @sql = N'select ''NB tables from ' +@serverSQL7 +'='' +cast(count(*) As varchar) from ' +@serverSQL7 +'.RubisInfocentreProduit.dbo.sysobjects 
where type = ''U'' And name not like ''tmp_%'' And name != ''dtproperties'''
exec(@sql)
--409
declare curseur cursor for select name from #mytable
open curseur
fetch curseur into @table
--Ajout du nombre de lignes pour chaque table dans #MyTable1
while @@FETCH_STATUS = 0
begin
	 --tables de FAB1 :
	 set @sql = N'SELECT count(*),'' '+@table+N''', ''FAB1'' FROM '+@table
	 INSERT INTO #MyTable1
	 --sp_executesql @sql
	 exec(@sql)
	--Tables de @serverSQL7 : 
	 set @sql = 'SELECT count(*),'' '+@table+''', ''' +@serverSQL7 +''' FROM ' +@serverSQL7 +'.RubisInfocentreProduit.dbo.'+@table
	 --select count(*), 'Specialite' from [BARBARA].RubisInfocentreProduit.dbo.Specialite
	--select count(*), ' RMC_CLE' from [BARBARA].RubisInfocentreProduit.dbo.[RMC_CLE]
	 print 'test ' +@table
	 INSERT INTO #MyTable1
	 --sp_executesql @sql
--N'select * from sysobjects'
	 exec(@sql)
	 fetch curseur into @table
end
--fin de boucle
close curseur
deallocate curseur
--Affichage des tables vides
print '--tables vides :'
select nom_table, nombre_lignes from #mytable1 where nombre_lignes = 0 order by nom_table

print '--les tables dont le nombre de lignes ne correspond pas à celui de FAB1 :'
select mt1.nom_table, mt1.nombre_lignes As 'From FAB1', mt2.nombre_lignes As 'From server SQL7' from #mytable1 As mt1 , #mytable1 As mt2 
where mt1.nom_table = mt2.nom_table And mt1.serveur = 'FAB1' And mt2.serveur = @serverSQL7
And mt1.nombre_lignes != mt2.nombre_lignes order by mt1.nom_table

drop table #Mytable
drop table #Mytable1
endTest:
