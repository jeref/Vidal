--**
print 'import_Data_RubisInfoCentreProduit.sql'
--V1.2 JFO 29/11/2007
--Remplissage des tables de RubisInfoCentreProduit en version SQL7 (SRV-VID-FABSQL7)
print 'En DEV uniquement !'
Goto NotInDev
use RubisInfoCentreProduit
set nocount ON
--Copie des donn�es de FAB1 vers SQL7 :
--connexion impossible � [SRV-VID-FAB1] lorsqu'on est sur FABSQL7 !!
	DECLARE @query NVARCHAR (1000)

if ( @@servername = 'SRV-VID-FAB1')
BEGIN
	DECLARE @Cur CURSOR
	DECLARE @TableName NVARCHAR (255)
	DECLARE @query NVARCHAR (1000)
	DECLARE @serverName NVARCHAR (255)
	use RubisInfoCentreProduit
	print '--**Copie des donn�es de RubisInfoCentreProduit de ' + @@servername +'vers SRV-VID-FABSQL7'
	set @serverName='BARBARA'
	--set @serverName='SRV-VID-FABSQL7'
	print '--**Copie des donn�es de RubisInfoCentreProduit de ' + @@servername +' vers '+@serverName
	print 'utilise [tmp_TbOrder] de srv-vid-fabsql7 pour faire l''import :'
		SET @Cur = CURSOR LOCAL FOR SELECT name FROM sysobjects WHERE OBJECTPROPERTY(id, N'IsUserTable') = 1 
									And name not like 'tmp_%'
									And name != 'Marqueurs'
									And name != 'TermeRechPhonetique'
									And name > 'TermeRechPhonetique'
group by name
order by name ASC
--select name 
	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @TableName
	WHILE(@@FETCH_STATUS = 0)
    BEGIN
		set @TableName = RTRIM(LTRIM(@TableName))
		SET @query = N'insert into ['+@serverName+'].RubisInfoCentreProduit.dbo.[' + @TableName +N']
						select * from [' + @TableName +N'];'
		print @query
		EXEC sp_executeSQL @query
		FETCH NEXT FROM @Cur INTO @TableName
	END
	CLOSE @Cur
END
ELSE	print 'Le transfert des donn�es ne peuvent se faire que � partir de SRV-VID-FAB1 !'
--Test Unitaire
select count(*) As 'NB specialites en local' from specialite
set @query='select count(*) As ''NB specialites sur ['+@serverName+'].RubisInfoCentreProduit'' from ['+@serverName+'].RubisInfoCentreProduit.dbo.specialite'
exec(@query)
-------------------------------------------------------------------------
--V�rification qu'il n'y a plus de tables temporaires :
--tmp_listTb
IF exists(select name from sysobjects where id = object_id(N'tmp_listTb'))
Begin
print 'suppression tmp_listTb'
drop table tmp_listTb
End
--
NotInDev:
print 'On ne peut pas ins�rer dans une table avec des IDENTITY ! Sans faire un set IDENTITY_INSERT table ON'
print 'privil�gier un DTS !'
/*
set IDENTITY_INSERT [SRV-VID-FABSQL7].RubisInfoCentreProduit.dbo.[TermeRechPhonetique] ON
insert into [SRV-VID-FABSQL7].RubisInfoCentreProduit.dbo.[TermeRechPhonetique]
select * from TermeRechPhonetique
set IDENTITY_INSERT [SRV-VID-FABSQL7].RubisInfoCentreProduit.dbo.[TermeRechPhonetique] OFF
*/
