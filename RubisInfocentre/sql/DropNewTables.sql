--**
print 'DropNewTables.sql' 
--V1.3 JFO 03/04/2008 ajout de la suppression de tmp_listTb
--
-- drop table Substance_Etendue
/*drop table T_SUB_Etendue*/
go
print 'Drop [UCD]'
if exists (select * from sysobjects where id = object_id(N'[dbo].[UCD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UCD]
GO
if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoEphmra]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoEphmra]
GO
print 'Drop [Marqueurs]'
if exists (select * from sysobjects where id = object_id(N'[dbo].[Marqueurs]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Marqueurs]
GO
print 'Drop [dtproperties]'
if exists (select * from sysobjects where id = object_id(N'[dbo].[dtproperties]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[dtproperties]
GO
print 'Drop [TermeRechPhonetique]'
if exists (select * from sysobjects where id = object_id(N'[dbo].[TermeRechPhonetique]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TermeRechPhonetique]
GO
print 'Drop tmp_% tables'
if exists (select * from sysobjects where name like 'tmp_%' and OBJECTPROPERTY(id, N'IsUserTable') = 1 )
BEGIN
	Declare @Cur As cursor
	Declare @Name As Nvarchar(255)
	SET @Cur = CURSOR LOCAL FOR SELECT name FROM sysobjects WHERE OBJECTPROPERTY(id, N'IsUserTable') = 1 
	and name like 'tmp_%'
	--ex: tmp_listTb 
	ORDER BY name
	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @Name
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		SET @Name = N'DROP TABLE [' + RTRIM(LTRIM(@Name)) +']'
		EXEC sp_executeSQL @Name
		print 'fin ' +@Name
		FETCH NEXT FROM @Cur INTO @Name
	END
	CLOSE @Cur
END
GO