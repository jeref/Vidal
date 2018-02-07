/****** Object:  Table [dbo].[CimCI]    Script Date: 18/08/2000 15:15:51 ******/
ALTER TABLE [dbo].[CimCI] WITH NOCHECK ADD 
	CONSTRAINT [PK_CimCI] PRIMARY KEY  NONCLUSTERED 
	(
		[id_CimCI]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[CimEII]    Script Date: 18/08/2000 15:15:52 ******/
/*ALTER TABLE [dbo].[CimEII] WITH NOCHECK ADD 
	CONSTRAINT [PK_CimEII] PRIMARY KEY  NONCLUSTERED 
	(
		[id_CimEII]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[CimPE]    Script Date: 18/08/2000 15:15:52 ******/
/*ALTER TABLE [dbo].[CimPE] WITH NOCHECK ADD 
	CONSTRAINT [PK_CimPE] PRIMARY KEY  NONCLUSTERED 
	(
		[id_CimPE]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[CimTermRechIndic]    Script Date: 18/08/2000 15:15:52 ******/
/*ALTER TABLE [dbo].[CimTermRechIndic] WITH NOCHECK ADD 
	CONSTRAINT [PK_CimTermRechIndic] PRIMARY KEY  NONCLUSTERED 
	(
		[id_CimTermRechIndic]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[CoupleTermeSynonyme]    Script Date: 18/08/2000 15:15:52 ******/
ALTER TABLE [dbo].[CoupleTermeSynonyme] WITH NOCHECK ADD 
	CONSTRAINT [PK_CoupleTermeSynonyme] PRIMARY KEY  NONCLUSTERED 
	(
		[id_CoupleTermeSynonyme]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[CoupleTermeTerme]    Script Date: 18/08/2000 15:15:52 ******/
ALTER TABLE [dbo].[CoupleTermeTerme] WITH NOCHECK ADD 
	CONSTRAINT [PK_CoupleTermeTerme] PRIMARY KEY  NONCLUSTERED 
	(
		[id_CoupleTermeTerme]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[FormOrigines]    Script Date: 18/08/2000 15:15:52 ******/
/*ALTER TABLE [dbo].[FormOrigines] WITH NOCHECK ADD 
	CONSTRAINT [PK_FormOrigines] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_Forme],
		[origine]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[GroupIndic]    Script Date: 18/08/2000 15:15:52 ******/
ALTER TABLE [dbo].[GroupIndic] WITH NOCHECK ADD 
	CONSTRAINT [PK_GroupIndic] PRIMARY KEY  NONCLUSTERED 
	(
		[id_GroupIndic]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[GroupIndicGroupIndic_Rel]    Script Date: 18/08/2000 15:15:52 ******/
/*ALTER TABLE [dbo].[GroupIndicGroupIndic_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_GroupIndicGroupIndic_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_GroupIndic],
		[Gro_id_GroupIndic]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[GroupIndicIndic_Rel]    Script Date: 18/08/2000 15:15:53 ******/
ALTER TABLE [dbo].[GroupIndicIndic_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_GroupIndicIndic_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_Indic],
		[id_GroupIndic]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[HierarchieCI_Rel]    Script Date: 18/08/2000 15:15:53 ******/
ALTER TABLE [dbo].[HierarchieCI_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_HierarchieCI_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_HierarchieCI_Rel]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[HierarchieEII_Rel]    Script Date: 18/08/2000 15:15:53 ******/
/*ALTER TABLE [dbo].[HierarchieEII_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_HierarchieEII_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_HierarchieEII_Rel]
	)  ON [PRIMARY] */
GO



/****** Object:  Table [dbo].[IAMClass]    Script Date: 18/08/2000 15:15:53 ******/
ALTER TABLE [dbo].[IAMClass] WITH NOCHECK ADD 
	CONSTRAINT [PK_IAMClass] PRIMARY KEY  NONCLUSTERED 
	(
		[id_IAMClasse]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[IAMClass_IAMAliment]    Script Date: 18/08/2000 15:15:53 ******/
/*ALTER TABLE [dbo].[IAMClass_IAMAliment] WITH NOCHECK ADD 
	CONSTRAINT [PK_IAMClass_IAMAliment] PRIMARY KEY  NONCLUSTERED 
	(
		[id_IAMClasse],
		[idIAMAliment]
	)  ON [PRIMARY] */
GO


/****** Object:  Table [dbo].[IAMClasse_IAMCouple]    Script Date: 18/08/2000 15:15:54 ******/
ALTER TABLE [dbo].[IAMClasse_IAMCouple] WITH NOCHECK ADD 
	CONSTRAINT [PK_IAMClasse_IAMCouple] PRIMARY KEY  NONCLUSTERED 
	(
		[id_IAMClasse],
		[id_IAMCouple]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[IAMCLassIRISCond]    Script Date: 18/08/2000 15:15:54 ******/
/*ALTER TABLE [dbo].[IAMCLassIRISCond] WITH NOCHECK ADD 
	CONSTRAINT [PK_IAMCLassIRISCond] PRIMARY KEY  NONCLUSTERED 
	(
		[id_IAMClassIRISCond]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[IAMCouple]    Script Date: 18/08/2000 15:15:54 ******/
ALTER TABLE [dbo].[IAMCouple] WITH NOCHECK ADD 
	CONSTRAINT [PK_IAMCouple] PRIMARY KEY  NONCLUSTERED 
	(
		[id_IAMCouple]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[IAMSubCond]    Script Date: 18/08/2000 15:15:54 ******/
/*ALTER TABLE [dbo].[IAMSubCond] WITH NOCHECK ADD 
	CONSTRAINT [PK_IAMSubCond] PRIMARY KEY  NONCLUSTERED 
	(
		[id_IAMSubClassChimCond]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[Indexe]    Script Date: 18/08/2000 15:15:54 ******/
/*ALTER TABLE [dbo].[Indexe] WITH NOCHECK ADD 
	CONSTRAINT [PK_Indexe] PRIMARY KEY  NONCLUSTERED 
	(
		[id_TypeIndex]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[IndexSub_Rel]    Script Date: 18/08/2000 15:15:54 ******/
ALTER TABLE [dbo].[IndexSub_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_IndexSub_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_Sub],
		[id_TypeIndex]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[IndexSy_Rel]    Script Date: 18/08/2000 15:15:54 ******/
/*ALTER TABLE [dbo].[IndexSy_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_IndexSy_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_SynonySub],
		[id_TypeIndex]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[Laboratoire]    Script Date: 18/08/2000 15:15:54 ******/
ALTER TABLE [dbo].[Laboratoire] WITH NOCHECK ADD 
	CONSTRAINT [PK_Laboratoire] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Laboratoire]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[LaboratoireEtranger]    Script Date: 18/08/2000 15:15:54 ******/
/*ALTER TABLE [dbo].[LaboratoireEtranger] WITH NOCHECK ADD 
	CONSTRAINT [PK_LaboratoireEtranger] PRIMARY KEY  NONCLUSTERED 
	(
		[id_LaboratoireEtranger]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[MeddraCI]    Script Date: 18/08/2000 15:15:55 ******/
/*ALTER TABLE [dbo].[MeddraCI] WITH NOCHECK ADD 
	CONSTRAINT [PK_MeddraCI] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_CI],
		[codeMeddra]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[MeddraEII]    Script Date: 18/08/2000 15:15:55 ******/
/*ALTER TABLE [dbo].[MeddraEII] WITH NOCHECK ADD 
	CONSTRAINT [PK_MeddraEII] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_EII],
		[codeMeddra]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[MeddraIndic]    Script Date: 18/08/2000 15:15:55 ******/
/*ALTER TABLE [dbo].[MeddraIndic] WITH NOCHECK ADD 
	CONSTRAINT [PK_MeddraIndic] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_Indic],
		[codeMeddra]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[MeddraPE]    Script Date: 18/08/2000 15:15:55 ******/
/*ALTER TABLE [dbo].[MeddraPE] WITH NOCHECK ADD 
	CONSTRAINT [PK_MeddraPE] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_PE],
		[codeMeddra]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[Medicament]    Script Date: 18/08/2000 15:15:55 ******/
/*ALTER TABLE [dbo].[Medicament] WITH NOCHECK ADD 
	CONSTRAINT [PK_Medicament] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Medicament]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[OMSEII]    Script Date: 18/08/2000 15:15:55 ******/
/*ALTER TABLE [dbo].[OMSEII] WITH NOCHECK ADD 
	CONSTRAINT [PK_OMSEII] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_EII],
		[codeOMS]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[Ph_RemplaCI]    Script Date: 18/08/2000 15:15:55 ******/
/*ALTER TABLE [dbo].[Ph_RemplaCI] WITH NOCHECK ADD 
	CONSTRAINT [PK_Ph_RemplaCI] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Ph_RemplaCI]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[Ph_RemplaEII]    Script Date: 18/08/2000 15:15:55 ******/
/*ALTER TABLE [dbo].[Ph_RemplaEII] WITH NOCHECK ADD 
	CONSTRAINT [PK_Ph_RemplaEII] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Ph_RemplaEII]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[Ph_RemplaIndic]    Script Date: 18/08/2000 15:15:55 ******/
/*ALTER TABLE [dbo].[Ph_RemplaIndic] WITH NOCHECK ADD 
	CONSTRAINT [PK_Ph_RemplaIndic] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Ph_RemplaIndic]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[Ph_RemplaPE]    Script Date: 18/08/2000 15:15:55 ******/
/*ALTER TABLE [dbo].[Ph_RemplaPE] WITH NOCHECK ADD 
	CONSTRAINT [PK_Ph_RemplaPE] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Ph_RemplaPE]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpePharmacodynamie]    Script Date: 18/08/2000 15:15:56 ******/
ALTER TABLE [dbo].[SpePharmacodynamie] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpePharmacodynamie] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[RechIndicCim_Rel]    Script Date: 18/08/2000 15:15:56 ******/
/*ALTER TABLE [dbo].[RechIndicCim_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_RechIndicCim_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_TermeRechIndic],
		[id_CimTermRechIndic]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[RemplaCI_Rel]    Script Date: 18/08/2000 15:15:56 ******/
/*ALTER TABLE [dbo].[RemplaCI_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_RemplaCI_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Ph_RemplaCI],
		[id_T_CI]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[RemplaEII_Rel]    Script Date: 18/08/2000 15:15:56 ******/
/*ALTER TABLE [dbo].[RemplaEII_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_RemplaEII_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Ph_RemplaEII],
		[id_T_EII]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[RemplaIndic_Rel]    Script Date: 18/08/2000 15:15:56 ******/
/*ALTER TABLE [dbo].[RemplaIndic_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_RemplaIndic_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Ph_RemplaIndic],
		[id_T_Indic]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[RemplaPE_Rel]    Script Date: 18/08/2000 15:15:56 ******/
/*ALTER TABLE [dbo].[RemplaPE_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_RemplaPE_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Ph_RemplaPE],
		[id_T_PE]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[RMOClass]    Script Date: 18/08/2000 15:15:56 ******/
ALTER TABLE [dbo].[RMOClass] WITH NOCHECK ADD 
	CONSTRAINT [PK_RMOClass] PRIMARY KEY  NONCLUSTERED 
	(
		[id_RMOClass]
	)  ON [PRIMARY] 
GO


/****** Object:  Table [dbo].[SpeAccessoires]    Script Date: 18/08/2000 15:15:57 ******/
/*ALTER TABLE [dbo].[SpeAccessoires] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeAccessoires] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeMateriel],
		[typeAccessoire]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeACP]    Script Date: 18/08/2000 15:15:57 ******/
/*ALTER TABLE [dbo].[SpeACP] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeACP] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite],
		[ACP]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeAutresATC]    Script Date: 18/08/2000 15:15:57 ******/
/*ALTER TABLE [dbo].[SpeAutresATC] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeAutresATC] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite],
		[ATC]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeCI]    Script Date: 18/08/2000 15:15:57 ******/
ALTER TABLE [dbo].[SpeCI] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeCI] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeCI]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[Specialite]    Script Date: 18/08/2000 15:15:58 ******/
ALTER TABLE [dbo].[Specialite] WITH NOCHECK ADD 
	CONSTRAINT [PK_Specialite] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[Specialite_ExtractibleMarche]    Script Date: 18/08/2000 15:15:58 ******/
/*ALTER TABLE [dbo].[Specialite_ExtractibleMarche] WITH NOCHECK ADD 
	CONSTRAINT [PK_Specialite_ExtractibleMarche] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[Specialite_IAMClass]    Script Date: 18/08/2000 15:15:58 ******/
ALTER TABLE [dbo].[Specialite_IAMClass] WITH NOCHECK ADD 
	CONSTRAINT [PK_Specialite_IAMClass] PRIMARY KEY  NONCLUSTERED 
	(
		[id_IAMClasse],
		[id_Specialite]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[Specialite_Medicament]    Script Date: 18/08/2000 15:15:58 ******/
/*ALTER TABLE [dbo].[Specialite_Medicament] WITH NOCHECK ADD 
	CONSTRAINT [PK_Specialite_Medicament] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite],
		[id_Medicament]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[Specialite_Substance]    Script Date: 18/08/2000 15:15:58 ******/
/*ALTER TABLE [dbo].[Specialite_Substance] WITH NOCHECK ADD 
	CONSTRAINT [PK_Specialite_Substance] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite],
		[id_Substance]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeCIExcl]    Script Date: 18/08/2000 15:15:58 ******/
/*ALTER TABLE [dbo].[SpeCIExcl] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeCIExcl] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeCI],
		[condition]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeCIFav]    Script Date: 18/08/2000 15:15:58 ******/
/*ALTER TABLE [dbo].[SpeCIFav] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeCIFav] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeCI],
		[condition]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeCinetQuantit]    Script Date: 18/08/2000 15:15:58 ******/
/*ALTER TABLE [dbo].[SpeCinetQuantit] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeCinetQuantit] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpePharmacoCinet]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeClassIRIS]    Script Date: 18/08/2000 15:16:04 ******/
ALTER TABLE [dbo].[SpeClassIRIS] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeClassIRIS] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite],
		[id_DicoComClassIRIS]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[SpeCompo]    Script Date: 18/08/2000 15:15:58 ******/
ALTER TABLE [dbo].[SpeCompo] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeCompo] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeCompo]
	)  ON [PRIMARY] 
