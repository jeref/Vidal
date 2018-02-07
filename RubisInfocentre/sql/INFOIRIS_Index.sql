/************************************************************************************/
/*  Creation yb du 31/10/03         */
/*   Ajout indexes                                                                  */
/*     IX_id_T_Sub_F, IX_id_T_Sub_P sur COUPLETERMETERME                            */
/*     IX_Laboratoire sur LABOSAUMON                                                */
/*     IX_id_Specialite sur specompo                                                */
/*     IX_denomsub, IX_id_SpeCompo sur speconstituant                               */
/*     IX_RMC_CLE_TYPE_IDE sur RMC_CLE (TYPE_IDE, CLE_LIB, CLE_IDE)                 */
/*     IX_ID_RMC_THE sur RMC_THE                                                    */
/*     IX_idTypeSpe, IX_denomSpe sur SPECIALITE                                     */
/*     IX_id_IAMClasse sur SPECIALITE_IAMCLASS                                      */
/*     IX_id_SpePresentation sur SPEEVTPRESENTATION                                 */
/*     IX_id_DicoComClassIRIS sur speindic                                          */
/*     IX_id_Laboratoire sur spelabs_rel(Id_laboratoire)                            */
/*     IX_id_Specialite, IX_cip, IX_ucd, IX_cipReferant sur SPEPRESENTATION         */
/*                                                                                  */
/************************************************************************************/



CREATE  INDEX IX_id_T_Sub_F ON dbo.T_Sub_Parent (id_T_Sub_F)
GO

CREATE  INDEX IX_id_T_Sub_P ON dbo.T_Sub_Parent (id_T_Sub_P)
GO

CREATE  INDEX IX_Libelle ON dbo.T_Sub (Libelle)
GO

CREATE INDEX IX_id_T_Sub_F on dbo.COUPLETERMETERME (ID_T_SUB_F)
GO

CREATE INDEX IX_id_T_Sub_P on dbo.COUPLETERMETERME (ID_T_SUB_P)
GO

CREATE INDEX IX_Laboratoire on dbo.LABOSAUMON (LABORATOIRE asc)
GO

CREATE INDEX IX_id_Specialite on dbo.specompo(id_specialite)
GO

CREATE INDEX IX_denomsub on dbo.speconstituant(denomsub)
GO

CREATE INDEX IX_id_SpeCompo on dbo.speconstituant(id_specompo)
GO

CREATE INDEX IX_RMC_CLE_TYPE_IDE on dbo.RMC_CLE (TYPE_IDE, CLE_LIB, CLE_IDE)
GO

CREATE INDEX IX_ID_RMC_THE on dbo.RMC_THE (ID)
GO

CREATE INDEX IX_idTypeSpe on dbo.SPECIALITE (idtypespe)
GO

CREATE INDEX IX_denomSpe on dbo.SPECIALITE (denomspe)
GO

CREATE INDEX IX_denomSpe_Type on dbo.SPECIALITE (idtypeSpe,denomspe)
GO

CREATE INDEX IX_id_IAMClasse on dbo.SPECIALITE_IAMCLASS(ID_IAMCLASSE)
GO

CREATE INDEX IX_id_SpePresentation on dbo.SPEEVTPRESENTATION(ID_SPEPRESENTATION)
GO

CREATE INDEX IX_id_DicoComClassIRIS on dbo.speindic(Id_dicocomclassiris)
GO

CREATE INDEX IX_id_Laboratoire on dbo.spelabs_rel(Id_laboratoire)
GO

CREATE INDEX IX_id_Specialite on dbo.spepresentation(ID_SPECIALITE)
GO

CREATE INDEX IX_cip on dbo.SPEPRESENTATION (CIP)
GO

CREATE INDEX IX_ucd on dbo.SPEPRESENTATION (UCD)
GO


CREATE INDEX IX_CodeATC on dbo.DicoT_ATC_IRIS (CodeATC)
GO

CREATE INDEX IX_LibATC on dbo.DicoT_ATC_IRIS (LibATC)
GO

CREATE INDEX IX_CodeATC on dbo.SpePharmacodynamie (CodeATC)
GO

CREATE INDEX IX_LibATC on dbo.SpePharmacodynamie (LibATC)
GO

--CREATE INDEX IX_CodeATC on dbo.SpeAutresATC (CodeATC)
GO

--CREATE INDEX IX_LibATC on dbo.SpeAutresATC (LibATC)
GO

--CREATE INDEX IX_CodeATC on dbo.SubATC (CodeATC)
GO

--CREATE INDEX IX_LibATC on dbo.SubATC (LibATC)
GO


CREATE INDEX IX_ID_PRESENTATION on dbo.SpeConditionnementPrimaire (id_SpePresentation)
GO

CREATE INDEX IX_LIBELLE on dbo.DicoCodeGene (Libelle)
GO

CREATE INDEX IX_cipReferant on dbo.SPEPRESENTATION (CIPREFERANT)
GO


ALTER TABLE [dbo].[UCD] WITH NOCHECK ADD 
	CONSTRAINT [PK_UCD] PRIMARY KEY  NONCLUSTERED 
	(
		[id_ucd]
	)  ON [PRIMARY] 
GO

 CREATE  INDEX [IX_Code_Ucd] ON [dbo].[UCD]([Code_Ucd]) ON [PRIMARY]
GO

 CREATE  INDEX [IX_Code_Cip] ON [dbo].[UCD]([Code_Cip]) ON [PRIMARY]
GO


/* alter table Substance_Etendue
    add constraint FK_SUBSTANCE_SUBSTANCE_ETENDUE foreign key  (ID_SUBSTANCE)
       references Substance (id_Substance) */
-- CREATE  UNIQUE  INDEX [Unicite_libelleAnglais] ON [dbo].[T_SUB_Etendue]([libelleAnglais]) ON [PRIMARY]
GO

-- CREATE  UNIQUE  INDEX [Unicite_libelleFrancais] ON [dbo].[T_SUB_Etendue]([LibelleFrancais]) ON [PRIMARY]
GO

/*
 CREATE  UNIQUE  INDEX [Unicite_matricule] ON [dbo].[T_SUB_Etendue]([Matricule]) ON [PRIMARY]
*/

GO
