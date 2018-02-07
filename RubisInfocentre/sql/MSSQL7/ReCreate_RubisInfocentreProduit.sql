--**
--ReCreate_RubisInfoCentreProduit.sql
--V1.0 - JFO 29/11/2007
--suppression des objets et re-creation de la base RubisInfoCentreProduit jusqu'à la création des clefs étrangères et les droits (exclus)
--Ceci permet de réaliser le transfert des données dans un deuxième temps : DTS ou ImportDataFromFAB1_RubisInfoCentreProduit.sql
--puis de finaliser (3e étape) la base avec ReCreate_RubisInfoCentreProduit_FK.sql
--dure environ 1 minute. Si l'exécution est plus longue, arrêter manuellement et les logs devraient confirmer que la connexion se fait sur un serveur inapproprié !
select @@spid As 'spid'
--sp_who
print '--**check server : ' + @@servername
if (@@servername != 'BARBARA' And @@servername != 'SRV-VID-FABSQL7') goto NotAGoodServer
goto run
NotAGoodServer:
print 'Not A Good Server !'
DECLARE @k As Varchar(250)
DECLARE @chk As Varchar(250)
set @k = 'kill ' +cast(@@spid As Varchar(10))
set @chk = 'kill ' +cast(@@spid As Varchar(10)) +' WITH STATUSONLY'
exec(@k)
KillRunning:
print 'KillRunning'
exec(@chk);
goto KillRunning
run:
GO
print '--#run#'
GO
use RubisInfoCentreProduit
/****** Objet :  ForeignKey [FK_COMPOHOP_LIEN_13_SPEPRESE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_COMPOHOP_LIEN_13_SPEPRESE]') AND type = 'F')
ALTER TABLE [dbo].[COMPOHOP] DROP CONSTRAINT [FK_COMPOHOP_LIEN_13_SPEPRESE]
GO
/****** Objet :  ForeignKey [FK_COMPOHOP_LIEN_14_T_SUBHOP]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_COMPOHOP_LIEN_14_T_SUBHOP]') AND type = 'F')
ALTER TABLE [dbo].[COMPOHOP] DROP CONSTRAINT [FK_COMPOHOP_LIEN_14_T_SUBHOP]
GO
/****** Objet :  ForeignKey [FK_COMPOVID_LIEN_116_SPEPRESE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_COMPOVID_LIEN_116_SPEPRESE]') AND type = 'F')
ALTER TABLE [dbo].[COMPOVIDAL] DROP CONSTRAINT [FK_COMPOVID_LIEN_116_SPEPRESE]
GO
/****** Objet :  ForeignKey [FK_COMPOVID_LIEN_117_T_SUB]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_COMPOVID_LIEN_117_T_SUB]') AND type = 'F')
ALTER TABLE [dbo].[COMPOVIDAL] DROP CONSTRAINT [FK_COMPOVID_LIEN_117_T_SUB]
GO
/****** Objet :  ForeignKey [FK_LIVRETHO_ASSOC_122_SPEPRESE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_LIVRETHO_ASSOC_122_SPEPRESE]') AND type = 'F')
ALTER TABLE [dbo].[LIVRETHOP] DROP CONSTRAINT [FK_LIVRETHO_ASSOC_122_SPEPRESE]
GO
/****** Objet :  ForeignKey [FK_LIVRETVI_ASSOC_244_SPEPRESE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_LIVRETVI_ASSOC_244_SPEPRESE]') AND type = 'F')
ALTER TABLE [dbo].[LIVRETVIDAL] DROP CONSTRAINT [FK_LIVRETVI_ASSOC_244_SPEPRESE]
GO
/****** Objet :  ForeignKey [FK_RMC_CLE_THE_ORI_RMC_ORI]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_CLE_THE_ORI_RMC_ORI]') AND type = 'F')
ALTER TABLE [dbo].[RMC_CLE] DROP CONSTRAINT [FK_RMC_CLE_THE_ORI_RMC_ORI]
GO
/****** Objet :  ForeignKey [FK_RMC_CLE_TYPE_MOT__RMC_TYPE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_CLE_TYPE_MOT__RMC_TYPE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_CLE] DROP CONSTRAINT [FK_RMC_CLE_TYPE_MOT__RMC_TYPE]
GO
/****** Objet :  ForeignKey [FK_RMC_REG_A_COMME_P_RMC_REG]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_REG_A_COMME_P_RMC_REG]') AND type = 'F')
ALTER TABLE [dbo].[RMC_REG] DROP CONSTRAINT [FK_RMC_REG_A_COMME_P_RMC_REG]
GO
/****** Objet :  ForeignKey [FK_RMC_THE_TYPE_THES_RMC_TYPE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE_TYPE_THES_RMC_TYPE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE] DROP CONSTRAINT [FK_RMC_THE_TYPE_THES_RMC_TYPE]
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_61_RMC_THE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_61_RMC_THE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_CLE] DROP CONSTRAINT [FK_RMC_THE__LIEN_61_RMC_THE]
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_62_RMC_CLE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_62_RMC_CLE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_CLE] DROP CONSTRAINT [FK_RMC_THE__LIEN_62_RMC_CLE]
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_64_RMC_REG]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_64_RMC_REG]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_CLE] DROP CONSTRAINT [FK_RMC_THE__LIEN_64_RMC_REG]
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_59_RMC_THE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_59_RMC_THE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_HIE] DROP CONSTRAINT [FK_RMC_THE__LIEN_59_RMC_THE]
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_60_RMC_THE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_60_RMC_THE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_HIE] DROP CONSTRAINT [FK_RMC_THE__LIEN_60_RMC_THE]
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_56_RMC_THE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_56_RMC_THE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_PRO] DROP CONSTRAINT [FK_RMC_THE__LIEN_56_RMC_THE]
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_63_RMC_THE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_63_RMC_THE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_PRO] DROP CONSTRAINT [FK_RMC_THE__LIEN_63_RMC_THE]
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_67_RMC_REG]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_67_RMC_REG]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_REG] DROP CONSTRAINT [FK_RMC_THE__LIEN_67_RMC_REG]
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_68_RMC_THE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_68_RMC_THE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_REG] DROP CONSTRAINT [FK_RMC_THE__LIEN_68_RMC_THE]
GO
/****** Objet :  ForeignKey [FK_SAUMON_SAUMONLIE_LABOSAUM]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_SAUMON_SAUMONLIE_LABOSAUM]') AND type = 'F')
ALTER TABLE [dbo].[SAUMON] DROP CONSTRAINT [FK_SAUMON_SAUMONLIE_LABOSAUM]
GO
/****** Objet :  ForeignKey [FK_SpeCompo_Lien_Specialite]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_SpeCompo_Lien_Specialite]') AND type = 'F')
ALTER TABLE [dbo].[SpeCompo] DROP CONSTRAINT [FK_SpeCompo_Lien_Specialite]
GO
/****** Objet :  ForeignKey [FK_SpePresentation__Specialite]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_SpePresentation__Specialite]') AND type = 'F')
ALTER TABLE [dbo].[SpePresentation] DROP CONSTRAINT [FK_SpePresentation__Specialite]
GO
/****** Objet :  ForeignKey [FK_Substance_Lien_T_Sub]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Substance_Lien_T_Sub]') AND type = 'F')
ALTER TABLE [dbo].[Substance] DROP CONSTRAINT [FK_Substance_Lien_T_Sub]
GO
/****** Objet :  Default [DF__DicoCodeG__CodeI__656B779F]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__DicoCodeG__CodeI__656B779F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DicoCodeGene] DROP CONSTRAINT [DF__DicoCodeG__CodeI__656B779F]

END
GO
/****** Objet :  Default [DF__DicoCodeG__CodeC__665F9BD8]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__DicoCodeG__CodeC__665F9BD8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DicoCodeGene] DROP CONSTRAINT [DF__DicoCodeG__CodeC__665F9BD8]

END
GO
/****** Objet :  Default [DF__DicoCodeG__CodeC__6753C011]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__DicoCodeG__CodeC__6753C011]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DicoCodeGene] DROP CONSTRAINT [DF__DicoCodeG__CodeC__6753C011]

END
GO
/****** Objet :  Default [DF__DicoCodeG__CodeI__6847E44A]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__DicoCodeG__CodeI__6847E44A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DicoCodeGene] DROP CONSTRAINT [DF__DicoCodeG__CodeI__6847E44A]

END
GO
/****** Objet :  Default [DF__DicoCodeG__CodeE__693C0883]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__DicoCodeG__CodeE__693C0883]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DicoCodeGene] DROP CONSTRAINT [DF__DicoCodeG__CodeE__693C0883]

END
GO
/****** Objet :  StoredProcedure [dbo].[p_Upd_SUBHOP]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Upd_SUBHOP]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Upd_SUBHOP]
GO
/****** Objet :  StoredProcedure [dbo].[p_Upd_SpePresentationHop]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Upd_SpePresentationHop]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Upd_SpePresentationHop]
GO
/****** Objet :  StoredProcedure [dbo].[p_Ins_Livret]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Ins_Livret]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Ins_Livret]
GO
/****** Objet :  StoredProcedure [dbo].[p_Ins_Compo]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Ins_Compo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Ins_Compo]
GO
/****** Objet :  StoredProcedure [dbo].[p_Ins_SpePresentationHop]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Ins_SpePresentationHop]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Ins_SpePresentationHop]
GO
/****** Objet :  StoredProcedure [dbo].[p_Del_SubHop]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Del_SubHop]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Del_SubHop]
GO
/****** Objet :  StoredProcedure [dbo].[p_Del_Livret]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Del_Livret]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Del_Livret]
GO
/****** Objet :  StoredProcedure [dbo].[p_Del_SpepresentationHop]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Del_SpepresentationHop]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Del_SpepresentationHop]
GO
/****** Objet :  Table [dbo].[Presentation_Documents]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Presentation_Documents]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Presentation_Documents]
GO
/****** Objet :  Table [dbo].[T_Sub_Parent]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_Sub_Parent]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_Sub_Parent]
GO
/****** Objet :  Table [dbo].[COMPOVIDAL]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[COMPOVIDAL]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[COMPOVIDAL]
GO
/****** Objet :  Table [dbo].[COMPOHOP]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[COMPOHOP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[COMPOHOP]
GO
/****** Objet :  Table [dbo].[COMPOHOPTEMP]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[COMPOHOPTEMP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[COMPOHOPTEMP]
GO
/****** Objet :  StoredProcedure [dbo].[GetCIPGenGroup_txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCIPGenGroup_txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCIPGenGroup_txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetCipSpe_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipSpe_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCipSpe_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetCipUCD_txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipUCD_txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCipUCD_txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetCipSpeDopante_txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipSpeDopante_txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCipSpeDopante_txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetCip_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCip_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCip_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetCipDoc_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipDoc_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCipDoc_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[P_InsUpd_Livret]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[P_InsUpd_Livret]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[P_InsUpd_Livret]
GO
/****** Objet :  Table [dbo].[LIVRETHOP]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LIVRETHOP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[LIVRETHOP]
GO
/****** Objet :  Table [dbo].[LIVRETHOPTEMP]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LIVRETHOPTEMP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[LIVRETHOPTEMP]
GO
/****** Objet :  Table [dbo].[LIVRETVIDALTEMP]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LIVRETVIDALTEMP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[LIVRETVIDALTEMP]
GO
/****** Objet :  Table [dbo].[tampon]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tampon]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tampon]
GO
/****** Objet :  Table [dbo].[LIVRETVIDAL]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LIVRETVIDAL]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[LIVRETVIDAL]
GO
/****** Objet :  StoredProcedure [dbo].[GetGenGroup_txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetGenGroup_txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetGenGroup_txt]
GO
/****** Objet :  Table [dbo].[COMPOVIDALTEMP]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[COMPOVIDALTEMP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[COMPOVIDALTEMP]
GO
/****** Objet :  Table [dbo].[T_Sub_Complement]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_Sub_Complement]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_Sub_Complement]
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstsDopantes_txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstsDopantes_txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSubstsDopantes_txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetSubsts_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubsts_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSubsts_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[p_GetSubsts]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetSubsts]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_GetSubsts]
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstsParentMV_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstsParentMV_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSubstsParentMV_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeLabo_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeLabo_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpeLabo_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstSpes_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstSpes_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSubstSpes_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetThera_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetThera_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetThera_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetTheraParent_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetTheraParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetTheraParent_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetTheraChild_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetTheraChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetTheraChild_Id]
GO
/****** Objet :  Table [dbo].[CimCI]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CimCI]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[CimCI]
GO
/****** Objet :  Table [dbo].[CoupleTermeSynonyme]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CoupleTermeSynonyme]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[CoupleTermeSynonyme]
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstParent_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSubstParent_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstFull_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstFull_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSubstFull_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstChild_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSubstChild_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstAncester_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstAncester_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSubstAncester_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSubst_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubst_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSubst_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeVoies_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeVoies_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpeVoies_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeTheras_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeTheras_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpeTheras_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeSubsts_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeSubsts_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpeSubsts_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeSPs_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeSPs_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpeSPs_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeEvts_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeEvts_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpeEvts_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeEphmras_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeEphmras_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpeEphmras_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeDoc_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeDoc_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpeDoc_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeCipsInLivret_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeCipsInLivret_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpeCipsInLivret_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeCips_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeCips_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpeCips_Id]
GO
/****** Objet :  Table [dbo].[TermeRechPhonetique]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[TermeRechPhonetique]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[TermeRechPhonetique]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeIndics_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeIndics_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpeIndics_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeIAMClasses_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeIAMClasses_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpeIAMClasses_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpe_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpe_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpe_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSPCIM10s_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSPCIM10s_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSPCIM10s_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetNoIAMSpe_txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetNoIAMSpe_txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetNoIAMSpe_txt]
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCipDoc]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCipDoc]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_GetCipDoc]
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCip]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCip]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_GetCip]
GO
/****** Objet :  Table [dbo].[IAMClasse_IAMCouple]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[IAMClasse_IAMCouple]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[IAMClasse_IAMCouple]
GO
/****** Objet :  Table [dbo].[IndexSub_Rel]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[IndexSub_Rel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[IndexSub_Rel]
GO
/****** Objet :  Table [dbo].[GroupIndic]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GroupIndic]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[GroupIndic]
GO
/****** Objet :  StoredProcedure [dbo].[p_ConnectByFils]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_ConnectByFils]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_ConnectByFils]
GO
/****** Objet :  Table [dbo].[CoupleTermeTerme]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CoupleTermeTerme]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[CoupleTermeTerme]
GO
/****** Objet :  StoredProcedure [dbo].[p_Connect_By]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Connect_By]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Connect_By]
GO
/****** Objet :  StoredProcedure [dbo].[GetTheraSpes_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetTheraSpes_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetTheraSpes_Id]
GO
/****** Objet :  Table [dbo].[HierarchieCI_Rel]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[HierarchieCI_Rel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[HierarchieCI_Rel]
GO
/****** Objet :  StoredProcedure [dbo].[P_Del_Compo]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[P_Del_Compo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[P_Del_Compo]
GO
/****** Objet :  Table [dbo].[GroupIndicIndic_Rel]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GroupIndicIndic_Rel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[GroupIndicIndic_Rel]
GO
/****** Objet :  Table [dbo].[IAMCouple]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[IAMCouple]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[IAMCouple]
GO
/****** Objet :  Table [dbo].[IAMClass]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[IAMClass]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[IAMClass]
GO
/****** Objet :  Table [dbo].[T_Indic]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_Indic]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_Indic]
GO
/****** Objet :  Table [dbo].[T_SynonyCI]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_SynonyCI]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_SynonyCI]
GO
/****** Objet :  Table [dbo].[SynonyCI_Rel]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SynonyCI_Rel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SynonyCI_Rel]
GO
/****** Objet :  Table [dbo].[SynonyIndic_Rel]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SynonyIndic_Rel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SynonyIndic_Rel]
GO
/****** Objet :  Table [dbo].[T_CI]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_CI]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_CI]
GO
/****** Objet :  Table [dbo].[SpeVoie]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeVoie]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SpeVoie]
GO
/****** Objet :  Table [dbo].[SubPE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SubPE]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SubPE]
GO
/****** Objet :  Table [dbo].[SpeSuiviSGML]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeSuiviSGML]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SpeSuiviSGML]
GO
/****** Objet :  Table [dbo].[SpePoso]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpePoso]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SpePoso]
GO
/****** Objet :  StoredProcedure [dbo].[p_GetNoIAMSpe]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetNoIAMSpe]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_GetNoIAMSpe]
GO
/****** Objet :  Table [dbo].[SpeLabs_Rel]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeLabs_Rel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SpeLabs_Rel]
GO
/****** Objet :  Table [dbo].[SpePosoIndic]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpePosoIndic]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SpePosoIndic]
GO
/****** Objet :  Table [dbo].[SpeClassIRIS]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeClassIRIS]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SpeClassIRIS]
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCips_Specialite]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCips_Specialite]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_GetCips_Specialite]
GO
/****** Objet :  Table [dbo].[Specialite_IAMClass]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Specialite_IAMClass]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Specialite_IAMClass]
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCips_Liste_Thera]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCips_Liste_Thera]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_GetCips_Liste_Thera]
GO
/****** Objet :  Table [dbo].[SpeCompo]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeCompo]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SpeCompo]
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCipSpe]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCipSpe]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_GetCipSpe]
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCips_Liste_ATC]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCips_Liste_ATC]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_GetCips_Liste_ATC]
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCips_Laboratoire]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCips_Laboratoire]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_GetCips_Laboratoire]
GO
/****** Objet :  Table [dbo].[SpeConditionnementPrimaire]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeConditionnementPrimaire]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SpeConditionnementPrimaire]
GO
/****** Objet :  Table [dbo].[SpeEvt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeEvt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SpeEvt]
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCipsWithLivret]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCipsWithLivret]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_GetCipsWithLivret]
GO
/****** Objet :  Table [dbo].[SpeEvtPresentation]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeEvtPresentation]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SpeEvtPresentation]
GO
/****** Objet :  StoredProcedure [dbo].[GetIAMClass_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIAMClass_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetIAMClass_Id]
GO
/****** Objet :  Table [dbo].[DicoEphmra]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DicoEphmra]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[DicoEphmra]
GO
/****** Objet :  StoredProcedure [dbo].[GetIAMClassCips_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIAMClassCips_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetIAMClassCips_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetIAMClassIAMClasses_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIAMClassIAMClasses_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetIAMClassIAMClasses_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetIndic_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIndic_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetIndic_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetIAMClassSpes_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIAMClassSpes_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetIAMClassSpes_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetIndicSpes_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIndicSpes_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetIndicSpes_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetIndicSPs_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIndicSPs_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetIndicSPs_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetCipSpe_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipSpe_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCipSpe_Id]
GO
/****** Objet :  Table [dbo].[SPEPRESENTATIONHOP]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SPEPRESENTATIONHOP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SPEPRESENTATIONHOP]
GO
/****** Objet :  Table [dbo].[DicoComClassIRIS]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DicoComClassIRIS]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[DicoComClassIRIS]
GO
/****** Objet :  Table [dbo].[SPEPRESENTATIONHOPTEMP]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SPEPRESENTATIONHOPTEMP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SPEPRESENTATIONHOPTEMP]
GO
/****** Objet :  Table [dbo].[DicoRF_CIM]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DicoRF_CIM]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[DicoRF_CIM]
GO
/****** Objet :  StoredProcedure [dbo].[GetCipsWithLivret_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipsWithLivret_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCipsWithLivret_Id]
GO
/****** Objet :  Table [dbo].[T_SUBHOP]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_SUBHOP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_SUBHOP]
GO
/****** Objet :  Table [dbo].[DicoT_ATC_IRIS]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DicoT_ATC_IRIS]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[DicoT_ATC_IRIS]
GO
/****** Objet :  Table [dbo].[T_SUBHOPTEMP]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_SUBHOPTEMP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_SUBHOPTEMP]
GO
/****** Objet :  Table [dbo].[GroupIndic_DicoRF_CIM_Rel]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GroupIndic_DicoRF_CIM_Rel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[GroupIndic_DicoRF_CIM_Rel]
GO
/****** Objet :  StoredProcedure [dbo].[GetCipDoc_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipDoc_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCipDoc_Id]
GO
/****** Objet :  Table [dbo].[DicoCodeGene]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DicoCodeGene]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[DicoCodeGene]
GO
/****** Objet :  StoredProcedure [dbo].[GetCipFull_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipFull_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCipFull_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetCIndicAncesters_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCIndicAncesters_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCIndicAncesters_Id]
GO
/****** Objet :  StoredProcedure [dbo].[P_Upd_Livret]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[P_Upd_Livret]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[P_Upd_Livret]
GO
/****** Objet :  StoredProcedure [dbo].[GetCIndicCIM10s_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCIndicCIM10s_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCIndicCIM10s_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetCip_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCip_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCip_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetCIndicSpes_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCIndicSpes_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCIndicSpes_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetCIndicParent_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCIndicParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCIndicParent_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetCIndicChild_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCIndicChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCIndicChild_Id]
GO
/****** Objet :  Table [dbo].[T_SynonyIndic]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_SynonyIndic]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_SynonyIndic]
GO
/****** Objet :  Table [dbo].[T_SynonySub]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_SynonySub]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_SynonySub]
GO
/****** Objet :  Table [dbo].[Type_Documents]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Type_Documents]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Type_Documents]
GO
/****** Objet :  StoredProcedure [dbo].[GetCindic_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCindic_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCindic_Id]
GO
/****** Objet :  Table [dbo].[Documents]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Documents]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Documents]
GO
/****** Objet :  Table [dbo].[SpeConstituant]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeConstituant]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SpeConstituant]
GO
/****** Objet :  Table [dbo].[SpeIndic]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeIndic]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SpeIndic]
GO
/****** Objet :  Table [dbo].[SpePE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpePE]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SpePE]
GO
/****** Objet :  Table [dbo].[SpePresentation]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpePresentation]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SpePresentation]
GO
/****** Objet :  Table [dbo].[Substance]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Substance]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Substance]
GO
/****** Objet :  Table [dbo].[T_CI_CIMCI_Rel]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_CI_CIMCI_Rel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_CI_CIMCI_Rel]
GO
/****** Objet :  Table [dbo].[T_Sub]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_Sub]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_Sub]
GO
/****** Objet :  Table [dbo].[Laboratoire]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Laboratoire]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Laboratoire]
GO
/****** Objet :  Table [dbo].[Specialite]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Specialite]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Specialite]
GO
/****** Objet :  Table [dbo].[SpeCI]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeCI]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SpeCI]
GO
/****** Objet :  Table [dbo].[SpePharmacodynamie]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpePharmacodynamie]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SpePharmacodynamie]
GO
/****** Objet :  Table [dbo].[RMOClass]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMOClass]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RMOClass]
GO
/****** Objet :  Table [dbo].[RMC_THE_PRO]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_PRO]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RMC_THE_PRO]
GO
/****** Objet :  Table [dbo].[RMC_THE_HIE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_HIE]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RMC_THE_HIE]
GO
/****** Objet :  Table [dbo].[RMC_THE_CLE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_CLE]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RMC_THE_CLE]
GO
/****** Objet :  Table [dbo].[RMC_CLE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_CLE]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RMC_CLE]
GO
/****** Objet :  Table [dbo].[RMC_THE_REG]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_REG]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RMC_THE_REG]
GO
/****** Objet :  Table [dbo].[RMC_THE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_THE]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RMC_THE]
GO
/****** Objet :  Table [dbo].[SAUMON]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SAUMON]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[SAUMON]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_IsProfilParent_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_IsProfilParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_IsProfilParent_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetLabo_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetLabo_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetLabo_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_IsProfilChild_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_IsProfilChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_IsProfilChild_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetLabo_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetLabo_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetLabo_Id]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_IsHierarchyParent_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_IsHierarchyParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_IsHierarchyParent_Id]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_IsHierarchyChild_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_IsHierarchyChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_IsHierarchyChild_Id]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetThera_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetThera_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetThera_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetIndics_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIndics_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetIndics_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetSubst_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetSubst_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetSubst_Id]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetSpeLivret_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetSpeLivret_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetSpeLivret_Id]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetSpe_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetSpe_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetSpe_Id]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetProfilParent_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetProfilParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetProfilParent_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetIAMClassesSpeCouples_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIAMClassesSpeCouples_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetIAMClassesSpeCouples_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetProfilChild_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetProfilChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetProfilChild_Id]
GO
/****** Objet :  Table [dbo].[RMC_TYPE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_TYPE]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RMC_TYPE]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetLabo_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetLabo_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetLabo_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetFirstCIndic]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetFirstCIndic]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetFirstCIndic]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetIndic_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetIndic_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetIndic_Id]
GO
/****** Objet :  StoredProcedure [admin3].[ReplaceAccent]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[admin3].[ReplaceAccent]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [admin3].[ReplaceAccent]
GO
/****** Objet :  Table [dbo].[RMC_ORI]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_ORI]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RMC_ORI]
GO
/****** Objet :  StoredProcedure [dbo].[GetGenGroupTheras_id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetGenGroupTheras_id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetGenGroupTheras_id]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetIamClass_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetIamClass_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetIamClass_Id]
GO
/****** Objet :  StoredProcedure [admin3].[New_Soundex]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[admin3].[New_Soundex]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [admin3].[New_Soundex]
GO
/****** Objet :  StoredProcedure [dbo].[GetGenGroupCIPs_id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetGenGroupCIPs_id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetGenGroupCIPs_id]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetHierarchyParent_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetHierarchyParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetHierarchyParent_Id]
GO
/****** Objet :  StoredProcedure [admin3].[GetTitle]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[admin3].[GetTitle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [admin3].[GetTitle]
GO
/****** Objet :  Table [dbo].[RMC_REG]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_REG]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RMC_REG]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetHierarchyChild_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetHierarchyChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetHierarchyChild_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetFirstThera]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetFirstThera]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetFirstThera]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetHie_Pro_GINDIC]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetHie_Pro_GINDIC]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetHie_Pro_GINDIC]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetHie_Pro]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetHie_Pro]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetHie_Pro]
GO
/****** Objet :  StoredProcedure [dbo].[GetFirstATC]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetFirstATC]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetFirstATC]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetGIndic_Prob_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetGIndic_Prob_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetGIndic_Prob_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetFromKeyWordLivret_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetFromKeyWordLivret_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetFromKeyWordLivret_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetGIndic_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetGIndic_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetGIndic_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetCipsWithLivret_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipsWithLivret_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCipsWithLivret_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetFromKeyWord2_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetFromKeyWord2_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetFromKeyWord2_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetFromKeyWord_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetFromKeyWord_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetFromKeyWord_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetCipSpeDopante_id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipSpeDopante_id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCipSpeDopante_id]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetCIP_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetCIP_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetCIP_Id]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetCIndic_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetCIndic_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetCIndic_Id]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetCIM10Info_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetCIM10Info_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetCIM10Info_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetCips_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCips_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCips_Txt]
GO
/****** Objet :  Table [dbo].[LivretLog]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LivretLog]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[LivretLog]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetCIM10FromCode_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetCIM10FromCode_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetCIM10FromCode_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetCips_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCips_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCips_Id]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetCim10Corres_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetCim10Corres_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetCim10Corres_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_Detect_iam_ci_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_Detect_iam_ci_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_Detect_iam_ci_Txt]
GO
/****** Objet :  Table [dbo].[UCD]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[UCD]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[UCD]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetCIM10_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetCIM10_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_GetCIM10_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetCipGen_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipGen_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCipGen_Id]
GO
/****** Objet :  StoredProcedure [dbo].[RMC_Get_Type]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_Get_Type]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RMC_Get_Type]
GO
/****** Objet :  StoredProcedure [dbo].[RGetCIndics_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RGetCIndics_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RGetCIndics_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[p_Verifier_Parentheses]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Verifier_Parentheses]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Verifier_Parentheses]
GO
/****** Objet :  StoredProcedure [dbo].[PopLivret_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PopLivret_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[PopLivret_Id]
GO
/****** Objet :  StoredProcedure [dbo].[p_Trans_Upper_Table_ListeId]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Trans_Upper_Table_ListeId]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Trans_Upper_Table_ListeId]
GO
/****** Objet :  StoredProcedure [dbo].[p_Translate_Upper]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Translate_Upper]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Translate_Upper]
GO
/****** Objet :  StoredProcedure [dbo].[p_Trans_Upper_Table]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Trans_Upper_Table]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Trans_Upper_Table]
GO
/****** Objet :  StoredProcedure [dbo].[p_Sel_SUBHOP]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Sel_SUBHOP]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Sel_SUBHOP]
GO
/****** Objet :  StoredProcedure [dbo].[GetCIM10SPs_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCIM10SPs_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCIM10SPs_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[p_Sel_SpePresentationHop]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Sel_SpePresentationHop]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Sel_SpePresentationHop]
GO
/****** Objet :  StoredProcedure [dbo].[GetCIM10CIndics_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCIM10CIndics_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetCIM10CIndics_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[p_Sel_Livret]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Sel_Livret]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Sel_Livret]
GO
/****** Objet :  StoredProcedure [dbo].[GetChild_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetChild_Id]
GO
/****** Objet :  StoredProcedure [dbo].[p_Sel_Compo]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Sel_Compo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Sel_Compo]
GO
/****** Objet :  StoredProcedure [dbo].[GetATCSpes_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCSpes_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetATCSpes_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[p_RTrim_Ora]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_RTrim_Ora]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_RTrim_Ora]
GO
/****** Objet :  StoredProcedure [dbo].[GetATCSpes_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCSpes_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetATCSpes_Id]
GO
/****** Objet :  StoredProcedure [dbo].[p_RMC_GetGindic_Prob]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_RMC_GetGindic_Prob]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_RMC_GetGindic_Prob]
GO
/****** Objet :  StoredProcedure [dbo].[GetATCs_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCs_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetATCs_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[p_RMC_Get_Type_Lib]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_RMC_Get_Type_Lib]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_RMC_Get_Type_Lib]
GO
/****** Objet :  StoredProcedure [dbo].[GetATCSCODE_TXT]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCSCODE_TXT]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetATCSCODE_TXT]
GO
/****** Objet :  StoredProcedure [dbo].[p_RMC_GetCim10Corres]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_RMC_GetCim10Corres]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_RMC_GetCim10Corres]
GO
/****** Objet :  StoredProcedure [dbo].[GetATCParent_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCParent_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetATCParent_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[p_RMC_Get_]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_RMC_Get_]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_RMC_Get_]
GO
/****** Objet :  StoredProcedure [dbo].[GetATCParent_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetATCParent_Id]
GO
/****** Objet :  StoredProcedure [dbo].[p_RMC_Detect_iam_ci]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_RMC_Detect_iam_ci]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_RMC_Detect_iam_ci]
GO
/****** Objet :  StoredProcedure [dbo].[GetATCChild_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCChild_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetATCChild_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[p_LTrim_Ora]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_LTrim_Ora]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_LTrim_Ora]
GO
/****** Objet :  StoredProcedure [dbo].[GetATCChild_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetATCChild_Id]
GO
/****** Objet :  StoredProcedure [dbo].[p_LIV_Get_]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_LIV_Get_]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_LIV_Get_]
GO
/****** Objet :  StoredProcedure [dbo].[GetATCAncester_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCAncester_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetATCAncester_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetATCAncester_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCAncester_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetATCAncester_Id]
GO
/****** Objet :  StoredProcedure [dbo].[P_Ins_SUBHOP]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[P_Ins_SUBHOP]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[P_Ins_SUBHOP]
GO
/****** Objet :  StoredProcedure [dbo].[GetATC_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATC_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetATC_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetATC_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATC_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetATC_Id]
GO
/****** Objet :  StoredProcedure [dbo].[Get_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Get_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Get_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[Get_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Get_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Get_Id]
GO
/****** Objet :  StoredProcedure [dbo].[p_GetSubstsPere]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetSubstsPere]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_GetSubstsPere]
GO
/****** Objet :  StoredProcedure [dbo].[CalculNiveauDicoComClasseIris]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CalculNiveauDicoComClasseIris]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[CalculNiveauDicoComClasseIris]
GO
/****** Objet :  StoredProcedure [dbo].[ExpSpePresentationHop_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ExpSpePresentationHop_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[ExpSpePresentationHop_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[Decode_Domain]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Decode_Domain]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Decode_Domain]
GO
/****** Objet :  StoredProcedure [dbo].[p_getspeiam_cipalpha]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_getspeiam_cipalpha]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_getspeiam_cipalpha]
GO
/****** Objet :  StoredProcedure [dbo].[p_GetFromKeyWordLivret]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetFromKeyWordLivret]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_GetFromKeyWordLivret]
GO
/****** Objet :  StoredProcedure [dbo].[p_GetFromKeyWord]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetFromKeyWord]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_GetFromKeyWord]
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCips_UCD]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCips_UCD]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_GetCips_UCD]
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCips_Substance]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCips_Substance]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_GetCips_Substance]
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCips]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCips]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_GetCips]
GO
/****** Objet :  StoredProcedure [dbo].[p_Epurer_Chaine]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Epurer_Chaine]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Epurer_Chaine]
GO
/****** Objet :  StoredProcedure [dbo].[p_ConnectByPere]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_ConnectByPere]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_ConnectByPere]
GO
/****** Objet :  StoredProcedure [dbo].[GetTheras_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetTheras_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetTheras_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[p_Built_Sub_Req_KWordLivret]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Built_Sub_Req_KWordLivret]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Built_Sub_Req_KWordLivret]
GO
/****** Objet :  StoredProcedure [dbo].[p_Built_Sub_Req_KWord]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Built_Sub_Req_KWord]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Built_Sub_Req_KWord]
GO
/****** Objet :  StoredProcedure [dbo].[p_Ajouter_parentheses_entre_mots]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Ajouter_parentheses_entre_mots]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[p_Ajouter_parentheses_entre_mots]
GO
/****** Objet :  StoredProcedure [dbo].[LIV_GetHie_Pro]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LIV_GetHie_Pro]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[LIV_GetHie_Pro]
GO
/****** Objet :  StoredProcedure [dbo].[GetVersion]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetVersion]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetVersion]
GO
/****** Objet :  StoredProcedure [dbo].[GetUCD_txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetUCD_txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetUCD_txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetTheraAncester_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetTheraAncester_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetTheraAncester_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstsWithLivret_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstsWithLivret_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSubstsWithLivret_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstsPere_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstsPere_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSubstsPere_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetSPSpes_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSPSpes_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSPSpes_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSPs_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSPs_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSPs_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetSPIndics_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSPIndics_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSPIndics_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpes_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpes_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpes_Txt]
GO
/****** Objet :  Table [dbo].[Version]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Version]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Version]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpePosolPhase_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpePosolPhase_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpePosolPhase_Id]
GO
/****** Objet :  Table [dbo].[LABOSAUMON]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LABOSAUMON]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[LABOSAUMON]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpePosol_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpePosol_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpePosol_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpePEs_id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpePEs_id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpePEs_id]
GO
/****** Objet :  Table [dbo].[Marqueurs]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Marqueurs]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Marqueurs]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeLivret_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeLivret_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpeLivret_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeIAM_100_422_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeIAM_100_422_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpeIAM_100_422_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeCIndics_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeCIndics_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpeCIndics_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeATCs_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeATCs_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSpeATCs_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSP_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSP_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSP_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetSaumon_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSaumon_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetSaumon_Txt]
GO
/****** Objet :  StoredProcedure [dbo].[GetParent_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetParent_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetLaboSpes_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetLaboSpes_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetLaboSpes_Id]
GO
/****** Objet :  StoredProcedure [dbo].[GetLaboSaumon_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetLaboSaumon_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GetLaboSaumon_Txt]
GO
/****** Objet :  UserDefinedDataType [dbo].[T_TEXTE_LONG]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_TEXTE_LONG')
EXEC dbo.sp_droptype @typename=N'T_TEXTE_LONG'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_TELEPHONE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_TELEPHONE')
EXEC dbo.sp_droptype @typename=N'T_TELEPHONE'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_OVP_FLOAT]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_OVP_FLOAT')
EXEC dbo.sp_droptype @typename=N'T_OVP_FLOAT'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_OVP_ENTIERS]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_OVP_ENTIERS')
EXEC dbo.sp_droptype @typename=N'T_OVP_ENTIERS'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_ORDRE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_ORDRE')
EXEC dbo.sp_droptype @typename=N'T_ORDRE'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_MEMO]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_MEMO')
EXEC dbo.sp_droptype @typename=N'T_MEMO'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle9]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_libelle9')
EXEC dbo.sp_droptype @typename=N'T_libelle9'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle7]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_libelle7')
EXEC dbo.sp_droptype @typename=N'T_libelle7'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle65]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_libelle65')
EXEC dbo.sp_droptype @typename=N'T_libelle65'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle60]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_libelle60')
EXEC dbo.sp_droptype @typename=N'T_libelle60'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle50]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_libelle50')
EXEC dbo.sp_droptype @typename=N'T_libelle50'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle5]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_libelle5')
EXEC dbo.sp_droptype @typename=N'T_libelle5'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle30]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_libelle30')
EXEC dbo.sp_droptype @typename=N'T_libelle30'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle200]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_libelle200')
EXEC dbo.sp_droptype @typename=N'T_libelle200'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle20]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_libelle20')
EXEC dbo.sp_droptype @typename=N'T_libelle20'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle150]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_libelle150')
EXEC dbo.sp_droptype @typename=N'T_libelle150'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle15]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_libelle15')
EXEC dbo.sp_droptype @typename=N'T_libelle15'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle128]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_libelle128')
EXEC dbo.sp_droptype @typename=N'T_libelle128'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle10]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_libelle10')
EXEC dbo.sp_droptype @typename=N'T_libelle10'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_LIBELLE_100]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_LIBELLE_100')
EXEC dbo.sp_droptype @typename=N'T_LIBELLE_100'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_LIBELLE_1]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_LIBELLE_1')
EXEC dbo.sp_droptype @typename=N'T_LIBELLE_1'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_DATE_SYST]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_DATE_SYST')
EXEC dbo.sp_droptype @typename=N'T_DATE_SYST'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_COMPTEUR]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_COMPTEUR')
EXEC dbo.sp_droptype @typename=N'T_COMPTEUR'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_BOOLEEN]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_BOOLEEN')
EXEC dbo.sp_droptype @typename=N'T_BOOLEEN'
GO
/****** Objet :  UserDefinedDataType [dbo].[T_Bon_Texte]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF  EXISTS (SELECT * FROM systypes WHERE name = N'T_Bon_Texte')
EXEC dbo.sp_droptype @typename=N'T_Bon_Texte'
GO
/****** Objet :  Role [IrisAdministrateur]    Date de génération du script : 11/28/2007 10:49:31 ******/
DECLARE @RoleName sysname
set @RoleName = N'IrisAdministrateur'
IF  EXISTS (SELECT * FROM dbo.sysusers WHERE name = @RoleName AND issqlrole = 1)
Begin

	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from dbo.sysusers 
	where uid in ( 
		select memberuid
		from dbo.sysmembers
		where groupuid in (
			select uid
			FROM dbo.sysusers where [name] = @RoleName AND issqlrole = 1))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;

end
GO
IF  EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'IrisAdministrateur' AND issqlrole = 1)
EXEC dbo.sp_droprole @rolename = N'IrisAdministrateur'
GO
/****** Objet :  Role [IrisLectureSeule]    Date de génération du script : 11/28/2007 10:49:31 ******/
DECLARE @RoleName sysname
set @RoleName = N'IrisLectureSeule'
IF  EXISTS (SELECT * FROM dbo.sysusers WHERE name = @RoleName AND issqlrole = 1)
Begin

	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from dbo.sysusers 
	where uid in ( 
		select memberuid
		from dbo.sysmembers
		where groupuid in (
			select uid
			FROM dbo.sysusers where [name] = @RoleName AND issqlrole = 1))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;

end
GO
IF  EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'IrisLectureSeule' AND issqlrole = 1)
EXEC dbo.sp_droprole @rolename = N'IrisLectureSeule'
GO
/****** Objet :  Role [IrisAdmin]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'IrisAdmin')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'IrisAdmin' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'IrisAdmin'

END
GO
/****** Objet :  Role [IrisLecture]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'IrisLecture')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'IrisLecture' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'IrisLecture'

END
GO
/****** Objet :  Role [peter]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'peter')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'peter' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'peter'

END
GO
/****** Objet :  Role [VIDALCIMSQL]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'VIDALCIMSQL')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'VIDALCIMSQL' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'VIDALCIMSQL'

END
GO
/****** Objet :  Role [IrisAdministrateur]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'IrisAdministrateur')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'IrisAdministrateur' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'IrisAdministrateur'

END
GO
/****** Objet :  Role [IrisLectureSeule]    Date de génération du script : 11/28/2007 10:49:31 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'IrisLectureSeule')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'IrisLectureSeule' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'IrisLectureSeule'

END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_Bon_Texte]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_Bon_Texte')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_Bon_Texte', @phystype='ntext', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_BOOLEEN]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_BOOLEEN')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_BOOLEEN', @phystype='varchar(1)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_COMPTEUR]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_COMPTEUR')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_COMPTEUR', @phystype='int', @nulltype='NOT NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_DATE_SYST]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_DATE_SYST')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_DATE_SYST', @phystype='datetime', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_LIBELLE_1]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_LIBELLE_1')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_LIBELLE_1', @phystype='varchar(1)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_LIBELLE_100]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_LIBELLE_100')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_LIBELLE_100', @phystype='varchar(100)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle10]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_libelle10')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_libelle10', @phystype='varchar(10)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle128]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_libelle128')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_libelle128', @phystype='varchar(128)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle15]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_libelle15')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_libelle15', @phystype='varchar(15)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle150]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_libelle150')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_libelle150', @phystype='varchar(150)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle20]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_libelle20')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_libelle20', @phystype='varchar(20)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle200]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_libelle200')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_libelle200', @phystype='varchar(200)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle30]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_libelle30')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_libelle30', @phystype='varchar(30)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle5]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_libelle5')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_libelle5', @phystype='varchar(5)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle50]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_libelle50')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_libelle50', @phystype='varchar(50)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle60]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_libelle60')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_libelle60', @phystype='varchar(60)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle65]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_libelle65')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_libelle65', @phystype='varchar(65)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle7]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_libelle7')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_libelle7', @phystype='varchar(7)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_libelle9]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_libelle9')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_libelle9', @phystype='varchar(9)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_MEMO]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_MEMO')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_MEMO', @phystype='text', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_ORDRE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_ORDRE')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_ORDRE', @phystype='int', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_OVP_ENTIERS]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_OVP_ENTIERS')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_OVP_ENTIERS', @phystype='int', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_OVP_FLOAT]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_OVP_FLOAT')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_OVP_FLOAT', @phystype='real', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_TELEPHONE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_TELEPHONE')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_TELEPHONE', @phystype='varchar(30)', @nulltype='NULL'
END
GO
/****** Objet :  UserDefinedDataType [dbo].[T_TEXTE_LONG]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.systypes WHERE name = N'T_TEXTE_LONG')
BEGIN
EXEC dbo.sp_addtype @typename=N'T_TEXTE_LONG', @phystype='varchar(255)', @nulltype='NULL'
END
GO
/****** Objet :  StoredProcedure [dbo].[GetLaboSaumon_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetLaboSaumon_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetLaboSaumon_Txt]
(
	@Labo		VARCHAR(255),
	@Ret		INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur			INTEGER
DECLARE @Curs_Tmp		CURSOR
DECLARE @ID_labo		VARCHAR(50)
DECLARE @Nom_labo		VARCHAR(255)

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetLaboSaumon_Txt'')

--STATS



	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	EXEC @Erreur = p_Translate_Upper @Labo, @Result = @Labo OUTPUT
	IF @Erreur != 0	-- Cas d''erreur
		GOTO SORTIE_ERR

	SELECT ls.idlaboratoire, ls.laboratoire
	FROM LABOSAUMON ls
	WHERE REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(laboratoire)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Labo
	ORDER BY ls.laboratoire

	IF @@ERROR != 0	-- Cas d''erreur	
		GOTO SORTIE_ERR


	SET @Ret = 0
	GOTO SORTIE


END

-- Gestion des erreurs
SORTIE_ERR:
	-- Sauvegarde de l''erreur
	IF @Erreur = 0
	SET @Erreur = @@ERROR	

	set @Ret = @Erreur

-- Cas de sortie sans erreur
SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetLaboSpes_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetLaboSpes_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetLaboSpes_Id]
(
	@ID_Laboratoire	INTEGER=NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetLaboSpes_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	SELECT
		t2.id_specialite, t2.bvalid, t2.bencours, t2.nomuser, t2.denomspe,
		t2.forme, t2.dosage, t2.complement,
		CAST(t2.commammposo AS VARCHAR(4000)) AS ''commammposo'', t2.reserve,
		t2.inferieurage, t2.unitinf, t2.superieurage, t2.unifsup, t2.inferieurpoids,
		t2.superieurpoids, t2.denomamm, t2.numdosamm, t2.specategorie,
		t2.source,
		CONVERT(CHAR(10),t2.datesource,103) AS ''datesource'',
		CAST(t2.remarques AS VARCHAR(4000)) AS ''remarques'',
		CONVERT(CHAR(10),t2.dcreat,103) AS ''DCREAT'',
		CONVERT(CHAR(10),t2.dmodif,103) AS ''DMODIF'',
		CONVERT(CHAR(10),t2.drevis,103) AS ''DREVIS'',
		t1.titulaireexploitant

	FROM SPECIALITE t2, SPELABS_REL t1
	WHERE (t1.id_laboratoire = @ID_Laboratoire
		OR @ID_Laboratoire IS NULL)
	AND t2.ID_SPECIALITE = t1.ID_SPECIALITE

	IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR


	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret







' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetParent_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetParent_Id]
(
	@ID	INTEGER,
	@Typ	INTEGER,
	@Ret	INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetParent_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	IF @Typ = 2
	BEGIN
		-- CAS DES SUBSTANCES
		SELECT DISTINCT
			t1.id_t_sub,
			t1.libelle,
			t1.homeopathie,
			CAST(t1.texte AS VARCHAR(4000)) AS ''t1.texte'',
			t1.dc,
			t1.complementindexsub,
			1 AS ''HasChild''
		FROM T_SUB t1, COUPLETERMETERME t2
		WHERE t2.id_t_sub_f = @ID
		AND   t1.id_t_sub = t2.id_t_sub_p
		ORDER BY t1.id_t_sub
	END
	ELSE IF @Typ = 3
	BEGIN
		-- CAS DES CLASSES THERAPEUTIQUES
		SELECT
			t1.id_dicocomclassiris,
			t1.dic_id_dicocomclassiris,
			LTRIM(
				CASE SUBSTRING(UPPER(t1.libelle), 1, 3)
					WHEN ''ZZ_'' THEN	CASE PATINDEX(''\'', SUBSTRING(t1.libelle, PATINDEX(''\'', t1.libelle) + 1, 255))
									WHEN 0 THEN SUBSTRING(t1.libelle, PATINDEX(''\'', t1.libelle) + 1, 255)
									ELSE SUBSTRING(t1.libelle, PATINDEX(''\'', t1.libelle) + 1, PATINDEX(''\'', SUBSTRING(t1.libelle, PATINDEX(''\'', t1.libelle) + 1, 255)) - PATINDEX(''\'', t1.libelle) - 2)
								END
					ELSE t1.libelle
				END) AS ''t1.libelle'',
			t1.ordre,
			CASE t2.id_dicocomclassiris
				WHEN NULL THEN 0
				ELSE 1
			END AS ''t2.id_dicocomclassiris''
		FROM DICOCOMCLASSIRIS t1
			LEFT OUTER JOIN DICOCOMCLASSIRIS t2
			ON t1.id_dicocomclassiris = t2.dic_id_dicocomclassiris
		WHERE t1.id_dicocomclassiris = (SELECT dic_id_dicocomclassiris
						FROM DICOCOMCLASSIRIS
						WHERE id_dicocomclassiris = @ID)
		GROUP BY
			t1.id_dicocomclassiris,
			t1.dic_id_dicocomclassiris,
			t1.libelle,
			t1.ordre,
			CASE t2.id_dicocomclassiris
				WHEN NULL THEN 0
				ELSE 1
			END
	END
	ELSE IF @Typ = 8
	BEGIN
		-- CAS DES CONTRE-INDICATIONS
		SELECT
			t1.id_t_ci, t1.libelle,
			CAST(t1.texte AS VARCHAR(4000)) AS ''t1.texte'',
			t1.creation, t1.validation, t1.remarques, 0 AS ''0''
		FROM T_CI t1, HIERARCHIECI_REL t2
		WHERE t2.id_t_ci_f = @ID
		AND   t1.id_t_ci = t2.id_t_ci_p
	END
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSaumon_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSaumon_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSaumon_Txt]
(
	@Terme	VARCHAR(100),
	@Typ		INTEGER,
	@Ret		INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER
DECLARE @Curs_Tmp	CURSOR
DECLARE @varProduit	VARCHAR(100)
DECLARE @varIDDoc	VARCHAR(255)
DECLARE @varNom		VARCHAR(255)
DECLARE @varIDLabo	VARCHAR(50)

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSaumon_Txt'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

--//	
	IF @Typ = 1
	BEGIN
		EXEC @Erreur = p_Translate_Upper @Terme, @Result = @Terme OUTPUT
		IF @Erreur != 0	-- Cas d''erreur
		     GOTO SORTIE_ERR

		SELECT s.produit, s.docid, s.nomcompletmono, s.idlaboratoire
		FROM SAUMON s
                           WHERE  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER( s.produit)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Terme 
		ORDER BY s.produit
  
	       IF @@ERROR != 0	-- Cas d''erreur		
		GOTO SORTIE_ERR		
				
	END
	ELSE IF @Typ = 4
	BEGIN		
			SELECT
			s.produit,
			s.docid,
			s.nomcompletmono,
			s.idlaboratoire
			FROM SAUMON s, LABOSAUMON ls
			WHERE ls.IDLABORATOIRE LIKE @Terme
			AND	 s.IDLABORATOIRE = ls.IDLABORATOIRE
			ORDER BY s.PRODUIT

	IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR

	END

	set @Ret = 0
		GOTO SORTIE
END

-- Gestion des erreurs
SORTIE_ERR:
	-- Sauvegarde de l''erreur
	IF @Erreur = 0
		SET @Erreur = @@ERROR	

	set @Ret = @Erreur

-- Cas de sortie sans erreur
SORTIE:
	RETURN @Ret







' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSP_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSP_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSP_Id]
(
	@IdSP	INTEGER=NULL,
	@Ret	INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSP_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	SELECT id_groupindic, libelle, type
	FROM GROUPINDIC
	WHERE (id_groupindic = @IdSP
	OR @IdSP IS NULL)
	ORDER BY id_groupindic
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeATCs_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeATCs_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSpeATCs_Id]
(
	@Id_Specialite	INTEGER = NULL,
	@Ret	INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur	INTEGER
DECLARE @Curs_Tmp	CURSOR

DECLARE @varID	INTEGER
DECLARE @varListeID	VARCHAR(1000)
DECLARE @time        varchar(20)
DECLARE @TableT   varchar(25)
DECLARE @Req        varchar(4000)

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpeATCs_Id'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

             SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET  @TableT = ''TMP_CONNECTBY'' +@time

	-- Mise en forme de la liste des ID à passer à la procédure p_Connect_By
	SET @Curs_Tmp = CURSOR FOR
		SELECT DISTINCT
			dico1.id_dicot_atc_iris
		FROM 	DICOT_ATC_IRIS dico1	INNER JOIN SPEPHARMACODYNAMIE speph	ON dico1.libelle = speph.atc_iris,
			DICOT_ATC_IRIS dico2	LEFT OUTER JOIN DICOT_ATC_IRIS dico3	ON dico3.dic_id_dicot_atc_iris = dico2.id_dicot_atc_iris
		WHERE speph.id_specialite = @Id_Specialite
		AND dico2.dic_id_dicot_atc_iris IS NULL
	FOR READ ONLY

	OPEN @Curs_Tmp
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	FETCH @Curs_Tmp INTO @varID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @varListeID IS NULL
			SET @varListeID = CONVERT(VARCHAR(10), @varID)
		ELSE
			SET @varListeID = @varListeID + '','' + CONVERT(VARCHAR(10), @varID)
		FETCH @Curs_Tmp INTO @varID
	END

             SET @Req = ''''
	IF EXISTS( SELECT 1 FROM TempDb..SYSOBJECTS WHERE NAME = ''##'' +@TableT  AND TYPE = ''U'')
                           SET @Req = ''DROP TABLE ##''+@TableT
                           EXEC(@Req)

	-- Création de la table temporaire
	SET @Req = ''CREATE TABLE ##''+@TableT +'' ( ID_COL INTEGER )''
	EXEC(@Req) 
		-- Récupération de la hiérachie
		    /* Juste pour mémo, les paramètres de la procédure : p_Connect_By NomTable, ColPere, ColFils, TypeNoeud, ID, ListeID, Terme */
		EXEC @Erreur = p_Connect_By ''DICOT_ATC_IRIS'', ''id_dicot_atc_iris'', ''dic_id_dicot_atc_iris'',  ''P'', 0, @varListeID, NULL, @TableT

		IF @Erreur != 0
			GOTO SORTIE_ERR
	-- FIN PREPA LISTE CONNECT --

	SET @Req = '' SELECT DISTINCT
		dico1.id_dicot_atc_iris AS ''''ID_DICOT_ATC_IRIS'''',
		CASE PATINDEX(''''%/%'''', dico1.libelle)
			WHEN 0 THEN SUBSTRING(dico1.libelle, 1, 255)
			ELSE SUBSTRING(dico1.libelle, 1, PATINDEX(''''%/%'''', dico1.libelle) - 2)		-- -2 car il y a un espace
		END AS ''''CODE'''',									-- entre le / et le dernier
													-- caractère du code
		CASE PATINDEX(''''%/%'''', dico1.libelle)
			WHEN 0 THEN SUBSTRING(dico1.libelle, 1, 255)
			ELSE SUBSTRING(dico1.libelle, PATINDEX(''''%/%'''', dico1.libelle) + 2, 255)		-- +2 car il y a un espace
		END AS ''''LIBELLE'''',									-- entre le / et le premier
													-- caractère du libellé
		dico2.ID_DICOT_ATC_IRIS AS ''''DIC_ID_DICOT_ATC_IRIS'''',
		CASE PATINDEX(''''%/%'''', dico2.libelle)
			WHEN 0 THEN SUBSTRING(dico2.libelle, 1, 255)
			ELSE SUBSTRING(dico2.libelle, 1, PATINDEX(''''%/%'''', dico2.libelle) - 2)		-- -2 car il y a un espace
		END AS ''''DIC_CODE'''',									-- entre le / et le dernier
													-- caractère du code
		CASE PATINDEX(''''%/%'''', dico2.libelle)
			WHEN 0 THEN SUBSTRING(dico2.libelle, 1, 255)
			ELSE SUBSTRING(dico2.libelle, PATINDEX(''''%/%'''', dico2.libelle) + 2, 255)		-- +2 car il y a un espace
		END AS ''''DIC_LIBELLE''''									-- entre le / et le premier
													-- caractère du libellé
	FROM 	DICOT_ATC_IRIS dico1	INNER JOIN SPEPHARMACODYNAMIE speph	ON dico1.libelle = speph.atc_iris,
		DICOT_ATC_IRIS dico2	LEFT OUTER JOIN DICOT_ATC_IRIS dico3	ON dico3.dic_id_dicot_atc_iris = dico2.id_dicot_atc_iris
	WHERE speph.id_specialite =  ''+CONVERT(VARCHAR(10), @Id_Specialite)+ ''
	AND dico2.dic_id_dicot_atc_iris IS NULL
	AND dico2.id_dicot_atc_iris IN (SELECT * FROM ##''+@TableT+'' )
	GROUP BY	dico1.id_dicot_atc_iris,
			dico1.libelle,
			dico2.id_dicot_atc_iris,
			dico2.libelle''

	EXEC(@Req)
              IF @@ERROR != 0	
	GOTO SORTIE_ERR

	-- TEST ERREUR
	IF @@ERROR != 0
                       BEGIN

		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableT+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TableT
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableT+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TableT
                           EXEC(@Req)
                           GOTO SORTIE
                      END
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret













' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeCIndics_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeCIndics_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSpeCIndics_Id]
(
	@id_specialite	INTEGER=NULL,
	@Ret	INTEGER OUTPUT
) AS
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpeCIndics_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	SELECT
		ci.id_t_ci, ci.libelle,
		CAST(ci.texte AS VARCHAR(4000)) AS ''TEXTE'',
		CONVERT(CHAR(10), ci.creation, 103) AS ''CREATION'',
		ci.validation, CAST(ci.remarques AS VARCHAR(4000)) AS ''REMARQUES''
	FROM SPECI speci INNER JOIN T_CI ci ON ci.id_t_ci = speci.id_t_ci
	WHERE speci.id_specialite = @id_specialite	
	-- AND ci.validation = ''V''
	ORDER BY ci.id_t_ci

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret







' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeIAM_100_422_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeIAM_100_422_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[GetSpeIAM_100_422_Txt]
(
	@ID					VARCHAR(500),	-- chaine de caractères contenant les ID séparés par 1 virgule et 1 espace
	@Typ					VARCHAR(3),	-- type des ID (valeurs possibles : PRE, CIP ou SPE)
	@ID_SPEPRESENTATION_OUT	VARCHAR(500) OUTPUT,	-- chaine de caractères contenant les ID issus de @ID et n''appartenant pas aux classes 100 et 422
	@Ret					INTEGER OUTPUT	-- Code erreur
) AS
-- Déclarations
DECLARE @Erreur		INTEGER
declare @id_bis varchar(500)
DECLARE @varRequete	VARCHAR(4000)
DECLARE @Curs_Tmp	CURSOR
DECLARE @varIDLu	INTEGER
DECLARE @varLib		VARCHAR(123)	-- 60 pour DENOMSPE + 60 pour RESNCOMP + '' : ''
DECLARE @Req varchar(4000)
DECLARE @Time varchar(25)
DECLARE @SQL varchar(150)
DECLARE @TTEMP varchar(25)
DECLARE @TTEMP_bis varchar(25)
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpeIAM_100_422_Txt'')

--STATS


	
	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON
             SET @Time = replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')

             SET @TTEMP = ''GetSpeIAM_100_422_Tmp'' + @Time
	-----SET @TTEMP_bis = ''CIP_Tmp'' + @Time
	-----select replace (@id,"","","'''',''''") as toto ---INTO ##'' +@TTEMP_bis+ ''
 
             SET  @Req = '' ''
	SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TTEMP+ '''''' AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTEMP
                           EXEC(@Req)
	set nocount on
	exec p_getspeiam_cipalpha @id,@id_bis output
	set nocount off	

	IF @Typ = ''PRE''
	BEGIN	-- Cas du passage d''ID de présentation
		SET @varRequete = ''
		SELECT DISTINCT
			spe.id_specialite AS "id_spepresentation",
			spe.denomspe + CASE spres.condi
						WHEN NULL THEN " "
						ELSE " : " + spres.condi
					END AS "Libelle_CIP"
		INTO ##'' +@TTEMP+ ''
		FROM	SPEPRESENTATION spres
				INNER JOIN SPECIALITE spe ON spe.id_specialite = spres.id_specialite
				INNER JOIN SPECIALITE_IAMCLASS sclass ON sclass.id_specialite = spres.id_specialite,
			IAMCLASS class INNER JOIN SPECIALITE_IAMCLASS sclass2 ON (sclass2.id_iamclasse = class.id_iamclasse)
		WHERE (sclass.id_specialite = sclass2.id_specialite AND sclass.id_iamclasse = sclass2.id_iamclasse)
		AND spres.id_spepresentation IN (''+ @id + '')
		AND sclass.id_iamclasse NOT IN (100, 422)
		ORDER BY 1''
	END
	ELSE IF @Typ = ''CIP''
	BEGIN	-- Cas du passage d''ID de CIP

		SET @varRequete = ''
		SELECT DISTINCT
			spe.id_specialite AS id_spepresentation,
			spe.denomspe +  spres.condi  AS Libelle_CIP
		INTO ##'' +@TTEMP+ ''
		FROM	SPEPRESENTATION spres
				LEFT OUTER JOIN SPECONDITIONNEMENTPRIMAIRE scond ON scond.id_spepresentation = spres.id_spepresentation
				INNER JOIN SPECIALITE spe ON spe.id_specialite = spres.id_specialite
				INNER JOIN SPECIALITE_IAMCLASS sclass ON sclass.id_specialite = spres.id_specialite,
			IAMCLASS class INNER JOIN SPECIALITE_IAMCLASS sclass2 ON (sclass2.id_iamclasse = class.id_iamclasse)
		WHERE (sclass.id_specialite = sclass2.id_specialite AND sclass.id_iamclasse = sclass2.id_iamclasse)
		AND spres.cip IN (''''''+@id_bis+'''''')
		AND sclass.id_iamclasse NOT IN (100, 422)
		ORDER BY 1''
		
	---print @varrequete
	END
	ELSE IF @Typ = ''SPE''
	BEGIN	-- Cas du passage d''ID de spécialité
		SET @varRequete = 
		''SELECT DISTINCT
			spe.id_specialite AS id_spepresentation,
			spe.denomspe AS Libelle_CIP 
		INTO ##'' +@TTEMP+ ''
		FROM	SPECIALITE_IAMCLASS sclass
				INNER JOIN SPECIALITE spe ON spe.id_specialite = sclass.id_specialite
				INNER JOIN IAMCLASS class ON class.id_iamclasse = sclass.id_iamclasse
		WHERE spe.id_specialite IN ('' + @ID + '')
		AND sclass.id_iamclasse NOT IN (100, 422)
		ORDER BY 1''
	END

	-- Exécution de la requête de création de la table temporaire

	EXEC (@varRequete)
	IF @@ERROR != 0

		GOTO SORTIE_ERR


	print @@error

             SET @Sql = ''DECLARE Curseur CURSOR FOR SELECT * FROM ##'' +@TTEMP
	EXEC (@Sql)
	IF @@ERROR != 0
	BEGIN
                           SET @Req = ''DROP TABLE ##''+ @TTEMP
                           EXEC(@Req)
		GOTO SORTIE_ERR
	END


	OPEN Curseur
	FETCH Curseur INTO @varIDLu, @varLib
	SET @ID_SPEPRESENTATION_OUT = NULL
	WHILE @@FETCH_STATUS = 0
	BEGIN	
		-- Mémorisation de l''ID trouvé
		IF @ID_SPEPRESENTATION_OUT IS NULL
			SET @ID_SPEPRESENTATION_OUT = CONVERT(VARCHAR(10), @varIDLu)
		ELSE
			SET @ID_SPEPRESENTATION_OUT = @ID_SPEPRESENTATION_OUT + '', '' + CONVERT(VARCHAR(10), @varIDLu)

		-- Recherche du tuple suivant
		FETCH Curseur INTO @varIDLu, @varLib
	END


		CLOSE Curseur
		DEALLOCATE Curseur
 		SET @Req = ''DROP TABLE ##''+ @TTEMP
                           EXEC(@Req)


	/* ===== Recherche des ID appartenant aux classes 100 ou 422 ===== */
	-- Définition de la requête de (re)création de la table temporaire destinée au curseur à retourner
	IF @Typ = ''PRE''
	BEGIN	-- Cas du passage d''ID de présentation
		SET @varRequete =
		''SELECT
			spres.id_spepresentation AS "id_spepresentation",
			spe.denomspe + CASE scond.renscomp
						WHEN NULL THEN ""
						ELSE " : " + scond.renscomp
					END AS "Libelle_CIP",
			class.id_iamclasse AS "id_iamclasse",
			class.classe AS "classe"
		FROM	SPEPRESENTATION spres
				LEFT OUTER JOIN SPECONDITIONNEMENTPRIMAIRE scond ON scond.id_spepresentation = spres.id_spepresentation
				INNER JOIN SPECIALITE spe ON spe.id_specialite = spres.id_specialite
				INNER JOIN SPECIALITE_IAMCLASS sclass ON sclass.id_specialite = spres.id_specialite,
			IAMCLASS class INNER JOIN SPECIALITE_IAMCLASS sclass2 ON (sclass2.id_iamclasse = class.id_iamclasse)
		WHERE (sclass.id_specialite = sclass2.id_specialite AND sclass.id_iamclasse = sclass2.id_iamclasse)
		AND spres.id_spepresentation IN ('' + @ID + '')
		AND sclass.id_iamclasse IN (100, 422)
		AND ((UPPER(scond.typecondprimaire) = "DENOMCIP") OR (UPPER(scond.typecondprimaire) IS NULL))
		ORDER BY 1''
	END
	ELSE IF @Typ = ''CIP''
	BEGIN	-- Cas du passage d''ID de CIP
		SET @varRequete = 
		''SELECT

			spres.cip AS id_spepresentation,
			spe.denomspe +  scond.renscomp AS Libelle_CIP,
			class.id_iamclasse AS id_iamclasse,
			class.classe AS classe
		FROM	SPEPRESENTATION spres
				LEFT OUTER JOIN SPECONDITIONNEMENTPRIMAIRE scond ON scond.id_spepresentation = spres.id_spepresentation
				INNER JOIN SPECIALITE spe ON spe.id_specialite = spres.id_specialite
				INNER JOIN SPECIALITE_IAMCLASS sclass ON sclass.id_specialite = spres.id_specialite,
			IAMCLASS class INNER JOIN SPECIALITE_IAMCLASS sclass2 ON (sclass2.id_iamclasse = class.id_iamclasse)
		WHERE (sclass.id_specialite = sclass2.id_specialite AND sclass.id_iamclasse = sclass2.id_iamclasse)
		AND spres.cip IN (''''''+@id_bis+'''''')
		AND sclass.id_iamclasse IN (100, 422)
		AND ((UPPER(scond.typecondprimaire) =''''DENOMCIP'''') OR (UPPER(scond.typecondprimaire) IS NULL))
		ORDER BY 1''
	---print @varrequete

	END
	ELSE IF @Typ = ''SPE''
	BEGIN	-- Cas du passage d''ID de spécialité
		SET @varRequete = 
		''SELECT spe.id_specialite AS id_spepresentation,	spe.denomspe AS Libelle_CIP, class.id_iamclasse AS id_iamclasse,
			class.classe  AS classe	
                    	FROM	SPECIALITE_IAMCLASS sclass
				INNER JOIN SPECIALITE spe ON spe.id_specialite = sclass.id_specialite
				INNER JOIN IAMCLASS class ON class.id_iamclasse = sclass.id_iamclasse
		WHERE spe.id_specialite IN ('' + @ID + '')
		AND sclass.id_iamclasse IN (100, 422)
		ORDER BY 1''
	END

	-- Exécution de la requête de création de la table temporaire
	EXEC (@varRequete)
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	-- Libération de la mémoire du curseur temporaire

	RETURN @Ret




























' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeLivret_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeLivret_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSpeLivret_Id]
(
	@Id_hop	INTEGER,
	@Ret	INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpeLivret_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	SELECT  spe.ID_SPECIALITE, spe.BVALID, spe.BENCOURS, spe.NOMUSER,
		spe.DENOMSPE, spe.FORME, spe.DOSAGE, spe.complement,
		CAST(spe.COMMAMMPOSO AS VARCHAR(4000)) AS ''COMMAMMPOSO'',
		spe.RESERVE, spe.INFERIEURAGE,
		spe.UNITINF, spe.SUPERIEURAGE, spe.UNIFSUP,
		spe.INFERIEURPOIDS, spe.SUPERIEURPOIDS, spe.DENOMAMM,
		spe.NUMDOSAMM, spe.SPECATEGORIE, spe.SOURCE,
		CONVERT(CHAR(10), spe.DATESOURCE, 103) AS ''DATESOURCE'',
		CAST(spe.REMARQUES AS VARCHAR(4000)) AS ''REMARQUES'',
		CONVERT(CHAR(10), spe.DCREAT, 103) AS ''DCREAT'',
		CONVERT(CHAR(10), spe.DMODIF, 103) AS ''DMODIF'',
		CONVERT(CHAR(10), spe.DREVIS, 103) AS ''DREVIS'',
		spres.ID_SPEPRESENTATION, liv.IDORGANISME, ''V''  FLAG_LIVRET
	FROM SPEPRESENTATION spres 	INNER JOIN SPECIALITE spe ON spe.id_specialite = spres.id_specialite
					INNER JOIN LIVRETVIDAL liv ON liv.id_spepresentation = spres.id_spepresentation
	WHERE liv.idorganisme = @Id_hop

	UNION

	SELECT
		0 Id_Specialite, '''' BVALID, '''' BENCOURS, ''''NOMUSER,
		spres.NOM, spres.FORME, spres.DOSAGE, '''' complement,
		'''' COMMAMMPOSO, '''' RESERVE, 0 INFERIEURAGE,
		'''' UNITINF, 0 SUPERIEURAGE, '''' UNIFSUP,
		0 INFERIEURPOIDS, 0 SUPERIEURPOIDS, '''' DENOMAMM,
		'''' NUMDOSAMM, '''' SPECATEGORIE, '''' SOURCE,
		''31/12/2099'' AS ''DATESOURCE'',
		'''' REMARQUES,
		''31/12/2099'' AS ''DCREAT'',
		''31/12/2099'' AS ''DMODIF'',
		''31/12/2099'' AS ''DREVIS'',
		spres.ID_SPEPRESENTATIONHOP, liv.IDORGANISME, ''H'' FLAG_LIVRET
	FROM SPEPRESENTATIONHOP spres INNER JOIN LIVRETHOP liv ON (liv.id_spepresentationhop = spres.id_spepresentationhop
								AND liv.idorganisme = spres.idorganisme)
	WHERE liv.idorganisme = @Id_hop
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret







' 
END
GO
/****** Objet :  Table [dbo].[Marqueurs]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Marqueurs]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Marqueurs](
	[ID_PROC] [int] IDENTITY(1,1) NOT NULL,
	[PROC_NAME] [varchar](100)  NULL,
	[COMPTEUR] [int] NULL,
 CONSTRAINT [PK_ID_PROC] PRIMARY KEY CLUSTERED 
(
	[ID_PROC]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[Marqueurs]') AND name = N'IX_Proc_Name')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Proc_Name] ON [dbo].[Marqueurs] 
(
	[PROC_NAME]
)
GO
/****** Objet :  StoredProcedure [dbo].[GetSpePEs_id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpePEs_id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[GetSpePEs_id]
(
	@Id_Specialite   INTEGER, 
	@Terme	VARCHAR(100) = NULL,
	@Ret		INTEGER OUTPUT
) AS

-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpePEs_id'')

--STATS



	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON


	-- Transformation pour comparaison ultérieure
	EXEC @Erreur = p_Translate_Upper @Terme, @Result = @Terme OUTPUT
	IF @Erreur != 0	-- Cas d''erreur
	    GOTO SORTIE_ERR

            IF @terme is not null  
               BEGIN
                   Select a.id_Specialite,
                     	a.Id_SpePE,
              	a.TERME,
              	a.ORIGINEOVP,
              	a.DATEORIGOVP,
              	a.ARGUMENTAIREAUTEUR,
              	a.COMMAMM,
              	a.ORDRE
                  FROM  SPEPE a INNER JOIN Specialite b ON  a.Id_specialite = b.Id_specialite
                  WHERE b.id_Specialite = @id_specialite
              	AND   a.pertinentovp = ''0''
              	AND      REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER( a.TERME)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE   @Terme

                ORDER BY Ordre;
             END

        ELSE

            BEGIN
                 Select a.id_Specialite,
      	        	a.Id_SpePE,
            	   	a.TERME,
              	a.ORIGINEOVP,
              	a.DATEORIGOVP,
              	a.ARGUMENTAIREAUTEUR,
              	a.COMMAMM,
              	a.ORDRE
                  FROM  SPEPE a INNER JOIN Specialite b ON  a.Id_specialite = b.Id_specialite
                  WHERE b.id_Specialite = @id_specialite
                      AND   a.pertinentovp = ''0''
                ORDER BY Ordre;
            END


	IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR


		SET @Ret = 0
	GOTO SORTIE
END

-- Gestion des cas d''erreur
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR


	SET @Ret = @Erreur

-- Cas de sortie de procédure sans erreur
SORTIE:
	RETURN @Ret

' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpePosol_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpePosol_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSpePosol_Id]
(
	@ID_Specialite	INTEGER=NULL,
	@ID_SpeIndic	INTEGER=NULL,
	@Phase	VARCHAR(255)=NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpePosol_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	IF @ID_SpeIndic = -1
	BEGIN

		SELECT
			id_specialite, id_speprise, id_speposo, relecturepar, posousuinf,
			posoususup, posousutype, posomin, posomintype, posomax, posomaxtype,
			posototmax, posototmaxtype, frequsuinf, freqususup, frequsutype,
			freqinfposomax, freqsupposomax, freqposomaxtype, freqinfposomin,
			freqsupposomin, freqposomintype, freqposototmaxtype, freqinfrenouv,
			freqsuprenouv, freqrenouvtype, freqdiv, duradusuinf, duradususup,
			duradusutype, durmax, durmaxtype, durtotal, durtotaltype, durarretinf,
			durarretsup, durarrettype, poidsinf, poidssup, ageinf, uniteageinf,
			agesup, uniteagesup, phase, ordredephase, lienphase, etatpreexistant,
			situdstempsposoinf, situdstempspososup, renouvellement, sexe,
			CAST(coprescription AS VARCHAR(4000)) AS ''COPRESCRIPTION'',
			repas, CAST(conseil AS VARCHAR(4000)) AS ''CONSEIL'',
			CAST(modeemploi AS VARCHAR(4000)) AS ''MODEEMPLOI'',
			CONVERT(CHAR(10),dcreat,103) AS ''DCREAT'',
			CONVERT(CHAR(10),dmodif,103) AS ''DMODIF'',
			CONVERT(CHAR(10),drevis,103) AS ''DREVIS''

		FROM SPEPOSO
		WHERE (id_specialite = @ID_Specialite
			OR @ID_Specialite IS NULL)
		AND phase = (SELECT
				CASE @Phase
					WHEN null THEN phase
					ELSE @Phase
				END)
		IF @@ERROR != 0	-- Cas d''erreur
			GOTO SORTIE_ERR


	END
	ELSE
	BEGIN


		SELECT
			t2.id_specialite, t2.id_speprise, t2.id_speposo, t2.relecturepar,
			t2.posousuinf, t2.posoususup, t2.posousutype, t2.posomin,
			t2.posomintype, t2.posomax, t2.posomaxtype, t2.posototmax,
			t2.posototmaxtype, t2.frequsuinf, t2.freqususup, t2.frequsutype,
			t2.freqinfposomax, t2.freqsupposomax, t2.freqposomaxtype, t2.freqinfposomin,
			t2.freqsupposomin, t2.freqposomintype, t2.freqposototmaxtype, t2.freqinfrenouv,
			t2.freqsuprenouv, t2.freqrenouvtype, t2.freqdiv, t2.duradusuinf, t2.duradususup,
			t2.duradusutype, t2.durmax, t2.durmaxtype, t2.durtotal, t2.durtotaltype,
			t2.durarretinf, t2.durarretsup, t2.durarrettype, t2.poidsinf, t2.poidssup,
			t2.ageinf, t2.uniteageinf, t2.agesup, t2.uniteagesup, t2.phase, t2.ordredephase,
			t2.lienphase, t2.etatpreexistant, t2.situdstempsposoinf, t2.situdstempspososup,
			t2.renouvellement, t2.sexe,
			CAST(t2.coprescription AS VARCHAR(4000)) AS ''COPRESCRIPTION'',
			t2.repas, CAST(t2.conseil AS VARCHAR(4000)) AS ''CONSEIL'',
			CAST(t2.modeemploi AS VARCHAR(4000)) AS ''MODEEMPLOI'',
			CONVERT(CHAR(10),t2.dcreat,103) AS ''DCREAT'',
			CONVERT(CHAR(10),t2.dmodif,103) AS ''DMODIF'',
			CONVERT(CHAR(10),t2.drevis,103) AS ''DREVIS''

		FROM SPEPOSO t2, SPEPOSOINDIC t1
		WHERE t1.id_speindic = @ID_SpeIndic
		AND t2.id_speposo = t1.id_speposo
		AND (t2.id_specialite = @ID_Specialite
			OR @ID_Specialite IS NULL)
		AND t2.phase = (SELECT
				CASE @Phase
					WHEN null THEN t2.phase
					ELSE @Phase
				END)
		IF @@ERROR != 0	-- Cas d''erreur
			GOTO SORTIE_ERR

	END

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret










' 
END
GO
/****** Objet :  Table [dbo].[LABOSAUMON]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LABOSAUMON]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LABOSAUMON](
	[IDLABORATOIRE] [varchar](50)  NOT NULL,
	[LABORATOIRE] [varchar](255)  NOT NULL,
	[COMMUN] [varchar](50)  NULL,
 CONSTRAINT [PK_LABOSAUMON] PRIMARY KEY CLUSTERED 
(
	[IDLABORATOIRE]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[LABOSAUMON]') AND name = N'IX_Laboratoire')
CREATE NONCLUSTERED INDEX [IX_Laboratoire] ON [dbo].[LABOSAUMON] 
(
	[LABORATOIRE]
)
GO
/****** Objet :  StoredProcedure [dbo].[GetSpePosolPhase_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpePosolPhase_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSpePosolPhase_Id]
(
	@ID_Specialite	INTEGER=NULL,
	@ID_SpeIndic	INTEGER=NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpePosolPhase_Id'')

--STATS


	-- Initialisation et optimisation
	SET NOCOUNT ON

	IF @ID_SpeIndic = -1
	BEGIN

		SELECT
			id_specialite, id_speprise, id_speposo, relecturepar, posousuinf,
			posoususup, posousutype, posomin, posomintype, posomax, posomaxtype,
			posototmax, posototmaxtype, frequsuinf, freqususup, frequsutype,
			freqinfposomax, freqsupposomax, freqposomaxtype, freqinfposomin,
			freqsupposomin, freqposomintype, freqposototmaxtype, freqinfrenouv,
			freqsuprenouv, freqrenouvtype, freqdiv, duradusuinf, duradususup,
			duradusutype, durmax, durmaxtype, durtotal, durtotaltype, durarretinf,
			durarretsup, durarrettype, poidsinf, poidssup, ageinf, uniteageinf,
			agesup, uniteagesup, phase, ordredephase, lienphase, etatpreexistant,
			situdstempsposoinf, situdstempspososup, renouvellement, sexe,
			CAST(coprescription AS VARCHAR(4000)) AS ''COPRESCRIPTION'',
			repas, CAST(conseil AS VARCHAR(4000)) AS ''CONSEIL'',
			CAST(modeemploi AS VARCHAR(4000)) AS ''MODEEMPLOI'',
			CONVERT(CHAR(10),dcreat,103) AS ''DCREAT'',
			CONVERT(CHAR(10),dmodif,103) AS ''DMODIF'',
			CONVERT(CHAR(10),drevis,103) AS ''DREVIS''

		FROM SPEPOSO
		WHERE (id_specialite = @ID_Specialite
			OR @ID_Specialite IS NULL)
		IF @@ERROR != 0	-- Cas d''erreur
			GOTO SORTIE_ERR

	END
	ELSE
	BEGIN

		SELECT
			t2.id_specialite, t2.id_speprise, t2.id_speposo, t2.relecturepar,
			t2.posousuinf, t2.posoususup, t2.posousutype, t2.posomin,
			t2.posomintype, t2.posomax, t2.posomaxtype, t2.posototmax,
			t2.posototmaxtype, t2.frequsuinf, t2.freqususup, t2.frequsutype,
			t2.freqinfposomax, t2.freqsupposomax, t2.freqposomaxtype, t2.freqinfposomin,
			t2.freqsupposomin, t2.freqposomintype, t2.freqposototmaxtype, t2.freqinfrenouv,
			t2.freqsuprenouv, t2.freqrenouvtype, t2.freqdiv, t2.duradusuinf, t2.duradususup,
			t2.duradusutype, t2.durmax, t2.durmaxtype, t2.durtotal, t2.durtotaltype,
			t2.durarretinf, t2.durarretsup, t2.durarrettype, t2.poidsinf, t2.poidssup,
			t2.ageinf, t2.uniteageinf, t2.agesup, t2.uniteagesup, t2.phase, t2.ordredephase,
			t2.lienphase, t2.etatpreexistant, t2.situdstempsposoinf, t2.situdstempspososup,
			t2.renouvellement, t2.sexe,
			CAST(t2.coprescription AS VARCHAR(4000)) AS ''COPRESCRIPTION'',
			t2.repas, CAST(t2.conseil AS VARCHAR(4000)) AS ''CONSEIL'',
			CAST(t2.modeemploi AS VARCHAR(4000)) AS ''MODEEMPLOI'',
			CONVERT(CHAR(10),t2.dcreat,103) AS ''DCREAT'',
			CONVERT(CHAR(10),t2.dmodif,103) AS ''DMODIF'',
			CONVERT(CHAR(10),t2.drevis,103) AS ''DREVIS''

		FROM SPEPOSO t2, SPEPOSOINDIC t1
		WHERE t1.id_speindic = @ID_SpeIndic
		AND t2.id_speposo = t1.id_speposo
		AND (t2.id_specialite = @ID_Specialite
			OR @ID_Specialite IS NULL)
		IF @@ERROR != 0	-- Cas d''erreur
			GOTO SORTIE_ERR


	END

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret







' 
END
GO
/****** Objet :  Table [dbo].[Version]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Version]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Version](
	[ID_TYPE_INFO] [varchar](10)  NOT NULL,
	[ID_VERSION] [varchar](10)  NULL,
	[DATE_INFO] [datetime] NOT NULL,
	[NOM] [varchar](50)  NULL,
	[COMMENTAIRE] [varchar](255)  NULL
)
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpes_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpes_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSpes_Txt]
(
	@DenomSpe	VARCHAR(60) = NULL,
	@Typ		INTEGER = NULL,
	@Domain	INTEGER = NULL,
	@Ret		INTEGER OUTPUT
            
) AS
-- Déclarations
DECLARE @Erreur   INTEGER
DECLARE @Req VARCHAR(4000)	
DECLARE @varDomaine VARCHAR(50)
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpes_Txt'')

--STATS


                   
	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	-- Mise en forme des variables internes
	EXEC @Erreur = p_Translate_Upper @DenomSpe, @Result = @DenomSpe OUTPUT
	IF @Erreur != 0	-- Cas d''erreur
		GOTO SORTIE_ERR


	EXEC @Erreur = Decode_Domain @Domain, @Result = @varDomaine OUTPUT
	IF @Erreur != 0	-- Cas d''erreur
		GOTO SORTIE_ERR

	-- Allocation conditionnelle du curseur temporaire selon le type (passé en paramètre entrant)
	IF @Typ = 1	-- Recherche à partir de 
	BEGIN
		
		 SET @Req = '' SELECT  ID_SPECIALITE, BVALID, BENCOURS, NOMUSER, DENOMSPE, FORME, DOSAGE, complement, 	
		 CAST(COMMAMMPOSO AS VARCHAR(2800)) AS "COMMAMMPOSO",		
		 RESERVE, INFERIEURAGE, UNITINF,						
		 SUPERIEURAGE, UNIFSUP, INFERIEURPOIDS, SUPERIEURPOIDS,			
		 DENOMAMM, NUMDOSAMM, SPECATEGORIE, SOURCE,				
		  CONVERT(CHAR(10), DATESOURCE,103) AS "DATESOURCE",				
		 CAST(REMARQUES AS VARCHAR(2800)) AS "REMARQUES",				
		 CONVERT(char(10), DCREAT,103) AS "DCREAT", 							
		CONVERT(char(10), DMODIF,103) AS "DMODIF",							
		CONVERT(char(10), DREVIS,103) AS "DREVIS"					
		FROM SPECIALITE                     								
		 WHERE idtypespe IN ( '' +@varDomaine +'')
                             AND REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
		REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
		REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
		REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
		REPLACE(REPLACE(REPLACE(UPPER(DENOMSPE)
		,''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')
		,''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')
		,''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')
		,''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')
		,''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')
		,''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')
		,''''Ç'''',''''C'''')
		,''''Ñ'''',''''N'''')
		 LIKE '''''' +  @DenomSpe +'''''' ORDER BY id_specialite''		


	EXEC (@Req)
	IF @@ERROR != 0
		GOTO SORTIE_ERR


	END
	ELSE IF @Typ = 2	-- Recherche à partir de substances
	BEGIN
			 SET @Req = ''SELECT
				spe.ID_SPECIALITE, spe.BVALID, spe.BENCOURS, spe.NOMUSER,
				spe.DENOMSPE, spe.FORME, spe.DOSAGE, spe.complement,
				CAST(spe.COMMAMMPOSO AS VARCHAR(2800)) AS "COMMAMMPOSO",
				spe.RESERVE, spe.INFERIEURAGE, spe.UNITINF,
				spe.SUPERIEURAGE, spe.UNIFSUP, spe.INFERIEURPOIDS, spe.SUPERIEURPOIDS,
				spe.DENOMAMM, spe.NUMDOSAMM, spe.SPECATEGORIE, spe.SOURCE,
				CONVERT(CHAR(10), spe.DATESOURCE,103) AS "DATESOURCE",
				CAST(spe.REMARQUES AS VARCHAR(2800)) AS "REMARQUES",
				CONVERT(char(10), spe.DCREAT,103) AS "DCREAT", 
				CONVERT(char(10), spe.DMODIF,103) AS "DMODIF",
				CONVERT(char(10), spe.DREVIS,103) AS "DREVIS"
			FROM 	SPECIALITE spe		INNER JOIN SPECOMPO scompo1	ON scompo1.id_specialite = spe.id_specialite,
				SPECONSTITUANT sconst	INNER JOIN T_SUB sub		             ON sub.libelle = sconst.denomsub
							             INNER JOIN SPECOMPO scompo2	ON scompo2.id_specompo = sconst.id_specompo
			WHERE scompo1.id_specompo = scompo2.id_specompo
			AND idtypespe IN ( '' +@varDomaine +'')
                            	 AND REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(sub.LIBELLE)
			,''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')
			,''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')
			,''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')
			,''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')
			,''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')
			,''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')
			,''''Ç'''',''''C'''')
			,''''Ñ'''',''''N'''')
			 LIKE '''''' +  @DenomSpe +'''''' ''	

	EXEC (@Req)
	IF @@ERROR != 0
		GOTO SORTIE_ERR	

	END
	ELSE IF @Typ = 25	-- Recherche à partir de substance active
	BEGIN
		
			 SET @Req = ''SELECT
				spe.ID_SPECIALITE, spe.BVALID, spe.BENCOURS, spe.NOMUSER,
				spe.DENOMSPE, spe.FORME, spe.DOSAGE, spe.complement,
				CAST(spe.COMMAMMPOSO AS VARCHAR(2800)) AS "COMMAMMPOSO",
				spe.RESERVE, spe.INFERIEURAGE, spe.UNITINF,
				spe.SUPERIEURAGE, spe.UNIFSUP, spe.INFERIEURPOIDS, spe.SUPERIEURPOIDS,
				spe.DENOMAMM, spe.NUMDOSAMM, spe.SPECATEGORIE, spe.SOURCE,
				CONVERT(CHAR(10), spe.DATESOURCE,103) AS "DATESOURCE",
				CAST(spe.REMARQUES AS VARCHAR(2800)) AS "REMARQUES",
				CONVERT(char(10), spe.DCREAT,103) AS "DCREAT", 
				CONVERT(char(10), spe.DMODIF,103) AS "DMODIF",
				CONVERT(char(10), spe.DREVIS,103) AS "DREVIS"
			FROM 	SPECIALITE spe		INNER JOIN SPECOMPO scompo1	ON scompo1.id_specialite = spe.id_specialite,
				SPECONSTITUANT sconst	INNER JOIN T_SUB sub		ON sub.libelle = sconst.denomsub
							INNER JOIN SPECOMPO scompo2	ON scompo2.id_specompo = sconst.id_specompo
			WHERE scompo1.id_specompo = scompo2.id_specompo			
			AND sconst.bconstactif = ''''1''''
		             AND idtypespe IN ( '' +@varDomaine +'')
                            	 AND REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(sub.LIBELLE)
			,''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')
			,''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')
			,''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')
			,''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')
			,''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')
			,''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')
			,''''Ç'''',''''C'''')
			,''''Ñ'''',''''N'''')
			 LIKE '''''' +  @DenomSpe +'''''' ''

	EXEC (@Req)
	IF @@ERROR != 0
		GOTO SORTIE_ERR	

	END
	ELSE IF @Typ = 27	-- Recherche à partir d''un excipient
	BEGIN
	
			  SET @Req = ''SELECT
				spe.ID_SPECIALITE, spe.BVALID, spe.BENCOURS, spe.NOMUSER,
				spe.DENOMSPE, spe.FORME, spe.DOSAGE, spe.complement,
				CAST(spe.COMMAMMPOSO AS VARCHAR(2800)) AS "COMMAMMPOSO",
				spe.RESERVE, spe.INFERIEURAGE, spe.UNITINF,
				spe.SUPERIEURAGE, spe.UNIFSUP, spe.INFERIEURPOIDS, spe.SUPERIEURPOIDS,
				spe.DENOMAMM, spe.NUMDOSAMM, spe.SPECATEGORIE, spe.SOURCE,
				CONVERT(CHAR(10), spe.DATESOURCE,103) AS "DATESOURCE",
				CAST(spe.REMARQUES AS VARCHAR(2800)) AS "REMARQUES",
				CONVERT(char(10), spe.DCREAT,103) AS "DCREAT", 
				CONVERT(char(10), spe.DMODIF,103) AS "DMODIF",
				CONVERT(char(10), spe.DREVIS,103) AS "DREVIS"
			FROM 	SPECIALITE spe		INNER JOIN SPECOMPO scompo1	ON scompo1.id_specialite = spe.id_specialite,

				SPECONSTITUANT sconst	INNER JOIN T_SUB sub		ON sub.libelle = sconst.denomsub
							INNER JOIN SPECOMPO scompo2	ON scompo2.id_specompo = sconst.id_specompo
			WHERE scompo1.id_specompo = scompo2.id_specompo
			AND sconst.bconstactif =''''0''''
		             AND idtypespe IN ( '' +@varDomaine +'')
                            	 AND REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(sub.LIBELLE)
			,''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')
			,''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')
			,''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')
			,''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')
			,''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')
			,''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')
			,''''Ç'''',''''C'''')
			,''''Ñ'''',''''N'''')
			 LIKE '''''' +  @DenomSpe +'''''' ''

	EXEC (@Req)
	IF @@ERROR != 0
		GOTO SORTIE_ERR	
	END
	ELSE IF @Typ = 3	
	BEGIN
			 SET @Req = ''SELECT
				spe.ID_SPECIALITE, spe.BVALID, spe.BENCOURS, spe.NOMUSER,
				spe.DENOMSPE, spe.FORME, spe.DOSAGE, spe.complement,
				CAST(spe.COMMAMMPOSO AS VARCHAR(2800)) AS "COMMAMMPOSO",
				spe.RESERVE, spe.INFERIEURAGE, spe.UNITINF,
				spe.SUPERIEURAGE, spe.UNIFSUP, spe.INFERIEURPOIDS, spe.SUPERIEURPOIDS,
				spe.DENOMAMM, spe.NUMDOSAMM, spe.SPECATEGORIE, spe.SOURCE,
				CONVERT(CHAR(10), spe.DATESOURCE,103) AS "DATESOURCE",
				CAST(spe.REMARQUES AS VARCHAR(2800)) AS "REMARQUES",
				CONVERT(char(10), spe.DCREAT,103) AS "DCREAT", 
				CONVERT(char(10), spe.DMODIF,103) AS "DMODIF",
				CONVERT(char(10), spe.DREVIS,103) AS "DREVIS"
			FROM SPECLASSIRIS sclass	INNER JOIN SPECIALITE spe		ON spe.id_specialite = sclass.id_specialite
							INNER JOIN DICOCOMCLASSIRIS dico	ON dico.id_dicocomclassiris = sclass.id_dicocomclassiris
			WHERE  idtypespe IN ( '' +@varDomaine +'')
                            	 AND REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(dico.LIBELLE)
			,''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')
			,''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')
			,''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')
			,''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')
			,''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')
			,''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')
			,''''Ç'''',''''C'''')
			,''''Ñ'''',''''N'''')
			 LIKE '''''' +  @DenomSpe +'''''' ''

	EXEC (@Req)
	IF @@ERROR != 0
		GOTO SORTIE_ERR	
	END
	ELSE IF @Typ = 4	--
	BEGIN
			 SET @Req = ''SELECT
				spe.ID_SPECIALITE, spe.BVALID, spe.BENCOURS, spe.NOMUSER,
				spe.DENOMSPE, spe.FORME, spe.DOSAGE, spe.complement,
				CAST(spe.COMMAMMPOSO AS VARCHAR(2800)) AS "COMMAMMPOSO",
				spe.RESERVE, spe.INFERIEURAGE, spe.UNITINF,
				spe.SUPERIEURAGE, spe.UNIFSUP, spe.INFERIEURPOIDS, spe.SUPERIEURPOIDS,
				spe.DENOMAMM, spe.NUMDOSAMM, spe.SPECATEGORIE, spe.SOURCE,
				CONVERT(CHAR(10), spe.DATESOURCE,103) AS "DATESOURCE",
				CAST(spe.REMARQUES AS VARCHAR(2800)) AS "REMARQUES",
				CONVERT(char(10), spe.DCREAT,103) AS "DCREAT", 
				CONVERT(char(10), spe.DMODIF,103) AS "DMODIF",
				CONVERT(char(10), spe.DREVIS,103) AS "DREVIS"
			FROM SPELABS_REL slab	INNER JOIN SPECIALITE spe	ON spe.id_specialite = slab.id_specialite
						INNER JOIN LABORATOIRE lab	ON lab.id_laboratoire = slab.id_laboratoire
			WHERE idtypespe IN ( '' +@varDomaine +'')
                            	 AND REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(lab.laboratoire)
			,''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')
			,''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')
			,''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')
			,''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')
			,''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')
			,''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')
			,''''Ç'''',''''C'''')
			,''''Ñ'''',''''N'''')
			 LIKE '''''' +  @DenomSpe +'''''' ''	

	EXEC (@Req)
	IF @@ERROR != 0
		GOTO SORTIE_ERR	
	
	END


	SET @Ret = 0
	GOTO SORTIE
END

-- Gestion des cas d''erreur
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

-- Cas de sortie de procédure sans erreur
SORTIE:


	RETURN @Ret







































' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSPIndics_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSPIndics_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSPIndics_Id]
(
	@IdSP	INTEGER=NULL,
	@Ret	INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSPIndics_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	SELECT
		t2.id_t_indic, t2.libelle,
		CAST(t2.texte AS VARCHAR(4000)) AS ''texte'',
		CONVERT(CHAR(10),t2.creation,103) AS ''creation'',
		t2.validation, CAST(t2.remarques AS VARCHAR(4000)) AS ''remarques''
	FROM T_INDIC t2, GROUPINDICINDIC_REL t1
	WHERE t1.id_groupindic = @IdSP
	AND t2.id_t_indic = t1.id_t_indic
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSPs_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSPs_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSPs_Txt]
(
	@Libelle	VARCHAR(100) = NULL,
	@Ret		INTEGER OUTPUT
) AS

-- Déclarations
DECLARE @Erreur		INTEGER
DECLARE @Curs_Tmp	CURSOR

DECLARE @varID		INTEGER
DECLARE @varLib		VARCHAR(100)
DECLARE @varType		VARCHAR(255)

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSPs_Txt'')

--STATS



	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON


	-- Transformation pour comparaison ultérieure
	EXEC @Erreur = p_Translate_Upper @Libelle, @Result = @Libelle OUTPUT
	IF @Erreur != 0	-- Cas d''erreur
	    GOTO SORTIE_ERR



	SELECT id_groupindic, libelle, type
		FROM GROUPINDIC
                          WHERE  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE   @Libelle
		ORDER BY libelle

	IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR


		SET @Ret = 0
	GOTO SORTIE
END

-- Gestion des cas d''erreur
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR


	SET @Ret = @Erreur

-- Cas de sortie de procédure sans erreur
SORTIE:
	RETURN @Ret






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSPSpes_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSPSpes_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSPSpes_Id]
(
	@IdSP	INTEGER=NULL,
	@Ret	INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSPSpes_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	SELECT
		t3.id_specialite, t3.bvalid, t3.bencours, t3.nomuser, t3.denomspe, t3.forme,
		t3.dosage, t3.complement, CAST(t3.commammposo AS VARCHAR(4000)) AS ''commammposo'',
		t3.reserve, t3.inferieurage, t3.unitinf, t3.superieurage, t3.unifsup,
		inferieurpoids, t3.superieurpoids, t3.denomamm, t3.numdosamm,
		t3.specategorie, t3.source, CONVERT(CHAR(10),t3.datesource,103) AS ''DATESOURCE'',
		CAST(t3.remarques AS VARCHAR(4000)) AS ''remarques'',
		CONVERT(CHAR(10),t3.dcreat,103) AS ''DCREAT'', CONVERT(CHAR(10),t3.dmodif,103) AS ''DMODIF'',
		CONVERT(CHAR(10),t3.drevis,103) AS ''DREVIS''
	FROM SPECIALITE t3, SPEINDIC t2, GROUPINDICINDIC_REL t1
	WHERE t1.id_groupindic = @IdSP
	AND t2.id_t_indic = t1.id_t_indic
	AND t3.id_specialite = t2.id_specialite
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstsPere_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstsPere_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSubstsPere_Txt]
(
	@ListeIdSubst	VARCHAR(1000),
	@Ret		INTEGER OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER

-- BODY PROC
BEGIN

	SET NOCOUNT  ON
	SET @Erreur = 0

	IF EXISTS( SELECT 1 FROM TempDb..SYSOBJECTS WHERE NAME = ''##TMP_CONNECTBY''  AND TYPE = ''U'')
		DROP TABLE ##TMP_CONNECTBY
	CREATE TABLE ##TMP_CONNECTBY ( ID_COL INTEGER )

	-- récupération hiérachie
	EXEC @Erreur = p_Connect_By ''COUPLETERMETERME'', ''id_t_sub_p'', ''id_t_sub_f'', ''F'',  0, @ListeIdSubst, NULL
	IF @Erreur != 0
	BEGIN
		GOTO SORTIE_ERR
	END
	-- définition du pere
	SELECT DISTINCT
		a.ID_T_SUB_P
	FROM COUPLETERMETERME a
	WHERE a.ID_T_SUB_F IN (	SELECT DISTINCT  b.ID_T_SYNONYSUB
				FROM COUPLETERMESYNONYME b
				WHERE ID_T_SUB IN (@ListeIdSubst))
	UNION
	SELECT DISTINCT * FROM ##TMP_CONNECTBY
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- définition du fils
	SELECT DISTINCT
		a.ID_T_SUB,
		CASE a.HOMEOPATHIE
			WHEN ''F'' THEN a.LIBELLE
			ELSE a.LIBELLE + ''[Homéo]''
		END LIBELLE,
		a.HOMEOPATHIE,
		CAST(a.TEXTE AS VARCHAR(4000)) AS ''TEXTE'',
		a.DC,
		a.COMPLEMENTINDEXSUB,
		1 AS ''HasChild''
	FROM T_SUB a	INNER JOIN IndexSub_Rel c ON a.id_T_Sub = c.id_T_Sub 
			INNER JOIN CoupleTermeTerme b ON  a.id_T_Sub = b.id_T_Sub_P
	WHERE c.ID_TYPEINDEX = 1
	AND b.ID_T_SUB_F IN (@ListeIdSubst)
	UNION
	SELECT DISTINCT
		a.ID_T_SUB,
		CASE a.HOMEOPATHIE
			WHEN ''F'' THEN a.LIBELLE
			ELSE a.LIBELLE + ''[Homéo]''
		END LIBELLE,
		a.HOMEOPATHIE,
		CAST(a.TEXTE AS VARCHAR(4000)) AS ''TEXTE'',
		a.DC,
		a.COMPLEMENTINDEXSUB,
		1 AS ''HasChild''
	FROM T_Sub a	INNER JOIN CoupleTermeTerme b ON a.id_T_Sub = b.id_T_Sub_P 
			INNER JOIN IndexSub_Rel d ON a.id_T_Sub = d.id_T_Sub 
			INNER JOIN CoupleTermeSynonyme c ON b.id_T_Sub_F = c.id_T_SynonySub
	WHERE d.ID_TYPEINDEX = 1
	AND c.ID_T_SUB IN (@ListeIdSubst) 
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstsWithLivret_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstsWithLivret_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSubstsWithLivret_Txt]
(
	@Libelle	VARCHAR(100)=NULL,
	@Type		INTEGER,
	@Banque		VARCHAR(1),
	@IDHop		INTEGER,
	@Ret		INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSubstsWithLivret_Txt'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON


	EXEC @Erreur = p_Translate_Upper @Libelle, @Result = @Libelle OUTPUT
		IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR


	-- Allocation conditionnelle du curseur temporaire (selon le contenu de @Type)
	IF @Type = 0
	BEGIN
		/* ===== RECHERCHE DES EXCIPIENTS ===== */
		IF @Banque = ''O''
		BEGIN
				-- Recherche des substances dans la banque VIDAL
				SELECT
					t1.id_t_sub,
					CASE t1.HOMEOPATHIE
						WHEN	''F'' THEN t1.libelle
						ELSE t1.libelle + '' [Homéo]''
					END AS ''LIBELLE'',
					t1.homeopathie,
					CAST(t1.texte AS VARCHAR(4000)) AS ''TEXTE'',
					t1.dc,
					t1.COMPLEMENTINDEXSUB,
					CASE t1.ID_T_SUB
						WHEN NULL THEN 0
						ELSE 1
					END AS ''HasChild'',
					0 AS ''IDORGANISME'',
					''N'' AS ''FLAG_CAN'',
					''0'' AS ''Bconstactif''
				FROM T_SUB t1, T_SUB_COMPLEMENT t2, T_SUB_PARENT t3
				WHERE t1.id_t_sub = t2.id_t_sub
				AND t1.id_t_sub = t3.id_t_sub_p
				AND t3.ouvrage = 1
				AND t2.rolecompoherite in (2, 3)
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER( t1.libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 


				-- Recherche des synonymes des substances dans la banque VIDAL
				UNION
				SELECT
					t2.id_t_sub,
					t1.libelle + '' = '' + t2.libelle AS ''LIBELLE'',
					t2.homeopathie,
					CAST(t1.texte AS VARCHAR(4000)) AS ''TEXTE'',
					t2.dc,
					t2.COMPLEMENTINDEXSUB,
					CASE t2.ID_T_SUB
						WHEN NULL THEN 0
						ELSE 1
					END AS ''HasChild'',
					0 AS ''IDORGANISME'',
					''N'' AS ''FLAG_CAN'',
					''0'' AS ''Bconstactif''
				FROM T_SYNONYSUB t1, T_SUB t2, COUPLETERMESYNONYME t3, T_SUB_COMPLEMENT t4
				WHERE t3.id_t_sub = t2.id_t_sub
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER( t1.libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 
				AND t3.id_t_synonysub = t1.id_t_synonysub
				AND t4.id_t_sub = t2.id_t_sub
				AND t4.rolecompoherite in (2, 3)
				AND t2.id_t_sub IN (SELECT t5.id_t_sub_p FROM T_SUB_PARENT t5 WHERE t5.ouvrage = 1)

				-- Recherche des substances créées par l''organisme
				UNION
				SELECT
					t1.id_t_subhop,
					t1.libelle,
					'''' AS ''HOMEOPATHIE'',
					'''' AS ''TEXTE'',
					'''' AS ''DC'',
					'''' AS ''COMPLEMENTINDEXSUB'',
					0 AS ''HasChild'',
					t1.idorganisme,
					''C'' AS ''FLAG_CAN'',
					'''' AS ''Bconstactif''
				FROM T_SUBHOP t1
				WHERE t1.idorganisme = @IDHop
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER( t1.libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 
				ORDER BY 2

		END
		ELSE	-- Cas : @Banque != ''O''
		BEGIN
			-- Recherche des substances ayant des médicaments uniquement dans les livrets de l''organisme
				-- Recherche des substances dans la banque VIDAL
				SELECT
					sub.id_t_sub,
					CASE sub.HOMEOPATHIE
						WHEN	''F'' THEN sub.libelle
						ELSE sub.libelle + '' [Homéo]''
					END AS ''LIBELLE'',
					sub.homeopathie,
					CAST(sub.texte AS VARCHAR(4000)) AS ''TEXTE'',
					sub.dc,
					sub.complementindexsub,
					CASE sub_comp.id_t_sub
						WHEN NULL THEN 0
						ELSE 1
					END AS ''HasChild'',
					liv.IDORGANISME,
					''A'' AS ''FLAG_CAN'',
					''0'' AS ''Bconstactif''
				FROM	T_SUB sub,
					T_SUB_COMPLEMENT sub_comp,
					SPECOMPO scomp,
					SPECONSTITUANT sconst,
                                   			SPECIALITE spe,
					SPEPRESENTATION spres,
					LIVRETVIDAL liv,
					T_SUB_PARENT sub_par
				WHERE sub.id_t_sub = sub_comp.id_t_sub 
				AND sub.id_t_sub = sub_par.id_t_sub_p
				AND sub_par.ouvrage = 1
                     			AND sub_comp.rolecompoherite in (2,3)
				AND sub_par.id_t_sub_f = sconst.id_t_sub
				AND scomp.ID_SPECOMPO = sconst.ID_SPECOMPO
				AND spe.ID_SPECIALITE = scomp.ID_SPECIALITE
				AND spres.ID_SPECIALITE = spe.ID_SPECIALITE
				AND liv.ID_SPEPRESENTATION = spres.ID_SPEPRESENTATION
				AND liv.IDORGANISME = @IDHop
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER( sub.libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 

				-- Recherche des synonymes des substances dans le livret VIDAL de l''organisme
				UNION
				SELECT
					sub.id_t_sub,
                                   			syn.libelle + '' = '' + sub.libelle AS ''LIBELLE'',
                                   			sub.homeopathie,
                                   			CAST(sub.texte AS VARCHAR(4000)) AS ''TEXTE'',
					sub.dc,
					sub.complementindexsub,
					CASE sub.id_t_sub
						WHEN NULL THEN 0
						ELSE 1
					END AS ''HasChild'',
					liv.IDORGANISME,
					''A'' AS ''FLAG_CAN'',
					''0'' AS ''Bconstactif''
				FROM	T_SYNONYSUB syn,
					T_SUB sub,
					COUPLETERMESYNONYME couple,
					T_SUB_COMPLEMENT sub_comp,
					SPECONSTITUANT sconst,
					SPECOMPO scomp,
					SPECIALITE spe,
					SPEPRESENTATION spres,
					LIVRETVIDAL liv
				WHERE couple.id_t_sub = sub.id_t_sub
				AND     couple.id_t_synonysub = syn.id_t_synonysub
				AND     sub_comp.id_t_sub = sub.id_t_sub
				AND     sub_comp.rolecompoherite IN (2,3)
				AND     sub.id_t_sub IN (	SELECT sub_par.id_t_sub_p FROM T_SUB_PARENT sub_par WHERE sub_par.ouvrage = 1)
				AND     sub.libelle = sconst.denomsub
				AND     scomp.id_specompo = sconst.id_specompo
				AND     scomp.id_specialite = scomp.id_specialite
				AND     spres.id_specialite = scomp.id_specialite
				AND     liv.id_spepresentation = spres.id_spepresentation
				AND     liv.idorganisme = @IDHop
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER( syn.libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle

				-- Recherche des substances dans le livret HOPITAL de l''organisme
				-- ( pas de synonyme )
				UNION
				SELECT
					id_t_subhop,
					libelle,
					'''' AS ''HOMEOPATHIE'',
					'''' AS ''TEXTE'',
					'''' AS ''DC'',
					'''' AS ''COMPLEMENTINDEXSUB'',
					0 AS ''HasChild'',
					idorganisme,
					''C'' AS ''FLAG_CAN'',
					'''' AS ''Bconstactif''
				FROM T_SUBHOP
				WHERE idorganisme = @IDHop
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 
				ORDER BY 2

		END
	END
	ELSE IF @Type = 1
	BEGIN
		/* ===== RECHERCHE DES SUBSTANCES ACTIVES ===== */
		IF @Banque = ''O''
		BEGIN
				-- Recherche des substances dans la banque VIDAL (n''apparaissant pas dans le livret VIDAL)
				SELECT
					sub.id_t_sub,
					CASE sub.homeopathie
						WHEN ''F'' THEN sub.libelle
						ELSE sub.libelle + '' [Homéo]''
					END AS ''LIBELLE'',
					sub.homeopathie,
					CAST(sub.texte AS VARCHAR(4000)) AS ''TEXTE'',
					sub.dc,
					sub.complementindexsub,
					CASE sub.id_t_sub
						WHEN NULL THEN 0
						ELSE 1
					END AS ''HasChild'',
					0 AS ''IDORGANISME'',
					''N'' AS ''FLAG_CAN'',
					''1'' AS ''Bconstactif''
				FROM T_SUB sub, T_SUB_COMPLEMENT sub_comp, T_SUB_PARENT sub_par
				WHERE  sub.id_t_sub = sub_comp.id_t_sub
				AND    sub.id_t_sub = sub_par.id_t_sub_p
				AND    sub_par.ouvrage = 1
				AND    sub_comp.rolecompoherite IN (1,3)
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(sub.libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 

				-- Recherche des synonymes des substances dans la banque VIDAL
				UNION
				SELECT
					sub.id_t_sub,
					syn.libelle + '' = '' + sub.libelle AS ''LIBELLE'',
					sub.homeopathie,
					CAST(sub.texte AS VARCHAR(4000)) AS ''TEXTE'',
					sub.dc,
					sub.complementindexsub,
					CASE sub.id_t_sub
						WHEN NULL THEN 0
						ELSE 1
					END AS ''HasChild'',
					0 AS ''IDORGANISME'',
					''N'' AS ''FLAG_CAN'',
					''1'' AS ''Bconstactif''
				 FROM	T_SYNONYSUB syn, T_SUB sub, COUPLETERMESYNONYME couple, T_SUB_COMPLEMENT sub_comp
				WHERE   couple.id_t_sub = sub.id_t_sub
				AND     couple.id_t_synonysub = syn.id_t_synonysub
				AND     sub_comp.ID_T_SUB = sub.ID_T_SUB
				AND     sub_comp.rolecompoherite IN (1,3)
				AND     sub.id_t_sub in (SELECT sub_par.id_t_sub_p FROM T_SUB_PARENT sub_par WHERE sub_par.ouvrage = 1)
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER( syn.libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 

				-- Recherche des substances dans le livret HOPITAL de l''organisme
				-- ( pas de synonyme )
				UNION

				SELECT
					id_t_subhop,
					libelle,
					'''' AS ''HOMEOPATHIE'',
					'''' AS ''TEXTE'',
					'''' AS ''DC'',
					'''' AS ''COMPLEMENTINDEXSUB'',
					0 AS ''HasChild'',
					idorganisme,
					''C'' AS ''FLAG_CAN'',
					'''' AS ''Bconstactif''
				FROM T_SUBHOP
				WHERE idorganisme = @IDHop
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 
				ORDER BY 2

		END
		ELSE	-- Cas : @Banque != ''O''
		BEGIN
			-- Recherche des substances ayant des médicaments uniquement dans les livrets de l''organisme
				SELECT
					sub.id_t_sub,
					CASE sub.HOMEOPATHIE
						WHEN	''F'' THEN sub.libelle
						ELSE sub.libelle + '' [Homéo]''
					END AS ''LIBELLE'',
					sub.homeopathie,
					CAST(sub.texte AS VARCHAR(4000)) AS ''TEXTE'',
					sub.dc,
					sub.complementindexsub,
					CASE sub_comp.id_t_sub
						WHEN NULL THEN 0
						ELSE 1
					END AS ''HasChild'',
					liv.IDORGANISME,
					''A'' AS ''FLAG_CAN'',
					''1'' AS ''Bconstactif''
				FROM	T_SUB sub,
					T_SUB_COMPLEMENT sub_comp,
					SPECOMPO scomp,
					SPECONSTITUANT sconst,
					SPECIALITE spe,
					SPEPRESENTATION spres,
					LIVRETVIDAL liv,
					T_SUB_PARENT sub_par
				WHERE sub.id_t_sub = sub_comp.id_t_sub 
				AND sub.id_t_sub = sub_par.id_t_sub_p
				AND sub_par.ouvrage = 1
				AND sub_comp.rolecompoherite in (1,3)
				AND sub_par.id_t_sub_f = sconst.id_t_sub
				AND scomp.ID_SPECOMPO = sconst.ID_SPECOMPO
				AND spe.ID_SPECIALITE = scomp.ID_SPECIALITE
				AND spres.ID_SPECIALITE = spe.ID_SPECIALITE
				AND liv.ID_SPEPRESENTATION = spres.ID_SPEPRESENTATION
				AND liv.IDORGANISME = @IDHop
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER( sub.libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 

				-- Recherche des synonymes des substances dans le livret VIDAL de l''organisme
				UNION
				SELECT
					sub.id_t_sub,
					syn.libelle + '' = '' + sub.libelle AS ''LIBELLE'',
					sub.homeopathie,
					CAST(sub.texte AS VARCHAR(4000)) AS ''TEXTE'',
					sub.dc,
					sub.complementindexsub,
					CASE sub.id_t_sub
						WHEN NULL THEN 0
						ELSE 1
					END AS ''HasChild'',
					liv.IDORGANISME,
					''A'' AS ''FLAG_CAN'',
					''1'' AS ''Bconstactif''
				FROM	T_SYNONYSUB syn,
					T_SUB sub,
					COUPLETERMESYNONYME couple,
					T_SUB_COMPLEMENT sub_comp,
					SPECONSTITUANT sconst,
					SPECOMPO scomp,
					SPECIALITE spe,
					SPEPRESENTATION spres,
					LIVRETVIDAL liv
				WHERE couple.id_t_sub = sub.id_t_sub
				AND     couple.id_t_synonysub = syn.id_t_synonysub
				AND     sub_comp.id_t_sub = sub.id_t_sub
				AND     sub_comp.rolecompoherite IN (1,3)
				AND     sub.id_t_sub IN (	SELECT sub_par.id_t_sub_p FROM T_SUB_PARENT sub_par WHERE sub_par.ouvrage = 1)
				AND     sub.libelle = sconst.denomsub
				AND     scomp.id_specompo = sconst.id_specompo
				AND     scomp.id_specialite = scomp.id_specialite
				AND     spres.id_specialite = scomp.id_specialite
				AND     liv.id_spepresentation = spres.id_spepresentation
				AND     liv.idorganisme = @IDHop
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(syn.libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 

				-- Recherche des substances dans le livret HOPITAL de l''organisme
				-- ( pas de synonyme )
				UNION
				SELECT
					id_t_subhop,
					libelle,
					'''' AS ''HOMEOPATHIE'',
					'''' AS ''TEXTE'',
					'''' AS ''DC'',
					'''' AS ''COMPLEMENTINDEXSUB'',
					0 AS ''HasChild'',
					idorganisme,
					''C'' AS ''FLAG_CAN'',
					'''' AS ''Bconstactif''
				FROM T_SUBHOP
				WHERE idorganisme = @IDHop
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER( libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 
				ORDER BY 2

		END
	END
	ELSE IF @Type = 2
	BEGIN
		/* ===== RECHERCHE DE TOUTES SUBSTANCES ===== */
		IF @Banque = ''O''
		BEGIN
				-- Recherche des substances dans la banque VIDAL
				SELECT
					sub.id_t_sub,
					CASE sub.homeopathie
						WHEN ''F'' THEN sub.libelle
						ELSE sub.libelle + '' [Homéo]''
					END AS ''LIBELLE'',
					sub.homeopathie,
					CAST(sub.texte AS VARCHAR(4000)) AS ''TEXTE'',
					sub.dc,
					sub.complementindexsub,
					CASE sub.id_t_sub
						WHEN NULL THEN 0
						ELSE 1
					END AS ''HasChild'',
					0 AS ''IDORGANISME'',
					''N'' AS ''FLAG_CAN'',
					'''' AS ''Bconstactif''
				FROM T_SUB sub, T_SUB_COMPLEMENT sub_comp, T_SUB_PARENT sub_par
				WHERE  sub.id_t_sub = sub_comp.id_t_sub
				AND    sub.id_t_sub = sub_par.id_t_sub_p
				AND    sub_par.ouvrage = 1
				AND    sub_comp.rolecompoherite IN (1,2,3)
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER( sub.libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 

				-- Recherche des synonymes des substances dans la banque VIDAL
				UNION
				SELECT
					sub.id_t_sub,
					syn.libelle + '' = '' + sub.libelle AS ''LIBELLE'',
					sub.homeopathie,
					CAST(sub.texte AS VARCHAR(4000)) AS ''TEXTE'',
					sub.dc,
					sub.complementindexsub,
					CASE sub.id_t_sub
						WHEN NULL THEN 0
						ELSE 1
					END AS ''HasChild'',
					0 AS ''IDORGANISME'',
					''N'' AS ''FLAG_CAN'',
					'''' AS ''Bconstactif''
				FROM	T_SYNONYSUB syn, T_SUB sub, COUPLETERMESYNONYME couple, T_SUB_COMPLEMENT sub_comp
				WHERE   couple.id_t_sub = sub.id_t_sub
				AND     couple.id_t_synonysub = syn.id_t_synonysub
				AND     sub_comp.ID_T_SUB = sub.ID_T_SUB
				AND     sub_comp.rolecompoherite IN (1,2,3)
				AND     sub.id_t_sub in (SELECT sub_par.id_t_sub_p FROM T_SUB_PARENT sub_par WHERE sub_par.ouvrage = 1)
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER( syn.libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 

				-- Recherche des substances dans le livret HOPITAL de l''organisme
				-- ( pas de synonyme )
				UNION
				SELECT
					id_t_subhop,
					libelle,
					'''' AS ''HOMEOPATHIE'',
					'''' AS ''TEXTE'',
					'''' AS ''DC'',
					'''' AS ''COMPLEMENTINDEXSUB'',
					0 AS ''HasChild'',
					idorganisme,
					''C'' AS ''FLAG_CAN'',
					'''' AS ''Bconstactif''
				FROM T_SUBHOP
				WHERE idorganisme = @IDHop
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 
				ORDER BY 2

		END
		ELSE	-- Cas : @Banque != ''O''
		BEGIN
			-- Recherche des substances ayant des médicaments uniquement dans les livrets de l''organisme
				SELECT
					sub.id_t_sub,
					CASE sub.HOMEOPATHIE
						WHEN	''F'' THEN sub.libelle
						ELSE sub.libelle + '' [Homéo]''
					END AS ''LIBELLE'',
					sub.homeopathie,
					CAST(sub.texte AS VARCHAR(4000)) AS ''TEXTE'',
					sub.dc,
					sub.complementindexsub,
					CASE sub_comp.id_t_sub
						WHEN NULL THEN 0
						ELSE 1
					END AS ''HasChild'',
					liv.IDORGANISME,
					''A'' AS ''FLAG_CAN'',
					'''' AS ''Bconstactif''
				FROM	T_SUB sub,
					T_SUB_COMPLEMENT sub_comp,
					SPECOMPO scomp,
					SPECONSTITUANT sconst,
					SPECIALITE spe,
					SPEPRESENTATION spres,
					LIVRETVIDAL liv,
					T_SUB_PARENT sub_par
				WHERE sub.id_t_sub = sub_comp.id_t_sub 
				AND sub.id_t_sub = sub_par.id_t_sub_p
				AND sub_par.ouvrage = 1
				AND sub_comp.rolecompoherite in (1,2,3)
				AND sub_par.id_t_sub_f = sconst.id_t_sub
				AND scomp.ID_SPECOMPO = sconst.ID_SPECOMPO
				AND spe.ID_SPECIALITE = scomp.ID_SPECIALITE
				AND spres.ID_SPECIALITE = spe.ID_SPECIALITE
				AND liv.ID_SPEPRESENTATION = spres.ID_SPEPRESENTATION
				AND liv.IDORGANISME = @IDHop
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER( sub.libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 

				-- Recherche des synonymes des substances dans le livret VIDAL de l''organisme
				UNION
				SELECT
					sub.id_t_sub,
					syn.libelle + '' = '' + sub.libelle AS ''LIBELLE'',
					sub.homeopathie,
					CAST(sub.texte AS VARCHAR(4000)) AS ''TEXTE'',
					sub.dc,
					sub.complementindexsub,
					CASE sub.id_t_sub
						WHEN NULL THEN 0
						ELSE 1
					END AS ''HasChild'',
					liv.IDORGANISME,
					''A'' AS ''FLAG_CAN'',
					'''' AS ''Bconstactif''
				FROM	T_SYNONYSUB syn,
					T_SUB sub,
					COUPLETERMESYNONYME couple,
					T_SUB_COMPLEMENT sub_comp,
					SPECONSTITUANT sconst,
					SPECOMPO scomp,
					SPECIALITE spe,
					SPEPRESENTATION spres,
					LIVRETVIDAL liv
				WHERE couple.id_t_sub = sub.id_t_sub
				AND     couple.id_t_synonysub = syn.id_t_synonysub
				AND     sub_comp.id_t_sub = sub.id_t_sub
				AND     sub_comp.rolecompoherite IN (1,2,3)
				AND     sub.id_t_sub IN (	SELECT sub_par.id_t_sub_p FROM T_SUB_PARENT sub_par WHERE sub_par.ouvrage = 1)
				AND     sub.libelle = sconst.denomsub
				AND     scomp.id_specompo = sconst.id_specompo
				AND     scomp.id_specialite = scomp.id_specialite
				AND     spres.id_specialite = scomp.id_specialite
				AND     liv.id_spepresentation = spres.id_spepresentation
				AND     liv.idorganisme = @IDHop
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER( syn.libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 

				-- Recherche des substances dans le livret HOPITAL de l''organisme
				-- ( pas de synonyme )
				UNION
				SELECT
					id_t_subhop,
					libelle,
					'''' AS ''HOMEOPATHIE'',
					'''' AS ''TEXTE'',
					'''' AS ''DC'',
					'''' AS ''COMPLEMENTINDEXSUB'',
					0 AS ''HasChild'',
					idorganisme,
					''C'' AS ''FLAG_CAN'',
					'''' AS ''Bconstactif''
				FROM T_SUBHOP
				WHERE idorganisme = @IDHop
			AND  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER( libelle)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle
				ORDER BY 2
		END
	END

	
		SET @Ret = 0
	GOTO SORTIE
END

-- Gestion des cas d''erreur
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur


-- Cas de sortie de procédure sans erreur
SORTIE:
	RETURN @Ret







' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetTheraAncester_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetTheraAncester_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetTheraAncester_Id]
(
	@IDDicoComClassIris	INTEGER,
	@Ret			INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER
DECLARE @TableT varchar(25)
DECLARE @Req varchar(4000)
DECLARE @Time  varchar(20)
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetTheraAncester_Id'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	-- PREPARATION LISTE CONNECT BY
	SET @Time = replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET @TableT = ''TMP_CONNECTBY'' +@Time

	-- PREPARATION LISTE CONNECT --

             SET  @Req = ''''
	IF EXISTS( SELECT 1 FROM  tempdb..sysobjects  WHERE NAME = ''##'' + @TableT AND TYPE = ''U'')
		SET @Req = ''DROP TABLE ##''+ @TableT
                           EXEC(@Req)
	-- Création de la table temporaire
	SET @Req = ''CREATE TABLE ##''+ @TableT +'' ( ID_COL INTEGER )''
	EXEC(@Req) 


		-- Récupération de la hiérachie
		    /* Juste pour mémo, les paramètres de la procédure : p_Connect_By NomTable, ColPere, ColFils, TypeNoeud, ID, ListeID, Terme */
		EXEC @Erreur = p_Connect_By  ''DICOCOMCLASSIRIS'', ''dic_id_dicocomclassiris'', ''id_dicocomclassiris'',  ''F'', @IDDicoComClassIris, NULL, NULL, @TableT 
		IF @Erreur != 0
			GOTO SORTIE_ERR
	-- FIN PREPA LISTE CONNECT --

	
	SET @Req = ''SELECT
		t1.id_dicocomclassiris, t1.dic_id_dicocomclassiris,
		LTRIM(
			CASE SUBSTRING(UPPER(t1.libelle), 1, 3)
				WHEN ''''ZZ_'''' THEN SUBSTRING(
								t1.libelle,
								PATINDEX(''''%\%'''',t1.libelle) + 1,
								CASE PATINDEX(''''%\%'''', SUBSTRING(t1.libelle, PATINDEX(''''%\%'''', t1.libelle) + 1, 255))
									WHEN 0 THEN 255
									ELSE (PATINDEX(''''%\%'''', SUBSTRING(t1.libelle, PATINDEX(''''%\%'''', t1.libelle) + 1, 255))
									     - PATINDEX(''''%\%'''', t1.libelle) - 2)
								END
							 )
				ELSE t1.libelle
			END
		     ) AS ''''LIBELLE'''',
		t1.ordre,
		CASE t2.id_dicocomclassiris
			WHEN NULL THEN 0
			ELSE 1
		END AS ''''HasChild''''

	FROM DICOCOMCLASSIRIS t1 LEFT OUTER JOIN DICOCOMCLASSIRIS t2
				 ON t1.id_dicocomclassiris = t2.dic_id_dicocomclassiris
	WHERE t1.dic_id_dicocomclassiris IS NULL
	AND t1.id_dicocomclassiris IN ( SELECT * FROM ##''+@TableT+'')
	GROUP BY
		t1.id_dicocomclassiris, t1.dic_id_dicocomclassiris, t1.libelle,
		t1.ordre,
		CASE t2.id_dicocomclassiris
			WHEN NULL THEN 0
			ELSE 1
		END''

              EXEC(@Req)

	-- TEST ERREUR
	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM  tempdb..sysobjects  WHERE NAME = ''''##''+@TableT+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TableT
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableT+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TableT
                           EXEC(@Req)
                           GOTO SORTIE
                      END
	
END

-- Gestion des erreurs
SORTIE_ERR:
	-- Sauvegarde de l''erreur
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	set @Ret = @Erreur

-- Cas de sortie sans erreur
SORTIE:
	RETURN @Ret


















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetUCD_txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetUCD_txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[GetUCD_txt]
(
	@Terme  	             varchar(100)=null,                              
	@Typ     		INTEGER,
	@Val			INTEGER,			
	@Ret		             INTEGER OUTPUT
) AS
-- BODY PROC
DECLARE @Erreur		INTEGER
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetUCD_txt'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

     If @Val = 0 
	BEGIN
	 -------------------------------------------------
	 -- recherche par Libelle d''UCD
	 -------------------------------------------------
     	IF @Typ = 11 

       		  BEGIN
          		  EXEC @Erreur = p_Translate_Upper @Terme, @Result = @Terme OUTPUT
      
          			SELECT 
          				distinct code_ucd, libelle_ucd 
           			FROM UCD 
          			 WHERE    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
					REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
					REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
					REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
					REPLACE(REPLACE(REPLACE(UPPER(libelle_ucd)
					,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
					,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
					,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
					,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
					,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
					,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
					,''Ç'',''C'')
					,''Ñ'',''N'')
					 LIKE @Terme
          			ORDER BY libelle_ucd;

      		END
        -------------------------------------------------
          -- recherche par Code d''UCD
        -------------------------------------------------                  
      	ELSE  IF   @Typ = 7 
           		BEGIN
           		 	SELECT 
           				distinct code_ucd,  libelle_ucd 
           			from 	UCD 
           			WHERE code_ucd =@Terme
         			ORDER BY libelle_ucd;
      		 END


                END

	ELSE IF  @Val = 1

		BEGIN
    	IF @Typ = 11 

       		  BEGIN
          		  EXEC @Erreur = p_Translate_Upper @Terme, @Result = @Terme OUTPUT
      
          			SELECT 
          				DISTINCT a.code_ucd, a.code_cip, a.libelle_ucd,c.denomspe + condi denomcip
           			FROM UCD a, spepresentation b, specialite c 
          			 WHERE    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
					REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
					REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
					REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
					REPLACE(REPLACE(REPLACE(UPPER(libelle_ucd)
					,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
					,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
					,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
					,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
					,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
					,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
					,''Ç'',''C'')
					,''Ñ'',''N'')
					 LIKE @Terme
				and  a.code_cip =  b.cip
				and  a.code_ucd =  b.ucd
				and  b.id_specialite = c.id_specialite
          			ORDER BY libelle_ucd;

      		END
        -------------------------------------------------
          -- recherche par Code d''UCD
        -------------------------------------------------                  
      	ELSE  IF   @Typ = 7 
           		BEGIN           		 	
           			SELECT 
          				DISTINCT a.code_ucd, a.code_cip, a.libelle_ucd,c.denomspe + condi denomcip
           			FROM UCD a, spepresentation b, specialite c 
           			WHERE code_ucd = @Terme
			and  a.code_cip =  b.cip
			and  a.code_ucd =  b.ucd
			and  b.id_specialite = c.id_specialite
         			ORDER BY libelle_ucd;
      		 END
		END


	-- CONTROLE DEFINITION
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

--- CHARGEMENT ERREUR DANS RET
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret












' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetVersion]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetVersion]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetVersion]
(
	@Ret	INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

DECLARE @Curs_Tmp		CURSOR
DECLARE @varAPI_ID		VARCHAR(10)
DECLARE @varAPI_Date	VARCHAR(10)

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetVersion'')

--STATS


/* NOTE :
On passe par un curseur pour pouvoir récupérer certaines valeurs de la 1ère requête dans des variables qui seront passées à la 2ème requête.
Il est vrai que l''on aurait pu tout concaténer en une seule requête mais c''est pour optimiser les temps d''accès et d''exécution.
*/
	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	-- Allocation du curseur temporaire
	SET @Curs_Tmp = CURSOR FOR
		SELECT id_version, CONVERT(CHAR(10), date_info, 103) AS ''DATE_INFO''
		FROM VERSION
		WHERE id_type_info = ''API''
		AND date_info = (SELECT MAX(date_info) FROM VERSION WHERE id_type_info = ''API'')
	FOR READ ONLY
	IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR

	-- Ouverture du curseur temporaire
	OPEN @Curs_Tmp
	IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR

	-- Récupération des valeurs
	FETCH @Curs_Tmp INTO @varAPI_ID, @varAPI_Date
	IF @@FETCH_STATUS != 0	-- Cas d''erreur (pas de tuple ou erreurs diverses)
		GOTO SORTIE_ERR

	-- (Re)création de la table temporaire
	SELECT
		nom AS ''DB_NAME'',
		id_version AS ''DB_ID'',
		CONVERT(CHAR(10), date_info, 103) AS ''DB_DATE'',
		@varAPI_ID AS ''API_ID'', @varAPI_Date AS ''API_DATE''
	FROM VERSION
	WHERE id_type_info = ''DB''
	AND date_info = (SELECT MAX(date_info) FROM VERSION WHERE id_type_info = ''DB'')

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  StoredProcedure [dbo].[LIV_GetHie_Pro]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LIV_GetHie_Pro]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[LIV_GetHie_Pro]
(
	@The_Ide	INTEGER,
	@Ind_H_P 	VARCHAR(1),
	@Type_From	INTEGER,
	@Type_To	INTEGER,
	@IDHop	INTEGER,
	--@Curseur	CURSOR VARYING OUTPUT
	@TLIVGetHIE	VARCHAR(50)  OUTPUT
) AS
-- Déclarations locales
DECLARE @Erreur	INTEGER
DECLARE @time        varchar(20)
--DECLARE @TGetHIE   varchar(30)
DECLARE @Req        varchar(4000)
-- Body
BEGIN

	-- Initialisation et optimisation
	SET NOCOUNT ON
	SET @Erreur = 0

	SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET  @TLIVGetHIE = ''LIV_GetHie_Pro'' +@time
	-- Effacement de la table temporaire si elle existe
	SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TLIVGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+ @TLIVGetHIE
		EXEC(@Req)
		IF @@ERROR != 0
			GOTO SORTIE_ERR			


	-- Creation table temporaire en mémoire
	SET @Req = ''CREATE TABLE ##''+@TLIVGetHIE+ ''
	(
		THE_IDE		INTEGER,
		TYPE_IDE	INTEGER,
		THE_CAF		VARCHAR(60),
		THE_LAF		VARCHAR(255),
		ID		INTEGER,
		IDORGANISME	INTEGER,
		FLAG		VARCHAR(1)
	)''
              EXEC(@REQ)
	IF @@ERROR != 0
		GOTO SORTIE_ERR

-----------------------------------------------------------------------
--		SELECTION VIDE
-----------------------------------------------------------------------
	IF @Type_From = 0
		BEGIN
		SET @Req = ''INSERT INTO ##''+@TLIVGetHIE+ ''
		SELECT
			c.THE_IDE, c.TYPE_IDE, c.THE_CAF,
			c.THE_LAF, c.ID, 0 AS ''''IDORGANISME'''',
			''''N'''' AS ''''FLAG''''
		FROM RMC_THE c
		WHERE 1 = 2 order by c.THE_LAF ''
		EXEC(@Req)
		IF @@ERROR != 0	GOTO SORTIE
		END

-----------------------------------------------------------------------
--		ACCES PAR PROFIL
-----------------------------------------------------------------------
	ELSE IF @Ind_H_P = ''P''
	BEGIN
		-- Accès aux parents profil : le type est négatif
		IF @Type_From < 0
			BEGIN
			SET @Req = ''INSERT INTO ##''+@TLIVGetHIE +''
			SELECT
				c.THE_IDE, c.TYPE_IDE, c.THE_CAF,
				c.THE_LAF, c.ID, 0 AS ''''IDORGANISME'''',
				''''N'''' AS ''''FLAG''''
			FROM RMC_THE_PRO b INNER JOIN RMC_THE a ON a.the_ide = b.the_the_ide
					   INNER JOIN RMC_THE c ON c.the_ide = b.the_ide
			WHERE c.type_ide = ''+ CONVERT(VARCHAR(10),@Type_To)+''
			AND a.the_ide =  ''+ CONVERT(VARCHAR(10),@The_Ide)+''
			AND a.type_ide = ABS( ''+ CONVERT(VARCHAR(10),@Type_From)+'')
			AND NOT EXISTS(SELECT NULL
					FROM LIVRETVIDAL d INNER JOIN SPEPRESENTATION e ON e.id_spepresentation = d.id_spepresentation
					WHERE d.idorganisme = ''+ CONVERT(VARCHAR(10),@IDHop)+''
					AND e.id_specialite = c.id)
			UNION
			SELECT
				c.THE_IDE, c.TYPE_IDE, c.THE_CAF,
				c.THE_LAF, c.ID, d.IDORGANISME,
				''''A'''' AS ''''FLAG''''
			FROM RMC_THE_PRO b INNER JOIN RMC_THE a ON a.the_ide = b.the_the_ide
					   INNER JOIN RMC_THE c ON c.the_ide = b.the_ide,
			     LIVRETVIDAL d INNER JOIN SPEPRESENTATION e ON e.id_spepresentation = d.id_spepresentation
			WHERE c.type_ide =  ''+ CONVERT(VARCHAR(10),@Type_To)+''
			AND a.the_ide =''+ CONVERT(VARCHAR(10),@The_Ide)+''
			AND a.type_ide = ABS( ''+ CONVERT(VARCHAR(10),@Type_From)+'')
			AND d.idorganisme = ''+ CONVERT(VARCHAR(10),@IDHop)+''
			AND e.id_specialite = c.id  order by 4''
			EXEC(@Req)
			END

		-- Accès aux fils profil : le type est positif
		ELSE IF @Type_From > 0
			BEGIN
			SET @Req = ''INSERT INTO ##''+@TLIVGetHIE +''
			SELECT
				c.THE_IDE, c.TYPE_IDE, c.THE_CAF,
				c.THE_LAF, c.ID, 0 AS ''''IDORGANISME'''',
				''''N'''' AS ''''FLAG''''
			FROM RMC_THE_PRO b INNER JOIN RMC_THE a ON a.the_ide = b.the_ide
					   INNER JOIN RMC_THE c ON c.the_ide = b.the_the_ide
			WHERE c.type_ide = ''+ CONVERT(VARCHAR(10),@Type_To)+''
			AND a.the_ide = ''+ CONVERT(VARCHAR(10),@The_Ide)+''
			AND a.type_ide = ABS( ''+ CONVERT(VARCHAR(10),@Type_From)+'')
			AND NOT EXISTS(SELECT NULL
					FROM LIVRETVIDAL d INNER JOIN SPEPRESENTATION e ON e.id_spepresentation = d.id_spepresentation
					WHERE d.idorganisme =''+ CONVERT(VARCHAR(10),@IDHop)+''
					AND e.id_specialite = c.id)
			UNION
			SELECT
				c.THE_IDE, c.TYPE_IDE, c.THE_CAF,
				c.THE_LAF, c.ID, d.IDORGANISME,
				''''A'''' AS ''''FLAG''''
			FROM RMC_THE_PRO b INNER JOIN RMC_THE a ON a.the_ide = b.the_ide
					   INNER JOIN RMC_THE c ON c.the_ide = b.the_the_ide,
			     LIVRETVIDAL d INNER JOIN SPEPRESENTATION e ON e.id_spepresentation = d.id_spepresentation
			WHERE c.type_ide = ''+ CONVERT(VARCHAR(10),@Type_To)+''
			AND a.the_ide =  ''+ CONVERT(VARCHAR(10),@The_Ide)+''
			AND a.type_ide = ABS( ''+ CONVERT(VARCHAR(10),@Type_From)+'')
			AND d.idorganisme = ''+ CONVERT(VARCHAR(10),@IDHop)+''
			AND e.id_specialite = c.id order by 4''
			EXEC(@Req)
			END
	END

-----------------------------------------------------------------------
--		ACCES PAR HIERARCHIE
-----------------------------------------------------------------------
	ELSE
	BEGIN
		-- Accès aux parents hiérarchiques : le type est négatif
		IF @Type_From < 0
			BEGIN
			SET @Req = ''INSERT INTO ##''+@TLIVGetHIE +''

			SELECT
				c.THE_IDE, c.TYPE_IDE, c.THE_CAF,
				c.THE_LAF, c.ID, 0 AS ''''IDORGANISME'''',
				''''N'''' AS ''''FLAG''''
			FROM RMC_THE_HIE b INNER JOIN RMC_THE a ON a.the_ide = b.the_the_ide
					   INNER JOIN RMC_THE c ON c.the_ide = b.the_ide
			WHERE c.type_ide =  ''+ CONVERT(VARCHAR(10),@Type_To)+''
			AND a.the_ide = ''+ CONVERT(VARCHAR(10),@The_Ide)+''
			AND a.type_ide = ABS( ''+ CONVERT(VARCHAR(10),@Type_From)+'')
			AND NOT EXISTS(SELECT NULL
					FROM LIVRETVIDAL d INNER JOIN SPEPRESENTATION e ON e.id_spepresentation = d.id_spepresentation
					WHERE d.idorganisme = ''+ CONVERT(VARCHAR(10),@IDHop)+''
					AND e.id_specialite = c.id)
			UNION
			SELECT
				c.THE_IDE, c.TYPE_IDE, c.THE_CAF,
				c.THE_LAF, c.ID, d.IDORGANISME,
				''''A'''' AS ''''FLAG''''
			FROM RMC_THE_HIE b INNER JOIN RMC_THE a ON a.the_ide = b.the_the_ide
					   INNER JOIN RMC_THE c ON c.the_ide = b.the_ide,
			     LIVRETVIDAL d INNER JOIN SPEPRESENTATION e ON e.id_spepresentation = d.id_spepresentation
			WHERE c.type_ide = ''+ CONVERT(VARCHAR(10),@Type_To)+''
			AND a.the_ide = ''+ CONVERT(VARCHAR(10),@The_Ide)+''
			AND a.type_ide = ABS( ''+ CONVERT(VARCHAR(10),@Type_From)+'')
			AND d.idorganisme = ''+ CONVERT(VARCHAR(10),@IDHop)+''
			AND e.id_specialite = c.id order by 4''
			EXEC(@Req)
			END
		-- Accès aux fils hiérarchiques : le type est positif
		ELSE IF @Type_From > 0
			BEGIN -- manquant rajouté le 10/02/03 pour eviter les doublons
			SET @Req = ''INSERT INTO ##''+@TLIVGetHIE +''
			SELECT
				c.THE_IDE, c.TYPE_IDE, c.THE_CAF,
				c.THE_LAF, c.ID, 0 AS ''''IDORGANISME'''',
				''''N'''' AS ''''FLAG''''
			FROM RMC_THE_HIE b INNER JOIN RMC_THE a ON a.the_ide = b.the_ide
					   INNER JOIN RMC_THE c ON c.the_ide = b.the_the_ide
			WHERE c.type_ide = ''+ CONVERT(VARCHAR(10),@Type_To)+''
			AND a.the_ide = ''+ CONVERT(VARCHAR(10),@The_Ide)+''
			AND a.type_ide = ABS( ''+ CONVERT(VARCHAR(10),@Type_From)+'')
			AND NOT EXISTS(SELECT NULL
					FROM LIVRETVIDAL d INNER JOIN SPEPRESENTATION e ON e.id_spepresentation = d.id_spepresentation
					WHERE d.idorganisme =  ''+ CONVERT(VARCHAR(10),@IDHop)+''
					AND e.id_specialite = c.id)
			UNION
			SELECT
				c.THE_IDE, c.TYPE_IDE, c.THE_CAF,
				c.THE_LAF, c.ID, d.IDORGANISME,
				''''A'''' AS ''''FLAG''''
			FROM RMC_THE_HIE b INNER JOIN RMC_THE a ON a.the_ide = b.the_ide
					   INNER JOIN RMC_THE c ON c.the_ide = b.the_the_ide,
			     LIVRETVIDAL d INNER JOIN SPEPRESENTATION e ON e.id_spepresentation = d.id_spepresentation
			WHERE c.type_ide = ''+ CONVERT(VARCHAR(10),@Type_To)+''
			AND a.the_ide = ''+ CONVERT(VARCHAR(10),@The_Ide)+''
			AND a.type_ide = ABS( ''+ CONVERT(VARCHAR(10),@Type_From)+'')
			AND d.idorganisme = ''+ CONVERT(VARCHAR(10),@IDHop)+''
			AND e.id_specialite = c.id order by 4''
			EXEC(@Req)
			END -- manquant rajouté le 10/02/03 pour eviter les doublons
	END


	IF @@ERROR != 0
	BEGIN
		SET @REQ ='' DROP TABLE ##''+@TLIVGetHIE 
		GOTO SORTIE_ERR
	END
	
	GOTO SORTIE
END


SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

SORTIE:
	RETURN @Erreur











' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Ajouter_parentheses_entre_mots]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Ajouter_parentheses_entre_mots]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Ajouter_parentheses_entre_mots]
(
	@Chaine		VARCHAR(255),
	@ChaineRetour	VARCHAR(255) OUTPUT
) AS
-- Déclarations locales
DECLARE @Ret	INTEGER
DECLARE @Taille	INTEGER
DECLARE @Index	INTEGER
DECLARE @Char	VARCHAR(1)

-- Body
BEGIN
	SET NOCOUNT ON

	SET @Taille = LEN(@Chaine)
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	IF @Taille = 0
	BEGIN
		-- Cas d''erreur
		SET @Ret = 1	-- de cette façon, la suite de RMC_GetFromKeyWordLivret_Txt ne se fera pas puisque @Erreur sera non nul
		GOTO SORTIE
	END
	ELSE
	BEGIN
		SET @ChaineRetour = ''(''
		SET @Index = 1
		WHILE @Index <= @Taille
		BEGIN
			SET @Char = SUBSTRING(@Chaine, @Index, 1)
			IF @Char NOT IN (''('', '')'')
			BEGIN
				-- Le caractère lu est un caractère séparateur
				IF @Char IN (''&'', ''|'', ''#'')
					SET @ChaineRetour = @ChaineRetour + '')'' + @Char + ''(''

				ELSE	-- Le caractère lu n''est pas un caractère séparateur
					SET @ChaineRetour = @ChaineRetour + @Char
			END

			SET @Index = @Index + 1
		END

		-- Finalisation de la chaine
		SET @ChaineRetour = @ChaineRetour + '')''
	END

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Built_Sub_Req_KWord]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Built_Sub_Req_KWord]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Built_Sub_Req_KWord]
(
	@Ori_Ide	INTEGER=null,
	@Type_Ide	INTEGER=null,
	@Chaine 	VARCHAR(255) ,
	@Type_Req	INTEGER=1,
	@Requete 	VARCHAR(4000) OUTPUT
) AS
DECLARE @Erreur INTEGER

BEGIN

	SET @Erreur = 0

	SET @Chaine = ISNULL(@Chaine, ''%'')
	IF @@ERROR != 0 GOTO SORTIE_ERR

	IF @Chaine != ''%''
	BEGIN
		SET @Chaine = UPPER(LTRIM(RTRIM(@Chaine)))
		IF @@ERROR != 0 GOTO SORTIE_ERR
		SET @Chaine =	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
				REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
				REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
				REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
				REPLACE(REPLACE(REPLACE(UPPER( @Chaine)
				,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
				,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
				,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
				,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
				,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
				,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
				,''Ç'',''C'')
				,''Ñ'',''N'')
		IF @@ERROR != 0 GOTO SORTIE_ERR
	END

	IF @Type_Req = 1
	BEGIN
		SET @Requete = '' SELECT DISTINCT c.Cle_ide FROM Rmc_Cle c WHERE''                      
		SET @Requete = @Requete + '' REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''		IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''		IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''		IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''		IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(UPPER(c.CLE_LIB)''			IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')''			IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''Ç'''',''''C'''')''						IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''Ñ'''',''''N'''')''						IF @@ERROR != 0	GOTO SORTIE
                          SET @Requete = @Requete +  ''   LIKE '''''' + @Chaine + ''%'''' AND c.TYPE_IDE = ISNULL('' + CAST(@Type_Ide AS VARCHAR(10)) + '', c.TYPE_IDE) ''
		IF @@ERROR != 0 GOTO SORTIE_ERR
	END
	ELSE IF	 @Type_Req = 2
	BEGIN
		SET @Requete = '' SELECT DISTINCT a.The_Ide, a.Type_Ide, a.The_Caf, a.The_Laf,  a.ID, c.CLE_IDE''
		IF @@ERROR != 0 GOTO SORTIE_ERR

		SET @Requete = @Requete + '' FROM RMC_THE a INNER JOIN RMC_THE_CLE b ON a.THE_IDE = b.THE_IDE INNER JOIN RMC_CLE c ON b.CLE_IDE = c.CLE_IDE AND a.TYPE_IDE = c.TYPE_IDE''
		IF @@ERROR != 0 GOTO SORTIE_ERR

		SET @Requete = @Requete + '' WHERE''
	             SET @Requete = @Requete + '' REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''		IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''		IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''		IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(UPPER(c.CLE_LIB)''			IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')''			IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''Ç'''',''''C'''')''						IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''Ñ'''',''''N'''')''						IF @@ERROR != 0	GOTO SORTIE 
                          SET @Requete = @Requete +  ''   LIKE '''''' + @Chaine + ''%'''' AND c.TYPE_IDE = ISNULL('' + CAST(@Type_Ide AS VARCHAR(10)) + '', c.TYPE_IDE) ''		
		IF @@ERROR != 0 GOTO SORTIE_ERR
	END
	ELSE IF	 @Type_Req = 3
	BEGIN
		SET @Requete = '' SELECT DISTINCT a.THE_IDE''
		IF @@ERROR != 0 GOTO SORTIE_ERR

		SET @Requete = @Requete + '' FROM RMC_THE a INNER JOIN RMC_THE_CLE b ON a.THE_IDE = b.THE_IDE INNER JOIN RMC_CLE c ON b.CLE_IDE = c.CLE_IDE AND a.TYPE_IDE = c.TYPE_IDE''
		IF @@ERROR != 0 GOTO SORTIE_ERR

		SET @Requete = @Requete + '' WHERE''
	             SET @Requete = @Requete + '' REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''		IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''		IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''		IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(UPPER(c.CLE_LIB)''			IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')''	IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')''			IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''Ç'''',''''C'''')''						IF @@ERROR != 0	GOTO SORTIE
		SET @Requete = @Requete + '',''''Ñ'''',''''N'''')''		
		SET @Requete = @Requete + '' LIKE '''''' + @Chaine + ''%'''' AND c.TYPE_IDE = ISNULL('' + CAST(@Type_Ide AS VARCHAR(10)) + '', c.TYPE_IDE) ''		
		IF @@ERROR != 0 GOTO SORTIE_ERR
	END
	ELSE
		GOTO SORTIE
	GOTO SORTIE
END

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur
























' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Built_Sub_Req_KWordLivret]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Built_Sub_Req_KWordLivret]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Built_Sub_Req_KWordLivret]
(
	@IsFirst	BIT,	-- Pour savoir si c''est la 1ère fois qu''on fait appel à cette procédure
	@Ori_Ide	INTEGER = NULL,
	@Type_Ide	INTEGER = NULL,
	@IDHop		INTEGER,
	@Chaine 	VARCHAR(255),
	@Requete 	VARCHAR(4000) OUTPUT
) AS
-- Déclarations locales
DECLARE @Erreur INTEGER
DECLARE @Req1	VARCHAR(4000)
DECLARE @Req2	VARCHAR(4000)
DECLARE @Req3	VARCHAR(4000)

-- Body
BEGIN
	-- Initialisation et optimisation
	SET NOCOUNT ON
	SET @Erreur = 0
	SET @Chaine = ISNULL(@Chaine, ''%'')
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- Mise en forme de la chaine de caractère
	IF @Chaine != ''%''
	BEGIN
		SET @Chaine = UPPER(LTRIM(RTRIM(@Chaine)))
		IF @@ERROR != 0
			GOTO SORTIE_ERR

		-- Remplacement des caractères accentués
		SET @Chaine =	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
				REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
				REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
				REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
				REPLACE(REPLACE(REPLACE(UPPER(@Chaine)
				,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
				,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
				,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
				,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
				,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
				,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
				,''Ç'',''C'')
				,''Ñ'',''N'')
		IF @@ERROR != 0
			GOTO SORTIE_ERR
	END

	---------------------------------------
	-- Création de la requête à renvoyer
	---------------------------------------
	IF @IsFirst = 1	-- Dans p_GetFromKeyWordLivret, le mot passé en paramètre est le 1er de la liste
		SET @Requete = ''SELECT DISTINCT a.the_ide, a.type_ide, a.the_caf, a.the_laf, a.id ''
	ELSE		-- Là, ce n''est pas le 1er
		SET @Requete = ''SELECT DISTINCT a.the_ide ''
	SET @Requete = @Requete + ''FROM RMC_THE_CLE b INNER JOIN RMC_THE a ON b.the_ide = a.the_ide ''
	SET @Requete = @Requete + ''INNER JOIN RMC_CLE c ON b.cle_ide = c.cle_ide ''
	SET @Requete = @Requete + ''WHERE ''
	SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
	SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
	SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
	SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
	SET @Requete = @Requete + ''REPLACE(REPLACE(REPLACE(UPPER(''
	SET @Requete = @Requete + ''c.cle_lib)''
	SET @Requete = @Requete + '',"À","A"),"Á","A"),"Â","A"),"Ã","A"),"Ä","A"),"Å","A")''
	SET @Requete = @Requete + '',"È","E"),"É","E"),"Ê","E"),"Ë","E")''
	SET @Requete = @Requete + '',"Ì","I"),"Í","I"),"Î","I"),"Ï","I")''
	SET @Requete = @Requete + '',"Ô","O"),"Ó","O"),"Õ","O"),"Ö","O")''
	SET @Requete = @Requete + '',"Ù","U"),"Ú","U"),"Û","U"),"Ü","U")''
	SET @Requete = @Requete + '',"?","Y"),"Ý","Y"),"Ÿ","Y")''
	SET @Requete = @Requete + '',"Ç","C")''
	SET @Requete = @Requete + '',"Ñ","N") ''
	SET @Requete = @Requete + ''LIKE '''''' + @Chaine + ''%'''' ''
	SET @Requete = @Requete + ''AND c.type_ide = '' + CASE @Type_Ide
								WHEN NULL THEN ''c.type_ide ''
								ELSE CONVERT(VARCHAR(10), @Type_Ide)
							END
	SET @Requete = @Requete + '' AND a.type_ide = c.type_ide ''

	GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

SORTIE:
	RETURN @Erreur











' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetTheras_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetTheras_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetTheras_Txt]
(
	@Libelle	VARCHAR(255)=NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER


-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetTheras_Txt'')

--STATS



	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON


	EXEC @Erreur = p_Translate_Upper @Libelle, @Result = @Libelle OUTPUT

	IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR


		SELECT
			t1.id_dicocomclassiris,
			t1.dic_id_dicocomclassiris,
			LTRIM(
				CASE SUBSTRING(UPPER(t1.libelle), 1, 3)
					WHEN ''ZZ_'' THEN	CASE PATINDEX(''%\%'', SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255))
									WHEN 0 THEN SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255)
									ELSE SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, PATINDEX(''%\%'', SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255)) - PATINDEX(''%\%'', t1.libelle) - 2)
							END
					ELSE t1.libelle
				END) AS ''libelle'',
			t1.ordre,
			CASE t2.id_dicocomclassiris
				WHEN NULL THEN 0
				ELSE 1
			END AS ''HasChild''
		FROM DICOCOMCLASSIRIS t1
			LEFT OUTER JOIN DICOCOMCLASSIRIS t2
			ON t1.id_dicocomclassiris = t2.dic_id_dicocomclassiris
		WHERE REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(LTRIM(
				CASE SUBSTRING(UPPER(t1.libelle), 1, 3)
					WHEN ''ZZ_'' THEN	CASE PATINDEX(''%\%'', SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255))
									WHEN 0 THEN SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255)
									ELSE SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, PATINDEX(''%\%'', SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255)) - PATINDEX(''%\%'', t1.libelle) - 2)
							END
					ELSE t1.libelle
				END) )
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 

		GROUP BY
			t1.id_dicocomclassiris,
			t1.dic_id_dicocomclassiris,
			t1.libelle,
			t1.ordre,
			CASE t2.id_dicocomclassiris
				WHEN NULL THEN 0
				ELSE 1
			END


	-- PAS D''ERREUR
	set @Ret = 0
		GOTO SORTIE
END

-- Gestion des erreurs
SORTIE_ERR:
	-- Sauvegarde de l''erreur
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	set @Ret = @Erreur

-- Cas de sortie sans erreur
SORTIE:
	RETURN @Ret







' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_ConnectByPere]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_ConnectByPere]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_ConnectByPere](
					@Liste VARCHAR(1000)
				      ) AS
-- Definittion des variables locales
DECLARE @Id_Find T_COMPTEUR
DECLARE @Erreur INTEGER
DECLARE @NewListe VARCHAR(1000)
DECLARE @Debut_Liste BIT

BEGIN
	SET NOCOUNT  ON

	-- Initialisation variable de sortie
	SET @Erreur = 0

	-- Positionnement sur les fils
	DECLARE curseur CURSOR LOCAL FOR
		SELECT DISTINCT  f.ID_T_SUB_P
             			FROM             COUPLETERMETERME f
	                          WHERE CAST(f.ID_T_SUB_F AS VARCHAR(10))  IN (@Liste)
	FOR READ ONLY

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- Ouverture du curseur
	OPEN curseur

	--Gestion erreur
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	--Initialisation de la nouvelle liste
	SET @NewListe = ''''
	--Gestion erreur
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Debut_Liste=1
	--Gestion erreur
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	IF NOT EXISTS( SELECT 1 FROM   tempdb..sysobjects  WHERE NAME = ''##TMP_EXPAND_PERES''  AND TYPE = ''U'')
		-- Création de la table temporaire
		CREATE TABLE ##TMP_EXPAND_PERES ( Id_F INTEGER )

	-- Extraction curseur
	FETCH curseur INTO @Id_Find

	-- Parcours des fils
	WHILE @@FETCH_STATUS = 0
	BEGIN
		BEGIN TRANSACTION

		-- on insére dans la table le fils trouvé
		INSERT INTO ##TMP_EXPAND_PERES VALUES (CAST(@Id_Find AS INTEGER) )

		-- Gestion erreur
		IF @@ERROR = 0
			COMMIT TRANSACTION
		ELSE
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END

		--CONCAT SUR NOUVELLE LISTE
		IF @Debut_Liste = 1
		BEGIN
			SET @NewListe = CAST(@Id_Find AS VARCHAR(10))
			IF @@ERROR != 0
				GOTO SORTIE_ERR
			SET @Debut_Liste = 0
			IF @@ERROR != 0
				GOTO SORTIE_ERR
		END
		ELSE
		BEGIN
			SET @NewListe = @NewListe + '','' +CAST(@Id_Find AS VARCHAR(10))
			IF @@ERROR != 0
				GOTO SORTIE_ERR
		END

		-- Extraction curseur
		FETCH curseur INTO @Id_Find
	END

	--Passage au niveau inférieur de l''arbre à partir du père
	IF @Debut_Liste > 0
	BEGIN
		EXEC @Erreur = p_ConnectByPere @NewListe
		IF @Erreur != 0
			GOTO SORTIE_ERR
	END
	CLOSE curseur
	DEALLOCATE curseur

END 

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	IF CURSOR_STATUS(''local'', ''Curseur'') > 0
	BEGIN
		CLOSE Curseur
		DEALLOCATE Curseur
	END

	RETURN @Erreur









' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Epurer_Chaine]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Epurer_Chaine]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Epurer_Chaine]( 
						@Source	VARCHAR(255),
					  	@Dest		VARCHAR(255) OUTPUT
					) AS
-- Definition des variables
DECLARE @Erreur INTEGER

-- BODY
BEGIN
	-- Initialisations
	SET @Erreur = 0

             -- ---------------------------------------
             -- Cette partie de traitement elimine les
             -- caracteres & | et # se trouvant à l''exterieur
             -- des mots clés
             -- ---------------------------------------
	EXEC @Erreur = p_LTrim_Ora @Source, ''&'', @Source OUTPUT
	EXEC @Erreur = p_RTrim_Ora @Source, ''&'', @Source OUTPUT

	EXEC @Erreur = p_LTrim_Ora @Source, ''|'', @Source OUTPUT
	EXEC @Erreur = p_RTrim_Ora @Source, ''|'', @Source OUTPUT

	EXEC @Erreur = p_LTrim_Ora @Source, ''#'', @Source OUTPUT
	EXEC @Erreur = p_RTrim_Ora @Source, ''#'', @Source OUTPUT

	SET @Dest = @Source
END

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur










' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCips]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCips]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_GetCips]
(
	@Id		INTEGER = 0,
	@Terme		VARCHAR(100) = NULL,
	@Type		INTEGER,
	@Domain		INTEGER,
	@Ordre		INTEGER=1,
	@TTCIPS	VARCHAR(25)  OUTPUT					
) AS
-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur INTEGER
DECLARE @Domaine VARCHAR(50)

--BODY
BEGIN
	SET NOCOUNT ON


	-- INITIALISATION Code Erreur Proc
	SET @Erreur =0

	-- Traitement du terme entrant
	IF NOT( @Terme IS NULL )
	BEGIN
		EXEC @Erreur = p_Translate_Upper @Terme, @Terme OUTPUT
		IF @Erreur !=0
			GOTO SORTIE_ERR
	END

	-- Decode Domaine
	EXEC @Erreur = Decode_Domain @Domain, @Result = @Domaine OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR
------------------------------------------------------------------------------------------- EXECUTION REQUETE  ----------------------------------------------------------------------------------------
		IF @Type = 1 		EXEC @Erreur = p_GetCips_Specialite @Id, @Terme, @Domaine, @Ordre, NULL, NULL, @TTCIPS OUTPUT
	ELSE	IF @Type IN (2,25,27 )    EXEC @Erreur = p_GetCips_Substance @Id, @Terme, @Type, @Domaine, @Ordre, NULL, NULL,  @TTCIPS OUTPUT 
	ELSE	IF @Type = 3 		EXEC @Erreur = p_GetCips_Liste_Thera  @Id, @Terme,  @Domaine, @Ordre, NULL, NULL, @TTCIPS OUTPUT 
	ELSE	IF @Type = 5 		EXEC @Erreur = p_GetCips_Liste_ATC  @Id, @Terme,  @Domaine, @Ordre, NULL, NULL, @TTCIPS OUTPUT 
	ELSE	IF @Type = 4 		EXEC @Erreur = p_GetCips_Laboratoire @Id,  @Terme, @Type, @Domaine, @Ordre, NULL, NULL,@TTCIPS OUTPUT 
	ELSE	IF @Type = 7 		EXEC @Erreur = p_GetCips_UCD  @Terme, @Type, @Domaine, @Ordre, NULL, NULL, @TTCIPS OUTPUT 
                         
	ELSE				GOTO SORTIE
	IF @Erreur != 0	 GOTO SORTIE_ERR 
	
END

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur






















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCips_Substance]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCips_Substance]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[p_GetCips_Substance]
( 
	@Id		INTEGER = NULL,
	@Terme 		VARCHAR(100) = NULL,
	@Type		INTEGER,
	@Domaine 	VARCHAR(50),
	@Ordre 		INTEGER = 1,
	@Banque 	VARCHAR(1) = NULL,
	@Id_Hop 	INTEGER = NULL,
	--@Curseur	CURSOR VARYING	OUTPUT
             @TTCIPS  varchar(25)  OUTPUT
) AS
-- DEFINITION DES VARIABLES LOCALES
DECLARE @Erreur INTEGER

DECLARE @Select VARCHAR(4000)
DECLARE @From VARCHAR(1000)
DECLARE @Where VARCHAR(4000)
DECLARE @Order VARCHAR(100)

DECLARE @Liste VARCHAR(1000)

DECLARE @TermeTxt VARCHAR(10)

DECLARE @Sel2 VARCHAR(4000)
DECLARE @From2 VARCHAR(500)
DECLARE @Where2 VARCHAR(4000)

DECLARE @Date VARCHAR(10)
DECLARE @IdHopTxt VARCHAR(10)

DECLARE @time        varchar(20)
DECLARE @TableT   varchar(25)
DECLARE @Req        varchar(4000)
--DECLARE @TTCIPS  varchar(25)
DECLARE @SQL        varchar(1000)
DECLARE @Supp        Varchar(10)
-- BODY
BEGIN
	SET NOCOUNT ON

	SET @Erreur = 0
	SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET  @TableT = ''TMP_CONNECTBY'' +@time
	SET @Supp = ''(4,5)''

	IF NOT( @Banque IS NULL )
	BEGIN
		SET @Date = ''31/12/2099''
		IF @@ERROR != 0 GOTO SORTIE_ERR
		IF @Id_Hop IS NULL
			SET @IdHopTxt = ''''
		ELSE
			SET @IdHopTxt = CAST( @Id_Hop AS VARCHAR(10))
		IF @@ERROR != 0 GOTO SORTIE_ERR
	END

-------------------------------------------------------------------------------------------- Contrôle sur Ordre Entré ----------------------------------------------------------------------------------------
	IF NOT( @Ordre IN(1,2,3) ) GOTO SORTIE

-------------------------------------------------------------------------------------------- PREPARATION DE LA TABLE TEMPORAIRE POUR TRANSLATE -----------------
	IF NOT( @Terme IS NULL )
	BEGIN
	-------------------------------------------------------------------------------------------- PREPARATION LISTE DES ID ISSUS DU TRANSLATE -----------------------------------
		EXEC @Erreur = p_Trans_Upper_Table_ListeId ''t_sub'', ''LIBELLE'' ,'' id_t_sub'', @Terme, @Liste OUTPUT
		IF @Erreur != 0	GOTO SORTIE_ERR
	END

	------------------------------------------------------------------------------------------- PREPARATION LISTE CONNECT DES ID ISSUS DE LA LISTE  TRANSLATE -----------------------------------
             SET @Req = ''''
	IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''##'' +@TableT  AND TYPE = ''U'')
                           SET @Req = ''DROP TABLE ##''+@TableT
                           EXEC(@Req)

	-- Création de la table temporaire
	SET @Req = ''CREATE TABLE ##''+@TableT +'' ( ID_COL INTEGER )''
	EXEC(@Req) 

	-- récupération hiérachie
	IF @Terme IS NULL 
		EXEC @Erreur = p_Connect_By ''COUPLETERMETERME'', ''id_t_sub_p'', ''id_t_sub_f'',  ''P'', @Id, null, null, @TableT
	ELSE
		EXEC @Erreur = p_Connect_By ''COUPLETERMETERME'', ''id_t_sub_p'', ''id_t_sub_f'',  ''P'', 0, @Liste, null,  @TableT


	IF @Erreur != 0	GOTO SORTIE_ERR

	SET @TermeTxt = CAST(@Id  AS VARCHAR(10))


-------------------------------------------------------------------------------------------- Construction du SELECT ----------------------------------------------------------------------------------------
	SET @Select = '' SELECT b.ID_SPEPRESENTATION, b.ID_SPECIALITE, b.CIP, ''
	SET @Select = @Select +	''b.UCD, b.AMMEUROPE, b.LIEUDISPO, ''
	SET @Select = @Select +	''b.CONDDISPO, b.LISTE, b.DUREEPRESCRIPTION, ''
	SET @Select = @Select +	''b.PRESCRIPTIONINITIALE, b.PRESCRIPTIONRESERVEE, ''
	SET @Select = @Select +	''b.RENOUVELRESERVE, b.MEDPARTIC, ''
	SET @Select = @Select +	''CAST(b.NATURESURVEILLANCE AS VARCHAR(3000)) NATURESURVEILLANCE, ''
	SET @Select = @Select +	''b.CODEREFERANTGENERIQUE, b.REMPLACE, b.SOURCEREMPLACE, ''
	SET @Select = @Select +	''b.DATESOURCEREMPLACE, ''
	SET @Select = @Select + ''b.REMPLACEPAR, b.SOURCEREMPLACEPAR, ''
	SET @Select = @Select +	''b.DATESOURCEREMPLACEPAR, ''
	SET @Select = @Select + ''b.PRIXPRODHTF, ''

	IF @Banque IS NULL	SET @Select = @Select + ''b.PRIXPUBLICTTCF, ''
--	ELSE 			SET @Select = @Select + ''ISNULL(l.PRIX_TTC_F,b.PRIXPUBLICTTCF) PRIXPUBLICTTCF, ''	-- Traitement sur Livret
	ELSE 			SET @Select = @Select +'' CASE  WHEN l.IDORGANISME IS NULL THEN b.PRIXPUBLICTTCF ELSE l.PRIX_TTC_F END PRIXPUBLICTTCF, ''	-- Traitement sur Livret

	SET @Select = @Select +	''b.PRIXPRODHTE, ''

	IF @Banque IS NULL	SET @Select = @Select + ''b.PRIXPUBLICTTCE, ''
	ELSE			SET @Select = @Select +'' CASE  WHEN l.IDORGANISME IS NULL THEN b.PRIXPUBLICTTCE ELSE l.PRIX_TTC_E END PRIXPUBLICTTCE, ''	-- Traitement sur Livret

	SET @Select = @Select +	''b.TVA, b.DCREAT, b.DMODIF, b.DREVIS, b.CIPREFERANT ''

	IF 		@Ordre IN (1,2)	SET @Select = @Select + '', '''' '''' EVENEMENT, '''' '''' DATEEVENEMENT ''
	ELSE IF 	@Ordre = 3	SET @Select = @Select + '',  f.EVENEMENT, ( select max(DATEEVENEMENT) FROM SpeEvtPresentation x WHERE b.id_SpePresentation = x.id_SpePresentation AND UPPER( x.EVENEMENT) LIKE ''''%REMB%'''' ) DATEEVENEMENT ''

	SET @Select = @Select +'' , CASE WHEN Condi  IS NULL THEN a.DENOMSPE ELSE a.DENOMSPE + '''':'''' + Condi END DenomCip, ''

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT ( @Banque IS NULL )
	BEGIN
		IF @Banque = ''O''
			SET @Select = @Select + '' CASE  WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END ID_ORGANISME ''
		ELSE
			SET @Select = @Select + '' l.IDORGANISME  ID_ORGANISME''

		SET @Select = @Select + '' , l.PRIX_TTC_F PRIXTTCF,  l.PRIX_TTC_E PRIXTTCE, l.DISPO, l.COMMENTAIRE ''	IF @@ERROR != 0	GOTO SORTIE
		SET @Select = @Select + '', '''''''' PRESENTATION, '''''''' FORME, '''''''' DOSAGE, '''''''' LABO, l.CODHOPITAL ''		IF @@ERROR != 0	GOTO SORTIE
		SET @Select = @Select + '',CASE WHEN l.idorganisme IS NULL THEN ''''N'''' ELSE ''''A'''' END FLAG_CAN, ''		IF @@ERROR != 0	GOTO SORTIE
	END

	SET @Select = @Select + ''  b.disponibilite, b.NBprise, b.PriseUnitaire, b.codedispo  '' 	IF @@ERROR != 0 GOTO SORTIE

-------------------------------------------------------------------------------------------- Construction du FROM ----------------------------------------------------------------------------------------
	
	--//SET @From = '' FROM specialite a ,  ''
	SET @From = '' FROM specialite a INNER JOIN SpePresentation b ON  a.id_Specialite = b.id_Specialite ''
	IF @@ERROR != 0	GOTO SORTIE
--FROM specialite a , SpePresentation b, SpeEvtPresentation f, SpeCompo g ,SpeConstituant h ,SpeConditionnementPrimaire c
	IF @Ordre = 3 
	BEGIN
		--//SET @From = @From + '' SpeEvtPresentation f, ''	
		SET @From = @From + '' INNER JOIN SpeEvtPresentation f ON b.id_SpePresentation = f.id_SpePresentation ''	
		IF @@ERROR != 0	GOTO SORTIE
	END
	--//SET @From = @From + '' SpeCompo g , SpeConstituant h , SpeConditionnementPrimaire c, SpePresentation b  ''
	SET @From = @From + ''	INNER JOIN SpeCompo g ON a.id_Specialite = g.id_Specialite INNER JOIN SpeConstituant h ON g.id_SpeCompo = h.id_SpeCompo  ''
	IF @@ERROR != 0	GOTO SORTIE

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF @Banque = ''O''
	BEGIN
		SET @From = @From + '' LEFT OUTER JOIN LivretVidal l ON b.id_SpePresentation = l.id_SpePresentation ''
		IF @@ERROR != 0	GOTO SORTIE
	END
	ELSE IF NOT( @Banque IS NULL )
	BEGIN
		SET @From = @From + '' INNER JOIN LivretVidal l ON b.id_SpePresentation = l.id_SpePresentation ''
		IF @@ERROR != 0	GOTO SORTIE
	END


-------------------------------------------------------------------------------------------- Construction du WHERE ----------------------------------------------------------------------------------------
	SET @Where = '' Where  a.IDTYPESPE IN ('' + @Domaine + '') ''


--ML : Projet Nouveaux et supprimés  12/05/2004
	SET @Where = @Where + '' AND b.codedispo not in ''+ @Supp 

	IF @@ERROR != 0	GOTO SORTIE

	IF @Type = 25
	BEGIN
		SET @Where = @Where + '' AND h.bconstactif = ''''1'''' ''
		IF @@ERROR != 0	GOTO SORTIE
	END
	ELSE	IF @Type = 27
	BEGIN
		SET @Where = @Where + '' AND h.bconstactif = ''''0'''' ''
		IF @@ERROR != 0	GOTO SORTIE
	END

	IF @Ordre = 3
	BEGIN
		SET @Where = @Where + '' AND UPPER( f.EVENEMENT) LIKE ''''%REMB%'''' ''
		IF @@ERROR != 0	GOTO SORTIE
	END

	IF ( @Id = 0 OR @Id IS NULL )
	BEGIN
		SET @Where = @Where + '' AND ( h.DENOMSUB IN ( SELECT LIBELLE FROM t_sub k WHERE ''				IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '' REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''				IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''				IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''				IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''				IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + ''REPLACE(REPLACE(REPLACE(UPPER(k.LIBELLE)''						IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '',''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')''						IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '',''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')''								IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '',''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')''									IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '',''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')''								IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '',''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')''								IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '',''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')''									IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '',''''Ç'''',''''C'''')''											IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '',''''Ñ'''',''''N'''')''											IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '' LIKE '''''' + @Terme + '''''')''									IF @@ERROR != 0	GOTO SORTIE

		IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''##'' + @TableT  AND TYPE = ''U'') 
		BEGIN
			SET @Where = @Where +'' OR ( h.DENOMSUB IN ( SELECT j.LIBELLE FROM T_SUB j WHERE j.id_t_sub IN ( SELECT * FROM ##'' + @TableT +'') ) )) ''	
                                        IF @@ERROR != 0	GOTO SORTIE
		END
	END
	ELSE
	BEGIN
		SET @Where = @Where +'' AND h.DENOMSUB IN ( SELECT LIBELLE FROM t_sub WHERE id_t_sub = '' + @TermeTxt 
		IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '' OR id_t_sub IN( SELECT  ID_COL FROM ##'' + @TableT + '' ) ) ''
		IF @@ERROR != 0	GOTO SORTIE
	END

	IF NOT ( @Banque IS NULL )
	BEGIN
		IF @Banque = ''O''
		BEGIN
			SET @Where = @Where + '' AND ( ''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where = @Where + '' CASE WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END IS NULL ''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where = @Where + '' OR CASE WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END = '' + @IdHopTxt + '' )''
			IF @@ERROR != 0	GOTO SORTIE
		END
		ELSE
		BEGIN
			SET @Where = @Where + '' AND l.IdOrganisme = '' + CAST( @Id_Hop AS VARCHAR(10)) 
			IF @@ERROR != 0	GOTO SORTIE
		END
	END

-------------------------------------------------------------------------------------------- Construction du ORDER BY  ----------------------------------------------------------------------------------------

	IF @Ordre = 3
	BEGIN
		SET @Order = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), EVENEMENT, DenomCip ''
		IF @@ERROR != 0	GOTO SORTIE
	END
	ELSE
	BEGIN
		IF @Banque IS NULL
		BEGIN
			IF @Ordre = 1
				SET @Order = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), DenomCip''				
			ELSE IF @Ordre = 2
				SET @Order = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), PRIXPUBLICTTCE, DenomCip''	
			ELSE
				SET @Order = ''''
			IF @@ERROR != 0	GOTO SORTIE
		END
		ELSE
		BEGIN
		 IF @Ordre = 1		SET @Order  = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), DenomCip''
		 ELSE			SET @Order  = '' ORDER BY  ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), PRIXPUBLICTTCE, DenomCip''
			IF @@ERROR != 0	GOTO SORTIE
		END
	END


-------------------------------------------------------------------------------------------- REQUETE  ----------------------------------------------------------------------------------------
             SET @TTCIPS =  ''Tmp_GetCips'' +@time

	IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''##'' +@TTCIPS  AND TYPE = ''U'')
	BEGIN
	             SET @Req = ''DROP TABLE ##''+@TTCIPS
                           EXEC(@Req)
             
		IF @@ERROR != 0 GOTO SORTIE_ERR			

	END

	 SET @Req  = ''CREATE TABLE ##'' +@TTCIPS+ ''
	(
		ID_SPEPRESENTATION	INTEGER,
		ID_SPECIALITE			INTEGER,
		CIP	  			VARCHAR(7),
		UCD				VARCHAR(7),
		AMMEUROPE			VARCHAR(20), 
		LIEUDISPO			VARCHAR(255),	
		CONDDISPO			VARCHAR(255),
		LISTE				VARCHAR(255),
		DUREEPRESCRIPTION		VARCHAR(255),
		PRESCRIPTIONINITIALE	VARCHAR(255), 
		PRESCRIPTIONRESERVEE	VARCHAR(255),
		RENOUVELRESERVE		VARCHAR(255), 
		MEDPARTIC			VARCHAR(1), 
		NATURESURVEILLANCE	VARCHAR(3000),
		CODEREFERANTGENERIQUE	VARCHAR(255), 
		REMPLACE			VARCHAR(7), 
		SOURCEREMPLACE		VARCHAR(255),
		DATESOURCEREMPLACE	DATETIME,
		REMPLACEPAR		VARCHAR(7), 
		SOURCEREMPLACEPAR	VARCHAR(255),
		DATESOURCEREMPLACEPAR	DATETIME, 
		PRIXPRODHTF			REAL, 
		PRIXPUBLICTTCF		REAL,

		PRIXPRODHTE			REAL, 
		PRIXPUBLICTTCE		REAL, 
		TVA				VARCHAR(255), 
		DCREAT			DATETIME, 
		DMODIF			DATETIME,

		DREVIS			DATETIME, 
		CIPREFERANT			VARCHAR(7),
		EVENEMENT			VARCHAR(255),
		DATEEVENEMENT		DATETIME,
		DENOMCIP			VARCHAR(255)

	) ''
             EXEC(@Req)

	IF @@ERROR != 0 GOTO SORTIE_ERR


	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT( @Banque IS NULL )
	BEGIN
		 SET @Req  = '' ALTER TABLE ##'' + @TTCIPS +
			            '' ADD
				ID_ORGANISME		INTEGER,
				PRIXTTCF			REAL,
				PRIXTTCE			REAL,
				DISPO				VARCHAR(60),
				COMMENTAIRE		VARCHAR(255),
				PRESENTATION		VARCHAR(50),
				FORME				VARCHAR(50),
				DOSAGE			VARCHAR(50),
				LABO				VARCHAR(60),
				CODHOPITAL			VARCHAR(30),
				FLAG_CAN			VARCHAR(1)  ''
                           EXEC(@Req)
		IF @@ERROR != 0	GOTO SORTIE

	END


  	 SET @Req  = '' ALTER TABLE ##'' + @TTCIPS +
          			     '' ADD
  				    DISPONIBILITE          VARCHAR(128),
			   	    NBPRISE                 INTEGER,
  				    PRISEUNITAIRE           VARCHAR(255) ,
                                                         CODEDISPO	         INTEGER ''
    
		EXEC(@Req)
 		 IF @@ERROR != 0 GOTO SORTIE


--print(@req)
	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT(@Banque IS NULL) 
	BEGIN
-------------------------------------------------------------------------------------------- SECONDE PARTIE DE LA REQUETE ----------------------------------------------------------------------------------------
		SET @Sel2 = '' SELECT b.ID_SPEPRESENTATIONHOP, 0 ID_SPECIALITE, b.CIP,b.UCD, '''''''' AMMEUROPE, '''''''' LIEUDISPO ,''
		IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + '' '''''''' CONDDISPO ,  '''''''' LISTE,  '''''''' DUREEPRESCRIPTION,  '''''''' PRESCRIPTIONINITIALE,  '''''''' PRESCRIPTIONRESERVEE,''
		IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + '' '''''''' RENOUVELRESERVE,  '''''''' MEDPARTIC, '''''''' NATURESURVEILLANCE,''
		IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + '' '''''''' CODEREFERANTGENERIQUE,  '''''''' REMPLACE,  '''''''' SOURCEREMPLACE,''
		IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + '' CONVERT(DATETIME,'' + @Date+ '',0) DATESOURCEREMPLACE, '''''''' REMPLACEPAR, '''''''' SOURCEREMPLACEPAR,''
		IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + '' CONVERT(DATETIME,'' + @Date+ '',0) DATESOURCEREMPLACEPAR, 0 PRIXPRODHTF,l.PRIX_TTC_F PRIXPUBLICTTCF,''
		IF @@ERROR != 0	GOTO SORTIE

		SET @Sel2 = @Sel2 + ''0 PRIXPRODHTE, l.PRIX_TTC_E PRIXPUBLICTTCE, '''''''' TVA,''
		IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + ''CONVERT(DATETIME,'' + @Date+ '',0) DCREAT,CONVERT(DATETIME,'' + @Date+ '',0) DMODIF,CONVERT(DATETIME,'' + @Date+ '',0) DREVIS, '''''''' CIPREFERANT, ''
		IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + '' '''''''' EVENEMENT, '''''''' DATEEVENEMENT,''
		IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + ''b.NOM DenomCip,  ''
		IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 +'' l.IDORGANISME, l.PRIX_TTC_F, l.PRIX_TTC_E, l.DISPO, l.COMMENTAIRE,''
		IF @@ERROR != 0	GOTO SORTIE
	             SET @Sel2 = @Sel2 + '' b.PRESENTATION, b.FORME, b.DOSAGE, b.LABO, l.CODHOPITAL,''
		IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + '' ''''C'''' FLAG_CAN,  '''''''' disponibilite,  '''''''' NBprise, '''''''' PriseUnitaire, '''''''' codedispo ''
		IF @@ERROR != 0	GOTO SORTIE

		SET @From2 = '' FROM SPEPRESENTATIONHOP b INNER JOIN LIVRETHOP l ON b.ID_SPEPRESENTATIONHOP = l.ID_SPEPRESENTATIONHOP ''
		IF @@ERROR != 0	GOTO SORTIE
		SET @From2 = @From2 + '' INNER JOIN COMPOHOP c ON b.Id_SpePresentationHop = c.Id_SpePresentationHop INNER JOIN T_SUBHOP d ON c.id_t_subhop = d.id_t_subhop ''
		IF @@ERROR != 0	GOTO SORTIE

		SET @Where2 = '' WHERE l.IDORGANISME = b.IDORGANISME AND l.IDORGANISME = '' + CAST(@Id_Hop AS VARCHAR(10) )
		IF @@ERROR != 0	GOTO SORTIE
		IF ( @Id = 0 ) OR ( @Id IS NULL )
		BEGIN
			SET @Where2 = @Where2 + ''	AND REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where2 = @Where2 + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where2 = @Where2 + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where2 = @Where2 + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where2 = @Where2 + ''REPLACE(REPLACE(REPLACE(UPPER(b.NOM)''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where2 = @Where2 + '',''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')''

			IF @@ERROR != 0	GOTO SORTIE
			SET @Where2 = @Where2 + '',''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where2 = @Where2 + '',''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where2 = @Where2 + '',''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where2 = @Where2 + '',''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where2 = @Where2 + '',''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where2 = @Where2 + '',''''Ç'''',''''C'''')''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where2 = @Where2 + '',''''Ñ'''',''''N'''')''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where2 = @Where2 + '' LIKE '''''' + @Terme + ''''''''
			IF @@ERROR != 0	GOTO SORTIE
		END
		ELSE
		BEGIN
			SET @Where2 = @Where2 + '' AND d.id_t_subhop = '' + CAST(@Id AS VARCHAR(10)) 
			IF @@ERROR != 0	GOTO SORTIE
		END
		-- YB le faire en deux à cause du order
		EXEC ( '' INSERT INTO  ##'' +@TTCIPS +  '' SELECT * FROM (''+ @Select + @From + @Where + '' UNION '' + @Sel2 + @From2 + @Where2  + '') AS List '' + @Order )
		IF @@ERROR != 0	GOTO SORTIE


	END
	ELSE
	BEGIN
		--PRINT ( ''INSERT INTO ##Tmp_GetCips '' +  @Select +  @From + @Where +  @Order )

--print (@Select + @From + @Where)
	EXEC ( ''INSERT INTO ##'' +@TTCIPS +''  ''+  @Select +  @From + @Where + @Order )
		IF @@ERROR != 0 GOTO SORTIE_ERR

        -- yb suppression du "select dictint" dans la premiere rq (pas distinct dans la deuxième, un oubli peut-être)
        -- dans ce cas je supprime le présentation en doublon a postérieuri

        EXEC (''DELETE FROM ##'' +@TTCIPS +'' WHERE id_SpePresentation  IN (SELECT id_SpePresentation FROM ##'' +@TTCIPS +''  GROUP BY id_SpePresentation HAVING count(id_SpePresentation) > 1)'') 
	END


-- TEST ERREUR
	IF @@ERROR != 0
                       BEGIN
		IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''##'' + @TableT AND TYPE = ''U'')
		SET @Req = ''DROP TABLE ##''+@TableT
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	ELSE
                      BEGIN
                       	IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''##'' + @TableT AND TYPE = ''U'')
		SET @Req = ''DROP TABLE ##''+ @TableT
                           EXEC(@Req)
                          GOTO SORTIE
                      END


END

-- TERMINAISON

SORTIE:
	RETURN 0

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur













' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCips_UCD]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCips_UCD]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[p_GetCips_UCD]	(
							@Terme	VARCHAR(100)=null,
							@Type 		INTEGER,
							@Domaine 	VARCHAR(50),
							@Ordre 	INTEGER=1,
							@Banque 	VARCHAR(1)=null,
							@Id_Hop 	INTEGER=null,
						             @TTCIPS  varchar(25)  OUTPUT					
						) AS
-- DEFINITION DES VARIABLES LOCALES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @Erreur INTEGER

DECLARE @Select VARCHAR(4000)
DECLARE @From VARCHAR(2000)
DECLARE @Where VARCHAR(4000)
DECLARE @Order VARCHAR(100)

DECLARE @Sel2 VARCHAR(4000)
DECLARE @From2 VARCHAR(500)
DECLARE @Where2 VARCHAR(4000)

DECLARE @Date VARCHAR(10)
DECLARE @IdHopTxt VARCHAR(10)

DECLARE @time        varchar(20)
DECLARE @TableT   varchar(25)
DECLARE @Req        varchar(4000)
DECLARE @Supp        Varchar(10)
-- BODY
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
BEGIN
	SET NOCOUNT ON

	SET @Erreur = 0

--------------Contrôle sur Ordre saisi ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	IF NOT( @Ordre IN(1,2,3) ) GOTO SORTIE

	IF NOT( @Banque IS NULL )
	BEGIN
		SET @Date = ''31/12/2099''
		IF @@ERROR != 0 GOTO SORTIE_ERR
		IF @Id_Hop IS NULL
			SET @IdHopTxt = ''''
		ELSE
			SET @IdHopTxt = CAST( @Id_Hop AS VARCHAR(10))
		IF @@ERROR != 0 GOTO SORTIE_ERR
	END
	
	SET @Supp = ''(4,5)''
-------------------------------------------------------------------------------------------- Construction du SELECT ----------------------------------------------------------------------------------------
	SET @Select = ''SELECT  b.ID_SPEPRESENTATION, b.ID_SPECIALITE, b.CIP,''						IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.UCD, b.AMMEUROPE, b.LIEUDISPO,''					IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.CONDDISPO, b.LISTE, b.DUREEPRESCRIPTION,''					IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.PRESCRIPTIONINITIALE, b.PRESCRIPTIONRESERVEE,''				IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.RENOUVELRESERVE, b.MEDPARTIC, ''						IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''CAST(b.NATURESURVEILLANCE AS VARCHAR(3000)) NATURESURVEILLANCE,''	IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.CODEREFERANTGENERIQUE, b.REMPLACE, b.SOURCEREMPLACE,''			IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.DATESOURCEREMPLACE, b.REMPLACEPAR, b.SOURCEREMPLACEPAR,''		IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.DATESOURCEREMPLACEPAR, b.PRIXPRODHTF, ''					IF @@ERROR != 0	GOTO SORTIE

	IF @Banque IS NULL	SET @Select = @Select + ''b.PRIXPUBLICTTCF,''
--	ELSE 			SET @Select = @Select + ''ISNULL(l.PRIX_TTC_F,b.PRIXPUBLICTTCF) PRIXPUBLICTTCF,''	-- Traitement sur Livret
	ELSE 			SET @Select = @Select + '' CASE  WHEN l.IDORGANISME IS NULL THEN b.PRIXPUBLICTTCF ELSE l.PRIX_TTC_F END PRIXPUBLICTTCF, ''	-- Traitement sur Livret
	IF @@ERROR != 0	GOTO SORTIE	

	SET @Select = @Select +	''b.PRIXPRODHTE,''									IF @@ERROR != 0	GOTO SORTIE

	IF @Banque IS NULL	SET @Select = @Select + ''b.PRIXPUBLICTTCE, ''
--	ELSE			SET @Select = @Select + ''ISNULL(l.PRIX_TTC_E,b.PRIXPUBLICTTCE) PRIXPUBLICTTCE,''	-- Traitement sur Livret
	ELSE			SET @Select = @Select + '' CASE  WHEN l.IDORGANISME IS NULL THEN b.PRIXPUBLICTTCE ELSE l.PRIX_TTC_E END PRIXPUBLICTTCE, ''		-- Traitement sur Livret
	IF @@ERROR != 0	GOTO SORTIE	

	SET @Select = @Select +	''b.TVA, b.DCREAT, b.DMODIF,b.DREVIS, b.CIPREFERANT''				IF @@ERROR != 0	GOTO SORTIE
	
	IF 		@Ordre IN (1,2)	SET @Select = @Select + '', '''' '''' EVENEMENT, '''' '''' DATEEVENEMENT''			IF @@ERROR != 0	GOTO SORTIE
	ELSE IF 	@Ordre = 3	SET @Select = @Select + '', f.EVENEMENT, f.DATEEVENEMENT''			IF @@ERROR != 0	GOTO SORTIE

	SET @Select = @Select +'' , CASE WHEN Condi  IS NULL THEN a.DENOMSPE ELSE a.DENOMSPE + '''':'''' + Condi  END DenomCip,  ''	IF @@ERROR != 0	GOTO SORTIE

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT ( @Banque IS NULL )
	BEGIN

		IF @Banque = ''O''
			SET @Select = @Select + '' CASE  WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END ID_ORGANISME ''
		ELSE
			SET @Select = @Select + '' l.IDORGANISME ID_ORGANISME ''

		SET @Select = @Select + '' ,l.PRIX_TTC_F, l.PRIX_TTC_E, l.DISPO, l.COMMENTAIRE''				IF @@ERROR != 0	GOTO SORTIE
		SET @Select = @Select + '', '''''''' PRESENTATION, '''''''' FORME, '''''''' DOSAGE, '''''''' LABO, l.CODHOPITAL''			IF @@ERROR != 0	GOTO SORTIE
		SET @Select = @Select + '',CASE WHEN l.idorganisme IS NULL THEN ''''N'''' ELSE ''''A'''' END FLAG_CAN, ''		IF @@ERROR != 0	GOTO SORTIE
	END


	SET @Select = @Select + ''  b.disponibilite, b.NBprise, b.PriseUnitaire, b.codedispo  '' 	IF @@ERROR != 0 GOTO SORTIE

-------------------------------------------------------------------------------------------- Construction du FROM ----------------------------------------------------------------------------------------
	
	SET @From = '' FROM specialite a INNER JOIN SpePresentation b ON  a.id_Specialite = b.id_Specialite''	IF @@ERROR != 0	GOTO SORTIE
	SET @From = @From + '' INNER JOIN SPELABS_REL d ON b.id_Specialite = d.id_Specialite ''		IF @@ERROR != 0	GOTO SORTIE
	SET @From = @From + '' INNER JOIN LABORATOIRE e ON d.id_Laboratoire = e.id_Laboratoire ''		IF @@ERROR != 0	GOTO SORTIE

	IF @Ordre = 3 
	BEGIN
		SET @From = @From + '' INNER JOIN SpeEvtPresentation f ON b.id_SpePresentation = f.id_SpePresentation''	
		IF @@ERROR != 0	GOTO SORTIE
	END

	--SET @From = @From + ''  LEFT OUTER JOIN SpeConditionnementPrimaire c ON b.id_SpePresentation = c.id_SpePresentation''
	--IF @@ERROR != 0	GOTO SORTIE

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT ( @Banque IS NULL ) -- ajout VBE le 05/08/03
	BEGIN

      		IF @Banque = ''O''
			SET @From = @From + '' LEFT OUTER JOIN LivretVidal l ON b.id_SpePresentation = l.id_SpePresentation ''
		ELSE
			SET @From = @From + '' INNER JOIN LivretVidal l ON b.id_SpePresentation = l.id_SpePresentation ''
		IF @@ERROR != 0	GOTO SORTIE
	END

-------------------------------------------------------------------------------------------- Construction du WHERE ----------------------------------------------------------------------------------------
	SET @Where = '' WHERE b.UCD = '' + @Terme 
	--SET @Where = @Where + '' AND (c.TYPECONDPRIMAIRE IS NULL OR UPPER(c.TYPECONDPRIMAIRE) = ''''DENOMCIP'''') ''
	SET @Where = @Where + ''AND a.IDTYPESPE IN( '' + @Domaine +'')''
--ML : Projet Nouveaux et supprimés  12/05/2004
	SET @Where = @Where + '' AND b.codedispo not in ''+ @Supp 

	IF @Ordre = 3
	BEGIN
		SET @Where = @Where + '' AND 	UPPER(f.evenement) LIKE ''''%REMB%'''' AND f.DATEEVENEMENT IN ''
		SET @Where = @Where + '' (SELECT MAX(g.DATEEVENEMENT) FROM SPEEVTPRESENTATION g WHERE g.ID_SPEPRESENTATION = f.ID_SPEPRESENTATION and  UPPER( g.EVENEMENT ) LIKE ''''%REMB%'''' )''
	END

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT ( @Banque IS NULL )
	BEGIN
		IF @Banque = ''O''
		BEGIN
			SET @Where = @Where + '' AND ( ''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where = @Where + '' CASE WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END IS NULL ''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where = @Where + '' OR CASE WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END = '' + @IdHopTxt + '' )''
			IF @@ERROR != 0	GOTO SORTIE
		END
		ELSE
		BEGIN
			SET @Where = @Where + '' AND l.IdOrganisme = '' + @IdHopTxt
			IF @@ERROR != 0	GOTO SORTIE
		END
	END


-------------------------------------------------------------------------------------------- Construction du ORDER BY  ----------------------------------------------------------------------------------------

	IF @Ordre = 3
	BEGIN
		SET @Order = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), EVENEMENT, DenomCip''
		IF @@ERROR != 0	GOTO SORTIE
	END
	ELSE
	BEGIN
		IF @Banque IS NULL
		BEGIN
			IF @Ordre = 1
				SET @Order = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), DenomCip''				
			ELSE IF @Ordre = 2
				SET @Order = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), PRIXPUBLICTTCE, DenomCip''	
			ELSE
				SET @Order = ''''
			IF @@ERROR != 0	GOTO SORTIE
		END
		ELSE
		BEGIN
		 IF @Ordre = 1		SET @Order  = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), DenomCip''
		 ELSE			SET @Order  = '' ORDER BY  ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), PRIXPUBLICTTCE, DenomCip ''
			IF @@ERROR != 0	GOTO SORTIE
		END
	END

-------------------------------------------------------------------------------------------- REQUETE  ----------------------------------------------------------------------------------------

	/*IF EXISTS( SELECT 1 FROM TempDb..SYSOBJECTS WHERE NAME = ''##Tmp_GetCips''  AND TYPE = ''U'')
	BEGIN
		DROP TABLE ##Tmp_GetCips
		IF @@ERROR != 0 GOTO SORTIE_ERR			
	END*/

	SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
 	SET @TTCIPS =  ''Tmp_GetCips'' +@time

	IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''##'' +@TTCIPS  AND TYPE = ''U'')
	BEGIN
	             SET @Req = ''DROP TABLE ## ''+@TTCIPS
                           EXEC(@Req)
             
		IF @@ERROR != 0 GOTO SORTIE_ERR			

	END

	 SET @Req  = ''CREATE TABLE ##'' +@TTCIPS+  ''
	(
		ID_SPEPRESENTATION	INTEGER,
		ID_SPECIALITE			INTEGER,
		CIP	  			VARCHAR(7),
		UCD				VARCHAR(7),
		AMMEUROPE			VARCHAR(20), 
		LIEUDISPO			VARCHAR(255),	
		CONDDISPO			VARCHAR(255),
		LISTE				VARCHAR(255),
		DUREEPRESCRIPTION		VARCHAR(255),
		PRESCRIPTIONINITIALE	VARCHAR(255), 
		PRESCRIPTIONRESERVEE	VARCHAR(255),
		RENOUVELRESERVE		VARCHAR(255), 
		MEDPARTIC			VARCHAR(1), 
		NATURESURVEILLANCE	VARCHAR(3000),
		CODEREFERANTGENERIQUE	VARCHAR(255), 
		REMPLACE			VARCHAR(7), 
		SOURCEREMPLACE		VARCHAR(255),
		DATESOURCEREMPLACE	DATETIME,
		REMPLACEPAR		VARCHAR(7), 
		SOURCEREMPLACEPAR	VARCHAR(255),
		DATESOURCEREMPLACEPAR	DATETIME, 
		PRIXPRODHTF			REAL, 
		PRIXPUBLICTTCF		REAL,
		PRIXPRODHTE			REAL, 
		PRIXPUBLICTTCE		REAL, 
		TVA				VARCHAR(255), 
		DCREAT			DATETIME, 
		DMODIF			DATETIME,
		DREVIS			DATETIME, 
		CIPREFERANT			VARCHAR(7),
		EVENEMENT			VARCHAR(255),
		DATEEVENEMENT		DATETIME,
		DENOMCIP			VARCHAR(255)

	)''
	EXEC(@Req)
	IF @@ERROR != 0 GOTO SORTIE_ERR





	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT( @Banque IS NULL )
	BEGIN
		SET @Req  = '' ALTER TABLE ##'' + @TTCIPS +''
			ADD
				ID_ORGANISME		INTEGER,
				PRIXTTCF			REAL,
				PRIXTTCE			REAL,
				DISPO				VARCHAR(60),
				COMMENTAIRE		VARCHAR(255),
				PRESENTATION		VARCHAR(50),
				FORME				VARCHAR(50),
				DOSAGE			VARCHAR(50),
				LABO				VARCHAR(60),
				CODHOPITAL			VARCHAR(30),
				FLAG_CAN			VARCHAR(1) ''
		EXEC(@Req)

		IF @@ERROR != 0	GOTO SORTIE

	END


  	 SET @Req  = '' ALTER TABLE ##'' + @TTCIPS +
          			     '' ADD
  				    DISPONIBILITE          VARCHAR(128),
			   	    NBPRISE                 INTEGER,
  				    PRISEUNITAIRE           VARCHAR(255) ,
				    CODEDISPO	         INTEGER ''
    
		EXEC(@Req)
 		 IF @@ERROR != 0 GOTO SORTIE


	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT(@Banque IS NULL) 
	BEGIN
-------------------------------------------------------------------------------------------- SECONDE PARTIE DE LA REQUETE ----------------------------------------------------------------------------------------
		SET @Sel2 = ''SELECT b.ID_SPEPRESENTATIONHOP, 0 ID_SPECIALITE, b.CIP,b.UCD, '''''''' AMMEUROPE,  '''''''' LIEUDISPO ,''
		SET @Sel2 = @Sel2 + '' '''''''' CONDDISPO ,  '''''''' LISTE,  '''''''' DUREEPRESCRIPTION,  '''''''' PRESCRIPTIONINITIALE,  '''''''' PRESCRIPTIONRESERVEE,''
		SET @Sel2 = @Sel2 + '' '''''''' RENOUVELRESERVE,  '''''''' MEDPARTIC, '''''''' NATURESURVEILLANCE,''
		SET @Sel2 = @Sel2 + '' '''''''' CODEREFERANTGENERIQUE,  '''''''' REMPLACE,  '''''''' SOURCEREMPLACE,''
		SET @Sel2 = @Sel2 + '' CONVERT(DATETIME,'' + @Date+ '',0) DATESOURCEREMPLACE, '''''''' REMPLACEPAR, '''''''' SOURCEREMPLACEPAR,''
		SET @Sel2 = @Sel2 + '' CONVERT(DATETIME,'' + @Date+ '',0) DATESOURCEREMPLACEPAR, 0 PRIXPRODHTF,l.PRIX_TTC_F PRIXPUBLICTTCF,''
		SET @Sel2 = @Sel2 + ''0 PRIXPRODHTE, l.PRIX_TTC_E PRIXPUBLICTTCE, '''''''' TVA,''
		SET @Sel2 = @Sel2 + ''CONVERT(DATETIME,'' + @Date+ '',0) DCREAT,CONVERT(DATETIME,'' + @Date+ '',0) DMODIF,CONVERT(DATETIME,'' + @Date+ '',0) DREVIS, '''''''' CIPREFERANT, ''
		SET @Sel2 = @Sel2 + '' '''''''' EVENEMENT, '''''''' DATEEVENEMENT,''
		SET @Sel2 = @Sel2 + ''b.NOM DenomCip ,  ''
		SET @Sel2 = @Sel2 +'' l.IDORGANISME, l.PRIX_TTC_F, l.PRIX_TTC_E, l.DISPO, l.COMMENTAIRE,''
		SET @Sel2 = @Sel2 + '' b.PRESENTATION, b.FORME, b.DOSAGE, b.LABO, l.CODHOPITAL,''
		SET @Sel2 = @Sel2 + '' ''''C'''' FLAG_CAN,   '''''''' disponibilite, 0 NBprise, '''''''' PriseUnitaire,  10 codedispo  ''

		SET @From2 = '' FROM SPEPRESENTATIONHOP b INNER JOIN LIVRETHOP l ON b.ID_SPEPRESENTATIONHOP = l.ID_SPEPRESENTATIONHOP''
		SET @Where2 = '' WHERE l.IDORGANISME = b.IDORGANISME AND l.IDORGANISME = '' +  @IdHopTxt
		SET @Where2 =  @Where2 + ''  AND b.UCD =  '' + @Terme

     		EXEC ( '' INSERT INTO  ##''+@TTCIPS + '' SELECT * FROM ( ''+  @Select + @From + @Where + '' UNION '' + @Sel2 + @From2 + @Where2  + '' ) AS List ''+ @Order  )


		IF @@ERROR != 0	GOTO SORTIE
	END
	ELSE
	BEGIN

		EXEC (  ''INSERT INTO ##''+@TTCIPS + ''  ''+  @Select +  @From + @Where +   @Order )
		IF @@ERROR != 0 GOTO SORTIE_ERR

	END


END

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_GetFromKeyWord]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetFromKeyWord]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_GetFromKeyWord]
(
	@Ori_Ide	INTEGER=null,
	@Type_Ide	INTEGER=null,
	@Chaine 	VARCHAR(255) ,
	@Type_Req	INTEGER=1,
             @TKWORD  	varchar(50)  OUTPUT
) AS
DECLARE @Erreur INTEGER
DECLARE @Taille INTEGER
DECLARE @Index INTEGER
DECLARE @Car VARCHAR(1)
DECLARE @Mot_Encours BIT
DECLARE @Jump BIT
DECLARE @Cle VARCHAR(255)
DECLARE @First INTEGER
DECLARE @Last INTEGER
DECLARE @Indice_Mot INTEGER
DECLARE @Sub_Req VARCHAR(1000)
DECLARE @Parentheses BIT
DECLARE @Mot VARCHAR(500)
DECLARE @Req VARCHAR(4000)
DECLARE @Req2 VARCHAR(4000)
DECLARE @Req3 BIT


DECLARE @time        varchar(20)
DECLARE @SQL        varchar(4000)
BEGIN

	SET NOCOUNT ON
	SET @Erreur = 0
              SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')            
              SET @TKWORD =  ''TMP_GetKWord'' +@time

	IF NOT ( @Type_Req IN (1,2) )	GOTO SORTIE

	EXEC @Erreur = p_Epurer_Chaine @Chaine, @Chaine OUTPUT
	IF @Erreur != 0 GOTO SORTIE_ERR

	EXEC @Erreur = p_Verifier_Parentheses @Chaine, @Chaine OUTPUT
	IF @Erreur != 0 GOTO SORTIE_ERR

	SET @Taille = LEN(@Chaine)
	IF @@ERROR != 0 GOTO SORTIE_ERR				

	SET @Index = 1
	IF @@ERROR != 0 GOTO SORTIE_ERR				

	SET @Mot_Encours = 0	-- PAS DE MOT EN COURS
	IF @@ERROR != 0 GOTO SORTIE_ERR				

	SET @Indice_Mot = 0	-- PAS DE MOT RECUPERE
	IF @@ERROR != 0 GOTO SORTIE_ERR				

	SET @Parentheses = 0	-- PAS DE PARENTHESES A FERMER
	IF @@ERROR != 0 GOTO SORTIE_ERR				

	SET @Req3 = 0	-- PAS DE REQUETE SPECIALE
	IF @@ERROR != 0 GOTO SORTIE_ERR				

	-- Debut de requete
	SET @Req = ''SELECT Distinct t.The_Ide THE_IDE, t.Type_Ide TYPE_IDE, t.The_Caf THE_CAF, t.The_Laf THE_LAF, t.Id ID FROM (''
	IF @@ERROR != 0 GOTO SORTIE_ERR				

	WHILE @Index <= @Taille
	BEGIN
		SET @Car = SUBSTRING( @Chaine, @Index, 1 ) -- RECUPERATION CARACTERE EN COURS
		IF @@ERROR != 0 GOTO SORTIE_ERR				

		IF ( @Car != '' '' OR @Mot_Encours = 0)  -- CARACTERE A TRAITER
		BEGIN

			IF @Car IN ( ''&'', ''|'', ''#'', ''('', '')'' ) --CARACTERE SEPERATEUR DE MOT
			BEGIN
				IF @Mot_EnCours = 1 -- VALIDATION FIN DE MOT
				BEGIN
					SET @Last = @Index -1 -- RECUPERATION INDEX FIN DU MOT
					IF @@ERROR != 0 GOTO SORTIE_ERR			
	
					SET @Mot_Encours = 0 -- REINIT INDICATEUR MOT EN COURS
					IF @@ERROR != 0 GOTO SORTIE_ERR				

					-- PREPARATION SOUS REQUETE DU MOT PRECEDENT
					IF @Req3 =1 -- REQUETE EN IN OU NOT IN
					BEGIN
						EXEC @Erreur = p_Built_Sub_Req_KWord @Ori_Ide ,  @Type_Ide,  @Cle,  3, @Sub_Req OUTPUT 
					END
					ELSE
					BEGIN
						EXEC @Erreur = p_Built_Sub_Req_KWord @Ori_Ide ,  @Type_Ide,  @Cle,  @Type_Req, @Sub_Req OUTPUT 
					END

					IF @Erreur != 0 GOTO SORTIE_ERR

					IF @Indice_Mot = 1 -- TRAITEMENT SUR PREMIER MOT
					BEGIN
						IF @First <> 1 
						BEGIN
							SET @Req = @Req + '' '' + SUBSTRING( @Chaine,1, @First-1 )
							IF @@ERROR != 0 GOTO SORTIE_ERR				
						END
					END

					SET @Req = @Req + '' '' + @Sub_Req	-- INSERTION SOUS REQUETE
					IF @@ERROR != 0 GOTO SORTIE_ERR				

					IF @Parentheses = 1
					BEGIN
						SET @Req = @Req + '' ) ''
						IF @@ERROR != 0 GOTO SORTIE_ERR				

						SET @Parentheses = 0
						IF @@ERROR != 0 GOTO SORTIE_ERR				
					END

					IF @Index >= @Taille	-- TRAITEMENT SUR DERNIER MOT
					BEGIN
						IF @Last != Len( @Chaine ) 
						BEGIN
							SET @Req = @Req + '' '' + SUBSTRING( @Chaine,@Last+1, Len( @Chaine) - @Last-1 )	
							IF @@ERROR != 0 GOTO SORTIE_ERR				
						END
						IF @@ERROR != 0 GOTO SORTIE_ERR				
					END
				END
				ELSE
				BEGIN
					IF @Car = ''&''
					BEGIN
						SET @Req = @Req + '' AND a.The_ide IN ( ''
						IF @@ERROR != 0 GOTO SORTIE_ERR				

						SET @Parentheses = 1
						IF @@ERROR != 0 GOTO SORTIE_ERR				

						SET @Req3 = 1
						IF @@ERROR != 0 GOTO SORTIE_ERR				

					END
					ELSE IF @Car = ''|''
					BEGIN
						SET @Req = @Req + ''UNION''
						IF @@ERROR != 0 GOTO SORTIE_ERR				

						SET @Parentheses =0
						IF @@ERROR != 0 GOTO SORTIE_ERR				

						SET @Req3 = 0
						IF @@ERROR != 0 GOTO SORTIE_ERR				

					END
					ELSE IF @Car = ''#''
					BEGIN
						SET @Req = @Req + '' AND a.The_ide NOT IN ( ''
						IF @@ERROR != 0 GOTO SORTIE_ERR				

						SET @Parentheses = 1
						IF @@ERROR != 0 GOTO SORTIE_ERR				

						SET @Req3 = 1
						IF @@ERROR != 0 GOTO SORTIE_ERR				

					END
				END
			END
			ELSE
			BEGIN
				IF @Mot_Encours = 0 -- PAS DE MOT EN COURS => DEMARRAGE NOUVEAU MOT
				BEGIN
					SET @Cle = @Car	-- INIT NOUVEAU MOT
					IF @@ERROR != 0 GOTO SORTIE_ERR				

					SET @Mot_EnCours  = 1-- POSITIONNEMENT INDICATEUR MOT EN COURS
					IF @@ERROR != 0 GOTO SORTIE_ERR				
	
					SET @First = @Index -- RECUPERATION INDEX DEBUT DE MOT
					IF @@ERROR != 0 GOTO SORTIE_ERR					
				END
				ELSE -- MOT EN COURS => POURSUITE CONSTRUCTION MOT
				BEGIN
					SET @Cle = @Cle + @Car -- CONCATENATION POUR CONSTRUCTION MOT
					IF @@ERROR != 0 GOTO SORTIE_ERR				
				END
			END

		END
		SET @Index = @Index +1 -- PASSAGE AU CARACTERE SUIVANT
		IF @@ERROR != 0 GOTO SORTIE_ERR				
	END

	IF @Parentheses = 1
	BEGIN	
		SET @req = @Req + '') ''
		IF @@ERROR != 0 GOTO SORTIE_ERR				
		SET @Parentheses = 0
		IF @@ERROR != 0 GOTO SORTIE_ERR				
	END

	-- Fin de la requete
	SET @Req = @Req + '' ) x INNER JOIN RMC_THE_CLE c ON x.CLE_IDE = c.CLE_IDE INNER JOIN RMC_THE t ON c.THE_IDE = t.THE_IDE''
	IF @@ERROR != 0 GOTO SORTIE_ERR				

	IF NOT ( @Type_Ide IS NULL )
	BEGIN
		SET @Req = @Req + '' WHERE t.TYPE_IDE = '' + CAST(@Type_Ide AS VARCHAR(10))
		IF @@ERROR != 0 GOTO SORTIE_ERR				
	END
 
	IF @Type_Ide = 5
	BEGIN
		SET @Mot =	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
				REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
				REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
				REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(

	--			REPLACE(REPLACE(REPLACE(UPPER(@Mot), --- variable non affectée. @Mot doit être construit à partir de @Cle
				REPLACE(REPLACE(REPLACE(UPPER(@Cle),
				''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A''),
				''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E''),
				''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I''),
				''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O''),
				''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U''),
				''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y''),
				''Ç'',''C''),
				''Ñ'',''N'')

		IF @@ERROR != 0 GOTO SORTIE_ERR				

--		SET @Req = @Req + '' UNION SELECT Distinct a.The_Ide, a.Type_Ide, a.The_Caf, a.The_Laf , a.Id, 0 AS "IDORGANISME", "" AS "FLAG" '' --- deux derniers champs inutiles, incohérence de structure entre les deux parties de la requêtes UNION
		SET @Req = @Req + '' UNION SELECT Distinct a.The_Ide, a.Type_Ide, a.The_Caf, a.The_Laf , a.Id  ''
		IF @@ERROR != 0 GOTO SORTIE_ERR	

		SET @Req = @Req + '' FROM RMC_THE a INNER JOIN RMC_THE_PRO b ON a.THE_IDE = b.THE_IDE''
		IF @@ERROR != 0 GOTO SORTIE_ERR				

		SET @Req = @Req + '' INNER JOIN RMC_THE c ON b.THE_THE_IDE = c.THE_IDE''
		IF @@ERROR != 0 GOTO SORTIE_ERR				

		SET @Req = @Req + '' INNER JOIN RMC_THE_CLE d ON c.THE_IDE = d.THE_IDE''
		IF @@ERROR != 0 GOTO SORTIE_ERR				

		SET @Req = @Req + '' INNER JOIN ( SELECT CLE_IDE FROM RMC_CLE WHERE TYPE_IDE = 4 AND CLE_LIB LIKE ''''''+ @Mot + ''%'''' ) e ON d.CLE_IDE = e.CLE_IDE'' 
		IF @@ERROR != 0 GOTO SORTIE_ERR				

--		SET @Req = @Req + ''  WHERE a.TYPE_ODE = 5 AND c.TYPE_IDE = 4 ORDER BY 4'' --- champ TYPE_ODE inexistant => TYPE_IDE
		SET @Req = @Req + ''  WHERE a.TYPE_IDE = 5 AND c.TYPE_IDE = 4 ORDER BY 4''
		IF @@ERROR != 0 GOTO SORTIE_ERR				

	END

	-- Effacement (si existent) des tables temporaires
	SET @SQL = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TKWORD+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TKWORD
		EXEC(@SQL)
		IF @@ERROR != 0 GOTO SORTIE_ERR				

	SET @SQL =  ''CREATE TABLE ##''+@TKWORD+
					 ''  ( 	THE_IDE 	INTEGER, 
						TYPE_IDE 	INTEGER, 
						THE_CAF 	VARCHAR(60), 
						THE_LAF 	VARCHAR(255), 
						ID 		INTEGER )''

	EXEC(@SQL)
	IF @@ERROR != 0 GOTO SORTIE_ERR				
	EXEC ( ''INSERT INTO ##''+@TKWORD+''  '' +@Req )  

	IF @@ERROR != 0 GOTO SORTIE_ERR				


END
	
-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR
	print ''erreur''
	RETURN @Erreur
























' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_GetFromKeyWordLivret]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetFromKeyWordLivret]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_GetFromKeyWordLivret]
(
	@Ori_Ide	INTEGER = NULL,
	@Type_Ide	INTEGER = NULL,
	@Chaine 	VARCHAR(255),
	@Recherche	VARCHAR(1),
	@IDHop		INTEGER,
	--@Curseur	CURSOR VARYING OUTPUT
             @TKWORD  	varchar(50)  OUTPUT
) AS
DECLARE @Erreur			INTEGER

DECLARE @Taille			INTEGER
DECLARE @Index			INTEGER
DECLARE @Car			VARCHAR(1)	-- Caractère lu
DECLARE @Mot_Encours		BIT		-- Indicateur mot en cours de définition
DECLARE @Jump			BIT
DECLARE @IsFirst		BIT		-- Indicateur si mot en cours = 1er mot
DECLARE @IsPipe			BIT		-- Indicateur si les mots sont liés par pipe
DECLARE @First			INTEGER		-- Index 1er mot
DECLARE @Last			INTEGER		-- Index dernier mot
DECLARE @SousRequete		VARCHAR(1000)
DECLARE @Parentheses		BIT		-- Indicateur de parenthèses dans la requête (0 = OK, >0 = manque parenthèse(s) fermante(s))
DECLARE @Mot			VARCHAR(255)
DECLARE @RequeteComplete		VARCHAR(4000)
DECLARE @Req1			VARCHAR(1500)
DECLARE @Req2			VARCHAR(1200)
DECLARE @Req3			VARCHAR(1300)

DECLARE @time        varchar(20)
DECLARE @Req        varchar(4000)

BEGIN
	SET NOCOUNT ON
	SET @Erreur = 0
              SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')            
              SET @TKWORD =  ''TMP_GetKWordLivret'' +@time

         -- ---------------------------------------
         -- Cette partie de traitement elimine les
         -- caracteres & | et # se trouvant à l''exterieur
         -- des mots clés
         -- ---------------------------------------
	EXEC @Erreur = p_Epurer_Chaine @Chaine, @Chaine OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR

         -- ---------------------------------------
         -- Compteur de parenthese
         -- Cette partie de traitement equilibre le nombre de
         -- parenthese droite et gauche
         -- ---------------------------------------
	EXEC @Erreur = p_Verifier_Parentheses @Chaine, @Chaine OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR

	SET @Taille = LEN(@Chaine)
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Index = 1
	SET @Mot_Encours = 0	-- PAS DE MOT EN COURS
	SET @Parentheses = 0	-- PAS DE PARENTHESES A FERMER

	--------------------------------
	-- CONSTRUCTION DE LA REQUETE
	--------------------------------
	IF @Type_Ide = 2
	BEGIN
		/*===== Début de requête =====*/
		-- Cas du flag à C
		SET @Req1 = ''SELECT DISTINCT l.id_spepresentationhop AS "THE_IDE", 2 AS "TYPE_IDE", ''
		SET @Req1 = @Req1 + ''"" AS "THE_CAF", s.nom AS "THE_LAF", l.id_spepresentationhop AS "ID", ''
		SET @Req1 = @Req1 + CONVERT(VARCHAR(10), @IDHop) + '' AS "IDORGANISME", "C" AS "FLAG" FROM (''

		-- Cas du flag à N et A
		SET @Req2 = ''SELECT DISTINCT t.the_ide, 2 AS "TYPE_IDE", t.the_caf, t.the_laf, t.id, ''
		SET @Req2 = @Req2 + ''0 AS "IDORGANISME", "N" AS "FLAG" FROM (''

		-- Cas du flag à A seulement
		SET @Req3 = ''SELECT DISTINCT t.the_ide, 2 AS "TYPE_IDE", t.the_caf, t.the_laf, t.id, ''
		SET @Req3 = @Req3 + CONVERT(VARCHAR(10), @IDHop) + '' AS "IDORGANISME", "A" AS "FLAG" FROM (''

		/*===== Corps de requête =====*/
		SET @Index = 1	-- Initialisation
		WHILE @Index <= @Taille
		BEGIN
			-- Définition du caractère en cours
			SET @Car = SUBSTRING(@Chaine, @Index, 1)
			IF @@ERROR != 0
				GOTO SORTIE_ERR

			IF (@Car != '' '' OR @Mot_EnCours = 0)
			BEGIN
				IF @Car IN (''&'', ''|'', ''#'', ''('', '')'')
				BEGIN	-- CAS : Le caractère lu dans la chaine est un séparateur
					IF @Mot_EnCours = 1
					BEGIN	-- VALIDATION FIN DE MOT
						SET @Last = @Index - 1	-- Récupération index fin du mot
						SET @Mot_EnCours = 0	-- Réinitialisation indicateur mot en cours

						-- Création de la sous-requête
						IF @IsPipe = 1
							EXEC @Erreur = p_Built_Sub_Req_KWordLivret 1, @Ori_Ide, @Type_Ide, @IDHop, @Mot, @SousRequete OUTPUT 
						ELSE
							EXEC @Erreur = p_Built_Sub_Req_KWordLivret @IsFirst, @Ori_Ide, @Type_Ide, @IDHop, @Mot, @SousRequete OUTPUT 
						IF @Erreur != 0
							GOTO SORTIE_ERR

						-- Insertion sous-requête
						SET @Req1 = @Req1 + '' '' + @SousRequete
						SET @Req2 = @Req2 + '' '' + @SousRequete
						SET @Req3 = @Req3 + '' '' + @SousRequete

						IF @Parentheses = 1
						BEGIN
							SET @Req1 = @Req1 + '' ) ''
							SET @Req2 = @Req2 + '' ) ''
							SET @Req3 = @Req3 + '' ) ''
							SET @Parentheses = 0
						END

						-- Traitement sur dernier mot
						IF @Index >= @Taille
						BEGIN
							IF @Last != LEN(@Chaine)
							BEGIN
								SET @Req1 = @Req1 + '' '' + SUBSTRING(@Chaine, @Last + 1, Len(@Chaine) - @Last - 1)
								SET @Req2 = @Req2 + '' '' + SUBSTRING(@Chaine, @Last + 1, Len(@Chaine) - @Last - 1)
								SET @Req3 = @Req3 + '' '' + SUBSTRING(@Chaine, @Last + 1, Len(@Chaine) - @Last - 1)
							END
						END
					END
					ELSE
					BEGIN
						IF @Car = ''&''
						BEGIN	-- INTERSECTION (ET)
							SET @Req1 = @Req1 + '' AND a.the_ide IN ( ''
							SET @Req2 = @Req2 + '' AND a.the_ide IN ( ''
							SET @Req3 = @Req3 + '' AND a.the_ide IN ( ''
							SET @Parentheses = 1
						END
						ELSE IF @Car = ''|''
						BEGIN	-- UNION (OU non exclusif)
							SET @Req1 = @Req1 + '' UNION ''
							SET @Req2 = @Req2 + '' UNION ''
							SET @Req3 = @Req3 + '' UNION ''
							SET @Parentheses =0
							SET @IsPipe = 1
						END
						ELSE IF @Car = ''#''
						BEGIN	-- MINUS
							SET @Req1 = @Req1 + '' AND a.the_ide NOT IN ( ''
							SET @Req2 = @Req2 + '' AND a.the_ide NOT IN ( ''
							SET @Req3 = @Req3 + '' AND a.the_ide NOT IN ( ''
							SET @Parentheses = 1
						END
					END
				END
				ELSE
				BEGIN	-- Cas : Le caractère lu dans la chaine n''est pas un séparateur
					IF @Mot_EnCours = 0
					BEGIN	-- DEBUT CONSTRUCTION NOUVEAU MOT
						IF @IsFirst IS NULL
							SET @IsFirst = 1
						ELSE
							SET @IsFirst = 0
						SET @Mot_EnCours = 1	-- Initialisation indicateur mot en cours
						SET @Mot = @Car		-- Début nouveau mot
						SET @First = @Index	-- Récuppération index dernier mot
					END
					ELSE	-- POURSUITE CONSTRUCTION MOT
						SET @Mot = @Mot + @Car
				END
			END	-- Fin du IF (@Car != '' '' OR @Mot_EnCOurs = 0)

			-- Passage au caractère suivant
			SET @Index = @Index +1
			IF @@ERROR != 0
				GOTO SORTIE_ERR
		END	-- Fin du WHILE

		/*===== Fin de requête =====*/
		-- Cas du flag C
		SET @Req1 = @Req1 + '') t, SPEPRESENTATIONHOP s, LIVRETHOP l ''
		SET @Req1 = @Req1 + ''WHERE REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
		SET @Req1 = @Req1 + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
		SET @Req1 = @Req1 + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
		SET @Req1 = @Req1 + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
		SET @Req1 = @Req1 + ''REPLACE(REPLACE(REPLACE(UPPER(s.nom),''
		SET @Req1 = @Req1 + ''"À","A"),"Á","A"),"Â","A"),"Ã","A"),"Ä","A"),"Å","A"),''
		SET @Req1 = @Req1 + ''"È","E"),"É","E"),"Ê","E"),"Ë","E"),''
		SET @Req1 = @Req1 + ''"Ì","I"),"Í","I"),"Î","I"),"Ï","I"),''
		SET @Req1 = @Req1 + ''"Ô","O"),"Ó","O"),"Õ","O"),"Ö","O"),''
		SET @Req1 = @Req1 + ''"Ù","U"),"Ú","U"),"Û","U"),"Ü","U"),''
		SET @Req1 = @Req1 + ''"?","Y"),"Ý","Y"),"Ÿ","Y"),''
		SET @Req1 = @Req1 + ''"Ç","C"),''
		SET @Req1 = @Req1 + ''"Ñ","N") LIKE "'' + @Mot + ''%" ''

		-- Cas du flag N
		SET @Req2 = @Req2 + '') t ''
		SET @Req2 = @Req2 + ''WHERE NOT EXISTS(SELECT NULL FROM LIVRETVIDAL l INNER JOIN SPEPRESENTATION s ''
		SET @Req2 = @Req2 + ''ON s.id_spepresentation = l.id_spepresentation ''
		SET @Req2 = @Req2 + ''WHERE l.idorganisme = '' + CONVERT(VARCHAR(10), @IDHop)
		SET @Req2 = @Req2 + '' AND s.id_specialite = t.id) ''

		-- Cas du flag A
		SET @Req3 = @Req3 + '') t, SPEPRESENTATION p INNER JOIN SPECIALITE s ON s.id_specialite = p.id_specialite ''
		SET @Req3 = @Req3 + ''INNER JOIN LIVRETVIDAL l ON l.id_spepresentation = p.id_spepresentation ''
		SET @Req3 = @Req3 + ''WHERE l.idorganisme = '' + CONVERT(VARCHAR(10), @IDHop)
		SET @Req3 = @Req3 + '' AND t.id = s.id_specialite ''

		IF @Recherche = ''O''
			SET @RequeteComplete = @Req1 + '' UNION ALL ('' + @Req2 + '' UNION '' + @Req3 + '') ORDER BY 4''
		ELSE
			SET @RequeteComplete = @Req1 + '' UNION ALL '' + @Req3 + '' ORDER BY 4''
	END	-- Fin Type_Ide = 2
	ELSE
	BEGIN
		/*===== Début de requête =====*/
		SET @RequeteComplete = ''SELECT DISTINCT t.the_Ide, t.type_ide, t.the_caf, t.the_laf, ''
		SET @RequeteComplete = @RequeteComplete + ''t.id, 0 AS "IDORGANISME", "" AS "FLAG" FROM (''

		/*===== Corps de requête =====*/
		SET @Index = 1	-- Initialisation
		WHILE @Index <= @Taille
		BEGIN
			-- Définition du caractère en cours
			SET @Car = SUBSTRING(@Chaine, @Index, 1)
			IF @@ERROR != 0
				GOTO SORTIE_ERR

			IF (@Car != '' '' OR @Mot_EnCours = 0)
			BEGIN
				IF @Car IN (''&'', ''|'', ''#'', ''('', '')'')
				BEGIN	-- CAS : Le caractère lu dans la chaine est un séparateur de mot
					IF @Mot_EnCours = 1	-- VALIDATION FIN DE MOT
					BEGIN
						SET @Last = @Index - 1	-- Récupération index fin de mot
						SET @Mot_EnCours = 0	-- Réinitialisation indicateur mot en cours
						-- Création de la sous-requête avec le mot en cours
						IF @IsPipe = 1
							EXEC @Erreur = p_Built_Sub_Req_KWordLivret 1, @Ori_Ide, @Type_Ide, @IDHop, @Mot, @SousRequete OUTPUT 
						ELSE
							EXEC @Erreur = p_Built_Sub_Req_KWordLivret @IsFirst, @Ori_Ide, @Type_Ide, @IDHop, @Mot, @SousRequete OUTPUT 
						IF @Erreur != 0
							GOTO SORTIE_ERR

						-- Insertion sous-requête
						SET @RequeteComplete = @RequeteComplete + '' '' + @SousRequete

						IF @Parentheses = 1
						BEGIN
							SET @RequeteComplete = @RequeteComplete + '' ) ''
							SET @Parentheses = 0
						END

						-- Traitement sur dernier mot
						IF @Index >= @Taille
						BEGIN
							IF @Last != LEN(@Chaine) 
								SET @RequeteComplete = @RequeteComplete + '' '' + SUBSTRING(@Chaine, @Last + 1, LEN(@Chaine) - @Last - 1)	
							IF @@ERROR != 0
								GOTO SORTIE_ERR
						END
					END
					ELSE
					BEGIN
						IF @Car = ''&''
						BEGIN	-- INTERSECTION (ET)
							SET @RequeteComplete = @RequeteComplete + '' AND a.the_ide IN ( ''
							SET @Parentheses = 1
						END
						ELSE IF @Car = ''|''
						BEGIN	-- UNION (OU non exclusif)
							SET @RequeteComplete = @RequeteComplete + '' UNION ''
							SET @Parentheses =0
							SET @IsPipe = 1
						END
						ELSE IF @Car = ''#''
						BEGIN	-- MINUS
							SET @RequeteComplete = @RequeteComplete + '' AND a.the_ide NOT IN ( ''
							SET @Parentheses = 1
						END
					END
				END
				ELSE
				BEGIN	-- Cas : Le caractère lu dans la chaine n''est pas un séparateur
					IF @Mot_EnCours = 0
					BEGIN	-- DEBUT CONSTRUCTION NOUVEAU MOT
						IF @IsFirst IS NULL
							SET @IsFirst = 1
						ELSE
							SET @IsFirst = 0
						SET @Mot_EnCours = 1	-- Initialisation indicateur mot en cours
						SET @Mot = @Car		-- Début nouveau mot
						SET @First = @Index	-- Récuppération index dernier mot
					END
					ELSE	-- POURSUITE CONSTRUCTION MOT
						SET @Mot = @Mot + @Car
				END
			END	-- Fin du IF (@Car != '' '' OR @Mot_EnCOurs = 0)

			-- Passage au caractère suivant
			SET @Index = @Index +1
			IF @@ERROR != 0
				GOTO SORTIE_ERR
		END	-- Fin du WHILE

		/*===== Fin de requête =====*/
		IF @Parentheses = 1
		BEGIN	
			SET @RequeteComplete = @RequeteComplete + '') ''
			SET @Parentheses = 0
		END

		SET @RequeteComplete = @RequeteComplete + '') t ''

		IF NOT(@Type_Ide IS NULL)
		BEGIN
			SET @RequeteComplete = @RequeteComplete + ''WHERE t.type_ide = '' + CONVERT(VARCHAR(10), @Type_Ide)

			IF @Type_Ide = 8
				SET @RequeteComplete = @RequeteComplete + '' ORDER BY 3''

			-- CAS PARTICULIER : Groupe d''indication
			IF @Type_Ide = 5
			BEGIN
				SET @Mot =	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
						REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
						REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
						REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(

						REPLACE(REPLACE(REPLACE(UPPER(@Mot),
						''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A''),
						''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E''),
						''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I''),
						''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O''),
						''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U''),
						''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y''),
						''Ç'',''C''),
						''Ñ'',''N'')

				SET @RequeteComplete = @RequeteComplete + '' UNION ''
				SET @RequeteComplete = @RequeteComplete + ''SELECT DISTINCT a.the_ide, a.type_ide, a.the_caf, ''
				SET @RequeteComplete = @RequeteComplete + ''a.the_laf, a.id, 0 AS "IDORGANISME", "" AS "FLAG" ''
				SET @RequeteComplete = @RequeteComplete + ''FROM RMC_THE_PRO b INNER JOIN RMC_THE a ON a.the_ide = b.the_ide ''
				SET @RequeteComplete = @RequeteComplete + ''INNER JOIN RMC_THE c ON c.the_ide = b.the_the_ide ''
				SET @RequeteComplete = @RequeteComplete + ''INNER JOIN RMC_THE_CLE d ON d.the_ide = b.the_the_ide, ''
				SET @RequeteComplete = @RequeteComplete + ''(SELECT cle_ide FROM RMC_CLE WHERE type_ide = 4 ''
				SET @RequeteComplete = @RequeteComplete + ''AND REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
				SET @RequeteComplete = @RequeteComplete + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
				SET @RequeteComplete = @RequeteComplete + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
				SET @RequeteComplete = @RequeteComplete + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
				SET @RequeteComplete = @RequeteComplete + ''REPLACE(REPLACE(REPLACE(UPPER(cle_lib),''
				SET @RequeteComplete = @RequeteComplete + ''"À","A"),"Á","A"),"Â","A"),"Ã","A"),"Ä","A"),"Å","A"),''
				SET @RequeteComplete = @RequeteComplete + ''"È","E"),"É","E"),"Ê","E"),"Ë","E"),''
				SET @RequeteComplete = @RequeteComplete + ''"Ì","I"),"Í","I"),"Î","I"),"Ï","I"),''
				SET @RequeteComplete = @RequeteComplete + ''"Ô","O"),"Ó","O"),"Õ","O"),"Ö","O"),''
				SET @RequeteComplete = @RequeteComplete + ''"Ù","U"),"Ú","U"),"Û","U"),"Ü","U"),''
				SET @RequeteComplete = @RequeteComplete + ''"?","Y"),"Ý","Y"),"Ÿ","Y"),''
				SET @RequeteComplete = @RequeteComplete + ''"Ç","C"),''
				SET @RequeteComplete = @RequeteComplete + ''"Ñ","N") LIKE "'' + @Mot + ''%" ) e INNER JOIN RMC_THE_CLE d2 ''
				SET @RequeteComplete = @RequeteComplete + ''ON d2.cle_ide = e.cle_ide ''
				SET @RequeteComplete = @RequeteComplete + ''WHERE d.cle_ide = d2.cle_ide ''
				SET @RequeteComplete = @RequeteComplete + ''AND a.type_ide = 5 ''
				SET @RequeteComplete = @RequeteComplete + ''AND c.type_ide = 4 ''
				SET @RequeteComplete = @RequeteComplete + ''ORDER BY 4''
			END
		END
	END

	-- Destruction d''une éventuelle version précédente de la table temporaire
	-- Effacement (si existent) des tables temporaires
	SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TKWORD+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TKWORD
		EXEC(@Req)
	--IF EXISTS(SELECT 1 FROM TempDb..SYSOBJECTS WHERE NAME = ''##TMP_GetKWordLivret''  AND TYPE = ''U'')
	--BEGIN
		--DROP TABLE ##TMP_GetKWordLivret
		IF @@ERROR != 0
			GOTO SORTIE_ERR				
	--END

	-- (Re)création de la table temporaire dans laquelle on va stocker les résultats de la requête définie ci-dessus
	SET @Req =  ''CREATE TABLE ##''+@TKWORD+''
	(
		THE_IDE		INTEGER, 
		TYPE_IDE	INTEGER, 
		THE_CAF 	VARCHAR(60), 
		THE_LAF 	VARCHAR(255), 
		ID 		INTEGER,
		IDORGANISME	INTEGER,
		FLAG		VARCHAR(1)
	)''
	EXEC(@Req)
	IF @@ERROR != 0
		GOTO SORTIE_ERR				

	EXEC (''INSERT INTO ##'' +@TKWORD+'' ''+  @RequeteComplete )

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	--SET @Curseur = CURSOR FOR
		--SELECT * FROM ##TMP_GetKWordLivret
	--FOR READ ONLY
	--IF @@ERROR != 0
	--	GOTO SORTIE_ERR

	--OPEN @Curseur
	--IF @@ERROR != 0
	--	GOTO SORTIE_ERR

	GOTO SORTIE
END
	
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

SORTIE:
	RETURN @Erreur












' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_getspeiam_cipalpha]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_getspeiam_cipalpha]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE procedure [dbo].[p_getspeiam_cipalpha]
(@id varchar(500),
 @id_bis varchar(500)output)
as
DECLARE @Erreur		INTEGER
declare @codeid	varchar(500)
declare @codeidbis varchar(500)
DECLARE @varRequete	VARCHAR(4000)
DECLARE @Time varchar(25)
DECLARE @TTEMPCIP varchar(25)
declare @req varchar(4000)
-- Body
begin
	-- Initialisation et optimisation
	
	SET @Erreur = 0
	SET  @Req = '' ''
	SET @Req = ''IF EXISTS( SELECT name FROM tempdb..sysobjects WHERE NAME = ''''##cip'''' AND TYPE = "U")
		DROP TABLE ##cip''
        EXEC(@Req)
begin
	set @codeid=@id
	---print @codeid
	select replace (@id,",","'',''") as Cip  INTO  ##cip
	----select CIp from ##CIP into @TTEMPCIP
	select @id_bis=  Cip from   ##cip
	---print @id_bis
end
end









' 
END
GO
/****** Objet :  StoredProcedure [dbo].[Decode_Domain]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Decode_Domain]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[Decode_Domain]( 
						@Domain INTEGER,
						@Result VARCHAR(50) OUTPUT
					) AS
DECLARE @i INTEGER
DECLARE @Dom INTEGER
DECLARE @j INTEGER
DECLARE @Erreur INTEGER

BEGIN

	SET NOCOUNT ON

	SET @Erreur = 0
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Result = ''''
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	IF @Domain <= 0
		GOTO SORTIE

	SET @Dom = @Domain
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @i = 6	-- Initialisation par défaut : max domaines = 6
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @j = POWER(2,@i)
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	WHILE @i>= 0
	BEGIN
 		IF @Dom >= @j
		BEGIN
			
			SET @Dom = @Dom - @j
			IF @@ERROR != 0
				GOTO SORTIE_ERR

			SET @Result =@Result +CAST(@i AS VARCHAR(50))  + '',''
			
			IF @@ERROR != 0
				GOTO SORTIE_ERR
		END 
		SET @i = @i-1
		IF @@ERROR != 0
			GOTO SORTIE_ERR
		SET @j = @j/2
		IF @@ERROR != 0
			GOTO SORTIE_ERR
	END
	IF @Result != ''''
		SET @Result = SUBSTRING(@Result, 1, LEN(@Result)-1)

	IF @@ERROR != 0
		GOTO SORTIE_ERR
END

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[ExpSpePresentationHop_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ExpSpePresentationHop_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[ExpSpePresentationHop_Txt]
(
	@Repertoire	VARCHAR(200),
	@Fichier	VARCHAR(55),
	@Ret		INTEGER OUTPUT
) AS
-- Déclarations locales
DECLARE @Erreur		INTEGER

DECLARE @FileOverwriten	INTEGER

DECLARE @Curs_Tmp	CURSOR

DECLARE @varID1		INTEGER
DECLARE @varID2		INTEGER
DECLARE @varID3		INTEGER
DECLARE @varPrix1	FLOAT
DECLARE @varPrix2	FLOAT
DECLARE @varLib1	VARCHAR(50)
DECLARE @varLib2	VARCHAR(50)
DECLARE @varLib3	VARCHAR(50)
DECLARE @varLib4	VARCHAR(50)
DECLARE @varLib5	VARCHAR(7)
DECLARE @varLib6	VARCHAR(7)
DECLARE @varLib7	VARCHAR(60)
DECLARE @varLib8	VARCHAR(255)
DECLARE @varLib9	VARCHAR(30)

DECLARE @AvidalObj	INTEGER
DECLARE @RetVal		INTEGER
DECLARE @varFicCible	VARCHAR(255)
DECLARE @varStr		VARCHAR(10)
DECLARE @SepTable	VARCHAR(255)

DECLARE @Compteur	INTEGER

-- Body
BEGIN

	-- Initialisation et optimisation
	SET @Erreur = 0
	SET @SepTable = ''EXP_NOUVELLE_TABLE''
	IF SUBSTRING(@Repertoire, LEN(@Repertoire), 1) != ''\''
		SET @varFicCible = @Repertoire + ''\'' + @Fichier
	ELSE
		SET @varFicCible = @Repertoire + @Fichier
	SET @FileOverwriten = 0	-- booléen pour savoir à chaque exportation de table
	SET NOCOUNT ON		-- s''il est nécessaire de recréer le fichier cible ou non

/*===============================================================================================
|				Export de la table SPEPRESENTATIONHOP				|
===============================================================================================*/
	-- Allocation du curseur temporaire qui servira...
	SET @Curs_Tmp = CURSOR FOR
		SELECT
			idorganisme, id_spepresentationhop, nom,
			ISNULL(presentation, '''') AS ''presentation'',
			ISNULL(forme, '''') AS ''forme'',
			ISNULL(dosage, '''') AS ''dosage'',
			ISNULL(cip, '''') AS ''cip'',
			ISNULL(ucd, '''') AS ''ucd'',
			ISNULL(labo, '''') AS ''labo''
		FROM SPEPRESENTATIONHOP
	FOR READ ONLY
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	OPEN @Curs_Tmp
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- ... à remplir le fichier texte
	FETCH @Curs_Tmp INTO
		@varID1, @varID2, @varLib1, @varLib2,
		@varLib3, @varLib4, @varLib5, @varLib6, @varLib7
	IF @@FETCH_STATUS = 0
	BEGIN
		-- Positionnement de la variable qui servira aux autres exportations de table
		SET @FileOverwriten = 1
		-- Création de l''objet ActiveX contenant la fonction qui sera utilisée
		EXEC @Erreur = sp_OACreate ''avidal_explivret.avidal_explivretobj'', @AvidalObj OUT
		IF @Erreur != 0
			GOTO SORTIE_ERR
		-- On écrit le 1er tuple trouvé dans le fichier
		SET @varStr = CONVERT(VARCHAR(10), @varID1)
		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 0	-- 0 = mode OverWrite
		IF @Erreur != 0
			GOTO SORTIE_ERR

		SET @varStr = CONVERT(VARCHAR(10), @varID2)
		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1	-- 1 = mode Append
		IF @Erreur != 0
			GOTO SORTIE_ERR

		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib1, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib2, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib3, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib4, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib5, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib6, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib7, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		-- Recherche du 2ème tuple...
		FETCH @Curs_Tmp INTO
			@varID1, @varID2, @varLib1, @varLib2, @varLib3, @varLib4,
			@varLib5, @varLib6, @varLib7
		WHILE @@FETCH_STATUS = 0
		BEGIN
			-- ... pour l''AJOUTER au fichier texte
			SET @varStr = CONVERT(VARCHAR(10), @varID1)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			SET @varStr = CONVERT(VARCHAR(10), @varID2)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib1, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib2, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib3, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib4, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib5, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib6, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib7, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			-- Recherche du tuple suivant
			FETCH @Curs_Tmp INTO
				@varID1, @varID2, @varLib1, @varLib2, @varLib3, @varLib4,
				@varLib5, @varLib6, @varLib7
		END
	END

	-- Fermeture et désallocation du curseur temporaire
	-- pour pouvoir le réutiliser pour l''export des tables suivantes
	CLOSE @Curs_Tmp
	DEALLOCATE @Curs_Tmp
	-- Fin export SPEPRESENTATIONHOP

/*===============================================================================================
|				Export de la table T_SUBHOP					|
===============================================================================================*/
	-- Réinitialisation des variables
	-- Allocation du curseur temporaire qui servira...
	SET @Curs_Tmp = CURSOR FOR
		SELECT
			idorganisme, id_t_subhop, ISNULL(libelle, '''') AS ''libelle''
		FROM T_SUBHOP
	FOR READ ONLY
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	OPEN @Curs_Tmp
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- ... à remplir le fichier texte
	FETCH @Curs_Tmp INTO
		@varID1, @varID2, @varLib1
	IF @@FETCH_STATUS = 0 AND (@varID2 > 0)
	BEGIN
		-- On écrit le 1er tuple trouvé dans le fichier
		SET @varStr = CONVERT(VARCHAR(10), @varID1)
		IF @FileOverwriten = 0	-- Le fichier texte n''a pas encore été recréé
		BEGIN
			-- Positionnement de la variable qui servira aux autres exportations de table
			SET @FileOverwriten = 1
			-- Création de l''objet ActiveX contenant la fonction qui sera utilisée
			EXEC @Erreur = sp_OACreate ''avidal_explivret.avidal_explivretobj'', @AvidalObj OUT
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 0
		END
		ELSE
		BEGIN
			-- Insertion d''un séparateur entre les datas écrites et celles qui vont suivre
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @SepTable, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
		END
		IF @Erreur != 0
			GOTO SORTIE_ERR

		SET @varStr = CONVERT(VARCHAR(10), @varID2)
		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib1, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		-- Recherche du 2ème tuple...
		FETCH @Curs_Tmp INTO
			@varID1, @varID2, @varLib1
		WHILE @@FETCH_STATUS = 0
		BEGIN
			-- ... pour l''AJOUTER au fichier texte
			SET @varStr = CONVERT(VARCHAR(10), @varID1)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			SET @varStr = CONVERT(VARCHAR(10), @varID2)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib1, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			-- Recherche du tuple suivant
			FETCH @Curs_Tmp INTO
				@varID1, @varID2, @varLib1, @varLib2, @varLib3, @varLib4,
				@varLib5, @varLib6, @varLib7
		END
	END

	-- Fermeture et désallocation du curseur temporaire
	-- pour pouvoir le réutiliser pour l''export des tables suivantes
	CLOSE @Curs_Tmp
	DEALLOCATE @Curs_Tmp
	-- Fin export T_SUBHOP

/*===============================================================================================
|				Export de la table LIVRETHOP					|
===============================================================================================*/
	-- Allocation du curseur temporaire qui servira...
	SET @Curs_Tmp = CURSOR FOR
		SELECT
			idorganisme, id_spepresentationhop, ISNULL(prix_ttc_f, 0) AS ''prix_ttc_f'',
			ISNULL(prix_ttc_e, 0) AS ''prix_ttc_e'',
			ISNULL(dispo, '''') AS ''dispo'', ISNULL(commentaire, '''') AS ''commentaire'',
			ISNULL(codhopital, '''') AS ''codhopital''
		FROM LIVRETHOP
	FOR READ ONLY
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	OPEN @Curs_Tmp
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- ... à remplir le fichier texte
	FETCH @Curs_Tmp INTO
		@varID1, @varID2, @varPrix1, @varPrix2, @varLib7, @varLib8, @varLib9
	IF @@FETCH_STATUS = 0 AND (@varID1 > 0)
	BEGIN
		-- On écrit le 1er tuple trouvé dans le fichier
		SET @varStr = CONVERT(VARCHAR(10), @varID1)
		IF @FileOverwriten = 0	-- Le fichier texte n''a pas encore été recréé
		BEGIN
			-- Positionnement de la variable qui servira aux autres exportations de table
			SET @FileOverwriten = 1

			-- Création de l''objet ActiveX contenant la fonction qui sera utilisée
			EXEC @Erreur = sp_OACreate ''avidal_explivret.avidal_explivretobj'', @AvidalObj OUT
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 0
		END
		ELSE
		BEGIN
			-- Insertion d''un séparateur entre les datas écrites et celles qui vont suivre
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @SepTable, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
		END
		IF @Erreur != 0
			GOTO SORTIE_ERR

		SET @varStr = CONVERT(VARCHAR(10), @varID2)
		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		SET @varStr = CONVERT(VARCHAR(10), @varPrix1)
		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		SET @varStr = CONVERT(VARCHAR(10), @varPrix2)
		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib7, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib8, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib9, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		-- Recherche du 2ème tuple...
		FETCH @Curs_Tmp INTO
			@varID1, @varID2, @varPrix1, @varPrix2, @varLib7, @varLib8, @varLib9
		WHILE @@FETCH_STATUS = 0
		BEGIN
			-- ... pour l''AJOUTER au fichier texte
			SET @varStr = CONVERT(VARCHAR(10), @varID1)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			SET @varStr = CONVERT(VARCHAR(10), @varID2)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			SET @varStr = CONVERT(VARCHAR(10), @varPrix1)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			SET @varStr = CONVERT(VARCHAR(10), @varPrix2)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib7, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib8, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib9, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			-- Recherche du tuple suivant
			FETCH @Curs_Tmp INTO
				@varID1, @varID2, @varPrix1, @varPrix2, @varLib7, @varLib8, @varLib9
		END
	END

	-- Fermeture et désallocation du curseur temporaire
	-- pour pouvoir le réutiliser pour l''export des tables suivantes
	CLOSE @Curs_Tmp
	DEALLOCATE @Curs_Tmp
	-- Fin export LIVRETHOP

/*===============================================================================================
|				Export de la table LIVRETVIDAL					|
===============================================================================================*/
	-- Allocation du curseur temporaire qui servira...
	SET @Curs_Tmp = CURSOR FOR
		SELECT
			idorganisme, id_spepresentation,
			ISNULL(prix_ttc_f, 0) AS ''prix_ttc_f'', ISNULL(prix_ttc_e, 0) AS ''prix_ttc_e'',
			ISNULL(dispo, '''') AS ''dispo'', ISNULL(commentaire, '''') AS ''commentaire'',
			ISNULL(codhopital, '''') AS ''codhopital''
		FROM LIVRETVIDAL
	FOR READ ONLY
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	OPEN @Curs_Tmp
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- ... à remplir le fichier texte
	FETCH @Curs_Tmp INTO
		@varID1, @varID2, @varPrix1, @varPrix2, @varLib7, @varLib8, @varLib9
	IF @@FETCH_STATUS = 0 AND (@varID1 > 0)
	BEGIN
		-- On écrit le 1er tuple trouvé dans le fichier
		SET @varStr = CONVERT(VARCHAR(10), @varID1)
		IF @FileOverwriten = 0	-- Le fichier texte n''a pas encore été recréé
		BEGIN
			-- Positionnement de la variable qui servira aux autres exportations de table
			SET @FileOverwriten = 1

			-- Création de l''objet ActiveX contenant la fonction qui sera utilisée
			EXEC @Erreur = sp_OACreate ''avidal_explivret.avidal_explivretobj'', @AvidalObj OUT
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 0
		END
		ELSE
		BEGIN
			-- Insertion d''un séparateur entre les datas écrites et celles qui vont suivre
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @SepTable, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
		END
		IF @Erreur != 0
			GOTO SORTIE_ERR

		SET @varStr = CONVERT(VARCHAR(10), @varID2)
		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		SET @varStr = CONVERT(VARCHAR(10), @varPrix1)
		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		SET @varStr = CONVERT(VARCHAR(10), @varPrix2)
		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib7, 1

		IF @Erreur != 0
			GOTO SORTIE_ERR

		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib8, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib9, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		-- Recherche du 2ème tuple...
		FETCH @Curs_Tmp INTO
			@varID1, @varID2, @varPrix1, @varPrix2, @varLib7, @varLib8, @varLib9
		WHILE @@FETCH_STATUS = 0
		BEGIN
			-- ... pour l''AJOUTER au fichier texte
			SET @varStr = CONVERT(VARCHAR(10), @varID1)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			SET @varStr = CONVERT(VARCHAR(10), @varID2)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			SET @varStr = CONVERT(VARCHAR(10), @varPrix1)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			SET @varStr = CONVERT(VARCHAR(10), @varPrix2)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib7, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib8, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varLib9, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			-- Recherche du tuple suivant
			FETCH @Curs_Tmp INTO
				@varID1, @varID2, @varPrix1, @varPrix2, @varLib7, @varLib8, @varLib9
		END
	END

	-- Fermeture et désallocation du curseur temporaire
	-- pour pouvoir le réutiliser pour l''export des tables suivantes
	CLOSE @Curs_Tmp
	DEALLOCATE @Curs_Tmp
	-- Fin export LIVRETVIDAL

/*===============================================================================================
|				Export de la table COMPOHOP					|
===============================================================================================*/
	-- Allocation du curseur temporaire qui servira...
	SET @Curs_Tmp = CURSOR FOR
		SELECT
			idorganisme, id_spepresentationhop ,id_t_subhop
		FROM COMPOHOP
	FOR READ ONLY
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	OPEN @Curs_Tmp
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- ... à remplir le fichier texte
	FETCH @Curs_Tmp INTO
		@varID1, @varID2, @varID3
	IF @@FETCH_STATUS = 0
	BEGIN
		-- On écrit le 1er tuple trouvé dans le fichier
		SET @varStr = CONVERT(VARCHAR(10), @varID1)
		IF @FileOverwriten = 0	-- Le fichier texte n''a pas encore été recréé
		BEGIN
			-- Positionnement de la variable qui servira aux autres exportations de table
			SET @FileOverwriten = 1

			-- Création de l''objet ActiveX contenant la fonction qui sera utilisée
			EXEC @Erreur = sp_OACreate ''avidal_explivret.avidal_explivretobj'', @AvidalObj OUT
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 0
		END
		ELSE
		BEGIN
			-- Insertion d''un séparateur entre les datas écrites et celles qui vont suivre
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @SepTable, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
		END
		IF @Erreur != 0
			GOTO SORTIE_ERR

		SET @varStr = CONVERT(VARCHAR(10), @varID2)
		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		SET @varStr = CONVERT(VARCHAR(10), @varID3)
		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		-- Recherche du 2ème tuple...
		FETCH @Curs_Tmp INTO
			@varID1, @varID2, @varID3
		WHILE @@FETCH_STATUS = 0
		BEGIN
			-- ... pour l''AJOUTER au fichier texte
			SET @varStr = CONVERT(VARCHAR(10), @varID1)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			SET @varStr = CONVERT(VARCHAR(10), @varID2)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			SET @varStr = CONVERT(VARCHAR(10), @varID3)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			-- Recherche du tuple suivant
			FETCH @Curs_Tmp INTO
				@varID1, @varID2, @varID3
		END
	END

	-- Fermeture et désallocation du curseur temporaire
	-- pour pouvoir le réutiliser pour l''export des tables suivantes
	CLOSE @Curs_Tmp
	DEALLOCATE @Curs_Tmp
	-- Fin export COMPOHOP

/*===============================================================================================
|				Export de la table COMPOVIDAL					|
===============================================================================================*/
	-- Allocation du curseur temporaire qui servira...
	SET @Curs_Tmp = CURSOR FOR
		SELECT
			idorganisme, id_spepresentationhop ,id_t_sub
		FROM COMPOVIDAL
	FOR READ ONLY
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	OPEN @Curs_Tmp
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- ... à remplir le fichier texte
	FETCH @Curs_Tmp INTO
		@varID1, @varID2, @varID3
	IF @@FETCH_STATUS = 0
	BEGIN
		-- On écrit le 1er tuple trouvé dans le fichier
		SET @varStr = CONVERT(VARCHAR(10), @varID1)
		IF @FileOverwriten = 0	-- Le fichier texte n''a pas encore été recréé
		BEGIN
			-- Positionnement de la variable qui servira aux autres exportations de table
			SET @FileOverwriten = 1

			-- Création de l''objet ActiveX contenant la fonction qui sera utilisée
			EXEC @Erreur = sp_OACreate ''avidal_explivret.avidal_explivretobj'', @AvidalObj OUT
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 0
		END
		ELSE
		BEGIN
			-- Insertion d''un séparateur entre les datas écrites et celles qui vont suivre
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @SepTable, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
		END
		IF @Erreur != 0
			GOTO SORTIE_ERR

		SET @varStr = CONVERT(VARCHAR(10), @varID2)
		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		SET @varStr = CONVERT(VARCHAR(10), @varID3)
		EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
		IF @Erreur != 0
			GOTO SORTIE_ERR

		-- Recherche du 2ème tuple...
		FETCH @Curs_Tmp INTO
			@varID1, @varID2, @varID3
		WHILE @@FETCH_STATUS = 0
		BEGIN
			-- ... pour l''AJOUTER au fichier texte
			SET @varStr = CONVERT(VARCHAR(10), @varID1)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			SET @varStr = CONVERT(VARCHAR(10), @varID2)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			SET @varStr = CONVERT(VARCHAR(10), @varID3)
			EXEC @Erreur = sp_OAGetProperty @AvidalObj, ''WriteLn'', @RetVal OUT, @varFicCible, @varStr, 1
			IF @Erreur != 0
				GOTO SORTIE_ERR

			-- Recherche du tuple suivant
			FETCH @Curs_Tmp INTO
				@varID1, @varID2, @varID3
		END
	END

	-- Fermeture et désallocation du curseur temporaire
	-- pour pouvoir le réutiliser pour l''export des tables suivantes
	CLOSE @Curs_Tmp
	DEALLOCATE @Curs_Tmp
	-- Fin export COMPOVIDAL

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	-- Suppression éventuelle de la table temporaire
	IF EXISTS(SELECT 1 FROM tempdb..sysobjects WHERE name = ''##ExpSpePresentationHop_TxtTMP'' AND type = ''U'')
		DROP TABLE ##ExpSpePresentationHop_TxtTMP

	SET @Ret = @Erreur

SORTIE:
	-- Libération de la mémoire du curseur temporaire
	IF CURSOR_STATUS(''variable'', ''@Curs_Tmp'') >= 0	-- une valeur positive ou nulle indique un curseur ouvert
	BEGIN
		CLOSE @Curs_Tmp
		DEALLOCATE @Curs_Tmp
	END

	-- Libération de la mémoire de l''objet ActiveX
	IF @AvidalObj != NULL
		EXEC sp_OADestroy @AvidalObj

	RETURN @Ret










' 
END
GO
/****** Objet :  StoredProcedure [dbo].[CalculNiveauDicoComClasseIris]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CalculNiveauDicoComClasseIris]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[CalculNiveauDicoComClasseIris] (@id_code_gene as integer,@TTCIPSPE VARCHAR(30) output )
AS

-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Time varchar(25)
--DECLARE @TTCIPSPE	VARCHAR(30)
declare @varrequete varchar(4000)
declare @toto varchar(4000)
declare @req varchar(4000)
declare @req2 varchar(4000)
--BODY
	SET @Time = replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET @TTCIPSPE = ''##Tmp_DiClassIris'' +@Time
        --     print @TTCIPSPE

 set   @Req = ''''
SET @Req = ''IF EXISTS( SELECT 1 FROM TempDb..SYSOBJECTS WHERE NAME = '''''' +@TTCIPSPE+ '''''' AND TYPE = ''''U'''')
		DROP TABLE ''+ @TTCIPSPE
                           EXEC(@Req)


 EXEC(@Req)


--creation de la table temporarie
--set @req2=''''
--set @req2 = ''create table  ''+ @TTCIPSPE +'' (id_dicocomclassiris integer, dic_id_dicocomclassiris integer)''
--print @req2
--exec (@req2)


set @varrequete = ''select distinct dicocomclassiris.id_dicocomclassiris,dicocomclassiris.dic_id_dicocomclassiris INTO ''+  @TTCIPSPE +''
from dicocomclassiris,speclassiris,specialite, spepresentation
where specialite.id_specialite = spepresentation.id_specialite
and spepresentation.id_dicocodegene =  ''+ CONVERT(CHAR(4),  @id_code_gene)+ ''
 and specialite.id_specialite = speclassiris.id_specialite
and speclassiris.id_dicocomclassiris = dicocomclassiris.id_dicocomclassiris ''
EXEC(@varrequete)
-- on boucle jusqu''à ce qu''il n''y ai plus de ligne ajouté  

WHILE  @@ROWCOUNT > 0
BEGIN
set @toto = ''update '' +@TTCIPSPE +'' set '' +@TTCIPSPE +''.id_dicocomclassiris=dicocomclassiris.id_dicocomclassiris,''
+@TTCIPSPE +'' .dic_id_dicocomclassiris=dicocomclassiris.dic_id_dicocomclassiris
from ''+@TTCIPSPE +'' ,dicocomclassiris
where ''+@TTCIPSPE +''.dic_id_dicocomclassiris=dicocomclassiris.id_dicocomclassiris
and dicocomclassiris.dic_id_dicocomclassiris is not  null''
exec (@toto)
end
--set @req = ''select * from '' + @TTCIPSPE 
--exec (@req)
--end




















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_GetSubstsPere]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetSubstsPere]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_GetSubstsPere]
(
	@ListeIdSubst	VARCHAR(1000),
             @TableTP  varchar(25)  OUTPUT,
            @TableTF  varchar(25)  OUTPUT

) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER
DECLARE @time        varchar(20)
DECLARE @TableT   varchar(25)
DECLARE @Req        varchar(4000)
DECLARE @Req1        varchar(4000)
DECLARE @Req2        varchar(4000)


-- BODY PROC
BEGIN
	SET NOCOUNT  ON
	SET @Erreur = 0

	SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET  @TableT = ''TMP_CONNECTBY'' +@time
             SET  @TableTF = ''p_GetSubstsPereF'' +@time
             SET  @TableTP = ''p_GetSubstsPereP'' +@time

	-- Effacement (si existent) des tables temporaires
	SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TableT+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TableT
		EXEC(@Req)

	SET @Req = ''CREATE TABLE ##''+@TableT+ ''( ID_COL INTEGER )''
	EXEC(@Req) 

	IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''##'' + @TableTF   AND TYPE = ''U'')
		SET @Req1 = ''DROP TABLE ##''+@TableTF
		EXEC(@Req1)
	
	IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''##'' + @TableTP   AND TYPE = ''U'')
		SET @Req2 = ''DROP TABLE ##''+ @TableTP
		EXEC(@Req2)
	


	-- récupération hiérachie
	EXEC @Erreur = p_Connect_By ''COUPLETERMETERME'', ''id_t_sub_p'', ''id_t_sub_f'', ''F'',  0, @ListeIdSubst, NULL, @TableT
	IF @Erreur != 0
	BEGIN
		GOTO SORTIE_ERR
	END

	-- définition de la table destinée au curseur père
	SET @Req = ''SELECT DISTINCT
	a.ID_T_SUB_P	
             INTO ##''+@TableTP+''
	FROM COUPLETERMETERME a
	WHERE a.ID_T_SUB_F IN (	SELECT DISTINCT  b.ID_T_SYNONYSUB
				FROM COUPLETERMESYNONYME b
				WHERE ID_T_SUB IN (''+@ListeIdSubst+''))
	UNION
	SELECT DISTINCT * FROM ##''+@TableT

	EXEC(@Req)
	IF @@ERROR != 0
		GOTO SORTIE_ERR



	-- définition de la table destinée au curseur fils
	SET @Req = ''SELECT DISTINCT
		a.ID_T_SUB,
		CASE a.HOMEOPATHIE
			WHEN ''''F'''' THEN a.LIBELLE
			ELSE a.LIBELLE + ''''[Homéo]''''
		END LIBELLE,
		a.HOMEOPATHIE,
		CAST(a.TEXTE AS VARCHAR(4000)) AS ''''TEXTE'''',
		a.DC,
		a.COMPLEMENTINDEXSUB,
		1 AS ''''HasChild''''
	INTO ##''+@TableTF+''
	FROM T_SUB a	INNER JOIN IndexSub_Rel c ON a.id_T_Sub = c.id_T_Sub 
			INNER JOIN CoupleTermeTerme b ON  a.id_T_Sub = b.id_T_Sub_P
	WHERE c.ID_TYPEINDEX = 1
	AND b.ID_T_SUB_F IN (''+@ListeIdSubst+'')
	UNION
	SELECT DISTINCT
		a.ID_T_SUB,
		CASE a.HOMEOPATHIE
			WHEN ''''F'''' THEN a.LIBELLE
			ELSE a.LIBELLE + ''''[Homéo]''''
		END LIBELLE,
		a.HOMEOPATHIE,
		CAST(a.TEXTE AS VARCHAR(4000)) AS ''''TEXTE'''',
		a.DC,
		a.COMPLEMENTINDEXSUB,
		1 AS ''''HasChild''''
	FROM T_Sub a	INNER JOIN CoupleTermeTerme b ON a.id_T_Sub = b.id_T_Sub_P 
			INNER JOIN IndexSub_Rel d ON a.id_T_Sub = d.id_T_Sub 
			INNER JOIN CoupleTermeSynonyme c ON b.id_T_Sub_F = c.id_T_SynonySub
	WHERE d.ID_TYPEINDEX = 1
	AND c.ID_T_SUB IN (''+@ListeIdSubst+'')''

	EXEC(@Req)
	IF @@ERROR != 0
		GOTO SORTIE_ERR



END

-- RETOUR NORMAL PROCEDURE
SORTIE:

	SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableT+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TableT                         EXEC(@Req)

	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:

	SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableT+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TableT                         EXEC(@Req)
	IF @Erreur = 0
		SET @Erreur = @@ERROR


	RETURN @Erreur















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[Get_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Get_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[Get_Id]
(
	@ID	INTEGER,
	@Typ	INTEGER,
	@Ret	INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''Get_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	IF @Typ = 2
	BEGIN
		-- CAS DES SUBSTANCES
		SELECT
			t.id_t_sub, t.libelle, t.homeopathie,
			CAST(t.texte AS VARCHAR(4000)) AS ''TEXTE'',
			t.dc, t.complementindexsub
		FROM T_SUB t
		WHERE t.id_t_sub = @ID
		ORDER BY t.id_t_sub
	END
	ELSE IF @Typ = 3
	BEGIN
		-- CAS DES CLASSES THERAPEUTIQUES
		SELECT
			t1.id_dicocomclassiris,
			t1.dic_id_dicocomclassiris,
			LTRIM(
				CASE SUBSTRING(UPPER(t1.libelle), 1, 3)
					WHEN ''ZZ_'' THEN	CASE PATINDEX(''%\%'', SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255))
									WHEN 0 THEN SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255)
									ELSE SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, PATINDEX(''%\%'', SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255)) - PATINDEX(''%\%'', t1.libelle) - 2)
								END
					ELSE t1.libelle
				END) AS ''LIBELLE'',
			t1.ordre,
			CASE t2.id_dicocomclassiris
				WHEN NULL THEN 0
				ELSE 1
			END AS ''ID_DICOCOMCLASSIRIS''
		FROM DICOCOMCLASSIRIS t1
			LEFT OUTER JOIN DICOCOMCLASSIRIS t2
			ON t1.id_dicocomclassiris = t2.dic_id_dicocomclassiris
		WHERE t1.id_dicocomclassiris = @ID
		GROUP BY
			t1.id_dicocomclassiris,
			t1.dic_id_dicocomclassiris,
			t1.libelle,
			t1.ordre,
			CASE t2.id_dicocomclassiris
				WHEN NULL THEN 0
				ELSE 1
			END
	END
	ELSE IF @Typ = 4
	BEGIN
		-- CAS DES LABORATOIRES
		SELECT
			id_laboratoire, lab_id_laboratoire, laboratoire,
			adr1, adr2, adr3, cp, ville, cedex, pays,
			telephone, telecopie, email, internet,
			commentaire, mort,
			CONVERT(CHAR(10),dcreat,103) AS ''DCREAT'',
			CONVERT(CHAR(10),dmodif,103) AS ''DMODIF'',
			CONVERT(CHAR(10),drevis,103) AS ''DREVIS''
		FROM LABORATOIRE 
		WHERE id_laboratoire = @ID
	END
	ELSE IF @Typ IN (6,18)
	BEGIN
		-- CAS DES CIP (type 6) ET DES DUREES DE PRESCRIPTION (type 18)
		SELECT
			id_spepresentation, id_specialite, cip, ucd, ammeurope,
		              lieudispo, conddispo, liste, dureeprescription,
			prescriptioninitiale, prescriptionreservee, renouvelreserve,
			medpartic,
			CAST(naturesurveillance AS VARCHAR(4000)) AS ''NATURESURVEILLANCE'',
			codereferantgenerique, remplace, sourceremplace,
			CONVERT(CHAR(10),datesourceremplace,103) AS ''DATESOURCEREMPLACE'',
			remplacepar, sourceremplacepar,
			CONVERT(CHAR(10),datesourceremplacepar,103) AS ''DATESOURCEREMPLACEPAR'',
			prixprodhtf, prixpublicttcf, prixprodhte, prixpublicttce, tva,
			CONVERT(CHAR(10),dcreat,103) AS ''DCREAT'',
			CONVERT(CHAR(10),dmodif,103) AS ''DMODIF'',
			CONVERT(CHAR(10),drevis,103) AS ''DREVIS'',
			cipreferant
		FROM SPEPRESENTATION
		WHERE id_spepresentation = @ID
	END
	ELSE IF @Typ = 8
	BEGIN
		-- CAS DES CONTRE-INDICATIONS
		SELECT
			id_t_ci, libelle,
			CAST(texte AS VARCHAR(4000)) AS ''TEXTE'',
			CONVERT(CHAR(10),creation,103) AS ''CREATION'', validation,
			CAST(remarques AS VARCHAR(4000)) AS ''REMARQUES'', 1 AS ''1''
		FROM T_CI
		WHERE id_t_ci = @ID
	END
	ELSE IF @Typ = 11
	BEGIN
		-- CAS DES RMO
		SELECT
			id_rmoclass, id_themecommun, referenceiris,
			CAST(textermo AS VARCHAR(4000)) AS ''TEXTERMO'', codejo,
			remarque, breminterne,
			CONVERT(CHAR(10),dcreat,103) AS ''DCREAT'',
			CONVERT(CHAR(10),dmodif,103) AS ''DMODIF'',
			CONVERT(CHAR(10),drevis,103) AS ''DREVIS''
		FROM RMOCLASS
		WHERE id_rmoclass = @ID
	END
	ELSE IF @Typ = 13
	BEGIN
		-- CAS DES VOIES D''ADMINISTRATION
		SELECT
			id_specialite, voie, ordre
		FROM SPEVOIE
		WHERE id_specialite = @ID

	END
	ELSE IF @Typ = 23
	BEGIN
		-- CAS DES COMPOSITIONS
		SELECT
			id_specialite, id_specompo, forme, numeroforme, nbconstituantsactifs,
			CONVERT(CHAR(10),dcreat,103) AS ''DCREAT'',
			CONVERT(CHAR(10),dmodif,103) AS ''DMODIF'',
			CONVERT(CHAR(10),drevis,103) AS ''DREVIS''
		FROM SPECOMPO
		WHERE id_specompo = @ID
	END

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[Get_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Get_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[Get_Txt]
(
	@Terme	VARCHAR(100),
	@Typ	INTEGER,
	@Ret	INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''Get_Txt'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	IF @Typ = 2
	BEGIN
		-- CAS DES SUBSTANCES
		SELECT
			t.id_t_sub, t.libelle, t.homeopathie,
			CAST(t.texte AS VARCHAR(4000)) AS ''TEXTE'',
			t.dc, t.complementindexsub
		FROM T_SUB t
		WHERE UPPER(t.libelle) LIKE UPPER(@Terme)
		ORDER BY t.id_t_sub
	END
	ELSE IF @Typ = 3
	BEGIN
		-- CAS DES CLASSES THERAPEUTIQUES
		SELECT
			t1.id_dicocomclassiris,
			t1.dic_id_dicocomclassiris,
			LTRIM(
				CASE SUBSTRING(UPPER(t1.libelle), 1, 3)
					WHEN ''ZZ_'' THEN	CASE PATINDEX(''\'', SUBSTRING(t1.libelle, PATINDEX(''\'', t1.libelle) + 1, 255))
									WHEN 0 THEN SUBSTRING(t1.libelle, PATINDEX(''\'', t1.libelle) + 1, 255)
									ELSE SUBSTRING(t1.libelle, PATINDEX(''\'', t1.libelle) + 1, PATINDEX(''\'', SUBSTRING(t1.libelle, PATINDEX(''\'', t1.libelle) + 1, 255)) - PATINDEX(''\'', t1.libelle) - 2)
								END
					ELSE t1.libelle
				END) AS ''LIBELLE'',
			t1.ordre,
			CASE t2.id_dicocomclassiris
				WHEN NULL THEN 0
				ELSE 1
			END AS ''ID_DICOCOMCLASSIRIS''
		FROM DICOCOMCLASSIRIS t1
			LEFT OUTER JOIN DICOCOMCLASSIRIS t2
			ON t1.id_dicocomclassiris = t2.dic_id_dicocomclassiris
		WHERE 	LTRIM(
				CASE SUBSTRING(UPPER(t1.libelle), 1, 3)
					WHEN ''ZZ_'' THEN	CASE PATINDEX(''\'', SUBSTRING(t1.libelle, PATINDEX(''\'', t1.libelle) + 1, 255))
									WHEN 0 THEN SUBSTRING(t1.libelle, PATINDEX(''\'', t1.libelle) + 1, 255)
									ELSE SUBSTRING(t1.libelle, PATINDEX(''\'', t1.libelle) + 1, PATINDEX(''\'', SUBSTRING(t1.libelle, PATINDEX(''\'', t1.libelle) + 1, 255)) - PATINDEX(''\'', t1.libelle) - 2)
								END
					ELSE t1.libelle
				END) LIKE  UPPER(@Terme)
		GROUP BY
			t1.id_dicocomclassiris,
			t1.dic_id_dicocomclassiris,
			t1.libelle,
			t1.ordre,
			CASE t2.id_dicocomclassiris
				WHEN NULL THEN 0
				ELSE 1
			END
	END
	ELSE IF @Typ = 4
	BEGIN
		-- CAS DES LABORATOIRES
		SELECT
			id_laboratoire, lab_id_laboratoire, laboratoire,
			adr1, adr2, adr3, cp, ville, cedex, pays,
			telephone, telecopie, email, internet,
			commentaire, mort,
			CONVERT(CHAR(10),dcreat,103) AS ''DCREAT'',
			CONVERT(CHAR(10),dmodif,103) AS ''DMODIF'',
			CONVERT(CHAR(10),drevis,103) AS ''DREVIS''
		FROM LABORATOIRE 
		WHERE UPPER(laboratoire) LIKE UPPER(@Terme)
	END
	ELSE IF @Typ = 6
	BEGIN
		-- CAS DES CIP
		SELECT
			id_spepresentation, id_specialite, cip, ucd, ammeurope,
			lieudispo, conddispo, liste, dureeprescription,
			prescriptioninitiale, prescriptionreservee, renouvelreserve,
			medpartic,
			CAST(naturesurveillance AS VARCHAR(4000)) AS ''NATURESURVEILLANCE'',
			codereferantgenerique, remplace, sourceremplace,
			CONVERT(CHAR(10),datesourceremplace,103) AS ''DATESOURCEREMPLACE'',
			remplacepar, sourceremplacepar,
			CONVERT(CHAR(10),datesourceremplacepar,103) AS ''DATESOURCEREMPLACEPAR'',
			prixprodhtf, prixpublicttcf, prixprodhte, prixpublicttce, tva,
			CONVERT(CHAR(10),dcreat,103) AS ''DCREAT'',
			CONVERT(CHAR(10),dmodif,103) AS ''DMODIF'',
			CONVERT(CHAR(10),drevis,103) AS ''DREVIS'',
			cipreferant
		FROM SPEPRESENTATION
		WHERE Cip = @Terme
	END
	ELSE IF @Typ = 8
	BEGIN
		-- CAS DES CONTRE-INDICATIONS
		SELECT
			id_t_ci, libelle,
			CAST(texte AS VARCHAR(4000)) AS ''TEXTE'',
			CONVERT(CHAR(10),creation,103) AS ''CREATION'',
			validation, CAST(remarques AS VARCHAR(4000)) AS ''REMARQUES'', 1 AS ''1''
		FROM T_CI
		WHERE UPPER(libelle) LIKE UPPER(@Terme)
	END
	/*ELSE IF @Type = 11
	BEGIN
		-- CAS DES RMO
		SELECT
			id_rmoclass, id_themecommun, referenceiris,
			CAST(textermo AS VARCHAR(4000)) AS ''TEXTERMO'', codejo,
			remarque, breminterne,
			CONVERT(CHAR(10),dcreat,103) AS ''DCREAT'',
			CONVERT(CHAR(10),dmodif,103) AS ''DMODIF'',
			CONVERT(CHAR(10),drevis,103) AS ''DREVIS''
		FROM RMOCLASS
		WHERE id_rmoclass = @Terme
	END
	ELSE IF @Type = 13
	BEGIN
		-- CAS DES VOIES D''ADMINISTRATION
		SELECT
			id_specialite, voie, ordre

		FROM SPEVOIE
		WHERE id_specialite = @Terme

	END
	ELSE IF @Type = 23
	BEGIN
		-- CAS DES COMPOSITIONS
		SELECT
			id_specialite, id_specompo, forme, numeroforme, nbconstituantsactifs,
			CONVERT(CHAR(10),dcreat,103) AS ''DCREAT'',
			CONVERT(CHAR(10),dmodif,103) AS ''DMODIF'',
			CONVERT(CHAR(10),drevis,103) AS ''DREVIS''
		FROM SPECOMPO
		WHERE id_specompo = @Terme
	END*/
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret









' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetATC_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATC_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetATC_Id]
(
	@ID_DICOT_ATC_IRIS		INTEGER=NULL,
	@Ret				INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetATC_Id'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

/* NOTE :
On a été obligé, par rapport à la version Oracle de la requête, de spécifier le cas où le caractère ''/'' n''est pas présent
dans le libellé car il existe, dans la base, 1 cas où la valeur du champ ''LIBELLE'' est égal à ''NON RENSEIGNE'' (cf. id_dicot_atc_iris = 2298).
Du coup, seuls les 2200 premiers tuples sont visibles  au lieu de 5000 et quelques, jusqu''à ce que la requête plante pour cause de longueur
négative dans les paramètres de la fonction SUBSTRING.
*/
	SELECT 
		t1.id_dicot_atc_iris AS ''ID_DICOT_ATC_IRIS'',
		CASE PATINDEX(''%/%'', t1.libelle)
			WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
			ELSE SUBSTRING(t1.libelle, 1, PATINDEX(''%/%'', t1.libelle) - 2)	-- -2 car il y a un espace
		END AS ''Code'',								-- entre le / et le dernier
											-- caractère du code
		CASE PATINDEX(''%/%'', t1.libelle)
			WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
			ELSE SUBSTRING(t1.libelle, PATINDEX(''%/%'', t1.libelle) + 2, 255)	-- +2 car il y a un espace
		END AS ''LIBELLE'',	
											-- entre le / et le premier
											-- caractère du libellé
		CASE
			WHEN t2.id_dicot_atc_iris IS NULL THEN  0
	             		ELSE 1
			END AS ''HasChild''

	FROM DICOT_ATC_IRIS t1
		LEFT OUTER JOIN DICOT_ATC_IRIS t2
		ON t1.id_dicot_atc_iris = t2.dic_id_dicot_atc_iris
	WHERE t1.id_dicot_atc_iris = @ID_DICOT_ATC_IRIS
	GROUP BY
		t1.id_dicot_atc_iris,
		t1.libelle,
		CASE
		WHEN t2.id_dicot_atc_iris IS NULL THEN  0
	             ELSE 1
		END
	
	-- TEST ERREUR
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret














' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetATC_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATC_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetATC_Txt]
(
	@ID_DICOT_ATC_IRIS	VARCHAR(255)=NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetATC_Txt'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

/* NOTE :
On a été obligé, par rapport à la version Oracle de la requête, de spécifier le cas où le caractère ''/'' n''est pas présent
dans le libellé car il existe, dans la base, 1 cas où la valeur du champ ''LIBELLE'' est égal à ''NON RENSEIGNE'' (cf. id_dicot_atc_iris = 2298).
Du coup, seuls les 2200 premiers tuples sont visibles  au lieu de 5000 et quelques, jusqu''à ce que la requête plante pour cause de longueur
négative dans les paramètres de la fonction SUBSTRING.
*/

	SELECT 
		t1.id_dicot_atc_iris AS ''ID_DICOT_ATC_IRIS'',
		CASE PATINDEX(''%/%'', t1.libelle)
			WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
			ELSE SUBSTRING(t1.libelle, 1, PATINDEX(''%/%'', t1.libelle) - 2)	-- -2 car il y a un espace
		END AS ''Code'',								-- entre le / et le dernier
											-- caractère du code
		CASE PATINDEX(''%/%'', t1.libelle)
			WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
			ELSE SUBSTRING(t1.libelle, PATINDEX(''%/%'', t1.libelle) + 2, 255)	-- +2 car il y a un espace
		END AS ''LIBELLE'',							-- entre le / et le premier
											-- caractère du libellé
		CASE
		WHEN t2.id_dicot_atc_iris IS NULL THEN  0
	             ELSE 1
		END AS ''HasChild''

	FROM DICOT_ATC_IRIS t1
		LEFT OUTER JOIN DICOT_ATC_IRIS t2
		ON t1.id_dicot_atc_iris = t2.dic_id_dicot_atc_iris
	WHERE SUBSTRING(t1.libelle, 1,CASE PATINDEX(''%/%'', t1.libelle)
						WHEN 0 THEN  255
						ELSE PATINDEX(''%/%'', t1.libelle) - 2
					END) = @ID_DICOT_ATC_IRIS
	GROUP BY
		t1.id_dicot_atc_iris,
		t1.libelle,
		CASE
		WHEN t2.id_dicot_atc_iris IS NULL THEN  0
	             ELSE 1
		END

	-- TEST ERREUR
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret
















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[P_Ins_SUBHOP]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[P_Ins_SUBHOP]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[P_Ins_SUBHOP]
(
	@IdOrganisme	INTEGER,
	@Id_t_subhop 	INTEGER OUTPUT,
	@Libelle 	VARCHAR(50),
	@Cod_Trt 	VARCHAR(255) OUTPUT
) AS
-- Definitions
DECLARE @Erreur INTEGER

-- BODY
BEGIN
	-- Initialisation et optimisation
	SET NOCOUNT ON
	SET @Erreur = 0

	BEGIN TRANSACTION	-- DEMARRAGE DE TRANSACTION
		INSERT INTO T_SUBHOP(IDORGANISME, LIBELLE)
			VALUES (@IdOrganisme, @Libelle )
		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END

		SET @Id_t_subhop = (SELECT MAX(ID_T_SUBHOP) FROM T_SUBHOP)
		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END
	COMMIT TRANSACTION	-- VALIDATION TRANSACTION

	SET @Cod_Trt = ''SQL-00000 : Normal, Successful completion''
	GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Cod_Trt = ''SQL-'' + CONVERT(VARCHAR(10), @@ERROR) + '' : Error execution''

SORTIE:
	RETURN @Erreur



' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetATCAncester_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCAncester_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetATCAncester_Id]
(
	@ID_DICOT_ATC_IRIS		INTEGER=NULL,
	@Ret				INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER
DECLARE @Time  varchar(20)
DECLARE @TTEMP_ATC  varchar(25)
DECLARE @TableT varchar(25)
DECLARE @Req varchar(4000)

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetATCAncester_Id'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON
             SET @Time = replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET @TableT = ''TMP_CONNECTBY'' +@Time

	-- PREPARATION LISTE CONNECT --

               set   @Req = ''''
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableT+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TableT
                           EXEC(@Req)

	-- Création de la table temporaire
	SET @Req = ''CREATE TABLE ##''+ @TableT +'' ( ID_COL INTEGER )''
	EXEC(@Req) 

		-- Récupération de la hiérachie
		    /* Juste pour mémo, les paramètres de la procédure : p_Connect_By NomTable, ColPere, ColFils, TypeNoeud, ID, ListeID, Terme */

		EXEC @Erreur = p_Connect_By ''DICOT_ATC_IRIS'', ''id_dicot_atc_iris'', ''dic_id_dicot_atc_iris'',  ''P'', @ID_DICOT_ATC_IRIS, NULL, NULL, @TableT
		IF @Erreur != 0
			GOTO SORTIE_ERR


	SET @Req = ''SELECT 
		t1.id_dicot_atc_iris AS ''''ID_DICOT_ATC_IRIS'''',
		CASE PATINDEX(''''%/%'''', t1.libelle)
			WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
			ELSE SUBSTRING(t1.libelle, 1, PATINDEX(''''%/%'''', t1.libelle) - 2)	-- -2 car il y a un espace
		END AS ''''Code'''',								-- entre le / et le dernier
											-- caractère du code
		CASE PATINDEX(''''%/%'''', t1.libelle)
			WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
			ELSE SUBSTRING(t1.libelle, PATINDEX(''''%/%'''', t1.libelle) + 2, 255)	-- +2 car il y a un espace
		END AS ''''LIBELLE'''',							-- entre le / et le premier
											-- caractère du libellé
		1 AS "HasChild"
	FROM DICOT_ATC_IRIS t1 LEFT OUTER JOIN DICOT_ATC_IRIS t2
				 ON t1.id_dicot_atc_iris = t2.dic_id_dicot_atc_iris
	WHERE t1.dic_id_dicot_atc_iris IS NULL
	AND t1.id_dicot_atc_iris IN ( SELECT * FROM ##'' +@TableT+'' )
	GROUP BY
		t1.id_dicot_atc_iris,
		t1.libelle''

              EXEC(@Req)


	-- TEST ERREUR
	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableT+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TableT
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	ELSE
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableT+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TableT
                           EXEC(@Req)
                           GOTO SORTIE
                      END
	
END

SORTIE_ERR:
	
           IF @Erreur = 0
	SET @Erreur = @@ERROR
	SET @Ret = @Erreur

       

SORTIE:
           
	RETURN @Ret

        
	









































' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetATCAncester_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCAncester_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetATCAncester_Txt]
(
	@ID_DICOT_ATC_IRIS		VARCHAR(255)=NULL,
	@Ret				INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur	INTEGER
DECLARE @varColPere	VARCHAR(200)
DECLARE @TableT varchar(25)
DECLARE @Req varchar(4000)
DECLARE @Time varchar(25)
DECLARE @Liste	VARCHAR(200)

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetATCAncester_Txt'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON
             SET @Time = replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET @TableT = ''TMP_CONNECTBY'' +@Time

	-- PREPARATION LISTE CONNECT --

               set   @Req = ''''
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableT+ '''''' AND TYPE = ''''U'''')
		DROP TABLE ##''+@TableT
                           EXEC(@Req)

	-- Création de la table temporaire
	SET @Req = ''CREATE TABLE ##''+@TableT +'' ( ID_COL INTEGER )''
	EXEC(@Req) 

--Enlevé par ML -debut
-- Formatage de la colonne Père à passer en paramètre pour la procédure p_Connect_By
/*		SET @varColPere = ''SUBSTRING(libelle, 1, CASE PATINDEX(''''%/%'''', libelle)
								WHEN 0 THEN 255
								ELSE PATINDEX(''''%/%'''', libelle) - 2
							   END)''
 
*/
--fin
--rajouté par ML -debut
            IF NOT( @ID_DICOT_ATC_IRIS IS NULL )
	BEGIN
	-------------------------------------------------------------------------------------------- PREPARATION LISTE DES ID ISSUS DU TRANSLATE -----------------------------------
		EXEC @Erreur = p_Trans_Upper_Table_ListeId ''DICOT_ATC_IRIS'',  ''LIBELLE'' ,'' id_dicot_atc_iris'', @ID_DICOT_ATC_IRIS,  @Liste OUTPUT
		IF @Erreur != 0	GOTO SORTIE_ERR
	END
		-- Récupération de la hiérachie
		    /* Juste pour mémo, les paramètres de la procédure : p_Connect_By NomTable, ColPere, ColFils, TypeNoeud, ID, ListeID, Terme */
		--EXEC @Erreur = p_Connect_By ''DICOT_ATC_IRIS'', @varColPere, ''id_dicot_atc_iris'',  ''P'', 0, NULL, @Libelle

		EXEC @Erreur = p_Connect_By  ''DICOT_ATC_IRIS'', ''id_dicot_atc_iris'', ''dic_id_dicot_atc_iris'',  ''P'', 0, @Liste, null, @TableT
-- fin

		IF @Erreur != 0
			GOTO SORTIE_ERR
	-- FIN PREPA LISTE CONNECT --

/* NOTE :
On a été obligé, par rapport à la version Oracle de la requête, de spécifier le cas où le caractère ''/'' n''est pas présent
dans le libellé car il existe, dans la base, 1 cas où la valeur du champ ''LIBELLE'' est égal à ''NON RENSEIGNE'' (cf. id_dicot_atc_iris = 2298).
Du coup, seuls les 2200 premiers tuples sont visibles  au lieu de 5000 et quelques, jusqu''à ce que la requête plante pour cause de longueur
négative dans les paramètres de la fonction SUBSTRING.
*/
	SET @Req = ''SELECT
		t1.id_dicot_atc_iris AS ''''ID_DICOT_ATC_IRIS'''',
		CASE PATINDEX(''''%/%'''', t1.libelle)
			WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
			ELSE SUBSTRING(t1.libelle, 1, PATINDEX(''''%/%'''', t1.libelle) - 2)	
		END AS ''''Code'''',								
											
		CASE PATINDEX(''''%/%'''', t1.libelle)
			WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
			ELSE SUBSTRING(t1.libelle, PATINDEX(''''%/%'''', t1.libelle) + 2, 255)
		END AS ''''LIBELLE'''',							
											
		1 AS ''''HasChild''''
	FROM DICOT_ATC_IRIS t1 LEFT OUTER JOIN DICOT_ATC_IRIS t2
				 ON t1.id_dicot_atc_iris = t2.dic_id_dicot_atc_iris
	WHERE t1.dic_id_dicot_atc_iris IS NULL
	AND t1.id_dicot_atc_iris IN ( SELECT * FROM ##''+@TableT +'' )
	GROUP BY
		t1.id_dicot_atc_iris,
		t1.libelle''

             EXEC(@Req)

	-- TEST ERREUR
	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM  tempdb..sysobjects  WHERE NAME = ''''##''+@TableT+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TableT
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM  tempdb..sysobjects  WHERE NAME = ''''##''+@TableT+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TableT
                           EXEC(@Req)
                           GOTO SORTIE
                      END
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret





















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_LIV_Get_]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_LIV_Get_]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_LIV_Get_]
(
	@The_Ide	INTEGER,
	@Type_Ide	INTEGER,
	@Search		VARCHAR(10),
	@IDHop		INTEGER,
	@TLIVGetHIE	VARCHAR(30)  OUTPUT
) AS
-- Déclarations locales
DECLARE @Erreur		INTEGER
DECLARE @Type_To	INTEGER
DECLARE @Type_Lib	VARCHAR(10)
DECLARE @Car		VARCHAR(1)
DECLARE @Abs_Type	INTEGER

-- Body
BEGIN
	-- Initialisation et optimisation
	SET NOCOUNT ON
	SET @Erreur = 0

	-- Recuperation code spécialité
	EXEC @Erreur = RMC_Get_Type @Search, @Type_To OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR

	SET @Abs_Type = ABS(@Type_Ide)
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- Récupération Libelle 
	EXEC @Erreur = p_RMC_Get_Type_Lib @Type_Ide , @Type_Lib OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR

	-- Test des types attendus
	SET @Car = CASE
			WHEN @Search = ''SPE'' THEN CASE
							WHEN @Type_Lib = ''CIP'' THEN ''H''
							ELSE ''P''
						  END
			WHEN @Search = ''CIP'' THEN ''H''
			WHEN @Search = ''SUB'' THEN CASE
							WHEN @Type_Lib = ''SPE'' THEN ''P''
							ELSE ''H''
						  END
			WHEN @Search IN (''INDIC'', ''GINDIC'', ''IAM'',''LABO'') THEN ''P''
			WHEN @Search = ''CINDIC'' THEN CASE
							WHEN @Type_Lib = ''CINDIC'' THEN ''H''
							ELSE ''P''
						     END
			WHEN @Search = ''THERA'' THEN CASE
							WHEN @Type_Lib = ''SPE'' THEN ''P''
							ELSE ''H''
						    END
			ELSE ''%''
		   END

	-- Test des types attendus
	SET @Type_Ide = CASE
				WHEN @Search = ''SPE'' THEN CASE 
								WHEN @Type_Lib IN (''CIP'',''SUB'') THEN 0-@Abs_Type
								WHEN @Type_Lib IN (''INDIC'',''CINDIC'',''THERA'',''LABO'',''IAM'') THEN @Abs_Type
								ELSE 0
							  END
				WHEN @Search = ''CIP'' THEN CASE
								WHEN @Type_Lib = ''SPE'' THEN @Abs_Type
								ELSE 0
							  END
				WHEN @Search = ''SUB'' THEN CASE
								WHEN @Type_Lib = ''SUB'' THEN @Type_Ide
								WHEN @Type_Lib = ''SPE'' THEN @Abs_Type
								ELSE 0
							  END
				WHEN @Search = ''INDIC'' THEN CASE
								WHEN @Type_Lib = ''GINDIC'' THEN @Abs_Type
								WHEN @Type_Lib = ''SPE'' THEN 0-@Abs_Type
								ELSE 0
							    END
				WHEN @Search = ''GINDIC'' THEN CASE
								WHEN @Type_Lib = ''GINDIC'' THEN @Type_Ide
								WHEN @Type_Lib IN(''INDIC'', ''CIM'') THEN 0-@Abs_Type
								ELSE 0
							     END
				WHEN @Search = ''CINDIC'' THEN CASE
								WHEN @Type_Lib = ''CINDIC'' THEN @Type_Ide
								WHEN @Type_Lib IN(''SPE'',''CIM'') THEN 0-@Abs_Type
								ELSE 0
							     END
				WHEN @Search = ''THERA'' THEN CASE
								WHEN @Type_Lib = ''SPE'' THEN 0-@Abs_Type
								WHEN @Type_Lib = ''THERA'' THEN @Type_Ide
								ELSE 0
							    END
				WHEN @Search = ''IAM'' THEN CASE
								WHEN @Type_Lib = ''SPE'' THEN 0-@Abs_Type
								WHEN @Type_Lib = ''IAM'' THEN @Type_Ide
								ELSE 0
							  END
				WHEN @Search = ''LABO'' THEN CASE
								WHEN @Type_Lib = ''SPE'' THEN 0-@Abs_Type
								ELSE 0
							   END
				ELSE 0
			END

	-- Recherche hiérarchique
	IF @Car != ''%''
	BEGIN
		EXEC @Erreur = LIV_GetHie_Pro @The_Ide, @Car, @Type_Ide, @Type_To, @IDHop, @TLIVGetHIE  OUTPUT
		IF @Erreur != 0
			GOTO SORTIE_ERR
	END

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR
SORTIE:
	RETURN @Erreur








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetATCChild_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[GetATCChild_Id]
(
	@ID_DICOT_ATC_IRIS	INTEGER=NULL,
	@Ret			INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetATCChild_Id'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	-- (Re)création de la table temporaire selon l''ID passé en paramètre entrant
	IF @ID_DICOT_ATC_IRIS IS NULL
	BEGIN

		SELECT 
			t1.id_dicot_atc_iris AS ''ID_DICOT_ATC_IRIS'',
			CASE PATINDEX(''%/%'', t1.libelle)
				WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
				ELSE SUBSTRING(t1.libelle, 1, PATINDEX(''%/%'', t1.libelle) - 2)		-- -2 car il y a un espace
			END AS ''Code'',									-- entre le / et le dernier
													-- caractère du code
			CASE PATINDEX(''%/%'', t1.libelle)
				WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
				ELSE SUBSTRING(t1.libelle, PATINDEX(''%/%'', t1.libelle) + 2, 255)		-- +2 car il y a un espace
			END AS ''LIBELLE'',								-- entre le / et le premier
													-- caractère du libellé

			CASE 
			   	 WHEN t2.id_dicot_atc_iris IS NULL THEN  0
			     	ELSE 1
			END  AS ''Haschild''	
	
		FROM DICOT_ATC_IRIS t1
			LEFT OUTER JOIN DICOT_ATC_IRIS t2
			ON t1.id_dicot_atc_iris = t2.dic_id_dicot_atc_iris

		WHERE t1.dic_id_dicot_atc_iris IS NULL
		GROUP BY
			t1.id_dicot_atc_iris,
			t1.libelle,
			CASE 
			    WHEN t2.id_dicot_atc_iris IS NULL THEN  0
			     ELSE 1
			END
		ORDER BY CODE

	END
	ELSE
	BEGIN
		-- l''ID passé est NON NULL

		SELECT   
			t1.id_dicot_atc_iris,
			RTRIM(SUBSTRING(t1.libelle, 1, PATINDEX(''%/%'', t1.libelle) - 2)) AS ''CODE'',	-- -2 car il y a un espace
													-- entre le / et le dernier
													-- caractère du code
			RTRIM(SUBSTRING(t1.libelle, PATINDEX(''%/%'', t1.libelle) + 2, 255)) AS ''LIBELLE'',   -- +2 car il y a un espace
													-- entre le / et la 1ère lettre													-- du libellé
			CASE 
			   	 WHEN t2.id_dicot_atc_iris IS NULL THEN  0
			     	ELSE 1
			END  AS ''Haschild''	


		FROM DICOT_ATC_IRIS t1
			LEFT OUTER JOIN DICOT_ATC_IRIS t2
			ON t1.id_dicot_atc_iris = t2.dic_id_dicot_atc_iris
		WHERE t1.dic_id_dicot_atc_iris = @ID_DICOT_ATC_IRIS
		GROUP BY
			t1.id_dicot_atc_iris,
			t1.libelle,
			CASE 
			    WHEN t2.id_dicot_atc_iris IS NULL THEN  0
			     ELSE 1
			END
		ORDER BY CODE
	END

	-- PAS D''ERREUR
	set @Ret = 0
		GOTO SORTIE
END

-- Gestion des erreurs
SORTIE_ERR:
	-- Sauvegarde de l''erreur
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	set @Ret = @Erreur

-- Cas de sortie sans erreur
SORTIE:
	RETURN @Ret


























' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_LTrim_Ora]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_LTrim_Ora]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_LTrim_Ora] ( 	
					@Source 	VARCHAR(255),
					@Car		VARCHAR(1),
					@Dest		VARCHAR(255) OUTPUT
				) AS

DECLARE @Erreur INTEGER
DECLARE @Index INTEGER
DECLARE @Taille INTEGER

BEGIN
	SET @Erreur = 0
	
	IF @Car = '' ''
	BEGIN
		SET @Dest = LTRIM( @Source )
		IF @@ERROR != 0 GOTO SORTIE_ERR
	END
	ELSE
	BEGIN
		SET @Taille = LEN(@Source)
		IF @@ERROR != 0 GOTO SORTIE_ERR

		SET @Index = 0
		IF @@ERROR != 0 GOTO SORTIE_ERR

		WHILE @Index < @Taille AND SUBSTRING(@Source, @Index+1,1) = @Car
		BEGIN
			SET @Index = @Index +1
			IF @@ERROR != 0 GOTO SORTIE_ERR
		END
		IF @Index = @Taille
			SET @Dest = ''''
		ELSE
			SET @Dest = SUBSTRING(@Source, @Index+1, @Taille-@Index+1 )

		IF @@ERROR != 0 GOTO SORTIE_ERR
	END
	
END

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur












' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetATCChild_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCChild_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetATCChild_Txt]
(
	@ID_DICOT_ATC_IRIS	VARCHAR(255)=NULL,
	@Ret			INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetATCChild_Txt'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	-- (Re)création de la table temporaire selon l''ID passé en paramètre entrant
	IF @ID_DICOT_ATC_IRIS IS NULL
	BEGIN
		-- l''ID passé est NULL
/* NOTE :
On a été obligé, par rapport à la version Oracle de la requête, de spécifier le cas où le caractère ''/'' n''est pas présent
dans le libellé car il existe, dans la base, 1 cas où la valeur du champ ''LIBELLE'' est égal à ''NON RENSEIGNE'' (cf. id_dicot_atc_iris = 2298).
Du coup, seuls les 2200 premiers tuples sont visibles  au lieu de 5000 et quelques, jusqu''à ce que la requête plante pour cause de longueur
négative dans les paramètres de la fonction SUBSTRING.
*/
		SELECT  
			t1.id_dicot_atc_iris AS ''ID_DICOT_ATC_IRIS'',
			CASE PATINDEX(''%/%'', t1.libelle)
				WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
				ELSE SUBSTRING(t1.libelle, 1, PATINDEX(''%/%'', t1.libelle) - 2)	-- -2 car il y a un espace
			END AS ''Code'',								-- entre le / et le dernier
												-- caractère du code
			CASE PATINDEX(''%/%'', t1.libelle)
				WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
				ELSE SUBSTRING(t1.libelle, PATINDEX(''%/%'', t1.libelle) + 2, 255)	-- +2 car il y a un espace
			END AS ''LIBELLE'',

			CASE 
			   	 WHEN t2.id_dicot_atc_iris IS NULL THEN  0
			     	ELSE 1
			END  AS ''Haschild''	

		FROM DICOT_ATC_IRIS t1
			LEFT OUTER JOIN DICOT_ATC_IRIS t2
			ON t1.id_dicot_atc_iris = t2.dic_id_dicot_atc_iris
		WHERE t1.dic_id_dicot_atc_iris IS NULL
		GROUP BY
			t1.id_dicot_atc_iris,
			t1.libelle,
			  CASE 
  			WHEN t2.id_dicot_atc_iris IS NULL THEN 0
  			ELSE 1
 			 END
		ORDER BY Code

	END
	ELSE
	BEGIN
		-- l''ID passé est NON NULL
		SELECT   
			t1.id_dicot_atc_iris,
			RTRIM(SUBSTRING(t1.libelle, 1, PATINDEX(''%/%'', t1.libelle) - 2)) AS ''CODE'',	-- -2 car il y a un espace
													-- entre le / et le dernier
													-- caractère du code
			RTRIM(SUBSTRING(t1.libelle, PATINDEX(''%/%'', t1.libelle) + 2, 255)) AS ''LIBELLE'',   -- +2 car il y a un espace
													-- entre le / et la 1ère lettre
													-- du libellé

			CASE 
			   	 WHEN t2.id_dicot_atc_iris IS NULL THEN  0
			     	ELSE 1
			END  AS ''Haschild''	

		FROM DICOT_ATC_IRIS t3,	DICOT_ATC_IRIS t1
						LEFT OUTER JOIN DICOT_ATC_IRIS t2
						ON t1.id_dicot_atc_iris = t2.dic_id_dicot_atc_iris
		WHERE t1.dic_id_dicot_atc_iris = t3.id_dicot_atc_iris
			AND SUBSTRING(t3.libelle, 1,CASE PATINDEX(''%/%'', t3.libelle)
						WHEN 0 THEN  255
						ELSE PATINDEX(''%/%'', t3.libelle) - 2
					END) = @ID_DICOT_ATC_IRIS
		GROUP BY
			t1.id_dicot_atc_iris,
			t1.libelle,
			 CASE 
  			 WHEN t2.id_dicot_atc_iris IS NULL THEN 0
  			ELSE 1
 			 END
		ORDER BY Code

	END

	-- TEST ERREUR
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret


















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_RMC_Detect_iam_ci]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_RMC_Detect_iam_ci]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_RMC_Detect_iam_ci] ( @Id_Specialites VARCHAR(255), 
						@CodeCIM10 VARCHAR(255) ,
						@TSPEC            VARCHAR(50) OUTPUT,
						@TCODECIM      VARCHAR(50) OUTPUT
						) AS

DECLARE @Erreur INTEGER
DECLARE @i INTEGER
DECLARE @Index INTEGER
DECLARE @time        varchar(20)
--DECLARE @TSPEC   varchar(50)
DECLARE @Req        varchar(4000)
DECLARE @SQL        varchar(4000)
--DECLARE @TCODECIM   varchar(50)

BEGIN

SET NOCOUNT ON

SET @Erreur = 0

	SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET  @TSPEC = ''TMP_SPECIALITES'' +@time

	SET @REQ = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TSPEC +''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TSPEC 

	EXEC(@REQ)

	-- Création de la table temporaire
	SET @Req = ''CREATE TABLE ##''+@TSPEC+ ''( ID_F  INTEGER )''
	EXEC(@Req) 



SET @i = PATINDEX(''%,%'', @Id_Specialites)
WHILE @i >= 0
BEGIN
	IF @i > 0
	BEGIN
		SET @Index = CAST( SUBSTRING(@Id_Specialites,1, @i-1) AS INTEGER)
		SET @Id_Specialites = SUBSTRING(@Id_Specialites,@i+1, LEN(@Id_Specialites)-@i )
	END
	ELSE
	BEGIN
		SET @Index = CAST(  @Id_Specialites AS INTEGER)
	END
		SET @Req = '' INSERT INTO ##''+@TSPEC+'' VALUES(''+ CONVERT(VARCHAR(10),@Index)+'')''
		EXEC(@Req)
	IF @i = 0 
		BREAK
	ELSE
	BEGIN
		SET @i = PATINDEX(''%,%'', @Id_Specialites)
	END
END


             SET  @TCODECIM = ''TMP_CODECIM10'' +@time

	SET @SQL = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TCODECIM +''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TCODECIM

	EXEC(@SQL)

	-- Création de la table temporaire
	SET @SQL = ''CREATE TABLE ##''+@TCODECIM+ ''( ID_F  INTEGER )''
	EXEC(@SQL) 



SET @i = PATINDEX(''%,%'', @CodeCIM10)
WHILE @i >= 0
BEGIN
	IF @i > 0
	BEGIN
		SET @Index = CAST( SUBSTRING(@CodeCIM10,1, @i-1) AS INTEGER)
		SET @CodeCIM10 = SUBSTRING(@CodeCIM10,@i+1, LEN(@CodeCIM10)-@i )
	END
	ELSE
	BEGIN
		SET @Index = CAST(  @CodeCIM10 AS INTEGER)
	END

	SET @SQL = '' INSERT INTO ##''+@TCODECIM+'' VALUES(''+ CONVERT(VARCHAR(10),@Index)+'')''
		EXEC(@SQL)

	IF @i = 0 
		BREAK
	ELSE
	BEGIN
		SET @i = PATINDEX(''%,%'', @CodeCIM10)
	END

END

END
SORTIE:
	RETURN 0

SORTIE_ERR:
	IF @Erreur = 0
		SET  @Erreur = @@ERROR
	RETURN @Erreur








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetATCParent_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetATCParent_Id]
(
	@ID_DICOT_ATC_IRIS			INTEGER=NULL,
	@Ret					INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetATCParent_Id'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

/* NOTE :
On a été obligé, par rapport à la version Oracle de la requête, de spécifier le cas où le caractère ''/'' n''est pas présent
dans le libellé car il existe, dans la base, 1 cas où la valeur du champ ''LIBELLE'' est égal à ''NON RENSEIGNE'' (cf. id_dicot_atc_iris = 2298).
Du coup, seuls les 2200 premiers tuples sont visibles  au lieu de 5000 et quelques, jusqu''à ce que la requête plante pour cause de longueur
négative dans les paramètres de la fonction SUBSTRING.
*/
		SELECT 
		t1.id_dicot_atc_iris AS ''ID_DICOT_ATC_IRIS'',
		CASE PATINDEX(''%/%'', t1.libelle)
			WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
			ELSE SUBSTRING(t1.libelle, 1, PATINDEX(''%/%'', t1.libelle) - 2)	-- -2 car il y a un espace
		END AS ''Code'',								-- entre le / et le dernier
											-- caractère du code
		CASE PATINDEX(''%/%'', t1.libelle)
			WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
			ELSE SUBSTRING(t1.libelle, PATINDEX(''%/%'', t1.libelle) + 2, 255)	-- +2 car il y a un espace
		END AS ''LIBELLE'',							-- entre le / et le premier
											-- caractère du libellé
		 1 AS ''HasChild''

	FROM DICOT_ATC_IRIS t1
		LEFT OUTER JOIN DICOT_ATC_IRIS t2
		ON t1.id_dicot_atc_iris = t2.dic_id_dicot_atc_iris
	WHERE t1.id_dicot_atc_iris = (SELECT dic_id_dicot_atc_iris FROM DICOT_ATC_IRIS WHERE id_dicot_atc_iris = @ID_DICOT_ATC_IRIS)
	GROUP BY
		t1.id_dicot_atc_iris,
		t1.libelle
	
	-- TEST ERREUR
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret
















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_RMC_Get_]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_RMC_Get_]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_RMC_Get_]
(
	@The_Ide	INTEGER,
	@Type_Ide	INTEGER,
	@Search		VARCHAR(10),
	@TGetHIE         VARCHAR(30)  OUTPUT
) AS
-- Definition variables locales
DECLARE @Erreur INTEGER
DECLARE @Type_To INTEGER
DECLARE @Type_Lib VARCHAR(10)
DECLARE @Car VARCHAR(1)
DECLARE @Abs_Type INTEGER

-- BODY
BEGIN

	-- Init
	SET @Erreur = 0

	-- Recuperation code spécialité
	EXEC  @Erreur = RMC_Get_Type @Search, @Type_To OUTPUT
	IF @Erreur != 0 GOTO SORTIE_ERR

	SET @Abs_Type = ABS(@Type_Ide)
	IF @@ERROR != 0 GOTO SORTIE_ERR

	-- Récupération Libelle 
	EXEC @Erreur = p_RMC_Get_Type_Lib @Type_Ide , @Type_Lib OUTPUT
	IF @Erreur != 0 GOTO SORTIE_ERR

	-- Test des types attendues
	SET @Car = CASE
				WHEN @Search = ''SPE''	  THEN
								CASE 
									WHEN @Type_Lib = ''CIP''	THEN	''H''
									ELSE					''P''
								END
				WHEN @Search = ''CIP''	 THEN ''H''
				WHEN @Search = ''SUB'' THEN
								CASE
									WHEN @Type_Lib = ''SPE''	THEN 	''P''
									ELSE					''H''
								END
				WHEN @Search IN (''INDIC'', ''GINDIC'', ''IAM'',''LABO'') THEN ''P''
				WHEN @Search = ''CINDIC'' THEN
								CASE
									WHEN @Type_Lib = ''CINDIC''	THEN 	''H''
									ELSE					''P''
								END						
				WHEN @Search = ''THERA'' THEN
								CASE
									WHEN @Type_Lib = ''SPE''	THEN	''P''
									ELSE					''H''
								END
				ELSE	''%''
			END

	-- Test des types attendues
	SET @Type_Ide = CASE
				WHEN @Search = ''SPE'' THEN
								CASE 
									WHEN @Type_Lib IN (''CIP'',''SUB'')				THEN 	0-@Abs_Type
									WHEN @Type_Lib IN (''INDIC'',''CINDIC'',''THERA'',''LABO'',''IAM'') 	THEN 	@Abs_Type
									ELSE 									0
								END
				WHEN @Search = ''CIP''	THEN
								CASE
									WHEN @Type_Lib = ''SPE''					THEN 	@Abs_Type
									ELSE									0
								END
				WHEN @Search = ''SUB'' THEN
								CASE 
									WHEN @Type_Lib = ''SUB''					THEN 	@Type_Ide
									WHEN @Type_Lib = ''SPE''					THEN 	@Abs_Type
									ELSE									0
								END
				WHEN @Search = ''INDIC'' THEN
								CASE
									WHEN @Type_Lib = ''GINDIC''					THEN 	@Abs_Type
									WHEN @Type_Lib = ''SPE''					THEN	0-@Abs_Type
									ELSE									0
								END
				WHEN @Search = ''GINDIC'' THEN
								CASE
									WHEN @Type_Lib = ''GINDIC''					THEN	@Type_Ide
									WHEN @Type_Lib IN(''INDIC'', ''CIM'')				THEN	0-@Abs_Type
									ELSE									0
								END
				WHEN @Search = ''CINDIC'' THEN
								CASE
									WHEN @Type_Lib = ''CINDIC''					THEN	@Type_Ide
									WHEN @Type_Lib IN(''SPE'',''CIM'')				THEN	0-@Abs_Type
									ELSE									0
								END			
				WHEN @Search = ''THERA'' THEN
								CASE
									WHEN @Type_Lib = ''SPE''					THEN	0-@Abs_Type
									WHEN	@Type_Lib = ''THERA''					THEN 	@Type_Ide
									ELSE									0
								END
				WHEN @Search = ''IAM'' THEN
								CASE
									WHEN @Type_Lib = ''SPE''					THEN	0-@Abs_Type
									WHEN	@Type_Lib = ''IAM''					THEN 	@Type_Ide
									ELSE									0
								END
				WHEN @Search = ''LABO'' THEN
								CASE
									WHEN @Type_Lib = ''SPE''					THEN	0-@Abs_Type
									ELSE									0
								END
				ELSE 0
			END

	-- Recherche hiérarchique
	IF @Car != ''%''
	BEGIN
		--PRINT( ''RMC_GetHie_Pro '' + CAST(@The_Ide AS VARCHAR(10) ) + '' '' + @Car + '' '' + CAST(@Type_Ide AS VARCHAR(10) )  + '' '' +  CAST(@Type_To AS VARCHAR(10) )  )

		EXEC @Erreur = RMC_GetHie_Pro @The_Ide,@Car,  @Type_Ide, @Type_To, @TGetHIE OUTPUT
		IF @Erreur != 0 GOTO SORTIE_ERR

	END
END

-- Sortie OK
SORTIE:
	RETURN 0

-- Anomalie:
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur


























' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetATCParent_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCParent_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetATCParent_Txt]
(
	@ID_DICOT_ATC_IRIS	VARCHAR(255)=NULL,
	@Ret			INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetATCParent_Txt'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

/* NOTE :
On a été obligé, par rapport à la version Oracle de la requête, de spécifier le cas où le caractère ''/'' n''est pas présent
dans le libellé car il existe, dans la base, 1 cas où la valeur du champ ''LIBELLE'' est égal à ''NON RENSEIGNE'' (cf. id_dicot_atc_iris = 2298).
Du coup, seuls les 2200 premiers tuples sont visibles  au lieu de 5000 et quelques, jusqu''à ce que la requête plante pour cause de longueur
négative dans les paramètres de la fonction SUBSTRING.
*/
	  SELECT  
		t1.id_dicot_atc_iris AS ''ID_DICOT_ATC_IRIS'',
		CASE PATINDEX(''%/%'', t1.libelle)
			WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
			ELSE SUBSTRING(t1.libelle, 1, PATINDEX(''%/%'', t1.libelle) - 2)	-- -2 car il y a un espace
		END AS ''Code'',								-- entre le / et le dernier
											-- caractère du code
		CASE PATINDEX(''%/%'', t1.libelle)
			WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
			ELSE SUBSTRING(t1.libelle, PATINDEX(''%/%'', t1.libelle) + 2, 255)	-- +2 car il y a un espace
		END AS ''LIBELLE'',							-- entre le / et le premier
											-- caractère du libellé
		1 AS ''Haschild'' 

	FROM DICOT_ATC_IRIS t1
		LEFT OUTER JOIN DICOT_ATC_IRIS t2
		ON t1.id_dicot_atc_iris = t2.dic_id_dicot_atc_iris
	WHERE t1.id_dicot_atc_iris = 	(SELECT t3.dic_id_dicot_atc_iris FROM DICOT_ATC_IRIS t3
					WHERE SUBSTRING(t3.libelle, 1, CASE PATINDEX(''%/%'', t3.libelle)
											WHEN 0 THEN  255
											ELSE PATINDEX(''%/%'', t3.libelle) - 2
										END) = @ID_DICOT_ATC_IRIS)
	GROUP BY
		t1.id_dicot_atc_iris,
		t1.libelle

	-- TEST ERREUR
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret












' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_RMC_GetCim10Corres]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_RMC_GetCim10Corres]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_RMC_GetCim10Corres]( @Id_GIndics VARCHAR(255), @TGINDICS   varchar(25)  OUTPUT ) AS

DECLARE @Erreur INTEGER
DECLARE @i INTEGER
DECLARE @Index INTEGER
DECLARE @time              varchar(20)
--DECLARE @TGINDICS   varchar(25)
DECLARE @Req              varchar(4000)

BEGIN

SET NOCOUNT ON

SET @Erreur = 0
             SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET   @TGINDICS = ''TMP_GINDICS'' +@time

	SET @REQ = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TGINDICS+''''''  AND TYPE = ''''U'''')
	DROP TABLE ##''+@TGINDICS
	EXEC(@REQ)

	-- Création de la table temporaire
	SET @REQ = ''CREATE TABLE ##''+@TGINDICS+'' ( Id_F INTEGER )''
	EXEC(@REQ)

SET @i = PATINDEX(''%,%'', @Id_GIndics)
WHILE @i >= 0
BEGIN
	IF @i > 0
	BEGIN
		SET @Index = CAST( SUBSTRING(@Id_GIndics,1, @i-1) AS INTEGER)
		SET @Id_GIndics = SUBSTRING(@Id_GIndics,@i+1, LEN(@Id_GIndics)-@i )
	END
	ELSE
	BEGIN
		SET @Index = CAST(  @Id_GIndics AS INTEGER)
	END
		SET @REQ = ''INSERT INTO ##''+@TGINDICS+'' VALUES(''+CONVERT(VARCHAR(10),@Index)+'')''
		EXEC(@REQ)

	IF @i = 0 
		BREAK
	ELSE
	BEGIN
		SET @i = PATINDEX(''%,%'', @Id_GIndics)
	END
END

END














' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetATCSCODE_TXT]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCSCODE_TXT]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[GetATCSCODE_TXT]
(
	@LIBELLE	VARCHAR(255)=NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetATCSCODE_TXT'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

/* NOTE :
On a été obligé, par rapport à la version Oracle de la requête, de spécifier le cas où le caractère ''/'' n''est pas présent
dans le libellé car il existe, dans la base, 1 cas où la valeur du champ ''LIBELLE'' est égal à ''NON RENSEIGNE'' (cf. id_dicot_atc_iris = 2298).
Du coup, seuls les 2200 premiers tuples sont visibles  au lieu de 5000 et quelques, jusqu''à ce que la requête plante pour cause de longueur
négative dans les paramètres de la fonction SUBSTRING.
*/

	SELECT 
		t1.id_dicot_atc_iris AS ''ID_DICOT_ATC_IRIS'',
		CASE PATINDEX(''%/%'', t1.libelle)
			WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
			ELSE SUBSTRING(t1.libelle, 1, PATINDEX(''%/%'', t1.libelle) - 2)	-- -2 car il y a un espace
		END AS ''Code'',								-- entre le / et le dernier
											-- caractère du code
		CASE PATINDEX(''%/%'', t1.libelle)
			WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
			ELSE SUBSTRING(t1.libelle, PATINDEX(''%/%'', t1.libelle) + 2, 255)	-- +2 car il y a un espace
		END AS ''LIBELLE'',							-- entre le / et le premier
											-- caractère du libellé
		CASE
		WHEN t2.id_dicot_atc_iris IS NULL THEN  0
	             ELSE 1
		END AS ''Haschild''

	FROM DICOT_ATC_IRIS t1
		LEFT OUTER JOIN DICOT_ATC_IRIS t2
		ON t1.id_dicot_atc_iris = t2.dic_id_dicot_atc_iris
	WHERE SUBSTRING(t1.libelle, 1,CASE PATINDEX(''%/%'', t1.libelle)
						WHEN 0 THEN  255
						ELSE PATINDEX(''%/%'', t1.libelle) - 2
					END) like  @LIBELLE
	GROUP BY
		t1.id_dicot_atc_iris,
		t1.libelle,
		CASE
		WHEN t2.id_dicot_atc_iris IS NULL THEN  0
	             ELSE 1
		END
	order by code

	-- TEST ERREUR
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret























' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_RMC_Get_Type_Lib]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_RMC_Get_Type_Lib]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- -------------------------------------------------------------------------
  -- Fonction     : p_RMC_Get_Type_Lib
  -- Objet        : Obtenir la constante de représentation
  --		à partir du type
  -- --------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[p_RMC_Get_Type_Lib]( 
						@Type_Ide	INTEGER=0,
						@Type_Lib	VARCHAR(10)	OUTPUT
				            ) AS 

SET NOCOUNT ON

SET @Type_Lib = CASE @Type_ide
			WHEN 1	THEN	''CIP''
			WHEN 2	THEN	''SPE''
			WHEN 3	THEN	''SUB''
			WHEN 4	THEN	''INDIC''
			WHEN 5	THEN	''GINDIC''
			WHEN 6	THEN	''CINDIC''
			WHEN 7	THEN	''THERA''
			WHEN 8	THEN	''CIM''	
			WHEN 9	THEN	''LABO''	
			WHEN 10	THEN	''IAM''	
			WHEN 11	THEN	''DIAG''	
			ELSE			''''
	END

RETURN @@ERROR






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetATCs_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCs_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetATCs_Txt]
(
	@Libelle	VARCHAR(255)=NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetATCs_Txt'')

--STATS



	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON


	EXEC @Erreur = p_Translate_Upper @Libelle, @Result = @Libelle OUTPUT
	IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR

	SELECT 
			t1.id_dicot_atc_iris,
			CASE PATINDEX(''%/%'', t1.libelle)
				WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
				ELSE SUBSTRING(t1.libelle, 1, PATINDEX(''%/%'', t1.libelle) - 2)	-- -2 car il y a un espace
			END AS ''CODE'',							-- entre le / et le dernier
												-- caractère du code
			CASE PATINDEX(''%/%'', t1.libelle)
				WHEN 0 THEN SUBSTRING(t1.libelle, 1, 255)
				ELSE SUBSTRING(t1.libelle, PATINDEX(''%/%'', t1.libelle) + 2, 255)	-- +2 car il y a un espace
			END AS ''LIBELLE'',							-- entre le / et le premier
												-- caractère du libellé

			CASE
				WHEN t2.id_dicot_atc_iris IS NULL THEN  0
			             ELSE 1
				END AS ''HasChild''
 
		FROM DICOT_ATC_IRIS t1
			LEFT OUTER JOIN DICOT_ATC_IRIS t2
			ON t1.id_dicot_atc_iris = t2.dic_id_dicot_atc_iris
                          WHERE REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER( SUBSTRING(t1.libelle, PATINDEX(''%/%'', t1.libelle) + 2, 255))	
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 
		GROUP BY
			t1.id_dicot_atc_iris,
			t1.libelle,
			CASE
			WHEN t2.id_dicot_atc_iris IS NULL THEN  0
	         	    	ELSE 1
			END
		ORDER BY  CODE
	 IF @@ERROR != 0
		GOTO SORTIE_ERR
              ELSE 
	-- PAS D''ERREUR
             BEGIN
	              set @Ret = 0
		GOTO SORTIE
             END
END

-- Gestion des erreurs
SORTIE_ERR:
	-- Sauvegarde de l''erreur
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	set @Ret = @Erreur

-- Cas de sortie sans erreur
SORTIE:
	RETURN @Ret













' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_RMC_GetGindic_Prob]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_RMC_GetGindic_Prob]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_RMC_GetGindic_Prob]( @Id_Specialites VARCHAR(255),
						      @TSPEC            VARCHAR(50) OUTPUT) AS

DECLARE @Erreur INTEGER
DECLARE @i INTEGER
DECLARE @Index INTEGER
DECLARE @time        varchar(20)
--DECLARE @TSPEC   varchar(50)
DECLARE @Req        varchar(4000)

BEGIN

SET NOCOUNT ON

SET @Erreur = 0

	SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET  @TSPEC = ''TMP_SPECIALITES'' +@time

	SET @REQ = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TSPEC +''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TSPEC 

	EXEC(@REQ)

	-- Création de la table temporaire
	SET @Req = ''CREATE TABLE ##''+@TSPEC+ ''( ID_F  INTEGER )''
	EXEC(@Req) 


SET @i = PATINDEX(''%,%'', @Id_Specialites)
WHILE @i >= 0
BEGIN
	IF @i > 0
	BEGIN
		SET @Index = CAST( SUBSTRING(@Id_Specialites,1, @i-1) AS INTEGER)
		SET @Id_Specialites = SUBSTRING(@Id_Specialites,@i+1, LEN(@Id_Specialites)-@i )
	END
	ELSE
	BEGIN
		SET @Index = CAST(  @Id_Specialites AS INTEGER)
	END
		SET @Req = '' INSERT INTO ##''+@TSPEC+'' VALUES(''+ CONVERT(VARCHAR(10),@Index)+'')''
		EXEC(@Req)

	IF @i = 0 
		BREAK
	ELSE
	BEGIN
		SET @i = PATINDEX(''%,%'', @Id_Specialites)
	END
END


END


SORTIE:
	RETURN 0








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetATCSpes_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCSpes_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetATCSpes_Id]
(
	@ID_DICOT_ATC_IRIS		INTEGER=NULL,
	@Ret				INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetATCSpes_Id'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	-- (Re)création de la table temporaire
	SELECT
		t2.id_specialite, t2.bvalid, t2.bencours, t2.nomuser, t2.denomspe,
		t2.forme, t2.dosage, t2.complement,
		CAST(commammposo AS VARCHAR(4000)) AS ''COMMAMMPOSO'',
		t2.reserve, t2.inferieurage, t2.unitinf, t2.superieurage,
		t2.unifsup, t2.inferieurpoids, t2.superieurpoids, t2.denomamm,
		t2.numdosamm, t2.specategorie, t2.source,
		CONVERT(CHAR(10),t2.datesource,103) AS ''DATESOURCE'',
		CAST(t2.remarques AS VARCHAR(4000)) AS ''REMARQUES'',
		CONVERT(CHAR(10),t2.dcreat,103) AS ''DCREAT'',
		CONVERT(CHAR(10),t2.dmodif,103) AS ''DMODIF'',
		CONVERT(CHAR(10),t2.drevis,103) AS ''DREVIS''
	FROM DICOT_ATC_IRIS t1, SPECIALITE t2, SPEPHARMACODYNAMIE t3
	WHERE t1.id_dicot_atc_iris = @ID_DICOT_ATC_IRIS
	AND t1.libelle = t3.atc_iris
	AND t2.id_specialite = t3.id_specialite

	-- TEST ERREUR
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret














' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_RTrim_Ora]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_RTrim_Ora]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_RTrim_Ora] ( 	
					@Source 	VARCHAR(255),
					@Car		VARCHAR(1),
					@Dest		VARCHAR(255) OUTPUT
				) AS

DECLARE @Erreur INTEGER
DECLARE @Index INTEGER

BEGIN
	SET @Erreur = 0
	
	IF @Car = '' ''
	BEGIN
		SET @Dest = RTRIM( @Source )
		IF @@ERROR != 0 GOTO SORTIE_ERR
	END
	ELSE
	BEGIN
		SET @Index = LEN(@Source)
		IF @@ERROR != 0 GOTO SORTIE_ERR

		WHILE @Index > 0 AND SUBSTRING(@Source, @Index,1) = @Car
		BEGIN
			SET @Index = @Index -1
			IF @@ERROR != 0 GOTO SORTIE_ERR
		END
		IF @Index = 0
			SET @Dest = ''''
		ELSE
			SET @Dest = SUBSTRING(@Source, 1, @Index )

		IF @@ERROR != 0 GOTO SORTIE_ERR
	END
	
END

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetATCSpes_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetATCSpes_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetATCSpes_Txt]
(
	@ID_DICOT_ATC_IRIS	VARCHAR(255)=NULL,
	@Ret			INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetATCSpes_Txt'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	-- (Re)création de la table temporaire
	SELECT
		t2.id_specialite, t2.bvalid, t2.bencours, t2.nomuser, t2.denomspe,
		t2.forme, t2.dosage, t2.complement,
		CAST(commammposo AS VARCHAR(4000)) AS ''COMMAMMPOSO'',
		t2.reserve, t2.inferieurage, t2.unitinf, t2.superieurage,
		t2.unifsup, t2.inferieurpoids, t2.superieurpoids, t2.denomamm,
		t2.numdosamm, t2.specategorie, t2.source,
		CONVERT(CHAR(10),t2.datesource,103) AS ''DATESOURCE'',
		CAST(t2.remarques AS VARCHAR(4000)) AS ''REMARQUES'',
		CONVERT(CHAR(10),t2.dcreat,103) AS ''DCREAT'',
		CONVERT(CHAR(10),t2.dmodif,103) AS ''DMODIF'',
		CONVERT(CHAR(10),t2.drevis,103) AS ''DREVIS''
	FROM DICOT_ATC_IRIS t1, SPECIALITE t2, SPEPHARMACODYNAMIE t3
	WHERE SUBSTRING(t1.libelle, 1,CASE PATINDEX(''%/%'', t1.libelle)
						WHEN 0 THEN  255
						ELSE PATINDEX(''%/%'', t1.libelle) - 2
					END) = @ID_DICOT_ATC_IRIS
	AND t1.libelle = t3.atc_iris
	AND t2.id_specialite = t3.id_specialite

	-- TEST ERREUR
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret













' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Sel_Compo]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Sel_Compo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Sel_Compo]
(
	@Param		INTEGER,
	@IDOrganisme	INTEGER,
	@ID_SPEPRESENTATIONHOP	INTEGER,
	@ID_t_sub	INTEGER,
	@Ret		INTEGER OUTPUT
) AS
-- Body
BEGIN
	-- Optimisation
	SET NOCOUNT ON

	IF @Param = 1
		SELECT
			comp.idorganisme, comp.id_spepresentationhop,
			comp.id_t_sub, t.libelle
		FROM COMPOVIDAL comp INNER JOIN T_SUB t ON t.id_t_sub = comp.id_t_sub
		WHERE comp.idorganisme = @IDOrganisme
		AND comp.id_spepresentationhop = CASE @ID_SPEPRESENTATIONHOP
							WHEN 0 THEN comp.id_spepresentationhop
							ELSE @ID_SPEPRESENTATIONHOP
						 END
		AND comp.id_t_sub = CASE @ID_t_sub
					WHEN 0 THEN comp.id_t_sub
					ELSE @ID_t_sub
				    END
	ELSE IF @Param = 2
		SELECT
			comp.idorganisme, comp.id_spepresentationhop,
			comp.id_t_subhop, t.libelle
		FROM COMPOHOP comp INNER JOIN T_SUBHOP t ON (t.id_t_subhop = comp.id_t_subhop AND t.idorganisme = comp.idorganisme)
		WHERE comp.idorganisme = @IDOrganisme
		AND comp.id_spepresentationhop = CASE @ID_SPEPRESENTATIONHOP
							WHEN 0 THEN comp.id_spepresentationhop
							ELSE @ID_SPEPRESENTATIONHOP
						 END
		AND comp.id_t_subhop = CASE @ID_t_sub
					WHEN 0 THEN comp.id_t_subhop
					ELSE @ID_t_sub
				    END

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetChild_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetChild_Id]
(
	@ID	INTEGER,
	@Typ	INTEGER,
	@Ret	INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetChild_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	IF @Typ = 2
	BEGIN
		-- CAS DES SUBSTANCES
		SELECT DISTINCT
			t1.id_t_sub,
			t1.libelle,
			t1.homeopathie,
			CAST(t1.texte AS VARCHAR(4000)) AS ''texte'',
			t1.dc,
			t1.complementindexsub,
			1 AS ''HasChild''
		FROM T_SUB t1, COUPLETERMETERME t2
		WHERE t2.id_t_sub_p = @ID
		AND   t1.id_t_sub = t2.id_t_sub_f
		ORDER BY t1.id_t_sub
	END
	ELSE IF @Typ = 3
	BEGIN
		-- CAS DES CLASSES THERAPEUTIQUES
		SELECT
			t1.id_dicocomclassiris,
			t1.dic_id_dicocomclassiris,
			LTRIM(
				CASE SUBSTRING(UPPER(t1.libelle), 1, 3)
					WHEN ''ZZ_'' THEN	CASE PATINDEX(''\'', SUBSTRING(t1.libelle, PATINDEX(''\'', t1.libelle) + 1, 255))
									WHEN 0 THEN SUBSTRING(t1.libelle, PATINDEX(''\'', t1.libelle) + 1, 255)
									ELSE SUBSTRING(t1.libelle, PATINDEX(''\'', t1.libelle) + 1, PATINDEX(''\'', SUBSTRING(t1.libelle, PATINDEX(''\'', t1.libelle) + 1, 255)) - PATINDEX(''\'', t1.libelle) - 2)
								END
					ELSE t1.libelle
				END) AS ''t1.libelle'',
			t1.ordre,
			CASE t2.id_dicocomclassiris
				WHEN NULL THEN 0
				ELSE 1
			END AS ''t2.id_dicocomclassiris''
		FROM DICOCOMCLASSIRIS t1
			LEFT OUTER JOIN DICOCOMCLASSIRIS t2
			ON t1.id_dicocomclassiris = t2.dic_id_dicocomclassiris
		WHERE t1.dic_id_dicocomclassiris = @ID
		GROUP BY
			t1.id_dicocomclassiris,
			t1.dic_id_dicocomclassiris,
			t1.libelle,
			t1.ordre,
			CASE t2.id_dicocomclassiris
				WHEN NULL THEN 0
				ELSE 1
			END
	END
	ELSE IF @Typ = 8
	BEGIN
		-- CAS DES CONTRE-INDICATIONS
		SELECT
			t1.id_t_ci, t1.libelle,
			CAST(t1.texte AS VARCHAR(4000)) AS ''t1.texte'',
			CONVERT(CHAR(10),t1.creation,103) AS ''t1.creation'',
			t1.validation,
			CAST(t1.remarques AS VARCHAR(4000)) AS ''t1.remarques'',
			CASE t2.id_t_ci_f
				WHEN NULL THEN 1
				ELSE 0
			END AS ''t2.id_t_ci_f''
		FROM T_CI t1 LEFT OUTER JOIN HIERARCHIECI_REL t2
			     ON t1.id_t_ci = t2.id_t_ci_p
		WHERE t1.id_t_ci IN (SELECT t3.id_t_ci_f
				     FROM HIERARCHIECI_REL t3
				     WHERE t3.id_t_ci_p = @ID)
	END

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret







' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Sel_Livret]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Sel_Livret]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Sel_Livret]
(
	@Param		INTEGER,
	@ID_SPEPRESENTATION	INTEGER,
	@IDOrganisme	INTEGER,
	@Prix_TTC_f	VARCHAR(10) = NULL,
	@Prix_TTC_e	VARCHAR(10) = NULL,
	@Dispo		VARCHAR(60),
	@Commentaire	VARCHAR(255),
	@CODHOPITAL		VARCHAR(30),
	@Ret		INTEGER OUTPUT
) AS
-- Body
BEGIN
	SET NOCOUNT ON

	IF @Param = 1
		SELECT
			id_spepresentation, idorganisme,
			CONVERT(VARCHAR(10), prix_ttc_f) AS ''PRIX_TTC_F'',
			CONVERT(VARCHAR(10), prix_ttc_e) AS ''PRIX_TTC_E'',
			dispo, commentaire, codhopital
		FROM LIVRETVIDAL
		WHERE id_spepresentation = ISNULL(@ID_SPEPRESENTATION, id_spepresentation)
		AND idorganisme = @IDOrganisme
		AND CONVERT(VARCHAR(10), ISNULL(prix_ttc_f, 0.0)) =  ISNULL(@Prix_TTC_f, CONVERT(VARCHAR(10), ISNULL(prix_ttc_f, 0.0)))
		AND CONVERT(VARCHAR(10), ISNULL(prix_ttc_e, 0.0)) = ISNULL(@Prix_TTC_e, CONVERT(VARCHAR(10), ISNULL(prix_ttc_e, 0.0)))
		AND UPPER(ISNULL(dispo, ''AAAAAAAA'')) LIKE UPPER(ISNULL(@Dispo, ISNULL(dispo, ''AAAAAAAA'')))
		AND UPPER(ISNULL(commentaire, ''AAAAAAAA'')) LIKE UPPER(ISNULL(@Commentaire, ISNULL(commentaire, ''AAAAAAAA'')))
		AND UPPER(ISNULL(codhopital, ''AAAAAAAA'')) LIKE UPPER(ISNULL(@CODHOPITAL, ISNULL(codhopital, ''AAAAAAAA'')))
	ELSE IF @Param = 2
		SELECT
			id_spepresentationhop, idorganisme,
			CONVERT(VARCHAR(10), prix_ttc_f) AS ''PRIX_TTC_F'',
			CONVERT(VARCHAR(10), prix_ttc_e) AS ''PRIX_TTC_E'',
			dispo, commentaire, codhopital
		FROM LIVRETHOP
		WHERE id_spepresentationhop = ISNULL(@ID_SPEPRESENTATION, id_spepresentationhop)
		AND idorganisme = @IDOrganisme
		AND CONVERT(VARCHAR(10), ISNULL(prix_ttc_f, 0.0)) = ISNULL(@Prix_TTC_f, CONVERT(VARCHAR(10), ISNULL(prix_ttc_f, 0.0)))
		AND CONVERT(VARCHAR(10), ISNULL(prix_ttc_e, 0.0)) = ISNULL(@Prix_TTC_e, CONVERT(VARCHAR(10), ISNULL(prix_ttc_e, 0.0)))
		AND UPPER(ISNULL(dispo, ''AAAAAAAA'')) LIKE UPPER(ISNULL(@Dispo, ISNULL(dispo, ''AAAAAAAA'')))
		AND UPPER(ISNULL(commentaire, ''AAAAAAAA'')) LIKE UPPER(ISNULL(@Commentaire, ISNULL(commentaire, ''AAAAAAAA'')))
		AND UPPER(ISNULL(codhopital, ''AAAAAAAA'')) LIKE UPPER(ISNULL(@CODHOPITAL, ISNULL(codhopital, ''AAAAAAAA'')))

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCIM10CIndics_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCIM10CIndics_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCIM10CIndics_Txt](@libelle    varchar(100)=null,                                      
			         @Ret INTEGER OUTPUT
				) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER

-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCIM10CIndics_Txt'')

--STATS


	SET NOCOUNT  ON

	-- INITIALISATION VARIABLE D''ERREUR
	SET @Erreur = 0

	-- DEFINITION DU CURSEUR DE SORTIE
        SELECT DISTINCT a.Id_T_CI ,a.Libelle, 
		CAST(a.TEXTE AS VARCHAR(4000)) Texte, CONVERT(char(10), a.Creation, 103) creation, Validation,
		CAST(Remarques AS VARCHAR(4000)) Remarques, CASE e.ID_T_CI_F
						  WHEN NULL THEN 0
						  ELSE 1
						  END HasChild
        FROM  HIERARCHIECI_REL e RIGHT OUTER JOIN T_CI a ON  e.ID_T_CI_P = a.ID_T_CI	
			         INNER JOIN T_CI_CIMCI_Rel b ON b.id_T_CI = a.id_T_CI 
                                 INNER JOIN  CimCI c ON c.id_CimCI = b.id_CimCI 		
			         INNER JOIN  DicoRF_CIM d ON c.codeCim = d.libelle			
	WHERE  UPPER(d.LIBELLE) like UPPER(@libelle)
	ORDER BY a.Id_T_CI

	-- CONTROLE DEFINITION
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

--- CHARGEMENT ERREUR DANS RET
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret







' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Sel_SpePresentationHop]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Sel_SpePresentationHop]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Sel_SpePresentationHop]
(	@IDOrganisme	INTEGER,
	@ID_SPEPRESENTATIONHOP	INTEGER = 0,
	@Nom		VARCHAR(50) = NULL,
	@Presentation	VARCHAR(50) = NULL,
	@Forme		VARCHAR(50) = NULL,
	@Dosage		VARCHAR(50) = NULL,
	@CIP		VARCHAR(7) = NULL,
	@UCD		VARCHAR(7) = NULL,
	@Labo		VARCHAR(60) = NULL,
	@CodHop		VARCHAR(30) = NULL,
	@Prix_TTC_f	VARCHAR(10) = NULL,
	@Prix_TTC_e	VARCHAR(10) = NULL,
	@Dispo		VARCHAR(60) = NULL,
	@Commentaire	VARCHAR(255) = NULL,
	@Ret		INTEGER OUTPUT
) AS
BEGIN
	SET NOCOUNT ON

	-- Pour interaction avec équipe Web
	IF @Nom = ''''
		SET @Nom = ''%''
	IF @Prix_TTC_f = ''''
		SET @Prix_TTC_f = ''0''
	IF @Prix_TTC_e = ''''
		SET @Prix_TTC_e = ''0''

	SELECT
		shop.idorganisme, shop.id_spepresentationhop, shop.nom,
		shop.presentation, shop.forme, shop.dosage, shop.cip, shop.ucd,
		shop.labo, liv.codhopital,
		CONVERT(VARCHAR(10), liv.prix_ttc_f) AS ''PRIX_TTC_F'',
		CONVERT(VARCHAR(10), liv.prix_ttc_e) AS ''PRIX_TTC_E'',
		liv.dispo, liv.commentaire
	FROM SPEPRESENTATIONHOP shop INNER JOIN LIVRETHOP liv ON (liv.idorganisme = shop.idorganisme AND liv.id_spepresentationhop = shop.id_spepresentationhop)
	WHERE shop.idorganisme = @IDOrganisme
	AND shop.id_spepresentationhop = CASE @ID_SPEPRESENTATIONHOP
						WHEN 0 THEN shop.id_spepresentationhop
						WHEN NULL THEN shop.id_spepresentationhop
						ELSE @ID_SPEPRESENTATIONHOP
					END
	AND UPPER(shop.nom) LIKE UPPER(ISNULL(@Nom, shop.nom))
	AND UPPER(ISNULL(shop.presentation, ''AAAAAAAA'')) LIKE UPPER(ISNULL(@Presentation, ISNULL(shop.presentation, ''AAAAAAAA'')))
	AND UPPER(ISNULL(shop.forme, ''AAAAAAAA'')) LIKE UPPER(ISNULL(@Forme, ISNULL(shop.forme, ''AAAAAAAA'')))
	AND UPPER(ISNULL(shop.dosage, ''AAAAAAAA'')) LIKE UPPER(ISNULL(@Dosage, ISNULL(shop.dosage, ''AAAAAAAA'')))
	AND UPPER(ISNULL(shop.cip, ''AAAAAAAA'')) LIKE UPPER(ISNULL(@CIP, ISNULL(shop.cip, ''AAAAAAAA'')))
	AND UPPER(ISNULL(shop.ucd, ''AAAAAAAA'')) LIKE UPPER(ISNULL(@UCD, ISNULL(shop.ucd, ''AAAAAAAA'')))
	AND UPPER(ISNULL(shop.labo, ''AAAAAAAA'')) LIKE UPPER(ISNULL(@Labo, ISNULL(shop.labo, ''AAAAAAAA'')))
	AND UPPER(ISNULL(liv.codhopital, ''AAAAAAAA'')) LIKE UPPER(ISNULL(@CodHop, ISNULL(liv.codhopital, ''AAAAAAAA'')))
	AND CONVERT(VARCHAR(10), ISNULL(liv.prix_ttc_f, 0)) = ISNULL(@Prix_TTC_f, CONVERT(VARCHAR(10), ISNULL(liv.prix_ttc_f, 0)))
	AND CONVERT(VARCHAR(10), ISNULL(liv.prix_ttc_e, 0)) = ISNULL(@Prix_TTC_e, CONVERT(VARCHAR(10), ISNULL(liv.prix_ttc_e, 0)))
	AND UPPER(ISNULL(liv.dispo, ''AAAAAAAA'')) LIKE UPPER(ISNULL(@Dispo, ISNULL(liv.dispo, ''AAAAAAAA'')))
	AND UPPER(ISNULL(liv.commentaire, ''AAAAAAAA'')) LIKE UPPER(ISNULL(@Commentaire, ISNULL(liv.commentaire, ''AAAAAAAA'')))

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret













' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCIM10SPs_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCIM10SPs_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCIM10SPs_Txt]( @Libelle  varchar(100)=null,                                      
				                 @Ret INTEGER OUTPUT
				) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER

-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCIM10SPs_Txt'')

--STATS


	SET NOCOUNT  ON

	-- INITIALISATION VARIABLE D''ERREUR
	SET @Erreur = 0

	-- DEFINITION CHAINE SQL DE SORTIE
            SELECT DISTINCT d.id_groupindic, d.LIBELLE, d.TYPE TYPE_
            FROM  DICORF_CIM a  INNER JOIN groupindic_DICORF_CIM_REL b ON  a.ID_DICORF_CIM = b.ID_DICORF_CIM
			        --  INNER JOIN RECHINDICCIM_REL b
                                                -- ON  b.ID_CIMTERMRECHINDIC = a.ID_DICORF_CIM
                                                --   INNER JOIN TERMERECHGROUPINDIC_REL c
			        --   ON c.ID_TERMERECHINDIC = b.ID_TERMERECHINDIC
			           INNER JOIN  GROUPINDIC d 
                                                   ON  d.ID_GROUPINDIC = b.ID_GROUPINDIC
	WHERE  UPPER(a.LIBELLE) like UPPER(@Libelle)
    			
	-- CONTROLE DEFINITION
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

--- CHARGEMENT ERREUR DANS RET
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret














' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Sel_SUBHOP]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Sel_SUBHOP]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Sel_SUBHOP]
(
	@IDOrganisme	INTEGER,
	@ID_t_subhop	INTEGER = 0,
	@Libelle	VARCHAR(50) = NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Body
BEGIN
	SET NOCOUNT ON

	SELECT
		idorganisme, id_t_subhop, libelle
	FROM T_SUBHOP
	WHERE idorganisme = @IDOrganisme
	AND id_t_subhop = CASE @ID_t_subhop
				WHEN 0 THEN id_t_subhop
				WHEN NULL THEN id_t_subhop
				ELSE @ID_t_subhop
			  END
	AND UPPER(ISNULL(libelle, ''AAAAAAAA'')) LIKE UPPER(ISNULL(@Libelle, ISNULL(libelle, ''AAAAAAAA'')))

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret











' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Trans_Upper_Table]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Trans_Upper_Table]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Trans_Upper_Table] (
						@NomTable VARCHAR(30),
						@Colonne     VARCHAR(30),
						@Terme	VARCHAR(60),
						@SqlOrder	VARCHAR(100) OUTPUT
					       ) AS
--DEFINITION DES VARIABLES LOCALES
DECLARE @Erreur INTEGER
DECLARE @Sql VARCHAR(1000)
DECLARE @Id INTEGER
DECLARE @Libelle1 VARCHAR(255)
DECLARE @Libelle2 VARCHAR(255)
DECLARE @Terme1 VARCHAR(1)
DECLARE @Where VARCHAR(1024)

--BODY
BEGIN
	SET NOCOUNT  ON

	-- INITIALISATION Code Erreur Proc
	SET @Erreur =0

	IF NOT EXISTS( SELECT 1 FROM sysobjects WHERE NAME = @NomTable AND TYPE = ''U'' )
		GOTO SORTIE


	IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME =''##Tmp_TransT''  AND TYPE = ''U'')
	BEGIN
		DROP TABLE ##Tmp_TransT
	END	

	CREATE TABLE ##Tmp_TransT( LIBELLE VARCHAR(255) )

	SET @Terme1 = SUBSTRING(@Terme,1,1)

	SET @Where = ''  WHERE (( '''''' +	@Terme1 +	''''''= ''''%'''' ) ''
	SET @Where = @Where +	''OR (( UNICODE( UPPER(SUBSTRING(''+ @Colonne + '',1,1)) )  BETWEEN 192 AND 197 )	AND '''''' + @Terme1 +	''''''= ''''A'''' 	)''
	SET @Where = @Where +	''OR (( UNICODE( UPPER(SUBSTRING(''+ @Colonne +'',1,1)) )  BETWEEN 198 AND 203 )	AND '''''' + @Terme1 +	''''''= ''''E'''' 	)''
	SET @Where = @Where +	''OR (( UNICODE( UPPER(SUBSTRING(''+ @Colonne +'',1,1)) )  BETWEEN 202 AND 207 )	AND '''''' + @Terme1 +	''''''= ''''I'''' 	)''
	SET @Where = @Where +	''OR (( UNICODE( UPPER(SUBSTRING(''+ @Colonne +'',1,1)) )  BETWEEN 208 AND 214 )	AND '''''' + @Terme1 +	''''''= ''''O'''' 	)''
	SET @Where = @Where +	''OR (( UNICODE( UPPER(SUBSTRING(''+ @Colonne +'',1,1)) )  BETWEEN 215 AND 220 )	AND '''''' + @Terme1 +	''''''= ''''U'''' 	)''
	SET @Where = @Where +	''OR (( UNICODE( UPPER(SUBSTRING(''+ @Colonne +'',1,1)) ) = 199 )			AND '''''' + @Terme1 +	''''''= ''''C'''' 	)''
	SET @Where = @Where +	''OR (( UNICODE( UPPER(SUBSTRING(''+ @Colonne +'',1,1)) ) IN( 63,221,376) )		AND '''''' + @Terme1 +	''''''= ''''Y'''' 	)''
	SET @Where = @Where +	''OR( UPPER(''+ @Colonne +'')  LIKE '''''' + @Terme1 +''%''''  ))''


	SET @Sql = ''DECLARE Curseur CURSOR FOR SELECT '' + @Colonne + '' FROM ''+ @NomTable + @Where
	EXEC (@Sql)


	OPEN Curseur
	IF @@ERROR != 0 GOTO SORTIE_ERR

	FETCH Curseur INTO @Libelle1
	IF @@ERROR != 0 GOTO SORTIE_ERR

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET 

		EXEC @Erreur = p_Translate_Upper @Libelle1, @Libelle2 OUTPUT
		IF @Erreur != 0 GOTO SORTIE_ERR
	
		IF @Libelle2 LIKE @Terme
		BEGIN
			BEGIN TRANSACTION
			INSERT INTO ##Tmp_TransT VALUES( @Libelle1 )
		
			IF @@ERROR != 0
			BEGIN
				ROLLBACK TRANSACTION
				GOTO SORTIE_ERR
			END
			COMMIT TRANSACTION
		END

		FETCH Curseur INTO @Libelle1
	END

	SET @SqlOrder = '' SELECT LIBELLE FROM ##Tmp_TransT ''

	CLOSE Curseur
	DEALLOCATE Curseur

END

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	IF CURSOR_STATUS(''local'',''Curseur'') > = 0
	BEGIN
		CLOSE Curseur
		DEALLOCATE Curseur
	END
	RETURN @Erreur

	









































' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Translate_Upper]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Translate_Upper]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Translate_Upper]( 
					@Chaine VARCHAR(255)=null ,
					@Result VARCHAR(255) output
				     ) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER
DECLARE @i AS INTEGER
DECLARE @UChaine AS VARCHAR(255)
DECLARE @Car AS CHAR(1)
DECLARE @Code_Car AS INTEGER

-- BODY PROC
BEGIN
	SET NOCOUNT  ON


	-- INITIALISATION VARIABLE D''ERREUR
	SET @Erreur = 0

	-- PREPARATION CHAINE A TRAITER
	SET @UChaine = UPPER(LTRIM(RTRIM(@Chaine)))
	-- CONTROLE 
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- TAILLE DE LA CHAINE A TRAITER
	SET @i = Len(@UChaine)
	-- CONTROLE 
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PREPARATION CHAINE DE SORTIE
	SET @Result =UPPER(@Chaine)
	-- CONTROLE 
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PARCOURS DE LA CHAINE
	WHILE @i > 0
	BEGIN
		SET @Car =  SUBSTRING(@UChaine, @i,1)
		-- CONTROLE 
		IF @@ERROR != 0
			GOTO SORTIE_ERR

		SET @Code_Car = UNICODE(@Car)
		-- CONTROLE 
		IF @@ERROR != 0
			GOTO SORTIE_ERR
	
		SELECT @Result =
		CASE
			WHEN @Code_Car BETWEEN 192 AND 197 THEN REPLACE( @Result, @Car, ''A'')
			WHEN @Code_Car BETWEEN 198 AND 203 THEN REPLACE( @Result, @Car, ''E'')
			WHEN @Code_Car BETWEEN 202 AND 207 THEN REPLACE( @Result, @Car, ''I'')
			WHEN @Code_Car BETWEEN 208 AND 214 THEN REPLACE( @Result, @Car, ''O'')
			WHEN @Code_Car BETWEEN 215 AND 220 THEN REPLACE( @Result, @Car, ''U'')
			WHEN @Code_Car IN( 63,221,376) THEN REPLACE( @Result, @Car, ''Y'')
			WHEN @Code_Car = 199 THEN REPLACE( @Result, @Car, ''C'')
			ELSE @Result
		END
		-- CONTROLE 
		IF @@ERROR != 0
			GOTO SORTIE_ERR

		SET @i = @i-1
		-- CONTROLE 
		IF @@ERROR != 0
			GOTO SORTIE_ERR
	END


END

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	SET @Erreur = @@ERROR
	RETURN @Erreur











' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Trans_Upper_Table_ListeId]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Trans_Upper_Table_ListeId]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Trans_Upper_Table_ListeId](	@NomTable VARCHAR(30),
							@Colonne VARCHAR(30),
							@ColId VARCHAR(30),
							@Terme VARCHAR(100),
							@ListeId VARCHAR(1000) OUTPUT
						       ) AS 

--DEFINITION DES VARIABLES LOCALES
DECLARE @Erreur INTEGER
DECLARE @Libelle1 VARCHAR(255)
DECLARE @Libelle2 VARCHAR(255)
DECLARE @Id INTEGER
DECLARE @Sql VARCHAR(1024)
DECLARE @Where VARCHAR(1024)
DECLARE @Terme1 VARCHAR(1)
DECLARE @Req VARCHAR(1024)
DECLARE @Time varchar(25)
DECLARE @TmpTrans varchar(25)

--BODY
BEGIN
	SET NOCOUNT  ON

	-- INITIALISATION Code Erreur Proc
	SET @Erreur =0

	IF NOT EXISTS( SELECT 1 FROM sysobjects  WHERE NAME = @NomTable AND TYPE = ''U'' )
		GOTO SORTIE

	SET @Req = ''''
             SET @Time = replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET @TmpTrans = ''Tmp_TransL'' +@Time
	IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME =''##''+@TmpTrans AND TYPE = ''U'')
	BEGIN
		SET @Req = ''DROP TABLE ##'' +@TmpTrans
                           EXEC(@Req)
	END	
	SET @Req =  ''CREATE TABLE ##'' +@TmpTrans+ '' ( IDENT INTEGER, LIBELLE VARCHAR(255) )''
                           EXEC(@Req)

	SET @Terme1 = SUBSTRING(@Terme,1,1)

	SET @Where = ''  WHERE (( '''''' +	@Terme1 +	''''''= ''''%'''' ) ''
	SET @Where = @Where +	''OR (( UNICODE( UPPER(SUBSTRING(''+ @Colonne + '',1,1)) )  BETWEEN 192 AND 197 )	AND '''''' + @Terme1 +	''''''= ''''A'''' 	)''
	SET @Where = @Where +	''OR (( UNICODE( UPPER(SUBSTRING(''+ @Colonne +'',1,1)) )  BETWEEN 198 AND 203 )	AND '''''' + @Terme1 +	''''''= ''''E'''' 	)''
	SET @Where = @Where +	''OR (( UNICODE( UPPER(SUBSTRING(''+ @Colonne +'',1,1)) )  BETWEEN 202 AND 207 )	AND '''''' + @Terme1 +	''''''= ''''I'''' 	)''
	SET @Where = @Where +	''OR (( UNICODE( UPPER(SUBSTRING(''+ @Colonne +'',1,1)) )  BETWEEN 208 AND 214 )	AND '''''' + @Terme1 +	''''''= ''''O'''' 	)''
	SET @Where = @Where +	''OR (( UNICODE( UPPER(SUBSTRING(''+ @Colonne +'',1,1)) )  BETWEEN 215 AND 220 )	AND '''''' + @Terme1 +	''''''= ''''U'''' 	)''
	SET @Where = @Where +	''OR (( UNICODE( UPPER(SUBSTRING(''+ @Colonne +'',1,1)) ) = 199 )			AND '''''' + @Terme1 +	''''''= ''''C'''' 	)''
	SET @Where = @Where +	''OR (( UNICODE( UPPER(SUBSTRING(''+ @Colonne +'',1,1)) ) IN( 63,221,376) )		AND '''''' + @Terme1 +	''''''= ''''Y'''' 	)''
	SET @Where = @Where +	''OR( UPPER(''+ @Colonne +'')  LIKE '''''' + @Terme1 +''%''''  ))''


	SET @Sql = ''DECLARE Curseur CURSOR FOR SELECT '' + @ColId +'','' + @Colonne  + '' FROM ''+ @NomTable + @Where

	EXEC (@Sql)


	SET @ListeId = ''''

	OPEN Curseur
	FETCH Curseur INTO @Id, @Libelle1
	WHILE @@FETCH_STATUS = 0
	BEGIN	
		EXEC @Erreur = p_Translate_Upper @Libelle1, @Libelle2 OUTPUT

		IF @Libelle2 LIKE @Terme+''%''
		BEGIN
			IF @ListeId = ''''		 SET @ListeId = CAST( @Id AS VARCHAR(10))   
			ELSE			 SET @ListeId = @ListeId + '','' + CAST( @Id AS VARCHAR(10))   
		END

		FETCH Curseur INTO @Id, @Libelle1

	END

	CLOSE Curseur
	DEALLOCATE Curseur
                        
	SET @Req = ''DROP TABLE ##'' +@TmpTrans  
	EXEC(@Req)	
END

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur

	

















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[PopLivret_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PopLivret_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[PopLivret_Id]
--(
	--@Ret		INTEGER OUTPUT
--) 
AS
-- Déclarations variables locales
DECLARE @Curs_Tmp	CURSOR
DECLARE @ErreurCode	VARCHAR(10)

DECLARE @varIDOrg	INTEGER
DECLARE @varIDSPres	INTEGER
DECLARE @varNom		VARCHAR(50)
DECLARE @varPres	VARCHAR(50)
DECLARE @varForme	VARCHAR(50)
DECLARE @varDos		VARCHAR(50)
DECLARE @varCIP		VARCHAR(7)
DECLARE @varUCD		VARCHAR(7)
DECLARE @varLabo	VARCHAR(60)
DECLARE @varPrixF	FLOAT
DECLARE @varPrixE	FLOAT
DECLARE @varDispo	VARCHAR(60)
DECLARE @varComment	VARCHAR(255)
DECLARE @varCodHop	VARCHAR(30)
DECLARE @Req              varchar(4000)
DECLARE @time              varchar(20)
DECLARE @TPOPLIV1	  varchar(30)
DECLARE @TPOPLIV2	  varchar(30)
DECLARE  @id_spepresentationhop varchar(30)
--Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''PopLivret_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	-- Vidage des tables qui seront utilisées pour l''importation de datas
	DELETE FROM LIVRETHOP WHERE EXISTS(SELECT NULL FROM TAMPON WHERE idorganisme = LIVRETHOP.idorganisme)
	DELETE FROM LIVRETVIDAL WHERE EXISTS(SELECT NULL FROM TAMPON WHERE idorganisme = LIVRETVIDAL.idorganisme)
	DELETE FROM COMPOHOP WHERE EXISTS(SELECT NULL FROM TAMPON WHERE idorganisme = COMPOHOP.idorganisme)
	DELETE FROM COMPOVIDAL WHERE EXISTS(SELECT NULL FROM TAMPON WHERE idorganisme = COMPOVIDAL.idorganisme)
	DELETE FROM SPEPRESENTATIONHOP WHERE EXISTS(SELECT NULL FROM TAMPON WHERE idorganisme = SPEPRESENTATIONHOP.idorganisme)
	DELETE FROM LIVRETLOG

	/*===== IMPORTATION DES DATAS =====*/
--=======================================================================================================================
--			SPEPRESENTATIONHOP et LIVRETHOP
--=======================================================================================================================
	-- Suppression éventuelle d''une version précédente de la table temporaire mémoire à utiliser
             SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET   @TPOPLIV1 = ''TMP_PopLivret1'' +@time

	SET @REQ = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TPOPLIV1+''''''  AND TYPE = ''''U'''')
	DROP TABLE ##''+@TPOPLIV1
	EXEC(@REQ)


	-- (Re)création de la table temporaire
	SET @REQ =''SELECT *
	INTO ##''+@TPOPLIV1+''
	FROM TAMPON t
	WHERE EXISTS(SELECT NULL FROM TAMPON WHERE idorganisme = t.idorganisme)
	AND NOT EXISTS(SELECT NULL from  SPEPRESENTATION WHERE cip = t.cip) ''
	EXEC ( @REQ)

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	IF CURSOR_STATUS(''variable'', ''Curs_Tmp'') < 0	-- une valeur positive ou nulle indique un curseur ouvert
	BEGIN
		CLOSE Curs_Tmp
		DEALLOCATE Curs_Tmp
	END

	SET  @REQ = ''DECLARE Curs_Tmp CURSOR FOR SELECT
			idorganisme, nom, presentation, forme, dosage, cip, ucd, labo,
			prix_ttc_f, prix_ttc_e, dispo, commentaire, codhopital
		FROM ##''+@TPOPLIV1
	EXEC ( @REQ)


	--FOR READ ONLY
	IF @@ERROR != 0
	BEGIN
		DEALLOCATE Curs_Tmp
		GOTO SORTIE_ERR
	END

	OPEN Curs_Tmp

	FETCH Curs_Tmp INTO
		@varIDOrg, @varNom, @varPres, @varForme, @varDos, @varCIP, @varUCD, @varLabo,
		@varPrixF, @varPrixE, @varDispo, @varComment, @varCodHop
	WHILE @@FETCH_STATUS = 0    -- indique qu''un tuple a été trouvé
	BEGIN
		BEGIN TRANSACTION
			-- IMPORT POUR SPEPRESENTATIONHOP
			INSERT INTO SPEPRESENTATIONHOP(idorganisme, nom, presentation, forme, dosage, cip, ucd, labo)
				VALUES(@varIDOrg, @varNom, @varPres, @varForme, @varDos, @varCIP, @varUCD, @varLabo)
			SET @id_spepresentationhop = @@identity
						
			IF @@ERROR != 0
			BEGIN
				ROLLBACK TRANSACTION
				INSERT INTO LIVRETLOG(cip, nom, codeerreur, texteerreur)
					VALUES(@varCIP, @varNom, @@ERROR, NULL)
			END

			-- IMPORT POUR LIVRETHOP
			INSERT INTO LIVRETHOP(idorganisme, id_spepresentationhop, prix_ttc_f, prix_ttc_e, dispo, commentaire, codhopital)
				VALUES(@varIDOrg,  @id_spepresentationhop, @varPrixF, @varPrixE, @varDispo, @varComment, @varCodHop)
			
			IF @@ERROR != 0
			BEGIN

				ROLLBACK TRANSACTION
				INSERT INTO LIVRETLOG(cip, nom, codeerreur, texteerreur)
					VALUES(@varCIP, @varNom, @@ERROR, NULL)
			END
		COMMIT TRANSACTION

		-- Recherche du tuple suivant
		FETCH Curs_Tmp INTO
			@varIDOrg, @varNom, @varPres, @varForme, @varDos, @varCIP, @varUCD, @varLabo,
			@varPrixF, @varPrixE, @varDispo, @varComment, @varCodHop
	END

	-- Libération de la mémoire du curseur temporaire pour pouvoir le réutiliser par la suite
	IF CURSOR_STATUS(''variable'', ''Curs_Tmp'') >= 0	-- une valeur positive ou nulle indique un curseur ouvert
	BEGIN
		CLOSE Curs_Tmp
		DEALLOCATE Curs_Tmp
	END
-- Fin de l''importation des tables SPEPRESENTATIONHOP et LIVRETHOP


--=======================================================================================================================
--			LIVRETVIDAL
--=======================================================================================================================
	-- Suppression éventuelle d''une version précédente de la table temporaire mémoire à utiliser
             SET   @TPOPLIV2 = ''TMP_PopLivret2'' +@time

	SET @REQ = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TPOPLIV2+''''''  AND TYPE = ''''U'''')
	DROP TABLE ##''+@TPOPLIV2
	EXEC(@REQ)	



	-- (Re)création de la table temporaire
	SET @REQ ='' SELECT
		t.idorganisme,
		s.id_spepresentation,
		t.nom,
		t.ucd,
		t.prix_ttc_f,
		t.prix_ttc_e,
		t.dispo,
		t.commentaire,
		t.cip,
		t.codhopital
	INTO ##''+@TPOPLIV2+''
	FROM SPEPRESENTATION s, TAMPON t
	WHERE s.cip = t.cip''
	EXEC(@REQ)	

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	IF CURSOR_STATUS(''variable'', ''Curs_Tmp2'') < 0	-- une valeur positive ou nulle indique un curseur ouvert
	BEGIN
		CLOSE Curs_Tmp2
		DEALLOCATE Curs_Tmp2
	END

	SET  @REQ = ''DECLARE Curs_Tmp2 CURSOR FOR 
			SELECT
			idorganisme, id_spepresentation, nom, ucd, prix_ttc_f,
			prix_ttc_e, dispo, commentaire, cip, codhopital
		FROM ##''+@TPOPLIV2
	EXEC(@REQ)


	--FOR READ ONLY
	IF @@ERROR != 0
	BEGIN
		DEALLOCATE Curs_Tmp2
		CLOSE Curs_Tmp
		DEALLOCATE Curs_Tmp
		GOTO SORTIE_ERR
	END

	OPEN Curs_Tmp2

	FETCH Curs_Tmp2 INTO
		@varIDOrg, @varIDSPres, @varNom, @varUCD, @varPrixF,
		@varPrixE, @varDispo, @varComment, @varCIP, @varCodHop
	WHILE @@FETCH_STATUS = 0    -- indique qu''un tuple a été trouvé
	BEGIN
		BEGIN TRANSACTION
			-- IMPORT POUR LIVRETVIDAL
			INSERT INTO LIVRETVIDAL(idorganisme, id_spepresentation, prix_ttc_f,prix_ttc_e,
						dispo, commentaire, denom_hop, ucd_hop, codhopital)
				VALUES(@varIDOrg, @varIDSPres, @varPrixF,@varPrixE,
					@varDispo, @varComment, @varNom, @varUCD, @varCodHop)
		
			IF @@ERROR != 0
			BEGIN
				ROLLBACK TRANSACTION
				INSERT INTO LIVRETLOG(cip, nom, codeerreur, texteerreur)
					VALUES(@varCIP, @varNom, @@ERROR, NULL)
			END
		COMMIT TRANSACTION

		-- Recherche du tuple suivant
		FETCH Curs_Tmp2 INTO
			@varIDOrg, @varIDSPres, @varNom, @varUCD, @varPrixF,
			@varPrixE, @varDispo, @varComment, @varCIP, @varCodHop
	END

	-- Libération de la mémoire du curseur temporaire
	IF CURSOR_STATUS(''variable'', ''Curs_Tmp2'') >= 0	-- une valeur positive ou nulle indique un curseur ouvert
	BEGIN
		CLOSE Curs_Tmp2
		DEALLOCATE Curs_Tmp2
	END
-- Fin de l''importation de la table LIVRETVIDAL

	-- Vidage de la table TAMPON qui reservira lors de l''import
	DELETE FROM TAMPON
	IF @@ERROR != 0
	BEGIN
		INSERT INTO LIVRETLOG(cip, nom, codeerreur, texteerreur)
			VALUES('''', '''', @@ERROR, NULL)
	END

	IF @@ERROR != 0
	BEGIN
		IF CURSOR_STATUS(''variable'', ''Curs_Tmp2'') >= 0	-- une valeur positive ou nulle indique un curseur ouvert
		BEGIN

			CLOSE Curs_Tmp2
			DEALLOCATE Curs_Tmp2
			GOTO SORTIE_ERR
		END

		IF CURSOR_STATUS(''variable'', ''Curs_Tmp'') >= 0	-- une valeur positive ou nulle indique un curseur ouvert
		BEGIN

			CLOSE Curs_Tmp
			DEALLOCATE Curs_Tmp
			GOTO SORTIE_ERR
		END
	END
	ELSE
	BEGIN
		IF CURSOR_STATUS(''variable'', ''Curs_Tmp2'') >= 0	-- une valeur positive ou nulle indique un curseur ouvert
		BEGIN
			CLOSE Curs_Tmp2

			DEALLOCATE Curs_Tmp2
			GOTO SORTIE
		END

		IF CURSOR_STATUS(''variable'', ''Curs_Tmp'') >= 0	-- une valeur positive ou nulle indique un curseur ouvert
		BEGIN
			CLOSE Curs_Tmp
			DEALLOCATE Curs_Tmp
			GOTO SORTIE
		END
		--SET @Ret = 0
	END
	
	--SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	--SET @Ret = @@ERROR

SORTIE:
	--RETURN @Ret





















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Verifier_Parentheses]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Verifier_Parentheses]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- ---------------------------------------
             -- Compteur de parenthese
             -- Cette partie de traitement equilibre le nombre de
             -- parenthese droite et gauche
             -- ---------------------------------------
CREATE PROCEDURE [dbo].[p_Verifier_Parentheses]( 
							@Source VARCHAR(255),
							@Dest VARCHAR(255) OUTPUT
						) AS
DECLARE @Erreur INTEGER
DECLARE @Taille INTEGER
DECLARE @Index INTEGER
DECLARE @Cpt INTEGER

BEGIN
	-- Initialisation 
	SET @Erreur = 0

	SET @Cpt = 0
	IF @@ERROR != 0 GOTO SORTIE_ERR

	SET @Index = 1
	IF @@ERROR != 0 GOTO SORTIE_ERR

	SET @Taille = LEN(@Source)
	IF @@ERROR != 0 GOTO SORTIE_ERR

	WHILE @Index <= @Taille
	BEGIN
		IF SUBSTRING(@Source, @Index, 1 ) = ''(''
		BEGIN
			SET @Cpt = @Cpt + 1
			IF @@ERROR != 0 GOTO SORTIE_ERR
		END
		ELSE IF SUBSTRING(@Source, @Index, 1 ) = '')'' 
		BEGIN
			SET @Cpt = @Cpt -1
			IF @@ERROR != 0 GOTO SORTIE_ERR
		END
		IF @@ERROR != 0 GOTO SORTIE_ERR

		SET @Index = @Index+1
		IF @@ERROR != 0 GOTO SORTIE_ERR
	END

	IF @Cpt < 0
		SET @Dest = REPLICATE(''('', ABS(@Cpt) ) + @Source
	ELSE IF @Cpt > 0
		SET @Dest =  @Source + REPLICATE('')'', ABS(@Cpt) ) 
	ELSE
		SET @Dest = @Source
		
	IF @@ERROR != 0 GOTO SORTIE_ERR
END

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur










' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RGetCIndics_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RGetCIndics_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RGetCIndics_Txt]
(
	@Libelle	VARCHAR(100)=NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER
DECLARE @REQ	VARCHAR(4000)


-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RGetCIndics_Txt'')

--STATS



	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON


	EXEC @Erreur = p_Translate_Upper @Libelle, @Result = @Libelle OUTPUT
	IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR

	-- Initialisation du curseur temporaire
	--SET @Curs_Tmp = CURSOR FOR
		SET @REQ = ''
			SELECT
			t1.id_t_ci, t1.libelle, CAST(t1.texte AS VARCHAR(3000)) texte,
			CONVERT(CHAR(10),t1.creation,103) creation,
			t1.validation, CAST(t1.remarques AS VARCHAR(3000)) remarques,
			CASE t2.id_t_ci_f
				WHEN NULL THEN 0
				ELSE 1 
			END ''''HasChild''''
		FROM T_CI t1 LEFT OUTER JOIN HIERARCHIECI_REL t2
				ON t1.id_t_ci = t2.id_t_ci_p
			WHERE REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(CASE PATINDEX(''''%=%'''', t1.libelle)
					WHEN 0 THEN  t1.libelle
					ELSE SUBSTRING( t1.libelle,1,PATINDEX(''''%=%'''', t1.libelle)-2)
				      END)	
			,''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')
			,''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')
			,''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')
			,''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')
			,''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')
			,''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')
			,''''Ç'''',''''C'''')
			,''''Ñ'''',''''N'''')
                                        LIKE ''''''+@Libelle+''''''
		UNION

		SELECT
			t1.id_t_ci, t3.libelle + '''' ='''' + t1.libelle ,
			CAST(t1.texte AS VARCHAR(3000)) texte,
			CONVERT(CHAR(10),t1.creation,103) creation,
			t1.validation, CAST(t1.remarques AS VARCHAR(3000)) remarques,
			CASE t2.id_t_ci_f
				WHEN NULL THEN 0
				ELSE 1
			END AS ''''HasChild''''
		FROM T_SYNONYCI t3, SYNONYCI_REL t4,
			T_CI t1 LEFT OUTER JOIN HIERARCHIECI_REL t2
			ON t1.id_t_ci = t2.id_t_ci_p
		WHERE t4.id_t_synonyci = t3.id_t_synonyci
		AND t1.id_t_ci = t4.id_t_ci
		AND
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(CASE PATINDEX(''''%=%'''', t3.libelle)
					WHEN 0 THEN  t3.libelle
					ELSE SUBSTRING( t3.libelle,1,PATINDEX(''''%=%'''', t3.libelle)-2)
				      END)	
			,''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')
			,''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')
			,''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')
			,''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')
			,''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')
			,''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')
			,''''Ç'''',''''C'''')
			,''''Ñ'''',''''N'''')
                                        LIKE ''''''+@Libelle+''''''
		ORDER BY 2''

	EXEC(@REQ)
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:


	RETURN @Ret









' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_Get_Type]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_Get_Type]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- -------------------------------------------------------------------------
  -- Fonction     : RMC_Get_Type
  -- Objet        : Obtenir l''identifiant type à partir de la constante de
  --                représentation
  -- --------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[RMC_Get_Type]( 
						@Typ_Lib VARCHAR(10) ,
						@Type_Id INTEGER OUTPUT
				            ) AS 

-- DEFINITION DES VARIABLES LOCALES
SET NOCOUNT ON

SET @Type_Id = CASE @Typ_Lib
			WHEN ''CIP''		THEN 	1
			WHEN ''SPE''		THEN 	2
			WHEN ''SUB''		THEN 	3
			WHEN ''INDIC''		THEN 	4
			WHEN ''GINDIC''		THEN 	5
			WHEN ''CINDIC''		THEN 	6
			WHEN ''THERA''		THEN 	7
			WHEN ''CIM''		THEN 	8
			WHEN ''LABO''		THEN 	9
			WHEN ''IAM''		THEN 	10
			WHEN ''DIAG''		THEN 	11
			ELSE				0
	END

RETURN @@ERROR

	








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCipGen_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipGen_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[GetCipGen_Id]
(
	@Id_SpePresentation	INTEGER=null,
	@Ret			INTEGER OUTPUT
) AS
-- Definitions
DECLARE @Erreur INTEGER


-- BODY
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCipGen_Id'')

--STATS


	SET NOCOUNT ON
	SET @Erreur = 0
	

	-- si le médicament est un générique, recherche des autres génériques et du référant
SELECT * FROM (
	SELECT DISTINCT
		a.ID_SPEPRESENTATION, a.ID_SPECIALITE, a.CIP,
              	a.UCD, a.AMMEUROPE,  a.LIEUDISPO,
                a.CONDDISPO, a.LISTE, a.DUREEPRESCRIPTION,
                a.PRESCRIPTIONINITIALE, a.PRESCRIPTIONRESERVEE,
                a.RENOUVELRESERVE, a.MEDPARTIC, CAST(a.NATURESURVEILLANCE AS VARCHAR(4000))  AS NATURESURVEILLANCE,
                a.CODEREFERANTGENERIQUE, a.REMPLACE, a.SOURCEREMPLACE,
                a.DATESOURCEREMPLACE, a.REMPLACEPAR, a.SOURCEREMPLACEPAR,
                a.DATESOURCEREMPLACEPAR, a.PRIXPRODHTF, a.PRIXPUBLICTTCF,
                a.PRIXPRODHTE, a.PRIXPUBLICTTCE, a.TVA, a.DCREAT, a.DMODIF,
                a.DREVIS, a.CIPREFERANT, 
		CASE a.condi
			WHEN NULL THEN b.DENOMSPE
			ELSE b.DENOMSPE + '':''+a.condi
		END DenomCip, a.disponibilite, a.nbprise, a.priseunitaire, a.codeDispo 
	FROM SpePresentation a	INNER JOIN Specialite b ON a.id_Specialite = b.id_Specialite 
				INNER JOIN SpePresentation d ON (a.cip = d.cipReferant OR  a.cipReferant = d.cipReferant )
	--supprimé le 090204 LEFT OUTER JOIN SpeConditionnementPrimaire c ON a.id_SpePresentation = c.id_SpePresentation
	WHERE d.Id_Spepresentation = @Id_SpePresentation
	AND d.cipreferant IS NOT NULL
	AND a.codedispo NOT IN (4,5)
	--supprimé le 090204 AND ( c.TYPECONDPRIMAIRE IS NULL OR UPPER(c.TYPECONDPRIMAIRE) = ''DENOMCIP'' ) 

	UNION

                                        
	SELECT DISTINCT
		a.ID_SPEPRESENTATION, a.ID_SPECIALITE, a.CIP,
                a.UCD, a.AMMEUROPE,  a.LIEUDISPO,
                a.CONDDISPO, a.LISTE, a.DUREEPRESCRIPTION,
                a.PRESCRIPTIONINITIALE, a.PRESCRIPTIONRESERVEE,
                a.RENOUVELRESERVE, a.MEDPARTIC, CAST(a.NATURESURVEILLANCE AS VARCHAR(4000)) AS NATURESURVEILLANCE,
                a.CODEREFERANTGENERIQUE, a.REMPLACE, a.SOURCEREMPLACE,
                a.DATESOURCEREMPLACE, a.REMPLACEPAR, a.SOURCEREMPLACEPAR,
                a.DATESOURCEREMPLACEPAR, a.PRIXPRODHTF, a.PRIXPUBLICTTCF,
                a.PRIXPRODHTE, a.PRIXPUBLICTTCE, a.TVA, a.DCREAT, a.DMODIF,
                a.DREVIS, a.CIPREFERANT, 
		CASE a.condi
			WHEN NULL THEN b.DENOMSPE
			ELSE b.DENOMSPE + '':''+a.condi
		END DenomCip,  a.disponibilite, a.nbprise, a.priseunitaire, a.codeDispo 
	FROM SpePresentation a	INNER JOIN Specialite b ON a.id_Specialite = b.id_Specialite 
				INNER JOIN SpePresentation d ON ((a.cip = d.cip and a.CODEREFERANTGENERIQUE = ''R'' ) OR a.cipreferant = d.cip )
	--supprimé le 090204	LEFT OUTER JOIN SpeConditionnementPrimaire c ON a.id_SpePresentation = c.id_SpePresentation
	WHERE d.Id_Spepresentation = @Id_SpePresentation
	AND a.codedispo NOT IN (4,5)
	--supprimé le 090204	AND ( c.TYPECONDPRIMAIRE IS NULL OR UPPER(c.TYPECONDPRIMAIRE) = ''DENOMCIP'' )
) as List
	ORDER BY 
         ( CASE WHEN codedispo IN (0,3) THEN 0 ELSE 1 END ), 31

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret












' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetCIM10_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetCIM10_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetCIM10_Id]	(
						@The_Ide	INTEGER,
						@Type_Ide	INTEGER,
						@Niveau		VARCHAR(1),
						@Ret 		INTEGER OUTPUT
					) AS

-- Definition variables locales
DECLARE @Erreur INTEGER
DECLARE @Type_To INTEGER
DECLARE @Type_Lib VARCHAR(10)
DECLARE @Abs_Type INTEGER
DECLARE @Curseur CURSOR
DECLARE @TGetHIE VARCHAR(30)
DECLARE @REQ       VARCHAR(3000)
DECLARE @TGetHIEGI  VARCHAR(30)

-- BODY
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_Get_Type'')

--STATS



	-- Init
	SET @Erreur = 0

	-- Recuperation code spécialité
	EXEC  @Erreur = RMC_Get_Type ''CIM'', @Type_To OUTPUT
	IF @Erreur != 0 GOTO SORTIE_ERR

	SET @Abs_Type = ABS(@Type_Ide)
	IF @@ERROR != 0 GOTO SORTIE_ERR

	-- Récupération Libelle 
	EXEC @Erreur = p_RMC_Get_Type_Lib @Type_Ide , @Type_Lib OUTPUT
	IF @Erreur != 0 GOTO SORTIE_ERR

	IF @Type_Lib = ''CINDIC''
		EXEC RMC_GetHie_Pro @The_Ide,''P'',  @Abs_Type, @Type_To, @TGetHIE OUTPUT
	ELSE IF @Type_Lib = ''GINDIC''
		EXEC RMC_GetHie_Pro_GINDIC @The_Ide, @Niveau,   @TGetHIEGI  OUTPUT
	ELSE IF @Type_Lib = ''CIM''
		EXEC RMC_GetHie_Pro @The_Ide,''H'',  @Type_Ide, @Type_To, @TGetHIE OUTPUT
	ELSE
		EXEC RMC_GetHie_Pro @The_Ide,''H'',  0, @Type_To, @TGetHIE OUTPUT

	IF @Erreur != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TGetHIEGI+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIEGI                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
	-- NOTE : On a gardé le curseur ouvert par p_RMCGetHie_Pro pour permettre l''accès à la table temporaire créée dans la procédure pré-citée
	SET @REQ =''SELECT * FROM ##''+ @TGetHIE
	EXEC(@REQ)

	IF @@ERROR != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM TempDb..SYSOBJECTS WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		SET @Req = ''IF EXISTS( SELECT 1 FROM TempDb..SYSOBJECTS WHERE NAME = ''''##''+@TGetHIEGI+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIEGI                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
	ELSE
		BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM TempDb..SYSOBJECTS WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		SET @Req = ''IF EXISTS( SELECT 1 FROM TempDb..SYSOBJECTS WHERE NAME = ''''##''+@TGetHIEGI+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIEGI                        EXEC(@Req)
		GOTO SORTIE
		END
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret

















' 
END
GO
/****** Objet :  Table [dbo].[UCD]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[UCD]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UCD](
	[id_ucd] [int] IDENTITY(1,1) NOT NULL,
	[Code_Ucd] [varchar](50)  NOT NULL,
	[Code_Cip] [varchar](7)  NOT NULL,
	[Libelle_Ucd] [varchar](255)  NOT NULL,
	[EPhMRA] [varchar](50)  NULL,
 CONSTRAINT [PK_UCD] PRIMARY KEY NONCLUSTERED 
(
	[id_ucd]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[UCD]') AND name = N'IX_Code_Cip')
CREATE NONCLUSTERED INDEX [IX_Code_Cip] ON [dbo].[UCD] 
(
	[Code_Cip]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[UCD]') AND name = N'IX_Code_Ucd')
CREATE NONCLUSTERED INDEX [IX_Code_Ucd] ON [dbo].[UCD] 
(
	[Code_Ucd]
)
GO
/****** Objet :  StoredProcedure [dbo].[RMC_Detect_iam_ci_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_Detect_iam_ci_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_Detect_iam_ci_Txt]
(
	@Id_Specialites	VARCHAR(255),
	@CodeCIM10	VARCHAR(255),
	@Ret		INTEGER OUTPUT
) AS
-- Definitions
DECLARE @Erreur 	INTEGER
DECLARE @Type_CIM 	INTEGER
DECLARE @Type_CINDIC	INTEGER
DECLARE @Type_SPE	INTEGER
DECLARE @Req            varchar(4000)
DECLARE @TCODECIM   varchar(50)
DECLARE @TSPEC   varchar(50)

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_Detect_iam_ci_Txt'')

--STATS


	-- Inits
	SET @Erreur = 0

	EXEC @Erreur =RMC_Get_Type ''CIM'' ,@Type_CIM OUTPUT
	IF @Erreur != 0 GOTO SORTIE_ERR

	EXEC @Erreur =RMC_Get_Type ''CINDIC'' ,@Type_CINDIC OUTPUT
	IF @Erreur != 0 GOTO SORTIE_ERR

	EXEC @Erreur =RMC_Get_Type ''SPE'' ,@Type_SPE OUTPUT
	IF @Erreur != 0 GOTO SORTIE_ERR

	EXEC @Erreur =p_RMC_Detect_iam_ci @Id_Specialites, @CodeCIM10, @TSPEC   OUTPUT, @TCODECIM  OUTPUT
						
	IF @Erreur != 0 GOTO SORTIE_ERR

	SET @REQ = ''SELECT DISTINCT 
		f0.id_Specialite AS ID_SPECIALITE1, 
		f0.denomSpe AS DENOMSPE1, 
		a0.id_IAMClasse AS ID_IAMCLASSE1, d0.classe AS CLASSE1, 
		h0.id_Specialite AS ID_SPECIALITE2, 
		h0.denomSpe AS DENOMSPE2, 
		b0.id_IAMClasse AS ID_IAMCLASSE2, e0.classe AS CLASSE2, 
		c0.niveauGravite AS NIVEAUGRAVITE, 
		c0.RisqEtMecan AS RISQETMECAN, 
		c0.conduiteATenir AS CONDUITEATENIR, 0 AS CIM_INI, 
		h0.source AS DENOM_CIM_INI, 0 AS FLAG_P_D_F, 
		0 AS CIM_FIN, 0 AS SPEC, h0.source AS DENOM_SPEC, 
		0 AS FLAG_K	
	FROM IAMClasse_IAMCouple k0	INNER JOIN Specialite_IAMClass g0
					INNER JOIN IAMClass d0
					INNER JOIN IAMCouple c0
					INNER JOIN IAMClasse_IAMCouple b0
					INNER JOIN IAMClasse_IAMCouple a0	ON b0.id_IAMCouple = a0.id_IAMCouple
										ON c0.id_IAMCouple = a0.id_IAMCouple
										ON d0.id_IAMClasse = a0.id_IAMClasse
					INNER JOIN IAMClass e0	ON b0.id_IAMClasse = e0.id_IAMClasse
								ON g0.id_IAMClasse = d0.id_IAMClasse
					INNER JOIN Specialite f0 ON g0.id_Specialite = f0.id_Specialite
					INNER JOIN Specialite_IAMClass i0 ON e0.id_IAMClasse = i0.id_IAMClasse
					INNER JOIN Specialite h0 ON i0.id_Specialite = h0.id_Specialite
								 ON k0.id_IAMCouple = a0.id_IAMCouple
					INNER JOIN Specialite_IAMClass l0 ON k0.id_IAMClasse = l0.id_IAMClasse
	WHERE a0.id_IAMClasse < b0.id_IAMClasse
	AND f0.id_Specialite != h0.id_Specialite
	AND f0.id_Specialite IN (SELECT * FROM ##''+@TSPEC+'')
	AND h0.id_Specialite IN (SELECT * FROM ##''+@TSPEC+'')
	AND l0.id_Specialite IN (SELECT * FROM ##''+@TSPEC+'') 

	UNION
	SELECT
		ReqA.ID	ID_SPECIALITE1,
		ReqA.DENOMSPE	DENOMSPE1,
		0		ID_IAMCLASSE1,
		'''' ''''		CLASSE1,
		0		ID_SPECIALITE2,
		'''' ''''		DENOMSPE2,
		0		ID_IAMCLASSE2,
		'''' ''''		CLASSE2,
		'''' ''''		NIVEAUGRAVITE,
		'''' ''''		RISQETMECAN,
		'''' ''''		CONDUITEATENIR,
		ReqB.CIMB	CIM_INI,
		ReqB.DENOMCIM	DENOM_CIM_INI,
		ReqB.flag	FLAG_P_D_F,
		ReqA.CIMA	CIM_FIN,
		ReqA.SPE	SPEC,
		ReqA.DENOMSPE	DENOM_SPEC,
		1		FLAG_K
	FROM
		(	SELECT
				1          flag,
				a.THE_IDE  CIMB,
				a.THE_LAF  DENOMCIM,
				c.THE_IDE  CIM2B
			FROM RMC_THE a	INNER JOIN RMC_THE_HIE b ON a.THE_IDE = b.THE_THE_IDE 
					INNER JOIN RMC_THE c ON b.THE_IDE = c.THE_IDE
			WHERE a.THE_IDE IN ( SELECT * FROM ##''+@TCODECIM +'')
			AND a.TYPE_IDE = ''+ CONVERT(VARCHAR(10),@Type_CIM)+''
			AND c.TYPE_IDE =  ''+ CONVERT(VARCHAR(10),@Type_CIM)+'' 

			UNION
			SELECT
				0          FLAG,
				c.THE_IDE  CIMB,
				c.THE_LAF  DENOMCIM,
				c.THE_IDE  CIM2B
			FROM RMC_THE c

			WHERE c.THE_IDE IN ( SELECT * FROM ##''+@TCODECIM +'')

			UNION
			SELECT
				-1         FLAG,
				a.THE_IDE  CIMB,
				a.THE_LAF  DENOMCIM,
				c.THE_IDE  CIM2B
			FROM RMC_THE a	INNER JOIN RMC_THE_HIE b ON a.THE_IDE = b.THE_IDE 
					INNER JOIN RMC_THE c ON b.THE_THE_IDE = c.THE_IDE
			WHERE a.THE_IDE IN ( SELECT * FROM ##''+@TCODECIM +'')
			AND a.TYPE_IDE =  ''+ CONVERT(VARCHAR(10),@Type_CIM)+''
			AND c.TYPE_IDE =  ''+ CONVERT(VARCHAR(10),@Type_CIM)+''
		) ReqB
			INNER JOIN 
			(
				SELECT DISTINCT
					t1.id ID,
					t1.the_ide  SPE,
					t1.the_laf  DENOMSPE,
					t3.THE_IDE  CIMA
				FROM RMC_THE t1	INNER JOIN RMC_THE_PRO p1 ON   t1.THE_IDE = p1.THE_THE_IDE 
						INNER JOIN   RMC_THE t2 ON p1.THE_IDE = t2.THE_IDE
						INNER JOIN   RMC_THE_PRO p2 ON t2.THE_IDE = p2.THE_IDE
						INNER JOIN   RMC_THE t3 ON p2.THE_THE_IDE = t3.THE_IDE
						INNER JOIN   RMC_THE t4 ON t1.THE_IDE = t4.THE_IDE
				WHERE t1.TYPE_IDE  = ''+ CONVERT(VARCHAR(10),@Type_SPE )+''
				AND t2.TYPE_IDE  = ''+ CONVERT(VARCHAR(10),@Type_CINDIC )+''
				AND t3.TYPE_IDE  = ''+ CONVERT(VARCHAR(10),@Type_CIM)+''
				AND t4.Type_Ide =  ''+ CONVERT(VARCHAR(10),@Type_SPE )+''
				AND t4.id IN ( SELECT * FROM ##''+@TSPEC +'')
			) ReqA
			ON ReqB.CIM2B = ReqA.CIMA

	ORDER BY 18,1,12''
	EXEC(@REQ)

--print(@req)
	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##'' + @TCODECIM+'''''' AND TYPE = ''''U'''')
		DROP TABLE ##''+ @TCODECIM
                           EXEC(@Req)

		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##'' + @TSPEC+'''''' AND TYPE = ''''U'''')
		DROP TABLE ##''+ @TSPEC
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	ELSE
                      BEGIN
		SET @Ret = 0
                      END
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret














' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetCim10Corres_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetCim10Corres_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetCim10Corres_Txt]
(
	@Id_GIndics 	VARCHAR(255),
	@Niveau 	VARCHAR(1),
	@Ret 		INTEGER	OUTPUT
) AS
-- Definitions
DECLARE @Erreur 	INTEGER
DECLARE @Type_CIM 	INTEGER
DECLARE @Type_GINDIC	INTEGER
DECLARE @REQ	VARCHAR(4000)
DECLARE @TGINDICS	VARCHAR(30)
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetCim10Corres_Txt'')

--STATS


	-- Inits
	SET @Erreur = 0

	EXEC @Erreur =RMC_Get_Type ''CIM'' ,@Type_CIM OUTPUT
	IF @Erreur != 0 GOTO SORTIE_ERR

	EXEC @Erreur =RMC_Get_Type ''GINDIC'' ,@Type_GINDIC OUTPUT
	IF @Erreur != 0 GOTO SORTIE_ERR

	EXEC @Erreur =p_RMC_GetCim10Corres  @Id_GIndics, @TGINDICS OUTPUT
	IF @Erreur != 0 GOTO SORTIE_ERR

	IF @Niveau =''O''
		SET @REQ = ''SELECT c1.THE_IDE,  c1.TYPE_IDE,   c1.THE_CAF,  c1.THE_LAF,  c1.ID
		FROM RMC_THE a1	INNER JOIN RMC_THE_PRO b1 ON b1.THE_IDE     = a1.THE_IDE
				INNER JOIN RMC_THE c1 ON b1.THE_THE_IDE = c1.THE_IDE
		WHERE a1.TYPE_IDE  = ''+CONVERT(VARCHAR(10), @Type_GINDIC)+'' 
		AND c1.TYPE_IDE =''+CONVERT(VARCHAR(10), @Type_CIM)+''
		AND b1.niveau IN (0,1)
		AND EXISTS ( SELECT 1 FROM ##''+@TGINDICS+''  WHERE Id_F = a1.THE_IDE )
		ORDER BY  c1.THE_CAF''
	ELSE
		SET @REQ =''SELECT c1.THE_IDE,  c1.TYPE_IDE,   c1.THE_CAF,  c1.THE_LAF,  c1.ID
		FROM RMC_THE a1	INNER JOIN RMC_THE_PRO b1 ON b1.THE_IDE     = a1.THE_IDE
				INNER JOIN RMC_THE c1 ON b1.THE_THE_IDE = c1.THE_IDE
		WHERE a1.TYPE_IDE  = ''+CONVERT(VARCHAR(10), @Type_GINDIC)+'' 
		AND c1.TYPE_IDE =''+CONVERT(VARCHAR(10), @Type_CIM)+''
		AND b1.niveau = 1
		AND EXISTS ( SELECT 1 FROM ##''+@TGINDICS+'' WHERE Id_F = a1.THE_IDE )
		ORDER BY  c1.THE_CAF''

	EXEC(@REQ)

	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TGINDICS+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TGINDICS
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGINDICS+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TGINDICS
                           EXEC(@Req)
                           GOTO SORTIE
                      END

END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret













' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCips_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCips_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCips_Id]
(
	@Terme	INTEGER,
	@Typ	INTEGER,
	@Domain	INTEGER,
	@Ordre	INTEGER=1,
	@Ret	INTEGER OUTPUT
)  AS
-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur	INTEGER
DECLARE @Curseur	CURSOR
DECLARE @Req	VARCHAR(1000)
DECLARE @TTCIPS      VARCHAR(1000)

--BODY
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCips_Id'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	
	EXEC @Erreur = p_GetCips @Terme, NULL, @Typ, @Domain, @Ordre,  @TTCIPS OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR


	SET @Req = ''SELECT * FROM ##'' +@TTCIPS
              EXEC(@Req)

	-- TEST ERREUR
	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TTCIPS+ ''''''AND TYPE = ''''U'''')
	              DROP TABLE ##''+@TTCIPS
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TTCIPS+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPS
                           EXEC(@Req)
                           GOTO SORTIE
                      END


END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret



















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetCIM10FromCode_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetCIM10FromCode_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetCIM10FromCode_Txt]	(	
								@CodeCim10	VARCHAR(255),
								@Ret		INTEGER 	OUTPUT
							) AS
-- Definition des variables locales
DECLARE @Erreur INTEGER
DECLARE @Code VARCHAR(255)

-- BODY
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetCIM10FromCode_Txt'')

--STATS



	-- Initialisations
	SET @Erreur = 0

	SET @CodeCim10 = 	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
				REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
				REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
				REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(

				REPLACE(REPLACE(REPLACE(UPPER(@CodeCim10),
				''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A''),
				''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E''),
				''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I''),
				''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O''),
				''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U''),
				''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y''),
				''Ç'',''C''),
				''Ñ'',''N'')
	IF @@ERROR != 0 GOTO SORTIE_ERR				
	
	SELECT t.THE_IDE AS ''RMC_THE_IDE'', t.TYPE_IDE, t.THE_CAF AS ''RMC_THE_CAF'', t.THE_LAF AS ''RMC_THE_LAF'', t.ID, t.THE_VIS AS ''RMC_THE_VIS'', t.DAT_MAJ, t.USR_MAJ, t.OBS_MAJ
	FROM RMC_THE t	
	WHERE t.type_ide = 8 AND
						REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
						REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
						REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
						REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(

						REPLACE(REPLACE(REPLACE(UPPER( t.THE_CAF),
						''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A''),
						''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E''),
						''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I''),
						''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O''),
						''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U''),
						''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y''),
						''Ç'',''C''),
						''Ñ'',''N'')
					LIKE @CodeCim10
	
	-- TEST ERREUR
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret






' 
END
GO
/****** Objet :  Table [dbo].[LivretLog]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LivretLog]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LivretLog](
	[CIP] [varchar](10)  NULL,
	[Nom] [varchar](255)  NULL,
	[CodeErreur] [varchar](10)  NULL,
	[TexteErreur] [varchar](2000)  NULL
)
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCips_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCips_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCips_Txt]
(
	@Terme	VARCHAR(100),
	@Typ		INTEGER,
	@Domain	INTEGER,
	@Ordre		INTEGER=1,
	@Ret		INTEGER OUTPUT
)  AS
-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur	INTEGER
DECLARE @Curseur	CURSOR
DECLARE @Req	VARCHAR(1000)
DECLARE @TTCIPS      VARCHAR(1000)

--BODY
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCips_Txt'')

--STATS


	EXEC @Erreur = p_GetCips 0, @Terme, @Typ, @Domain, @Ordre,  @TTCIPS OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR

	-- NOTE : On a gardé le curseur ouvert par p_GetCips pour permettre l''accès à la table temporaire créée dans la procédure pré-citée
	--SELECT * FROM ##Tmp_GetCips
	SET @Req = ''SELECT * FROM ##'' +@TTCIPS
              EXEC(@Req)


	-- TEST ERREUR
	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TTCIPS+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPS
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM  tempdb..sysobjects  WHERE NAME = ''''##''+@TTCIPS+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPS
                           EXEC(@Req)
                           GOTO SORTIE
                      END

END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret










' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetCIM10Info_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetCIM10Info_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetCIM10Info_Txt]	(
							@ChaineIn	VARCHAR(255),
							@ChaineOut	VARCHAR(255) OUTPUT,
							@Ret		INTEGER OUTPUT
						) AS
-- Definition des variables
DECLARE @Erreur INTEGER
DECLARE @Index INTEGER
DECLARE @Car VARCHAR(1)

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetCIM10Info_Txt'')

--STATS


	-- Init
	SET @Erreur = 0

	SET @Index = LEN(@ChaineIn)
	IF @@ERROR != 0 GOTO SORTIE_ERR

	WHILE @Index > 0
	BEGIN
		SET @Car =  SUBSTRING( @ChaineIn, @Index, 1 )
		IF @@ERROR != 0 GOTO SORTIE_ERR

		IF @Car NOT IN(''é'',''ê'',''è'',''ë'',''à'',''ä'',''â'',''ï'',''î'',''ö'',''ô'',''ü'',''û'',''ù'',''ÿ'',''a'',''b'',''c'',''d'',''e'',''f'',''g'',''h'',''i'',''j'',''k'',''l'',''m'',''n'',''o'',''p'',''q'',''r'',''s'',''t'',''u'',''v'',''w'',''x'',''y'',''z'',''A'',''B'',''C'',''D'',''E'',''F'',''G'',''H'',''I'',''J'',''K'',''L'',''M'',''N'',''O'',''P'',''Q'',''R'',''S'',''T'',''U'',''V'',''W'',''X'',''Y'',''Z'',''0'',''1'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'')
		BEGIN
			SET @ChaineIn = REPLACE(@ChaineIn, @Car ,'''')
			IF @@ERROR != 0 GOTO SORTIE_ERR
		END
		SET @Index = @Index -1
		IF @@ERROR != 0 GOTO SORTIE_ERR

	END

	SET @ChaineOut = @ChaineIN + ''.htm''

	-- TEST ERREUR
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetCIndic_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetCIndic_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetCIndic_Id]	( 
						@The_Ide	INTEGER,
						@Type_Ide	INTEGER,
						@Ret		INTEGER OUTPUT				
					) AS

DECLARE @Erreur INTEGER
DECLARE @TGetHIE VARCHAR(30)
DECLARE @REQ       VARCHAR(3000)

BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetCIndic_Id'')

--STATS


	EXEC p_RMC_Get_ @The_Ide, @Type_Ide, ''CINDIC'', @TGetHIE  OUTPUT
	IF @Erreur != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
	-- NOTE : On a gardé le curseur ouvert par p_RMCGetHie_Pro pour permettre l''accès à la table temporaire créée dans la procédure pré-citée
	SET @REQ =''SELECT * FROM ##''+ @TGetHIE
	EXEC(@REQ)

	IF @@ERROR != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
	ELSE
		BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE
		END
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret










' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetCIP_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetCIP_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- -------------------------------------------------------------------
  -- Fonction   : RMC_GetCIP
  -- Objet      : Recherche des CIP à partir
  --              . D''un code specification  : recherche hiérachique fils
  -- -------------------------------------------------------------------
CREATE PROCEDURE [dbo].[RMC_GetCIP_Id]	( 
						@The_Ide	INTEGER,
						@Type_Ide	INTEGER,
						@Ret		INTEGER OUTPUT				
					) AS

DECLARE @Erreur INTEGER
DECLARE @Curseur CURSOR
DECLARE @TGetHIE VARCHAR(30)
DECLARE @REQ       VARCHAR(3000)
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetCIP_Id'')

--STATS


	EXEC p_RMC_Get_ @The_Ide, @Type_Ide, ''CIP'',@TGetHIE  OUTPUT
	IF @Erreur != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM  tempdb..sysobjects WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
		
	-- NOTE : On a gardé le curseur ouvert par p_RMCGetHie_Pro pour permettre l''accès à la table temporaire créée dans la procédure pré-citée
	SET @REQ =   ''SELECT * FROM ##''+@TGetHIE+ ''  order by RMC_THE_LAF''
	EXEC(@REQ)

	IF @@ERROR != 0
		BEGIN
		--SET @Req = ''IF EXISTS( SELECT 1 FROM TempDb..SYSOBJECTS WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 --DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
	ELSE
		BEGIN
		SET @Ret = 0
		--SET @Req = ''IF EXISTS( SELECT 1 FROM TempDb..SYSOBJECTS WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		-- DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE
		END

END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret












' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCipSpeDopante_id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipSpeDopante_id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[GetCipSpeDopante_id]
(
	@Id_Spepresentation                 INTEGER,
	@Ret		                         INTEGER OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER


-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCipSpeDopante_id'')

--STATS


	SET NOCOUNT  ON
	SET @Erreur = 0


               SELECT  b.ID_SPECIALITE, b.BVALID, b.BENCOURS, b.NOMUSER,
                       b.DENOMSPE, b.FORME, b.DOSAGE, b.complement,
                       b.COMMAMMPOSO, b.RESERVE, b.INFERIEURAGE,
                       b.UNITINF, b.SUPERIEURAGE, b.UNIFSUP,
                       b.INFERIEURPOIDS, b.SUPERIEURPOIDS,
                       b.DENOMAMM, b.NUMDOSAMM, b.SPECATEGORIE,
                       b.SOURCE, b.DATESOURCE, b.REMARQUES, b.DCREAT,
                       b.DMODIF, b.DREVIS, b.BDOPANT
               FROM    SPECIALITE b INNER JOIN SPEPRESENTATION a ON b.ID_SPECIALITE = a.ID_SPECIALITE
               WHERE   (a.ID_SPEPRESENTATION = @Id_Spepresentation
               OR a.ID_SPEPRESENTATION IS NULL)
               ORDER BY b.DENOMSPE;       



	IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR


		SET @Ret = 0
	GOTO SORTIE
END

-- Gestion des cas d''erreur
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR


	SET @Ret = @Erreur


-- Cas de sortie de procédure sans erreur
SORTIE:
	RETURN @Ret


















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetFromKeyWord_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetFromKeyWord_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetFromKeyWord_Txt]
(
	@Ori_Ide	INTEGER=null,
	@Type_Ide	INTEGER=null,
	@Cle_Lib	VARCHAR(255)=''%'',
	@Ret		INTEGER OUTPUT
) AS
-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur INTEGER
DECLARE @REQ		VARCHAR(1000)
DECLARE @TKWORD		VARCHAR(50)
--BODY
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetFromKeyWord_Txt'')

--STATS


print @TKWORD 

	EXEC @Erreur = p_GetFromKeyWord @Ori_Ide, @Type_Ide, @Cle_Lib, 1, @TKWORD OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR

	-- NOTE : On a gardé le curseur ouvert par p_RMCGetHie_Pro pour permettre l''accès à la table temporaire créée dans la procédure pré-citée
	SET @REQ = ''SELECT * FROM ##''+@TKWORD
	EXEC(@REQ)


	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TKWORD+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TKWORD
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM  tempdb..sysobjects  WHERE NAME = ''''##''+@TKWORD+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TKWORD
                           EXEC(@Req)
                           GOTO SORTIE
                      END

END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetFromKeyWord2_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetFromKeyWord2_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetFromKeyWord2_Txt] (
							@Ori_Ide	INTEGER=null,
							@Type_Ide	INTEGER=null,
							@Cle_Lib	VARCHAR(255)=''%'',
							@Ret		INTEGER OUTPUT
						) AS
-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur INTEGER
DECLARE @Chaine_Epure VARCHAR(255)
DECLARE @REQ		VARCHAR(1000)
DECLARE @TKWORD		VARCHAR(50)

--BODY
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetFromKeyWord2_Txt'')

--STATS


	EXEC @Erreur = p_GetFromKeyWord @Ori_Ide, @Type_Ide, @Cle_Lib, 2, @TKWORD OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR

	-- NOTE : On a gardé le curseur ouvert par p_RMCGetHie_Pro pour permettre l''accès à la table temporaire créée dans la procédure pré-citée
	SET @REQ = ''SELECT * FROM ##''+@TKWORD
	EXEC(@REQ)

	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TKWORD+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TKWORD
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TKWORD+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TKWORD
                           EXEC(@Req)
                           GOTO SORTIE
                      END

END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret












' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCipsWithLivret_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipsWithLivret_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- ---------------------------------------------------------------
  -- Fonction de sélection  : GetCipsWithLivret
  -- Toutes les colonnes
  -- Retour par ref_Cursor
  -- Permet d''obtenir les CIP rattachés aux libellés des substances
  -- ( ou aux substances filles ) ou des spécialités passés en
  -- paramètre (selon le typ).
  -- La recherche se fera selon la demande :
  --          * dans la Banque VIDAL
  --          * dans le livret VIDAL de l''hôpital concerné
  --          * dans le livret HOPITAL de l''hôpital concerné
  --    OU    * seulement dans les livrets de l''organisme concerné
  -- Résultats restitués selon différents ordres.
  -- ---------------------------------------------------------------
CREATE PROCEDURE [dbo].[GetCipsWithLivret_Txt](
							@Terme 	VARCHAR(100)=''%'',
							@Type 		INTEGER,
							@Domain 	INTEGER,
							@Ordre 	INTEGER=1,
							@Banque 	VARCHAR(1),
							@Id_Hop 	INTEGER,
							@Ret	 	INTEGER	OUTPUT
					) AS
-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur 	INTEGER
DECLARE @Curseur 	CURSOR
DECLARE @Req	VARCHAR(1000)
DECLARE @TTCIPS      VARCHAR(1000)

--BODY
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCipsWithLivret_Txt'')

--STATS


	SET NOCOUNT  ON

	-- INITIALISATION Code Erreur Proc
	SET @Erreur =0

	EXEC @Erreur = p_GetCipsWithLivret 0, @Terme, @Type, @Domain, @Ordre, @Banque, @Id_Hop, @TTCIPS OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR

 	SET  @Req = ''SELECT * FROM ##'' + @TTCIPS
	EXEC(@Req)


	-- TEST ERREUR
	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM    tempdb..sysobjects   WHERE NAME = ''''##''+@TTCIPS+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPS
                    --       EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM    tempdb..sysobjects   WHERE NAME = ''''##''+@TTCIPS+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPS
                        --   EXEC(@Req)
                           GOTO SORTIE
                      END


END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret
















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetGIndic_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetGIndic_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetGIndic_Id]	( 
						@The_Ide	INTEGER,
						@Type_Ide	INTEGER,
						@Ret		INTEGER OUTPUT				
					) AS

DECLARE @Erreur INTEGER
DECLARE @TGetHIE VARCHAR(30)
DECLARE @REQ       VARCHAR(3000)
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetGIndic_Id'')

--STATS


	EXEC @Erreur = p_RMC_Get_ @The_Ide, @Type_Ide, ''GINDIC'',  @TGetHIE  OUTPUT
	IF @Erreur != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
	-- NOTE : On a gardé le curseur ouvert par p_RMCGetHie_Pro pour permettre l''accès à la table temporaire créée dans la procédure pré-citée
	SET @REQ =''SELECT * FROM ##''+ @TGetHIE
	EXEC(@REQ)

	IF @@ERROR != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
	ELSE
		BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE
		END
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret







' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetFromKeyWordLivret_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetFromKeyWordLivret_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetFromKeyWordLivret_Txt]
(
	@Ori_Ide	INTEGER = NULL,
	@Type_Ide	INTEGER = NULL,
	@Cle_Lib	VARCHAR(255)=''%'',
	@Recherche	VARCHAR(1),
	@Id_Hop	INTEGER,
	@Ret		INTEGER OUTPUT
) AS
-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur		INTEGER
DECLARE @CurseurRet		CURSOR
DECLARE @RetStr		VARCHAR(255)
DECLARE @REQ		VARCHAR(1000)
DECLARE @TKWORD		VARCHAR(50)

--BODY
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetFromKeyWordLivret_Txt'')

--STATS


	SET NOCOUNT ON
	SET @Erreur = 0

	EXEC @Erreur = p_Ajouter_parentheses_entre_mots @Cle_Lib, @RetStr OUTPUT
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	EXEC @Erreur = p_GetFromKeyWordLivret @Ori_Ide, @Type_Ide, @RetStr, @Recherche, @Id_Hop, @TKWORD  OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR

	-- NOTE : On a gardé le curseur ouvert par LIV_GetHie_Pro pour permettre l''accès à la table temporaire
	--        créée dans la procédure pré-citée
	SET @REQ = ''SELECT * FROM ##''+ @TKWORD 
	EXEC(@REQ)

	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TKWORD+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TKWORD
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TKWORD+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TKWORD
                           EXEC(@Req)
                           GOTO SORTIE
                      END

END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetGIndic_Prob_Txt]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetGIndic_Prob_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetGIndic_Prob_Txt]
(
	@Id_Specialites VARCHAR(255),
	@Ret		INTEGER	OUTPUT
) AS
-- Definitions
DECLARE @Erreur INTEGER

DECLARE @Type_GINDIC	INTEGER
DECLARE @Type_INDIC	INTEGER
DECLARE @Type_SPE		INTEGER
DECLARE @Req        		varchar(8000)
DECLARE @TSPEC      		varchar(50)
--Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetGIndic_Prob_Txt'')

--STATS


	-- INits
	SET @Erreur = 0

	EXEC @Erreur =RMC_Get_Type ''GINDIC'' ,@Type_GINDIC OUTPUT
	IF @Erreur != 0 GOTO SORTIE_ERR

	EXEC @Erreur =RMC_Get_Type ''INDIC'' ,@Type_INDIC OUTPUT
	IF @Erreur != 0 GOTO SORTIE_ERR

	EXEC @Erreur =RMC_Get_Type ''SPE'' ,@Type_SPE OUTPUT
	IF @Erreur != 0 GOTO SORTIE_ERR


	EXEC @Erreur = p_RMC_GetGIndic_Prob @Id_Specialites, @TSPEC output
	IF @Erreur != 0 GOTO SORTIE_ERR


	SET @REQ = ''SELECT
		c1.THE_IDE AS theide, c1.TYPE_IDE AS typeide, 
		c1.THE_CAF AS thecaf, c1.THE_LAF AS thelaf, c1.ID AS theid, 
		COUNT(e1.THE_IDE)occur 

 FROM RMC_THE a1 INNER JOIN RMC_THE_PRO b1 ON a1.THE_IDE = b1.THE_THE_IDE 
			INNER JOIN RMC_THE c1 ON b1.THE_IDE = c1.THE_IDE 
			INNER JOIN RMC_THE_PRO d1 ON a1.THE_IDE = d1.THE_IDE 

				 INNER JOIN RMC_THE e1 ON d1.THE_THE_IDE = e1.THE_IDE
	WHERE (c1.TYPE_IDE = ''+ CONVERT(VARCHAR(10), @Type_GINDIC)+'')  AND (a1.TYPE_IDE = ''+ CONVERT(VARCHAR(10), @Type_INDIC)+'') 

		AND (e1.TYPE_IDE = ''+ CONVERT(VARCHAR(10), @Type_SPE)+'')
		AND (e1.THE_IDE IN (SELECT * FROM ##''+@TSPEC+''))
	
	GROUP BY
		c1.THE_IDE, c1.TYPE_IDE ,c1.THE_CAF, c1.THE_LAF , c1.ID  
		ORDER BY count(e1.THE_IDE) DESC, 4''

	EXEC(@REQ)


	IF @@ERROR != 0
                       BEGIN
		IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''##'' + @TSPEC AND TYPE = ''U'')
		SET @Req = ''DROP TABLE ##''+ @TSPEC
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	ELSE
                      BEGIN
		SET @Ret = 0
                       	IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''##'' + @TSPEC AND TYPE = ''U'')
		SET @Req = ''DROP TABLE ##''+ @TSPEC
                           EXEC(@Req)
                           GOTO SORTIE
                      END
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret











' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetFirstATC]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetFirstATC]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetFirstATC]
(
	@Ret	INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetFirstATC'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	-- Allocation du curseur à retourner
	SELECT NULL AS ''ID_DICOT_ATC_IRIS'', '''' AS ''Code'', ''CLASSEMENT ATC'' AS ''LIBELLE'', 1 AS ''HASCHILD''
	
	-- TEST ERREUR
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret







' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetHie_Pro]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetHie_Pro]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- --------------------------------------------------------------------------
  -- Fonction     : RMC_GetHie_Pro
  -- Objet        : Recherche par hiérarchie ou profil ascendant ou descendant
  --                en tenant compte de l''origine des Thesaurus recherchés
  -- Param In     : Thesaurus de départ
  --                Indicateur hiérarchie - Profil
  --                Type de l''information de depart
  --                Type de l''information d''arrivée
  -- Param Out    : Jeu d''enregistrement
  --                Code retour
  -- Historique
  -- Creation     : 20/12/2000
  -- Auteur       : AgdF (from Data to Information)
  -- --------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[RMC_GetHie_Pro]
(
	@The_Ide	INTEGER,
	@Ind_H_P 	VARCHAR(1),
	@Type_From	INTEGER,
	@Type_To	INTEGER,
	@TGetHIE	VARCHAR(30)  OUTPUT
) AS

-- Definition des variables locales
DECLARE @Erreur INTEGER
DECLARE @time        varchar(20)
--DECLARE @TGetHIE   varchar(30)
DECLARE @Req        varchar(4000)
-- BODY
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetHie_Pro'')

--STATS


	-- Initialisations
	SET @Erreur = 0

	SET NOCOUNT ON

	SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET  @TGetHIE = ''GetHie_Pro'' +@time
	-- Effacement de la table temporaire si elle existe
	SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+ @TGetHIE
		EXEC(@Req)

	-- Creation table temporaire en memoire
	SET @Req = ''CREATE TABLE ##''+@TGetHIE+ ''
	(
		RMC_THE_IDE			INTEGER,
		TYPE_IDE			INTEGER,
		RMC_THE_CAF			VARCHAR(60),
		RMC_THE_LAF			VARCHAR(255),
		ID				INTEGER
	)''
             EXEC(@REQ)
	IF @@ERROR != 0	GOTO SORTIE_ERR

	IF @Type_From = 0
	BEGIN
		SET @Req = ''INSERT INTO ##''+@TGetHIE +''
		SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID
		FROM RMC_THE c
		WHERE 1 = 2''
		EXEC(@REQ)
	END

	ELSE IF @Type_From < 0	
	BEGIN
		IF @Ind_H_P = ''P''
		BEGIN
			SET @Req = ''INSERT INTO ##''+@TGetHIE +''
			SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID
			FROM RMC_THE a INNER JOIN RMC_THE_PRO b ON b.THE_THE_IDE = a.THE_IDE
				       INNER JOIN RMC_THE c ON c.THE_IDE = b.THE_IDE
			WHERE	a.THE_IDE = ''+ CONVERT(VARCHAR(10),  @The_Ide)+ ''  AND 	c.TYPE_IDE =''+ CONVERT(VARCHAR(10), @Type_To)+ ''  
						     AND	a.TYPE_IDE = ABS(''+ CONVERT(VARCHAR(10), @Type_From)+'' ) ''
			EXEC(@REQ)
		END
		ELSE
		BEGIN
			SET @Req = ''INSERT INTO ##''+@TGetHIE +''
			SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID
			FROM RMC_THE a INNER JOIN RMC_THE_HIE b ON b.THE_THE_IDE = a.THE_IDE
				       INNER JOIN RMC_THE c ON c.THE_IDE = b.THE_IDE
			WHERE	a.THE_IDE =''+ CONVERT(VARCHAR(10),  @The_Ide)+ '' AND 	c.TYPE_IDE = ''+ CONVERT(VARCHAR(10), @Type_To)+ ''  
						     AND	a.TYPE_IDE = ABS(''+ CONVERT(VARCHAR(10), @Type_From)+'' ) ''
			EXEC(@REQ)
		END
	END

	ELSE IF @Type_From > 0
	BEGIN
		IF @Ind_H_P = ''P''
		BEGIN
			SET @Req = ''INSERT INTO ##''+@TGetHIE +''
			SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID
			FROM RMC_THE a INNER JOIN RMC_THE_PRO b ON b.THE_IDE = a.THE_IDE
				       INNER JOIN RMC_THE c ON c.THE_IDE = b.THE_THE_IDE
			WHERE	a.THE_IDE = ''+ CONVERT(VARCHAR(10),  @The_Ide)+''  AND 	c.TYPE_IDE = ''+ CONVERT(VARCHAR(10),  @Type_To)+ ''  
						     AND	a.TYPE_IDE = ABS(''+ CONVERT(VARCHAR(10), @Type_From)+'' ) ''
			EXEC(@REQ)
		END
		ELSE
		BEGIN
			SET @Req = ''INSERT INTO ##''+@TGetHIE+ ''
			SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID
			FROM RMC_THE a INNER JOIN RMC_THE_HIE b ON b.THE_IDE = a.THE_IDE
				       INNER JOIN RMC_THE c ON c.THE_IDE = b.THE_THE_IDE
			WHERE	a.THE_IDE = ''+ CONVERT(VARCHAR(10),  @The_Ide)+ '' AND 	c.TYPE_IDE = ''+ CONVERT(VARCHAR(10),  @Type_To)+ ''  
						     AND	a.TYPE_IDE = ABS(''+ CONVERT(VARCHAR(10), @Type_From)+'' ) ''
			EXEC(@REQ)
		END
	END
	IF @@ERROR != 0 GOTO SORTIE_ERR
	

END

-- SORTIE NORMALE
SORTIE:
	RETURN 0



-- ANOMALIE
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur











' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetHie_Pro_GINDIC]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetHie_Pro_GINDIC]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- --------------------------------------------------------------------------
  -- Fonction     : RMC_GetHie_Pro_GINDIC
  -- Objet        : Recherche des fils profil en partant d''un Groupe d''Indications
  --                vers un CIM10
  -- Param In     : Thesaurus de départ
  --              : Niveau de recherche
  -- Param Out    : Jeu d''enregistrement
  --              : Code retour
  -- Historique
  -- Creation     : 26/03/2001
  -- Auteur       : Manuel Rouault - K2/Pixelpark.
  -- --------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[RMC_GetHie_Pro_GINDIC] (
							@The_Ide	INTEGER,
							@Niveau	VARCHAR(1),
							@TGetHIEGI	VARCHAR(30)  OUTPUT
						   ) AS
-- Definition des variables locales
DECLARE @Erreur INTEGER
DECLARE @time        varchar(20)
DECLARE @Req        varchar(4000)
-- BODY
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetHie_Pro_GINDIC'')

--STATS



	-- Initialisations
	SET @Erreur = 0
	SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET @TGetHIEGI  = ''GetHie_Pro'' +@time
	-- Effacement de la table temporaire si elle existe
	SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIEGI+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+ @TGetHIEGI	
		EXEC(@Req)

	IF @Niveau = ''O'' 
		--SET @Curseur = CURSOR FOR 
		SET @Req = ''SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID
						FROM RMC_THE a INNER JOIN RMC_THE_PRO b ON b.THE_IDE = a.THE_IDE
							INNER JOIN RMC_THE c ON c.THE_IDE = b.THE_THE_IDE
						WHERE 	a.THE_IDE  =  ''+ CONVERT(VARCHAR(10),  @The_Ide)+''
							AND	a.TYPE_IDE     = 5
							AND	c.TYPE_IDE     = 8
							AND	b.Niveau in (0,1) ''
		EXEC(@REQ)
		IF @@ERROR != 0 GOTO SORTIE_ERR
	ELSE
		--SET @Curseur = CURSOR FOR 
		SET @Req = '' SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID
						FROM RMC_THE a INNER JOIN RMC_THE_PRO b ON b.THE_IDE = a.THE_IDE
							INNER JOIN RMC_THE c ON c.THE_IDE = b.THE_THE_IDE
						WHERE 	a.THE_IDE  =  ''+ CONVERT(VARCHAR(10),  @The_Ide)+''
							AND	a.TYPE_IDE     = 5
							AND	c.TYPE_IDE     = 8
							AND	b.Niveau  = 1''
		EXEC(@REQ)
		IF @@ERROR != 0 GOTO SORTIE_ERR

	

END

-- SORTIE NORMALE
SORTIE:
	RETURN 0

-- ANOMALIE
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur












' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetFirstThera]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetFirstThera]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetFirstThera]
(
	@Ret	INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetFirstThera'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	-- Allocation du curseur à retourner
	SELECT
			NULL AS ''ID_DICOCOMCLASSIRIS'', 0 AS ''DIC_ID_DICOCOMCLASSIRIS'',
			''CLASSEMENT THERAPEUTIQUE'' AS ''LIBELLE'', 0 AS ''ORDRE'', 1 AS ''HASCHILD''
	-- TEST ERREUR
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret









' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetHierarchyChild_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetHierarchyChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetHierarchyChild_Id] (

						@The_Ide	INTEGER,
						@Ret		INTEGER OUTPUT
					 ) AS

-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur INTEGER

--BODY
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetHierarchyChild_Id'')

--STATS


	SET NOCOUNT ON

	-- INITIALISATION Code Erreur Proc
	SET @Erreur = 0

	SELECT b.THE_IDE AS ''RMC_THE_IDE'', b.TYPE_IDE, b.THE_CAF AS ''RMC_THE_CAF'', b.THE_LAF AS ''RMC_THE_LAF'', b.ID, b.THE_VIS AS ''RMC_THE_VIS'', b.DAT_MAJ, b.USR_MAJ, b.OBS_MAJ
	FROM RMC_THE b INNER JOIN RMC_THE_HIE a ON  b.THE_IDE = a.THE_IDE
	WHERE  a.THE_THE_IDE = @The_Ide

	IF @@ERROR != 0 
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	set @Ret = 0
		GOTO SORTIE
END

-- Gestion des erreurs
SORTIE_ERR:
	-- Sauvegarde de l''erreur
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	set @Ret = @Erreur

-- Cas de sortie sans erreur
SORTIE:
	RETURN @Ret









' 
END
GO
/****** Objet :  Table [dbo].[RMC_REG]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_REG]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RMC_REG](
	[REG_IDE] [int] NOT NULL,
	[REG_REG_IDE] [int] NOT NULL,
	[REG_LIB] [varchar](255)  NOT NULL,
	[DAT_MAJ] [datetime] NOT NULL,
	[USR_MAJ] [varchar](30)  NOT NULL,
	[OBS_MAJ] [varchar](255)  NULL,
 CONSTRAINT [PK_RMC_REG] PRIMARY KEY CLUSTERED 
(
	[REG_IDE]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[RMC_REG]') AND name = N'A_COMME_PERE_FK')
CREATE NONCLUSTERED INDEX [A_COMME_PERE_FK] ON [dbo].[RMC_REG] 
(
	[REG_REG_IDE]
)
GO
/****** Objet :  StoredProcedure [admin3].[GetTitle]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[admin3].[GetTitle]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [admin3].[GetTitle](@Doc As Text, @result AS VARCHAR(255) OUTPUT) AS 
BEGIN

    DECLARE @Terme As Varchar(8000)
    DECLARE @PosBegin AS Integer
    DECLARE @PosEnd AS Integer
    DECLARE @Title As Varchar(4000)
    DECLARE @bWrite As Integer
    DECLARE @I As Integer
    DECLARE @Car As varchar(1)
    DECLARE @Chaine As varchar(4000)
    DECLARE @LenBalise  As Integer
    DECLARE @PosCar As Integer

	Set @Terme=@Doc
	Set @LenBalise=5
	SET @PosBegin=CharIndex(''<nom>'',@Terme)
	SET @PosEnd=CharIndex(''</nom>'',@Terme)
	if @PosBegin=0
	begin
		SET @PosBegin=CharIndex(''<nom thera="non">'',@Terme)
		Set @LenBalise =17
	end
	if @PosBegin > 0 and @PosEnd > 0
	begin
		SET @Title=SubString(@Terme,@PosBegin+@LenBalise,@PosEnd-@PosBegin-@LenBalise)
	end
	else begin
		SET @Title=''''
	end
	-- on dégage les entités caractères
		SET @Title=Replace(@Title,''&reg;'','''')
		SET @Title=Replace(@Title,''&trade;'','''')
		SET @Title=Replace(@Title,''&eacute;'',''é'') 
		SET @Title=Replace(@Title,''&egrave;'',''è'')
		SET @Title=Replace(@Title,''&ecirc;'',''ê'')
		SET @Title=Replace(@Title,''&Eacute;'',''É'')
		SET @Title=Replace(@Title,''&Egrave;'',''È'')
		SET @Title=Replace(@Title,''&Ecirc;'',''Ê'')
		SET @Title=Replace(@Title,''&acirc;'',''â'')
		SET @Title=Replace(@Title,''&agrave;'',''à'')
		SET @Title=Replace(@Title,''&ucirc;'',''û'')
		SET @Title=Replace(@Title,''&Ucirc;'',''Û'')
		SET @Title=Replace(@Title,''&iuml;'',''ï'')
		SET @Title=Replace(@Title,''&Iuml;'',''Ï'')
		SET @Title=Replace(@Title,''&amp;'',''&'')
		SET @Title=Replace(@Title,''&OElig;'',''Œ'')
		SET @Title=Replace(@Title,''&beta;'',''BETA'')
		SET @Title=Replace(@Title,''&nbsp;'','' '')
		SET @Title=Replace(@Title,''&thinsp;'','' '')
		SET @Title=Replace(@Title,''<qa>'','' '')
	-- Mais pb de casse ...
	Set @PosCar = CharIndex(''é'',@Title)
	while @PosCar > 0
	begin
		if @PosCar = 1
		begin
			Set @title = ''É'' + SubString(@Title,2,Len(@Title)-1)
		end
		else begin
			Set @Car = SubString(@Title,@PosCar-1,1)
			if ascii(@Car)>64 and ascii(@Car)<91 begin
				Set @Title = SubString(@Title,1,@PosCar-1) + ''É'' + SubString(@Title,@PosCar+1,Len(@Title)-@PosCar)
			end
		end
		Set @PosCar = CharIndex(''é'',@Title,@PosCar+1)
	end
	Set @PosCar = CharIndex(''è'',@Title)
	while @PosCar > 0
	begin
		if @PosCar = 1
		begin
			Set @title = ''È'' + SubString(@Title,2,Len(@Title)-1)
		end
		else begin
			Set @Car = SubString(@Title,@PosCar-1,1)
			if ascii(@Car)>64 and ascii(@Car)<91 begin
				Set @Title = SubString(@Title,1,@PosCar-1) + ''È'' + SubString(@Title,@PosCar+1,Len(@Title)-@PosCar)
			end
		end
		Set @PosCar = CharIndex(''è'',@Title,@PosCar+1)
	end
	Set @PosCar = CharIndex(''ê'',@Title)
	while @PosCar > 0
	begin
		if @PosCar = 1
		begin
			Set @title = ''Ê'' + SubString(@Title,2,Len(@Title)-1)
		end
		else begin
			Set @Car = SubString(@Title,@PosCar-1,1)
			if ascii(@Car)>64 and ascii(@Car)<91 begin
				Set @Title = SubString(@Title,1,@PosCar-1) + ''Ê'' + SubString(@Title,@PosCar+1,Len(@Title)-@PosCar)
			end
		end
		Set @PosCar = CharIndex(''ê'',@Title,@PosCar+1)
	end

	-- On ne garde pas les balises
	SET @I=0
	SET @bWrite=1
	SET @Car =''''
	SET @Chaine =''''
	WHILE @I<LEN(@Title)+1
	BEGIN
		SET @I=@I+1
		SET @Car=SUBSTRING(@Title,@I,1)
		IF @Car<>''<'' And @Car<>''>''
		BEGIN
			IF @bWrite=1
			BEGIN
				SET @Chaine=@Chaine + @Car
			END
		END
		ELSE BEGIN
			IF @Car=''<''
			BEGIN
				SET @bWrite=0
			END
			ELSE BEGIN
				SET @bWrite=1
			END
		END
	END
	SET @Chaine = Replace(@Chaine,''  '','' '')
	SET @result=ltrim(rtrim(@Chaine))
END
' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetHierarchyParent_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetHierarchyParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- ---------------------------------------------------------------
  -- Fonction de sélection  : RMC_GetHierarchyParent
  -- Toutes les colonnes
  -- Retour par ref_Cursor
  -- --------------------------------------------------------------
CREATE PROCEDURE [dbo].[RMC_GetHierarchyParent_Id] (
						@The_Ide	INTEGER,
						@Ret		INTEGER OUTPUT
					 ) AS

-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur INTEGER

--BODY
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetHierarchyParent_Id'')

--STATS


	SET NOCOUNT ON

	-- INITIALISATION Code Erreur Proc
	SET @Erreur = 0

	SELECT b.THE_IDE AS ''RMC_THE_IDE'', b.TYPE_IDE, b.THE_CAF AS ''RMC_THE_CAF'', b.THE_LAF AS ''RMC_THE_LAF'', b.ID, b.THE_VIS AS ''RMC_THE_VIS'', b.DAT_MAJ, b.USR_MAJ, b.OBS_MAJ
	FROM RMC_THE b INNER JOIN RMC_THE_HIE a ON  b.THE_IDE = a.THE_THE_IDE
	WHERE  a.THE_IDE = @The_Ide

	IF @@ERROR != 0 
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	set @Ret = 0
		GOTO SORTIE
END

-- Gestion des erreurs
SORTIE_ERR:
	-- Sauvegarde de l''erreur
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	set @Ret = @Erreur

-- Cas de sortie sans erreur
SORTIE:
	RETURN @Ret









' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetGenGroupCIPs_id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetGenGroupCIPs_id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[GetGenGroupCIPs_id]
(
	@Id_DICOCODEGENE   INTEGER,
	@Ret			INTEGER OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER


-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetGenGroupCIPs_id'')

--STATS


	SET NOCOUNT  ON
	SET @Erreur = 0

             SELECT  a.Id_Spepresentation, a.Cip,
					CASE a.condi
						WHEN NULL THEN b.DENOMSPE
						ELSE b.DENOMSPE + '':'' + a.condi
					END DenomCip,
                        a.nbprise,a.disponibilite
               FROM     SPECIALITE b INNER JOIN SPEPRESENTATION a ON  b.Id_Specialite              = a.Id_Specialite 
--                               LEFT JOIN SPECONDITIONNEMENTPRIMAIRE c   ON  c.Id_Spepresentation   = a.Id_Spepresentation
               WHERE    a.Id_DICOCODEGENE           = @Id_DICOCODEGENE
--               AND ( c.TYPECONDPRIMAIRE IS NULL OR UPPER(c.TYPECONDPRIMAIRE ) = ''DENOMCIP'')
               ORDER BY  Denomcip;



IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR


		SET @Ret = 0
	GOTO SORTIE
END

-- Gestion des cas d''erreur
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR


	SET @Ret = @Erreur

-- Cas de sortie de procédure sans erreur
SORTIE:
	RETURN @Ret












' 
END
GO
/****** Objet :  StoredProcedure [admin3].[New_Soundex]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[admin3].[New_Soundex]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [admin3].[New_Soundex](@terme varchar(255), @result AS VARCHAR(255) OUTPUT) AS 
BEGIN

    DECLARE @terme_soundex AS VARCHAR(255)
    DECLARE @lettre AS CHAR(1)
    DECLARE @mot AS VARCHAR(255)
    DECLARE @chaine AS VARCHAR (255)
    DECLARE @I AS INTEGER
    DECLARE @FirstMot AS BIT

	SET @terme_soundex=@terme
	SET @terme_soundex=replace(@terme_soundex,"0","")
	SET @terme_soundex=replace(@terme_soundex,"1","") 
	SET @terme_soundex=replace(@terme_soundex,"2","") 
	SET @terme_soundex=replace(@terme_soundex,"3","") 
	SET @terme_soundex=replace(@terme_soundex,"4","") 
	SET @terme_soundex=replace(@terme_soundex,"5","") 
	SET @terme_soundex=replace(@terme_soundex,"6","") 
	SET @terme_soundex=replace(@terme_soundex,"7","") 
	SET @terme_soundex=replace(@terme_soundex,"8","")  
	SET @terme_soundex=replace(@terme_soundex,"9","") 
	SET @terme_soundex=replace(@terme_soundex,",","") 
	SET @terme_soundex=replace(@terme_soundex,".","") 
	SET @terme_soundex=replace(@terme_soundex,"%","") 

	SET @terme_soundex=replace(@terme_soundex,"(","") 
	SET @terme_soundex=replace(@terme_soundex,")","") 
	SET @terme_soundex=replace(@terme_soundex,"[","") 
	SET @terme_soundex=replace(@terme_soundex,"]","") 
	SET @terme_soundex=replace(@terme_soundex,"{","") 
	SET @terme_soundex=replace(@terme_soundex,"}","") 
	SET @terme_soundex=replace(@terme_soundex,"/","") 
	SET @terme_soundex=replace(@terme_soundex,"\","") 
	SET @terme_soundex=replace(@terme_soundex,"µ","") 
	SET @terme_soundex=replace(@terme_soundex,"+","") 
	SET @terme_soundex=replace(@terme_soundex,''"'','''') 

	--on passe en majuscules
	SET @terme_soundex=UPPER(@terme_soundex)
	SET @terme_soundex=replace(@terme_soundex,UPPER("ç"),"C")
										
	--on enleve les tirets
	SET @terme_soundex=replace(@terme_soundex,"-","")
	SET @terme_soundex=replace(@terme_soundex,"''","")
										
	--on remplace les groupes de lettres
	SET @terme_soundex=replace(@terme_soundex,"GUI","KI") 
	SET @terme_soundex=replace(@terme_soundex,"GUE","KE") 
	SET @terme_soundex=replace(@terme_soundex,"GA","KA") 
	SET @terme_soundex=replace(@terme_soundex,"GO","KO") 
	SET @terme_soundex=replace(@terme_soundex,"GU","K") 
	SET @terme_soundex=replace(@terme_soundex,"CA","KA") 
	SET @terme_soundex=replace(@terme_soundex,"CO","KO") 
	SET @terme_soundex=replace(@terme_soundex,"CU","KU") 
	SET @terme_soundex=replace(@terme_soundex,"Q","K") 
	SET @terme_soundex=replace(@terme_soundex,"CC","K") 
	SET @terme_soundex=replace(@terme_soundex,"CK","K")
										
	--on remplace les voyelles par A (sauf le y)
	SET @terme_soundex=replace(@terme_soundex,"Y","I")
	SET @terme_soundex=replace(@terme_soundex,"AIN","IN")
	SET @terme_soundex=replace(@terme_soundex,"AI","E")
	SET @terme_soundex=replace(@terme_soundex,"EI","E")
	SET @terme_soundex=replace(@terme_soundex,"EU","E")
	SET @terme_soundex=replace(@terme_soundex,"IE","E")
	--SET @terme_soundex=replace(@terme_soundex,"OE","E")
	SET @terme_soundex=replace(@terme_soundex,UPPER("œ"),"E")
	SET @terme_soundex=replace(@terme_soundex,"AU","O")
	SET @terme_soundex=replace(@terme_soundex,"OI","A")
	SET @terme_soundex=replace(@terme_soundex,"UA","A")
	SET @terme_soundex=replace(@terme_soundex,"UE","E")
	SET @terme_soundex=replace(@terme_soundex,"UI","I")
	SET @terme_soundex=replace(@terme_soundex,"UO","O")
	SET @terme_soundex=replace(@terme_soundex,UPPER("é"),"E")
	SET @terme_soundex=replace(@terme_soundex,UPPER("è"),"E")
	SET @terme_soundex=replace(@terme_soundex,UPPER("ê"),"E")
	SET @terme_soundex=replace(@terme_soundex,UPPER("ë"),"E")
	SET @terme_soundex=replace(@terme_soundex,UPPER("î"),"I")
	SET @terme_soundex=replace(@terme_soundex,UPPER("ï"),"I")
	SET @terme_soundex=replace(@terme_soundex,"O","A")
	SET @terme_soundex=replace(@terme_soundex,UPPER("ô"),"A")
	SET @terme_soundex=replace(@terme_soundex,UPPER("ö"),"A")
	SET @terme_soundex=replace(@terme_soundex,"U","A")
	SET @terme_soundex=replace(@terme_soundex,UPPER("û"),"A")
	SET @terme_soundex=replace(@terme_soundex,UPPER("ü"),"A")
	SET @terme_soundex=replace(@terme_soundex,UPPER("ä"),"A")
	SET @terme_soundex=replace(@terme_soundex,UPPER("à"),"A")
	SET @terme_soundex=replace(@terme_soundex,UPPER("â"),"A")
										
	--on remplace les préfixes
	SET @terme_soundex=replace(@terme_soundex,"MAC","MCC")  
	SET @terme_soundex=replace(@terme_soundex,"ASA","AZA") 
	SET @terme_soundex=replace(@terme_soundex,"KN","NN") 
	SET @terme_soundex=replace(@terme_soundex,"PF","FF")
	SET @terme_soundex=replace(@terme_soundex,"SCH","SSS") 
	SET @terme_soundex=replace(@terme_soundex,"PH","FF") 
										
	--on remplace les H (sauf SH et CH)
	-- Methode Seb :
	-- On transcode SH et CH par un caractere bidon qu''on sait inexistant
	-- On supprime ensuite H
	-- On retranscode la caractere bidon en CH et SH
	SET @terme_soundex=replace(@terme_soundex,"CH","Y") 
	SET @terme_soundex=replace(@terme_soundex,"SH","YY") 
	SET @terme_soundex=replace(@terme_soundex,"H","") 
	SET @terme_soundex=replace(@terme_soundex,"YY","SH") 
	SET @terme_soundex=replace(@terme_soundex,"Y","CH") 

	-- on remplace les Y (sauf AY)
	-- Ne sert e rien car Y deja transcode en I et AY => AI => E
											
	-- on enleve les terminaisons T D S
	--if (right(terme_soundex,1)="T" or right(terme_soundex,1)="D" or right(terme_soundex,1)="S") then terme_soundex=left(terme_soundex,len(terme_soundex)-1)
	--on enleve les A (sauf la première lettre)
	--terme_soundex=left(terme_soundex,1) & replace(mid(terme_soundex,2),"A","")
	IF right(@terme_soundex,1)=''W''	
	BEGIN 
		SET @terme_soundex=left(@terme_soundex,len(@terme_soundex)-1)
	END
											
											
	--on enleve les lettres répétitives
	SET @lettre=LEFT(@terme_soundex,1)
	SET @chaine=@lettre
	SET @I=1
	WHILE @I<LEN(@terme_soundex)
	BEGIN
		SET @I=@I+1
		IF SUBSTRING(@terme_soundex,@I,1)<>@lettre
		BEGIN
			SET @lettre=SUBSTRING(@terme_soundex,@I,1)
			SET @chaine=@chaine + @lettre
		END
	END
--	print ''avant : '' + @terme_soundex + '' , après : '' + @chaine
	SET @terme_soundex=@chaine
	
	--on enleve les blancs
	--terme_soundex=replace(terme_soundex," ","")
		
	-- On remplace les lettres pas des poids
	SET @terme_soundex=replace(@terme_soundex,"B","1") -- B
	SET @terme_soundex=replace(@terme_soundex,"F","1") -- F
	SET @terme_soundex=replace(@terme_soundex,"P","1") -- P
	SET @terme_soundex=replace(@terme_soundex,"V","1") -- V
	SET @terme_soundex=replace(@terme_soundex,"W","1") -- W
	SET @terme_soundex=replace(@terme_soundex,"C","2") -- C
	SET @terme_soundex=replace(@terme_soundex,"G","2") -- G
	SET @terme_soundex=replace(@terme_soundex,"J","2") -- J
	SET @terme_soundex=replace(@terme_soundex,"K","2") -- K
	SET @terme_soundex=replace(@terme_soundex,"Q","2") -- Q
	SET @terme_soundex=replace(@terme_soundex,"S","2") -- S
	SET @terme_soundex=replace(@terme_soundex,"X","2") -- X
	SET @terme_soundex=replace(@terme_soundex,"Z","2") -- Z
	SET @terme_soundex=replace(@terme_soundex,"D","3") -- D
	SET @terme_soundex=replace(@terme_soundex,"T","3") -- T
	SET @terme_soundex=replace(@terme_soundex,"L","4") -- L
	SET @terme_soundex=replace(@terme_soundex,"M","5") -- M
	SET @terme_soundex=replace(@terme_soundex,"N","5") -- N
	SET @terme_soundex=replace(@terme_soundex,"R","6") -- R				
	SET @terme_soundex=replace(@terme_soundex,"A","0") -- A
	SET @terme_soundex=replace(@terme_soundex,"E","7") -- E	
	SET @terme_soundex=replace(@terme_soundex,"I","8") -- I
	SET @terme_soundex=replace(@terme_soundex,"H","9") -- H		
	
	-- Manque : O, U, Y,

	-- On ne garde que les mots de plus de 3 lettres
	SET @I=0
	SET @FirstMot=1
	SET @mot =''''
	SET @chaine =''''
	WHILE @I<LEN(@terme_soundex)+1
	BEGIN
		SET @I=@I+1
		IF SUBSTRING(@terme_soundex,@I,1)<>'' ''
		BEGIN
			SET @mot=@mot + SUBSTRING(@terme_soundex,@I,1)
		END
		ELSE BEGIN
			IF LEN(@mot)>3
			BEGIN
				IF @FirstMot=0
				BEGIN
					SET @chaine=@chaine + '' '' + @mot
				END
				ELSE BEGIN
					SET @chaine=@mot
					SET @FirstMot=0
				END
			END
			SET @mot=''''
		END
	END
	SET @terme_soundex=@chaine
	SET @result=@terme_soundex
END
' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetIamClass_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetIamClass_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetIamClass_Id] (
						@The_Ide	INTEGER,
						@Type_Ide	INTEGER,
						@Ret		INTEGER OUTPUT				
					) AS

DECLARE @Erreur INTEGER
--DECLARE @Curseur CURSOR
DECLARE @TGetHIE VARCHAR(30)
DECLARE @REQ       VARCHAR(3000)
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetIamClass_Id'')

--STATS


	EXEC @Erreur = p_RMC_Get_ @The_Ide, @Type_Ide, ''IAM'' ,@TGetHIE  OUTPUT
	IF @Erreur != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
	-- NOTE : On a gardé le curseur ouvert par p_RMCGetHie_Pro pour permettre l''accès à la table temporaire créée dans la procédure pré-citée
	SET @REQ =''SELECT * FROM ##''+ @TGetHIE
	EXEC(@REQ)

	IF @@ERROR != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
	ELSE
		BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE
		END
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret










' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetGenGroupTheras_id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetGenGroupTheras_id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE  Procedure [dbo].[GetGenGroupTheras_id] 
( @ID_DICOCODEGENE integer,
  @ret integer output
)
as
---declarations des variables locales
declare @erreur integer
declare @liste varchar(2000)
declare @liste2 varchar(2000)
declare @requete varchar(8000)
declare @req varchar(8000)
--declaration des curseurs
declare @reftemp cursor
declare @reftemp2 cursor
---declarations des variables pour les curseurs
declare @id_dicocomclassiris integer
declare @Dic_id_DicoComClassIRIS integer
declare @id_dicocomclassiris2 integer
declare @Dic_id_DicoComClassIRIS2 integer
DECLARE @TTCIPSPE     VARCHAR(1000)

----body proc

   Begin
   set nocount on
   exec CalculNiveauDicoComClasseIris @ID_DICOCODEGENE , @TTCIPSPE OUTPUT
   set @erreur =0
   ---print ''table : '' + @TTCIPSPE
 --- set @req=   ''select id_dicocomclassiris ,  dic_id_dicocomclassiris FROM '' +  @TTCIPSPE
  ---print @req
---allocation du curseur reftemp
/*set @RefTEMP = cursor for 
	   select @req
            	IF @@ERROR != 0
	GOTO SORTIE_ERR

	OPEN @reftemp
            
	IF @@ERROR != 0
	GOTO SORTIE_ERR

	--recuperation des données du curseur reftemp

	FETCH next from @reftemp INTO @id_dicocomclassiris, @Dic_id_DicoComclassiris
       
	While (@@FETCH_STATUS = 0)
	begin

	if   @liste is null  or @liste2 is null
	     begin
	     set @liste = @id_dicocomclassiris
	     set @liste2= @dic_id_dicocomclassiris
             	  
             End
           	else
	     begin
	     set @liste = @liste + '','' + cast( @id_dicocomclassiris as varchar)
	     set @liste2= @liste2 + '','' + cast (@dic_id_dicocomclassiris as varchar)
                 
	 END
	FETCH next from @reftemp INTO 	@id_dicocomclassiris,@Dic_id_DicoComclassiris
              end
	-- Fermeture et désallocation du curseur temporaire
	-- pour pouvoir le réutiliser pour l''export des tables suivantes
	CLOSE @reftemp
	DEALLOCATE @reftemp*/

	
	/*
SET @requete = ''SELECT a.ID_DICOCOMCLASSIRIS,a.LIBELLE

 FROM     DICOCOMCLASSIRIS a 
 WHERE    a.id_dicocomclassiris in ( SELECT id_dicocomclassiris FROM ''+@TTCIPSPE+
 '') OR a.id_dicocomclassiris in ( SELECT dic_id_dicocomclassiris FROM ''+@TTCIPSPE + 
 '')  ORDER BY  a.libelle''*/

SET @requete =  ''SELECT a.ID_DICOCOMCLASSIRIS,a.LIBELLE, b.ID_DICOCOMCLASSIRIS DIC_ID_DICOCOMCLASSIRIS,  b.libelle DIC_LIBELLE
 FROM     DICOCOMCLASSIRIS a right outer join  DICOCOMCLASSIRIS b 
ON  b.DIC_ID_DICOCOMCLASSIRIS = a.ID_DICOCOMCLASSIRIS
 WHERE    a.id_dicocomclassiris in  ( SELECT dic_id_dicocomclassiris FROM ''+@TTCIPSPE+'' )
 AND b.id_dicocomclassiris in ( SELECT id_dicocomclassiris FROM ''+@TTCIPSPE + '')
 AND (a.id_dicocomclassiris in ( SELECT dic_id_dicocomclassiris FROM ''+@TTCIPSPE+'' ) OR a.dic_id_dicocomclassiris in ( SELECT id_dicocomclassiris FROM ''+@TTCIPSPE+'' ))
  ORDER BY a.ordre, a.libelle'';

--print(@requete)
EXEC(@requete)

if @@error!=0 ---cas d''erreur
 goto sortie_err
 set @ret=0
 goto sortie

---gestion des cas d''erreurs
sortie_err: if @erreur=0
	   set @erreur=@@error
	   set @ret=@erreur
---cas de sortie de programme sans erreur
sortie:
return @ret
end







' 
END
GO
/****** Objet :  Table [dbo].[RMC_ORI]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_ORI]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RMC_ORI](
	[ORI_IDE] [int] NOT NULL,
	[ORI_LIB] [varchar](255)  NOT NULL,
	[DAT_MAJ] [datetime] NOT NULL,
	[USR_MAJ] [varchar](30)  NOT NULL,
	[OBS_MAJ] [varchar](255)  NULL,
 CONSTRAINT [PK_RMC_ORI] PRIMARY KEY CLUSTERED 
(
	[ORI_IDE]
)
)
END
GO
/****** Objet :  StoredProcedure [admin3].[ReplaceAccent]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[admin3].[ReplaceAccent]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [admin3].[ReplaceAccent](@terme varchar(255), @result AS VARCHAR(255) OUTPUT) AS 
BEGIN
    DECLARE @szTemp AS VARCHAR(255)
	SET @szTemp=@terme
    SET @szTemp = Replace(@szTemp, ''À'', ''A'')
    SET @szTemp = Replace(@szTemp, ''Á'', ''A'')
    SET @szTemp = Replace(@szTemp, ''Â'', ''A'')
    SET @szTemp = Replace(@szTemp, ''Ã'', ''A'')
    SET @szTemp = Replace(@szTemp, ''Ä'', ''A'')
    SET @szTemp = Replace(@szTemp, ''Å'', ''A'')
    SET @szTemp = Replace(@szTemp, ''à'', ''a'')
    SET @szTemp = Replace(@szTemp, ''á'', ''a'')
    SET @szTemp = Replace(@szTemp, ''â'', ''a'')
    SET @szTemp = Replace(@szTemp, ''ã'', ''a'')
    SET @szTemp = Replace(@szTemp, ''ä'', ''a'')
    SET @szTemp = Replace(@szTemp, ''å'', ''a'')
    SET @szTemp = Replace(@szTemp, ''È'', ''E'')
    SET @szTemp = Replace(@szTemp, ''É'', ''E'')
    SET @szTemp = Replace(@szTemp, ''Ê'', ''E'')
    SET @szTemp = Replace(@szTemp, ''Ë'', ''E'')
    SET @szTemp = Replace(@szTemp, ''è'', ''e'')
    SET @szTemp = Replace(@szTemp, ''é'', ''e'')
    SET @szTemp = Replace(@szTemp, ''ê'', ''e'')
    SET @szTemp = Replace(@szTemp, ''ë'', ''e'')
    SET @szTemp = Replace(@szTemp, ''Ì'', ''I'')
    SET @szTemp = Replace(@szTemp, ''Í'', ''I'')
    SET @szTemp = Replace(@szTemp, ''Î'', ''I'')
    SET @szTemp = Replace(@szTemp, ''Ï'', ''I'')
    SET @szTemp = Replace(@szTemp, ''ì'', ''i'')
    SET @szTemp = Replace(@szTemp, ''í'', ''i'')
    SET @szTemp = Replace(@szTemp, ''î'', ''i'')
    SET @szTemp = Replace(@szTemp, ''ï'', ''i'')
--    SET @szTemp = Replace(@szTemp, ''Ñ'', ''N'')
--    SET @szTemp = Replace(@szTemp, ''ñ'', ''n'')
    SET @szTemp = Replace(@szTemp, ''Ò'', ''O'')
    SET @szTemp = Replace(@szTemp, ''Ó'', ''O'')
    SET @szTemp = Replace(@szTemp, ''Ô'', ''O'')
    SET @szTemp = Replace(@szTemp, ''Õ'', ''O'')
    SET @szTemp = Replace(@szTemp, ''Ö'', ''O'')
    SET @szTemp = Replace(@szTemp, ''ó'', ''o'')
    SET @szTemp = Replace(@szTemp, ''ô'', ''o'')
    SET @szTemp = Replace(@szTemp, ''õ'', ''o'')
    SET @szTemp = Replace(@szTemp, ''ö'', ''o'')
    SET @szTemp = Replace(@szTemp, ''ò'', ''o'')
--    SET @szTemp = Replace(@szTemp, ''Š'', ''S'')
--    SET @szTemp = Replace(@szTemp, ''š'', ''s'')
    SET @szTemp = Replace(@szTemp, ''Ù'', ''U'')
    SET @szTemp = Replace(@szTemp, ''Ú'', ''U'')
    SET @szTemp = Replace(@szTemp, ''Û'', ''U'')
    SET @szTemp = Replace(@szTemp, ''Ü'', ''U'')
    SET @szTemp = Replace(@szTemp, ''ù'', ''u'')
    SET @szTemp = Replace(@szTemp, ''ú'', ''u'')
    SET @szTemp = Replace(@szTemp, ''û'', ''u'')
    SET @szTemp = Replace(@szTemp, ''ü'', ''u'')
    SET @szTemp = Replace(@szTemp, ''Ý'', ''Y'')
    SET @szTemp = Replace(@szTemp, ''Ÿ'', ''Y'')
    SET @szTemp = Replace(@szTemp, ''ý'', ''y'')
    SET @szTemp = Replace(@szTemp, ''ÿ'', ''y'')
--    SET @szTemp = Replace(@szTemp, ''Ž'', ''Z'')
--    SET @szTemp = Replace(@szTemp, ''ž'', ''z'')

	SET @result=@szTemp
END
' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetIndic_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetIndic_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetIndic_Id]	( 
						@The_Ide	INTEGER,
						@Type_Ide	INTEGER,
						@Ret		INTEGER OUTPUT				
					) AS

DECLARE @Erreur INTEGER
DECLARE @TGetHIE VARCHAR(30)
DECLARE @REQ       VARCHAR(3000)

BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetIndic_Id'')

--STATS


	EXEC p_RMC_Get_ @The_Ide, @Type_Ide, ''INDIC'',  @TGetHIE  OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR

	-- NOTE : On a gardé le curseur ouvert par p_RMCGetHie_Pro pour permettre l''accès à la table temporaire créée dans la procédure pré-citée
	SET @REQ =''SELECT * FROM ##''+ @TGetHIE
	EXEC(@REQ)

	IF @@ERROR != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
	ELSE
		BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE
		END

END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret










' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetFirstCIndic]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetFirstCIndic]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetFirstCIndic]
(
	@Ret	INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetFirstCIndic'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	SELECT 0 AS ''Id_T_Ci'', ''CONTRE-INDICATION''  AS ''Libelle'', NULL AS ''Texte'', CONVERT(CHAR(10) ,getdate(),103)  AS ''Creation'', ''V'' AS ''Validation'', NULL AS ''Remarques'', 1 AS ''HasChild''
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetLabo_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetLabo_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetLabo_Id]	( 
						@The_Ide	INTEGER,
						@Type_Ide	INTEGER,
						@Ret		INTEGER OUTPUT				
					) AS

DECLARE @Erreur INTEGER
--DECLARE @Curseur CURSOR
DECLARE @TGetHIE VARCHAR(30)
DECLARE @REQ       VARCHAR(3000)

BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetLabo_Id'')

--STATS


	EXEC @Erreur = p_RMC_Get_ @The_Ide, @Type_Ide, ''LABO'', @TGetHIE  OUTPUT
	IF @Erreur != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
	-- NOTE : On a gardé le curseur ouvert par p_RMCGetHie_Pro pour permettre l''accès à la table temporaire créée dans la procédure pré-citée
	SET @REQ =''SELECT * FROM ##''+ @TGetHIE
	EXEC(@REQ)

	IF @@ERROR != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
	ELSE
		BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE
		END
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:

	RETURN  @Ret











' 
END
GO
/****** Objet :  Table [dbo].[RMC_TYPE]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_TYPE]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RMC_TYPE](
	[TYPE_IDE] [int] NOT NULL,
	[TYP_LIB] [varchar](30)  NOT NULL,
	[DAT_MAJ] [datetime] NOT NULL,
	[USR_MAJ] [varchar](30)  NOT NULL,
	[OBS_MAJ] [varchar](255)  NULL,
 CONSTRAINT [PK_RMC_TYPE] PRIMARY KEY CLUSTERED 
(
	[TYPE_IDE]
)
)
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetProfilChild_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetProfilChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetProfilChild_Id] (
						@The_Ide	INTEGER,
						@Ret		INTEGER OUTPUT
					 ) AS

-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur INTEGER

--BODY
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetProfilChild_Id'')

--STATS


	SET NOCOUNT ON

	-- INITIALISATION Code Erreur Proc
	SET @Erreur = 0

	SELECT b.THE_IDE AS ''RMC_THE_IDE'', b.TYPE_IDE, b.THE_CAF AS ''RMC_THE_CAF'', b.THE_LAF AS ''RMC_THE_LAF'', b.ID, b.THE_VIS AS ''RMC_THE_VIS'', b.DAT_MAJ, b.USR_MAJ, b.OBS_MAJ
	FROM RMC_THE b INNER JOIN RMC_THE_PRO a ON b.THE_IDE = a.THE_IDE
             WHERE  a.THE_THE_IDE = @The_Ide


	IF @@ERROR != 0 
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	set @Ret = 0
		GOTO SORTIE
END

-- Gestion des erreurs
SORTIE_ERR:
	-- Sauvegarde de l''erreur
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	set @Ret = @Erreur

-- Cas de sortie sans erreur
SORTIE:
	RETURN @Ret










' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetIAMClassesSpeCouples_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIAMClassesSpeCouples_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetIAMClassesSpeCouples_Txt]
(
	@ID_SPECIALITES	VARCHAR(500),
	@Ret			INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER
DECLARE @varRequete	VARCHAR(4000)

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetIAMClassesSpeCouples_Txt'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	SET @varRequete =
	''SELECT DISTINCT
		spe1.id_specialite AS "ID_SPECIALITE1",
		spe1.denomspe AS "DENOMSPE1",
		clascoup1.id_iamclasse AS "ID_IAMCLASSE1",
		class1.classe AS "CLASSE1",
		spe2.id_specialite AS "ID_SPECIALITE2",
		spe2.denomspe AS "DENOMSPE2",
		clascoup2.id_iamclasse AS "ID_IAMCLASSE2",
		class2.classe AS "CLASSE2",
		couple.niveaugravite AS "NIVEAUGRAVITE",
		couple.risqetmecan AS "RISQETMECAN",
		couple.conduiteatenir AS "CONDUITEATENIR"
	FROM
		IAMCLASSE_IAMCOUPLE  clascoup1 ,
		IAMCLASSE_IAMCOUPLE  clascoup2 ,
		IAMCOUPLE couple ,
		IAMCLASS class1 ,
		IAMCLASS class2 ,
		SPECIALITE spe1 ,
		SPECIALITE_IAMCLASS spclass1 ,
		SPECIALITE spe2 ,
		SPECIALITE_IAMCLASS spclass2
	WHERE clascoup1.id_iamcouple = clascoup2.id_iamcouple
	AND clascoup1.id_iamclasse < clascoup2.id_iamclasse
	AND clascoup1.id_iamcouple IN (SELECT id_iamcouple
					FROM IAMCLASSE_IAMCOUPLE
					WHERE id_iamclasse IN (SELECT id_iamclasse
								FROM SPECIALITE_IAMCLASS
								WHERE id_specialite IN ('' + @ID_SPECIALITES+ '')
								GROUP BY id_iamclasse)
					GROUP BY id_iamcouple
					HAVING COUNT(*) > 1 )
	AND clascoup1.id_iamcouple = couple.id_iamcouple
	AND clascoup1.id_iamclasse = class1.id_iamclasse
	AND clascoup2.id_iamclasse = class2.id_iamclasse
	AND class1.id_iamclasse  = spclass1.id_iamclasse
	AND spclass1.id_specialite = spe1.id_specialite
	AND spe1.id_specialite IN ('' + @ID_SPECIALITES + '')
	AND class2.id_iamclasse  = spclass2.id_iamclasse
	AND spclass2.id_specialite = spe2.id_specialite
	AND spe2.id_specialite IN ('' + @ID_SPECIALITES + '')
	AND spe1.id_specialite <> spe2.id_specialite
	ORDER BY 1''

	EXEC (@varRequete)
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetProfilParent_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetProfilParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetProfilParent_Id] (
						@The_Ide	INTEGER,
						@Ret		INTEGER OUTPUT
					 ) AS

-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur INTEGER

--BODY
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetProfilParent_Id'')

--STATS


	SET NOCOUNT ON

	-- INITIALISATION Code Erreur Proc
	SET @Erreur = 0

	SELECT b.THE_IDE AS ''RMC_THE_IDE'', b.TYPE_IDE, b.THE_CAF AS ''RMC_THE_CAF'', b.THE_LAF AS ''RMC_THE_LAF'', b.ID, b.THE_VIS AS ''RMC_THE_VIS'', b.DAT_MAJ, b.USR_MAJ, b.OBS_MAJ
	FROM RMC_THE b INNER JOIN RMC_THE_PRO a ON b.THE_IDE = a.THE_THE_IDE
	WHERE a.THE_IDE = @The_Ide


	IF @@ERROR != 0 
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	set @Ret = 0
		GOTO SORTIE
END

-- Gestion des erreurs
SORTIE_ERR:
	-- Sauvegarde de l''erreur
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	set @Ret = @Erreur

-- Cas de sortie sans erreur
SORTIE:
	RETURN @Ret










' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetSpe_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetSpe_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- -------------------------------------------------------------------
  -- Fonction   : RMC_GetSpe
  -- Objet      : Recherche des spécifications à partir (au choix)
  --              . D''un code CIP        : recherche hiérachique pere
  --              . D''une substance      : Recherche profil pere
  --              . D''une indication     : Recherche profil fils
  --              . D''une contre indic.  : Recherche profil fils
  --              . D''une classe thera.  : Recherche profil fils
  --              . D''une classe IAM     : Recherche profil père
  --              . D''un labo            : Recherche profil père
  --             : Modification #1
  --              . D''un labo            : Recherche profil fils
  --              . D''une classe IAM     : Recherche profil fils
  -- -------------------------------------------------------------------
  -- -------------------------------------------------------------------

CREATE PROCEDURE [dbo].[RMC_GetSpe_Id] 	(
						@The_Ide	INTEGER,
						@Type_Ide	INTEGER,
						@Ret		INTEGER OUTPUT				
					) AS

DECLARE @Erreur INTEGER
--DECLARE @Curseur CURSOR
DECLARE @TGetHIE VARCHAR(30)
DECLARE @REQ       VARCHAR(3000)
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetSpe_Id'')

--STATS


	EXEC p_RMC_Get_ @The_Ide, @Type_Ide, ''SPE'', @TGetHIE  OUTPUT -- @Curseur OUTPUT
	
	IF @Erreur != 0
	/*	GOTO SORTIE_ERR

	-- NOTE : On a gardé le curseur ouvert par p_RMCGetHie_Pro pour permettre l''accès à la table temporaire créée dans la procédure pré-citée
	SELECT * FROM ##GetHie_Pro
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE*/

		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
	-- NOTE : On a gardé le curseur ouvert par p_RMCGetHie_Pro pour permettre l''accès à la table temporaire créée dans la procédure pré-citée
	SET @REQ =''SELECT * FROM ##''+ @TGetHIE + ''  order by RMC_THE_LAF''
	EXEC(@REQ)

	IF @@ERROR != 0
		BEGIN
		GOTO SORTIE_ERR
		END
	ELSE
		BEGIN
		SET @Ret = 0
		GOTO SORTIE
		END
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret











' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetSpeLivret_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetSpeLivret_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetSpeLivret_Id]
(
	@The_Ide	INTEGER,
	@Type_Ide	INTEGER,
	@Hop		INTEGER,
	@Ret	INTEGER OUTPUT
) AS
-- Déclarations locales
DECLARE @Erreur INTEGER
DECLARE @TLIVGetHIE VARCHAR(30)
DECLARE @REQ       VARCHAR(3000)

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetSpeLivret_Id'')

--STATS


	-- Initialisation et optimisation
	SET NOCOUNT ON
	SET @Erreur = 0

	EXEC @Erreur = p_LIV_Get_ @The_Ide, @Type_Ide, ''SPE'', @Hop,  @TLIVGetHIE  OUTPUT
	IF @Erreur != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+ @TLIVGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+ @TLIVGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END

	-- NOTE : On a gardé le curseur ouvert par LIV_GetHie_Pro pour permettre l''accès
	--        à la table temporaire créée dans la procédure pré-citée
	SET @REQ =''SELECT * FROM ##''+@TLIVGetHIE+ '' order by the_laf''
	EXEC(@REQ)

	IF @@ERROR != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TLIVGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TLIVGetHIE                        EXEC(@Req)

		GOTO SORTIE_ERR
		END
	ELSE
		BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TLIVGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TLIVGetHIE                        EXEC(@Req)
		GOTO SORTIE
		END
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret














' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetSubst_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetSubst_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetSubst_Id]	(
						@The_Ide	INTEGER,
						@Type_Ide	INTEGER,
						@Ret		INTEGER OUTPUT				
					) AS

DECLARE @Erreur INTEGER
DECLARE @TGetHIE VARCHAR(30)
DECLARE @REQ       VARCHAR(3000)
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetSubst_Id'')

--STATS


	EXEC p_RMC_Get_ @The_Ide, @Type_Ide, ''SUB'',  @TGetHIE  OUTPUT
	IF @Erreur != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
	-- NOTE : On a gardé le curseur ouvert par p_RMCGetHie_Pro pour permettre l''accès à la table temporaire créée dans la procédure pré-citée
	SET @REQ =''SELECT * FROM ##''+ @TGetHIE
	EXEC(@REQ)

	IF @@ERROR != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
	ELSE
		BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE
		END
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret










' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetIndics_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIndics_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetIndics_Txt]
(
	@Libelle	VARCHAR(100)=NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER


-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetIndics_Txt'')

--STATS



	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON


	EXEC @Erreur = p_Translate_Upper @Libelle, @Result = @Libelle OUTPUT
	IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR
	
	
		SELECT
			ID_T_INDIC,
			LIBELLE,
			CAST(texte AS VARCHAR(3000)) AS ''TEXTE'',
			CONVERT(CHAR(10),creation,103) AS ''CREATION'',
			VALIDATION,
			CAST(remarques AS VARCHAR(3000)) AS ''REMARQUES'' 
                                        FROM T_INDIC
			WHERE  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(LIBELLE)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 

		

		UNION
		SELECT
			ind.id_t_indic,
			synind.libelle + '' = '' + ind.libelle,
			CAST(ind.texte AS VARCHAR(3000)) AS ''TEXTE'',
			CONVERT(CHAR(10),ind.creation,103) AS ''CREATION'',
			ind.validation,
			CAST(ind.remarques AS VARCHAR(3000)) AS ''REMARQUES''
		FROM T_SYNONYINDIC synind, SYNONYINDIC_REL synrel, T_INDIC ind
		WHERE synrel.id_t_synonyindic = synind.id_t_synonyindic
		             AND ind.id_t_indic = synrel.id_t_indic
			AND REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(synind.LIBELLE)	
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Libelle 
		ORDER BY 2




		SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	

	RETURN @Ret








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_GetThera_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_GetThera_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_GetThera_Id]	( 
						@The_Ide	INTEGER,
						@Type_Ide	INTEGER,
						@Ret		INTEGER OUTPUT				
					) AS

DECLARE @Erreur INTEGER
DECLARE @TGetHIE VARCHAR(30)
DECLARE @REQ       VARCHAR(3000)

BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_GetThera_Id'')

--STATS


	EXEC @Erreur = p_RMC_Get_ @The_Ide, @Type_Ide, ''THERA'', @TGetHIE  OUTPUT
	IF @Erreur != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END

	-- NOTE : On a gardé le curseur ouvert par p_RMCGetHie_Pro pour permettre l''accès à la table temporaire créée dans la procédure pré-citée
	SET @REQ =''SELECT * FROM ##''+ @TGetHIE
	EXEC(@REQ)

	IF @@ERROR != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE_ERR
		END
	ELSE
		BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TGetHIE+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TGetHIE                        EXEC(@Req)
		GOTO SORTIE
		END
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret










' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_IsHierarchyChild_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_IsHierarchyChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_IsHierarchyChild_Id] (
						@The_Ide	INTEGER,
						@The_Ide_Per	INTEGER,
						@Ret		INTEGER OUTPUT
					) AS

BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_IsHierarchyChild_Id'')

--STATS


	IF EXISTS ( SELECT 1 FROM RMC_THE_HIE WHERE THE_THE_IDE = @The_Ide_Per AND THE_IDE = @The_Ide ) 
		SET @Ret = 1
	ELSE
		SET @Ret = 0

	IF @@ERROR != 0
		RETURN @@ERROR

END







' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_IsHierarchyParent_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_IsHierarchyParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_IsHierarchyParent_Id] (
						@The_Ide	INTEGER,
						@The_Ide_Fis	INTEGER,
						@Ret		INTEGER OUTPUT
					) AS

BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_IsHierarchyParent_Id'')

--STATS


	IF EXISTS ( SELECT 1 FROM RMC_THE_HIE WHERE THE_THE_IDE = @The_Ide AND THE_IDE = @The_Ide_Fis ) 
		SET @Ret = 1
	ELSE
		SET @Ret = 0

	IF @@ERROR != 0
		RETURN @@ERROR

END








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetLabo_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetLabo_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetLabo_Id]
(
	@ID_LABORATOIRE	INTEGER=NULL,
	@Ret			INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetLabo_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	SELECT
		id_laboratoire, lab_id_laboratoire, laboratoire,
		adr1, adr2, adr3, cp, ville, cedex, pays,
		telephone, telecopie, email, internet,
		commentaire, mort,
		CONVERT(CHAR(10),dcreat,103) AS ''DCREAT'',
		CONVERT(CHAR(10),dmodif,103) AS ''DMODIF'',
		CONVERT(CHAR(10),drevis,103) AS ''DREVIS'', Vignette

	FROM LABORATOIRE
	WHERE (id_laboratoire = @ID_LABORATOIRE
	OR @ID_LABORATOIRE IS NULL)

	IF @@ERROR != 0	
		GOTO SORTIE_ERR


	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret










' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_IsProfilChild_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_IsProfilChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_IsProfilChild_Id] (
						@The_Ide	INTEGER,
						@The_Ide_Per	INTEGER,
						@Ret		INTEGER OUTPUT
					) AS

BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_IsProfilChild_Id'')

--STATS


	IF EXISTS ( SELECT 1 FROM RMC_THE_PRO WHERE THE_THE_IDE = @The_Ide_Per AND THE_IDE = @The_Ide ) 
		SET @Ret = 1
	ELSE
		SET @Ret = 0

	IF @@ERROR != 0
		RETURN @@ERROR

END








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetLabo_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetLabo_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetLabo_Txt]
(
	@Laboratoire	VARCHAR(255)=NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetLabo_Txt'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON
	
	EXEC @Erreur = p_Translate_Upper @Laboratoire, @Result = @Laboratoire OUTPUT
	IF @Erreur != 0	-- Cas d''erreur
		GOTO SORTIE_ERR

		SELECT
			id_laboratoire, lab_id_laboratoire, laboratoire,
			adr1, adr2, adr3, cp, ville, cedex, pays,
			telephone, telecopie, email, internet,
			commentaire, mort,
			CONVERT(CHAR(10),dcreat,103) AS ''DCREAT'',
			CONVERT(CHAR(10),dmodif,103) AS ''DMODIF'',
			CONVERT(CHAR(10),drevis,103) AS ''DREVIS'', vignette
		FROM LABORATOIRE
                          WHERE  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(laboratoire)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
			 LIKE  @Laboratoire 
		ORDER BY laboratoire

	IF @@ERROR != 0	-- Cas d''erreur	
		GOTO SORTIE_ERR


	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:	
	RETURN @Ret






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[RMC_IsProfilParent_Id]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_IsProfilParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[RMC_IsProfilParent_Id] (
						@The_Ide	INTEGER,
						@The_Ide_Fis	INTEGER,
						@Ret		INTEGER OUTPUT
					) AS

BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''RMC_IsProfilParent_Id'')

--STATS


	IF EXISTS ( SELECT 1 FROM RMC_THE_PRO WHERE THE_THE_IDE = @The_Ide AND THE_IDE = @The_Ide_Fis ) 
		SET @Ret = 1
	ELSE
		SET @Ret = 0

	IF @@ERROR != 0
		RETURN @@ERROR

END







' 
END
GO
/****** Objet :  Table [dbo].[SAUMON]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SAUMON]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SAUMON](
	[PRODUIT] [varchar](255)  NOT NULL,
	[DOCID] [varchar](255)  NOT NULL,
	[NOMCOMPLETMONO] [varchar](255)  NULL,
	[IDLABORATOIRE] [varchar](50)  NULL,
 CONSTRAINT [PK_SAUMON] PRIMARY KEY CLUSTERED 
(
	[PRODUIT]
)
)
END
GO
/****** Objet :  Table [dbo].[RMC_THE]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_THE]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RMC_THE](
	[THE_IDE] [int] NOT NULL,
	[TYPE_IDE] [int] NOT NULL,
	[THE_CAF] [varchar](60)  NULL,
	[THE_LAF] [varchar](255)  NOT NULL,
	[ID] [int] NOT NULL,
	[THE_VIS] [char](1)  NULL,
	[DAT_MAJ] [datetime] NULL,
	[USR_MAJ] [varchar](30)  NULL,
	[OBS_MAJ] [varchar](255)  NULL,
	[TMP_ORI_IDE] [int] NULL,
	[TMP_REG_IDE] [int] NULL,
 CONSTRAINT [PK_RMC_THE] PRIMARY KEY CLUSTERED 
(
	[THE_IDE]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[RMC_THE]') AND name = N'IX_ID_RMC_THE')
CREATE NONCLUSTERED INDEX [IX_ID_RMC_THE] ON [dbo].[RMC_THE] 
(
	[ID]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[RMC_THE]') AND name = N'TYPE_THESAURUS_FK')
CREATE NONCLUSTERED INDEX [TYPE_THESAURUS_FK] ON [dbo].[RMC_THE] 
(
	[TYPE_IDE]
)
GO
/****** Objet :  Table [dbo].[RMC_THE_REG]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_REG]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RMC_THE_REG](
	[REG_IDE] [int] NOT NULL,
	[THE_IDE] [int] NOT NULL,
 CONSTRAINT [PK_RMC_THE_REG] PRIMARY KEY CLUSTERED 
(
	[REG_IDE],
	[THE_IDE]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_REG]') AND name = N'LIEN_67_FK')
CREATE NONCLUSTERED INDEX [LIEN_67_FK] ON [dbo].[RMC_THE_REG] 
(
	[REG_IDE]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_REG]') AND name = N'LIEN_68_FK')
CREATE NONCLUSTERED INDEX [LIEN_68_FK] ON [dbo].[RMC_THE_REG] 
(
	[THE_IDE]
)
GO
/****** Objet :  Table [dbo].[RMC_CLE]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_CLE]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RMC_CLE](
	[CLE_IDE] [int] NOT NULL,
	[ORI_IDE] [int] NOT NULL,
	[TYPE_IDE] [int] NOT NULL,
	[CLE_LIB] [varchar](255)  NOT NULL,
	[DAT_MAJ] [datetime] NULL,
	[USR_MAJ] [varchar](30)  NULL,
	[OBS_MAJ] [varchar](255)  NULL,
	[TMP_THE_IDE] [int] NULL,
	[TMP_REG_IDE] [int] NULL,
 CONSTRAINT [PK_RMC_CLE] PRIMARY KEY CLUSTERED 
(
	[CLE_IDE]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[RMC_CLE]') AND name = N'IX_RMC_CLE_TYPE_IDE')
CREATE NONCLUSTERED INDEX [IX_RMC_CLE_TYPE_IDE] ON [dbo].[RMC_CLE] 
(
	[TYPE_IDE],
	[CLE_LIB],
	[CLE_IDE]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[RMC_CLE]') AND name = N'THE_ORI_FK')
CREATE NONCLUSTERED INDEX [THE_ORI_FK] ON [dbo].[RMC_CLE] 
(
	[ORI_IDE]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[RMC_CLE]') AND name = N'TYPE_MOT_CLE_FK')
CREATE NONCLUSTERED INDEX [TYPE_MOT_CLE_FK] ON [dbo].[RMC_CLE] 
(
	[TYPE_IDE]
)
GO
/****** Objet :  Table [dbo].[RMC_THE_CLE]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_CLE]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RMC_THE_CLE](
	[THE_IDE] [int] NOT NULL,
	[CLE_IDE] [int] NOT NULL,
	[REG_IDE] [int] NOT NULL,
 CONSTRAINT [PK_RMC_THE_CLE] PRIMARY KEY CLUSTERED 
(
	[THE_IDE],
	[CLE_IDE],
	[REG_IDE]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_CLE]') AND name = N'LIEN_61_FK')
CREATE NONCLUSTERED INDEX [LIEN_61_FK] ON [dbo].[RMC_THE_CLE] 
(
	[THE_IDE]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_CLE]') AND name = N'LIEN_62_FK')
CREATE NONCLUSTERED INDEX [LIEN_62_FK] ON [dbo].[RMC_THE_CLE] 
(
	[CLE_IDE]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_CLE]') AND name = N'LIEN_64_FK')
CREATE NONCLUSTERED INDEX [LIEN_64_FK] ON [dbo].[RMC_THE_CLE] 
(
	[REG_IDE]
)
GO
/****** Objet :  Table [dbo].[RMC_THE_HIE]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_HIE]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RMC_THE_HIE](
	[THE_IDE] [int] NOT NULL,
	[THE_THE_IDE] [int] NOT NULL,
	[DAT_MAJ] [datetime] NULL,
	[USR_MAJ] [varchar](30)  NULL,
	[OBS_MAJ] [varchar](255)  NULL,
 CONSTRAINT [PK_RMC_THE_HIE] PRIMARY KEY CLUSTERED 
(
	[THE_IDE],
	[THE_THE_IDE]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_HIE]') AND name = N'LIEN_59_FK')
CREATE NONCLUSTERED INDEX [LIEN_59_FK] ON [dbo].[RMC_THE_HIE] 
(
	[THE_IDE]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_HIE]') AND name = N'LIEN_60_FK')
CREATE NONCLUSTERED INDEX [LIEN_60_FK] ON [dbo].[RMC_THE_HIE] 
(
	[THE_THE_IDE]
)
GO
/****** Objet :  Table [dbo].[RMC_THE_PRO]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_PRO]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RMC_THE_PRO](
	[THE_IDE] [int] NOT NULL,
	[THE_THE_IDE] [int] NOT NULL,
	[NIVEAU] [numeric](10, 0) NULL,
	[DAT_MAJ] [datetime] NOT NULL,
	[USR_MAJ] [varchar](30)  NOT NULL,
	[OBS_MAJ] [varchar](255)  NULL,
 CONSTRAINT [PK_RMC_THE_PRO] PRIMARY KEY CLUSTERED 
(
	[THE_IDE],
	[THE_THE_IDE]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_PRO]') AND name = N'LIEN_56_FK')
CREATE NONCLUSTERED INDEX [LIEN_56_FK] ON [dbo].[RMC_THE_PRO] 
(
	[THE_IDE]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[RMC_THE_PRO]') AND name = N'LIEN_63_FK')
CREATE NONCLUSTERED INDEX [LIEN_63_FK] ON [dbo].[RMC_THE_PRO] 
(
	[THE_THE_IDE]
)
GO
/****** Objet :  Table [dbo].[RMOClass]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RMOClass]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RMOClass](
	[id_RMOClass] [T_COMPTEUR] NOT NULL,
	[id_ThemeCommun] [T_COMPTEUR] NULL,
	[referenceIRIS] [T_libelle20] NOT NULL,
	[texteRMO] [T_MEMO] NOT NULL,
	[codeJO] [T_libelle5] NOT NULL,
	[remarque] [T_TEXTE_LONG] NULL,
	[bRemInterne] [T_BOOLEEN] NOT NULL,
	[dCreat] [T_DATE_SYST] NULL,
	[dModif] [T_DATE_SYST] NULL,
	[dRevis] [T_DATE_SYST] NULL,
 CONSTRAINT [PK_RMOClass] PRIMARY KEY NONCLUSTERED 
(
	[id_RMOClass]
)
)
END
GO
/****** Objet :  Table [dbo].[SpePharmacodynamie]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpePharmacodynamie]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SpePharmacodynamie](
	[id_Specialite] [T_COMPTEUR] NOT NULL,
	[ATC_IRIS] [T_TEXTE_LONG] NULL,
	[bATC] [T_BOOLEEN] NOT NULL,
	[codeEPHMRA] [T_TEXTE_LONG] NULL,
	[commAMM] [T_MEMO] NULL,
	[dCreat] [T_DATE_SYST] NOT NULL,
	[dModif] [T_DATE_SYST] NULL,
	[CodeATC] [T_libelle50] NULL,
	[LibATC] [T_libelle200] NULL,
 CONSTRAINT [PK_SpePharmacodynamie] PRIMARY KEY NONCLUSTERED 
(
	[id_Specialite]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SpePharmacodynamie]') AND name = N'IX_CodeATC')
CREATE NONCLUSTERED INDEX [IX_CodeATC] ON [dbo].[SpePharmacodynamie] 
(
	[CodeATC]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SpePharmacodynamie]') AND name = N'IX_LibATC')
CREATE NONCLUSTERED INDEX [IX_LibATC] ON [dbo].[SpePharmacodynamie] 
(
	[LibATC]
)
GO
/****** Objet :  Table [dbo].[SpeCI]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeCI]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SpeCI](
	[id_Specialite] [T_COMPTEUR] NOT NULL,
	[id_SpeCI] [T_COMPTEUR] NOT NULL,
	[id_T_CI] [T_COMPTEUR] NOT NULL,
	[terme] [T_LIBELLE_100] NULL,
	[relatif] [T_BOOLEEN] NOT NULL,
	[dateRelatif] [T_DATE_SYST] NULL,
	[origineOVP] [T_BOOLEEN] NOT NULL,
	[dateOrigOVP] [T_DATE_SYST] NULL,
	[pertinentOVP] [T_BOOLEEN] NOT NULL,
	[argumentaireAuteur] [T_MEMO] NULL,
	[commAMM] [T_MEMO] NULL,
	[dCreat] [T_DATE_SYST] NULL,
	[dModif] [T_DATE_SYST] NULL,
	[ordre] [T_ORDRE] NOT NULL,
 CONSTRAINT [PK_SpeCI] PRIMARY KEY NONCLUSTERED 
(
	[id_SpeCI]
)
)
END
GO
/****** Objet :  Table [dbo].[Specialite]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Specialite]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Specialite](
	[id_Specialite] [T_COMPTEUR] NOT NULL,
	[bValid] [T_BOOLEEN] NULL,
	[bEnCours] [T_BOOLEEN] NULL,
	[NomUser] [T_libelle20] NULL,
	[denomSpe] [T_libelle128] NOT NULL,
	[forme] [T_TEXTE_LONG] NULL,
	[dosage] [T_TEXTE_LONG] NULL,
	[groupeDC] [T_TEXTE_LONG] NULL,
	[complement] [T_TEXTE_LONG] NULL,
	[commAMMPoso] [T_MEMO] NULL,
	[reserve] [T_BOOLEEN] NOT NULL,
	[inferieurAge] [T_OVP_ENTIERS] NULL,
	[unitInf] [T_TEXTE_LONG] NULL,
	[superieurAge] [T_OVP_ENTIERS] NULL,
	[unifSup] [T_TEXTE_LONG] NULL,
	[inferieurPoids] [T_OVP_FLOAT] NULL,
	[superieurPoids] [T_OVP_FLOAT] NULL,
	[denomAMM] [T_TEXTE_LONG] NULL,
	[numdosAMM] [T_libelle20] NULL,
	[SpeCategorie] [T_TEXTE_LONG] NULL,
	[source] [T_TEXTE_LONG] NULL,
	[dateSource] [T_DATE_SYST] NULL,
	[remarques] [T_MEMO] NULL,
	[dCreat] [T_DATE_SYST] NULL,
	[dModif] [T_DATE_SYST] NULL,
	[dRevis] [T_DATE_SYST] NULL,
	[idTypeSpe] [int] NULL,
	[bDopant] [T_BOOLEEN] NOT NULL,
 CONSTRAINT [PK_Specialite] PRIMARY KEY NONCLUSTERED 
(
	[id_Specialite]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[Specialite]') AND name = N'IX_denomSpe')
CREATE NONCLUSTERED INDEX [IX_denomSpe] ON [dbo].[Specialite] 
(
	[denomSpe]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[Specialite]') AND name = N'IX_denomSpe_Type')
CREATE NONCLUSTERED INDEX [IX_denomSpe_Type] ON [dbo].[Specialite] 
(
	[idTypeSpe],
	[denomSpe]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[Specialite]') AND name = N'IX_idTypeSpe')
CREATE NONCLUSTERED INDEX [IX_idTypeSpe] ON [dbo].[Specialite] 
(
	[idTypeSpe]
)
GO
/****** Objet :  Table [dbo].[Laboratoire]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Laboratoire]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Laboratoire](
	[id_Laboratoire] [T_COMPTEUR] NOT NULL,
	[Lab_id_Laboratoire] [T_COMPTEUR] NULL,
	[laboratoire] [T_TEXTE_LONG] NULL,
	[adr1] [T_libelle50] NULL,
	[adr2] [T_libelle50] NULL,
	[adr3] [T_libelle50] NULL,
	[cp] [T_libelle10] NULL,
	[ville] [T_libelle50] NULL,
	[cedex] [T_libelle10] NULL,
	[pays] [T_TEXTE_LONG] NULL,
	[telephone] [T_TELEPHONE] NULL,
	[telecopie] [T_libelle30] NULL,
	[email] [T_TELEPHONE] NULL,
	[internet] [T_TELEPHONE] NULL,
	[commentaire] [T_TEXTE_LONG] NULL,
	[mort] [T_BOOLEEN] NOT NULL,
	[dCreat] [T_DATE_SYST] NULL,
	[dModif] [T_DATE_SYST] NULL,
	[dRevis] [T_DATE_SYST] NULL,
	[Vignette] [int] NULL,
 CONSTRAINT [PK_Laboratoire] PRIMARY KEY NONCLUSTERED 
(
	[id_Laboratoire]
)
)
END
GO
/****** Objet :  Table [dbo].[T_Sub]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_Sub]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[T_Sub](
	[id_T_Sub] [T_COMPTEUR] NOT NULL,
	[libelle] [T_LIBELLE_100] NOT NULL,
	[homeopathie] [T_LIBELLE_1] NOT NULL,
	[texte] [T_MEMO] NULL,
	[DC] [T_TEXTE_LONG] NULL,
	[complementIndexSub] [T_BOOLEEN] NULL,
 CONSTRAINT [PK_T_Sub] PRIMARY KEY NONCLUSTERED 
(
	[id_T_Sub]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[T_Sub]') AND name = N'IX_Libelle')
CREATE NONCLUSTERED INDEX [IX_Libelle] ON [dbo].[T_Sub] 
(
	[libelle]
)
GO
/****** Objet :  Table [dbo].[T_CI_CIMCI_Rel]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_CI_CIMCI_Rel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[T_CI_CIMCI_Rel](
	[id_T_CI] [T_COMPTEUR] NOT NULL,
	[id_CimCI] [T_COMPTEUR] NOT NULL,
	[synonymie] [T_BOOLEEN] NOT NULL,
 CONSTRAINT [PK_T_CI_CIMCI_Rel] PRIMARY KEY NONCLUSTERED 
(
	[id_T_CI],
	[id_CimCI]
)
)
END
GO
/****** Objet :  Table [dbo].[Substance]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Substance]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Substance](
	[id_Substance] [T_COMPTEUR] NOT NULL,
	[bValid] [T_BOOLEEN] NULL,
	[bEnCours] [T_BOOLEEN] NULL,
	[NomUser] [T_TEXTE_LONG] NULL,
	[denomSub] [T_LIBELLE_100] NOT NULL,
	[homeo] [T_LIBELLE_1] NOT NULL,
	[CAS] [T_libelle15] NULL,
	[CASReplaced] [T_libelle15] NULL,
	[nature] [T_TEXTE_LONG] NULL,
	[chimie] [T_MEMO] NULL,
	[liste] [T_TEXTE_LONG] NULL,
	[commListe] [T_TEXTE_LONG] NULL,
	[origineExcipient] [T_LIBELLE_1] NULL,
	[dCreat] [T_DATE_SYST] NULL,
	[dModif] [T_DATE_SYST] NULL,
	[dRevis] [T_DATE_SYST] NULL,
	[ClassDopant] [T_TEXTE_LONG] NULL,
	[id_T_Sub] [T_COMPTEUR] NOT NULL,
 CONSTRAINT [PK_Substance] PRIMARY KEY NONCLUSTERED 
(
	[id_Substance]
)
)
END
GO
/****** Objet :  Table [dbo].[SpePresentation]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpePresentation]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SpePresentation](
	[id_SpePresentation] [T_COMPTEUR] NOT NULL,
	[id_Specialite] [T_COMPTEUR] NULL,
	[cip] [T_libelle7] NOT NULL,
	[ucd] [T_libelle7] NULL,
	[ammEurope] [T_libelle20] NULL,
	[liste] [T_TEXTE_LONG] NULL,
	[dureePrescription] [T_TEXTE_LONG] NULL,
	[prescriptionInitiale] [T_TEXTE_LONG] NULL,
	[prescriptionReservee] [T_TEXTE_LONG] NULL,
	[renouvelReserve] [T_TEXTE_LONG] NULL,
	[medPartic] [T_BOOLEEN] NOT NULL,
	[natureSurveillance] [T_MEMO] NULL,
	[prixProdHTF] [T_OVP_FLOAT] NULL,
	[prixPublicTTCF] [T_OVP_FLOAT] NULL,
	[prixProdHTE] [T_OVP_FLOAT] NULL,
	[prixPublicTTCE] [T_OVP_FLOAT] NULL,
	[tva] [T_TEXTE_LONG] NULL,
	[dCreat] [T_DATE_SYST] NULL,
	[dModif] [T_DATE_SYST] NULL,
	[dRevis] [T_DATE_SYST] NULL,
	[codeReferantGenerique] [T_LIBELLE_1] NULL,
	[cipreferant] [T_libelle7] NULL,
	[disponibilite] [T_libelle128] NULL,
	[nbPrise] [int] NULL,
	[PriseUnitaire] [T_TEXTE_LONG] NULL,
	[lieuDispo] [T_TEXTE_LONG] NULL,
	[condDispo] [T_TEXTE_LONG] NULL,
	[remplace] [T_libelle7] NULL,
	[sourceRemplace] [T_TEXTE_LONG] NULL,
	[dateSourceRemplace] [T_DATE_SYST] NULL,
	[remplacePar] [T_libelle7] NULL,
	[sourceRemplacePar] [T_TEXTE_LONG] NULL,
	[dateSourceRemplacePar] [T_DATE_SYST] NULL,
	[id_DicoCodeGene] [T_COMPTEUR] NULL,
	[Condi] [T_libelle50] NULL,
	[bHop] [T_BOOLEEN] NULL,
	[id_DicoEphmra] [T_COMPTEUR] NULL,
	[EAN13] [varchar](13)  NULL,
	[REFERENCECATALOGUE] [T_libelle20] NULL,
	[CLINIQUE] [T_BOOLEEN] NULL,
	[MARQUE] [T_libelle128] NULL,
	[CLASSIFICATIONSTRUCTUREE] [varchar](7)  NULL,
	[FAMILLESEMP_LIBELLE] [varchar](255)  NULL,
	[GRANDEURUNITEMESURE] [T_OVP_FLOAT] NULL,
	[REFERENCEUNITEMESURE] [varchar](30)  NULL,
	[CODEINVENTOREX] [varchar](2)  NULL,
	[LIBELLEINVENTOREX] [T_libelle128] NULL,
	[PRIXHOPITALHT] [T_OVP_FLOAT] NULL,
	[PRIXDEPARTLABORATOIREHT] [T_OVP_FLOAT] NULL,
	[TVAMULTIPLICATEUR] [T_OVP_FLOAT] NULL,
	[TVADIVISEUR] [T_OVP_FLOAT] NULL,
	[DUREESTOCKAGE] [T_OVP_ENTIERS] NULL,
	[TEMPSSTOCKAGE] [T_libelle50] NULL,
	[TEMPERATUREMIN] [T_OVP_ENTIERS] NULL,
	[TEMPERATUREMAX] [T_OVP_ENTIERS] NULL,
	[DUREEAPRESDESTOCKAGE] [T_OVP_ENTIERS] NULL,
	[TEMPSAPRESDESTOCKAGE] [T_libelle50] NULL,
	[POIDSNET] [T_OVP_FLOAT] NULL,
	[VOLUMENET] [T_OVP_FLOAT] NULL,
	[CODEB2] [varchar](3)  NULL,
	[TIPS] [T_libelle128] NULL,
	[FICHECARACTERISTIQUE] [T_MEMO] NULL,
	[BASEREMBOURSEMENT] [T_OVP_FLOAT] NULL,
	[CODEDISPO] [int] NOT NULL,
 CONSTRAINT [PK_SpePresentation] PRIMARY KEY NONCLUSTERED 
(
	[id_SpePresentation]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SpePresentation]') AND name = N'IX_cip')
CREATE NONCLUSTERED INDEX [IX_cip] ON [dbo].[SpePresentation] 
(
	[cip]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SpePresentation]') AND name = N'IX_cipReferant')
CREATE NONCLUSTERED INDEX [IX_cipReferant] ON [dbo].[SpePresentation] 
(
	[cipreferant]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SpePresentation]') AND name = N'IX_id_Specialite')
CREATE NONCLUSTERED INDEX [IX_id_Specialite] ON [dbo].[SpePresentation] 
(
	[id_Specialite]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SpePresentation]') AND name = N'IX_ucd')
CREATE NONCLUSTERED INDEX [IX_ucd] ON [dbo].[SpePresentation] 
(
	[ucd]
)
GO
/****** Objet :  Table [dbo].[SpePE]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpePE]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SpePE](
	[id_Specialite] [T_COMPTEUR] NOT NULL,
	[id_SpePE] [T_COMPTEUR] NOT NULL,
	[terme] [T_LIBELLE_100] NULL,
	[origineOVP] [T_BOOLEEN] NOT NULL,
	[dateOrigOVP] [T_DATE_SYST] NULL,
	[pertinentOVP] [T_BOOLEEN] NOT NULL,
	[argumentaireAuteur] [T_MEMO] NULL,
	[commAMM] [T_MEMO] NULL,
	[dCreat] [T_DATE_SYST] NULL,
	[dModif] [T_DATE_SYST] NULL,
	[ordre] [T_ORDRE] NOT NULL,
 CONSTRAINT [PK_SpePE] PRIMARY KEY NONCLUSTERED 
(
	[id_SpePE]
)
)
END
GO
/****** Objet :  Table [dbo].[SpeIndic]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeIndic]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SpeIndic](
	[id_Specialite] [T_COMPTEUR] NOT NULL,
	[id_SpeIndic] [T_COMPTEUR] NOT NULL,
	[id_T_Indic] [T_COMPTEUR] NOT NULL,
	[terme] [T_LIBELLE_100] NULL,
	[origineOVP] [T_BOOLEEN] NOT NULL,
	[dateOrigOVP] [T_DATE_SYST] NULL,
	[nonIndication] [T_BOOLEEN] NOT NULL,
	[argumentaireAuteur] [T_MEMO] NULL,
	[id_DicoComClassIRIS] [T_COMPTEUR] NULL,
	[classementIRIS] [T_TEXTE_LONG] NULL,
	[ppalClassIRIS] [T_BOOLEEN] NOT NULL,
	[classIRISVidal] [T_TEXTE_LONG] NULL,
	[classIRISLaboX] [T_TEXTE_LONG] NULL,
	[commAMM] [T_MEMO] NULL,
	[dCreat] [T_DATE_SYST] NULL,
	[dModif] [T_DATE_SYST] NULL,
	[ordre] [T_ORDRE] NOT NULL,
 CONSTRAINT [PK_SpeIndic] PRIMARY KEY NONCLUSTERED 
(
	[id_SpeIndic]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SpeIndic]') AND name = N'IX_id_DicoComClassIRIS')
CREATE NONCLUSTERED INDEX [IX_id_DicoComClassIRIS] ON [dbo].[SpeIndic] 
(
	[id_DicoComClassIRIS]
)
GO
/****** Objet :  Table [dbo].[SpeConstituant]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeConstituant]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SpeConstituant](
	[id_SpeConstituant] [T_COMPTEUR] NOT NULL,
	[id_SpeCompo] [T_COMPTEUR] NOT NULL,
	[denomSub] [T_LIBELLE_100] NULL,
	[homeopathie] [T_LIBELLE_1] NULL,
	[bConstActif] [T_BOOLEEN] NOT NULL,
	[natureExcip] [T_TEXTE_LONG] NULL,
	[prefixeConstituant] [T_TEXTE_LONG] NULL,
	[postFixeConstituant] [T_TEXTE_LONG] NULL,
	[dCreat] [T_DATE_SYST] NOT NULL,
	[excipientComm] [T_MEMO] NULL,
	[ordre] [T_ORDRE] NOT NULL,
	[id_T_Sub] [T_COMPTEUR] NULL,
	[tetiere] [T_TEXTE_LONG] NULL,
	[quantite] [T_OVP_FLOAT] NULL,
	[unite] [T_TEXTE_LONG] NULL,
 CONSTRAINT [PK_SpeConstituant] PRIMARY KEY NONCLUSTERED 
(
	[id_SpeConstituant]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SpeConstituant]') AND name = N'IX_denomsub')
CREATE NONCLUSTERED INDEX [IX_denomsub] ON [dbo].[SpeConstituant] 
(
	[denomSub]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SpeConstituant]') AND name = N'IX_id_SpeCompo')
CREATE NONCLUSTERED INDEX [IX_id_SpeCompo] ON [dbo].[SpeConstituant] 
(
	[id_SpeCompo]
)
GO
/****** Objet :  Table [dbo].[Documents]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Documents]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Documents](
	[id_document] [T_COMPTEUR] NOT NULL,
	[nom_fichier] [T_libelle15] NULL,
	[id_type] [T_OVP_ENTIERS] NULL,
	[html] [T_MEMO] NULL,
	[sgm] [T_MEMO] NULL,
	[date_maj] [datetime] NULL,
	[valide] [T_BOOLEEN] NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[id_document]
)
)
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCindic_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCindic_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCindic_Id]
(	@ID_T_CI	T_COMPTEUR=NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Déclarations
DECLARE	@NbTuples	INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCindic_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	-- (Re)création de la table temporaire
	-- et allocation du curseur à retourner
	-- selon le nombre de tuples trouvés
	SET @NbTuples = (SELECT COUNT(*) FROM HIERARCHIECI_REL
			WHERE id_t_ci_p = @ID_T_CI)
	IF @NbTuples = 0
	BEGIN
		-- AUCUN TUPLE TROUVE
		SELECT
			id_t_ci, libelle, CAST(texte AS VARCHAR(4000)) TEXTE,
			CONVERT(CHAR(10),creation,103) CREATION, validation,
			CAST(remarques AS VARCHAR(4000)) REMARQUES, 0 Haschild
		FROM T_CI
		WHERE id_t_ci = @ID_T_CI
		OR @ID_T_CI IS NULL
	END
	ELSE
	BEGIN
		-- AU MOINS UN TUPLE A ETE TROUVE
		SELECT
			id_t_ci, libelle, CAST(texte AS VARCHAR(4000)) TEXTE,
			CONVERT(CHAR(10),creation,103) CREATION, validation,
			CAST(remarques AS VARCHAR(4000)) REMARQUES, 1 Haschild
		FROM T_CI
		WHERE id_t_ci = @ID_T_CI
		OR @ID_T_CI IS NULL
	END

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret








' 
END
GO
/****** Objet :  Table [dbo].[Type_Documents]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Type_Documents]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Type_Documents](
	[id_type] [T_COMPTEUR] NOT NULL,
	[nom] [varchar](25)  NOT NULL,
 CONSTRAINT [PK_Type_Documents] PRIMARY KEY CLUSTERED 
(
	[id_type]
)
)
END
GO
/****** Objet :  Table [dbo].[T_SynonySub]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_SynonySub]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[T_SynonySub](
	[id_T_SynonySub] [T_COMPTEUR] NOT NULL,
	[libelle] [T_LIBELLE_100] NOT NULL,
	[texte] [T_MEMO] NULL,
	[source] [T_TEXTE_LONG] NULL,
	[DC] [T_TEXTE_LONG] NULL,
 CONSTRAINT [PK_T_SynonySub] PRIMARY KEY NONCLUSTERED 
(
	[id_T_SynonySub]
)
)
END
GO
/****** Objet :  Table [dbo].[T_SynonyIndic]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_SynonyIndic]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[T_SynonyIndic](
	[id_T_SynonyIndic] [T_COMPTEUR] NOT NULL,
	[libelle] [T_LIBELLE_100] NOT NULL,
	[texte] [T_MEMO] NULL,
	[creation] [T_DATE_SYST] NULL,
 CONSTRAINT [PK_T_SynonyIndic] PRIMARY KEY NONCLUSTERED 
(
	[id_T_SynonyIndic]
)
)
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCIndicChild_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCIndicChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCIndicChild_Id]
(
	@ID_T_CI	T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCIndicChild_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	SELECT
		t1.id_t_ci, t1.libelle, CAST(t1.texte AS VARCHAR(4000)) TEXTE,
		CONVERT(CHAR(10),t1.creation,103) CREATION,
		t1.validation, CAST(t1.remarques AS VARCHAR(4000)) REMARQUES,
		CASE t2.id_t_ci_f
			WHEN NULL THEN 0
			ELSE 1
		END AS ''HasChild''
	FROM T_CI t1 LEFT OUTER JOIN HIERARCHIECI_REL t2
			ON t1.id_t_ci = t2.id_t_ci_p
	WHERE t1.id_t_ci IN (
				SELECT t3.id_t_ci_f FROM HIERARCHIECI_REL t3
				WHERE t3.id_t_ci_p = @ID_T_CI	
			    )
	GROUP BY
		t1.id_t_ci, t1.libelle, CAST(t1.texte AS VARCHAR(4000)),
		t1.creation, t1.validation,
		CAST(t1.remarques AS VARCHAR(4000)),
		CASE t2.id_t_ci_f
			WHEN NULL THEN 0
			ELSE 1
		END

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCIndicParent_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCIndicParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCIndicParent_Id]
(
	@ID_T_CI	T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCIndicParent_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	SELECT
		t1.id_t_ci, t1.libelle, CAST(t1.texte AS VARCHAR(4000)) TEXTE,
		CONVERT(CHAR(10),t1.creation,103) CREATION,
		t1.validation, CAST(t1.remarques AS VARCHAR(4000)) REMARQUES, 1 HasChild
	FROM T_CI t1, HIERARCHIECI_REL t2
	WHERE t2.id_t_ci_f = @ID_T_CI
	AND t1.id_t_ci = t2.id_t_ci_p

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCIndicSpes_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCIndicSpes_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCIndicSpes_Id]
(
	@IDContreIndic	T_COMPTEUR=NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCIndicSpes_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	SELECT
		t2.id_specialite, t2.bvalid, t2.bencours, t2.nomuser, t2.denomspe,
		t2.forme, t2.dosage, t2.complement,
		CAST(commammposo AS VARCHAR(4000)) AS ''COMMAMMPOSO'',
		t2.reserve, t2.inferieurage, t2.unitinf, t2.superieurage,
		t2.unifsup, t2.inferieurpoids, t2.superieurpoids, t2.denomamm,
		t2.numdosamm, t2.specategorie, t2.source,
		CONVERT(CHAR(10),t2.datesource,103) AS ''DATESOURCE'',
		CAST(t2.remarques AS VARCHAR(4000)) AS ''REMARQUES'',
		CONVERT(CHAR(10),t2.dcreat,103) AS ''DCREAT'',
		CONVERT(CHAR(10),t2.dmodif,103) AS ''DMODIF'',
		CONVERT(CHAR(10),t2.drevis,103) AS ''DREVIS''
	FROM SPECIALITE t2, SPECI t1
	WHERE t1.id_t_ci = @IDContreIndic
	AND t2.id_specialite = t1.id_specialite

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCip_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCip_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCip_Id]
(
	@Id_SpePresentation	T_COMPTEUR = NULL,
	@Ret			INTEGER OUTPUT
) AS

-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur		INTEGER
DECLARE @Req	VARCHAR(1000)
DECLARE @TTCIPSPE     VARCHAR(1000)

BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCip_Id'')

--STATS


	SET NOCOUNT ON
	SET @Erreur = 0

	EXEC @Erreur = p_GetCip @Id_SpePresentation, NULL, ''SPE'', @TTCIPSPE OUTPUT
	IF @Erreur != 0
		SET @Ret = @@ERROR
	ELSE
	BEGIN
		-- On garde le curseur ouvert pour avoir accès à la table temporaire créée dans p_GetCip
		SET @Req = ''SELECT * FROM ##'' + @TTCIPSPE
		EXEC(@Req)

		-- TEST ERREUR
	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TTCIPSPE+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPSPE
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TTCIPSPE+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPSPE
                           EXEC(@Req)
                           GOTO SORTIE
                      END

	END
END

SORTIE:
	RETURN @Ret

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCIndicCIM10s_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCIndicCIM10s_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCIndicCIM10s_Id] ( @Id_CIndic    T_compteur=null,                                      
				       @Ret INTEGER OUTPUT
				) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER

-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCIndicCIM10s_Id'')

--STATS


	SET NOCOUNT  ON

	-- INITIALISATION VARIABLE D''ERREUR
	SET @Erreur = 0

	-- DEFINITION DU CURSEUR DE SORTIE
        SELECT d.ID_DICORF_CIM, d.libelle
        FROM CimCI c INNER JOIN T_CI_CIMCI_Rel  b 
		     ON c.id_CimCI = b.id_CimCI 
		     INNER JOIN T_CI a 
                     ON b.id_T_CI = a.id_T_CI 
		     INNER JOIN  DicoRF_CIM d 
                     ON c.codeCim = d.libelle
	WHERE   a.ID_T_CI = @Id_CIndic

	-- CONTROLE DEFINITION
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

--- CHARGEMENT ERREUR DANS RET
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret











' 
END
GO
/****** Objet :  StoredProcedure [dbo].[P_Upd_Livret]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[P_Upd_Livret]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[P_Upd_Livret] 	(
						@Param 		T_COMPTEUR,
						@Id_SpePresentation 	T_COMPTEUR,
						@Id_Organisme 		T_COMPTEUR,
						@Prix_TTC_F 		T_OVP_FLOAT,
						@Prix_TTC_E 		T_OVP_FLOAT,
						@Dispo 		T_LIBELLE60,
						@Commentaire 		T_TEXTE_LONG,
						@CodeHopital 		T_LIBELLE30,
						@Cod_Trt 		T_TEXTE_LONG 	OUTPUT
					)
					AS
-- DECLARATIONS LOCALES
DECLARE @Erreur 	INTEGER
DECLARE @Prix_E	REAL
DECLARE @Prix_F	REAL


-- BODY PROC
BEGIN
	SET NOCOUNT  ON


	-- INITIALISATION VARIABLE D''ERREUR
	SET @Erreur = 0

	SET @Cod_Trt = ''''
	IF @@ERROR != 0 GOTO SORTIE_ERR

	IF ISNUMERIC( @Prix_TTC_F ) = 1
		SET @Prix_F = CAST(@Prix_TTC_F  AS REAL )
	ELSE
		GOTO SORTIE

	IF ISNUMERIC( @Prix_TTC_E ) = 1
		SET @Prix_E = CAST(@Prix_TTC_E  AS REAL )
	ELSE
		GOTO SORTIE


	IF @Param = 1 
	BEGIN
		BEGIN TRANSACTION

		UPDATE LIVRETVIDAL
			SET 	PRIX_TTC_F 	= @Prix_F,
				PRIX_TTC_E  	= @Prix_E,
				DISPO       	= @Dispo,
        				COMMENTAIRE = @Commentaire,
				CODHOPITAL  	= @CodeHopital
    			WHERE ID_SPEPRESENTATION = @Id_SpePresentation AND IDORGANISME = @Id_Organisme

		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END
		COMMIT TRANSACTION
		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END
		SET @Cod_Trt = ''SQL-00000 : Normal, Successful completion''
		IF @@ERROR != 0 GOTO SORTIE_ERR		
	END
	ELSE IF @Param = 2 
	BEGIN
		BEGIN TRANSACTION

		UPDATE LIVRETHOP
			SET 	PRIX_TTC_F 	= @Prix_F,
				PRIX_TTC_E  	= @Prix_E,
				DISPO       	= @Dispo,
        				COMMENTAIRE = @Commentaire,
				CODHOPITAL  	= @CodeHopital
    			WHERE ID_SPEPRESENTATIONHOP = @Id_SpePresentation AND IDORGANISME = @Id_Organisme

		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END
		COMMIT TRANSACTION
		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END
		SET @Cod_Trt = ''SQL-00000 : Normal, Successful completion''
		IF @@ERROR != 0 GOTO SORTIE_ERR ELSE GOTO SORTIE		
	END
		
END

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Cod_Trt = ''SQL-'' + CAST(@@ERROR AS VARCHAR(10)) + '' : Error execution''


	RETURN @Erreur









' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCIndicAncesters_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCIndicAncesters_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCIndicAncesters_Id]
(
	@ID_T_CI	T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCIndicAncesters_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	SELECT
		id_t_ci, libelle, CAST(texte AS VARCHAR(3000)) TEXTE,
		CONVERT(CHAR(10),creation,103) CREATION,
		validation, CAST(remarques AS VARCHAR(3000)) REMARQUES, 1 HasChild
	FROM T_CI
	WHERE (id_t_ci =@ID_T_CI
	OR @ID_T_CI IS NULL)
	AND NOT EXISTS(	SELECT t2.id_t_ci_f FROM HIERARCHIECI_REL t2
			WHERE t2.id_t_ci_f = id_t_ci)
	-- AND validation = ''V''

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret









' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCipFull_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipFull_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCipFull_Id]
(
	@Id_SpePresentation	T_COMPTEUR = NULL,
	@Ret			INTEGER OUTPUT
) AS
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCipFull_Id'')

--STATS


	SET NOCOUNT ON
--Modif le 090204
	SELECT DISTINCT
		a.ID_SPEPRESENTATION, a.ID_SPECIALITE, a.CIP,
		a.UCD, a.AMMEUROPE, a.LIEUDISPO,
		a.CONDDISPO, a.LISTE, a.DUREEPRESCRIPTION,
		a.PRESCRIPTIONINITIALE, a.PRESCRIPTIONRESERVEE,
		a.RENOUVELRESERVE, a.MEDPARTIC,
		CAST( a.NATURESURVEILLANCE AS VARCHAR(4000)) AS ''NATURESURVEILLANCE'',
		a.CODEREFERANTGENERIQUE, a.REMPLACE, a.SOURCEREMPLACE,
		CONVERT(CHAR(10), a.DATESOURCEREMPLACE, 103) AS ''DATESOURCEREMPLACE'',
		a.REMPLACEPAR, a.SOURCEREMPLACEPAR,
		CONVERT(CHAR(10), a.DATESOURCEREMPLACEPAR, 103) AS ''DATESOURCEREMPLACEPAR'',
		a.PRIXPRODHTF, a.PRIXPUBLICTTCF,
		a.PRIXPRODHTE, a.PRIXPUBLICTTCE, a.TVA,
		CONVERT(CHAR(10), a.DCREAT, 103) AS ''DCREAT'',
		CONVERT(CHAR(10), a.DMODIF, 103) AS ''DMODIF'',
		CONVERT(CHAR(10), a.DREVIS, 103) AS ''DREVIS'',
		a.CIPREFERANT, 
		CASE 
			WHEN a.condi IS NULL THEN b.DENOMSPE
			ELSE b.DENOMSPE + '':'' + a.condi
		END DenomCip,
		a.EAN13, a.REFERENCECATALOGUE, a.CLINIQUE, a.MARQUE,
		a.CLASSIFICATIONSTRUCTUREE, a.FAMILLESEMP_LIBELLE,
		a.GRANDEURUNITEMESURE, a.REFERENCEUNITEMESURE, a.CODEINVENTOREX,
		a.LIBELLEINVENTOREX, a.PRIXHOPITALHT, a.PRIXDEPARTLABORATOIREHT,
		a.TVAMULTIPLICATEUR, a.TVADIVISEUR, a.DUREESTOCKAGE, a.TEMPSSTOCKAGE,
		a.TEMPERATUREMIN, a.TEMPERATUREMAX, a.DUREEAPRESDESTOCKAGE,
		a.TEMPSAPRESDESTOCKAGE, a.POIDSNET, a.VOLUMENET, a.CODEB2,
		a.TIPS,
		CAST(a.FICHECARACTERISTIQUE AS VARCHAR(4000)) AS ''FICHECARACTERISTIQUE'',
		a.BASEREMBOURSEMENT,a.disponibilite,  a.nbprise, a.priseunitaire
	FROM SPECIALITE b	INNER JOIN SPEPRESENTATION a ON b.ID_SPECIALITE = a.ID_SPECIALITE
				--INNER JOIN SPEPRESENTATION_ETENDUE c ON a.ID_SPEPRESENTATION = c.ID_SPEPRESENTATION
				--supprimé le 090204LEFT OUTER JOIN SPECONDITIONNEMENTPRIMAIRE d ON d.ID_SPEPRESENTATION = a.ID_SPEPRESENTATION
	WHERE a.Id_Spepresentation = @Id_SpePresentation
	--supprimé le 090204 AND ( d.TYPECONDPRIMAIRE IS NULL OR UPPER(d.TYPECONDPRIMAIRE) = ''DENOMCIP'' )

	IF @@ERROR != 0
		SET @Ret = @@ERROR
	ELSE
		SET @Ret = 0
END

SORTIE:
	RETURN @Ret








' 
END
GO
/****** Objet :  Table [dbo].[DicoCodeGene]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DicoCodeGene]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DicoCodeGene](
	[id_DicoCodeGene] [T_COMPTEUR] NOT NULL,
	[libelle] [T_TEXTE_LONG] NOT NULL,
	[ordre] [T_ORDRE] NOT NULL,
	[CodeIndic] [T_OVP_ENTIERS] NOT NULL,
	[CodeCI] [T_OVP_ENTIERS] NOT NULL,
	[CodeCIAllergies] [T_OVP_ENTIERS] NOT NULL,
	[CodeIAM] [T_OVP_ENTIERS] NOT NULL,
	[CodeExpEN] [T_OVP_ENTIERS] NOT NULL,
 CONSTRAINT [PK_DICOCODEGENE] PRIMARY KEY CLUSTERED 
(
	[id_DicoCodeGene]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[DicoCodeGene]') AND name = N'IX_LIBELLE')
CREATE NONCLUSTERED INDEX [IX_LIBELLE] ON [dbo].[DicoCodeGene] 
(
	[libelle]
)
GO
/****** Objet :  StoredProcedure [dbo].[GetCipDoc_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipDoc_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCipDoc_Id]
(
	@Id_SpePresentation	T_COMPTEUR=NULL,
	@Ret			INTEGER OUTPUT
) AS
DECLARE @Erreur	INTEGER
DECLARE @Curseur	CURSOR

DECLARE @varIDSuivi	INTEGER
DECLARE @varIDPres	INTEGER
DECLARE @varMono	VARCHAR(9)
DECLARE @TTCIPDOC 	VARCHAR(25)
DECLARE @Req           VARCHAR(1000)
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCipDoc_Id'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON


	-- Recherche des infos
	EXEC p_GetCipDoc @Id_SpePresentation, NULL, ''SPE'', @TTCIPDOC OUTPUT


	-- Lecture des infos
	SET @Req = ''SELECT * FROM ##'' + @TTCIPDOC
	EXEC(@Req)


	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM  tempdb..sysobjects  WHERE NAME = ''''##''+@TTCIPDOC+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPDOC
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM  tempdb..sysobjects  WHERE NAME = ''''##''+@TTCIPDOC+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPDOC
                           EXEC(@Req)
                           GOTO SORTIE
                      END

END


SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret







' 
END
GO
/****** Objet :  Table [dbo].[GroupIndic_DicoRF_CIM_Rel]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GroupIndic_DicoRF_CIM_Rel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupIndic_DicoRF_CIM_Rel](
	[id_GroupIndic] [T_COMPTEUR] NOT NULL,
	[id_DicoRF_CIM] [T_COMPTEUR] NOT NULL,
	[id_DicoQualifLienTerme] [T_COMPTEUR] NOT NULL,
	[texte] [T_MEMO] NULL,
	[dCreat] [T_DATE_SYST] NULL,
 CONSTRAINT [PK_GroupIndic_DicoRF_CIM_Rel] PRIMARY KEY CLUSTERED 
(
	[id_GroupIndic],
	[id_DicoRF_CIM]
)
)
END
GO
/****** Objet :  Table [dbo].[T_SUBHOPTEMP]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_SUBHOPTEMP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[T_SUBHOPTEMP](
	[IDORGANISME] [T_OVP_ENTIERS] NOT NULL,
	[ID_T_SUBHOP] [T_COMPTEUR] NOT NULL,
	[LIBELLE] [T_libelle50] NULL,
 CONSTRAINT [PK_T_SUBHOPTEMP] PRIMARY KEY NONCLUSTERED 
(
	[IDORGANISME],
	[ID_T_SUBHOP]
)
)
END
GO
/****** Objet :  Table [dbo].[DicoT_ATC_IRIS]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DicoT_ATC_IRIS]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DicoT_ATC_IRIS](
	[id_DicoT_ATC_IRIS] [T_COMPTEUR] NOT NULL,
	[Dic_id_DicoT_ATC_IRIS] [T_COMPTEUR] NULL,
	[libelle] [T_TEXTE_LONG] NOT NULL,
	[ordre] [T_ORDRE] NOT NULL,
	[CodeATC] [T_libelle50] NULL,
	[LibATC] [T_libelle200] NULL,
 CONSTRAINT [PK_DICOT_ATC_IRIS] PRIMARY KEY CLUSTERED 
(
	[id_DicoT_ATC_IRIS]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[DicoT_ATC_IRIS]') AND name = N'IX_CodeATC')
CREATE NONCLUSTERED INDEX [IX_CodeATC] ON [dbo].[DicoT_ATC_IRIS] 
(
	[CodeATC]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[DicoT_ATC_IRIS]') AND name = N'IX_LibATC')
CREATE NONCLUSTERED INDEX [IX_LibATC] ON [dbo].[DicoT_ATC_IRIS] 
(
	[LibATC]
)
GO
/****** Objet :  Table [dbo].[T_SUBHOP]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_SUBHOP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[T_SUBHOP](
	[IDORGANISME] [T_OVP_ENTIERS] NOT NULL,
	[ID_T_SUBHOP] [T_COMPTEUR] IDENTITY(1,1) NOT NULL,
	[LIBELLE] [T_libelle50] NULL,
 CONSTRAINT [PK__T_SUBHOP__7660F977] PRIMARY KEY CLUSTERED 
(
	[IDORGANISME],
	[ID_T_SUBHOP]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[T_SUBHOP]') AND name = N'ASSOC_48_FK')
CREATE NONCLUSTERED INDEX [ASSOC_48_FK] ON [dbo].[T_SUBHOP] 
(
	[IDORGANISME]
)
GO
/****** Objet :  StoredProcedure [dbo].[GetCipsWithLivret_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipsWithLivret_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- ---------------------------------------------------------------
  -- Fonction de sélection  : GetCipsWithLivret
  -- Toutes les colonnes
  -- Retour par ref_Cursor
  -- Permet d''obtenir les CIP rattachés aux libellés des substances
  -- ( ou aux substances filles ) ou des spécialités passés en
  -- paramètre (selon le typ).
  -- La recherche se fera selon la demande :
  --          * dans la Banque VIDAL
  --          * dans le livret VIDAL de l''hôpital concerné
  --          * dans le livret HOPITAL de l''hôpital concerné
  --    OU    * seulement dans les livrets de l''organisme concerné
  -- Résultats restitués selon différents ordres.
  -- ---------------------------------------------------------------
CREATE PROCEDURE [dbo].[GetCipsWithLivret_Id](
							@Terme 		T_COMPTEUR,
							@Type 		INTEGER,
							@Domain 	INTEGER,
							@Ordre 		INTEGER=1,
							@Banque 	VARCHAR(1),
							@Id_Hop 	INTEGER,
							@Ret 		INTEGER	OUTPUT
					) AS
-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur 	INTEGER
DECLARE @Curseur	CURSOR
DECLARE @Req	VARCHAR(1000)
DECLARE @TTCIPS      VARCHAR(1000)
--BODY
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCipsWithLivret_Id'')

--STATS


	SET NOCOUNT  ON

	-- INITIALISATION Code Erreur Proc
	SET @Erreur =0

	EXEC @Erreur = p_GetCipsWithLivret @Terme, null, @Type, @Domain, @Ordre, @Banque, @Id_Hop, @TTCIPS OUTPUT

	IF @Erreur != 0
		GOTO SORTIE_ERR

	-- NOTE : On a gardé le curseur ouvert par p_GetCipsWith Livret pour permettre l''accès à la table temporaire créée dans la procédure pré-citée         

	--SELECT * FROM ##Tmp_GetCips
             SET  @Req = ''SELECT * FROM ##'' + @TTCIPS
	EXEC(@Req)


	-- TEST ERREUR
	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM    tempdb..sysobjects   WHERE NAME = ''''##''+@TTCIPS+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPS
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM    tempdb..sysobjects   WHERE NAME = ''''##''+@TTCIPS+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPS
                           EXEC(@Req)
                           GOTO SORTIE
                      END


END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret









' 
END
GO
/****** Objet :  Table [dbo].[DicoRF_CIM]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DicoRF_CIM]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DicoRF_CIM](
	[id_DicoRF_CIM] [T_COMPTEUR] NOT NULL,
	[libelle] [T_TEXTE_LONG] NOT NULL,
	[ordre] [T_ORDRE] NOT NULL,
 CONSTRAINT [PK_DICORF_CIM] PRIMARY KEY CLUSTERED 
(
	[id_DicoRF_CIM]
)
)
END
GO
/****** Objet :  Table [dbo].[SPEPRESENTATIONHOPTEMP]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SPEPRESENTATIONHOPTEMP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SPEPRESENTATIONHOPTEMP](
	[IDORGANISME] [T_OVP_ENTIERS] NOT NULL,
	[ID_SPEPRESENTATIONHOP] [T_COMPTEUR] NOT NULL,
	[NOM] [T_libelle50] NULL,
	[PRESENTATION] [T_libelle50] NULL,
	[FORME] [T_libelle50] NULL,
	[DOSAGE] [T_libelle50] NULL,
	[CIP] [T_libelle7] NULL,
	[UCD] [T_libelle7] NULL,
	[LABO] [T_libelle60] NULL,
 CONSTRAINT [PK_SPEPRESENTATIONHOPTEMP] PRIMARY KEY NONCLUSTERED 
(
	[IDORGANISME],
	[ID_SPEPRESENTATIONHOP]
)
)
END
GO
/****** Objet :  Table [dbo].[DicoComClassIRIS]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DicoComClassIRIS]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DicoComClassIRIS](
	[id_DicoComClassIRIS] [T_COMPTEUR] NOT NULL,
	[Dic_id_DicoComClassIRIS] [T_COMPTEUR] NULL,
	[libelle] [T_TEXTE_LONG] NOT NULL,
	[ordre] [T_ORDRE] NOT NULL,
	[multicritere] [T_TEXTE_LONG] NULL,
 CONSTRAINT [PK_DICOCOMCLASSIRIS] PRIMARY KEY CLUSTERED 
(
	[id_DicoComClassIRIS]
)
)
END
GO
/****** Objet :  Table [dbo].[SPEPRESENTATIONHOP]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SPEPRESENTATIONHOP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SPEPRESENTATIONHOP](
	[IDORGANISME] [T_OVP_ENTIERS] NOT NULL,
	[ID_SPEPRESENTATIONHOP] [T_COMPTEUR] IDENTITY(1,1) NOT NULL,
	[NOM] [T_libelle200] NULL,
	[PRESENTATION] [T_libelle50] NULL,
	[FORME] [T_libelle50] NULL,
	[DOSAGE] [T_libelle50] NULL,
	[CIP] [T_libelle7] NULL,
	[UCD] [T_libelle7] NULL,
	[LABO] [T_libelle60] NULL,
 CONSTRAINT [PK__SPEPRESENTATIONH__756CD53E] PRIMARY KEY CLUSTERED 
(
	[IDORGANISME],
	[ID_SPEPRESENTATIONHOP]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SPEPRESENTATIONHOP]') AND name = N'ASSOC_131_FK')
CREATE NONCLUSTERED INDEX [ASSOC_131_FK] ON [dbo].[SPEPRESENTATIONHOP] 
(
	[IDORGANISME]
)
GO
/****** Objet :  StoredProcedure [dbo].[GetCipSpe_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipSpe_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCipSpe_Id]
(
	@Id_SpePresentation	T_COMPTEUR = NULL,
	@Ret			INTEGER OUTPUT
) AS
-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur		INTEGER
DECLARE @TTCIPSPE	VARCHAR(30)
DECLARE @Req varchar(4000)

BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCipSpe_Id'')

--STATS


	SET NOCOUNT ON
	SET @Erreur = 0

	EXEC @Erreur = p_GetCipSpe @Id_SpePresentation, NULL, ''SPE'', @TTCIPSPE OUTPUT
	IF @Erreur != 0
		SET @Ret = @@ERROR
	ELSE
	BEGIN
		-- On garde le curseur ouvert pour avoir accès à la table temporaire créée dans p_GetCip
		SET @Req = ''SELECT * FROM ##'' +@TTCIPSPE
                           EXEC(@Req)


	-- TEST ERREUR
	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TTCIPSPE+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPSPE
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM  tempdb..sysobjects  WHERE NAME = ''''##''+@TTCIPSPE+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPSPE
                           EXEC(@Req)
                           GOTO SORTIE
                      END
	
	END
END

SORTIE:
	RETURN @Ret

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetIndicSPs_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIndicSPs_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetIndicSPs_Id]
(
	@ID_T_INDIC	T_COMPTEUR=NULL,
	@Ret		INTEGER OUTPUT
) AS
-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetIndicSPs_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	SELECT  b.ID_GROUPINDIC, b.LIBELLE, b.TYPE
	FROM GROUPINDIC b INNER JOIN GROUPINDICINDIC_REL a ON b.ID_GROUPINDIC = a.ID_GROUPINDIC
	Where a.ID_T_INDIC    = @ID_T_INDIC

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetIndicSpes_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIndicSpes_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetIndicSpes_Id]
(
	@ID_T_INDIC	T_COMPTEUR=NULL,
	@Ret		INTEGER OUTPUT
) AS
-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetIndicSpes_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	-- (Re)création de la table temporaire
	Select b.ID_SPECIALITE, b.BVALID, b.BENCOURS, b.NOMUSER,
		b.DENOMSPE, b.FORME, b.DOSAGE, b.complement,
		CAST(b.COMMAMMPOSO AS VARCHAR(4000)) AS ''COMMAMMPOSO'',
		b.RESERVE, b.INFERIEURAGE, b.UNITINF,
		b.SUPERIEURAGE, b.UNIFSUP, b.INFERIEURPOIDS, b.SUPERIEURPOIDS,
		b.DENOMAMM, b.NUMDOSAMM, b.SPECATEGORIE, b.SOURCE,
		CONVERT(CHAR(10), b.DATESOURCE,103) AS ''DATESOURCE'',
		CAST(b.REMARQUES AS VARCHAR(4000)) AS ''REMARQUES'',
		CONVERT(char(10),  b.DCREAT,103) AS ''DCREAT'', 
		CONVERT(char(10), b.DMODIF,103) AS ''DMODIF'',
		CONVERT(char(10),  b.DREVIS,103) AS ''DREVIS''
	FROM SPECIALITE b INNER JOIN  SPEINDIC a ON  b.ID_SPECIALITE = a.ID_SPECIALITE
	WHERE (a.Id_T_Indic = @Id_T_Indic Or @Id_T_Indic Is NULL)

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetIAMClassSpes_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIAMClassSpes_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetIAMClassSpes_Id]
(
	@ID_IAMClasse	T_COMPTEUR=NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetIAMClassSpes_Id'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	SELECT
		t2.id_specialite, t2.bvalid, t2.bencours, t2.nomuser, t2.denomspe,
		t2.forme, t2.dosage, t2.complement,
		CAST(commammposo AS VARCHAR(4000)) AS ''COMMAMMPOSO'',
		t2.reserve, t2.inferieurage, t2.unitinf, t2.superieurage,
		t2.unifsup, t2.inferieurpoids, t2.superieurpoids, t2.denomamm,
		t2.numdosamm, t2.specategorie, t2.source,
		CONVERT(CHAR(10),t2.datesource,103) AS ''DATESOURCE'',
		CAST(t2.remarques AS VARCHAR(4000)) AS ''REMARQUES'',
		CONVERT(CHAR(10),t2.dcreat,103) AS ''DCREAT'',
		CONVERT(CHAR(10),t2.dmodif,103) AS ''DMODIF'',
		CONVERT(CHAR(10),t2.drevis,103) AS ''DREVIS''
	FROM SPECIALITE t2, SPECIALITE_IAMCLASS t1
	WHERE t1.id_iamclasse = @ID_IAMClasse
	AND t2.id_specialite = t1.id_specialite

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetIndic_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIndic_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetIndic_Id]
(
	@ID_T_INDIC	T_COMPTEUR=NULL,                                  
	@Ret		INTEGER OUTPUT
) AS
-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetIndic_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	-- (Re)création de la table temporaire
	Select
		ID_T_INDIC, LIBELLE,
		CAST(TEXTE AS VARCHAR(4000)) AS ''TEXTE'',
		CONVERT(char(10), CREATION, 103) ''CREATION'',
		VALIDATION,  CAST(REMARQUES  AS VARCHAR(4000)) AS ''REMARQUES''
	From T_INDIC
	Where (ID_T_INDIC = @ID_T_INDIC Or @ID_T_INDIC is NULL)

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetIAMClassIAMClasses_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIAMClassIAMClasses_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetIAMClassIAMClasses_Id]
(
	@ID_IAMClasse	T_COMPTEUR=NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER
DECLARE @varRequete	VARCHAR(4000)

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetIAMClassIAMClasses_Id'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	SET @varRequete =
	''SELECT
		'' + CONVERT(CHAR(4), @ID_IAMClasse) + '' AS "id_iamclasse",
		class.id_iamclasse AS "id_iamclasse_2",
		class.classe,
		couple.niveaugravite,
		couple.risqetmecan,
		couple.conduiteatenir,
		couple.remarque,
		CONVERT(CHAR(10),couple.dcreat,103) AS "DCREAT",
		CONVERT(CHAR(10),couple.dmodif,103) AS "DMODIF",
		CONVERT(CHAR(10),couple.drevis,103) AS "DREVIS"
	FROM IAMCOUPLE couple, IAMCLASS class, IAMCLASSE_IAMCOUPLE clascoup
	WHERE clascoup.id_iamcouple IN (	SELECT id_iamcouple
						FROM IAMCLASSE_IAMCOUPLE
						WHERE id_iamclasse = '' + CONVERT(CHAR(4), @ID_IAMClasse) + '')
	AND clascoup.id_iamclasse != ''+ CONVERT(CHAR(4), @ID_IAMClasse) + ''
	AND class.id_iamclasse = clascoup.id_iamclasse
	AND couple.id_iamcouple = clascoup.id_iamcouple
	ORDER BY 3''
	EXEC (@varRequete)
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret










' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetIAMClassCips_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIAMClassCips_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[GetIAMClassCips_Id]
(
	@ID_IAMCLASSE	T_COMPTEUR,
	@Ret		INTEGER OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER

-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetIAMClassCips_Id'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	SELECT c.ID_SPEPRESENTATION, c.ID_SPECIALITE, c.CIP,
		c.UCD, c.AMMEUROPE,  c.LIEUDISPO,
		c.CONDDISPO, c.LISTE, c.DUREEPRESCRIPTION,
		c.PRESCRIPTIONINITIALE, c.PRESCRIPTIONRESERVEE,
		c.RENOUVELRESERVE, c.MEDPARTIC,
		CAST(c.NATURESURVEILLANCE AS VARCHAR(4000)) AS ''NATURESURVEILLANCE'',
		c.CODEREFERANTGENERIQUE, c.REMPLACE, c.SOURCEREMPLACE,
		CONVERT(CHAR(10), c.DATESOURCEREMPLACE, 103) AS ''DATESOURCEREMPLACE'',
		c.REMPLACEPAR, c.SOURCEREMPLACEPAR,
		CONVERT(CHAR(10), c.DATESOURCEREMPLACEPAR, 103) AS ''DATESOURCEREMPLACEPAR'',
		c.PRIXPRODHTF, c.PRIXPUBLICTTCF,
		c.PRIXPRODHTE, c.PRIXPUBLICTTCE, c.TVA,
		CONVERT(char(10), c.DCREAT, 103) AS ''DCREAT'',
		CONVERT(char(10), c.DMODIF, 103) AS ''DMODIF'',
		CONVERT(char(10), c.DREVIS, 103) AS ''DREVIS'',
		c.CIPREFERANT, 
		b.DENOMSPE + (CASE c.condi						
					WHEN NULL THEN ''''
					ELSE '' : '' + c.condi
  				END ) AS ''DenomCip'',  c.disponibilite, c.nbprise, c.priseunitaire, c.codeDispo
	FROM   SPECIALITE b 	INNER JOIN SPECIALITE_IAMCLASS a ON a.ID_SPECIALITE = b.ID_SPECIALITE
				INNER JOIN SPEPRESENTATION c ON  b.ID_SPECIALITE = c.ID_SPECIALITE
	--			LEFT JOIN SPECONDITIONNEMENTPRIMAIRE d  ON d.ID_SPEPRESENTATION   = c.ID_SPEPRESENTATION
	WHERE  a.ID_IAMCLASSE = @Id_IAMClasse
	-- AND ( UPPER(d.TYPECONDPRIMAIRE) = ''DENOMCIP'' OR ( UPPER(d.TYPECONDPRIMAIRE) IS NULL) )
	ORDER BY 
        --YB AJOUT ON MET NOUV et commercialises EN DEBUT DE LISTE
       ( CASE 
        WHEN CodeDispo IN (0,3) THEN 0
        ELSE 1
	END
        ),
        DENOMCIP

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret








' 
END
GO
/****** Objet :  Table [dbo].[DicoEphmra]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DicoEphmra]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DicoEphmra](
	[id_DicoEphmra] [T_COMPTEUR] NOT NULL,
	[dic_id_DicoEphmra] [int] NULL,
	[libelle] [varchar](127)  NOT NULL,
	[Code] [varchar](50)  NULL,
	[ordre] [int] NULL,
 CONSTRAINT [PK_DICOEPHMRA] PRIMARY KEY CLUSTERED 
(
	[id_DicoEphmra]
)
)
END
GO
/****** Objet :  StoredProcedure [dbo].[GetIAMClass_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetIAMClass_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetIAMClass_Id]
(
	@ID_IAMCLASSE	T_COMPTEUR,
	@Ret		INTEGER OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER

-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetIAMClass_Id'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	SELECT
		ID_IAMCLASSE, CLASSE, REMARQUE,
		CONVERT(char(10), DCREAT, 103) AS ''DCREAT'',
		CONVERT(char(10),  DMODIF, 103) AS ''DMODIF'',
		CONVERT(char(10), DREVIS, 103) AS ''DREVIS''
	FROM   IAMCLASS
	WHERE (Id_Iamclasse = @Id_IAMClasse)

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  Table [dbo].[SpeEvtPresentation]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeEvtPresentation]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SpeEvtPresentation](
	[id_SpePresentation] [T_COMPTEUR] NOT NULL,
	[id_SpeEvtPresentation] [T_COMPTEUR] NOT NULL,
	[evenement] [T_TEXTE_LONG] NULL,
	[source] [T_TEXTE_LONG] NULL,
	[dateSource] [T_DATE_SYST] NULL,
	[dateEvenement] [T_DATE_SYST] NULL,
 CONSTRAINT [PK_SpeEvtPresentation] PRIMARY KEY NONCLUSTERED 
(
	[id_SpeEvtPresentation]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SpeEvtPresentation]') AND name = N'IX_id_SpePresentation')
CREATE NONCLUSTERED INDEX [IX_id_SpePresentation] ON [dbo].[SpeEvtPresentation] 
(
	[id_SpePresentation]
)
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCipsWithLivret]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCipsWithLivret]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_GetCipsWithLivret](
						@Id		T_COMPTEUR=0,
						@Terme	VARCHAR(100)=null,
						@Type		INTEGER,
						@Domain	INTEGER,
						@Ordre		INTEGER=1,
						@Banque	VARCHAR(1),
						@Id_Hop	INTEGER,
						@TTCIPS	VARCHAR(25)  OUTPUT	
					) AS

-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur INTEGER
DECLARE @Domaine VARCHAR(50)

--BODY
BEGIN
	SET NOCOUNT ON


	-- INITIALISATION Code Erreur Proc
	SET @Erreur =0

	-- Traitement du terme entrant
	IF NOT( @Terme IS NULL )
	BEGIN
		EXEC @Erreur = p_Translate_Upper @Terme, @Terme OUTPUT
		IF @Erreur !=0
			GOTO SORTIE_ERR
	END

	-- Decode Domaine
	EXEC @Erreur = Decode_Domain @Domain, @Result = @Domaine OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR

-------------------------------------------------------------------------------------------- EXECUTION REQUETE  ----------------------------------------------------------------------------------------

		IF @Type = 1 		EXEC @Erreur = p_GetCips_Specialite @Id, @Terme, @Domaine, @Ordre, @Banque , @Id_Hop,  @TTCIPS OUTPUT
	ELSE	IF @Type IN (2,25,27 )	EXEC @Erreur = p_GetCips_Substance @Id, @Terme, @Type, @Domaine, @Ordre, @Banque , @Id_Hop,  @TTCIPS OUTPUT
	ELSE	IF @Type = 3 		EXEC @Erreur = p_GetCips_Liste_Thera  @Id, @Terme,  @Domaine, @Ordre,@Banque , @Id_Hop,  @TTCIPS OUTPUT
	ELSE	IF @Type = 5 		EXEC @Erreur = p_GetCips_Liste_ATC  @Id, @Terme,  @Domaine, @Ordre,@Banque , @Id_Hop,  @TTCIPS OUTPUT
	ELSE	IF @Type = 4 		EXEC @Erreur = p_GetCips_Laboratoire @Id,  @Terme, @Type, @Domaine, @Ordre, @Banque , @Id_Hop,  @TTCIPS OUTPUT
	ELSE	IF @Type = 7 		EXEC @Erreur = p_GetCips_UCD  @Terme, @Type, @Domaine, @Ordre, @Banque , @Id_Hop,  @TTCIPS OUTPUT

	ELSE				GOTO SORTIE

	IF @Erreur != 0	GOTO SORTIE_ERR

END

-- TERMINAISON
SORTIE:
	RETURN 0

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur














' 
END
GO
/****** Objet :  Table [dbo].[SpeEvt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeEvt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SpeEvt](
	[id_SpeEvt] [T_COMPTEUR] NOT NULL,
	[id_Specialite] [T_COMPTEUR] NOT NULL,
	[evenement] [T_TEXTE_LONG] NULL,
	[source] [T_TEXTE_LONG] NULL,
	[dateSource] [T_DATE_SYST] NULL,
	[dateEvenement] [T_DATE_SYST] NOT NULL,
	[traiteEven] [T_TEXTE_LONG] NULL,
	[id_DicoSpeEvenement] [T_COMPTEUR] NOT NULL,
	[DateCreation] [T_DATE_SYST] NULL,
 CONSTRAINT [PK_SpeEvt] PRIMARY KEY NONCLUSTERED 
(
	[id_SpeEvt]
)
)
END
GO
/****** Objet :  Table [dbo].[SpeConditionnementPrimaire]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeConditionnementPrimaire]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SpeConditionnementPrimaire](
	[id_SpePresentation] [T_COMPTEUR] NOT NULL,
	[id_PresConditionnement] [T_COMPTEUR] NOT NULL,
	[id_Produit] [T_COMPTEUR] NOT NULL,
	[nbCond] [T_OVP_ENTIERS] NOT NULL,
	[typeCondPrimaire] [T_TEXTE_LONG] NULL,
	[natureCondi] [T_TEXTE_LONG] NULL,
	[contenance] [T_OVP_FLOAT] NULL,
	[uniteContenance] [T_TEXTE_LONG] NULL,
	[contenu] [T_OVP_FLOAT] NULL,
	[uniteContenu] [T_TEXTE_LONG] NULL,
	[rensComp] [T_libelle60] NULL,
	[ordre] [T_ORDRE] NULL,
 CONSTRAINT [PK_SpeConditionnementPrimaire] PRIMARY KEY NONCLUSTERED 
(
	[id_PresConditionnement],
	[id_Produit]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SpeConditionnementPrimaire]') AND name = N'IX_ID_PRESENTATION')
CREATE NONCLUSTERED INDEX [IX_ID_PRESENTATION] ON [dbo].[SpeConditionnementPrimaire] 
(
	[id_SpePresentation]
)
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCips_Laboratoire]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCips_Laboratoire]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[p_GetCips_Laboratoire]( 
						@Id		T_COMPTEUR=0,
						@Terme 	VARCHAR(100)=null,
						@Type		INTEGER,
						@Domaine 	VARCHAR(50),
						@Ordre 	INTEGER=1,
						@Banque 	VARCHAR(1)=null,
						@Id_Hop 	INTEGER=null,
						--@Curseur 	CURSOR VARYING OUTPUT
						 @TTCIPS  varchar(25)  OUTPUT
					      ) AS
-- DEFINITION DES VARIABLES LOCALES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @Erreur INTEGER

DECLARE @Select VARCHAR(4000)
DECLARE @From VARCHAR(1000)
DECLARE @Where VARCHAR(4000)
DECLARE @Order VARCHAR(100)

DECLARE @TermeTxt VARCHAR(10)

DECLARE @Sel2 VARCHAR(4000)
DECLARE @From2 VARCHAR(500)
DECLARE @Where2 VARCHAR(4000)

DECLARE @Date VARCHAR(10)
DECLARE @IdHopTxt VARCHAR(10)
DECLARE @time        varchar(20)
DECLARE @TableT   varchar(25)
DECLARE @Req        varchar(4000)
--DECLARE @TTCIPS  varchar(25)
--DECLARE @SQL        varchar(1000)
-- BODY
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
BEGIN
	SET NOCOUNT ON

	SET @Erreur = 0

--------------Contrôle sur Ordre saisi ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	IF NOT( @Ordre IN(1,2,3) ) GOTO SORTIE

	IF NOT( @Id IS NULL ) 
	BEGIN
		SET @TermeTxt = CAST( @Id AS VARCHAR(10) )
		IF @@ERROR != 0	GOTO SORTIE
	END

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT( @Banque IS NULL )
	BEGIN
		SET @Date = ''31/12/2099''
		IF @@ERROR != 0	GOTO SORTIE

		IF @Id_Hop IS NULL
			SET @IdHopTxt = ''''
		ELSE
			SET @IdHopTxt = CAST( @Id_Hop AS VARCHAR(10))

		IF @@ERROR != 0	GOTO SORTIE
	END
-------------------------------------------------------------------------------------------- Construction du SELECT ----------------------------------------------------------------------------------------
	SET @Select = ''SELECT  b.ID_SPEPRESENTATION, b.ID_SPECIALITE,  b.CIP, ''						IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.UCD, b.AMMEUROPE, b.LIEUDISPO, ''					                           IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.CONDDISPO, b.LISTE, b.DUREEPRESCRIPTION, ''					IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.PRESCRIPTIONINITIALE, b.PRESCRIPTIONRESERVEE, ''				IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.RENOUVELRESERVE, b.MEDPARTIC, ''						IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''CAST(b.NATURESURVEILLANCE AS VARCHAR(3000)) NATURESURVEILLANCE, ''	IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.CODEREFERANTGENERIQUE, b.REMPLACE, b.SOURCEREMPLACE, ''			IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.DATESOURCEREMPLACE DATESOURCEREMPLACE, b.REMPLACEPAR, b.SOURCEREMPLACEPAR, ''		IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.DATESOURCEREMPLACEPAR DATESOURCEREMPLACEPAR, b.PRIXPRODHTF, ''					IF @@ERROR != 0	GOTO SORTIE

	IF @Banque IS NULL	SET @Select = @Select + ''b.PRIXPUBLICTTCF, ''
	ELSE 			SET @Select = @Select +'' CASE  WHEN l.IDORGANISME IS NULL THEN b.PRIXPUBLICTTCF ELSE l.PRIX_TTC_F END PRIXPUBLICTTCF, ''	-- Traitement sur Livret
--	ELSE 			SET @Select = @Select + ''l.PRIX_TTC_F  PRIXPUBLICTTCF, ''	-- Traitement sur Livret
	IF @@ERROR != 0	GOTO SORTIE	

	SET @Select = @Select +	''b.PRIXPRODHTE, ''									IF @@ERROR != 0	GOTO SORTIE

	IF @Banque IS NULL	SET @Select = @Select + ''b.PRIXPUBLICTTCE, ''
	ELSE			SET @Select = @Select + ''CASE  WHEN l.IDORGANISME IS NULL THEN b.PRIXPUBLICTTCE ELSE l.PRIX_TTC_E END PRIXPUBLICTTCE, ''	-- Traitement sur Livret
--	ELSE			SET @Select = @Select + ''l.PRIX_TTC_E PRIXPUBLICTTCE, ''	-- Traitement sur Livret
	IF @@ERROR != 0	GOTO SORTIE	

	SET @Select = @Select +	''b.TVA, b.DCREAT, b.DMODIF, b.DREVIS, b.CIPREFERANT''				IF @@ERROR != 0	GOTO SORTIE

	IF 	@Ordre IN (1,2)	SET @Select = @Select + '', '''' '''' EVENEMENT, '''' '''' DATEEVENEMENT''	
	ELSE IF	@Ordre = 3	SET @Select = @Select + '', f.EVENEMENT, f.DATEEVENEMENT''	
	IF @@ERROR != 0	GOTO SORTIE

	SET @Select = @Select + '' , CASE  WHEN Condi  IS NULL THEN a.DENOMSPE  ELSE a.DENOMSPE + '''':'''' + Condi  END DenomCip,''	IF @@ERROR != 0 GOTO SORTIE

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT ( @Banque IS NULL )
	BEGIN

		IF @Banque = ''O''
		BEGIN
			SET @Select = @Select + '' CASE  WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END ID_ORGANISME ''
			IF @@ERROR != 0	GOTO SORTIE
		END
		ELSE
		BEGIN
			SET @Select = @Select + '' l.IDORGANISME ID_ORGANISME''
			IF @@ERROR != 0	GOTO SORTIE
		END

		SET @Select = @Select + '', l.PRIX_TTC_F PRIXTTCF, l.PRIX_TTC_E PRIXTTCE, l.DISPO, l.COMMENTAIRE''	IF @@ERROR != 0	GOTO SORTIE
		SET @Select = @Select + '', '''''''' PRESENTATION, '''''''' FORME, '''''''' DOSAGE, '''''''' LABO, l.CODHOPITAL''			IF @@ERROR != 0	GOTO SORTIE
		SET @Select = @Select + '',CASE WHEN l.idorganisme IS NULL THEN ''''N'''' ELSE ''''A'''' END FLAG_CAN, ''		IF @@ERROR != 0	GOTO SORTIE
                           
	END
                           SET @Select = @Select + ''  b.disponibilite, b.NBprise, b.PriseUnitaire , b.codedispo  ''     IF @@ERROR != 0 GOTO SORTIE
-------------------------------------------------------------------------------------------- Construction du FROM ----------------------------------------------------------------------------------------

	SET @From = '' FROM specialite a INNER JOIN SpePresentation b ON  a.id_Specialite = b.id_Specialite''
	IF @@ERROR != 0	GOTO SORTIE

	SET @From = @From + '' INNER JOIN SPELABS_REL d ON b.id_Specialite = d.id_Specialite ''
	IF @@ERROR != 0	GOTO SORTIE	

	SET @From = @From + '' INNER JOIN LABORATOIRE e ON d.id_Laboratoire = e.id_Laboratoire ''
	IF @@ERROR != 0	GOTO SORTIE

	IF @Ordre = 3 
	BEGIN
		SET @From = @From + '' INNER JOIN SpeEvtPresentation f ON b.id_SpePresentation = f.id_SpePresentation''	
		IF @@ERROR != 0	GOTO SORTIE
	END

	--SET @From = @From + ''  LEFT OUTER JOIN SpeConditionnementPrimaire c ON b.id_SpePresentation = c.id_SpePresentation''
	--IF @@ERROR != 0	GOTO SORTIE

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF @Banque = ''O''
	BEGIN
		SET @From = @From + '' LEFT OUTER JOIN LivretVidal l ON b.id_SpePresentation = l.id_SpePresentation ''
		IF @@ERROR != 0	GOTO SORTIE
	END
	ELSE IF NOT( @Banque IS NULL )
	BEGIN
		SET @From = @From + '' INNER JOIN LivretVidal l ON b.id_SpePresentation = l.id_SpePresentation ''
		IF @@ERROR != 0	GOTO SORTIE
	END

-------------------------------------------------------------------------------------------- Construction du WHERE ----------------------------------------------------------------------------------------

	--SET @Where = '' WHERE (c.TYPECONDPRIMAIRE IS NULL OR UPPER(c.TYPECONDPRIMAIRE) = ''''DENOMCIP'''')''
	SET @Where = ''  WHERE a.IDTYPESPE IN( '' + @Domaine +'')''

	IF @Id = 0
	BEGIN
		SET @Where = @Where + ''	AND REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
		SET @Where = @Where + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
		SET @Where = @Where + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
		SET @Where = @Where + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''
		SET @Where = @Where + ''REPLACE(REPLACE(REPLACE(UPPER(e.LABORATOIRE)''
		SET @Where = @Where + '',''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')''
		SET @Where = @Where + '',''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')''
		SET @Where = @Where + '',''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')''
		SET @Where = @Where + '',''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')''
		SET @Where = @Where + '',''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')''
		SET @Where = @Where + '',''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')''
		SET @Where = @Where + '',''''Ç'''',''''C'''')''
		SET @Where = @Where + '',''''Ñ'''',''''N'''')''

		SET @Where = @Where + '' LIKE '''''' + @Terme + ''''''''
	END
	ELSE
	BEGIN
		SET @Where = @Where + '' AND e.id_Laboratoire = ''+ @TermeTxt
	END

	IF @Ordre = 3
	BEGIN
		SET @Where = @Where + '' AND 	UPPER(f.evenement) LIKE ''''%REMB%'''' AND f.DATEEVENEMENT IN ''
		SET @Where = @Where + '' (SELECT MAX(g.DATEEVENEMENT) FROM SPEEVTPRESENTATION g WHERE g.ID_SPEPRESENTATION = f.ID_SPEPRESENTATION and  UPPER( g.EVENEMENT ) LIKE ''''%REMB%'''' )''
	END

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT ( @Banque IS NULL )
	BEGIN
		IF @Banque = ''O''
		BEGIN
			SET @Where = @Where + '' AND ( ''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where = @Where + '' CASE WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END IS NULL ''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where = @Where + '' OR CASE WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END = '' + @IdHopTxt + '' )''
			IF @@ERROR != 0	GOTO SORTIE
		END
		ELSE
		BEGIN
			SET @Where = @Where + '' AND l.IdOrganisme = '' + CAST( @Id_Hop AS VARCHAR(10)) 
			IF @@ERROR != 0	GOTO SORTIE
		END
	END

-------------------------------------------------------------------------------------------- Construction du ORDER BY  ----------------------------------------------------------------------------------------

	IF @Ordre = 3
	BEGIN
		SET @Order = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), EVENEMENT, DenomCip ''
		IF @@ERROR != 0	GOTO SORTIE
	END
	ELSE
	BEGIN
		IF @Banque IS NULL
		BEGIN
			IF @Ordre = 1
				SET @Order = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), DenomCip''				
			ELSE IF @Ordre = 2
				SET @Order = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), PRIXPUBLICTTCE, DenomCip''	
			ELSE
				SET @Order = ''''
			IF @@ERROR != 0	GOTO SORTIE
		END
		ELSE
		BEGIN
			 IF @Ordre = 1		SET @Order  = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), DenomCip''
			 ELSE			SET @Order  = '' ORDER BY  ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), PRIXPUBLICTTCE, DenomCip ''
			IF @@ERROR != 0	GOTO SORTIE
		END
	END


-------------------------------------------------------------------------------------------- REQUETE  ----------------------------------------------------------------------------------------

	/*IF EXISTS( SELECT 1 FROM TempDb..SYSOBJECTS WHERE NAME = ''##Tmp_GetCips''  AND TYPE = ''U'')
	BEGIN
		DROP TABLE ##Tmp_GetCips
		IF @@ERROR != 0 GOTO SORTIE_ERR			
	END*/

	SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
 	SET @TTCIPS =  ''Tmp_GetCips'' +@time

	IF EXISTS( SELECT 1 FROM  tempdb..sysobjects   WHERE NAME = ''##'' +@TTCIPS  AND TYPE = ''U'')
	BEGIN
	             SET @Req = ''DROP TABLE ## ''+@TTCIPS
                           EXEC(@Req)
             
		IF @@ERROR != 0 GOTO SORTIE_ERR			

	END

	 SET @Req  = ''CREATE TABLE ##'' +@TTCIPS+  ''
	(
		ID_SPEPRESENTATION	INTEGER,
		ID_SPECIALITE			INTEGER,
		CIP	  			VARCHAR(7),
		UCD				VARCHAR(7),
		AMMEUROPE			VARCHAR(20), 
		LIEUDISPO			VARCHAR(255),	
		CONDDISPO			VARCHAR(255),
		LISTE				VARCHAR(255),
		DUREEPRESCRIPTION		VARCHAR(255),
		PRESCRIPTIONINITIALE	VARCHAR(255), 
		PRESCRIPTIONRESERVEE	VARCHAR(255),
		RENOUVELRESERVE		VARCHAR(255), 
		MEDPARTIC			VARCHAR(1), 
		NATURESURVEILLANCE	VARCHAR(3000),
		CODEREFERANTGENERIQUE	VARCHAR(255), 
		REMPLACE			VARCHAR(7), 
		SOURCEREMPLACE		VARCHAR(255),
		DATESOURCEREMPLACE	DATETIME,
		REMPLACEPAR		VARCHAR(7), 
		SOURCEREMPLACEPAR	VARCHAR(255),
		DATESOURCEREMPLACEPAR	DATETIME, 
		PRIXPRODHTF			REAL, 
		PRIXPUBLICTTCF		REAL,
		PRIXPRODHTE			REAL, 
		PRIXPUBLICTTCE		REAL, 
		TVA				VARCHAR(255), 
		DCREAT			DATETIME, 
		DMODIF			DATETIME,
		DREVIS			DATETIME, 
		CIPREFERANT			VARCHAR(7),
		EVENEMENT			VARCHAR(255),
		DATEEVENEMENT		DATETIME,
		DENOMCIP			VARCHAR(255)

	)''

--print (@req)
	EXEC(@Req)
	IF @@ERROR != 0 GOTO SORTIE_ERR



	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT( @Banque IS NULL )
	BEGIN
		 SET @Req  = '' ALTER TABLE ##'' + @TTCIPS +''
			ADD
				ID_ORGANISME		INTEGER,

				PRIXTTCF			REAL,
				PRIXTTCE			REAL,
				DISPO				VARCHAR(60),
				COMMENTAIRE		VARCHAR(255),
				PRESENTATION		VARCHAR(50),
				FORME				VARCHAR(50),
				DOSAGE			VARCHAR(50),
				LABO				VARCHAR(60),
				CODHOPITAL			VARCHAR(30),
				FLAG_CAN			VARCHAR(1)   ''
--print (@req)
		EXEC(@Req)

		IF @@ERROR != 0	GOTO SORTIE
	END


  	 SET @Req  = '' ALTER TABLE ##'' + @TTCIPS +
          			     '' ADD
  				    DISPONIBILITE          VARCHAR(128),
			   	    NBPRISE                 INTEGER,
  				    PRISEUNITAIRE           VARCHAR(255), 
				    CODEDISPO	         INTEGER ''
--      print (@req)
		EXEC(@Req)
 		 IF @@ERROR != 0 GOTO SORTIE

	EXEC ( ''INSERT INTO ##''+@TTCIPS + ''  ''+ @Select +  @From + @Where +  @Order )

	IF @@ERROR != 0 GOTO SORTIE_ERR

	/*SET @Curseur = CURSOR FOR SELECT * FROM ##Tmp_GetCips
	IF @@ERROR != 0 GOTO SORTIE_ERR


	OPEN @Curseur
	IF @@ERROR != 0 GOTO SORTIE_ERR*/
	


END


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR
--		PRINT ''ERR''
	RETURN @Erreur

































' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCips_Liste_ATC]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCips_Liste_ATC]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE 	[dbo].[p_GetCips_Liste_ATC](			
							@Id		T_COMPTEUR=0,
							@Terme 	VARCHAR(100)=null,
							@Domaine 	VARCHAR(50),
							@Ordre 	INTEGER,
							@Banque 	VARCHAR(1),
							@Id_Hop 	INTEGER,
							@TTCIPS  varchar(25)  OUTPUT
						      ) AS
-- DEFINITION DES VARIABLES LOCALES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @Erreur INTEGER

DECLARE @Select VARCHAR(4000)
DECLARE @From VARCHAR(1000)
DECLARE @Where VARCHAR(4000)
DECLARE @Order VARCHAR(100)

DECLARE @TermeTxt VARCHAR(10)

DECLARE @Sel2 VARCHAR(4000)
DECLARE @From2 VARCHAR(500)
DECLARE @Where2 VARCHAR(4000)

DECLARE @Date VARCHAR(10)
DECLARE @IdHopTxt VARCHAR(10)

DECLARE @time        varchar(20)
DECLARE @TableT   varchar(25)
DECLARE @Req        varchar(4000)
DECLARE @SQL        varchar(1000)
DECLARE @Liste        varchar(1000)
DECLARE @Supp        Varchar(10)
-- BODY
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
BEGIN
	SET NOCOUNT ON

	SET @Erreur = 0

	SET @Erreur = 0
	SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET  @TableT = ''TMP_CONNECTBY'' +@time
	SET @Supp = ''(4,5)''

-------------------------------------------------------------------------------------------- Contrôle sur Ordre Entré ----------------------------------------------------------------------------------------
	IF NOT( @Ordre IN(1,2,3) ) GOTO SORTIE


	IF NOT( @Id IS NULL ) 
	BEGIN
		SET @TermeTxt = CAST( @Id AS VARCHAR(10) )
		IF @@ERROR != 0	GOTO SORTIE
	END

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT( @Banque IS NULL )
	BEGIN
		SET @Date = ''31/12/2099''
		IF @@ERROR != 0	GOTO SORTIE

		IF @Id_Hop IS NULL
			SET @IdHopTxt = ''''
		ELSE
			SET @IdHopTxt = CAST( @Id_Hop AS VARCHAR(10))

		IF @@ERROR != 0	GOTO SORTIE
	END
------------------------------------------------------------------------------------------- PREPARATION DE LA TABLE TEMPORAIRE POUR TRANSLATE -----------------
	--IF NOT( @Terme IS NULL )
	--BEGIN
-------------------------------------------------------------------------------------------- PREPARATION LISTE DES ID ISSUS DU TRANSLATE -----------------------------------
		--EXEC @Erreur = p_Trans_Upper_Table_ListeId ''DICOCOMCLASSIRIS'', ''LIBELLE'' , ''id_dicocomclassiris'', @Terme, @Liste OUTPUT
		--IF @Erreur != 0	GOTO SORTIE_ERR
	--END

------------------------------------------------------------------------------------------- PREPARATION LISTE CONNECT -----------------------------------
             SET @Req = ''''
	IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''##'' +@TableT  AND TYPE = ''U'')
                           SET @Req = ''DROP TABLE ##''+@TableT
                           EXEC(@Req)

	-- Création de la table temporaire
	SET @Req = ''CREATE TABLE ##''+@TableT +'' ( ID_COL INTEGER )''
	EXEC(@Req) 

	-- récupération hiérachie
	EXEC @Erreur = p_Connect_By  ''DICOT_ATC_IRIS'', ''ID_DICOT_ATC_IRIS'', ''DIC_ID_DICOT_ATC_IRIS'',  ''%'', @Id, @Terme, NULL, @TableT	

	-- récupération hiérachie

	IF @Erreur != 0	GOTO SORTIE_ERR

-------------------------------------------------------------------------------------------- Construction du SELECT ----------------------------------------------------------------------------------------
	SET @Select = ''SELECT  b.ID_SPEPRESENTATION, b.ID_SPECIALITE, b.CIP,''						IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.UCD, b.AMMEUROPE,  b.LIEUDISPO,''		                            			IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.CONDDISPO, b.LISTE, b.DUREEPRESCRIPTION,''					IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.PRESCRIPTIONINITIALE, b.PRESCRIPTIONRESERVEE,''				IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.RENOUVELRESERVE, b.MEDPARTIC, ''						IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''CAST(b.NATURESURVEILLANCE AS VARCHAR(3000)) NATURESURVEILLANCE,''	IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.CODEREFERANTGENERIQUE, b.REMPLACE, b.SOURCEREMPLACE,''			IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.DATESOURCEREMPLACE, b.REMPLACEPAR, b.SOURCEREMPLACEPAR,''		IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.DATESOURCEREMPLACEPAR, b.PRIXPRODHTF, ''					IF @@ERROR != 0	GOTO SORTIE

	IF @Banque IS NULL   SET @Select = @Select + ''b.PRIXPUBLICTTCF,''
--	ELSE 		           SET @Select = @Select + ''ISNULL(l.PRIX_TTC_F,b.PRIXPUBLICTTCF) PRIXPUBLICTTCF,''	 -- Traitement sur Livret
             ELSE 		           SET @Select = @Select + '' CASE  WHEN l.IDORGANISME IS NULL THEN b.PRIXPUBLICTTCF ELSE l.PRIX_TTC_F END PRIXPUBLICTTCF, ''	
	IF @@ERROR != 0	GOTO SORTIE	

	SET @Select = @Select +	''b.PRIXPRODHTE,''									IF @@ERROR != 0	GOTO SORTIE

              IF @Banque IS NULL	SET @Select = @Select + ''b.PRIXPUBLICTTCE, ''
--	ELSE			SET @Select = @Select + ''ISNULL(l.PRIX_TTC_E,b.PRIXPUBLICTTCE) PRIXPUBLICTTCE,''	-- Traitement sur Livret
	ELSE			SET @Select = @Select + '' CASE  WHEN l.IDORGANISME IS NULL THEN b.PRIXPUBLICTTCE ELSE l.PRIX_TTC_E END PRIXPUBLICTTCE, ''	
	IF @@ERROR != 0	GOTO SORTIE	

	SET @Select = @Select +	''b.TVA, b.DCREAT, b.DMODIF,b.DREVIS, b.CIPREFERANT''				IF @@ERROR != 0	GOTO SORTIE

	IF 	@Ordre IN (1,2)	SET @Select = @Select + '', '''' '''' EVENEMENT, '''' '''' DATEEVENEMENT''	
	ELSE IF	@Ordre = 3	SET @Select = @Select + '', f.EVENEMENT, f.DATEEVENEMENT''	
	IF @@ERROR != 0	GOTO SORTIE

	SET @Select = @Select + '' , CASE  WHEN Condi  IS NULL THEN a.DENOMSPE  ELSE a.DENOMSPE + '''':'''' + Condi  END DenomCip, '' 	IF @@ERROR != 0 GOTO SORTIE

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT ( @Banque IS NULL )
	BEGIN

		IF @Banque = ''O''
		BEGIN
			SET @Select = @Select + ''  CASE  WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END ''
			IF @@ERROR != 0	GOTO SORTIE
		END
		ELSE
		BEGIN
			SET @Select = @Select + '' l.IDORGANISME ID_ORGANISME''
			IF @@ERROR != 0	GOTO SORTIE
		END

		SET @Select = @Select + '', l.PRIX_TTC_F  PRIXTTCF, l.PRIX_TTC_E  PRIXTTCE, l.DISPO, l.COMMENTAIRE''	IF @@ERROR != 0	GOTO SORTIE
		SET @Select = @Select + '', '''''''' PRESENTATION, '''''''' FORME, '''''''' DOSAGE, '''''''' LABO, l.CODHOPITAL''			IF @@ERROR != 0	GOTO SORTIE
		SET @Select = @Select + '',CASE WHEN l.idorganisme IS NULL THEN ''''N'''' ELSE ''''A'''' END FLAG_CAN, ''		IF @@ERROR != 0	GOTO SORTIE
	END

	SET @Select = @Select + ''  b.disponibilite, b.NBprise, b.PriseUnitaire, b.codedispo  '' 	IF @@ERROR != 0 GOTO SORTIE

-------------------------------------------------------------------------------------------- Construction du FROM ----------------------------------------------------------------------------------------
	
	SET @From = '' FROM specialite a INNER JOIN SpePresentation b ON  a.id_Specialite = b.id_Specialite''

	IF @Ordre = 3 
		SET @From = @From + '' INNER JOIN SpeEvtPresentation f ON b.id_SpePresentation = f.id_SpePresentation''	

	--SET @From = @From + ''  LEFT OUTER JOIN SpeConditionnementPrimaire c ON b.id_SpePresentation = c.id_SpePresentation''

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF @Banque = ''O''
	BEGIN
		SET @From = @From + '' LEFT OUTER JOIN LivretVidal l ON b.id_SpePresentation = l.id_SpePresentation ''
		IF @@ERROR != 0	GOTO SORTIE
	END
	ELSE IF NOT( @Banque IS NULL )
	BEGIN
		SET @From = @From + '' INNER JOIN LivretVidal l ON b.id_SpePresentation = l.id_SpePresentation ''
		IF @@ERROR != 0	GOTO SORTIE
	END

-------------------------------------------------------------------------------------------- Construction du WHERE ----------------------------------------------------------------------------------------
	--SET @Where = '' WHERE ( c.TYPECONDPRIMAIRE IS NULL OR UPPER( c.TYPECONDPRIMAIRE) = ''''DENOMCIP'''' )''
	SET @Where = ''  WHERE  a.IDTYPESPE IN( '' + @Domaine + '') ''
	SET @Where = @Where + '' AND b.id_specialite IN ( SELECT Distinct a2.id_specialite FROM SPECIALITE a2 INNER JOIN SPEPHARMACODYNAMIE p ON a2.id_specialite = p.id_specialite ''
	SET @Where = @Where + '' INNER JOIN DICOT_ATC_IRIS q ON q.LIBELLE = p.ATC_IRIS ''
	SET @Where = @Where +''  WHERE q.ID_DICOT_ATC_IRIS IN ( SELECT DISTINCT * FROM ##'' +@TableT +'') )''
--ML : Projet Nouveaux et supprimés  12/05/2004
	SET @Where = @Where + '' AND b.codedispo not in ''+ @Supp 

	IF @Ordre = 3
	BEGIN
		SET @Where = @Where +'' AND f.DATEEVENEMENT IN (SELECT MAX(j.DATEEVENEMENT) FROM SpeEvtPresentation j ''
	--	SET @Where = @Where + '' INNER JOIN SpeEvtPresentation f ON f.ID_SPEPRESENTATION = j.ID_SPEPRESENTATION '' 
	             --SET @Where = @Where + '' WHERE f.ID_SPEPRESENTATION = j.ID_SPEPRESENTATION '' 
		SET @Where = @Where + '' WHERE j.ID_SPEPRESENTATION = f.ID_SPEPRESENTATION and  UPPER( j.EVENEMENT ) LIKE ''''%REMB%'''' ) AND UPPER(f.EVENEMENT) LIKE ''''%REMB%'''' ''

	END

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT ( @Banque IS NULL )
	BEGIN
		IF @Banque = ''O''
		BEGIN
			SET @Where = @Where + '' AND ( ''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where = @Where + '' CASE WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END IS NULL ''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where = @Where + '' OR CASE WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END = '' + @IdHopTxt + '' )''
			IF @@ERROR != 0	GOTO SORTIE

		END
		ELSE
		BEGIN
			SET @Where = @Where + '' AND l.IdOrganisme = '' + @IdHopTxt 
			IF @@ERROR != 0	GOTO SORTIE
		END
	END


-------------------------------------------------------------------------------------------- Construction du ORDER BY  ----------------------------------------------------------------------------------------

	IF @Ordre = 3
	BEGIN
		SET @Order = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), EVENEMENT, DenomCip''
		IF @@ERROR != 0	GOTO SORTIE
	END
	ELSE
	BEGIN
		IF @Banque IS NULL
		BEGIN
			IF @Ordre = 1
				SET @Order = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), DenomCip''				
			ELSE IF @Ordre = 2
				SET @Order = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), PRIXPUBLICTTCE, DenomCip''	
			ELSE
				SET @Order = ''''
			IF @@ERROR != 0	GOTO SORTIE
		END
		ELSE
		BEGIN
			 IF @Ordre = 1		SET @Order  = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), DenomCip''
			 ELSE			SET @Order  = '' ORDER BY  ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), PRIXPUBLICTTCE, DenomCip''
			IF @@ERROR != 0	GOTO SORTIE
		END
	END

-------------------------------------------------------------------------------------------- REQUETE  ----------------------------------------------------------------------------------------

    	 SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')            
              SET @TTCIPS =  ''Tmp_GetCips'' +@time


	IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''##'' +@TTCIPS  AND TYPE = ''U'')
	BEGIN
	             SET @Req = ''DROP TABLE ##''+@TTCIPS
                           EXEC(@Req)

		IF @@ERROR != 0 GOTO SORTIE_ERR		


	END

	 SET @Req  = ''CREATE TABLE ##'' +@TTCIPS+  ''	

	(
		ID_SPEPRESENTATION	INTEGER,
		ID_SPECIALITE			INTEGER,
		CIP	  			VARCHAR(7),
		UCD				VARCHAR(7),
		AMMEUROPE			VARCHAR(20), 
		LIEUDISPO			VARCHAR(255),	
		CONDDISPO			VARCHAR(255),
		LISTE				VARCHAR(255),
		DUREEPRESCRIPTION		VARCHAR(255),
		PRESCRIPTIONINITIALE	VARCHAR(255), 
		PRESCRIPTIONRESERVEE	VARCHAR(255),
		RENOUVELRESERVE		VARCHAR(255), 
		MEDPARTIC			VARCHAR(1), 
		NATURESURVEILLANCE	VARCHAR(3000),
		CODEREFERANTGENERIQUE	VARCHAR(255), 
		REMPLACE			VARCHAR(7), 
		SOURCEREMPLACE		VARCHAR(255),
		DATESOURCEREMPLACE	DATETIME,
		REMPLACEPAR		VARCHAR(7), 
		SOURCEREMPLACEPAR	VARCHAR(255),
		DATESOURCEREMPLACEPAR	DATETIME, 
		PRIXPRODHTF			REAL, 
		PRIXPUBLICTTCF		REAL,
		PRIXPRODHTE			REAL, 
		PRIXPUBLICTTCE		REAL, 
		TVA				VARCHAR(255), 
		DCREAT			DATETIME, 
		DMODIF			DATETIME,
		DREVIS			DATETIME, 
		CIPREFERANT			VARCHAR(7),
		EVENEMENT			VARCHAR(255),
		DATEEVENEMENT		DATETIME,
		DENOMCIP			VARCHAR(255)
	)''

             EXEC(@Req)
	IF @@ERROR != 0	GOTO SORTIE

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT( @Banque IS NULL )
	BEGIN
		 SET @Req  = '' ALTER TABLE ##'' + @TTCIPS +
			'' ADD 	
				ID_ORGANISME		INTEGER,
			 	PRIXTTCF			REAL,
				PRIXTTCE			REAL,
				DISPO				VARCHAR(60),
				COMMENTAIRE		VARCHAR(255),
				PRESENTATION		VARCHAR(50),
				FORME				VARCHAR(50),
				DOSAGE			VARCHAR(50),
				LABO				VARCHAR(60),

				CODHOPITAL			VARCHAR(30),
				FLAG_CAN			VARCHAR(1)   ''

                           EXEC(@Req) 	
		IF @@ERROR != 0	GOTO SORTIE
	END


  	 SET @Req  = '' ALTER TABLE ##'' + @TTCIPS +
          			     '' ADD
  				    DISPONIBILITE          VARCHAR(128),
			   	    NBPRISE                 INTEGER,
  				    PRISEUNITAIRE           VARCHAR(255),
				    CODEDISPO	         INTEGER  ''
    
		EXEC(@Req)
 		 IF @@ERROR != 0 GOTO SORTIE

	--PRINT ( ''INSERT INTO ##Tmp_GetCips '' +  @Select +  @From + @Where +  @Order )

             EXEC ( '' INSERT INTO  ##'' + @TTCIPS  +''  ''+ @Select +  @From + @Where  + @Order )

	IF @@ERROR != 0 GOTO SORTIE_ERR


/*SET @Curseur = CURSOR FOR SELECT * FROM ##Tmp_GetCips
	IF @@ERROR != 0 GOTO SORTIE_ERR


	OPEN @Curseur
	IF @@ERROR != 0 GOTO SORTIE_ERR*/
	


END
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur

























' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCipSpe]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCipSpe]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_GetCipSpe]
(	
	@Id		T_COMPTEUR=NULL,
	@Cip		T_LIBELLE7=NULL,
	@Type		VARCHAR(10),
	--@Curseur	CURSOR VARYING 	OUTPUT
             @TTCIPSPE      VARCHAR(30)  OUTPUT
) AS

-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur		INTEGER
DECLARE @varRequete	VARCHAR(4000)
DECLARE @Req varchar(4000)
DECLARE @Time varchar(25)

--BODY
BEGIN
	SET NOCOUNT  ON
	SET @Erreur =0

             SET @Time = replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET @TTCIPSPE = ''Tmp_GetCipSpe'' +@Time

	-- PREPARATION LISTE CONNECT --

               set   @Req = ''''
	IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''##'' + @TTCIPSPE AND TYPE = ''U'')
		SET @Req = ''DROP TABLE ##''+ @TTCIPSPE
                           EXEC(@Req)


	IF @Type = ''CIP''
--		SET @Curseur = CURSOR FOR
		SET @varRequete = ''
			SELECT  b.ID_SPECIALITE, b.BVALID, b.BENCOURS, b.NOMUSER,
				b.DENOMSPE, b.FORME, b.DOSAGE, b.complement,
                       		CAST(b.COMMAMMPOSO AS VARCHAR(4000)) AS ''''COMMAMMPOSO'''',
				b.RESERVE, b.INFERIEURAGE, b.UNITINF, b.SUPERIEURAGE,
				b.UNIFSUP, b.INFERIEURPOIDS, b.SUPERIEURPOIDS,
                       		b.DENOMAMM, b.NUMDOSAMM, b.SPECATEGORIE, b.SOURCE,
				CONVERT(CHAR(10), b.DATESOURCE, 103) AS ''''DATESOURCE'''',
				CAST(b.REMARQUES AS VARCHAR(4000)) AS ''''REMARQUES'''',
				CONVERT(CHAR(10), b.DCREAT, 103) AS ''''DCREAT'''',
				CONVERT(CHAR(10), b.DMODIF, 103) AS ''''DMODIF'''',
				CONVERT(CHAR(10), b.DREVIS, 103) AS ''''DREVIS''''
			INTO ##'' + @TTCIPSPE +''
               		FROM    SPECIALITE b INNER JOIN SPEPRESENTATION a ON b.ID_SPECIALITE = a.ID_SPECIALITE
               		WHERE   a.CIP = '''''' + @Cip + ''''''''
	ELSE
--		SET @Curseur = CURSOR FOR
		SET @varRequete = ''
			SELECT  b.ID_SPECIALITE, b.BVALID, b.BENCOURS, b.NOMUSER,
				b.DENOMSPE, b.FORME, b.DOSAGE, b.complement,
                       		CAST(b.COMMAMMPOSO AS VARCHAR(4000)) AS ''''COMMAMMPOSO'''',
				b.RESERVE, b.INFERIEURAGE, b.UNITINF, b.SUPERIEURAGE,
				b.UNIFSUP, b.INFERIEURPOIDS, b.SUPERIEURPOIDS,
                       		b.DENOMAMM, b.NUMDOSAMM, b.SPECATEGORIE, b.SOURCE,
				CONVERT(CHAR(10), b.DATESOURCE, 103) AS ''''DATESOURCE'''',
				CAST(b.REMARQUES AS VARCHAR(4000)) AS ''''REMARQUES'''',
				CONVERT(CHAR(10), b.DCREAT, 103) AS ''''DCREAT'''',
				CONVERT(CHAR(10), b.DMODIF, 103) AS ''''DMODIF'''',
				CONVERT(CHAR(10), b.DREVIS, 103) AS ''''DREVIS''''
			INTO ##'' + @TTCIPSPE +''
               		FROM    SPECIALITE b INNER JOIN SPEPRESENTATION a ON b.ID_SPECIALITE = a.ID_SPECIALITE
               		WHERE   a.ID_SPEPRESENTATION = '' + CONVERT(VARCHAR(10), @Id)

	EXEC (@varRequete)
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	/*SET @Curseur = CURSOR FOR
		SELECT * FROM ##Tmp_GetCipSpe
	FOR READ ONLY
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	OPEN @Curseur*/
	IF @@ERROR != 0
		GOTO SORTIE_ERR
END

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur








' 
END
GO
/****** Objet :  Table [dbo].[SpeCompo]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeCompo]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SpeCompo](
	[id_Specialite] [T_COMPTEUR] NOT NULL,
	[id_SpeCompo] [T_COMPTEUR] NOT NULL,
	[forme] [T_TEXTE_LONG] NULL,
	[numeroForme] [T_OVP_ENTIERS] NOT NULL,
	[couleurForme] [T_TEXTE_LONG] NULL,
	[nbConstituantsActifs] [T_OVP_ENTIERS] NULL,
	[dCreat] [T_DATE_SYST] NOT NULL,
	[dModif] [T_DATE_SYST] NULL,
	[dRevis] [T_DATE_SYST] NULL,
 CONSTRAINT [PK_SpeCompo] PRIMARY KEY NONCLUSTERED 
(
	[id_SpeCompo]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SpeCompo]') AND name = N'IX_id_Specialite')
CREATE NONCLUSTERED INDEX [IX_id_Specialite] ON [dbo].[SpeCompo] 
(
	[id_Specialite]
)
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCips_Liste_Thera]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCips_Liste_Thera]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE 	[dbo].[p_GetCips_Liste_Thera](			
							@Id		T_COMPTEUR=0,
							@Terme 	VARCHAR(100)=null,
							@Domaine 	VARCHAR(50),
							@Ordre 	INTEGER,
							@Banque 	VARCHAR(1),
							@Id_Hop 	INTEGER,
							@TTCIPS  varchar(25)  OUTPUT
						      ) AS
-- DEFINITION DES VARIABLES LOCALES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @Erreur INTEGER

DECLARE @Select VARCHAR(4000)
DECLARE @From VARCHAR(1000)
DECLARE @Where VARCHAR(4000)
DECLARE @Order VARCHAR(100)

DECLARE @TermeTxt VARCHAR(10)

DECLARE @Sel2 VARCHAR(4000)
DECLARE @From2 VARCHAR(500)
DECLARE @Where2 VARCHAR(4000)

DECLARE @Date VARCHAR(10)
DECLARE @IdHopTxt VARCHAR(10)

DECLARE @time        varchar(20)
DECLARE @TableT   varchar(25)
DECLARE @Req        varchar(4000)
DECLARE @SQL        varchar(1000)
DECLARE @Liste        varchar(1000)
DECLARE @Supp        Varchar(10)
-- BODY
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
BEGIN
	SET NOCOUNT ON

	SET @Erreur = 0

	SET @Erreur = 0
	SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET  @TableT = ''TMP_CONNECTBY'' +@time
	SET @Supp = ''(4,5)''
-------------------------------------------------------------------------------------------- Contrôle sur Ordre Entré ----------------------------------------------------------------------------------------
	IF NOT( @Ordre IN(1,2,3) ) GOTO SORTIE


	IF NOT( @Id IS NULL ) 
	BEGIN
		SET @TermeTxt = CAST( @Id AS VARCHAR(10) )
		IF @@ERROR != 0	GOTO SORTIE
	END

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT( @Banque IS NULL )
	BEGIN
		SET @Date = ''31/12/2099''
		IF @@ERROR != 0	GOTO SORTIE

		IF @Id_Hop IS NULL
			SET @IdHopTxt = ''''
		ELSE
			SET @IdHopTxt = CAST( @Id_Hop AS VARCHAR(10))

		IF @@ERROR != 0	GOTO SORTIE
	END
------------------------------------------------------------------------------------------- PREPARATION DE LA TABLE TEMPORAIRE POUR TRANSLATE -----------------
	--IF NOT( @Terme IS NULL )
	--BEGIN
-------------------------------------------------------------------------------------------- PREPARATION LISTE DES ID ISSUS DU TRANSLATE -----------------------------------
		--EXEC @Erreur = p_Trans_Upper_Table_ListeId ''DICOCOMCLASSIRIS'', ''LIBELLE'' , ''id_dicocomclassiris'', @Terme, @Liste OUTPUT
		--IF @Erreur != 0	GOTO SORTIE_ERR
	--END

------------------------------------------------------------------------------------------- PREPARATION LISTE CONNECT -----------------------------------
             SET @Req = ''''
	IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''##'' +@TableT  AND TYPE = ''U'')
                           SET @Req = ''DROP TABLE ##''+@TableT
                           EXEC(@Req)

	-- Création de la table temporaire
	SET @Req = ''CREATE TABLE ##''+@TableT +'' ( ID_COL INTEGER )''
	EXEC(@Req) 

	-- récupération hiérachie
	EXEC @Erreur = p_Connect_By ''DICOCOMCLASSIRIS'', ''id_dicocomclassiris'', ''dic_id_dicocomclassiris'',  ''%'', @Id, @Terme, NULL, @TableT	

	-- récupération hiérachie

	IF @Erreur != 0	GOTO SORTIE_ERR

-------------------------------------------------------------------------------------------- Construction du SELECT ----------------------------------------------------------------------------------------
	SET @Select = ''SELECT  b.ID_SPEPRESENTATION, b.ID_SPECIALITE, b.CIP,''						IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.UCD, b.AMMEUROPE, b.LIEUDISPO,''				            			IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.CONDDISPO, b.LISTE, b.DUREEPRESCRIPTION,''					IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.PRESCRIPTIONINITIALE, b.PRESCRIPTIONRESERVEE,''				IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.RENOUVELRESERVE, b.MEDPARTIC, ''						IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''CAST(b.NATURESURVEILLANCE AS VARCHAR(3000)) NATURESURVEILLANCE,''	IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.CODEREFERANTGENERIQUE, b.REMPLACE, b.SOURCEREMPLACE,''			IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.DATESOURCEREMPLACE, b.REMPLACEPAR, b.SOURCEREMPLACEPAR,''		IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.DATESOURCEREMPLACEPAR, b.PRIXPRODHTF, ''					IF @@ERROR != 0	GOTO SORTIE

	IF @Banque IS NULL   SET @Select = @Select + ''b.PRIXPUBLICTTCF,''
--ML	ELSE 		           SET @Select = @Select + ''ISNULL(l.PRIX_TTC_F,b.PRIXPUBLICTTCF) PRIXPUBLICTTCF,''	 -- Traitement sur Livret
	ELSE 		           SET @Select = @Select +'' CASE  WHEN l.IDORGANISME IS NULL THEN b.PRIXPUBLICTTCF ELSE l.PRIX_TTC_F END PRIXPUBLICTTCF, ''  -- Traitement sur Livret
	IF @@ERROR != 0	GOTO SORTIE	

	SET @Select = @Select +	''b.PRIXPRODHTE,''									IF @@ERROR != 0	GOTO SORTIE

              IF @Banque IS NULL	SET @Select = @Select + ''b.PRIXPUBLICTTCE, ''
--ML	ELSE			SET @Select = @Select + ''ISNULL(l.PRIX_TTC_E,b.PRIXPUBLICTTCE) PRIXPUBLICTTCE,''	-- Traitement sur Livret
      	ELSE			SET @Select = @Select + '' CASE  WHEN l.IDORGANISME IS NULL THEN b.PRIXPUBLICTTCE ELSE l.PRIX_TTC_E END PRIXPUBLICTTCE, ''		-- Traitement sur Livret
	IF @@ERROR != 0	GOTO SORTIE	

	SET @Select = @Select +	''b.TVA, b.DCREAT, b.DMODIF,b.DREVIS, b.CIPREFERANT''				IF @@ERROR != 0	GOTO SORTIE

	IF 	@Ordre IN (1,2)	SET @Select = @Select + '', '''' '''' EVENEMENT, '''' '''' DATEEVENEMENT''	
	ELSE IF	@Ordre = 3	SET @Select = @Select + '', f.EVENEMENT, f.DATEEVENEMENT''	
	IF @@ERROR != 0	GOTO SORTIE

	SET @Select = @Select + '' , CASE  WHEN Condi IS NULL THEN a.DENOMSPE  ELSE a.DENOMSPE + '''':'''' + Condi  END DenomCip, ''	IF @@ERROR != 0 GOTO SORTIE

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT ( @Banque IS NULL )
	BEGIN

		IF @Banque = ''O''
		BEGIN
			SET @Select = @Select + '' CASE  WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END ''
			IF @@ERROR != 0	GOTO SORTIE
		END
		ELSE
		BEGIN
			SET @Select = @Select + ''l.IDORGANISME ID_ORGANISME''
			IF @@ERROR != 0	GOTO SORTIE
		END

		SET @Select = @Select + '', l.PRIX_TTC_F PRIXTTCF,  l.PRIX_TTC_E PRIXTTCE, l.DISPO, l.COMMENTAIRE''	IF @@ERROR != 0	GOTO SORTIE
		SET @Select = @Select + '', '''''''' PRESENTATION, '''''''' FORME, '''''''' DOSAGE, '''''''' LABO, l.CODHOPITAL''			IF @@ERROR != 0	GOTO SORTIE
		SET @Select = @Select + '',CASE WHEN l.idorganisme IS NULL THEN ''''N'''' ELSE ''''A'''' END FLAG_CAN, ''		IF @@ERROR != 0	GOTO SORTIE
	END
	SET @Select = @Select + ''  b.disponibilite, b.NBprise, b.PriseUnitaire, b.codedispo  '' 	IF @@ERROR != 0 GOTO SORTIE

-------------------------------------------------------------------------------------------- Construction du FROM ----------------------------------------------------------------------------------------
	
	SET @From = '' FROM specialite a INNER JOIN SpePresentation b ON  a.id_Specialite = b.id_Specialite''

	IF @Ordre = 3 
		SET @From = @From + '' INNER JOIN SpeEvtPresentation f ON b.id_SpePresentation = f.id_SpePresentation''	

	--SET @From = @From + ''  LEFT OUTER JOIN SpeConditionnementPrimaire c ON b.id_SpePresentation = c.id_SpePresentation''

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF @Banque = ''O''
	BEGIN
		SET @From = @From + '' LEFT OUTER JOIN LivretVidal l ON b.id_SpePresentation = l.id_SpePresentation ''
		IF @@ERROR != 0	GOTO SORTIE
	END
	ELSE IF NOT( @Banque IS NULL )
	BEGIN
		SET @From = @From + '' INNER JOIN LivretVidal l ON b.id_SpePresentation = l.id_SpePresentation ''
		IF @@ERROR != 0	GOTO SORTIE
	END

-------------------------------------------------------------------------------------------- Construction du WHERE ----------------------------------------------------------------------------------------
	--SET @Where = '' WHERE ( c.TYPECONDPRIMAIRE IS NULL OR UPPER( c.TYPECONDPRIMAIRE) = ''''DENOMCIP'''' )''
	SET @Where =  '' WHERE a.IDTYPESPE IN( '' + @Domaine + '') ''
	SET @Where = @Where + '' AND b.id_specialite IN ( SELECT Distinct a2.id_specialite FROM SPECIALITE a2 INNER JOIN SPECLASSIRIS d ON a2.id_specialite = d.id_specialite ''
	SET @Where = @Where +'' WHERE d.ID_DICOCOMCLASSIRIS IN ( SELECT DISTINCT * FROM ##'' +@TableT +'') )''
--ML : Projet Nouveaux et supprimés  12/05/2004
	SET @Where = @Where + '' AND b.codedispo not in ''+ @Supp 

	IF @Ordre = 3
	BEGIN
		SET @Where = @Where +'' AND f.DATEEVENEMENT IN (SELECT MAX(j.DATEEVENEMENT) FROM SpeEvtPresentation j ''
--		SET @Where = @Where + '' INNER JOIN SpeEvtPresentation f ON f.ID_SPEPRESENTATION = j.ID_SPEPRESENTATION '' 
		SET @Where = @Where + '' WHERE j.ID_SPEPRESENTATION = f.ID_SPEPRESENTATION and  UPPER( j.EVENEMENT ) LIKE ''''%REMB%'''' ) AND UPPER(f.EVENEMENT) LIKE ''''%REMB%'''' ''
	END

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT ( @Banque IS NULL )
	BEGIN
		IF @Banque = ''O''
		BEGIN
			SET @Where = @Where + '' AND ( ''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where = @Where + '' CASE WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END IS NULL ''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where = @Where + '' OR CASE WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END = '' + @IdHopTxt + '' )''
			IF @@ERROR != 0	GOTO SORTIE

		END
		ELSE
		BEGIN
			SET @Where = @Where + '' AND l.IdOrganisme = '' + @IdHopTxt 
			IF @@ERROR != 0	GOTO SORTIE
		END
	END


-------------------------------------------------------------------------------------------- Construction du ORDER BY  ----------------------------------------------------------------------------------------

	IF @Ordre = 3
	BEGIN
		SET @Order = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), EVENEMENT, DenomCip ''
		IF @@ERROR != 0	GOTO SORTIE
	END
	ELSE
	BEGIN
		IF @Banque IS NULL
		BEGIN
			IF @Ordre = 1
				SET @Order = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), DenomCip''				
			ELSE IF @Ordre = 2
				SET @Order = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), PRIXPUBLICTTCE, DenomCip''
			ELSE
				SET @Order = ''''
			IF @@ERROR != 0	GOTO SORTIE
		END
		ELSE
		BEGIN
			 IF @Ordre = 1		SET @Order  = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), DenomCip''
			 ELSE			SET @Order  = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), PRIXPUBLICTTCE, DenomCip ''
			IF @@ERROR != 0	GOTO SORTIE
		END
	END

-------------------------------------------------------------------------------------------- REQUETE  ----------------------------------------------------------------------------------------

    	 SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')            
              SET @TTCIPS =  ''Tmp_GetCips'' +@time


	IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''##'' +@TTCIPS  AND TYPE = ''U'')
	BEGIN
	             SET @Req = ''DROP TABLE ##''+@TTCIPS
                           EXEC(@Req)

		IF @@ERROR != 0 GOTO SORTIE_ERR		


	END

	 SET @Req  = ''CREATE TABLE ##'' +@TTCIPS+  ''	

	(
		ID_SPEPRESENTATION	INTEGER,
		ID_SPECIALITE			INTEGER,
		CIP	  			VARCHAR(7),
		UCD				VARCHAR(7),
		AMMEUROPE			VARCHAR(20), 
		LIEUDISPO			VARCHAR(255),	
		CONDDISPO			VARCHAR(255),
		LISTE				VARCHAR(255),
		DUREEPRESCRIPTION		VARCHAR(255),
		PRESCRIPTIONINITIALE	VARCHAR(255), 
		PRESCRIPTIONRESERVEE	VARCHAR(255),
		RENOUVELRESERVE		VARCHAR(255), 
		MEDPARTIC			VARCHAR(1), 
		NATURESURVEILLANCE	VARCHAR(3000),
		CODEREFERANTGENERIQUE	VARCHAR(255), 
		REMPLACE			VARCHAR(7), 
		SOURCEREMPLACE		VARCHAR(255),
		DATESOURCEREMPLACE	DATETIME,
		REMPLACEPAR		VARCHAR(7), 
		SOURCEREMPLACEPAR	VARCHAR(255),
		DATESOURCEREMPLACEPAR	DATETIME, 
		PRIXPRODHTF			REAL, 
		PRIXPUBLICTTCF		REAL,
		PRIXPRODHTE			REAL, 
		PRIXPUBLICTTCE		REAL, 
		TVA				VARCHAR(255), 
		DCREAT			DATETIME, 
		DMODIF			DATETIME,
		DREVIS			DATETIME, 
		CIPREFERANT			VARCHAR(7),
		EVENEMENT			VARCHAR(255),
		DATEEVENEMENT		DATETIME,
		DENOMCIP			VARCHAR(255)
	)''

             EXEC(@Req)
	IF @@ERROR != 0	GOTO SORTIE

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT( @Banque IS NULL )
	BEGIN
		 SET @Req  = '' ALTER TABLE ##'' + @TTCIPS +
			'' ADD 	
				ID_ORGANISME		INTEGER,
			 	PRIXTTCF			REAL,
				PRIXTTCE			REAL,
				DISPO				VARCHAR(60),

				COMMENTAIRE		VARCHAR(255),
				PRESENTATION		VARCHAR(50),
				FORME				VARCHAR(50),
				DOSAGE			VARCHAR(50),
				LABO				VARCHAR(60),

				CODHOPITAL			VARCHAR(30),
				FLAG_CAN			VARCHAR(1)  ''


                           EXEC(@Req) 	
		IF @@ERROR != 0	GOTO SORTIE
	END

  	 SET @Req  = '' ALTER TABLE ##'' + @TTCIPS +
          			     '' ADD
  				    DISPONIBILITE          VARCHAR(128),
			   	    NBPRISE                 INTEGER,
  				    PRISEUNITAIRE           VARCHAR(255),
			          	    CODEDISPO	         INTEGER '' 
    
		EXEC(@Req)
 		 IF @@ERROR != 0 GOTO SORTIE

	--PRINT ( ''INSERT INTO ##Tmp_GetCips '' +  @Select +  @From + @Where +  @Order )

             EXEC ( '' INSERT INTO  ##'' + @TTCIPS  +''  ''+ @Select +  @From + @Where  + @Order )

	IF @@ERROR != 0 GOTO SORTIE_ERR


	/*SET @Curseur = CURSOR FOR SELECT * FROM ##Tmp_GetCips
	IF @@ERROR != 0 GOTO SORTIE_ERR


	OPEN @Curseur
	IF @@ERROR != 0 GOTO SORTIE_ERR*/
	


END
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur














































' 
END
GO
/****** Objet :  Table [dbo].[Specialite_IAMClass]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Specialite_IAMClass]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Specialite_IAMClass](
	[id_IAMClasse] [T_COMPTEUR] NOT NULL,
	[id_Specialite] [T_COMPTEUR] NOT NULL,
 CONSTRAINT [PK_Specialite_IAMClass] PRIMARY KEY NONCLUSTERED 
(
	[id_IAMClasse],
	[id_Specialite]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[Specialite_IAMClass]') AND name = N'IX_id_IAMClasse')
CREATE NONCLUSTERED INDEX [IX_id_IAMClasse] ON [dbo].[Specialite_IAMClass] 
(
	[id_IAMClasse]
)
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCips_Specialite]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCips_Specialite]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[p_GetCips_Specialite]
( 
	@Id		T_COMPTEUR = NULL,
	@Terme 		VARCHAR(100) = NULL,
	@Domaine 	VARCHAR(50),
	@Ordre 		INTEGER=1,
	@Banque 	VARCHAR(1) = NULL,
	@Id_Hop 	INTEGER = NULL,
	--@Curseur	CURSOR VARYING	OUTPUT
             @TTCIPS  varchar(25)  OUTPUT
) AS
-- DEFINITION DES VARIABLES LOCALES
DECLARE @Erreur INTEGER

DECLARE @Select VARCHAR(4000)
DECLARE @From VARCHAR(1000)
DECLARE @Where VARCHAR(4000)
DECLARE @Order VARCHAR(100)

DECLARE @Terme1 VARCHAR(1)

DECLARE @Sel2 VARCHAR(4000)
DECLARE @From2 VARCHAR(500)
DECLARE @Where2 VARCHAR(4000)
DECLARE @Order2 VARCHAR(100)

DECLARE @Date VARCHAR(10)
DECLARE @IdHopTxt VARCHAR(10)

DECLARE @time        varchar(20)
DECLARE @TableT   varchar(25)
DECLARE @Req        varchar(4000)
DECLARE @SQL        varchar(1000)

-- BODY
BEGIN
	SET NOCOUNT ON

	SET @Erreur = 0

-------------------------------------------------------------------------------------------- Contrôle sur Ordre Entré ----------------------------------------------------------------------------------------
	IF NOT( @Ordre IN(1,2,3) ) GOTO SORTIE
	
	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT( @Banque IS NULL )
	BEGIN
		SET @Date = ''31/12/2099''
		IF @@ERROR != 0	GOTO SORTIE

		IF @Id_Hop IS NULL
			SET @IdHopTxt = ''''
		ELSE
			SET @IdHopTxt = CAST( @Id_Hop AS VARCHAR(10))

		IF @@ERROR != 0	GOTO SORTIE
	END

-------------------------------------------------------------------------------------------- Construction du SELECT ----------------------------------------------------------------------------------------
	SET @Select = ''SELECT  b.ID_SPEPRESENTATION, b.ID_SPECIALITE, b.CIP,''						IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.UCD, b.AMMEUROPE,  b.LIEUDISPO,''							IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.CONDDISPO, b.LISTE, b.DUREEPRESCRIPTION,''					IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.PRESCRIPTIONINITIALE, b.PRESCRIPTIONRESERVEE,''				IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.RENOUVELRESERVE, b.MEDPARTIC, ''						IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''CAST(b.NATURESURVEILLANCE AS VARCHAR(3000)) NATURESURVEILLANCE,''	IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.CODEREFERANTGENERIQUE, b.REMPLACE, b.SOURCEREMPLACE,''			IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.DATESOURCEREMPLACE, b.REMPLACEPAR, b.SOURCEREMPLACEPAR,''		IF @@ERROR != 0	GOTO SORTIE
	SET @Select = @Select +	''b.DATESOURCEREMPLACEPAR, b.PRIXPRODHTF, ''					IF @@ERROR != 0	GOTO SORTIE

	IF @Banque IS NULL	SET @Select = @Select + ''b.PRIXPUBLICTTCF,''
	--ELSE 			SET @Select = @Select + ''ISNULL(l.PRIX_TTC_F,b.PRIXPUBLICTTCF) PRIXPUBLICTTCF,''	-- Traitement sur Livret
               ELSE 			SET @Select = @Select + '' CASE  WHEN l.IDORGANISME IS NULL THEN b.PRIXPUBLICTTCF ELSE l.PRIX_TTC_F END PRIXPUBLICTTCF, ''	-- Traitement sur Livret
	IF @@ERROR != 0	GOTO SORTIE	

	SET @Select = @Select +	''b.PRIXPRODHTE,''									IF @@ERROR != 0	GOTO SORTIE

	IF @Banque IS NULL	SET @Select = @Select + ''b.PRIXPUBLICTTCE, ''
	--ELSE			SET @Select = @Select + ''ISNULL(l.PRIX_TTC_E,b.PRIXPUBLICTTCE) PRIXPUBLICTTCE,''	-- Traitement sur Livret
	ELSE			SET @Select = @Select + '' CASE  WHEN l.IDORGANISME IS NULL THEN b.PRIXPUBLICTTCE ELSE l.PRIX_TTC_E END PRIXPUBLICTTCE, ''	-- Traitement sur Livret
	IF @@ERROR != 0	GOTO SORTIE	

	SET @Select = @Select +	''b.TVA, b.DCREAT, b.DMODIF,b.DREVIS, b.CIPREFERANT''				IF @@ERROR != 0	GOTO SORTIE

	IF 	@Ordre IN (1,2)	SET @Select = @Select + '', '''' '''' EVENEMENT, '''' '''' DATEEVENEMENT''	
	ELSE IF	@Ordre = 3	SET @Select = @Select + '', f.EVENEMENT, f.DATEEVENEMENT''	
	IF @@ERROR != 0	GOTO SORTIE

	SET @Select = @Select + '' , CASE  WHEN Condi IS NULL THEN a.DENOMSPE  ELSE a.DENOMSPE + '''':'''' + Condi  END DenomCip, ''	IF @@ERROR != 0 GOTO SORTIE

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT ( @Banque IS NULL )
	BEGIN
		IF @Banque = ''O''
			SET @Select = @Select + '' CASE  WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END ID_ORGANISME ''
		ELSE
			SET @Select = @Select + '' l.IDORGANISME ID_ORGANISME''

		SET @Select = @Select + '' ,l.PRIX_TTC_F PRIXTTCF, l.PRIX_TTC_E  PRIXTTCE, l.DISPO, l.COMMENTAIRE''		IF @@ERROR != 0	GOTO SORTIE
		SET @Select = @Select + '', '''''''' PRESENTATION, '''''''' FORME, '''''''' DOSAGE, '''''''' LABO, l.CODHOPITAL''				IF @@ERROR != 0	GOTO SORTIE
		SET @Select = @Select + '',CASE WHEN l.idorganisme IS NULL THEN ''''N'''' ELSE ''''A'''' END FLAG_CAN, ''			IF @@ERROR != 0	GOTO SORTIE
	END

	SET @Select = @Select + ''  b.disponibilite, b.NBprise, b.PriseUnitaire, b.codedispo AS CodeDispo '' 	IF @@ERROR != 0 GOTO SORTIE

-------------------------------------------------------------------------------------------- Construction du FROM ----------------------------------------------------------------------------------------
	SET @From = '' FROM specialite a INNER JOIN SpePresentation b ON  a.id_Specialite = b.id_Specialite''				IF @@ERROR != 0	GOTO SORTIE

	IF @Ordre = 3 
	BEGIN
		SET @From = @From + '' INNER JOIN SpeEvtPresentation f ON b.id_SpePresentation = f.id_SpePresentation''		IF @@ERROR != 0	GOTO SORTIE
	END

	--SET @From = @From + ''  LEFT OUTER JOIN SpeConditionnementPrimaire c ON b.id_SpePresentation = c.id_SpePresentation''	IF @@ERROR != 0	GOTO SORTIE

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF @Banque = ''O''
	BEGIN
		SET @From = @From + '' LEFT OUTER JOIN LivretVidal l ON b.id_SpePresentation = l.id_SpePresentation ''
		IF @@ERROR != 0	GOTO SORTIE
	END
	ELSE IF NOT( @Banque IS NULL )
	BEGIN
		SET @From = @From + '' INNER JOIN LivretVidal l ON b.id_SpePresentation = l.id_SpePresentation ''
		IF @@ERROR != 0	GOTO SORTIE
	END
-------------------------------------------------------------------------------------------- Construction du WHERE ----------------------------------------------------------------------------------------

	--SET @Where = '' (c.TYPECONDPRIMAIRE IS NULL OR UPPER(c.TYPECONDPRIMAIRE) = ''''DENOMCIP'''')''		IF @@ERROR != 0	GOTO SORTIE
	SET @Where = '' WHERE  a.IDTYPESPE IN( '' + @Domaine +'')''							IF @@ERROR != 0	GOTO SORTIE

	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT( @Banque IS NULL )
	BEGIN
		IF @Banque = ''O''
		BEGIN
			SET @Where = @Where + '' AND ( ''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where = @Where + '' CASE WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END IS NULL ''
			IF @@ERROR != 0	GOTO SORTIE
			SET @Where = @Where + '' OR CASE WHEN l.IDORGANISME = ''+@IdHopTxt + '' THEN  l.IDORGANISME ELSE NULL END = '' + @IdHopTxt + '' )''
			IF @@ERROR != 0	GOTO SORTIE
		END
		ELSE
		BEGIN
			SET @Where = @Where + '' AND l.IdOrganisme = '' + CAST( @Id_Hop AS VARCHAR(10)) 
			IF @@ERROR != 0	GOTO SORTIE
		END
	END

	IF @Terme IS NULL
	BEGIN
		SET @Where = @Where + '' AND a.Id_Specialite = '' + CAST(@Id AS VARCHAR(10))
		IF @@ERROR != 0	GOTO SORTIE

	END
	ELSE
	BEGIN
		SET @Where = @Where + ''	AND REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''			IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''				IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''				IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''				IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + ''REPLACE(REPLACE(REPLACE(UPPER(a.DENOMSPE)''					IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '',''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')''						IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '',''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')''								IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '',''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')''									IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '',''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')''								IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '',''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')''								IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '',''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')''									IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '',''''Ç'''',''''C'''')''											IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '',''''Ñ'''',''''N'''')''											IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '' LIKE '''''' + @Terme + ''''''''									IF @@ERROR != 0	GOTO SORTIE
	END

	IF @Ordre = 3
	BEGIN
		SET @Where = @Where + '' AND 	UPPER(f.evenement) LIKE ''''%REMB%'''' AND f.DATEEVENEMENT IN ''
		IF @@ERROR != 0	GOTO SORTIE
		SET @Where = @Where + '' (SELECT MAX(g.DATEEVENEMENT) FROM SPEEVTPRESENTATION g WHERE g.ID_SPEPRESENTATION = f.ID_SPEPRESENTATION  AND  UPPER(g.evenement) LIKE ''''%REMB%'''' ''
		IF @@ERROR != 0	GOTO SORTIE
		IF @Banque IS NULL	SET @Where = @Where + '')''
		ELSE			SET @Where = @Where + '' AND UPPER( g.EVENEMENT) LIKE ''''%REMB%'''') ''	-- Traitement sur livret
		IF @@ERROR != 0	GOTO SORTIE
	END
-------------------------------------------------------------------------------------------- Construction du ORDER BY  ----------------------------------------------------------------------------------------
       -- --YB AJOUT ON MET NOUV et commercialises EN DEBUT DE LISTE 
	-- IF @Ordre = 3			SET @Order = '' ORDER BY EVENEMENT '' 
	--ELSE IF @Banque IS NULL	SET @Order = '' ORDER BY DenomCip''
	 IF @Ordre = 1		             SET @Order = ''  ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), DenomCip''
	 IF @Ordre = 2			SET @Order = ''  ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), PRIXPUBLICTTCE, DenomCip ''
              IF @Ordre = 3			SET @Order = ''  ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), EVENEMENT, DenomCip'' 

	IF @@ERROR != 0	
	GOTO SORTIE

-------------------------------------------------------------------------------------------- REQUETE  ----------------------------------------------------------------------------------------
              SET @time =  replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')            
              SET @TTCIPS =  ''Tmp_GetCips'' +@time


	IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''##'' +@TTCIPS  AND TYPE = ''U'')
	BEGIN
	             SET @Req = ''DROP TABLE ##''+@TTCIPS
                           EXEC(@Req)

		IF @@ERROR != 0 GOTO SORTIE_ERR			

	END

	 SET @Req  = ''CREATE TABLE ##'' +@TTCIPS+  ''
	(
		ID_SPEPRESENTATION	INTEGER,
		ID_SPECIALITE			INTEGER,
		CIP	  			VARCHAR(7),
		UCD				VARCHAR(7),
		AMMEUROPE			VARCHAR(20), 
		LIEUDISPO			VARCHAR(255),	
		CONDDISPO			VARCHAR(255),
		LISTE				VARCHAR(255),
		DUREEPRESCRIPTION		VARCHAR(255),
		PRESCRIPTIONINITIALE	VARCHAR(255), 
		PRESCRIPTIONRESERVEE	VARCHAR(255),
		RENOUVELRESERVE		VARCHAR(255), 
		MEDPARTIC			VARCHAR(1), 
		NATURESURVEILLANCE	VARCHAR(3000),
		CODEREFERANTGENERIQUE	VARCHAR(255), 
		REMPLACE			VARCHAR(7), 
		SOURCEREMPLACE		VARCHAR(255),
		DATESOURCEREMPLACE	DATETIME,
		REMPLACEPAR		VARCHAR(7), 
		SOURCEREMPLACEPAR	VARCHAR(255),
		DATESOURCEREMPLACEPAR	DATETIME, 
		PRIXPRODHTF			REAL, 
		PRIXPUBLICTTCF		REAL,
		PRIXPRODHTE			REAL, 
		PRIXPUBLICTTCE		REAL, 
		TVA				VARCHAR(255), 
		DCREAT			DATETIME, 
		DMODIF			DATETIME,
		DREVIS			DATETIME, 
		CIPREFERANT			VARCHAR(7),
		EVENEMENT			VARCHAR(255),
		DATEEVENEMENT		DATETIME,
		DENOMCIP			VARCHAR(255)

	)''
             EXEC(@Req)


	IF @@ERROR != 0	GOTO SORTIE



	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT( @Banque IS NULL )
	BEGIN
		 SET @Req  = '' ALTER TABLE ##'' + @TTCIPS +
			'' ADD
				ID_ORGANISME		INTEGER,
				PRIXTTCF			REAL,
				PRIXTTCE			REAL,
				DISPO				VARCHAR(60),
				COMMENTAIRE		VARCHAR(255),
				PRESENTATION		VARCHAR(50),
				FORME				VARCHAR(50),
				DOSAGE			VARCHAR(50),
				LABO				VARCHAR(60),
				CODHOPITAL			VARCHAR(30),
				FLAG_CAN			VARCHAR(1) ''
                           EXEC(@Req) 


		IF @@ERROR != 0	GOTO SORTIE

	END


  	 SET @Req  = '' ALTER TABLE ##'' + @TTCIPS +
          			     '' ADD
  				    DISPONIBILITE          VARCHAR(128),
			   	    NBPRISE                 INTEGER,
  				    PRISEUNITAIRE           VARCHAR(255) ,
          				    CODEDISPO	         INTEGER ''
    
		EXEC(@Req)
 		 IF @@ERROR != 0 GOTO SORTIE


	-- Traitement Spécifique Livret --
	-- -------------------------------------------- --
	IF NOT(@Banque IS NULL) AND NOT (@Terme IS NULL ) 
	BEGIN

		SET @Sel2 = ''SELECT b.ID_SPEPRESENTATIONHOP, 0 ID_SPECIALITE, b.CIP,b.UCD, '''''''' AMMEUROPE,  '''''''' LIEUDISPO ,''		IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + '' '''''''' CONDDISPO ,  '''''''' LISTE,  '''''''' DUREEPRESCRIPTION,  '''''''' PRESCRIPTIONINITIALE,  '''''''' PRESCRIPTIONRESERVEE,''	IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + '' '''''''' RENOUVELRESERVE,  '''''''' MEDPARTIC, '''''''' NATURESURVEILLANCE,''							IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + '' '''''''' CODEREFERANTGENERIQUE,  '''''''' REMPLACE,  '''''''' SOURCEREMPLACE,''						IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + '' CONVERT(DATETIME,'' + @Date+ '',0) DATESOURCEREMPLACE, '''''''' REMPLACEPAR, '''''''' SOURCEREMPLACEPAR,''	IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + '' CONVERT(DATETIME,'' + @Date+ '',0) DATESOURCEREMPLACEPAR, 0 PRIXPRODHTF,l.PRIX_TTC_F PRIXPUBLICTTCF,''	IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + ''0 PRIXPRODHTE, l.PRIX_TTC_E PRIXPUBLICTTCE, '''''''' TVA,''									IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + ''CONVERT(DATETIME,'' + @Date+ '',0) DCREAT,CONVERT(DATETIME,'' + @Date+ '',0) DMODIF,CONVERT(DATETIME,'' + @Date+ '',0) DREVIS, '''''''' CIPREFERANT, ''	IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + '' '''''''' EVENEMENT, '''''''' DATEEVENEMENT,''	IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + ''b.NOM DenomCip,  ''                                  IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 +'' l.IDORGANISME, l.PRIX_TTC_F, l.PRIX_TTC_E, l.DISPO, l.COMMENTAIRE,''	IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + '' b.PRESENTATION, b.FORME, b.DOSAGE, b.LABO, l.CODHOPITAL,''	IF @@ERROR != 0	GOTO SORTIE
		SET @Sel2 = @Sel2 + '' ''''C'''' FLAG_CAN,  '''''''' disponibilite,  '''''''' NBprise, '''''''' PriseUnitaire, 0 codedispo ''	IF @@ERROR != 0	GOTO SORTIE

		SET @From2 = '' FROM SPEPRESENTATIONHOP b INNER JOIN LIVRETHOP l ON b.ID_SPEPRESENTATIONHOP = l.ID_SPEPRESENTATIONHOP''	IF @@ERROR != 0	GOTO SORTIE

		SET @Where2 = '' WHERE l.IDORGANISME = b.IDORGANISME AND l.IDORGANISME = '' + CAST(@Id_Hop AS VARCHAR(10) )	IF @@ERROR != 0	GOTO SORTIE
		SET @Where2 = @Where2 + ''	AND REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''				IF @@ERROR != 0	GOTO SORTIE
		SET @Where2 = @Where2 + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''					IF @@ERROR != 0	GOTO SORTIE
		SET @Where2 = @Where2 + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''					IF @@ERROR != 0	GOTO SORTIE
		SET @Where2 = @Where2 + ''REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(''					IF @@ERROR != 0	GOTO SORTIE
		SET @Where2 = @Where2 + ''REPLACE(REPLACE(REPLACE(UPPER(b.NOM)''							IF @@ERROR != 0	GOTO SORTIE
		SET @Where2 = @Where2 + '',''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')''							IF @@ERROR != 0	GOTO SORTIE
		SET @Where2 = @Where2 + '',''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')''									IF @@ERROR != 0	GOTO SORTIE
		SET @Where2 = @Where2 + '',''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')''										IF @@ERROR != 0	GOTO SORTIE
		SET @Where2 = @Where2 + '',''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')''									IF @@ERROR != 0	GOTO SORTIE
		SET @Where2 = @Where2 + '',''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')''									IF @@ERROR != 0	GOTO SORTIE
		SET @Where2 = @Where2 + '',''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')''										IF @@ERROR != 0	GOTO SORTIE
		SET @Where2 = @Where2 + '',''''Ç'''',''''C'''')''												IF @@ERROR != 0	GOTO SORTIE
		SET @Where2 = @Where2 + '',''''Ñ'''',''''N'''')''												IF @@ERROR != 0	GOTO SORTIE
		SET @Where2 = @Where2 + '' LIKE '''''' + @Terme + ''''''''										IF @@ERROR != 0	GOTO SORTIE

-------------------------------------------------------------------------------------------- Construction du ORDER BY  ----------------------------------------------------------------------------------------

	IF @Ordre = 3			SET @Order2 = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), EVENEMENT, DenomCip ''
	ELSE IF @Ordre = 1		SET @Order2 = '' ORDER BY ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), DenomCip''
	ELSE				SET @Order2 = '' ORDER BY  ( CASE WHEN CodeDispo IN (0,3) THEN 0 ELSE 1 END ), PRIXPUBLICTTCE, DenomCip ''
	
	IF @@ERROR != 0	GOTO SORTIE


		 EXEC ( '' INSERT INTO  ##'' +@TTCIPS  + '' SELECT * FROM (''+ @Select + @From + @Where + '' UNION '' + @Sel2 + @From2 + @Where2 + '') AS List ''+ @Order2 )
              

	END
	ELSE
	BEGIN
		EXEC( '' INSERT INTO  ##'' + @TTCIPS  +''  ''+ @Select + @From + @Where + @Order )
	END
	IF @@ERROR != 0 
	BEGIN
		GOTO SORTIE_ERR
	END
	IF @@ERROR != 0 GOTO SORTIE_ERR


	/*SET @Curseur = CURSOR FOR SELECT * FROM ##Tmp_GetCips
	IF @@ERROR != 0 GOTO SORTIE_ERR


	OPEN @Curseur
	IF @@ERROR != 0 GOTO SORTIE_ERR
*/	

              -- TEST ERREUR
	IF @@ERROR != 0
                       BEGIN
		IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''##'' + @TTCIPS AND TYPE = ''U'')
		SET @Req = ''DROP TABLE ##''+ @TTCIPS
                           EXEC(@Req)


		GOTO SORTIE_ERR
                       END                     



END

-- TERMINAISON
SORTIE:
	RETURN 0

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur























































' 
END
GO
/****** Objet :  Table [dbo].[SpeClassIRIS]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeClassIRIS]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SpeClassIRIS](
	[id_Specialite] [T_COMPTEUR] NOT NULL,
	[id_DicoComClassIRIS] [T_COMPTEUR] NOT NULL,
	[libelle] [T_TEXTE_LONG] NOT NULL,
 CONSTRAINT [PK_SpeClassIRIS] PRIMARY KEY NONCLUSTERED 
(
	[id_Specialite],
	[id_DicoComClassIRIS]
)
)
END
GO
/****** Objet :  Table [dbo].[SpePosoIndic]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpePosoIndic]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SpePosoIndic](
	[id_SpePoso] [T_COMPTEUR] NOT NULL,
	[id_SpeIndic] [T_COMPTEUR] NOT NULL,
 CONSTRAINT [PK_SpePosoIndic] PRIMARY KEY NONCLUSTERED 
(
	[id_SpePoso],
	[id_SpeIndic]
)
)
END
GO
/****** Objet :  Table [dbo].[SpeLabs_Rel]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeLabs_Rel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SpeLabs_Rel](
	[id_Specialite] [T_COMPTEUR] NOT NULL,
	[id_Laboratoire] [T_COMPTEUR] NOT NULL,
	[titulaireExploitant] [T_TEXTE_LONG] NULL,
 CONSTRAINT [PK_SpeLabs_Rel] PRIMARY KEY NONCLUSTERED 
(
	[id_Specialite],
	[id_Laboratoire]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SpeLabs_Rel]') AND name = N'IX_id_Laboratoire')
CREATE NONCLUSTERED INDEX [IX_id_Laboratoire] ON [dbo].[SpeLabs_Rel] 
(
	[id_Laboratoire]
)
GO
/****** Objet :  StoredProcedure [dbo].[p_GetNoIAMSpe]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetNoIAMSpe]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[p_GetNoIAMSpe]
(		@ID_Specialite             VARCHAR(100),
                           @Id                              T_COMPTEUR = NULL,
                           @typ                             VARCHAR(100),
		@TTNoIAM	           VARCHAR(100) OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur 		INTEGER
DECLARE @Req 		varchar(4000)
DECLARE @Time 		varchar(25)
DECLARE @varRequete	VARCHAR(8000)
DECLARE @TableT 		varchar(25)

--BODY
BEGIN
	SET NOCOUNT  ON
	SET @Erreur =0

	SET @varRequete = ''''
	SET @Req =''''
             SET @Time = replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET @TTNoIAM = ''Tmp_GetNoIAM'' +@Time


--**//**Recherche par Indication **//**--
	IF @Typ = ''8''
                 BEGIN

   	SET @varRequete = '' Select b.ID_SPECIALITE,
		  b.Bvalid, b.Bencours,  b.Nomuser, b.Denomspe,
		  b.Forme, b.Dosage, b.Complement,
                            CAST(b.Commammposo AS VARCHAR(4000)) AS ''''Commammposo'''' , b.Reserve, b.Inferieurage,
		b.Unitinf, b.Superieurage, b.Unifsup, b.Inferieurpoids, b.Superieurpoids,
		b.Denomamm, b.Numdosamm,  b.Specategorie, b.Source, b.Datesource, 
 		CAST(b.Remarques AS VARCHAR(4000)) AS ''''Remarques'''',
		b.Dcreat, b.Dmodif, b.Drevis
		 INTO ##''+  @TTNoIAM +''
		From SPECIALITE b, SPEINDIC a
		where b .ID_SPECIALITE = a.ID_SPECIALITE
       		And (a.Id_T_Indic = ''+CONVERT(VARCHAR(10), @Id) +'')
       		And  b.ID_SPECIALITE not in (Select h.id_specialite
       					FROM IAMCLASSE_IAMCOUPLE a,
					IAMCLASSE_IAMCOUPLE b, IAMCOUPLE c,
					 IAMCLASS d,  IAMCLASS e,
					SPECIALITE f, SPECIALITE_IAMCLASS g,
  				             SPECIALITE h, SPECIALITE_IAMCLASS i
         					WHERE           a.id_iamcouple = b.id_iamcouple
                   				AND               a.id_iamclasse <> b.id_iamclasse
 	     				AND           a.id_iamcouple  = c.id_iamcouple
                 				 AND           a.id_iamclasse  = d.id_iamclasse
                 				 AND           b.id_iamclasse  = e.id_iamclasse
                 				 AND           d.id_iamclasse  = g.id_iamclasse
                 				 AND           g.ID_SPECIALITE = f.ID_SPECIALITE
                 				 AND           f.ID_SPECIALITE IN (''+ @ID_Specialite +'')
                  				AND           e.id_iamclasse  = i.id_iamclasse
                  				AND           i.ID_SPECIALITE = h.ID_SPECIALITE) 
	    ORDER BY  b.Denomspe''

	    EXEC (@varRequete)
	    END

--**//**Recherche par Groupe d''Indications **//**--

	IF @Typ = ''9''
                 BEGIN

   	   SET @varRequete = ''Select b.ID_SPECIALITE,
                  b.Bvalid, b.Bencours,  b.Nomuser, b.Denomspe,
                  b.Forme, b.Dosage, b.Complement, b.Commammposo, b.Reserve, b.Inferieurage,
                  b.Unitinf, b.Superieurage, b.Unifsup, b.Inferieurpoids, b.Superieurpoids,
                  b.Denomamm, b.Numdosamm,  b.Specategorie, b.Source, b.Datesource, b.Remarques,
                  b.Dcreat, b.Dmodif, b.Drevis
                  INTO ##''+  @TTNoIAM +''
                  From SPECIALITE b, SPEINDIC a, GROUPINDICINDIC_REL c
                  Where c.ID_GROUPINDIC =  (''+CONVERT(VARCHAR(10), @Id) +'')
                  And a.ID_T_INDIC    = c.ID_T_INDIC
                  And b.ID_SPECIALITE = a.ID_SPECIALITE
                  And  b.ID_SPECIALITE not in (Select h.id_specialite
                                            FROM IAMCLASSE_IAMCOUPLE a,
                                            IAMCLASSE_IAMCOUPLE b, IAMCOUPLE c,
                                            IAMCLASS d, IAMCLASS e,
                                            SPECIALITE f, SPECIALITE_IAMCLASS g,
                                            SPECIALITE h,SPECIALITE_IAMCLASS i
                                            WHERE           a.id_iamcouple = b.id_iamcouple
                                            AND           a.id_iamclasse <> b.id_iamclasse
                                            AND           a.id_iamcouple  = c.id_iamcouple
                                            AND           a.id_iamclasse  = d.id_iamclasse
                                            AND           b.id_iamclasse  = e.id_iamclasse
                                            AND           d.id_iamclasse  = g.id_iamclasse
                                            AND           g.ID_SPECIALITE = f.ID_SPECIALITE
                                            AND           f.ID_SPECIALITE IN ('' +@ID_Specialite + '')
                                            AND           e.id_iamclasse  = i.id_iamclasse
                                            AND           i.ID_SPECIALITE = h.ID_SPECIALITE)
                  ORDER BY b.Denomspe'' 
	EXEC (@varRequete)
	    END

--**//**Recherche par Classe Théra **//**--

	IF @Typ = ''3''
                 BEGIN
	             SET @TableT = ''TMP_CONNECTBY'' +@Time
             		SET  @Req = ''''
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TableT+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TableT
                           EXEC(@Req)

	-- Création de la table temporaire
		SET @Req = ''CREATE TABLE ##''+ @TableT +'' ( ID_COL INTEGER )''
		EXEC(@Req) 


		-- Récupération de la hiérachie
		    /* Juste pour mémo, les paramètres de la procédure : p_Connect_By NomTable, ColPere, ColFils, TypeNoeud, ID, ListeID, Terme */
		EXEC @Erreur = p_Connect_By  ''DICOCOMCLASSIRIS'', ''dic_id_dicocomclassiris'', ''id_dicocomclassiris'',  ''P'', @Id, NULL, NULL, @TableT 
		IF @Erreur != 0
			GOTO SORTIE_ERR
	-- FIN PREPA LISTE CONNECT --


  	    SET @varRequete = ''     Select b.ID_SPECIALITE,
    			 b.Bvalid, b.Bencours,  b.Nomuser, b.Denomspe,
     			 b.Forme, b.Dosage, b.Complement, b.Commammposo, b.Reserve, b.Inferieurage,
     			 b.Unitinf, b.Superieurage, b.Unifsup, b.Inferieurpoids, b.Superieurpoids,
     			 b.Denomamm, b.Numdosamm,  b.Specategorie, b.Source, b.Datesource, b.Remarques,
     			 b.Dcreat, b.Dmodif, b.Drevis
		              INTO ##''+  @TTNoIAM +''
         			 FROM SPECIALITE b, SPECLASSIRIS a
    			 WHERE a.ID_DICOCOMCLASSIRIS in   ( SELECT * FROM ##''+@TableT+'')
					                                      AND b.ID_SPECIALITE = a.ID_SPECIALITE
					                                      AND b.ID_SPECIALITE not in (Select h.id_specialite
					                                      FROM IAMCLASSE_IAMCOUPLE a,
					                                      IAMCLASSE_IAMCOUPLE b,
				    			           IAMCOUPLE c,IAMCLASS d,
				      				IAMCLASS e, SPECIALITE f,
				      				SPECIALITE_IAMCLASS g, SPECIALITE h,
				     				 SPECIALITE_IAMCLASS i
                                      						WHERE           a.id_iamcouple = b.id_iamcouple
                                     						 AND           a.id_iamclasse <> b.id_iamclasse
			              				AND           a.id_iamcouple  = c.id_iamcouple
                                      						AND           a.id_iamclasse  = d.id_iamclasse
                                     						 AND           b.id_iamclasse  = e.id_iamclasse
                                      						AND           d.id_iamclasse  = g.id_iamclasse
                                      						AND           g.ID_SPECIALITE = f.ID_SPECIALITE
                                     						 AND           f.ID_SPECIALITE IN ('' +@ID_Specialite + '')
                                      						 AND           e.id_iamclasse  = i.id_iamclasse
                                     						 AND           i.ID_SPECIALITE = h.ID_SPECIALITE)
    			 ORDER BY b.Denomspe'' 
	EXEC (@varRequete)

	SET @Req = '' IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TableT+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TableT
                           EXEC(@Req)
	    END



/*	SET @Req = ''IF EXISTS(SELECT 1 FROM tempdb..SYSObjects WHERE name=''''##''+ @TTNoIAM + ''''''AND type = ''''U'''')
		DROP TABLE ##''+ @TTNoIAM
                           EXEC(@Req)	



	SET @Req = '' IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TableT+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TableT
                           EXEC(@Req)*/


	
	IF @@ERROR != 0
		GOTO SORTIE_ERR

END
	-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
	SET @Erreur = @@ERROR
	RETURN @Erreur




' 
END
GO
/****** Objet :  Table [dbo].[SpePoso]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpePoso]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SpePoso](
	[id_Specialite] [T_COMPTEUR] NOT NULL,
	[id_SpePrise] [T_COMPTEUR] NULL,
	[id_SpePoso] [T_COMPTEUR] NOT NULL,
	[relecturePar] [T_LIBELLE_1] NULL,
	[posoUsuInf] [T_OVP_FLOAT] NULL,
	[posoUsuSup] [T_OVP_FLOAT] NULL,
	[posoUsuType] [T_TEXTE_LONG] NULL,
	[posoMin] [T_OVP_FLOAT] NULL,
	[posoMinType] [T_TEXTE_LONG] NULL,
	[posoMax] [T_OVP_FLOAT] NULL,
	[posoMaxType] [T_TEXTE_LONG] NULL,
	[posoTotMax] [T_OVP_FLOAT] NULL,
	[posoTotMaxType] [T_TEXTE_LONG] NULL,
	[freqUsuInf] [T_OVP_ENTIERS] NULL,
	[freqUsuSup] [T_OVP_ENTIERS] NULL,
	[freqUsuType] [T_TEXTE_LONG] NULL,
	[freqInfPosoMax] [T_OVP_ENTIERS] NULL,
	[freqSupPosoMax] [T_OVP_ENTIERS] NULL,
	[freqPosoMaxType] [T_TEXTE_LONG] NULL,
	[freqInfPosoMin] [T_OVP_ENTIERS] NULL,
	[freqSupPosoMin] [T_OVP_ENTIERS] NULL,
	[freqPosoMinType] [T_TEXTE_LONG] NULL,
	[freqPosoTotMaxType] [T_TEXTE_LONG] NULL,
	[freqInfRenouv] [T_OVP_ENTIERS] NULL,
	[freqSupRenouv] [T_OVP_ENTIERS] NULL,
	[freqRenouvType] [T_TEXTE_LONG] NULL,
	[freqDiv] [T_LIBELLE_1] NOT NULL,
	[durAdUsuInf] [T_OVP_ENTIERS] NULL,
	[durAdUsuSup] [T_OVP_ENTIERS] NULL,
	[durAdUsuType] [T_TEXTE_LONG] NULL,
	[durMax] [T_OVP_ENTIERS] NULL,
	[durMaxType] [T_TEXTE_LONG] NULL,
	[durTotal] [T_OVP_ENTIERS] NULL,
	[durTotalType] [T_TEXTE_LONG] NULL,
	[durArretInf] [T_OVP_ENTIERS] NULL,
	[durArretSup] [T_OVP_ENTIERS] NULL,
	[durArretType] [T_TEXTE_LONG] NULL,
	[poidsInf] [T_OVP_FLOAT] NOT NULL,
	[poidsSup] [T_OVP_FLOAT] NULL,
	[ageInf] [T_OVP_ENTIERS] NOT NULL,
	[uniteAgeInf] [T_TEXTE_LONG] NULL,
	[ageSup] [T_OVP_ENTIERS] NULL,
	[uniteAgeSup] [T_TEXTE_LONG] NULL,
	[phase] [T_TEXTE_LONG] NULL,
	[ordredephase] [T_OVP_ENTIERS] NULL,
	[lienPhase] [T_LIBELLE_1] NOT NULL,
	[etatPreexistant] [T_TEXTE_LONG] NULL,
	[situDsTempsPosoInf] [T_TEXTE_LONG] NULL,
	[situDsTempsPosoSup] [T_TEXTE_LONG] NULL,
	[renouvellement] [T_TEXTE_LONG] NULL,
	[sexe] [T_LIBELLE_1] NOT NULL,
	[coPrescription] [T_MEMO] NULL,
	[repas] [T_TEXTE_LONG] NULL,
	[conseil] [T_MEMO] NULL,
	[modeEmploi] [T_MEMO] NULL,
	[dCreat] [T_DATE_SYST] NULL,
	[dModif] [T_DATE_SYST] NULL,
	[dRevis] [T_DATE_SYST] NULL,
 CONSTRAINT [PK_SpePoso] PRIMARY KEY NONCLUSTERED 
(
	[id_SpePoso]
)
)
END
GO
/****** Objet :  Table [dbo].[SpeSuiviSGML]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeSuiviSGML]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SpeSuiviSGML](
	[id_SpeSuiviSGML] [T_COMPTEUR] NOT NULL,
	[id_SpePresentation] [T_COMPTEUR] NOT NULL,
	[ouvrage] [T_TEXTE_LONG] NULL,
	[millesime] [T_OVP_ENTIERS] NOT NULL,
	[monographie] [T_libelle9] NOT NULL,
	[commTexte] [T_MEMO] NULL,
	[dCreat] [T_DATE_SYST] NULL,
	[dateParution] [T_DATE_SYST] NULL,
 CONSTRAINT [PK_SpeSuiviSGML] PRIMARY KEY NONCLUSTERED 
(
	[id_SpeSuiviSGML]
)
)
END
GO
/****** Objet :  Table [dbo].[SubPE]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SubPE]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SubPE](
	[id_Substance] [T_COMPTEUR] NOT NULL,
	[id_SubPE] [T_COMPTEUR] NOT NULL,
	[terme] [T_TEXTE_LONG] NULL,
	[comm] [T_MEMO] NULL,
	[dCreat] [T_DATE_SYST] NULL,
	[dModif] [T_DATE_SYST] NULL,
	[ordre] [T_ORDRE] NOT NULL,
 CONSTRAINT [PK_SubPE] PRIMARY KEY NONCLUSTERED 
(
	[id_SubPE]
)
)
END
GO
/****** Objet :  Table [dbo].[SpeVoie]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SpeVoie]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SpeVoie](
	[id_Specialite] [T_COMPTEUR] NOT NULL,
	[voie] [T_TEXTE_LONG] NOT NULL,
	[ordre] [T_ORDRE] NOT NULL,
 CONSTRAINT [PK_SpeVoie] PRIMARY KEY NONCLUSTERED 
(
	[id_Specialite],
	[voie]
)
)
END
GO
/****** Objet :  Table [dbo].[T_CI]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_CI]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[T_CI](
	[id_T_CI] [T_COMPTEUR] NOT NULL,
	[libelle] [T_LIBELLE_100] NOT NULL,
	[texte] [T_MEMO] NULL,
	[creation] [T_DATE_SYST] NULL,
	[validation] [T_LIBELLE_1] NULL,
	[remarques] [T_MEMO] NULL,
 CONSTRAINT [PK_T_CI] PRIMARY KEY NONCLUSTERED 
(
	[id_T_CI]
)
)
END
GO
/****** Objet :  Table [dbo].[SynonyIndic_Rel]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SynonyIndic_Rel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SynonyIndic_Rel](
	[id_T_SynonyIndic] [T_COMPTEUR] NOT NULL,
	[id_T_Indic] [T_COMPTEUR] NOT NULL,
	[texte] [T_MEMO] NULL,
	[creation] [T_DATE_SYST] NULL,
 CONSTRAINT [PK_SynonyIndic_Rel] PRIMARY KEY NONCLUSTERED 
(
	[id_T_SynonyIndic],
	[id_T_Indic]
)
)
END
GO
/****** Objet :  Table [dbo].[SynonyCI_Rel]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SynonyCI_Rel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SynonyCI_Rel](
	[id_T_SynonyCI] [T_COMPTEUR] NOT NULL,
	[id_T_CI] [T_COMPTEUR] NOT NULL,
	[texte] [T_MEMO] NULL,
	[creation] [T_DATE_SYST] NULL,
 CONSTRAINT [PK_SynonyCI_Rel] PRIMARY KEY NONCLUSTERED 
(
	[id_T_SynonyCI],
	[id_T_CI]
)
)
END
GO
/****** Objet :  Table [dbo].[T_SynonyCI]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_SynonyCI]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[T_SynonyCI](
	[id_T_SynonyCI] [T_COMPTEUR] NOT NULL,
	[libelle] [T_LIBELLE_100] NOT NULL,
	[texte] [T_MEMO] NULL,
	[creation] [T_DATE_SYST] NULL,
 CONSTRAINT [PK_T_SynonyCI] PRIMARY KEY NONCLUSTERED 
(
	[id_T_SynonyCI]
)
)
END
GO
/****** Objet :  Table [dbo].[T_Indic]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_Indic]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[T_Indic](
	[id_T_Indic] [T_COMPTEUR] NOT NULL,
	[libelle] [T_LIBELLE_100] NOT NULL,
	[texte] [T_MEMO] NULL,
	[creation] [T_DATE_SYST] NULL,
	[validation] [T_LIBELLE_1] NULL,
	[remarques] [T_MEMO] NULL,
 CONSTRAINT [PK_T_Indic] PRIMARY KEY NONCLUSTERED 
(
	[id_T_Indic]
)
)
END
GO
/****** Objet :  Table [dbo].[IAMClass]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[IAMClass]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[IAMClass](
	[id_IAMClasse] [T_COMPTEUR] NOT NULL,
	[classe] [T_libelle65] NOT NULL,
	[definition] [T_MEMO] NOT NULL,
	[remarque] [T_TEXTE_LONG] NULL,
	[dCreat] [T_DATE_SYST] NULL,
	[dModif] [T_DATE_SYST] NULL,
	[dRevis] [T_DATE_SYST] NULL,
 CONSTRAINT [PK_IAMClass] PRIMARY KEY NONCLUSTERED 
(
	[id_IAMClasse]
)
)
END
GO
/****** Objet :  Table [dbo].[IAMCouple]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[IAMCouple]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[IAMCouple](
	[id_IAMCouple] [T_COMPTEUR] NOT NULL,
	[niveauGravite] [T_TEXTE_LONG] NULL,
	[RisqEtMecan] [T_TEXTE_LONG] NOT NULL,
	[conduiteATenir] [T_TEXTE_LONG] NULL,
	[remarque] [T_TEXTE_LONG] NULL,
	[dispensateur] [T_MEMO] NULL,
	[dCreat] [T_DATE_SYST] NULL,
	[dModif] [T_DATE_SYST] NULL,
	[dRevis] [T_DATE_SYST] NULL,
 CONSTRAINT [PK_IAMCouple] PRIMARY KEY NONCLUSTERED 
(
	[id_IAMCouple]
)
)
END
GO
/****** Objet :  Table [dbo].[GroupIndicIndic_Rel]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GroupIndicIndic_Rel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupIndicIndic_Rel](
	[id_T_Indic] [T_COMPTEUR] NOT NULL,
	[id_GroupIndic] [T_COMPTEUR] NOT NULL,
	[texte] [T_MEMO] NULL,
	[creation] [T_DATE_SYST] NULL,
	[ordre] [T_ORDRE] NOT NULL,
 CONSTRAINT [PK_GroupIndicIndic_Rel] PRIMARY KEY NONCLUSTERED 
(
	[id_T_Indic],
	[id_GroupIndic]
)
)
END
GO
/****** Objet :  StoredProcedure [dbo].[P_Del_Compo]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[P_Del_Compo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- ----------------------------------------------------------
  -- Procedure d''suppression - Table : COMPOVIDAL/COMPOHOP
  -- ----------------------------------------------------------
CREATE PROCEDURE [dbo].[P_Del_Compo]
(
	@Param 			INTEGER,
	@Id_Organisme		T_COMPTEUR,
	@Id_SpePresentationHop	T_COMPTEUR,
	@Id_t_sub 		T_COMPTEUR,
	@Cod_Trt 		T_TEXTE_LONG OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER

-- BODY PROC
BEGIN
	SET NOCOUNT  ON

	-- INITIALISATION VARIABLE D''ERREUR
	SET @Erreur = 0

	SET @Cod_Trt = ''''
	IF @@ERROR != 0 GOTO SORTIE_ERR

	IF @Param = 1 
	BEGIN
		BEGIN TRANSACTION
			DELETE FROM COMPOVIDAL
			WHERE IDORGANISME = @Id_Organisme
			AND ID_SPEPRESENTATIONHOP = @Id_SpePresentationHop
			AND (@Id_t_sub = 0 OR ID_T_SUB = @Id_t_sub)
			IF @@ERROR != 0
			BEGIN
				ROLLBACK TRANSACTION
				GOTO SORTIE_ERR
			END
		COMMIT TRANSACTION
		IF @@ERROR != 0
			GOTO SORTIE_ERR

		SET @Cod_Trt = ''SQL-00000 : Normal, Successful completion''
		IF @@ERROR != 0 GOTO SORTIE_ERR
	END

	ELSE IF	@Param = 2
	BEGIN
		BEGIN TRANSACTION
			DELETE FROM COMPOHOP
			WHERE IDORGANISME = @Id_Organisme
			AND ID_SPEPRESENTATIONHOP = @Id_SpePresentationHop
			AND (@Id_t_sub = 0 OR ID_T_SUBhop = @Id_t_sub)
			IF @@ERROR != 0
			BEGIN
				ROLLBACK TRANSACTION
				GOTO SORTIE_ERR
			END
		COMMIT TRANSACTION
		IF @@ERROR != 0
			GOTO SORTIE_ERR

		SET @Cod_Trt = ''SQL-00000 : Normal, Successful completion''
		IF @@ERROR != 0 GOTO SORTIE_ERR
	END


END


-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Cod_Trt = ''SQL-'' + CAST(@@ERROR AS VARCHAR(10)) + '' : Error execution''

	RETURN @Erreur




		

	








' 
END
GO
/****** Objet :  Table [dbo].[HierarchieCI_Rel]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[HierarchieCI_Rel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[HierarchieCI_Rel](
	[id_HierarchieCI_Rel] [T_COMPTEUR] NOT NULL,
	[id_T_CI_F] [T_COMPTEUR] NOT NULL,
	[id_T_CI_P] [T_COMPTEUR] NOT NULL,
	[creation] [T_DATE_SYST] NOT NULL,
 CONSTRAINT [PK_HierarchieCI_Rel] PRIMARY KEY NONCLUSTERED 
(
	[id_HierarchieCI_Rel]
)
)
END
GO
/****** Objet :  StoredProcedure [dbo].[GetTheraSpes_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetTheraSpes_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetTheraSpes_Id]
(
	@ID_DICOCOMCLASSIRIS	T_COMPTEUR=NULL,
	@Ret			INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetTheraSpes_Id'')

--STATS



	SET @Erreur = 0
	SET NOCOUNT ON

	SELECT
		t2.id_specialite, t2.bvalid, t2.bencours, t2.nomuser, t2.denomspe, t2.forme,
		t2.dosage, t2.complement,
		CAST(t2.commammposo AS VARCHAR(4000)) AS ''COMMAMMPOSO'',
		t2.reserve, t2.inferieurage, t2.unitinf,
		t2.superieurage, t2.unifsup, t2.inferieurpoids, t2.superieurpoids,
		t2.denomamm, t2.numdosamm, t2.specategorie, t2.source,
		CONVERT(CHAR(10),t2.datesource,103) AS ''DATESOURCE'',
		CAST(t2.remarques AS VARCHAR(4000)) AS ''REMARQUES'',
		CONVERT(CHAR(10),t2.dcreat,103) AS ''DCREAT'',
		CONVERT(CHAR(10),t2.dmodif,103) AS ''DMODIF'',
		CONVERT(CHAR(10),t2.drevis,103) AS ''DREVIS''

	FROM SPECIALITE t2, SPECLASSIRIS t1
	WHERE t1.id_dicocomclassiris = @ID_DICOCOMCLASSIRIS
	AND t2.id_specialite = t1.id_specialite



	IF @@ERROR != 0
	GOTO SORTIE_ERR
	

-- PAS D''ERREUR
	set @Ret = 0
		GOTO SORTIE
END

-- Gestion des erreurs
SORTIE_ERR:
	-- Sauvegarde de l''erreur
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	set @Ret = @Erreur

-- Cas de sortie sans erreur
SORTIE:
	RETURN @Ret













' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Connect_By]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Connect_By]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Connect_By]( 	
					@Table VARCHAR(30),		-- La taille des variables @Col_P et @Col_F a été "agrandie"
					@Col_P VARCHAR(200),	-- car dans certaines procédures, leur valeur nécessite
					@Col_F VARCHAR(200),	-- un formatage particulier (cf. GetATCAncesterTxt par exmple)
					@Noeud VARCHAR(1)=NULL,	
					@Id AS T_COMPTEUR=0,
					@Liste AS VARCHAR(1000)=NULL,
					@Terme AS VARCHAR(100)=NULL,
					@TableT AS VARCHAR(100)=NULL
				        ) AS

-- DEFINITION DES VARIABLES LOCALES
--------------------------------------------------------------------------------
DECLARE @Erreur INTEGER
DECLARE @Index INTEGER
DECLARE @NewListe VARCHAR(4000)
DECLARE @Sql VARCHAR(1000)
DECLARE @IdListe VARCHAR(4000)
DECLARE @i INTEGER
DECLARE @Curseur CURSOR
DECLARE @Req  VARCHAR(100)     
DECLARE @TTEMP  VARCHAR(100)   
DECLARE @Time varchar(25)
--BODY
--------------------------------------------------------------------------------
BEGIN
	SET NOCOUNT  ON

	-- Initialisation variable de sortie
	SET @Erreur = 0

	SET @IdListe = ''''
	SET @NewListe = ''''
             SET @Req = ''''

             SET @Time = replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET @TTEMP = ''TMPI_CONNECTBY'' +@Time

	IF EXISTS( SELECT 1 FROM  tempdb..sysobjects  WHERE NAME = ''##'' + @TTEMP AND TYPE = ''U'')
		SET @Req = ''DROP TABLE ##''+ @TTEMP
                           EXEC(@Req)

	-- Création de la table temporaire
	SET @Req = ''CREATE TABLE ##''+ @TTEMP +'' ( Id_F INTEGER )''
	EXEC(@Req) 

	IF @Liste IS NOT NULL
		IF @Noeud = ''F'' 
			Set @Sql = '' INSERT INTO ##'' +@TTEMP+ '' SELECT DISTINCT '' + @Col_P + '' FROM '' + @Table + ''  WHERE '' + @Col_F + '' IN ('' + @Liste + '')''
		ELSE IF @Noeud = ''P''
			Set @Sql = '' INSERT INTO ##'' +@TTEMP+ '' SELECT DISTINCT '' + @Col_F + '' FROM '' + @Table + ''  WHERE '' + @Col_P + '' IN ('' + @Liste + '')''
		ELSE
			Set @Sql = '' INSERT INTO ##'' +@TTEMP+ '' SELECT DISTINCT '' + @Col_P+ '' FROM '' + @Table + ''  WHERE '' + @Col_P + '' IN ('' + @Liste + '')''

	ELSE IF @Id > 0
		IF @Noeud = ''F'' 
			Set @Sql = '' INSERT INTO ##'' +@TTEMP+ '' SELECT DISTINCT '' + @Col_P + '' FROM ''  + @Table + ''  WHERE '' + @Col_F + '' = ''  + CAST(@Id AS VARCHAR(10))
		ELSE IF @Noeud = ''P''
			Set @Sql = '' INSERT INTO ##'' +@TTEMP+ '' SELECT DISTINCT '' + @Col_F + '' FROM '' + @Table + ''  WHERE '' + @Col_P + '' = ''  + CAST(@Id AS VARCHAR(10))
		ELSE
			Set @Sql = '' INSERT INTO ##'' +@TTEMP+ '' SELECT DISTINCT '' + @Col_P + '' FROM '' + @Table + ''  WHERE '' + @Col_P + '' = ''  + CAST(@Id AS VARCHAR(10))

	ELSE IF @Terme IS NOT NULL
		IF @Noeud = ''F'' 
			Set @Sql = '' INSERT INTO ##'' +@TTEMP+ '' SELECT DISTINCT '' + @Col_P + '' FROM ''  + @Table + ''  WHERE '' + @Col_F + '' IN ("''  + @Terme + ''")''
		ELSE IF @Noeud = ''P''
			Set @Sql = '' INSERT INTO ##'' +@TTEMP+ '' SELECT DISTINCT '' + @Col_F + '' FROM '' + @Table + ''  WHERE '' + @Col_P + '' IN ("''  + @Terme + ''")''
		ELSE
			Set @Sql = '' INSERT INTO ##'' +@TTEMP+ '' SELECT DISTINCT '' + @Col_P + '' FROM ''  + @Table + ''  WHERE '' + @Col_P + '' IN ("''  + @Terme + ''")''
	ELSE
		GOTO SORTIE

	EXEC ( @Sql )


	IF @@ERROR != 0 GOTO SORTIE_ERR



	SET @Sql = ''DECLARE Curseur CURSOR FOR SELECT * FROM  ##'' + @TTEMP
	EXEC (@Sql)
	
	OPEN Curseur
	FETCH Curseur INTO @Index
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @IdListe = '''' SET @IdListe = CAST(@Index AS VARCHAR(10))
		ELSE 		SET @IdListe = @IdListe + '','' + CAST(@Index AS VARCHAR(10))
		FETCH Curseur INTO @Index

	END

	CLOSE Curseur
	DEALLOCATE Curseur
	
--ML Début : 19/11/2002.  Pour les ancêtres eux même (GetATC ou TheraAncester)
	 IF @Id > 0
	             BEGIN
		  IF @Index is null 
			BEGIN
			SET @Index = @Id  
			SET @IdListe =  CAST(@Index AS VARCHAR(10))
			END		
		END 
--ML Fin : 19/11/2002

              SET @Req = ''DROP TABLE ##''+ @TTEMP
                           EXEC(@Req)
	--DROP TABLE ##TMPI_CONNECTBY

	IF LEN( @IdListe) = 0
		SET @i = -1
	ELSE
		SET @i = PATINDEX(''%,%'', @IdListe)



	WHILE @i >= 0
	BEGIN
		IF @i > 0
		BEGIN
			SET @Index = CAST( SUBSTRING(@IdListe,1, @i-1) AS INTEGER)
			SET @IdListe = SUBSTRING(@IdListe,@i+1, LEN(@IdListe)-@i )
		END
		ELSE
		BEGIN
			SET @Index = cast( @IdListe as integer )
		END

		IF @Index != 0

		BEGIN
			IF NOT @Noeud IN(''P'',''F'')
			BEGIN
				EXEC @Erreur = p_Connect_By @Table, @Col_P, @Col_F, ''F'', @Index, NULL,NULL, @tableT
				IF @Erreur != 0	GOTO SORTIE_ERR
			END	

			-- Insertion valeur dans table temporaire destinataire		

			BEGIN TRANSACTION
	                           SET @Req = ''INSERT INTO ##''+ @TableT +'' VALUES( '' + CAST(@Index AS VARCHAR(10))+ '' )''

                                        EXEC (@Req)
			IF @@ERROR != 0

			BEGIN
				ROLLBACK TRANSACTION
				GOTO SORTIE_ERR
			END	
			COMMIT TRANSACTION

			IF @Id = 0  -- CONCAT SUR NOUVELLE LISTE DE RECHERCHE
			BEGIN


				IF @NewListe = ''''	SET @NewListe = CAST(@Index AS VARCHAR(10))
				ELSE			SET @NewListe = @NewListe+ '','' +CAST(@Index AS VARCHAR(10))
			END
			ELSE -- DESCENTE DANS L''ARBORESENCE SUR ID SEUL
			BEGIN
				IF @Index != @Id
				BEGIN
					--Passage au niveau inférieur de l''arbre à partir du fils
					EXEC @Erreur = p_Connect_By @Table, @Col_P, @Col_F, @Noeud, @Index, @Liste, @Terme, @TableT
					IF @Erreur != 0	GOTO SORTIE_ERR
				END
			END

		END
		IF @i = 0 
			BREAK
		ELSE
		BEGIN
			SET @i = PATINDEX(''%,%'', @IdListe)
		END
	END

	-- DESCENTE DANS L''ARBORESENCE SUR LISTE
	IF @Id = 0 AND @NewListe != ''''
	BEGIN
		IF @NewListe != @Liste
		BEGIN
			EXEC @Erreur = p_Connect_By @Table, @Col_P, @Col_F, @Noeud, @Id, @NewListe, @Terme, @TableT
			IF @Erreur != 0	GOTO SORTIE_ERR
		END
	END


END

--------------------------------------------------------------------------------
SORTIE:
	RETURN 0

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	IF CURSOR_STATUS( ''local'', ''Curseur'') >= 0
	BEGIN
		CLOSE Curseur
		DEALLOCATE Curseur
	END
	RETURN @Erreur
































' 
END
GO
/****** Objet :  Table [dbo].[CoupleTermeTerme]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CoupleTermeTerme]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CoupleTermeTerme](
	[id_CoupleTermeTerme] [T_COMPTEUR] NOT NULL,
	[id_T_Sub_F] [T_COMPTEUR] NOT NULL,
	[id_T_Sub_P] [T_COMPTEUR] NOT NULL,
	[subPostFixeIndex] [T_COMPTEUR] NULL,
	[texte] [T_MEMO] NULL,
 CONSTRAINT [PK_CoupleTermeTerme] PRIMARY KEY NONCLUSTERED 
(
	[id_CoupleTermeTerme]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[CoupleTermeTerme]') AND name = N'IX_id_T_Sub_F')
CREATE NONCLUSTERED INDEX [IX_id_T_Sub_F] ON [dbo].[CoupleTermeTerme] 
(
	[id_T_Sub_F]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[CoupleTermeTerme]') AND name = N'IX_id_T_Sub_P')
CREATE NONCLUSTERED INDEX [IX_id_T_Sub_P] ON [dbo].[CoupleTermeTerme] 
(
	[id_T_Sub_P]
)
GO
/****** Objet :  StoredProcedure [dbo].[p_ConnectByFils]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_ConnectByFils]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_ConnectByFils](
					@Id_Pere T_COMPTEUR=null
				      ) AS
-- Definittion des variables locales
DECLARE @Id_Find T_COMPTEUR
DECLARE @Erreur INTEGER

BEGIN
	SET NOCOUNT  ON

	-- Initialisation variable de sortie
	SET @Erreur = 0

	-- Positionnement sur les fils
	DECLARE curseur CURSOR LOCAL FOR
		SELECT DISTINCT  f.ID_T_SUB_F
             			FROM             COUPLETERMETERME f
	                          WHERE f.ID_T_SUB_P = @Id_Pere
	FOR READ ONLY
	--Gestion erreur
	IF @@ERROR != 0
		GOTO SORTIE_ERR


	-- Ouverture du curseur
	OPEN curseur
	
	--Gestion erreur
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	IF NOT EXISTS( SELECT 1 FROM  tempdb..sysobjects WHERE NAME = ''##TMP_EXPAND_FILS''  AND TYPE = ''U'')
		-- Création de la table temporaire
		CREATE TABLE ##TMP_EXPAND_FILS ( Id_F INTEGER )

	-- Extraction curseur
	FETCH curseur INTO @Id_Find
	print ''ConnectByFils ''  +  CAST(@Id_Find AS VARCHAR(10))

	-- Parcours des fils
	WHILE @@fetch_status = 0
	BEGIN
		BEGIN TRANSACTION

		-- on insére dans la table le fils trouvé
		INSERT INTO ##TMP_EXPAND_FILS VALUES (CAST(@Id_Find AS INTEGER) )

		-- Gestion erreur
		IF @@ERROR = 0
			COMMIT TRANSACTION
		ELSE
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END

		--Passage au niveau inférieur de l''arbre à partir du fils
		EXEC @Erreur = p_ConnectByFils @Id_Find
		IF @Erreur != 0
			GOTO SORTIE_ERR
		
		-- Extraction curseur
		FETCH curseur INTO @Id_Find
	END

	CLOSE curseur
	DEALLOCATE curseur

END

SORTIE:
	RETURN 0

SORTIE_ERR:

	IF @Erreur = 0
		SET @Erreur = @@ERROR

	IF CURSOR_STATUS(''local'', ''curseur'') >= 0
	BEGIN
		CLOSE Curseur
		DEALLOCATE Curseur
	END

	RETURN @Erreur



















' 
END
GO
/****** Objet :  Table [dbo].[GroupIndic]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GroupIndic]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupIndic](
	[id_GroupIndic] [T_COMPTEUR] NOT NULL,
	[libelle] [T_LIBELLE_100] NOT NULL,
	[type] [T_TEXTE_LONG] NULL,
 CONSTRAINT [PK_GroupIndic] PRIMARY KEY NONCLUSTERED 
(
	[id_GroupIndic]
)
)
END
GO
/****** Objet :  Table [dbo].[IndexSub_Rel]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[IndexSub_Rel]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[IndexSub_Rel](
	[id_T_Sub] [T_COMPTEUR] NOT NULL,
	[id_TypeIndex] [T_COMPTEUR] NOT NULL,
	[texte] [T_MEMO] NULL,
 CONSTRAINT [PK_IndexSub_Rel] PRIMARY KEY NONCLUSTERED 
(
	[id_T_Sub],
	[id_TypeIndex]
)
)
END
GO
/****** Objet :  Table [dbo].[IAMClasse_IAMCouple]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[IAMClasse_IAMCouple]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[IAMClasse_IAMCouple](
	[id_IAMClasse] [T_COMPTEUR] NOT NULL,
	[id_IAMCouple] [T_COMPTEUR] NOT NULL,
 CONSTRAINT [PK_IAMClasse_IAMCouple] PRIMARY KEY NONCLUSTERED 
(
	[id_IAMClasse],
	[id_IAMCouple]
)
)
END
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCip]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCip]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[p_GetCip]
(
	@Ide T_COMPTEUR = NULL,
	@Cip	T_LIBELLE7 = NULL,
	@Type VARCHAR(10),
	@TTCIPSPE	VARCHAR(30) OUTPUT
) AS

-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur		INTEGER
DECLARE @Id		T_COMPTEUR
DECLARE @Event		T_TEXTE_LONG
DECLARE @Date		VARCHAR(10)--T_DATE_SYST
DECLARE @Status		INTEGER

DECLARE @Req varchar(4000)
DECLARE @Time varchar(25)
DECLARE @varRequete	VARCHAR(4000)

--BODY
BEGIN
	SET NOCOUNT  ON
	SET @Erreur =0

	SET @Req =''''
             SET @Time = replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET @TTCIPSPE = ''Tmp_GetCipSpe'' +@Time

	-- DEFINITION CURSEUR
	IF @Type = ''CIP''
		DECLARE RefTEMP CURSOR LOCAL FOR
 			SELECT
				a.ID_SPEPRESENTATION, b.EVENEMENT,
				CONVERT(CHAR(10), b.DATEEVENEMENT , 103) AS ''DATEEVENEMENT''
			FROM SPEPRESENTATION a LEFT OUTER JOIN SPEEVTPRESENTATION b ON a.ID_SPEPRESENTATION = b.ID_SPEPRESENTATION
			WHERE a.CIP = CONVERT(VARCHAR(7),@Cip)
			AND (  b.EVENEMENT IS NULL OR UPPER( b.EVENEMENT) LIKE ''%REMB%'' )
		FOR READ ONLY
	ELSE
		DECLARE RefTEMP CURSOR LOCAL FOR
 			SELECT
				a.ID_SPEPRESENTATION, b.EVENEMENT,
				CONVERT(CHAR(10), b.DATEEVENEMENT , 103) AS ''DATEEVENEMENT''
			FROM SPEPRESENTATION a LEFT OUTER JOIN SPEEVTPRESENTATION b ON a.ID_SPEPRESENTATION = b.ID_SPEPRESENTATION
			WHERE a.ID_SPEPRESENTATION = @Ide
			AND (  b.EVENEMENT IS NULL OR UPPER( b.EVENEMENT) LIKE ''%REMB%'' )
		FOR READ ONLY

	-- CONTROLE DEFINTION
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- OUVERTURE CURSEUR
	OPEN RefTEMP
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Status =	CURSOR_STATUS(''local'', ''RefTEMP'')
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	IF @Status = 1
	BEGIN
		FETCH RefTEMP INTO  @Id, @Event, @Date
		IF @@ERROR != 0
			GOTO SORTIE_ERR
	END
	ELSE
		SET @Event = NULL
		IF @@ERROR != 0
			GOTO SORTIE_ERR

	IF @Status = 0 OR ( @Status = 1 AND @Event IS NULL )
	BEGIN
		IF @Type = ''CIP''
--			SET @Curseur = CURSOR FOR
			SET @varRequete = ''
				SELECT DISTINCT
					a.ID_SPEPRESENTATION, a.ID_SPECIALITE, a.CIP,
					a.UCD, a.AMMEUROPE,  a.LIEUDISPO,
					a.CONDDISPO, a.LISTE, a.DUREEPRESCRIPTION,
					a.PRESCRIPTIONINITIALE, a.PRESCRIPTIONRESERVEE,
					a.RENOUVELRESERVE, a.MEDPARTIC,
					CAST(a.NATURESURVEILLANCE AS VARCHAR(4000)) AS ''''NATURESURVEILLANCE'''',
					a.CODEREFERANTGENERIQUE, a.REMPLACE, a.SOURCEREMPLACE,
					CONVERT(CHAR(10), a.DATESOURCEREMPLACE, 103) AS ''''DATESOURCEREMPLACE'''',
					a.REMPLACEPAR, a.SOURCEREMPLACEPAR,
					CONVERT(CHAR(10), a.DATESOURCEREMPLACEPAR, 103) AS ''''DATESOURCEREMPLACEPAR'''',
					a.PRIXPRODHTF, a.PRIXPUBLICTTCF, a.PRIXPRODHTE, a.PRIXPUBLICTTCE, a.TVA,
					CONVERT(CHAR(10), a.DCREAT, 103) AS ''''DCREAT'''',
					CONVERT(CHAR(10), a.DMODIF, 103) AS ''''DMODIF'''',
					CONVERT(CHAR(10), a.DREVIS, 103) AS ''''DREVIS'''',
					a.CIPREFERANT, NULL AS ''''EVENEMENT'''', NULL AS '''' DATEEVENEMENT'''', 
					CASE a.condi
						WHEN NULL THEN b.DENOMSPE
						ELSE b.DENOMSPE + '''':'''' + a.condi
					END DenomCip, a.disponibilite, a.nbprise, a.priseunitaire
				INTO ##''+  @TTCIPSPE +''
				FROM Specialite b	INNER JOIN SpePresentation a ON b.id_Specialite = a.id_Specialite 

				WHERE a.Cip = ''''''+ CONVERT(VARCHAR(7), @Cip) +''''''''
		
--			FOR READ ONLY
                                        
		ELSE
--			SET @Curseur = CURSOR FOR WHERE a.Id_Spepresentation = + CONVERT(VARCHAR(10), @Ide)
			SET @varRequete = ''
				SELECT DISTINCT
						a.ID_SPEPRESENTATION, a.ID_SPECIALITE, a.CIP,
						a.UCD, a.AMMEUROPE, a.LIEUDISPO,
						a.CONDDISPO, a.LISTE, a.DUREEPRESCRIPTION,
						a.PRESCRIPTIONINITIALE, a.PRESCRIPTIONRESERVEE,
						a.RENOUVELRESERVE, a.MEDPARTIC,
						CAST(a.NATURESURVEILLANCE AS VARCHAR(4000)) AS ''''NATURESURVEILLANCE'''',
						a.CODEREFERANTGENERIQUE, a.REMPLACE, a.SOURCEREMPLACE,
						CONVERT(CHAR(10), a.DATESOURCEREMPLACE, 103) AS ''''DATESOURCEREMPLACE'''',
						a.REMPLACEPAR, a.SOURCEREMPLACEPAR,
						CONVERT(CHAR(10), a.DATESOURCEREMPLACEPAR, 103) AS ''''DATESOURCEREMPLACEPAR'''',
						a.PRIXPRODHTF, a.PRIXPUBLICTTCF, a.PRIXPRODHTE, a.PRIXPUBLICTTCE, a.TVA, CONVERT(CHAR(10), a.DCREAT, 103) AS ''''DCREAT'''',
						CONVERT(CHAR(10), a.DMODIF, 103) AS ''''DMODIF'''',
						CONVERT(CHAR(10), a.DREVIS, 103) AS ''''DREVIS'''',
						a.CIPREFERANT, NULL  AS ''''EVENEMENT'''', NULL  AS ''''DATEEVENEMENT'''', 						
							CASE a.condi
							WHEN NULL THEN b.DENOMSPE
							ELSE b.DENOMSPE + '''':'''' + a.condi
						END DenomCip, a.disponibilite, a.nbprise, a.priseunitaire
				INTO ##'' + @TTCIPSPE +''
				FROM Specialite b	INNER JOIN SpePresentation a ON b.id_Specialite = a.id_Specialite
                                                     WHERE a.Id_Spepresentation = ''+ CONVERT(VARCHAR(10), @Ide)
				
--			FOR READ ONLY	

		IF @@ERROR != 0
			GOTO SORTIE_ERR
	END

	IF NOT ( @EVENT IS NULL )
	BEGIN
		IF @Type = ''CIP''
--			SET @Curseur = CURSOR FOR
			SET @varRequete = ''
 				SELECT DISTINCT
						a.ID_SPEPRESENTATION, a.ID_SPECIALITE, a.CIP,
						a.UCD, a.AMMEUROPE,  a.LIEUDISPO,
						a.CONDDISPO, a.LISTE, a.DUREEPRESCRIPTION,
						a.PRESCRIPTIONINITIALE, a.PRESCRIPTIONRESERVEE,
						a.RENOUVELRESERVE, a.MEDPARTIC,
						CAST(a.NATURESURVEILLANCE AS VARCHAR(4000)) AS ''''NATURESURVEILLANCE'''',
						a.CODEREFERANTGENERIQUE, a.REMPLACE, a.SOURCEREMPLACE,
						CONVERT(CHAR(10), a.DATESOURCEREMPLACE, 103) AS ''''DATESOURCEREMPLACE'''',
						a.REMPLACEPAR, a.SOURCEREMPLACEPAR,
						CONVERT(CHAR(10), a.DATESOURCEREMPLACEPAR, 103) AS ''''DATESOURCEREMPLACEPAR'''',
						a.PRIXPRODHTF, a.PRIXPUBLICTTCF, a.PRIXPRODHTE, a.PRIXPUBLICTTCE, a.TVA,
						CONVERT(CHAR(10), a.DCREAT, 103) AS ''''DCREAT'''',
						CONVERT(CHAR(10), a.DMODIF, 103) AS ''''DMODIF'''',
						CONVERT(CHAR(10), a.DREVIS, 103) AS ''''DREVIS'''',
						a.CIPREFERANT, d.EVENEMENT,
						CONVERT(CHAR(10), d.DATEEVENEMENT, 103) AS ''''DATEEVENEMENT'''',
						CASE a.condi
							WHEN NULL THEN b.DENOMSPE
							ELSE b.DENOMSPE + '''':'''' + a.condi
						END DenomCip, a.disponibilite, a.nbprise, a.priseunitaire
				INTO ##'' + @TTCIPSPE +''
				FROM Specialite b	INNER JOIN SpePresentation a ON b.id_Specialite = a.id_Specialite
							INNER JOIN SPEEVTPRESENTATION d ON d.ID_SPEPRESENTATION      = a.ID_SPEPRESENTATION
							WHERE a.Cip = ''''''+ CONVERT(VARCHAR(7), @Cip) +''''''		
				AND UPPER(d.EVENEMENT) LIKE ''''%REMB%''''
				AND d.DATEEVENEMENT = (	SELECT MAX(g.DATEEVENEMENT)
							FROM SPEEVTPRESENTATION g
							WHERE  g.ID_SPEPRESENTATION = d.ID_SPEPRESENTATION 
							AND UPPER(g.evenement) LIKE ''''%REMB%'''')''
--			FOR READ ONLY
		ELSE
--			SET @Curseur = CURSOR FOR'' + CONVERT(VARCHAR(10),
			SET @varRequete = ''
 				SELECT DISTINCT
						a.ID_SPEPRESENTATION, a.ID_SPECIALITE, a.CIP,
						a.UCD, a.AMMEUROPE, a.LIEUDISPO,
						a.CONDDISPO, a.LISTE, a.DUREEPRESCRIPTION,
						a.PRESCRIPTIONINITIALE, a.PRESCRIPTIONRESERVEE,
						a.RENOUVELRESERVE, a.MEDPARTIC,
						CAST(a.NATURESURVEILLANCE AS VARCHAR(4000)) AS ''''NATURESURVEILLANCE'''',
						a.CODEREFERANTGENERIQUE, a.REMPLACE, a.SOURCEREMPLACE,
						CONVERT(CHAR(10), a.DATESOURCEREMPLACE, 103) AS ''''DATESOURCEREMPLACE'''',
						a.REMPLACEPAR, a.SOURCEREMPLACEPAR,
						CONVERT(CHAR(10), a.DATESOURCEREMPLACEPAR, 103) AS ''''DATESOURCEREMPLACEPAR'''',
						a.PRIXPRODHTF, a.PRIXPUBLICTTCF, a.PRIXPRODHTE, a.PRIXPUBLICTTCE, a.TVA,
						CONVERT(CHAR(10), a.DCREAT, 103) AS ''''DCREAT'''',
						CONVERT(CHAR(10), a.DMODIF, 103) AS ''''DMODIF'''',
						CONVERT(CHAR(10), a.DREVIS, 103) AS ''''DREVIS'''',
						a.CIPREFERANT, d.EVENEMENT,
						CONVERT(CHAR(10), d.DATEEVENEMENT, 103) AS ''''DATEEVENEMENT'''',
						CASE a.condi
							WHEN NULL THEN b.DENOMSPE
							ELSE b.DENOMSPE + '''':'''' + a.condi
						END DenomCip, a.disponibilite, a.nbprise, a.priseunitaire
				INTO ##''  + @TTCIPSPE +''
				FROM Specialite b	INNER JOIN SpePresentation a ON b.id_Specialite = a.id_Specialite
							INNER JOIN SPEEVTPRESENTATION d ON d.ID_SPEPRESENTATION = a.ID_SPEPRESENTATION						
				WHERE a.Id_Spepresentation = ''+ CONVERT(VARCHAR(10), @Ide) +'' 
				AND UPPER(d.EVENEMENT) LIKE ''''%REMB%''''
				AND d.DATEEVENEMENT = (	SELECT MAX(g.DATEEVENEMENT)
							FROM SPEEVTPRESENTATION g
							WHERE g.ID_SPEPRESENTATION = d.ID_SPEPRESENTATION 
							AND UPPER(g.evenement) LIKE ''''%REMB%'''')''
--			FOR READ ONLY

		IF @@ERROR != 0
			GOTO SORTIE_ERR
	END


-- JPA 03/09/02 : Modification du curseur retourner
	IF EXISTS(SELECT 1 FROM tempdb..SYSObjects WHERE name=''##''+ @TTCIPSPE AND type = ''U'')
		SET @Req = ''DROP TABLE ##''+ @TTCIPSPE
                           EXEC(@Req)


	EXEC (@varRequete)
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	/*SET @Curseur = CURSOR FOR
		SELECT * FROM ##Tmp_GetCip
	FOR READ ONLY*/
-- Fin modif JPA 03/09/02
	
	CLOSE RefTEMP
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	DEALLOCATE RefTEMP
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	/*OPEN @Curseur
	IF @@ERROR != 0
		GOTO SORTIE_ERR*/
END

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	IF CURSOR_STATUS(''local'', ''RefTEMP'') >= 0
	BEGIN
		CLOSE RefTEMP
		DEALLOCATE RefTEMP
	END

	RETURN @Erreur














' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_GetCipDoc]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetCipDoc]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- ---------------------------------------------------------------
  -- Fonction de sélection  : GetCipDoc
  -- Toutes les colonnes
  -- Retour par ref_Cursor
  -- --------------------------------------------------------------
CREATE PROCEDURE [dbo].[p_GetCipDoc]	(
						@Id		T_COMPTEUR=null,
						@Cip		T_LIBELLE7=null,
						@Type		VARCHAR(10),
						@TTCIPDOC	VARCHAR(30) OUTPUT
					) AS
-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur INTEGER

DECLARE @Req varchar(4000)
DECLARE @Time varchar(25)
--BODY
BEGIN
	SET NOCOUNT  ON

	SET @Req =''''
             SET @Time = replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET @TTCIPDOC = ''Tmp_GetCipDoc'' +@Time

	SET @Erreur =0

	IF EXISTS(SELECT 1 FROM tempdb..sysobjects  WHERE name=''##''+ @TTCIPDOC AND type = ''U'')
		SET @Req = ''DROP TABLE ##''+ @TTCIPDOC
                           EXEC(@Req)

	IF @Type = ''CIP''

				 SET @Req =  '' SELECT  a.ID_SPESUIVISGML, a.ID_SPEPRESENTATION, a.MONOGRAPHIE
					INTO ##''  + @TTCIPDOC +''
				               FROM    SPESUIVISGML a INNER JOIN SPEPRESENTATION b ON a.ID_SPEPRESENTATION = b.ID_SPEPRESENTATION
						  WHERE   b.Cip = '''''' + @Cip + ''''''''
				
	ELSE

				   SET @Req =  '' SELECT  ID_SPESUIVISGML, ID_SPEPRESENTATION, MONOGRAPHIE
					INTO ##''  + @TTCIPDOC +''
				               FROM    SPESUIVISGML
					 WHERE   ID_SPEPRESENTATION = '' + CONVERT(VARCHAR(10), @Id)
			
             EXEC(@Req) 


	IF @@ERROR != 0 GOTO SORTIE_ERR

END

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur










' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetNoIAMSpe_txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetNoIAMSpe_txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[GetNoIAMSpe_txt]
(
		@ID_Specialite             VARCHAR(100),
                           @Id                              T_COMPTEUR = NULL,
                           @typ                             VARCHAR(100),
		@Ret		           INTEGER OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur	  INTEGER
DECLARE @Req	  VARCHAR(1000)
DECLARE @TTNoIAM     VARCHAR(1000)

BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetNoIAMSpe_txt'')

--STATS


	SET NOCOUNT ON
	SET @Erreur = 0

	EXEC @Erreur = p_GetNoIAMSpe @Id_Specialite, @Id, @Typ, @TTNoIAM OUTPUT
	IF @Erreur != 0
		SET @Ret = @@ERROR
	ELSE
	BEGIN
		-- On garde le curseur ouvert pour avoir accès à la table temporaire créée dans p_GetCip
		SET @Req = ''SELECT * FROM ##'' + @TTNoIAM
		EXEC(@Req)

		-- TEST ERREUR
	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TTNoIAM+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTNoIAM
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TTNoIAM+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTNoIAM
                           EXEC(@Req)
                           GOTO SORTIE
                      END

	END
END

SORTIE:
	RETURN @Ret

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur





' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSPCIM10s_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSPCIM10s_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSPCIM10s_Id]( @idSP  T_COMPTEUR,
					 @Ret INTEGER  OUTPUT                                    
				) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER

-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSPCIM10s_Id'')

--STATS


	SET NOCOUNT  ON


	-- INITIALISATION VARIABLE D''ERREUR
	SET @Erreur = 0

	-- DEFINITION CHAINE SQL DE SORTIE
             SELECT DISTINCT a.id_dicorf_cim, a.LIBELLE
                            FROM  DICORF_CIM a  INNER JOIN GROUPINDIC_DICORF_CIM_REL b ON  b.ID_DICORF_CIM = a.ID_DICORF_CIM
					--INNER JOIN RECHINDICCIM_REL b
                                                                  -- ON  b.ID_CIMTERMRECHINDIC = a.ID_DICORF_CIM
                                                                  -- INNER JOIN TERMERECHGROUPINDIC_REL c
        	 			          --    ON c.ID_TERMERECHINDIC   = b.ID_TERMERECHINDIC
					 INNER JOIN  GROUPINDIC d 
                                                                    ON  d.ID_GROUPINDIC       = b.ID_GROUPINDIC
		   WHERE   d.id_groupindic   = @idSP

	-- CONTROLE DEFINITION
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

--- CHARGEMENT ERREUR DANS RET
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret









' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpe_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpe_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSpe_Id]
(
	@Id_Specialite	T_COMPTEUR = NULL,                                      
	@Ret		INTEGER OUTPUT
) AS
-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpe_Id'')

--STATS


	SET NOCOUNT  ON

	-- DEFINITION DU CURSEUR DE SORTIE
	SELECT
		Id_Specialite, Bvalid,
		Bencours, Nomuser, Denomspe,
		Forme, Dosage, complement,
		CAST(Commammposo AS VARCHAR(4000)) AS ''COMMAMMPOSO'',
		Reserve, Inferieurage,
		Unitinf, Superieurage, Unifsup,
		Inferieurpoids, Superieurpoids, Denomamm,
		Numdosamm, Specategorie, Source,
		CONVERT(CHAR(10), Datesource, 103) AS ''DATESOURCE'',
		CAST(Remarques AS VARCHAR(4000)) AS ''REMARQUES'',
		CONVERT(CHAR(10), Dcreat, 103) AS ''DCREAT'',
		CONVERT(CHAR(10), Dmodif, 103) AS ''DMODIF'',
		CONVERT(CHAR(10), Drevis, 103) AS ''DREVIS''
	FROM SPECIALITE
	WHERE (Id_Specialite = @Id_Specialite OR @Id_Specialite IS NULL)
	ORDER BY Id_Specialite

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeIAMClasses_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeIAMClasses_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSpeIAMClasses_Id]
(
	@ID_SPECIALITE	T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpeIAMClasses_Id'')

--STATS


	SET NOCOUNT  ON

	-- DEFINITION DU CURSEUR DE SORTIE
	SELECT
		b.ID_IAMCLASSE, b.CLASSE, b.REMARQUE,
		CONVERT(CHAR(10), b.DCREAT, 103) AS ''DCREAT'',
		CONVERT(CHAR(10), b.DMODIF, 103) AS ''DMODIF'',
		CONVERT(CHAR(10), b.DREVIS, 103) AS ''DREVIS''
	FROM     SPECIALITE_IAMCLASS a INNER JOIN  IAMCLASS b  ON b.ID_IAMCLASSE  = a.ID_IAMCLASSE
	WHERE    a.ID_SPECIALITE = @Id_Specialite
	ORDER BY 2
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeIndics_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeIndics_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSpeIndics_Id]
(
	@Id_Specialite  T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpeIndics_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	SELECT   B.Id_T_Indic, B.Libelle,
		CAST( B.Texte  AS VARCHAR(4000)) AS ''TEXTE'',
		CONVERT(char(10), B.Creation, 103) AS ''CREATION'',
		B.Validation,
		CAST (B.Remarques AS VARCHAR(4000)) AS ''REMARQUES''
	FROM T_INDIC B INNER JOIN SPEINDIC A  ON B.Id_T_INDIC = A.ID_T_INDIC
	WHERE (A.ID_SPECIALITE = @Id_Specialite OR  @Id_Specialite  IS NULL)  
	AND (B.VALIDATION <> ''R'' or B.VALIDATION is null)
	ORDER BY B.ID_T_INDIC

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret







' 
END
GO
/****** Objet :  Table [dbo].[TermeRechPhonetique]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[TermeRechPhonetique]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TermeRechPhonetique](
	[id_TermeRechPhonetique] [T_COMPTEUR] IDENTITY(1,1) NOT NULL,
	[Terme_Libelle] [T_libelle200] NOT NULL,
	[Terme_Soundex] [varchar](35)  NOT NULL,
	[Type_Terme] [T_libelle10] NOT NULL,
	[id_Terme] [T_libelle10] NOT NULL,
	[CodeDispo] [int] NULL,
	[Terme_LibSsAccent] [T_libelle200] NOT NULL,
 CONSTRAINT [PK_TermeRechPhonetique] PRIMARY KEY CLUSTERED 
(
	[id_TermeRechPhonetique]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[TermeRechPhonetique]') AND name = N'IX_CodeDispo')
CREATE NONCLUSTERED INDEX [IX_CodeDispo] ON [dbo].[TermeRechPhonetique] 
(
	[CodeDispo]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[TermeRechPhonetique]') AND name = N'IX_Terme_Libelle')
CREATE NONCLUSTERED INDEX [IX_Terme_Libelle] ON [dbo].[TermeRechPhonetique] 
(
	[Terme_Libelle]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[TermeRechPhonetique]') AND name = N'IX_Terme_LibSsAccent')
CREATE NONCLUSTERED INDEX [IX_Terme_LibSsAccent] ON [dbo].[TermeRechPhonetique] 
(
	[Terme_LibSsAccent]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[TermeRechPhonetique]') AND name = N'IX_Terme_Soundex')
CREATE NONCLUSTERED INDEX [IX_Terme_Soundex] ON [dbo].[TermeRechPhonetique] 
(
	[Terme_Soundex]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[TermeRechPhonetique]') AND name = N'IX_Type_Terme')
CREATE NONCLUSTERED INDEX [IX_Type_Terme] ON [dbo].[TermeRechPhonetique] 
(
	[Type_Terme]
)
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeCips_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeCips_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[GetSpeCips_Id]
(
	@id_specialite	T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpeCips_Id'')

--STATS


	SET NOCOUNT  ON

	SELECT
		a.Id_Spepresentation, a.Id_Specialite,
		a.Cip, a.Ucd, a.Ammeurope,
		a.Lieudispo, a.Conddispo,
		a.Liste, a.Dureeprescription, a.Prescriptioninitiale,
		a.Prescriptionreservee, a.Renouvelreserve, a.Medpartic,
		CAST(a.Naturesurveillance AS VARCHAR(4000)) AS ''NATURESURVEILLANCE'',
		a.Codereferantgenerique, a.Remplace, a.Sourceremplace,
		CONVERT(CHAR(10), a.Datesourceremplace, 103) AS ''DATESOURCEREMPLACE'',
		a.Remplacepar, a.Sourceremplacepar,
		CONVERT(CHAR(10), a.Datesourceremplacepar, 103) AS ''DATESOURCEREMPLACEPAR'',
		a.Prixprodhtf, a.Prixpublicttcf, a.Prixprodhte, a.Prixpublicttce, a.Tva,
		CONVERT(CHAR(10), a.Dcreat, 103) AS ''DCREAT'',
		CONVERT(CHAR(10), a.Dmodif, 103) AS ''DMODIF'',
		CONVERT(CHAR(10), a.Drevis, 103) AS ''DREVIS'',
		a.Cipreferant,
		b.DENOMSPE + (	CASE a.condi						
					WHEN NULL THEN ''''
					ELSE '' : '' + a.condi
				END ) DenomCip,
                        a.disponibilite, a.nbprise, a.priseunitaire, a.CodeDispo

	FROM SPECIALITE b	INNER JOIN   SPEPRESENTATION a ON a.ID_SPECIALITE = b.ID_SPECIALITE               
	--			LEFT JOIN SPECONDITIONNEMENTPRIMAIRE c ON c.ID_SPEPRESENTATION   = a.ID_SPEPRESENTATION
	WHERE a.Id_Specialite = @Id_Specialite
	-- AND ( UPPER(c.TYPECONDPRIMAIRE) = ''DENOMCIP'' OR ( UPPER(c.TYPECONDPRIMAIRE) IS NULL) )
	ORDER BY 
        --YB AJOUT ON MET NOUV et commercialises EN DEBUT DE LISTE
       ( CASE 
        WHEN CodeDispo IN (0,3) THEN 0
        ELSE 1
	END
        ),
	a.Ucd, Denomcip
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeCipsInLivret_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeCipsInLivret_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[GetSpeCipsInLivret_Id]	(
							@Id_Specialite   T_COMPTEUR=null,
							@Id_Hop 	INTEGER,
							@Ret 		INTEGER OUTPUT
						) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER

-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpeCipsInLivret_Id'')

--STATS


	SET NOCOUNT  ON

	-- INITIALISATION VARIABLE D''ERREUR
	SET @Erreur = 0

	-- DEFINITION DU CURSEUR DE SORTIE
		SELECT   DISTINCT b.Id_Spepresentation, b.Id_Specialite,
		                 b.Cip, b.Ucd, b.Ammeurope,
                        		     b.Lieudispo, b.Conddispo,
                        		    b.Liste, b.Dureeprescription, b.Prescriptioninitiale,
                        		    b.Prescriptionreservee, b.Renouvelreserve, b.Medpartic,
                        		    CAST(b.Naturesurveillance AS VARCHAR(3000)) Naturesurveillance, b.Codereferantgenerique, b.Remplace,
                        		    b.Sourceremplace, b.Datesourceremplace, b.Remplacepar,
                                            b.Sourceremplacepar, b.Datesourceremplacepar, b.Prixprodhtf,
                                            c.PRIX_TTC_F Prixpublicttcf, b.Prixprodhte, c.PRIX_TTC_E Prixpublicttce,
                                            b.Tva, b.Dcreat, b.Dmodif, b.Drevis, b.Cipreferant,
			    CASE WHEN b.condi  IS NULL THEN a.DENOMSPE ELSE a.DENOMSPE + '':'' + b.condi END DenomCip, c.IdOrganisme,
			    b.disponibilite, b.nbPrise, b.PriseUnitaire
		                FROM     SPEPRESENTATION b INNER JOIN SPECIALITE a ON b.Id_Specialite = a.Id_Specialite
				INNER JOIN LIVRETVIDAL c ON b.Id_SpePresentation = c.Id_SpePresentation
	--			LEFT OUTER JOIN SPECONDITIONNEMENTPRIMAIRE d ON b.Id_SpePresentation = d.Id_SpePresentation
			WHERE 	a.ID_SPECIALITE = @Id_Specialite
				AND	c.IdOrganisme = @Id_Hop
	--			AND	( d.TYPECONDPRIMAIRE IS NULL OR UPPER(d.TYPECONDPRIMAIRE) = ''DENOMCIP'' )

-- CONTROLE DEFINITION
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

--- CHARGEMENT ERREUR DANS RET
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret









' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeDoc_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeDoc_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[GetSpeDoc_Id]
(	@id_specialite	T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpeDoc_Id'')

--STATS


	SET NOCOUNT  ON

	-- DEFINITION DE LA REQUETE
              SELECT  ID_SPESUIVISGML, c.ID_SPEPRESENTATION, MONOGRAPHIE
               FROM    specialite a, spesuivisgml c, spepresentation b
               WHERE   a.ID_SPECIALITE = @Id_Specialite
               and     a.id_specialite = b.id_specialite
               and     b.ID_SPEPRESENTATION = c.ID_SPEPRESENTATION
                        
	-- CONTROLE DEFINTION
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeEphmras_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeEphmras_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSpeEphmras_Id]
(
	@Id_Specialite	T_COMPTEUR=NULL,
	@Ret		INTEGER OUTPUT
) AS
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpeEphmras_Id'')

--STATS


	SET NOCOUNT  ON

	SELECT B.ID_DICOT_EPHMRA ID_DICOT_EPHMRA, b.DIC_ID_DICOT_EPHMRA DIC_ID_DICOT_EPHMRA, c.LIBELLE LIBELLE, B.ORDRE
	FROM   DICOT_EPHMRA_ETENDUE C	INNER JOIN  DICOT_EPHMRA B ON  B.ID_DICOT_EPHMRA = C.ID_DICOT_EPHMRA
					INNER JOIN  SPEPHARMACODYNAMIE A ON A.CODEEPHMRA = B.LIBELLE
	WHERE  A.ID_SPECIALITE = @Id_Specialite

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeEvts_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeEvts_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSpeEvts_Id]
(
	@Id_Specialite	T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpeEvts_Id'')

--STATS


	SET NOCOUNT  ON

	SELECT
		Id_Speevt, Id_Specialite,
		Evenement, Source,
		CONVERT(CHAR(10), Datesource, 103) AS ''DATESOURCE'',
		CONVERT(CHAR(10), Dateevenement, 103) AS ''DATEEVENEMENT'',
		Traiteeven
	FROM SPEEVT
	WHERE (Id_Specialite = @Id_Specialite OR @Id_Specialite IS NULL)
	ORDER BY Id_Speevt

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeSPs_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeSPs_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSpeSPs_Id]
(
	@Id_Specialite	T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpeSPs_Id'')

--STATS


	SET NOCOUNT  ON

	SELECT
		C.Id_Groupindic, C.Libelle, C.Type                     
	FROM GROUPINDIC C	INNER JOIN GROUPINDICINDIC_REL B ON C.ID_GROUPINDIC = B.ID_GROUPINDIC  
				INNER JOIN SPEINDIC A ON B.ID_T_INDIC = A.ID_T_INDIC
	WHERE (A.ID_SPECIALITE =@Id_Specialite OR @Id_Specialite IS NULL)

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeSubsts_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeSubsts_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSpeSubsts_Id]
(
	@Id_Specialite	T_COMPTEUR=null,
	@Ret	INTEGER OUTPUT
) AS
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpeSubsts_Id'')

--STATS


	-- Optimisation
	SET NOCOUNT ON

	/*SELECT DISTINCT
		sub.id_t_sub, sub.libelle, sub.homeopathie,
		CAST(sub.texte AS VARCHAR(4000)) AS ''TEXTE'',
		sub.dc, sub.complementindexsub
	FROM T_SUB sub
	WHERE sub.id_t_sub IN (SELECT sconst.id_t_sub
				FROM SPECOMPO scompo	INNER JOIN SPECONSTITUANT sconst	ON sconst.id_specompo = scompo.id_specompo
								INNER JOIN SPECIALITE spe		ON spe.id_specialite = scompo.id_specialite
				WHERE spe.id_specialite = @Id_Specialite	
				)
	ORDER BY sub.id_t_sub*/

	 SELECT DISTINCT b.ID_T_SUB,   a.LIBELLE,
                               a.HOMEOPATHIE,
		    CAST(a.texte AS VARCHAR(4000)) AS ''TEXTE'',
                               a.DC,
                               a.COMPLEMENTINDEXSUB,
		    BCONSTACTIF,
		    NATUREEXCIP,  b.QUANTITE,  b.UNITE, b.Tetiere TETIERE
	FROM  T_SUB a, SPECONSTITUANT b, SPECOMPO c, SPECIALITE d
	 WHERE  b.ID_SPECOMPO   = c.ID_SPECOMPO
			 AND  c.ID_SPECIALITE = d.ID_SPECIALITE
			 and  a.ID_T_SUB = b.ID_T_SUB
			 AND  d.ID_SPECIALITE = @Id_Specialite
             ORDER BY        BCONSTACTIF desc;


	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret









' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeTheras_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeTheras_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSpeTheras_Id]
(
	@Id_Specialite	T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpeTheras_Id'')

--STATS


	SET NOCOUNT  ON

	SELECT
		B.ID_DICOCOMCLASSIRIS ID_DICOCOMCLASSIRIS, B.LIBELLE LIBELLE,
		C.ID_DICOCOMCLASSIRIS DIC_ID_DICOCOMCLASSIRIS, C.LIBELLE DIC_LIBELLE, B.ORDRE
	FROM DICOCOMCLASSIRIS C	INNER JOIN DICOCOMCLASSIRIS B ON C.ID_DICOCOMCLASSIRIS = B.DIC_ID_DICOCOMCLASSIRIS
				INNER JOIN SPECLASSIRIS A ON B.ID_DICOCOMCLASSIRIS = A.ID_DICOCOMCLASSIRIS
	WHERE (A.ID_SPECIALITE =@Id_Specialite OR @Id_Specialite IS NULL)

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeVoies_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeVoies_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSpeVoies_Id]
(
	@Id_Specialite	T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpeVoies_Id'')

--STATS


	SET NOCOUNT  ON

	SELECT   Id_Specialite, Voie, Ordre                     
	FROM     SPEVOIE
	WHERE    (Id_Specialite = @Id_Specialite OR @Id_Specialite IS NULL)
	ORDER BY Voie
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSubst_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubst_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSubst_Id]
(
	@IdSubst	T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSubst_Id'')

--STATS


	SET NOCOUNT  ON

	SELECT DISTINCT
		a.ID_T_SUB,
		a.LIBELLE,
		a.HOMEOPATHIE,
		CAST(a.TEXTE AS VARCHAR(4000)) AS ''TEXTE'',
		a.DC,
		a.COMPLEMENTINDEXSUB,
		CASE b.ID_T_SUB_F
			WHEN NULL THEN 0
			ELSE 1
		END AS ''HasChild''
	FROM COUPLETERMETERME b RIGHT OUTER JOIN T_SUB a ON b.ID_T_SUB_P = a.ID_T_SUB
	WHERE a.ID_T_SUB = @IdSubst
	ORDER BY a.ID_T_SUB
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstAncester_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstAncester_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSubstAncester_Id]
(
	@IdSubst	T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
-- DEFINITION DES VARIABLES LOCALES
DECLARE @Erreur INTEGER

-- BODY PROCEDURE
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSubstAncester_Id'')

--STATS


	SET NOCOUNT  ON

	SELECT DISTINCT
		a.ID_T_SUB,
		a.LIBELLE,
		a.HOMEOPATHIE,
		CAST(a.TEXTE as varchar(4000)) AS ''TEXTE'',
		a.DC,
		a.COMPLEMENTINDEXSUB,
		1 AS ''HasChild''
	FROM	(
			SELECT  id_t_sub
			FROM T_SUB b
			WHERE NOT EXISTS(SELECT id_t_sub_f 
					FROM COUPLETERMETERME d 
					WHERE b.id_t_sub = d.id_t_sub_f
					)
		) b	INNER JOIN T_SUB a ON a.id_t_sub = b.id_t_sub
			LEFT OUTER JOIN COUPLETERMETERME c ON a.id_t_sub = c.id_t_sub_p
	WHERE a.id_t_sub = @IdSubst
	ORDER BY a.ID_T_SUB
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstChild_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSubstChild_Id]
(
	@IdSubst	T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSubstChild_Id'')

--STATS



	SET NOCOUNT  ON

	SELECT DISTINCT
		a.ID_T_SUB,
		a.LIBELLE,
		a.HOMEOPATHIE,
		CAST(a.TEXTE AS VARCHAR(4000)) TEXTE,
		a.DC,
		a.COMPLEMENTINDEXSUB,
		1 AS ''HasChild''
	FROM T_SUB a INNER JOIN coupletermeterme b ON a.id_t_sub   = b.ID_T_SUB_F
	WHERE b.ID_T_SUB_P = @IdSubst
	ORDER BY a.ID_T_SUB
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret









' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstFull_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstFull_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE  [dbo].[GetSubstFull_Id]
(
	@IdSubst T_COMPTEUR=null,
	@Ret	INTEGER OUTPUT
) AS
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSubstFull_Id'')

--STATS


	SET NOCOUNT  ON

	SELECT DISTINCT
		a.ID_T_SUB,
		a.LIBELLE,
		a.HOMEOPATHIE,
		CAST(a.TEXTE as VARCHAR(4000)) AS ''TEXTE'',
		a.DC,
		a.COMPLEMENTINDEXSUB,
		CASE b.ID_T_SUB_F
			WHEN NULL THEN 0
			ELSE 1
		END HasChild,
		d.BVALID,
		d.BENCOURS,
		d.NOMUSER,
		d.CAS,
		d.CASREPLACED,
		d.NATURE,
		CAST(d.CHIMIE AS VARCHAR(4000)) AS ''CHIMIE'',
		d.LISTE,
		d.COMMLISTE,
		d.ORIGINEEXCIPIENT,
		CONVERT(CHAR(10), d.DCREAT, 103) AS ''DCREAT'',
		CONVERT(CHAR(10), d.DMODIF, 103) AS ''DMODIF'',
		CONVERT(CHAR(10), d.DREVIS, 103) AS ''DREVIS'',
		'''' OMS,
		d.CLASSDOPANT
	FROM	COUPLETERMETERME b	RIGHT OUTER JOIN T_SUB a ON a.ID_T_SUB = b.ID_T_SUB_P
		INNER JOIN SUBSTANCE d  ON  d.DENOMSUB = a.LIBELLE
	--	SUBSTANCE_ETENDUE c	INNER JOIN substance d ON d.ID_SUBSTANCE = c.ID_SUBSTANCE
	WHERE a.ID_T_SUB = @IdSubst
	--AND d.DENOMSUB = a.LIBELLE
	AND d.HOMEO = a.HOMEOPATHIE
	ORDER BY a.ID_T_SUB
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstParent_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSubstParent_Id]
(
	@IdSubst	T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER

-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSubstParent_Id'')

--STATS


	SET NOCOUNT  ON

	SELECT DISTINCT
		a.ID_T_SUB,
		a.LIBELLE,
		a.HOMEOPATHIE,
		CAST(a.TEXTE AS VARCHAR(4000)) AS ''TEXTE'',
		a.DC,
		a.COMPLEMENTINDEXSUB,
		1 AS ''HasChild''
	FROM T_SUB a INNER JOIN COUPLETERMETERME b ON a.id_t_sub = b.ID_T_SUB_P
	WHERE b.ID_T_SUB_F = @IdSubst
	ORDER BY a.ID_T_SUB
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret





' 
END
GO
/****** Objet :  Table [dbo].[CoupleTermeSynonyme]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CoupleTermeSynonyme]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CoupleTermeSynonyme](
	[id_CoupleTermeSynonyme] [T_COMPTEUR] NOT NULL,
	[id_T_Sub] [T_COMPTEUR] NOT NULL,
	[id_T_SynonySub] [T_COMPTEUR] NOT NULL,
	[texte] [T_MEMO] NULL,
	[creation] [T_DATE_SYST] NULL,
 CONSTRAINT [PK_CoupleTermeSynonyme] PRIMARY KEY NONCLUSTERED 
(
	[id_CoupleTermeSynonyme]
)
)
END
GO
/****** Objet :  Table [dbo].[CimCI]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CimCI]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CimCI](
	[id_CimCI] [T_COMPTEUR] NOT NULL,
	[codeCim] [T_TEXTE_LONG] NOT NULL,
 CONSTRAINT [PK_CimCI] PRIMARY KEY NONCLUSTERED 
(
	[id_CimCI]
)
)
END
GO
/****** Objet :  StoredProcedure [dbo].[GetTheraChild_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetTheraChild_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetTheraChild_Id]
(
	@ID_DICOCOMCLASSIRIS	T_COMPTEUR=NULL,
	@Ret			INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetTheraChild_Id'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON


	IF @ID_DICOCOMCLASSIRIS  IS NULL
	BEGIN

		SELECT
			t1.id_dicocomclassiris,
			t1.dic_id_dicocomclassiris,
			LTRIM(
				CASE SUBSTRING(UPPER(t1.libelle), 1, 3)
					WHEN ''ZZ_'' THEN	CASE PATINDEX(''%\%'', SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255))
									WHEN 0 THEN SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255)
									ELSE SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, PATINDEX(''%\%'', SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255)) - PATINDEX(''%\%'', t1.libelle) - 2)
							END
					ELSE t1.libelle
				END) AS ''LIBELLE'',
			t1.ordre,
			CASE t2.id_dicocomclassiris
				WHEN NULL THEN 0
				ELSE 1
			END AS ''HasChild''

		FROM DICOCOMCLASSIRIS t1
			LEFT OUTER JOIN DICOCOMCLASSIRIS t2
			ON t1.id_dicocomclassiris = t2.dic_id_dicocomclassiris
		WHERE t1.dic_id_dicocomclassiris IS NULL
		GROUP BY
			t1.id_dicocomclassiris,
			t1.dic_id_dicocomclassiris,
			t1.libelle,
			t1.ordre,
			CASE t2.id_dicocomclassiris
				WHEN NULL THEN 0
				ELSE 1
			END


		IF @@ERROR != 0
			GOTO SORTIE_ERR
	

             END
	ELSE
	BEGIN


		SELECT
			t1.id_dicocomclassiris,
			t1.dic_id_dicocomclassiris,
			LTRIM(
				CASE SUBSTRING(UPPER(t1.libelle), 1, 3)
					WHEN ''ZZ_'' THEN	CASE PATINDEX(''%\%'', SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255))
									WHEN 0 THEN SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255)
									ELSE SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, PATINDEX(''%\%'', SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255)) - PATINDEX(''%\%'', t1.libelle) - 2)
							END
					ELSE t1.libelle
				END) AS ''LIBELLE'',
			t1.ordre,
			CASE t2.id_dicocomclassiris
				WHEN NULL THEN 0
				ELSE 1
			END AS ''HasChild''

		FROM DICOCOMCLASSIRIS t1
			LEFT OUTER JOIN DICOCOMCLASSIRIS t2
			ON t1.id_dicocomclassiris = t2.dic_id_dicocomclassiris
		WHERE t1.dic_id_dicocomclassiris = @ID_DICOCOMCLASSIRIS	
		GROUP BY
			t1.id_dicocomclassiris,
			t1.dic_id_dicocomclassiris,
			t1.libelle,
			t1.ordre,
			CASE t2.id_dicocomclassiris
				WHEN NULL THEN 0
				ELSE 1
			END


		IF @@ERROR != 0
		GOTO SORTIE_ERR
	

	END
	-- PAS D''ERREUR
	set @Ret = 0
		GOTO SORTIE
END

-- Gestion des erreurs
SORTIE_ERR:
	-- Sauvegarde de l''erreur
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	set @Ret = @Erreur

-- Cas de sortie sans erreur
SORTIE:
	RETURN @Ret















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetTheraParent_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetTheraParent_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetTheraParent_Id]
(
	@ID_DICOCOMCLASSIRIS	T_COMPTEUR=NULL,
	@Ret				INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetTheraParent_Id'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	SELECT
		t1.id_dicocomclassiris,
		t1.dic_id_dicocomclassiris,
		LTRIM(
			CASE SUBSTRING(UPPER(t1.libelle), 1, 3)
				WHEN ''ZZ_'' THEN	CASE PATINDEX(''%\%'', SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255))
								WHEN 0 THEN SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255)
								ELSE SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, PATINDEX(''%\%'', SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255)) - PATINDEX(''%\%'', t1.libelle) - 2)
						END
				ELSE t1.libelle
			END) AS ''LIBELLE'',
		t1.ordre,
		CASE t2.id_dicocomclassiris
			WHEN NULL THEN 0
			ELSE 1
		END AS ''HasChild''

	FROM DICOCOMCLASSIRIS t1
		LEFT OUTER JOIN DICOCOMCLASSIRIS t2
		ON t1.id_dicocomclassiris = t2.dic_id_dicocomclassiris
	WHERE t1.id_dicocomclassiris =	(
						SELECT t3.dic_id_dicocomclassiris FROM DICOCOMCLASSIRIS t3
						WHERE t3.id_dicocomclassiris = @ID_DICOCOMCLASSIRIS
					)
	GROUP BY
		t1.id_dicocomclassiris,
		t1.dic_id_dicocomclassiris,
		t1.libelle,
		t1.ordre,
		CASE t2.id_dicocomclassiris
			WHEN NULL THEN 0
			ELSE 1
		END


	IF @@ERROR != 0
                 GOTO SORTIE_ERR


	-- PAS D''ERREUR
	set @Ret = 0
		GOTO SORTIE
END

-- Gestion des erreurs
SORTIE_ERR:
	-- Sauvegarde de l''erreur
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	set @Ret = @Erreur

-- Cas de sortie sans erreur
SORTIE:
	RETURN @Ret










' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetThera_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetThera_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetThera_Id]
(
	@ID_DICOCOMCLASSIRIS	T_COMPTEUR=NULL,
	@Ret				INTEGER OUTPUT
) AS
-- Déclarations
DECLARE @Erreur		INTEGER

-- Body
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetThera_Id'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON


	SELECT
		t1.id_dicocomclassiris,
		t1.dic_id_dicocomclassiris,
		LTRIM(
			CASE SUBSTRING(UPPER(t1.libelle), 1, 3)
				WHEN ''ZZ_'' THEN	CASE PATINDEX(''%\%'', SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255))
								WHEN 0 THEN SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255)
								ELSE SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, PATINDEX(''%\%'', SUBSTRING(t1.libelle, PATINDEX(''%\%'', t1.libelle) + 1, 255)) - PATINDEX(''%\%'', t1.libelle) - 2)
						END
				ELSE t1.libelle
			END) AS ''LIBELLE'',
		t1.ordre,
		CASE t2.id_dicocomclassiris
			WHEN NULL THEN 0
			ELSE 1
		END AS ''HasChild''

	FROM DICOCOMCLASSIRIS t1
		LEFT OUTER JOIN DICOCOMCLASSIRIS t2
		ON t1.id_dicocomclassiris = t2.dic_id_dicocomclassiris
	WHERE t1.id_dicocomclassiris = @ID_DICOCOMCLASSIRIS
	GROUP BY
		t1.id_dicocomclassiris,
		t1.dic_id_dicocomclassiris,
		t1.libelle,
		t1.ordre,
		CASE t2.id_dicocomclassiris
			WHEN NULL THEN 0
			ELSE 1
		END

	

	-- PAS D''ERREUR
	set @Ret = 0
		GOTO SORTIE
END

-- Gestion des erreurs
SORTIE_ERR:
	-- Sauvegarde de l''erreur
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	set @Ret = @Erreur

-- Cas de sortie sans erreur
SORTIE:
	RETURN @Ret











' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstSpes_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstSpes_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSubstSpes_Id]
(
	@idSubst	T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur     INTEGER
DECLARE @Req       varchar(8000)
DECLARE @SQL       varchar(8000)
DECLARE @Time      varchar(25)
DECLARE @TableT   VARCHAR(30) 
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSubstSpes_Id'')

--STATS


	SET NOCOUNT  ON
	SET @Erreur = 0
	SET @Time = replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET @TableT = ''TMP_CONNECTBY'' +@Time

	SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableT+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TableT
	EXEC(@Req)
	SET @Req = ''CREATE TABLE ##''+@TableT+ '' ( ID_COL INTEGER )''
	EXEC(@Req)

	EXEC @Erreur = p_Connect_By  ''COUPLETERMETERME'', ''id_t_sub_p'', ''id_t_sub_f'', ''P'', @IdSubst , NULL, null, @TableT

	SET @SQL = ''SELECT DISTINCT
		d.ID_SPECIALITE, d.BVALID, d.BENCOURS, d.NOMUSER,
		d.DENOMSPE, d.FORME, d.DOSAGE, d.COMPLEMENT,
		CAST(d.COMMAMMPOSO AS VARCHAR(4000)) AS ''''COMMAMMPOSO'''',
		d.RESERVE, d.INFERIEURAGE, d.UNITINF, d.SUPERIEURAGE,
		d.UNIFSUP, d.INFERIEURPOIDS, d.SUPERIEURPOIDS,
		d.DENOMAMM, d.NUMDOSAMM, d.SPECATEGORIE, d.SOURCE,
		CONVERT(CHAR(10), d.DATESOURCE, 103)  AS ''''DATESOURCE'''',
		CAST(d.REMARQUES AS VARCHAR(4000)) AS ''''REMARQUES'''',
		CONVERT(CHAR(10), d.DCREAT, 103) AS ''''DCREAT'''',
		CONVERT(CHAR(10), d.DMODIF, 103) AS ''''DMODIF'''',
		CONVERT(CHAR(10), d.DREVIS, 103) AS ''''DREVIS''''

	FROM SPECOMPO c	INNER JOIN SPECONSTITUANT b ON b.ID_SPECOMPO = c.ID_SPECOMPO
				INNER JOIN SPECIALITE d ON d.ID_SPECIALITE = c.ID_SPECIALITE
	WHERE b.DENOMSUB IN	(
					SELECT LIBELLE
					FROM T_SUB
					WHERE ID_T_SUB IN (SELECT DISTINCT * FROM ##'' +@TableT+'' )
					UNION
					SELECT LIBELLE
					FROM T_SUB
					WHERE ID_T_SUB = '' + CONVERT(VARCHAR(10), @IdSubst)+ '' )''
	EXEC(@SQL)
				
	IF @@ERROR != 0
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableT+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TableT
		EXEC(@Req)
		GOTO SORTIE_ERR
		END
	ELSE
		BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableT+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TableT
		EXEC(@Req)
		SET @Ret = 0
		GOTO SORTIE
		END
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret







' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSpeLabo_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSpeLabo_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSpeLabo_Id]
(
	@Id_Specialite	T_COMPTEUR = NULL,
	@Ret		INTEGER OUTPUT
) AS
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSpeLabo_Id'')

--STATS


	SET NOCOUNT  ON

	SELECT
		a.ID_LABORATOIRE, a.LAB_ID_LABORATOIRE, a.LABORATOIRE,
		a.ADR1, a.ADR2, a.ADR3, a.CP, a.VILLE, a.CEDEX, a.PAYS, a.TELEPHONE,
		a.TELECOPIE, a.EMAIL, a.INTERNET, a.COMMENTAIRE, a.MORT,
		CONVERT(CHAR(10), a.DCREAT, 103) AS ''DCREAT'', 
		CONVERT(CHAR(10), a.DMODIF,103)  AS ''DMODIF'', -- ajout alias 19/02/03
		CONVERT(char(10),  a.DREVIS,103) AS ''DREVIS'' , a.Vignette
-- ajout alias 19/02/03
	FROM   LABORATOIRE a  INNER JOIN SPELABS_REL b ON  b.Id_Laboratoire = a.Id_Laboratoire
	WHERE   b.Id_Specialite  = @Id_Specialite

	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Ret = 0
	GOTO SORTIE
END

SORTIE_ERR:
	SET @Ret = @@ERROR

SORTIE:
	RETURN @Ret








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstsParentMV_Id]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstsParentMV_Id]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSubstsParentMV_Id]
(
	@IdSubst	T_COMPTEUR,
	@Ret		INTEGER OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Curseur	CURSOR

DECLARE @Id		T_COMPTEUR
DECLARE @TxtId		VARCHAR(1000)
DECLARE @Stop		BIT

DECLARE @Find_P		T_COMPTEUR

DECLARE @Find_F		T_COMPTEUR

DECLARE @Erreur		INTEGER
DECLARE @TableTF  varchar(25)
DECLARE @Req  varchar(525)
DECLARE @SQL  varchar(525)
DECLARE @TableTP   varchar(25)

-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSubstsParentMV_Id'')

--STATS


	SET NOCOUNT  ON

	-- Inits
	SET @Erreur = 0
	SET @Stop = 0
	SET @Find_P = 2
	SET @Find_F = 2


	SET @TxtId = CAST(@IdSubst AS VARCHAR(1000))
	IF @@ERROR !=0
		GOTO SORTIE_ERR


	WHILE @Stop = 0
	BEGIN
		EXEC @Erreur = p_GetSubstsPere @TxtId, @TableTP  OUTPUT, @TableTF OUTPUT
		IF @Erreur != 0
			GOTO SORTIE_ERR

		-- TRAITEMENT DU FILS

                          SET @SQL = '' DECLARE CursF CURSOR FOR SELECT * FROM ##''+@TableTF
		EXEC(@SQL)
	                 IF @@ERROR != 0
		GOTO SORTIE_ERR
		
		OPEN CursF
                          IF CURSOR_STATUS( ''variable'','' CursF'' ) = 0
			SET @Find_F = 0
		ELSE
		BEGIN
			SET @Find_F = 1
			SET @Stop = 1
		END
		IF @@ERROR !=0
			GOTO SORTIE_ERR

		CLOSE CursF
		IF @@ERROR !=0
			GOTO SORTIE_ERR

		DEALLOCATE CursF
		IF @@ERROR !=0
			GOTO SORTIE_ERR

		-- TRAITEMENT PERE
		IF @Find_F = 0 -- PAS DE FILS
		BEGIN

                          SET @SQL = '' DECLARE CursP CURSOR FOR SELECT * FROM ##''+@TableTP
		EXEC(@SQL)
	                 IF @@ERROR != 0
		        GOTO SORTIE_ERR

		             OPEN CursP
			IF CURSOR_STATUS( ''variable'',''CursP'') = 0
			BEGIN
				-- PAS DE PERE
				SET @Find_P= 0
				SET @Stop = 1
			END
			ELSE
			BEGIN
				FETCH CursP INTO @Id
				SET @Find_P = 1
				SET @TxtId = CAST(@Id AS VARCHAR(1000))

				IF @@ERROR !=0
					GOTO SORTIE_ERR

				FETCH CursP INTO @Id

				WHILE @@FETCH_STATUS = 0
				BEGIN
					SET @TxtId = @TxtId + '','' + CAST(@Id AS VARCHAR(1000))
					IF @@ERROR !=0
						GOTO SORTIE_ERR

					FETCH CursP INTO @Id
				END
			END
		

		CLOSE CursP
		DEALLOCATE CursP
	   END
	END -- FIN BOUCLE PRINCIPALE

	IF @Find_F = 1
	BEGIN

		EXEC @Erreur = p_GetSubstsPere @TxtId, @TableTP OUTPUT, @TableTF OUTPUT
		IF @Erreur != 0
			GOTO SORTIE_ERR
		ELSE
		BEGIN

			SET @Req = ''SELECT * FROM ##'' +@TableTF
			EXEC(@Req)
			 IF @@ERROR !=0
				GOTO SORTIE_ERR
		END
	END

	IF @@ERROR != 0
                       BEGIN
		SET @Erreur = @@ERROR

		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableTF+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TableTF                         EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	ELSE
	
                      BEGIN
		SET @Ret = 0

		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableTF+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TableTF                         EXEC(@Req)
                           GOTO SORTIE
                      END
END

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Ret = @Erreur

	SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableTF+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TableTF                         EXEC(@Req)


	SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableTP+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TableTP                         EXEC(@Req)

-- RETOUR NORMAL PROCEDURE
SORTIE:

	SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableTF+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TableTF                         EXEC(@Req) 


	SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TableTP+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TableTP                         EXEC(@Req)


	IF CURSOR_STATUS(''variable'', ''CursF'') >= 0
	BEGIN
		CLOSE CursF
		DEALLOCATE CursF
	END

	IF CURSOR_STATUS(''variable'', ''CursP'') >= 0
	BEGIN
		CLOSE CursP
		DEALLOCATE CursP
	END

	IF CURSOR_STATUS(''variable'', ''@Curseur'') >= 0
	BEGIN
		CLOSE @Curseur
		DEALLOCATE @Curseur
	END

	RETURN @Ret















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_GetSubsts]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_GetSubsts]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_GetSubsts]
(
	@Libelle	 T_LIBELLE_100 = NULL,
	@Type		 INTEGER,
	@TSUBSTS	 VARCHAR(30) OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER
DECLARE @Val1 INTEGER
DECLARE @Val2 INTEGER
DECLARE @Val3 INTEGER
DECLARE @Req VARCHAR(8000)
DECLARE @Time VARCHAR(100)

-- BODY PROC
BEGIN
	SET NOCOUNT  ON
	SET @Erreur = 0
             SET @Time = replace((CONVERT(char(10), current_timestamp,108)), '':'', '''')
             SET @TSUBSTS = ''Tmp_SUBSTS'' +@Time

	SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects WHERE NAME = ''''##''+@TSUBSTS+ ''''''  AND TYPE = ''''U'''')
			 DROP TABLE ##''+@TSUBSTS                         EXEC(@Req)


	IF @Type = 0
	BEGIN
		SET @Val1 = 2
		SET @Val2 = 3
		SET @Val3 = 3
	END
	ELSE IF @Type = 1
	BEGIN
		SET @Val1 = 1
		SET @Val2 = 3
		SET @Val3 = 3
	END
	ELSE IF @Type = 2
	BEGIN
		SET @Val1 = 1
		SET @Val2 = 2
		SET @Val3 = 3
	END
	ELSE
		GOTO SORTIE
	
	--BEGIN TRANSACTION
	SET @Req = ''SELECT a.id_t_sub, 
			CASE HOMEOPATHIE
				WHEN ''''F'''' THEN a.LIBELLE
				ELSE a.LIBELLE+''''[Homéo]''''
			END LIBELLE,
                     	HOMEOPATHIE,
                        CAST(TEXTE AS VARCHAR(4000)) AS ''''TEXTE'''',
                        DC,
                        COMPLEMENTINDEXSUB,
			CASE a.Id_t_sub
				WHEN NULL THEN 0
				ELSE 1
			END HasChild,
			0 AS ''''BCONSTACTIF''''
		INTO ##''+@TSUBSTS+ ''
		FROM t_sub a INNER JOIN t_sub_complement b ON a.id_t_sub = b.id_t_sub
		WHERE b.rolecompoherite IN (''+ CONVERT(VARCHAR(10), @Val1)+ '','' + CONVERT(VARCHAR(10), @Val2) + '','' +CONVERT(VARCHAR(10), @Val3)+'')
		AND a.id_t_sub IN (	SELECT id_t_sub_p 
					FROM t_sub_parent 
					WHERE ouvrage = 1)
		AND
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(a.LIBELLE)
			,''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')
			,''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')
			,''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')
			,''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')
			,''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')
			,''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')
			,''''Ç'''',''''C'''')
			,''''Ñ'''',''''N'''')
                                        LIKE ''''''+@Libelle+''''''
		UNION
		SELECT b.id_t_sub,
			CASE b.HOMEOPATHIE
				WHEN ''''F'''' THEN a.libelle + ''''='''' + b.LIBELLE
				ELSE a.libelle + ''''='''' + b.LIBELLE + ''''[Homéo]''''
			END LIBELLE,
	                b.HOMEOPATHIE,
             		CAST(a.TEXTE AS VARCHAR(4000)) AS ''''TEXTE'''',
                        a.DC,
                        COMPLEMENTINDEXSUB,
			CASE b.Id_t_sub
				WHEN NULL THEN 0
				ELSE 1
			END AS ''''HasChild'''',
			0  AS ''''BCONSTACTIF''''
		FROM CoupleTermeSynonyme c	INNER JOIN T_Sub b ON  c.id_T_Sub = b.id_T_Sub 
						INNER JOIN.T_SUB_COMPLEMENT d ON  d.id_T_Sub = b.id_T_Sub 
						INNER JOIN T_SynonySub a ON c.id_T_SynonySub = a.id_T_SynonySub
		WHERE d.rolecompoherite IN (''+ CONVERT(VARCHAR(10), @Val1)+ '','' + CONVERT(VARCHAR(10), @Val2) + '','' +CONVERT(VARCHAR(10), @Val3)+'')
		AND b.id_t_sub in (select id_t_sub_p from t_sub_parent where ouvrage = 1)
		AND
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(a.LIBELLE)
			,''''À'''',''''A''''),''''Á'''',''''A''''),''''Â'''',''''A''''),''''Ã'''',''''A''''),''''Ä'''',''''A''''),''''Å'''',''''A'''')
			,''''È'''',''''E''''),''''É'''',''''E''''),''''Ê'''',''''E''''),''''Ë'''',''''E'''')
			,''''Ì'''',''''I''''),''''Í'''',''''I''''),''''Î'''',''''I''''),''''Ï'''',''''I'''')
			,''''Ô'''',''''O''''),''''Ó'''',''''O''''),''''Õ'''',''''O''''),''''Ö'''',''''O'''')
			,''''Ù'''',''''U''''),''''Ú'''',''''U''''),''''Û'''',''''U''''),''''Ü'''',''''U'''')
			,''''?'''',''''Y''''),''''Ý'''',''''Y''''),''''Ÿ'''',''''Y'''')
			,''''Ç'''',''''C'''')
			,''''Ñ'''',''''N'''') LIKE ''''''+@Libelle+''''''
	ORDER BY LIBELLE''


	--COMMIT TRANSACTION
	EXEC(@Req)

--	SET @Req = ''SELECT * FROM ##''+@TSUBSTS
	--EXEC(@Req)
	IF @@ERROR != 0
		GOTO SORTIE_ERR
	
END

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0

-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur

















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSubsts_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubsts_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetSubsts_Txt]
(
	@Libelle	T_LIBELLE_100=NULL,
	@Typ		INTEGER,
	@Ret		INTEGER OUTPUT
) AS

-- DECLARATIONS LOCALES
DECLARE @Erreur		INTEGER
DECLARE @TSUBSTS		VARCHAR(30)

DECLARE @Id_t_sub		T_COMPTEUR
DECLARE @Libelle_Final	VARCHAR(200)
DECLARE @Homeo		T_LIBELLE_1
DECLARE @Texte		VARCHAR(4000)
DECLARE @Dc			T_TEXTE_LONG
DECLARE @Compl		T_BOOLEEN
DECLARE @HasChild		BIT
DECLARE @Bconstactif		BIT
DECLARE @Lib			T_LIBELLE_100
DECLARE @Req		VARCHAR(4000)


-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSubsts_Txt'')

--STATS



	-- INITIALISATION VARIABLE D''ERREUR
	SET @Erreur = 0

	-- DEACTIVE AFFICHAGE ECRAN POUR GAIN EXECUTION
	SET NOCOUNT  ON
		
	EXEC @Erreur = p_Translate_Upper @Libelle, @Result = @Libelle OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR

	EXEC @Erreur = p_GetSubsts @Libelle, @Typ,  @TSUBSTS OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR

	-- NOTE : On a gardé le curseur ouvert par p_GetCips pour permettre l''accès à la table temporaire créée dans la procédure pré-citée
	SET @Req = ''SELECT * FROM ##''+@TSUBSTS
	EXEC(@Req)

	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TSUBSTS+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TSUBSTS
		EXEC(@Req)
		GOTO SORTIE_ERR
                       END  
	ELSE
                         BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects   WHERE NAME = ''''##''+@TSUBSTS+''''''  AND TYPE = ''''U'''')
		 DROP TABLE ##''+@TSUBSTS
		EXEC(@Req)
		SET @Ret = 0
		GOTO SORTIE
                       END  

                   
END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret











' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetSubstsDopantes_txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetSubstsDopantes_txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[GetSubstsDopantes_txt]
(
	@Libelle	 T_LIBELLE_100 = NULL,
	@Type		 INTEGER,
	@Ret		INTEGER OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER
DECLARE @Req VARCHAR(8000)


-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetSubstsDopantes_txt'')

--STATS


	SET NOCOUNT  ON
	SET @Erreur = 0

	EXEC @Erreur = p_Translate_Upper @Libelle, @Result = @Libelle OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR

	IF @Type = 1	
	BEGIN
                 Select a.ID_T_SUB,
               	a.DENOMSUB,
               	a.HOMEO,
               	a.BVALID,
               	a.BENCOURS,
              	a.NOMUSER,
              	a.CAS,
             		a.CASREPLACED,
             	   	a.NATURE,
                	a.CHIMIE,
                	a.LISTE,
               	a.COMMLISTE,
                	a.ORIGINEEXCIPIENT,
                	a.DCREAT,
                	a.DMODIF,
                	a.DREVIS,
                	a.ClassDopant,
                	b.COMM
              	FROM SUBSTANCE a, SUBPE b, T_SUB c
	              WHERE a.id_Substance = b.id_Substance
             		 AND   a.Id_t_Sub = c.id_t_sub
              	 AND   UPPER(b.terme) LIKE UPPER(''SPORTIFS%'')
		 AND	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(a.DENOMSUB)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
                                        LIKE @Libelle

             		 ORDER BY a.DENOMSUB;

	--EXEC(@Req);
	END


	IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR


		SET @Ret = 0
	GOTO SORTIE
END

-- Gestion des cas d''erreur
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR


	SET @Ret = @Erreur

-- Cas de sortie de procédure sans erreur
SORTIE:
	RETURN @Ret



' 
END
GO
/****** Objet :  Table [dbo].[T_Sub_Complement]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_Sub_Complement]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[T_Sub_Complement](
	[id_T_Sub] [T_OVP_ENTIERS] NOT NULL,
	[libelle] [T_LIBELLE_100] NOT NULL,
	[indexMV] [T_OVP_ENTIERS] NULL,
	[RoleCompo] [T_OVP_ENTIERS] NULL,
	[RoleCompoHerite] [T_OVP_ENTIERS] NULL,
 CONSTRAINT [PK_T_Sub_Complement] PRIMARY KEY CLUSTERED 
(
	[id_T_Sub]
)
)
END
GO
/****** Objet :  Table [dbo].[COMPOVIDALTEMP]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[COMPOVIDALTEMP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[COMPOVIDALTEMP](
	[IDORGANISME] [T_OVP_ENTIERS] NOT NULL,
	[ID_SPEPRESENTATIONHOP] [T_OVP_ENTIERS] NOT NULL,
	[LIBELLE] [T_LIBELLE_100] NULL
)
END
GO
/****** Objet :  StoredProcedure [dbo].[GetGenGroup_txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetGenGroup_txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[GetGenGroup_txt]
(
	@Libelle	 T_LIBELLE_100 = NULL,
	@Ret		INTEGER OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER


-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetGenGroup_txt'')

--STATS


	SET NOCOUNT  ON
	SET @Erreur = 0

	EXEC @Erreur = p_Translate_Upper @Libelle, @Result = @Libelle OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR



        SELECT distinct 
           DICOCODEGENE.ID_DICOCODEGENE,
          '''' as ''CodeGroupGen'',
          ''GEN'' as ''typegroupe'',
          DICOCODEGENE.LIBELLE,
          null  as ''Dosage'',
          '''' as ''Forme'',
          '''' as ''Voie'',
          count(SPEPRESENTATION.CIP)  AS ''NbElement'',
          DICOCODEGENE.CODEEXPEN,
          DICOCODEGENE.CODEINDIC,
          DICOCODEGENE.CODECI,
          DICOCODEGENE.CODECIALLERGIES,
          DICOCODEGENE.CODEIAM
        FROM
          DICOCODEGENE INNER JOIN  SPEPRESENTATION ON  DICOCODEGENE.ID_DICOCODEGENE = SPEPRESENTATION.ID_DICOCODEGENE
          INNER JOIN  SPECIALITE ON  SPECIALITE.ID_SPECIALITE = SPEPRESENTATION.ID_SPECIALITE
          INNER JOIN SPEVOIE ON SPECIALITE.ID_SPECIALITE = SPEVOIE.ID_SPECIALITE
        WHERE	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
			REPLACE(REPLACE(REPLACE(UPPER(DICOCODEGENE.LIBELLE)
			,''À'',''A''),''Á'',''A''),''Â'',''A''),''Ã'',''A''),''Ä'',''A''),''Å'',''A'')
			,''È'',''E''),''É'',''E''),''Ê'',''E''),''Ë'',''E'')
			,''Ì'',''I''),''Í'',''I''),''Î'',''I''),''Ï'',''I'')
			,''Ô'',''O''),''Ó'',''O''),''Õ'',''O''),''Ö'',''O'')
			,''Ù'',''U''),''Ú'',''U''),''Û'',''U''),''Ü'',''U'')
			,''?'',''Y''),''Ý'',''Y''),''Ÿ'',''Y'')
			,''Ç'',''C'')
			,''Ñ'',''N'')
                                        LIKE @Libelle
        GROUP BY
          DICOCODEGENE.ID_DICOCODEGENE,
          DICOCODEGENE.LIBELLE,
        --  Dosage,
       --   Forme,
     --     Voie,
          DICOCODEGENE.CODEEXPEN,
          DICOCODEGENE.CODEINDIC,
          DICOCODEGENE.CODECI,
          DICOCODEGENE.CODECIALLERGIES,
          DICOCODEGENE.CODEIAM;


IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR


		SET @Ret = 0
	GOTO SORTIE
END

-- Gestion des cas d''erreur
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR


	SET @Ret = @Erreur

-- Cas de sortie de procédure sans erreur
SORTIE:
	RETURN @Ret



' 
END
GO
/****** Objet :  Table [dbo].[LIVRETVIDAL]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LIVRETVIDAL]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LIVRETVIDAL](
	[ID_SPEPRESENTATION] [T_OVP_ENTIERS] NOT NULL,
	[IDORGANISME] [T_OVP_ENTIERS] NOT NULL,
	[PRIX_TTC_F] [T_OVP_FLOAT] NULL,
	[PRIX_TTC_E] [T_OVP_FLOAT] NULL,
	[DISPO] [T_libelle60] NULL,
	[COMMENTAIRE] [T_TEXTE_LONG] NULL,
	[DENOM_HOP] [T_libelle200] NULL,
	[UCD_HOP] [T_libelle7] NULL,
	[CODHOPITAL] [T_libelle30] NULL,
 CONSTRAINT [PK__LIVRETVIDAL__7478B105] PRIMARY KEY CLUSTERED 
(
	[ID_SPEPRESENTATION],
	[IDORGANISME]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[LIVRETVIDAL]') AND name = N'ASSOC_244_FK')
CREATE NONCLUSTERED INDEX [ASSOC_244_FK] ON [dbo].[LIVRETVIDAL] 
(
	[ID_SPEPRESENTATION]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[LIVRETVIDAL]') AND name = N'ASSOC_247_FK')
CREATE NONCLUSTERED INDEX [ASSOC_247_FK] ON [dbo].[LIVRETVIDAL] 
(
	[IDORGANISME]
)
GO
/****** Objet :  Table [dbo].[tampon]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tampon]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tampon](
	[IDORGANISME] [T_OVP_ENTIERS] NULL,
	[NOM] [T_libelle200] NULL,
	[PRESENTATION] [T_libelle50] NULL,
	[FORME] [T_libelle50] NULL,
	[DOSAGE] [T_libelle50] NULL,
	[CIP] [T_libelle7] NULL,
	[UCD] [T_libelle7] NULL,
	[LABO] [T_libelle60] NULL,
	[CODHOPITAL] [T_libelle30] NULL,
	[PRIX_TTC_F] [T_OVP_FLOAT] NULL,
	[PRIX_TTC_E] [T_OVP_FLOAT] NULL,
	[DISPO] [T_libelle60] NULL,
	[COMMENTAIRE] [T_TEXTE_LONG] NULL,
	[DENOM_HOP] [T_libelle200] NULL,
	[UCD_HOP] [T_libelle7] NULL
)
END
GO
/****** Objet :  Table [dbo].[LIVRETVIDALTEMP]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LIVRETVIDALTEMP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LIVRETVIDALTEMP](
	[IDORGANISME] [T_OVP_ENTIERS] NOT NULL,
	[CIP] [T_libelle7] NOT NULL,
	[PRIX_TTC_F] [T_OVP_FLOAT] NULL,
	[PRIX_TTC_E] [T_OVP_FLOAT] NULL,
	[DISPO] [T_libelle60] NULL,
	[COMMENTAIRE] [T_MEMO] NULL,
	[DENOM_HOP] [T_libelle50] NULL,
	[UCD_HOP] [T_libelle7] NULL,
	[CODHOPITAL] [T_libelle30] NULL,
 CONSTRAINT [PK_LIVRETVIDALTEMP] PRIMARY KEY NONCLUSTERED 
(
	[IDORGANISME]
)
)
END
GO
/****** Objet :  Table [dbo].[LIVRETHOPTEMP]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LIVRETHOPTEMP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LIVRETHOPTEMP](
	[IDORGANISME] [T_OVP_ENTIERS] NOT NULL,
	[ID_SPEPRESENTATIONHOP] [T_OVP_ENTIERS] NOT NULL,
	[PRIX_TTC_F] [T_OVP_FLOAT] NULL,
	[PRIX_TTC_E] [T_OVP_FLOAT] NULL,
	[DISPO] [T_libelle60] NULL,
	[COMMENTAIRE] [T_MEMO] NULL,
	[CODHOPITAL] [T_libelle30] NULL,
 CONSTRAINT [PK_LIVRETHOPTEMP] PRIMARY KEY NONCLUSTERED 
(
	[IDORGANISME],
	[ID_SPEPRESENTATIONHOP]
)
)
END
GO
/****** Objet :  Table [dbo].[LIVRETHOP]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LIVRETHOP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LIVRETHOP](
	[IDORGANISME] [T_OVP_ENTIERS] NOT NULL,
	[ID_SPEPRESENTATIONHOP] [T_OVP_ENTIERS] NOT NULL,
	[PRIX_TTC_F] [T_OVP_FLOAT] NULL,
	[PRIX_TTC_E] [T_OVP_FLOAT] NULL,
	[DISPO] [T_libelle60] NULL,
	[COMMENTAIRE] [T_TEXTE_LONG] NULL,
	[CODHOPITAL] [T_libelle30] NULL,
 CONSTRAINT [PK__LIVRETHOP__73848CCC] PRIMARY KEY CLUSTERED 
(
	[IDORGANISME],
	[ID_SPEPRESENTATIONHOP]
)
)
END
GO
/****** Objet :  StoredProcedure [dbo].[P_InsUpd_Livret]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[P_InsUpd_Livret]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- -------------------------------------------------------------------------
  -- Procedure de Modification ou d''Insertion - Tables : LIVRETVIDAL/LIVRETHOP
  -- Si l''enregistrement n''existe pas insert si non update
  -- -------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[P_InsUpd_Livret]
(
	@Param 			INTEGER,
	@Id_SpePresentation	INTEGER,
	@Id_Organisme		INTEGER,
	@Prix_TTC_F		VARCHAR(20)= ''13.9'',
	@Prix_TTC_E 		VARCHAR(20)= null ,
	@Dispo 			T_LIBELLE60,
	@Commentaire 		T_TEXTE_LONG,
	@CodeHopital 		T_LIBELLE30,
	@Cod_Trt 		T_TEXTE_LONG OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER
DECLARE @Cpt	INTEGER
DECLARE @Prix_E	REAL
DECLARE @Prix_F	REAL
DECLARE @REQ 		VARCHAR(220)
-- BODY PROC
BEGIN
	SET NOCOUNT  ON
	SET @Erreur = 0

	SET @Cod_Trt = ''''
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	SET @Cpt = -1
	IF @@ERROR != 0
		GOTO SORTIE_ERR


	IF ISNUMERIC( @Prix_TTC_F ) = 1
		SET @Prix_F = CAST(@Prix_TTC_F  AS REAL )
	ELSE
		--GOTO SORTIE
		SET @Prix_F = null

	IF ISNUMERIC( @Prix_TTC_E ) = 1
		SET @Prix_E = CAST(@Prix_TTC_E  AS REAL )
	ELSE
		--GOTO SORTIE
		SET @Prix_E = null

	--défini si insert ou update
	IF @Param = 1 
		SELECT @Cpt = COUNT(1) FROM LIVRETVIDAL WHERE ID_SPEPRESENTATION = @Id_SpePresentation AND IDORGANISME = @Id_Organisme
	ELSE IF @Param = 2
		SELECT @Cpt = COUNT(1) FROM LIVRETHOP	 WHERE ID_SPEPRESENTATIONHOP = @Id_SpePresentation AND IDORGANISME = @Id_Organisme

	IF @@ERROR != 0 GOTO SORTIE_ERR

	IF @Cpt > 0
	BEGIN
		IF @Param = 1
		BEGIN
			BEGIN TRANSACTION
				UPDATE LIVRETVIDAL
				SET 	PRIX_TTC_F 	= @Prix_F,
					PRIX_TTC_E  	= @Prix_E,
					DISPO       	= @Dispo,
        					COMMENTAIRE = @Commentaire,
					CODHOPITAL  	= @CodeHopital
    				WHERE ID_SPEPRESENTATION = @Id_SpePresentation AND IDORGANISME = @Id_Organisme
				IF @@ERROR != 0
				BEGIN

					ROLLBACK TRANSACTION
					GOTO SORTIE_ERR
				END

			COMMIT TRANSACTION

		END
		ELSE IF @Param = 2
		BEGIN
			BEGIN TRANSACTION
				UPDATE LIVRETHOP
        				SET 	PRIX_TTC_F  	= @Prix_F,
				            	PRIX_TTC_E  	= @Prix_E,
            					DISPO       	= @Dispo,
				            	COMMENTAIRE = @Commentaire,
						CODHOPITAL  = @CodeHopital
				WHERE ID_SPEPRESENTATIONHOP = @Id_SpePresentation AND IDORGANISME = @Id_Organisme

				IF @@ERROR != 0
				BEGIN
					ROLLBACK TRANSACTION
					GOTO SORTIE_ERR
				END
			COMMIT TRANSACTION


		END
	END

	ELSE IF @Cpt = 0
	BEGIN
		IF @Param = 1
		BEGIN
			BEGIN TRANSACTION
				INSERT INTO LIVRETVIDAL(ID_SPEPRESENTATION, IDORGANISME, PRIX_TTC_F, PRIX_TTC_E, DISPO, COMMENTAIRE, CODHOPITAL)
			        	VALUES (@Id_SpePresentation, @Id_Organisme, @Prix_F, @Prix_E, @Dispo, @Commentaire, @CodeHopital )

				IF @@ERROR != 0
				BEGIN
					ROLLBACK TRANSACTION
					GOTO SORTIE_ERR
				END
			COMMIT TRANSACTION
		END
		ELSE IF @Param = 2
		BEGIN
			BEGIN TRANSACTION
				INSERT INTO LIVRETHOP(ID_SPEPRESENTATIONHOP, IDORGANISME, PRIX_TTC_F, PRIX_TTC_E, DISPO, COMMENTAIRE, CODHOPITAL)
			        	VALUES (@Id_SpePresentation, @Id_Organisme, @Prix_F, @Prix_E, @Dispo, @Commentaire, @CodeHopital )

				IF @@ERROR != 0
				BEGIN
					ROLLBACK TRANSACTION
					GOTO SORTIE_ERR
				END
			COMMIT TRANSACTION
		END
	END

	SET @Cod_Trt = ''SQL-00000 : Normal, Successful completion''
		GOTO SORTIE
END

-- RETOUR NORMAL PROCEDURE
SORTIE:
	RETURN 0
--print(@Cod_Trt)
-- GESTION DES ERREURS
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Cod_Trt = ''SQL-'' + CONVERT(VARCHAR(10), @@ERROR) + '' : Error execution''


	RETURN @Erreur










' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCipDoc_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipDoc_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCipDoc_Txt]
(
	@Cip	T_LIBELLE7=NULL,
	@Ret	INTEGER OUTPUT
) AS
DECLARE @Erreur	INTEGER
DECLARE @Curseur	CURSOR

DECLARE @varIDSuivi	INTEGER
DECLARE @varIDPres	INTEGER
DECLARE @varMono	VARCHAR(9)
DECLARE @TTCIPDOC 	VARCHAR(25)
DECLARE @Req           VARCHAR(1000)

BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCipDoc_Txt'')

--STATS


	-- Initialisation et optimisation
	SET @Erreur = 0
	SET NOCOUNT ON

	

	-- Recherche des infos
	EXEC @Erreur = p_GetCipDoc null,@Cip, ''CIP'', @TTCIPDOC  OUTPUT
	IF @Erreur != 0
		GOTO SORTIE_ERR


	-- Lecture des infos
	SET @Req = ''SELECT * FROM ##'' + @TTCIPDOC
	EXEC(@Req)


		-- TEST ERREUR
	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TTCIPDOC+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPDOC
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TTCIPDOC+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPDOC
                           EXEC(@Req)
                           GOTO SORTIE
                      END

END

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret









' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCip_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCip_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCip_Txt]
( 
	@Cip	T_LIBELLE7 = NULL,
	@Ret	INTEGER OUTPUT
) AS

-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur 	INTEGER
DECLARE @Req	VARCHAR(1000)
DECLARE @TTCIPSPE     VARCHAR(1000)

BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCip_Txt'')

--STATS


	SET NOCOUNT ON
	SET @Erreur = 0

	EXEC @Erreur = p_GetCip NULL, @Cip, ''CIP'', @TTCIPSPE  OUTPUT
	IF @Erreur != 0
		SET @Ret = @@ERROR
	ELSE
	BEGIN
		-- On garde le curseur ouvert pour avoir accès à la table temporaire créée dans p_GetCip
		SET @Req = ''SELECT * FROM ##'' + @TTCIPSPE
		EXEC(@Req)

		-- TEST ERREUR
	 IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TTCIPSPE+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPSPE
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM tempdb..sysobjects  WHERE NAME = ''''##''+@TTCIPSPE+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPSPE
                           EXEC(@Req)
                           GOTO SORTIE
                      END


	END
END

SORTIE:
	RETURN @Ret


SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur







' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCipSpeDopante_txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipSpeDopante_txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[GetCipSpeDopante_txt]
(
	@CIP                 T_LIBELLE7=null,
	@Ret		INTEGER OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER


-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCipSpeDopante_txt'')

--STATS


	SET NOCOUNT  ON
	SET @Erreur = 0


               SELECT  b.ID_SPECIALITE, b.BVALID, b.BENCOURS, b.NOMUSER,
                       b.DENOMSPE, b.FORME, b.DOSAGE, b.complement,
                       b.COMMAMMPOSO, b.RESERVE, b.INFERIEURAGE,
                       b.UNITINF, b.SUPERIEURAGE, b.UNIFSUP,
                       b.INFERIEURPOIDS, b.SUPERIEURPOIDS,
                       b.DENOMAMM, b.NUMDOSAMM, b.SPECATEGORIE,
                       b.SOURCE, b.DATESOURCE, b.REMARQUES, b.DCREAT,
                       b.DMODIF, b.DREVIS, b.BDOPANT
               FROM    SPECIALITE b  INNER JOIN  SPEPRESENTATION a ON  b.ID_SPECIALITE = a.ID_SPECIALITE
               WHERE   (UPPER(a.Cip) = UPPER(@Cip) OR @Cip IS NULL)
               ORDER BY b.DENOMSPE;                 



	IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR


		SET @Ret = 0
	GOTO SORTIE
END

-- Gestion des cas d''erreur
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR


	SET @Ret = @Erreur

-- Cas de sortie de procédure sans erreur
SORTIE:
	RETURN @Ret






















' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCipUCD_txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipUCD_txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[GetCipUCD_txt]
(
	@Cip  	             T_LIBELLE7 = NULL,                                  
	@Ret		INTEGER OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER

-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCipUCD_txt'')

--STATS


	SET NOCOUNT  ON

	-- INITIALISATION VARIABLE D''ERREUR
	SET @Erreur = 0

	-- DEFINITION DU CURSEUR DE SORTIE
   	  SELECT 
         		  code_ucd, code_cip, 
         		  libelle_ucd 
       	  FROM   UCD 
               WHERE code_cip = @Cip;

	-- CONTROLE DEFINITION
	IF @@ERROR != 0
		GOTO SORTIE_ERR

	-- PAS D''ERREUR
	SET @Ret = 0
		GOTO SORTIE
END

--- CHARGEMENT ERREUR DANS RET
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	SET @Ret = @Erreur

SORTIE:
	RETURN @Ret






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCipSpe_Txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCipSpe_Txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[GetCipSpe_Txt]
(
	@Cip	T_LIBELLE7 = NULL,
	@Ret	INTEGER OUTPUT
) AS
-- DEFINTITION DES VARIABLES LOCALES
DECLARE @Erreur		INTEGER
DECLARE @Curseur	CURSOR
DECLARE @TTCIPSPE	VARCHAR(30)
DECLARE @Req varchar(4000)

BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCipSpe_Txt'')

--STATS


	SET NOCOUNT ON
	SET @Erreur = 0

	EXEC @Erreur = p_GetCipSpe NULL, @Cip, ''CIP'',  @TTCIPSPE OUTPUT
	IF @Erreur != 0
		SET @Ret = @@ERROR
	ELSE
	BEGIN
-- On garde le curseur ouvert pour avoir accès à la table temporaire créée dans p_GetCip
		SET @Req = ''SELECT * FROM ##'' +@TTCIPSPE
                           EXEC(@Req)

	-- TEST ERREUR
	IF @@ERROR != 0
                       BEGIN
		SET @Req = ''IF EXISTS( SELECT 1 FROM   tempdb..sysobjects  WHERE NAME = ''''##''+@TTCIPSPE+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPSPE
                           EXEC(@Req)
		GOTO SORTIE_ERR
                       END
                      
	-- PAS D''ERREUR
	
                      BEGIN
		SET @Ret = 0
		SET @Req = ''IF EXISTS( SELECT 1 FROM   tempdb..sysobjects  WHERE NAME = ''''##''+@TTCIPSPE+ ''''''AND TYPE = ''''U'''')
		DROP TABLE ##''+@TTCIPSPE
                           EXEC(@Req)
                           GOTO SORTIE
                      END
	END
END

SORTIE:
	RETURN @Ret

SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR

	RETURN @Erreur






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[GetCIPGenGroup_txt]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCIPGenGroup_txt]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[GetCIPGenGroup_txt]
(
	@CIP                 T_LIBELLE7 = NULL,
	@Ret		INTEGER OUTPUT
) AS
-- DECLARATIONS LOCALES
DECLARE @Erreur INTEGER


-- BODY PROC
BEGIN

--STATS

UPDATE MARQUEURS SET Compteur = Compteur + 1 WHERE PROC_NAME = UPPER(''GetCIPGenGroup_txt'')

--STATS


	SET NOCOUNT  ON
	SET @Erreur = 0

        SELECT
           DICOCODEGENE.ID_DICOCODEGENE,
          '''' as ''CodeGroupGen'',
          ''GEN'' as ''typegroupe'',
          DICOCODEGENE.LIBELLE,
          null  as ''Dosage'',
          '''' as ''Forme'',
          '''' as ''Voie'',
          count(b.CIP) AS ''NbElement'',
          DICOCODEGENE.CODEEXPEN,
          DICOCODEGENE.CODEINDIC,
          DICOCODEGENE.CODECI,
          DICOCODEGENE.CODECIALLERGIES,
          DICOCODEGENE.CODEIAM
        FROM
          SPEPRESENTATION INNER JOIN  DICOCODEGENE ON  DICOCODEGENE.ID_DICOCODEGENE = SPEPRESENTATION.ID_DICOCODEGENE
          INNER JOIN  Spepresentation b ON DICOCODEGENE.ID_DICOCODEGENE = b.ID_DICOCODEGENE
          INNER JOIN  SPECIALITE ON SPECIALITE.ID_SPECIALITE = SPEPRESENTATION.ID_SPECIALITE
          INNER JOIN  SPEVOIE ON SPECIALITE.ID_SPECIALITE = SPEVOIE.ID_SPECIALITE
        WHERE
          UPPER(SPEPRESENTATION.CIP) = UPPER(@CIP)

        GROUP BY
          DICOCODEGENE.ID_DICOCODEGENE,
          DICOCODEGENE.LIBELLE,
          Dosage,
          Forme,
          Voie,
          DICOCODEGENE.CODEEXPEN,
          DICOCODEGENE.CODEINDIC,
          DICOCODEGENE.CODECI,
          DICOCODEGENE.CODECIALLERGIES,
          DICOCODEGENE.CODEIAM;




IF @@ERROR != 0	-- Cas d''erreur
		GOTO SORTIE_ERR


		SET @Ret = 0
	GOTO SORTIE
END

-- Gestion des cas d''erreur
SORTIE_ERR:
	IF @Erreur = 0
		SET @Erreur = @@ERROR


	SET @Ret = @Erreur

-- Cas de sortie de procédure sans erreur
SORTIE:
	RETURN @Ret


























' 
END
GO
/****** Objet :  Table [dbo].[COMPOHOPTEMP]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[COMPOHOPTEMP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[COMPOHOPTEMP](
	[IDORGANISME] [T_OVP_ENTIERS] NOT NULL,
	[ID_SPEPRESENTATIONHOP] [T_OVP_ENTIERS] NOT NULL,
	[ID_T_SUBHOP] [T_OVP_ENTIERS] NOT NULL
)
END
GO
/****** Objet :  Table [dbo].[COMPOHOP]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[COMPOHOP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[COMPOHOP](
	[IDORGANISME] [T_OVP_ENTIERS] NOT NULL,
	[ID_SPEPRESENTATIONHOP] [T_OVP_ENTIERS] NOT NULL,
	[ID_T_SUBHOP] [T_OVP_ENTIERS] NOT NULL,
 CONSTRAINT [PK__COMPOHOP__77551DB0] PRIMARY KEY CLUSTERED 
(
	[IDORGANISME],
	[ID_SPEPRESENTATIONHOP],
	[ID_T_SUBHOP]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[COMPOHOP]') AND name = N'LIEN_13_FK')
CREATE NONCLUSTERED INDEX [LIEN_13_FK] ON [dbo].[COMPOHOP] 
(
	[IDORGANISME],
	[ID_SPEPRESENTATIONHOP]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[COMPOHOP]') AND name = N'LIEN_14_FK')
CREATE NONCLUSTERED INDEX [LIEN_14_FK] ON [dbo].[COMPOHOP] 
(
	[ID_T_SUBHOP]
)
GO
/****** Objet :  Table [dbo].[COMPOVIDAL]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[COMPOVIDAL]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[COMPOVIDAL](
	[IDORGANISME] [T_OVP_ENTIERS] NOT NULL,
	[ID_SPEPRESENTATIONHOP] [T_OVP_ENTIERS] NOT NULL,
	[ID_T_SUB] [T_OVP_ENTIERS] NOT NULL,
 CONSTRAINT [PK_COMPOVIDAL] PRIMARY KEY CLUSTERED 
(
	[IDORGANISME],
	[ID_SPEPRESENTATIONHOP],
	[ID_T_SUB]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[COMPOVIDAL]') AND name = N'LIEN_116_FK')
CREATE NONCLUSTERED INDEX [LIEN_116_FK] ON [dbo].[COMPOVIDAL] 
(
	[IDORGANISME],
	[ID_SPEPRESENTATIONHOP]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[COMPOVIDAL]') AND name = N'LIEN_117_FK')
CREATE NONCLUSTERED INDEX [LIEN_117_FK] ON [dbo].[COMPOVIDAL] 
(
	[ID_T_SUB]
)
GO
/****** Objet :  Table [dbo].[T_Sub_Parent]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_Sub_Parent]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[T_Sub_Parent](
	[id_T_Sub_F] [T_OVP_ENTIERS] NOT NULL,
	[id_T_Sub_P] [T_OVP_ENTIERS] NOT NULL,
	[Synonyme] [T_OVP_ENTIERS] NOT NULL,
	[ouvrage] [T_OVP_ENTIERS] NOT NULL,
 CONSTRAINT [PK_T_Sub_Parent] PRIMARY KEY CLUSTERED 
(
	[id_T_Sub_F],
	[id_T_Sub_P],
	[Synonyme],
	[ouvrage]
)
)
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[T_Sub_Parent]') AND name = N'IX_id_T_Sub_F')
CREATE NONCLUSTERED INDEX [IX_id_T_Sub_F] ON [dbo].[T_Sub_Parent] 
(
	[id_T_Sub_F]
)
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[T_Sub_Parent]') AND name = N'IX_id_T_Sub_P')
CREATE NONCLUSTERED INDEX [IX_id_T_Sub_P] ON [dbo].[T_Sub_Parent] 
(
	[id_T_Sub_P]
)
GO
/****** Objet :  Table [dbo].[Presentation_Documents]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Presentation_Documents]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Presentation_Documents](
	[id_presentation] [T_OVP_ENTIERS] NOT NULL,
	[id_document] [T_OVP_ENTIERS] NOT NULL,
 CONSTRAINT [PK_Presentation_Documents] PRIMARY KEY CLUSTERED 
(
	[id_presentation],
	[id_document]
)
)
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Del_SpepresentationHop]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Del_SpepresentationHop]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Del_SpepresentationHop]
(
	@IDOrganisme	INTEGER,
	@ID_SPEPRESENTATIONHOP	INTEGER,
	@Cod_Trt		T_TEXTE_LONG OUTPUT
) AS
-- Body
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION
		DELETE FROM COMPOVIDAL
		WHERE IDORGANISME = @IDOrganisme
		AND ID_SPEPRESENTATIONHOP = @ID_SPEPRESENTATIONHOP
		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END

		DELETE FROM COMPOHOP
		WHERE IDORGANISME = @IDOrganisme
		AND ID_SPEPRESENTATIONHOP = @ID_SPEPRESENTATIONHOP
		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END

		DELETE FROM LIVRETHOP
		WHERE IDORGANISME = @IDOrganisme
		AND ID_SPEPRESENTATIONHOP = @ID_SPEPRESENTATIONHOP
		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END

		DELETE FROM SPEPRESENTATIONHOP
		WHERE IDORGANISME = @IDOrganisme
		AND ID_SPEPRESENTATIONHOP = @ID_SPEPRESENTATIONHOP
		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END

		SET @Cod_Trt = ''ORA-00000 : Normal, Successful completion''
	COMMIT TRANSACTION

	RETURN 0
END

SORTIE_ERR:
	RETURN @@ERROR








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Del_Livret]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Del_Livret]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Del_Livret]
(
	@Param		INTEGER,
	@ID_SPEPRESENTATION	INTEGER,
	@IDOrganisme	INTEGER,
	@Cod_Trt	T_TEXTE_LONG OUTPUT
) AS
-- Body
BEGIN
	-- Optimisation
	SET NOCOUNT ON

	-- Requête de suppression conditionnelle
	BEGIN TRANSACTION
		IF @Param = 1
		BEGIN
			DELETE FROM LIVRETVIDAL
			WHERE id_spepresentation = @ID_SPEPRESENTATION
			AND idorganisme = @IDOrganisme
		END
		ELSE IF @Param = 2
		BEGIN
			DELETE FROM LIVRETHOP
			WHERE id_spepresentationhop = @ID_SPEPRESENTATION
			AND idorganisme = @IDOrganisme
		END

		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END
	COMMIT TRANSACTION

	SET @Cod_Trt = ''ORA-00000 : Normal, Successful completion''

	RETURN 0
END

SORTIE_ERR:
	RETURN @@ERROR









' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Del_SubHop]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Del_SubHop]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Del_SubHop]
(
	@IDOrganisme	INTEGER,
	@ID_t_subhop	INTEGER,
	@Cod_Trt		T_TEXTE_LONG OUTPUT
) AS
-- Body
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION
		DELETE FROM COMPOHOP
		WHERE idorganisme = @IDOrganisme
		AND id_t_subhop = @ID_t_subhop
		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END

		DELETE FROM T_SUBHOP
		WHERE idorganisme = @IDOrganisme
		AND id_t_subhop = @ID_t_subhop
		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END
	COMMIT TRANSACTION

	SET @Cod_Trt = ''ORA-00000 : Normal, Successful completion''

	RETURN 0
END

SORTIE_ERR:
	RETURN @@ERROR






' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Ins_SpePresentationHop]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Ins_SpePresentationHop]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Ins_SpePresentationHop]
(
	@IDOrganisme	INTEGER,
	@ID_SPEPRESENTATIONHOP	INTEGER OUTPUT,
	@Nom		VARCHAR(50),
	@Presentation	VARCHAR(50),
	@Forme		VARCHAR(50),
	@Dosage		VARCHAR(50),
	@CIP		VARCHAR(7),
	@UCD		VARCHAR(7),
	@Labo		VARCHAR(60),
	@CodHop		VARCHAR(30),
	@Prix_TTC_f	VARCHAR(10)=null,
	@Prix_TTC_e	VARCHAR(10)=null,
	@Dispo		VARCHAR(60),
	@Commentaire	VARCHAR(255),
	@Cod_Trt		T_TEXTE_LONG OUTPUT
) AS
-- Déclarations locales
DECLARE @varIDSpePresHop INTEGER

-- Body
BEGIN
	-- Optimisation
	SET NOCOUNT ON

	-- Initialisation
--	SET @varIDSpePresHop = (SELECT MAX(id_spepresentationhop)+1 FROM SPEPRESENTATIONHOP)
	if @Prix_TTC_f ='''' SET @Prix_TTC_f = null
	if @Prix_TTC_E ='''' SET @Prix_TTC_E = null
	-- Insertions dans les tables
	BEGIN TRANSACTION
		INSERT INTO SPEPRESENTATIONHOP(idorganisme, /*id_spepresentationhop, */nom, presentation, forme, dosage, cip, ucd, labo)
		VALUES(@IDOrganisme, /*@varIDSpePresHop, */@Nom, @Presentation, @Forme, @Dosage, @CIP, @UCD, @Labo)
		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END

		SET @varIDSpePresHop = (SELECT MAX(id_spepresentationhop) FROM SPEPRESENTATIONHOP)

		INSERT INTO LIVRETHOP(id_spepresentationhop, idorganisme, prix_ttc_f,
					prix_ttc_e, dispo, commentaire, codhopital)
		VALUES(@varIDSpePresHop, @IDOrganisme, CONVERT(REAL, @Prix_TTC_f),
			CONVERT(REAL, @Prix_TTC_e), @Dispo, @Commentaire, @CodHop)
		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END
	COMMIT TRANSACTION

	-- Affectations des paramètres de sortie
	SET @ID_SPEPRESENTATIONHOP = @varIDSpePresHop
	SET @Cod_Trt = ''ORA-00000 : Normal, Successful completion''

	RETURN 0
END

SORTIE_ERR:
	RETURN @@ERROR













' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Ins_Compo]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Ins_Compo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Ins_Compo]
(
	@Param		INTEGER,
	@IDOrganisme	INTEGER,
	@ID_SPEPRESENTATIONHOP	INTEGER,
	@ID_t_sub	INTEGER,
	@Cod_Trt		T_TEXTE_LONG	OUTPUT
) AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION
		IF @Param = 1
			INSERT INTO COMPOVIDAL(idorganisme, id_spepresentationhop, id_t_sub)
			VALUES(@IDOrganisme, @ID_SPEPRESENTATIONHOP, @ID_t_sub)
		ELSE IF @Param = 2
			INSERT INTO COMPOHOP(idorganisme, id_spepresentationhop, id_t_subhop)
			VALUES(@IDOrganisme, @ID_SPEPRESENTATIONHOP, @ID_t_sub)

		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END
	COMMIT TRANSACTION

	SET @Cod_Trt = ''ORA-00000 : Normal, Successful completion''
END

SORTIE_ERR:
	RETURN @@ERROR








' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Ins_Livret]    Date de génération du script : 11/28/2007 10:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Ins_Livret]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Ins_Livret]
(
	@Param		INTEGER,
	@ID_SPEPRESENTATION	INTEGER,
	@IDOrganisme	INTEGER,
	@Prix_TTC_F	REAL,
	@Prix_TTC_E	REAL,
	@Dispo		VARCHAR(60),
	@Commentaire	VARCHAR(255),
	@CODHOPITAL		VARCHAR(30),
	@Cod_Trt		T_TEXTE_LONG OUTPUT
) AS
-- Body
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION
		IF @Param = 1
			INSERT INTO LIVRETVIDAL
				    (
					id_spepresentation,
					idorganisme,
					prix_ttc_f,
					prix_ttc_e,
					dispo,
					commentaire,
					codhopital
				    )
			VALUES	(
					@ID_SPEPRESENTATION,
					@IDOrganisme,
					@Prix_TTC_F,
					@Prix_TTC_E,
					@Dispo,
					@Commentaire,
					@CODHOPITAL
				)
		ELSE IF @Param = 2
			INSERT INTO LIVRETHOP
				    (
					id_spepresentationhop,
					idorganisme,
					prix_ttc_f,
					prix_ttc_e,
					dispo,
					commentaire,
					codhopital
				    )
			VALUES	(
					@ID_SPEPRESENTATION,
					@IDOrganisme,
					@Prix_TTC_F,
					@Prix_TTC_E,
					@Dispo,
					@Commentaire,
					@CODHOPITAL
				)
		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END
	COMMIT TRANSACTION

	SET @Cod_Trt = ''ORA-00000 : Normal, Successful completion''

	RETURN 0
END

SORTIE_ERR:
	RETURN @@ERROR













' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Upd_SpePresentationHop]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Upd_SpePresentationHop]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Upd_SpePresentationHop]
(
	@IDOrganisme	INTEGER,
	@ID_SPEPRESENTATIONHOP	INTEGER,
	@Nom		VARCHAR(50),
	@Presentation	VARCHAR(50),
	@Forme		VARCHAR(50),
	@Dosage		VARCHAR(50),
	@CIP		VARCHAR(7),
	@UCD		VARCHAR(7),
	@Labo		VARCHAR(60),
	@CodHop		VARCHAR(30),
	@Prix_TTC_f	VARCHAR(10),
	@Prix_TTC_e	VARCHAR(10),
	@Dispo		VARCHAR(60),
	@Commentaire	VARCHAR(255),
	@Cod_Trt		T_TEXTE_LONG OUTPUT
) AS
BEGIN
	SET NOCOUNT ON

	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE -- Verrouillage
	BEGIN TRANSACTION
		UPDATE SPEPRESENTATIONHOP
		SET	nom = @Nom,
			presentation = @Presentation,
			forme = @Forme,
			dosage = @Dosage,
			cip = @CIP,
			ucd = @UCD,
			labo = @Labo
		WHERE idorganisme = @IDOrganisme
		AND id_spepresentationhop = @ID_SPEPRESENTATIONHOP

		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			SET TRANSACTION ISOLATION LEVEL READ COMMITTED -- Libération
			GOTO SORTIE_ERR
		END

		UPDATE LIVRETHOP
		SET	prix_ttc_f = CONVERT(REAL, @Prix_TTC_f),
			prix_ttc_e = CONVERT(REAL, @Prix_TTC_e),
			dispo = @Dispo,
			commentaire = @Commentaire,
			codhopital = @CodHop
		WHERE idorganisme = @IDOrganisme
		AND id_spepresentationhop = @ID_SPEPRESENTATIONHOP

		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			SET TRANSACTION ISOLATION LEVEL READ COMMITTED -- Libération
			GOTO SORTIE_ERR
		END
	COMMIT TRANSACTION

	SET TRANSACTION ISOLATION LEVEL READ COMMITTED -- Libération
	SET @Cod_Trt = ''ORA-00000 : Normal, Successful completion''

	RETURN 0
END

SORTIE_ERR:
	RETURN @@ERROR











' 
END
GO
/****** Objet :  StoredProcedure [dbo].[p_Upd_SUBHOP]    Date de génération du script : 11/28/2007 10:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[p_Upd_SUBHOP]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[p_Upd_SUBHOP]
(
	@IDOrganisme	INTEGER,
	@ID_t_subhop 	INTEGER,
	@Libelle 	VARCHAR(50),
	@Cod_Trt	T_TEXTE_LONG OUTPUT
) AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRANSACTION
		UPDATE T_SUBHOP
		SET libelle = @Libelle
		WHERE idorganisme = @IDOrganisme
		AND id_t_subhop = @ID_t_subhop

		IF @@ERROR != 0
		BEGIN
			ROLLBACK TRANSACTION
			GOTO SORTIE_ERR
		END
	COMMIT TRANSACTION

	SET @Cod_Trt = ''ORA-00000 : Normal, Successful completion''

	RETURN 0
END

SORTIE_ERR:
	RETURN @@ERROR








' 
END
GO
/****** Objet :  Default [DF__DicoCodeG__CodeI__656B779F]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__DicoCodeG__CodeI__656B779F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DicoCodeGene] ADD  CONSTRAINT [DF__DicoCodeG__CodeI__656B779F]  DEFAULT ((0)) FOR [CodeIndic]

END
GO
/****** Objet :  Default [DF__DicoCodeG__CodeC__665F9BD8]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__DicoCodeG__CodeC__665F9BD8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DicoCodeGene] ADD  CONSTRAINT [DF__DicoCodeG__CodeC__665F9BD8]  DEFAULT ((0)) FOR [CodeCI]

END
GO
/****** Objet :  Default [DF__DicoCodeG__CodeC__6753C011]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__DicoCodeG__CodeC__6753C011]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DicoCodeGene] ADD  CONSTRAINT [DF__DicoCodeG__CodeC__6753C011]  DEFAULT ((0)) FOR [CodeCIAllergies]

END
GO
/****** Objet :  Default [DF__DicoCodeG__CodeI__6847E44A]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__DicoCodeG__CodeI__6847E44A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DicoCodeGene] ADD  CONSTRAINT [DF__DicoCodeG__CodeI__6847E44A]  DEFAULT ((0)) FOR [CodeIAM]

END
GO
/****** Objet :  Default [DF__DicoCodeG__CodeE__693C0883]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__DicoCodeG__CodeE__693C0883]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DicoCodeGene] ADD  CONSTRAINT [DF__DicoCodeG__CodeE__693C0883]  DEFAULT ((0)) FOR [CodeExpEN]

END
GO
print '###Fin ReCreate_RubisInfoCentreProduit.sql'
print '##Next Steps = DTS import_Data_RubisInfoCentreProduit'
print '#Penser à tester le transfert avec MSSQL7\controles\controle_importTables.sql sur SRV-VID-FAB1'
print 'puis finaliser avec ReCreate_RubisInfoCentreProduit_FK.sql'
select getDate() As 'Fin de traitement'