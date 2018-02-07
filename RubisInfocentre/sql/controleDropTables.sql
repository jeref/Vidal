--**
--controleDropTables.sql
--V1.0 JFO 09/02/2007
--toutes les tables autres que version doivent avoir ete supprimees !
select '#erreur [M' +'icrosoft] : la table ' +name +' ne devrait plus exister !' As Warning from sysobjects where id != object_id(N'[dbo].[version]') and OBJECTPROPERTY(id, N'IsUserTable') = 1