GO


/****** Object:  Table [dbo].[SpeConditionnementPrimaire]    Script Date: 18/08/2000 15:15:59 ******/
ALTER TABLE [dbo].[SpeConditionnementPrimaire] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeConditionnementPrimaire] PRIMARY KEY  NONCLUSTERED 
	(
		[id_PresConditionnement],[id_produit]
	)  ON [PRIMARY] 
GO


/****** Object:  Table [dbo].[SpeConstituant]    Script Date: 18/08/2000 15:15:59 ******/
ALTER TABLE [dbo].[SpeConstituant] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeConstituant] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeConstituant]
	)  ON [PRIMARY] 
GO



/****** Object:  Table [dbo].[SpeEII]    Script Date: 18/08/2000 15:15:59 ******/
/*ALTER TABLE [dbo].[SpeEII] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeEII] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeEII]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeEIIExcl]    Script Date: 18/08/2000 15:16:00 ******/
/*ALTER TABLE [dbo].[SpeEIIExcl] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeEIIExcl] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeEII],
		[cond]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeEIIFav]    Script Date: 18/08/2000 15:16:00 ******/
/*ALTER TABLE [dbo].[SpeEIIFav] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeEIIFav] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeEII],
		[cond]
	)  ON [PRIMARY] */
GO


/****** Object:  Table [dbo].[SpeEvt]    Script Date: 18/08/2000 15:16:00 ******/
ALTER TABLE [dbo].[SpeEvt] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeEvt] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeEvt]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[SpeEvtPresentation]    Script Date: 18/08/2000 15:16:00 ******/
ALTER TABLE [dbo].[SpeEvtPresentation] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeEvtPresentation] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeEvtPresentation]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[SpeExam]    Script Date: 18/08/2000 15:16:00 ******/
/*ALTER TABLE [dbo].[SpeExam] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeExam] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeExam]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeExamMethode]    Script Date: 18/08/2000 15:16:00 ******/
/*ALTER TABLE [dbo].[SpeExamMethode] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeExamMethode] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeExam],
		[methode]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeGerme]    Script Date: 18/08/2000 15:16:00 ******/
