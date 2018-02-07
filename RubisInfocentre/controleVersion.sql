-- **
print 'controleVersion.sql'
-- V1.0 JFO 10/07/2009 - production numérique - BackOffice VIDAL
-- controle table Version
use RubisInfoCentreProduit;
-- Controles :
Declare @sql As Varchar(1000);
-- select MILLESIME +'2010%''' from RubisExtraction..infobase
select @sql='select TOP 4 * from version  where COMMENTAIRE like ''%' +MILLESIME +'%'' order by DATE_INFO DESC;' from RubisExtraction..infobase;
print @SQL
exec(@sql);