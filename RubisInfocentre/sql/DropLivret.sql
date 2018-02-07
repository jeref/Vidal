--USE INFOCENTREPRODUIT
-- ============================================================
--   Nom de la base   :  Prod_IRISInfocentreProduit                  
--   Nom de SGBD      :  SQL SERVER 7                    
--   Date de création :  11092002  14:55                     
-- ============================================================



if exists (select * from sysobjects where id = object_id(N'[dbo].[COMPOHOP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[COMPOHOP]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[COMPOHOPTEMP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[COMPOHOPTEMP]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[COMPOVIDAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[COMPOVIDAL]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[COMPOVIDALTEMP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[COMPOVIDALTEMP]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[LIVRETHOP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LIVRETHOP]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[LIVRETHOPTEMP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LIVRETHOPTEMP]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[LivretLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LivretLog]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[LIVRETVIDAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LIVRETVIDAL]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[LIVRETVIDALTEMP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LIVRETVIDALTEMP]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SPEPRESENTATIONHOP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SPEPRESENTATIONHOP]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SPEPRESENTATIONHOPTEMP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SPEPRESENTATIONHOPTEMP]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_SUBHOP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_SUBHOP]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_SUBHOPTEMP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_SUBHOPTEMP]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[TAMPON]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TAMPON]
GO