/*ALTER TABLE [dbo].[SpeGerme] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeGerme] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeGerme]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeGrosAllait]    Script Date: 18/08/2000 15:16:00 ******/
/*ALTER TABLE [dbo].[SpeGrosAllait] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeGrosAllait] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeGrosAllait]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeIncompatible]    Script Date: 18/08/2000 15:16:01 ******/
/*ALTER TABLE [dbo].[SpeIncompatible] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeIncompatible] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeIndic]    Script Date: 18/08/2000 15:16:01 ******/
ALTER TABLE [dbo].[SpeIndic] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeIndic] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeIndic]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[SpeIndicAMM]    Script Date: 18/08/2000 15:16:01 ******/
/*ALTER TABLE [dbo].[SpeIndicAMM] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeIndicAMM] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeIndic_SpeCI]    Script Date: 18/08/2000 15:16:01 ******/
/*ALTER TABLE [dbo].[SpeIndic_SpeCI] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeIndic_SpeCI] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeIndic],
		[id_SpeCI]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeIndic_SpeGrosAllait]    Script Date: 18/08/2000 15:16:01 ******/
/*ALTER TABLE [dbo].[SpeIndic_SpeGrosAllait] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeIndic_SpeGrosAllait] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeIndic],
		[id_SpeGrosAllait]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeIndic_SpeMeg]    Script Date: 18/08/2000 15:16:01 ******/
