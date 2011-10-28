--**
print 'controleTablesVides.sql'
--V1.0 JFO 09/02/2007
--toutes les tables doivent être remplies sur RubisInfoCentreProduit (sauf exceptions identifiées) !
-- + controle des count de tables entre FAB1 et SQL7

--select '#erreur [M' +'icrosoft] : la table ' +name +' ne devrait pas être vide !' 
--from sysobjects where OBJECTPROPERTY(id, N'IsUserTable') = 1 group by name having count(*) =0 
--La requête a dépassé le nombre maximal d'ensembles de résultats pouvant être affichés dans la grille de résultats. Seuls les 100 premiers ensembles de résultats apparaissent dans la grille.

--JFO 14/02/2007 : RMC_THE_REG est toujours vide !
use RubisInfoCentreProduit
GO
set nocount ON
DECLARE @Cur CURSOR
DECLARE @TableName NVARCHAR (255)
DECLARE @sql NVARCHAR (500)
Declare @SRVSQL7 NVARCHAR(50)
Set @SRVSQL7 = '[SRV-VID-FABSQL7]'
SET @Cur = CURSOR LOCAL FOR 
SELECT name FROM sysobjects WHERE OBJECTPROPERTY(id, N'IsUserTable') = 1 And id <> object_id(N'[dbo].[RMC_THE_REG]') 
And id <> object_id(N'[dbo].[LIVRETHOP]')
And id <> object_id(N'[dbo].[LIVRETHOPTEMP]')
And id <> object_id(N'[dbo].[LivretLog]')
And id <> object_id(N'[dbo].[LIVRETVIDAL]')
And id <> object_id(N'[dbo].[LIVRETVIDALTEMP]')
And id <> object_id(N'[dbo].[SPEPRESENTATIONHOP]')
And id <> object_id(N'[dbo].[SPEPRESENTATIONHOPTEMP]')
And id <> object_id(N'[dbo].[LIVRETVIDALTEMP]')
And id <> object_id(N'[dbo].[LIVRETVIDALTEMP]')
And id <> object_id(N'[dbo].[LIVRETVIDALTEMP]')
And id <> object_id(N'[dbo].[T_SUBHOP]')
And id <> object_id(N'[dbo].[T_SUBHOPTEMP]')
And id <> object_id(N'[dbo].[tampon]')
And id <> object_id(N'[dbo].[COMPOHOPTEMP]')
And id <> object_id(N'[dbo].[COMPOHOP]')
And id <> object_id(N'[dbo].[COMPOVIDAL]')
And id <> object_id(N'[dbo].[COMPOVIDALTEMP]')
--And id <> object_id(N'[dbo].[dtproperties]')
And id <> object_id(N'[dbo].[SpePoso]')
And id <> object_id(N'[dbo].[SpePosoIndic]')
And id <> object_id(N'[dbo].[Marqueurs]')

--SpePoso et SpePosoIndic sont vides car la Maj faite par Pierre Chaillet a été abandonnée (à confirmer auprès de Michele K)
OPEN @Cur
FETCH NEXT FROM @Cur INTO @TableName
--Ajout JFO 10/09/07 :
create table #res(nombre_lignes integer,nom_table varchar(50), serveur VARCHAR(50))
WHILE(@@FETCH_STATUS = 0)
BEGIN
	--Test les tables vides du serveur en cours :
	--print RTRIM(LTRIM(@TableName))
	SET @sql = N'SELECT ''#erreur [M'' +''icrosoft] ==> ' + RTRIM(LTRIM(@TableName)) + N' vide!'' from ' + RTRIM(LTRIM(@TableName)) + N' having count(*) = 0'
	--select '#erreur [M' +'icrosoft] : la table ' +@TableName +' ne devrait pas être vide !' from @TableName having count(*) = 0
        EXEC sp_executeSQL @sql
	/*
	--Comparaison Srv en cours & SQL7
	set @sql = N'SELECT ''#erreur [M'' +''icrosoft] ==> count de ' + RTRIM(LTRIM(@TableName)) + N' ne correspond pas à celui de ' +@SRVSQL7 +N''' from ' + RTRIM(LTRIM(@TableName)) + N' having count(*) != (select count(*) from ' +@SRVSQL7 + N'.RubisInfoCentreProduit.dbo.' + RTRIM(LTRIM(@TableName)) + N')'
	--print @sql
	EXEC sp_executeSQL @sql
	*/
	FETCH NEXT FROM @Cur INTO @TableName
END

Drop Table #Res
--select count(*) from SPEPRESENTATIONHOP 
--tables vides 
--select * from 
--select * from SPEPRESENTATIONHOPTEMP
--select * from T_SUBHOP
--select * from T_SUBHOPTEMP
--select * from tampon
--select * from COMPOHOPTEMP
--
--select * from RMC_REG
--select * from RMC_ORI
--RMC_TYPE RMC_THE RMC_CLE RMC_THE_PRO RMC_THE_HIE RMC_THE_CLE Marqueurs
--idem :
--dtproperties
--select * from SpePoso
--select * from SpePosoIndic
