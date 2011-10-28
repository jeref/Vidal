select top 10 * from [SRV-VID-FABSQL7].RubisInfocentreProduit.dbo.version order by date_info desc;
use RubisInfocentreProduit;
select '#Erreur [M' +'icrosoft] ' As flag from [SRV-VID-FABSQL7].RubisInfocentreProduit.dbo.version v, version v1
having v1.MAX(ID_VERSION)!= v.MAX(ID_VERSION);