/*ALTER TABLE [dbo].[SpeIndic_SpeMeg] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeIndic_SpeMeg] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeIndic],
		[id_SpeMeg]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeIndic_SpePE]    Script Date: 18/08/2000 15:16:01 ******/
/*ALTER TABLE [dbo].[SpeIndic_SpePE] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeIndic_SpePE] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeIndic],
		[id_SpePE]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeIndicExcl]    Script Date: 18/08/2000 15:16:01 ******/
/*ALTER TABLE [dbo].[SpeIndicExcl] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeIndicExcl] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeIndic],
		[condition]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeIndicFav]    Script Date: 18/08/2000 15:16:01 ******/
/*ALTER TABLE [dbo].[SpeIndicFav] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeIndicFav] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeIndic],
		[condition]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeLabs_Rel]    Script Date: 18/08/2000 15:16:01 ******/
ALTER TABLE [dbo].[SpeLabs_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeLabs_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite],
		[id_Laboratoire]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[SpeMateriel]    Script Date: 18/08/2000 15:16:02 ******/
/*ALTER TABLE [dbo].[SpeMateriel] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeMateriel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeMateriel]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeMeg]    Script Date: 18/08/2000 15:16:02 ******/
/*ALTER TABLE [dbo].[SpeMeg] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeMeg] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeMeg]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeMegExcl]    Script Date: 18/08/2000 15:16:02 ******/
/*ALTER TABLE [dbo].[SpeMegExcl] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeMegExcl] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeMeg],
		[condition]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeMegFav]    Script Date: 18/08/2000 15:16:02 ******/
