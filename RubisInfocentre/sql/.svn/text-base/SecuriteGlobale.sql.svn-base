SET NOCOUNT ON
DECLARE @Cur CURSOR
DECLARE @Name NVARCHAR (255)
DECLARE @TableName NVARCHAR (255)

-- Droits sur les tables autres que les dictionnaires
SET @Cur = CURSOR LOCAL FOR SELECT name FROM sysobjects WHERE OBJECTPROPERTY(id, N'IsUserTable') = 1 
--JFO 31/05/06
--AND name NOT LIKE 'RMC%' AND name NOT LIKE 't0%' AND name NOT LIKE 'PDA%' AND name NOT LIKE 'AVENTIS%' AND name NOT LIKE 'PC_%' 
ORDER BY name

OPEN @Cur
FETCH NEXT FROM @Cur INTO @TableName
WHILE (@@FETCH_STATUS = 0)
BEGIN
	SET @Name = N'GRANT SELECT ON ' + RTRIM(LTRIM(@TableName)) + N' TO IRISLecture'
	EXEC sp_executeSQL @Name

	FETCH NEXT FROM @Cur INTO @TableName
END
CLOSE @Cur
DEALLOCATE @Cur
SET NOCOUNT OFF
GO
dbcc shrinkfile(RUBISInfoCentre_Log,2)