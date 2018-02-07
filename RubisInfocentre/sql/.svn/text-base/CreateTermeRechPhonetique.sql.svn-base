/* Modification SL du 11 05 04					*/
/*  - Ajout du champ CodeDispo a TermeRechPhonetique		*/

CREATE TABLE [dbo].[TermeRechPhonetique] (
 [id_TermeRechPhonetique] T_COMPTEUR IDENTITY (1, 1) NOT NULL ,
 [Terme_Libelle] T_libelle200 NOT NULL ,
 [Terme_Soundex] VARCHAR(35) NOT NULL ,
 [Type_Terme] T_libelle10 NOT NULL ,
 [id_Terme] T_libelle10 NOT NULL ,
 [CodeDispo] Integer NULL ,
 [Terme_LibSsAccent] T_libelle200 NOT NULL,
    CONSTRAINT PK_TermeRechPhonetique PRIMARY KEY (id_TermeRechPhonetique)
)
GO

CREATE  INDEX IX_Terme_Libelle ON dbo.TermeRechPhonetique (Terme_Libelle)
GO

CREATE  INDEX IX_Terme_Soundex ON dbo.TermeRechPhonetique (Terme_Soundex)
GO

CREATE  INDEX IX_Type_Terme ON dbo.TermeRechPhonetique (Type_Terme)
GO

CREATE  INDEX IX_CodeDispo ON dbo.TermeRechPhonetique (CodeDispo)
GO

CREATE  INDEX IX_Terme_LibSsAccent ON dbo.TermeRechPhonetique (Terme_LibSsAccent)
GO


CREATE TABLE [dbo].[Marqueurs]
(
  ID_PROC   int identity (1,1),
  PROC_NAME VARCHAR(100),
  COMPTEUR  INT
)
GO

-- Create/Recreate primary, unique and foreign key constraints 
alter table [dbo].[Marqueurs]
  add constraint PK_ID_PROC primary key (ID_PROC)
GO

create UNIQUE index IX_Proc_Name ON [dbo].[Marqueurs] (PROC_NAME)
GO