/*ALTER TABLE [dbo].[SpeMegFav] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeMegFav] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeMeg],
		[condition]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpePE]    Script Date: 18/08/2000 15:16:02 ******/
ALTER TABLE [dbo].[SpePE] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpePE] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpePE]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[SpePEExcl]    Script Date: 18/08/2000 15:16:02 ******/
/*ALTER TABLE [dbo].[SpePEExcl] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpePEExcl] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpePE],
		[condition]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpePEFav]    Script Date: 18/08/2000 15:16:02 ******/
/*ALTER TABLE [dbo].[SpePEFav] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpePEFav] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpePE],
		[condition]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpePharmacoCinet]    Script Date: 18/08/2000 15:16:02 ******/
/*ALTER TABLE [dbo].[SpePharmacoCinet] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpePharmacoCinet] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpePharmacoCinet]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpePharmacoCinet_SpeConstituan]    Script Date: 18/08/2000 15:16:02 ******/
/*ALTER TABLE [dbo].[SpePharmacoCinet_SpeConstituan] WITH NOCHECK ADD 
	CONSTRAINT [PK_PharmacoCinet_Constituan] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpePharmacoCinet],
		[id_SpeConstituant]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpePoso]    Script Date: 18/08/2000 15:16:02 ******/
ALTER TABLE [dbo].[SpePoso] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpePoso] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpePoso]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[SpePosoIndic]    Script Date: 18/08/2000 15:16:03 ******/
ALTER TABLE [dbo].[SpePosoIndic] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpePosoIndic] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpePoso],
		[id_SpeIndic]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[SpePosoVoie]    Script Date: 18/08/2000 15:16:03 ******/
/*ALTER TABLE [dbo].[SpePosoVoie] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpePosoVoie] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpePoso],
		[voie]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpePresentation]    Script Date: 18/08/2000 15:16:03 ******/

ALTER TABLE [dbo].[SpePresentation] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpePresentation] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpePresentation]
	)  ON [PRIMARY] 

GO

/****** Object:  Table [dbo].[SpePresentation_DateMaxEvMarche]    Script Date: 18/08/2000 15:16:03 ******/
/*ALTER TABLE [dbo].[SpePresentation_DateMaxEvMarche] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpePresentation_DateMaxEvMarche] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpePresentation]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpePresentation_DernierEvMarche]    Script Date: 18/08/2000 15:16:03 ******/

/*ALTER TABLE [dbo].[SpePresentation_DernierEvMarche] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpePresentation_DernierEvMarche] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpePresentation]
	)  ON [PRIMARY] */
GO



/****** Object:  Table [dbo].[SpeReferantGener]    Script Date: 18/08/2000 15:16:03 ******/
/*ALTER TABLE [dbo].[SpeReferantGener] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeReferantGener] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeSecuPreClin]    Script Date: 18/08/2000 15:16:03 ******/
/*ALTER TABLE [dbo].[SpeSecuPreClin] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeSecuPreClin] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeSignSdComm]    Script Date: 18/08/2000 15:16:03 ******/
/*ALTER TABLE [dbo].[SpeSignSdComm] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeSignSdComm] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite],
		[terme]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeSousConstituant]    Script Date: 18/08/2000 15:16:04 ******/
