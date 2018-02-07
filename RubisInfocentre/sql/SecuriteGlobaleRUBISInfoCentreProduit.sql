--**
--SecuriteGlobaleRUBISInfocentreProduit.sql
--JFO 19/05/2006 - VIDAL

use RubisInfocentreProduit
SET NOCOUNT ON
DECLARE @Cur CURSOR
DECLARE @Name NVARCHAR (255)
DECLARE @TableName NVARCHAR (255)

-- Droits sur les vues
/*
SET @Cur = CURSOR LOCAL FOR SELECT name FROM sysobjects WHERE OBJECTPROPERTY(id, N'IsView') = 1 AND name LIKE 'INFOIRIS_%' ORDER BY name

OPEN @Cur
FETCH NEXT FROM @Cur INTO @TableName
WHILE (@@FETCH_STATUS = 0)
BEGIN
	print RTRIM(LTRIM(@TableName))
	SET @Name = N'GRANT SELECT ON ' + RTRIM(LTRIM(@TableName)) + N' TO IRISLectureSeule'
	EXEC sp_executeSQL @Name

	SET @Name = N'GRANT SELECT, INSERT, UPDATE, DELETE ON ' + RTRIM(LTRIM(@TableName)) + N' TO IRISAdministrateur'
	EXEC sp_executeSQL @Name

	FETCH NEXT FROM @Cur INTO @TableName
END
CLOSE @Cur
DEALLOCATE @Cur
*/
-----------------------------------------------------------------
print 'Droits sur tables'
SET @Cur = CURSOR LOCAL FOR SELECT name FROM sysobjects WHERE OBJECTPROPERTY(id, N'IsUserTable') = 1 ORDER BY name

OPEN @Cur
FETCH NEXT FROM @Cur INTO @TableName
WHILE (@@FETCH_STATUS = 0)
BEGIN
	print RTRIM(LTRIM(@TableName))
	SET @Name = N'GRANT SELECT ON ' + RTRIM(LTRIM(@TableName)) + N' TO IRISLectureSeule'
	EXEC sp_executeSQL @Name

	SET @Name = N'GRANT SELECT, INSERT, UPDATE, DELETE ON ' + RTRIM(LTRIM(@TableName)) + N' TO IRISAdministrateur'
	EXEC sp_executeSQL @Name

	FETCH NEXT FROM @Cur INTO @TableName
END
CLOSE @Cur
DEALLOCATE @Cur

SET NOCOUNT OFF