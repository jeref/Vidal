DECLARE @Cur cursor
DECLARE @TableName NVARCHAR (255)
DECLARE @Name NVARCHAR (255)
SET @Cur = CURSOR LOCAL FOR SELECT name FROM sysobjects WHERE OBJECTPROPERTY(id, N'IsUserTable') = 1 ORDER BY name
OPEN @Cur
FETCH NEXT FROM @Cur INTO @TableName
WHILE (@@FETCH_STATUS = 0)
BEGIN
SET @Name = N'GRANT SELECT ON ' + RTRIM(LTRIM(@TableName)) + N' TO IRISLectureSeule'
EXEC sp_executeSQL @Name
--SET @Name = N'GRANT SELECT, INSERT, UPDATE, DELETE ON ' + RTRIM(LTRIM(@TableName)) + N' TO IRISAdministrateur'
--EXEC sp_executeSQL @Name
print LTRIM(@TableName)
FETCH NEXT FROM @Cur INTO @TableName
END
CLOSE @Cur
DEALLOCATE @Cur