/*ALTER TABLE [dbo].[SpeSousConstituant] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeSousConstituant] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeSousConstituant]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeSpectre]    Script Date: 18/08/2000 15:16:04 ******/
/*ALTER TABLE [dbo].[SpeSpectre] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeSpectre] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeSpectre]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeSuiviSGML]    Script Date: 18/08/2000 15:16:04 ******/
ALTER TABLE [dbo].[SpeSuiviSGML] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeSuiviSGML] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeSuiviSGML]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[SpeSurdosage]    Script Date: 18/08/2000 15:16:04 ******/
/*ALTER TABLE [dbo].[SpeSurdosage] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeSurdosage] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeTetConst]    Script Date: 18/08/2000 15:16:04 ******/
/*ALTER TABLE [dbo].[SpeTetConst] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeTetConst] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeConstituant],
		[id_Tetiere]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeTetSousConst]    Script Date: 18/08/2000 15:16:04 ******/
/*ALTER TABLE [dbo].[SpeTetSousConst] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeTetSousConst] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SpeSousConstituant],
		[id_Tetiere]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeVigi]    Script Date: 18/08/2000 15:16:04 ******/
/*ALTER TABLE [dbo].[SpeVigi] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeVigi] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SpeVoie]    Script Date: 18/08/2000 15:16:04 ******/
ALTER TABLE [dbo].[SpeVoie] WITH NOCHECK ADD 
	CONSTRAINT [PK_SpeVoie] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Specialite],
		[voie]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[Sub_T_ClassChim]    Script Date: 18/08/2000 15:16:04 ******/
/*ALTER TABLE [dbo].[Sub_T_ClassChim] WITH NOCHECK ADD 
	CONSTRAINT [PK_Sub_T_ClassChim] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Substance],
		[id_T_ClassChim]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubATC]    Script Date: 18/08/2000 15:16:05 ******/
/*ALTER TABLE [dbo].[SubATC] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubATC] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Substance],
		[terme]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubBiblio]    Script Date: 18/08/2000 15:16:05 ******/
/*ALTER TABLE [dbo].[SubBiblio] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubBiblio] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Substance]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubCI]    Script Date: 18/08/2000 15:16:05 ******/
/*ALTER TABLE [dbo].[SubCI] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubCI] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubCI]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubCIExcl]    Script Date: 18/08/2000 15:16:05 ******/
/*ALTER TABLE [dbo].[SubCIExcl] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubCIExcl] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubCI],
		[condition]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubCIFav]    Script Date: 18/08/2000 15:16:05 ******/
/*ALTER TABLE [dbo].[SubCIFav] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubCIFav] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubCI],
		[condition]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubCinetQuantit]    Script Date: 18/08/2000 15:16:05 ******/
/*ALTER TABLE [dbo].[SubCinetQuantit] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubCinetQuantit] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubCinetQuantit]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubClassIRIS]    Script Date: 18/08/2000 15:16:05 ******/
/*ALTER TABLE [dbo].[SubClassIRIS] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubClassIRIS] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Substance],
		[terme]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubDepen]    Script Date: 18/08/2000 15:16:05 ******/
/*ALTER TABLE [dbo].[SubDepen] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubDepen] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Substance]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubEffet]    Script Date: 18/08/2000 15:16:05 ******/
/*ALTER TABLE [dbo].[SubEffet] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubEffet] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubEffet]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubEII]    Script Date: 18/08/2000 15:16:05 ******/
/*ALTER TABLE [dbo].[SubEII] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubEII] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubEII]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubEIIExcl]    Script Date: 18/08/2000 15:16:06 ******/
/*ALTER TABLE [dbo].[SubEIIExcl] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubEIIExcl] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubEII],
		[condition]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubEIIFav]    Script Date: 18/08/2000 15:16:06 ******/
/*ALTER TABLE [dbo].[SubEIIFav] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubEIIFav] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubEII],
		[condition]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubEvt]    Script Date: 18/08/2000 15:16:06 ******/
/*ALTER TABLE [dbo].[SubEvt] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubEvt] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubEvt]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubExam]    Script Date: 18/08/2000 15:16:06 ******/
/*ALTER TABLE [dbo].[SubExam] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubExam] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubExam]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubExamMethode]    Script Date: 18/08/2000 15:16:06 ******/
/*ALTER TABLE [dbo].[SubExamMethode] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubExamMethode] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubExam],
		[methode]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubGrosDescAllait]    Script Date: 18/08/2000 15:16:06 ******/
/*ALTER TABLE [dbo].[SubGrosDescAllait] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubGrosDescAllait] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubGrosDescAllait]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubIncompatible]    Script Date: 18/08/2000 15:16:06 ******/
/*ALTER TABLE [dbo].[SubIncompatible] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubIncompatible] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Substance]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubIndic]    Script Date: 18/08/2000 15:16:06 ******/
/*ALTER TABLE [dbo].[SubIndic] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubIndic] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubIndic]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubIndicExcl]    Script Date: 18/08/2000 15:16:06 ******/
/*ALTER TABLE [dbo].[SubIndicExcl] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubIndicExcl] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubIndic],
		[condition]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubIndicFav]    Script Date: 18/08/2000 15:16:07 ******/
