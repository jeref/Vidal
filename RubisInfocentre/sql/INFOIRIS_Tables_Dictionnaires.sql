/*************************************************************************/
/*  Modification du 05 decembre 02 :                                     */
/*  - Ajout de plusieurs champs Ordre à la table DicoComClassIRIS_DENORM */
/*                                                                       */
/*************************************************************************/

CREATE TABLE [dbo].[DicoCodeGene] (
	[id_DicoCodeGene] [T_COMPTEUR] NOT NULL ,
	[libelle] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL ,
        [CodeIndic] [T_OVP_ENTIERS] NOT NULL DEFAULT 0,
        [CodeCI] [T_OVP_ENTIERS] NOT NULL DEFAULT 0,
        [CodeCIAllergies] [T_OVP_ENTIERS] NOT NULL DEFAULT 0,
        [CodeIAM] [T_OVP_ENTIERS] NOT NULL DEFAULT 0, 
        [CodeExpEN] [T_OVP_ENTIERS] NOT NULL DEFAULT 0 )
 ON [PRIMARY]

GO

ALTER TABLE [dbo].[DicoCodeGene] WITH NOCHECK ADD 
	CONSTRAINT [PK_DICOCODEGENE] PRIMARY KEY  CLUSTERED 
	(
		[id_DicoCodeGene]
	)  ON [PRIMARY] 
GO


CREATE TABLE [dbo].[DicoComClassIRIS] (
	[id_DicoComClassIRIS] [T_COMPTEUR]  NOT NULL ,
	[Dic_id_DicoComClassIRIS] [T_COMPTEUR] NULL ,
	[libelle] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL ,
	[multicritere] [T_TEXTE_LONG] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DicoComClassIRIS] WITH NOCHECK ADD 
	CONSTRAINT [PK_DICOCOMCLASSIRIS] PRIMARY KEY  CLUSTERED 
	(
		[id_DicoComClassIRIS]
	)  ON [PRIMARY] 
GO


CREATE TABLE [dbo].[DicoRF_CIM] (
	[id_DicoRF_CIM] [T_COMPTEUR]  NOT NULL ,
	[libelle] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DicoRF_CIM] WITH NOCHECK ADD 
	CONSTRAINT [PK_DICORF_CIM] PRIMARY KEY  CLUSTERED 
	(
		[id_DicoRF_CIM]
	)  ON [PRIMARY] 
GO


CREATE TABLE [dbo].[DicoT_ATC_IRIS] (
	[id_DicoT_ATC_IRIS] [T_COMPTEUR] NOT NULL ,
	[Dic_id_DicoT_ATC_IRIS] [T_COMPTEUR] NULL ,
	[libelle] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL ,
	[CodeATC] [T_Libelle50] NULL ,
	[LibATC] [T_Libelle200] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DicoT_ATC_IRIS] WITH NOCHECK ADD 
	CONSTRAINT [PK_DICOT_ATC_IRIS] PRIMARY KEY  CLUSTERED 
	(
		[id_DicoT_ATC_IRIS]
	)  ON [PRIMARY] 
GO


CREATE TABLE [dbo].[DicoEphmra] (
	[id_DicoEphmra] [T_COMPTEUR] NOT NULL ,
	[dic_id_DicoEphmra] [int] NULL ,
	[libelle] [varchar] (127) NOT NULL ,
	[Code] [varchar] (50),
	[ordre] [int] NULL 
)
GO

ALTER TABLE [dbo].[DicoEphmra] WITH NOCHECK ADD 
	CONSTRAINT [PK_DICOEPHMRA] PRIMARY KEY  CLUSTERED 
	(
		[id_DicoEPHMRA]
	)  ON [PRIMARY] 
GO


/*

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeLieuDistrib]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeLieuDistrib]



CREATE TABLE [dbo].[DicoSpeLieuDistrib] (
	[id_DicoSpeLieuDistrib] [T_COMPTEUR]  NOT NULL ,
	[dic_id_dicospelieudistrib] [int] NULL ,
	[libelle] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL ,
	[bHop] [int] NOT NULL 
)


ALTER TABLE [dbo].[DicoSpeLieuDistrib] WITH NOCHECK ADD 
	CONSTRAINT [PK_DicoSpeLieuDistrib] PRIMARY KEY  NONCLUSTERED 
	(
		[id_DicoSpeLieuDistrib]
	)  ON [PRIMARY] 



if exists (select * from sysobjects where id = object_id(N'[dbo].[PresLieuDistrib]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PresLieuDistrib]


CREATE TABLE [dbo].[PresLieuDistrib] (
	[id_PresLieuDistrib] [T_COMPTEUR] NOT NULL ,
	[id_DicoSpeLieuDistrib] [T_COMPTEUR] NOT NULL ,
	[id_Presentation] [T_COMPTEUR] NOT NULL 
)


ALTER TABLE [dbo].[PresLieuDistrib] WITH NOCHECK ADD 
	CONSTRAINT [PK_PresLieuDistrib] PRIMARY KEY  NONCLUSTERED 
	(
		[id_PresLieuDistrib]
	)  ON [PRIMARY] 



if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoRefSource]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoRefSource]


CREATE TABLE [dbo].[DicoRefSource] (
	[id_DicoRefSource] [T_COMPTEUR] NOT NULL ,
	[libelle] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
)
*/