/*ALTER TABLE [dbo].[SubIndicFav] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubIndicFav] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubIndic],
		[condition]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubPE]    Script Date: 18/08/2000 15:16:07 ******/
ALTER TABLE [dbo].[SubPE] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubPE] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubPE]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[SubPEExcl]    Script Date: 18/08/2000 15:16:07 ******/
/*ALTER TABLE [dbo].[SubPEExcl] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubPEExcl] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubPE],
		[condition]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubPEFav]    Script Date: 18/08/2000 15:16:07 ******/
/*ALTER TABLE [dbo].[SubPEFav] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubPEFav] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubPE],
		[condition]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubPharmacoCinet]    Script Date: 18/08/2000 15:16:07 ******/
/*ALTER TABLE [dbo].[SubPharmacoCinet] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubPharmacoCinet] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Substance]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubPharmacoDynamie]    Script Date: 18/08/2000 15:16:07 ******/
/*ALTER TABLE [dbo].[SubPharmacoDynamie] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubPharmacoDynamie] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubPharmacoDynamie]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubPoso]    Script Date: 18/08/2000 15:16:07 ******/
/*ALTER TABLE [dbo].[SubPoso] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubPoso] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Substance]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubPosoStruc]    Script Date: 18/08/2000 15:16:07 ******/
/*ALTER TABLE [dbo].[SubPosoStruc] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubPosoStruc] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubPosoStruc]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubPropPharmaco]    Script Date: 18/08/2000 15:16:07 ******/
/*ALTER TABLE [dbo].[SubPropPharmaco] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubPropPharmaco] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SubPropPharmaco]
	)  ON [PRIMARY] */
GO


/****** Object:  Table [dbo].[Substance]    Script Date: 18/08/2000 15:16:08 ******/
ALTER TABLE [dbo].[Substance] WITH NOCHECK ADD 
	CONSTRAINT [PK_Substance] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Substance]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[SubSurdosage]    Script Date: 18/08/2000 15:16:08 ******/
/*ALTER TABLE [dbo].[SubSurdosage] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubSurdosage] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Substance]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SubVoie]    Script Date: 18/08/2000 15:16:08 ******/
/*ALTER TABLE [dbo].[SubVoie] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubVoie] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Substance],
		[voie]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SynonyCI_Rel]    Script Date: 18/08/2000 15:16:08 ******/
ALTER TABLE [dbo].[SynonyCI_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_SynonyCI_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_SynonyCI],
		[id_T_CI]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[SynonyClassChim_Rel]    Script Date: 18/08/2000 15:16:08 ******/
/*ALTER TABLE [dbo].[SynonyClassChim_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_SynonyClassChim_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_SynonyClassChim],
		[id_T_ClassChim]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SynonyEII_Rel]    Script Date: 18/08/2000 15:16:08 ******/
/*ALTER TABLE [dbo].[SynonyEII_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_SynonyEII_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_SynonyEII],
		[id_T_EII]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SynonyIndic_Rel]    Script Date: 18/08/2000 15:16:08 ******/
ALTER TABLE [dbo].[SynonyIndic_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_SynonyIndic_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_SynonyIndic],
		[id_T_Indic]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[SynonyPE_Rel]    Script Date: 18/08/2000 15:16:08 ******/
/*ALTER TABLE [dbo].[SynonyPE_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_SynonyPE_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_SynonyPE],
		[id_T_PE]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SynonyTermeRech]    Script Date: 18/08/2000 15:16:09 ******/
/*ALTER TABLE [dbo].[SynonyTermeRech] WITH NOCHECK ADD 
	CONSTRAINT [PK_SynonyTermeRech] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SynonyTermeRech]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[SynonyTermeRech_TermeRechIndic]    Script Date: 18/08/2000 15:16:09 ******/
/*ALTER TABLE [dbo].[SynonyTermeRech_TermeRechIndic] WITH NOCHECK ADD 
	CONSTRAINT [PK_SyTermeRech_TrmRchIndic] PRIMARY KEY  NONCLUSTERED 
	(
		[id_SynonyTermeRech],
		[id_TermeRechIndic]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[T_CI]    Script Date: 18/08/2000 15:16:09 ******/
ALTER TABLE [dbo].[T_CI] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_CI] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_CI]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[T_CI_CIMCI_Rel]    Script Date: 18/08/2000 15:16:09 ******/
ALTER TABLE [dbo].[T_CI_CIMCI_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_CI_CIMCI_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_CI],
		[id_CimCI]
	)  ON [PRIMARY]
GO

/****** Object:  Table [dbo].[T_ClassChim]    Script Date: 18/08/2000 15:16:09 ******/
/*ALTER TABLE [dbo].[T_ClassChim] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_ClassChim] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_ClassChim]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[T_EII]    Script Date: 18/08/2000 15:16:09 ******/
/*ALTER TABLE [dbo].[T_EII] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_EII] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_EII]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[T_EII_CimEII_Rel]    Script Date: 18/08/2000 15:16:09 ******/
/*ALTER TABLE [dbo].[T_EII_CimEII_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_EII_CimEII_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_EII],
		[id_CimEII]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[T_Forme]    Script Date: 18/08/2000 15:16:09 ******/
/*ALTER TABLE [dbo].[T_Forme] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_Forme] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_Forme]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[T_Indic]    Script Date: 18/08/2000 15:16:09 ******/
ALTER TABLE [dbo].[T_Indic] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_Indic] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_Indic]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[T_PE]    Script Date: 18/08/2000 15:16:10 ******/
/*ALTER TABLE [dbo].[T_PE] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_PE] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_PE]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[T_PE_CimPE_Rel]    Script Date: 18/08/2000 15:16:10 ******/
/*ALTER TABLE [dbo].[T_PE_CimPE_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_PE_CimPE_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_CimPE],
		[id_T_PE]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[T_Sub]    Script Date: 18/08/2000 15:16:10 ******/
ALTER TABLE [dbo].[T_Sub] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_Sub] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_Sub]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[T_SynonyCI]    Script Date: 18/08/2000 15:16:10 ******/
ALTER TABLE [dbo].[T_SynonyCI] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_SynonyCI] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_SynonyCI]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[T_SynonyClassChim]    Script Date: 18/08/2000 15:16:10 ******/
/*ALTER TABLE [dbo].[T_SynonyClassChim] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_SynonyClassChim] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_SynonyClassChim]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[T_SynonyEII]    Script Date: 18/08/2000 15:16:10 ******/
/*ALTER TABLE [dbo].[T_SynonyEII] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_SynonyEII] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_SynonyEII]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[T_SynonyIndic]    Script Date: 18/08/2000 15:16:10 ******/
ALTER TABLE [dbo].[T_SynonyIndic] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_SynonyIndic] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_SynonyIndic]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[T_SynonyPE]    Script Date: 18/08/2000 15:16:10 ******/
/*ALTER TABLE [dbo].[T_SynonyPE] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_SynonyPE] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_SynonyPE]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[T_SynonySub]    Script Date: 18/08/2000 15:16:10 ******/
ALTER TABLE [dbo].[T_SynonySub] WITH NOCHECK ADD 
	CONSTRAINT [PK_T_SynonySub] PRIMARY KEY  NONCLUSTERED 
	(
		[id_T_SynonySub]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[TermeRechGroupIndic_Rel]    Script Date: 18/08/2000 15:16:10 ******/
/*ALTER TABLE [dbo].[TermeRechGroupIndic_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_TermeRechGroupIndic_Rel] PRIMARY KEY  NONCLUSTERED 
	(
		[id_GroupIndic],
		[id_TermeRechIndic]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[TermeRechIndic]    Script Date: 18/08/2000 15:16:11 ******/
/*ALTER TABLE [dbo].[TermeRechIndic] WITH NOCHECK ADD 
	CONSTRAINT [PK_TermeRechIndic] PRIMARY KEY  NONCLUSTERED 
	(
		[id_TermeRechIndic]
	)  ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[Tetiere]    Script Date: 18/08/2000 15:16:11 ******/
/*ALTER TABLE [dbo].[Tetiere] WITH NOCHECK ADD 
	CONSTRAINT [PK_Tetiere] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Tetiere]
	)  ON [PRIMARY] */
GO



ALTER TABLE [dbo].[GroupIndic_DicoRF_CIM_Rel] WITH NOCHECK ADD 
	CONSTRAINT [PK_GroupIndic_DicoRF_CIM_Rel] PRIMARY KEY  CLUSTERED 
	(
		[id_GroupIndic],
		[id_DicoRF_CIM]
	)  ON [PRIMARY] 
GO

/****** Object:  Table [dbo].[PresPrise]    Script Date: 18/08/2000 15:15:52 ******/
/*ALTER TABLE [dbo].[PresPrise] WITH NOCHECK ADD 
	CONSTRAINT [PK_PresPrise] PRIMARY KEY  NONCLUSTERED 
	(
		[id_Presentation],
	 	[libelle]
	)  ON [PRIMARY] */
GO
