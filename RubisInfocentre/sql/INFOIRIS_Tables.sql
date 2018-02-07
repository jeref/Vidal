/*******************************************************************/
/*  Modification du 05 decembre 02 :                               */
/*  - Ajout du champ GroupeDC à la table Spécialité                */
/*  Modification SL du 11 decembre 02 :                            */
/*  - Ajout du champ id_DicoCodeGene à SpePresentation             */
/*  Modification SL du 19/12/02 :                                  */
/*  - Suppression des tables GroupeDCI et SpeGroupeDCI             */
/*  Modification SL du 27/02/03 :                                  */
/*  - Ajout du champ Disponibilite à SpePresentation               */
/*  - Ajout du champ DateCreation à DicoSpeEvenement               */
/*  - Ajout du champ Vignette à Laboratoire                        */
/*  - Ajout du champ ClassDopant à Substance                       */
/*  - Ajout du champ id_T_Sub à Substance                          */
/*  - Ajout du champ bDopant à Specialite                          */
/*  Modification SL du 20/03/03 :                                  */
/*  - Suppression de la table SpePresentationReferantGenerique     */
/*  - Ajout du champ NbPrise à SpePresentation                     */
/*  - Ajout du champ PriseUnitaire à SpePresentation               */
/*  - Ajout du champ CodeATC à DicoT_ATC_IRIS, SubATC,             */
/*                   SpePharmacodynamie et SpeAutresATC            */
/*  - Ajout du champ LibATC à DicoT_ATC_IRIS, SubATC,              */
/*                   SpePharmacodynamie et SpeAutresATC            */
/*  Modification SL du 11/05/04					   */
/*  - Ajout du champ CodeDispo a SpePresentation		   */
/*                                                                 */
/*******************************************************************/


/****** Object:  Table [dbo].[CimCI]    Script Date: 27/10/2000 10:10:44 ******/
CREATE TABLE [dbo].[CimCI] (
	[id_CimCI] [T_COMPTEUR] NOT NULL ,
	[codeCim] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CimEII]    Script Date: 27/10/2000 10:10:44 ******/
/*CREATE TABLE [dbo].[CimEII] (
	[id_CimEII] [T_COMPTEUR] NOT NULL ,
	[codeCim] [T_TEXTE_LONG] NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[CimPE]    Script Date: 27/10/2000 10:10:45 ******/
/*CREATE TABLE [dbo].[CimPE] (
	[id_CimPE] [T_COMPTEUR] NOT NULL ,
	[codeCim] [T_TEXTE_LONG] NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[CimTermRechIndic]    Script Date: 27/10/2000 10:10:45 ******/
/*CREATE TABLE [dbo].[CimTermRechIndic] (
	[id_CimTermRechIndic] [T_COMPTEUR] NOT NULL ,
	[codeCim] [T_TEXTE_LONG] NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[CoupleTermeSynonyme]    Script Date: 27/10/2000 10:10:45 ******/
CREATE TABLE [dbo].[CoupleTermeSynonyme] (
	[id_CoupleTermeSynonyme] [T_COMPTEUR]  NOT NULL ,
	[id_T_Sub] [T_COMPTEUR] NOT NULL ,
	[id_T_SynonySub] [T_COMPTEUR] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CoupleTermeTerme]    Script Date: 27/10/2000 10:10:45 ******/
CREATE TABLE [dbo].[CoupleTermeTerme] (
	[id_CoupleTermeTerme] [T_COMPTEUR]  NOT NULL ,
	[id_T_Sub_F] [T_COMPTEUR] NOT NULL ,
	[id_T_Sub_P] [T_COMPTEUR] NOT NULL ,
	[subPostFixeIndex] [T_COMPTEUR] NULL ,
	[texte] [T_MEMO] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FormOrigines]    Script Date: 27/10/2000 10:10:45 ******/
/*CREATE TABLE [dbo].[FormOrigines] (
	[id_T_Forme] [T_COMPTEUR] NOT NULL ,
	[origine] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[GroupIndic]    Script Date: 27/10/2000 10:10:45 ******/
CREATE TABLE [dbo].[GroupIndic] (
	[id_GroupIndic] [T_COMPTEUR] NOT NULL ,
	[libelle] [T_LIBELLE_100] NOT NULL ,
	[type] [T_TEXTE_LONG] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[GroupIndicGroupIndic_Rel]    Script Date: 27/10/2000 10:10:45 ******/
/*CREATE TABLE [dbo].[GroupIndicGroupIndic_Rel] (
	[id_GroupIndic] [T_COMPTEUR] NOT NULL ,
	[Gro_id_GroupIndic] [T_COMPTEUR] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[GroupIndicIndic_Rel]    Script Date: 27/10/2000 10:10:45 ******/
CREATE TABLE [dbo].[GroupIndicIndic_Rel] (
	[id_T_Indic] [T_COMPTEUR] NOT NULL ,
	[id_GroupIndic] [T_COMPTEUR] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[HierarchieCI_Rel]    Script Date: 27/10/2000 10:10:45 ******/
CREATE TABLE [dbo].[HierarchieCI_Rel] (
	[id_HierarchieCI_Rel] [T_COMPTEUR]  NOT NULL ,
	[id_T_CI_F] [T_COMPTEUR] NOT NULL ,
	[id_T_CI_P] [T_COMPTEUR] NOT NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[HierarchieEII_Rel]    Script Date: 27/10/2000 10:10:46 ******/
/*CREATE TABLE [dbo].[HierarchieEII_Rel] (
	[id_HierarchieEII_Rel] [T_COMPTEUR]  NOT NULL ,
	[id_T_EII_F] [T_COMPTEUR] NOT NULL ,
	[id_T_EII_P] [T_COMPTEUR] NOT NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY]*/
GO



/****** Object:  Table [dbo].[IAMClass]    Script Date: 27/10/2000 10:10:46 ******/
CREATE TABLE [dbo].[IAMClass] (
	[id_IAMClasse] [T_COMPTEUR]  NOT NULL ,
	[classe] [T_libelle65] NOT NULL ,
	[definition] [T_MEMO] NOT NULL ,
	[remarque] [T_TEXTE_LONG] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[dRevis] [T_DATE_SYST] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[IAMClass_IAMAliment]    Script Date: 27/10/2000 10:10:46 ******/
/*CREATE TABLE [dbo].[IAMClass_IAMAliment] (
	[id_IAMClasse] [T_COMPTEUR] NOT NULL ,
	[idIAMAliment] [T_COMPTEUR] NOT NULL 
) ON [PRIMARY]*/
GO


/****** Object:  Table [dbo].[IAMClasse_IAMCouple]    Script Date: 27/10/2000 10:10:46 ******/
CREATE TABLE [dbo].[IAMClasse_IAMCouple] (
	[id_IAMClasse] [T_COMPTEUR] NOT NULL ,
	[id_IAMCouple] [T_COMPTEUR] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[IAMCLassIRISCond]    Script Date: 27/10/2000 10:10:47 ******/
/*CREATE TABLE [dbo].[IAMCLassIRISCond] (
	[id_IAMClasse] [T_COMPTEUR] NOT NULL ,
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_IAMClassIRISCond] [T_COMPTEUR] NOT NULL ,
	[voie] [T_TEXTE_LONG] NULL ,
	[dosageParUniteTemps] [T_OVP_FLOAT] NULL ,
	[uniteDosage] [T_TEXTE_LONG] NULL ,
	[uniteTemps] [T_TEXTE_LONG] NULL ,
	[supInf] [T_BOOLEEN] NOT NULL ,
	[classementIRIS] [T_TEXTE_LONG] NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[IAMCouple]    Script Date: 27/10/2000 10:10:47 ******/
CREATE TABLE [dbo].[IAMCouple] (
	[id_IAMCouple] [T_COMPTEUR] NOT NULL ,
	[niveauGravite] [T_TEXTE_LONG] NULL ,
	[RisqEtMecan] [T_TEXTE_LONG] NOT NULL ,
	[conduiteATenir] [T_TEXTE_LONG] NULL ,
	[remarque] [T_TEXTE_LONG] NULL ,
	[dispensateur] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[dRevis] [T_DATE_SYST] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[IAMSubCond]    Script Date: 27/10/2000 10:10:47 ******/
/*CREATE TABLE [dbo].[IAMSubCond] (
	[id_IAMClasse] [T_COMPTEUR] NOT NULL ,
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[id_IAMSubClassChimCond] [T_COMPTEUR] NOT NULL ,
	[voie] [T_TEXTE_LONG] NULL ,
	[dosageParUniteTemps] [T_OVP_FLOAT] NULL ,
	[uniteDosage] [T_TEXTE_LONG] NULL ,
	[uniteTemps] [T_TEXTE_LONG] NULL ,
	[supInf] [T_BOOLEEN] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[Indexe]    Script Date: 27/10/2000 10:10:47 ******/
/*CREATE TABLE [dbo].[Indexe] (
	[id_TypeIndex] [T_COMPTEUR]  NOT NULL ,
	[libelle] [T_libelle30] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[IndexSub_Rel]    Script Date: 27/10/2000 10:10:47 ******/
CREATE TABLE [dbo].[IndexSub_Rel] (
	[id_T_Sub] [T_COMPTEUR] NOT NULL ,
	[id_TypeIndex] [T_COMPTEUR] NOT NULL ,
	[texte] [T_MEMO] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[IndexSy_Rel]    Script Date: 27/10/2000 10:10:47 ******/
/*CREATE TABLE [dbo].[IndexSy_Rel] (
	[id_T_SynonySub] [T_COMPTEUR] NOT NULL ,
	[id_TypeIndex] [T_COMPTEUR] NOT NULL ,
	[texte] [T_MEMO] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[Laboratoire]    Script Date: 27/10/2000 10:10:47 ******/
CREATE TABLE [dbo].[Laboratoire] (
	[id_Laboratoire] [T_COMPTEUR] NOT NULL ,
	[Lab_id_Laboratoire] [T_COMPTEUR] NULL ,
	[laboratoire] [T_TEXTE_LONG] NULL ,
	[adr1] [T_libelle50] NULL ,
	[adr2] [T_libelle50] NULL ,
	[adr3] [T_libelle50] NULL ,
	[cp] [T_libelle10] NULL ,
	[ville] [T_libelle50] NULL ,
	[cedex] [T_libelle10] NULL ,
	[pays] [T_TEXTE_LONG] NULL ,
	[telephone] [T_TELEPHONE] NULL ,
	[telecopie] [T_libelle30] NULL ,
	[email] [T_TELEPHONE] NULL ,
	[internet] [T_TELEPHONE] NULL ,
	[commentaire] [T_TEXTE_LONG] NULL ,
	[mort] [T_BOOLEEN] NOT NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[dRevis] [T_DATE_SYST] NULL ,
	[Vignette] [int] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LaboratoireEtranger]    Script Date: 27/10/2000 10:10:47 ******/
/*CREATE TABLE [dbo].[LaboratoireEtranger] (
	[id_LaboratoireEtranger] [T_COMPTEUR] NOT NULL ,
	[laboEtrange] [T_TEXTE_LONG] NOT NULL ,
	[pays] [T_TEXTE_LONG] NOT NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[MeddraCI]    Script Date: 27/10/2000 10:10:47 ******/
/*CREATE TABLE [dbo].[MeddraCI] (
	[id_T_CI] [T_COMPTEUR] NOT NULL ,
	[codeMeddra] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[MeddraEII]    Script Date: 27/10/2000 10:10:47 ******/
/*CREATE TABLE [dbo].[MeddraEII] (
	[id_T_EII] [T_COMPTEUR] NOT NULL ,
	[codeMeddra] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[MeddraIndic]    Script Date: 27/10/2000 10:10:48 ******/
/*CREATE TABLE [dbo].[MeddraIndic] (
	[id_T_Indic] [T_COMPTEUR] NOT NULL ,
	[codeMeddra] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[MeddraPE]    Script Date: 27/10/2000 10:10:48 ******/
/*CREATE TABLE [dbo].[MeddraPE] (
	[id_T_PE] [T_COMPTEUR] NOT NULL ,
	[codeMeddra] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[Medicament]    Script Date: 27/10/2000 10:10:48 ******/
/*CREATE TABLE [dbo].[Medicament] (
	[id_Medicament] [T_COMPTEUR]  NOT NULL ,
	[nomAccentue] [T_libelle150] NOT NULL ,
	[nomSansAccent] [T_libelle150] NOT NULL ,
	[nomRacine] [T_libelle150] NOT NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[OMSEII]    Script Date: 27/10/2000 10:10:48 ******/
/*CREATE TABLE [dbo].[OMSEII] (
	[id_T_EII] [T_COMPTEUR] NOT NULL ,
	[codeOMS] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[Ph_RemplaCI]    Script Date: 27/10/2000 10:10:48 ******/
/*CREATE TABLE [dbo].[Ph_RemplaCI] (
	[id_Ph_RemplaCI] [T_COMPTEUR]  NOT NULL ,
	[libelle] [T_TEXTE_LONG] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[Ph_RemplaEII]    Script Date: 27/10/2000 10:10:48 ******/
/*CREATE TABLE [dbo].[Ph_RemplaEII] (
	[id_Ph_RemplaEII] [T_COMPTEUR]  NOT NULL ,
	[libelle] [T_TEXTE_LONG] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[Ph_RemplaIndic]    Script Date: 27/10/2000 10:10:48 ******/
/*CREATE TABLE [dbo].[Ph_RemplaIndic] (
	[id_Ph_RemplaIndic] [T_COMPTEUR]  NOT NULL ,
	[libelle] [T_TEXTE_LONG] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[Ph_RemplaPE]    Script Date: 27/10/2000 10:10:48 ******/
/*CREATE TABLE [dbo].[Ph_RemplaPE] (
	[id_Ph_RemplaPE] [T_COMPTEUR]  NOT NULL ,
	[libelle] [T_TEXTE_LONG] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpePharmacodynamie]    Script Date: 27/10/2000 10:10:48 ******/
CREATE TABLE [dbo].[SpePharmacodynamie] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[ATC_IRIS] [T_TEXTE_LONG] NULL ,
	[bATC] [T_BOOLEEN] NOT NULL ,
	[codeEPHMRA] [T_TEXTE_LONG] NULL ,
	[commAMM] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[CodeATC] [T_Libelle50] NULL ,
	[LibATC] [T_Libelle200] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[RechIndicCim_Rel]    Script Date: 27/10/2000 10:10:49 ******/
/*CREATE TABLE [dbo].[RechIndicCim_Rel] (
	[id_TermeRechIndic] [T_COMPTEUR] NOT NULL ,
	[id_CimTermRechIndic] [T_COMPTEUR] NOT NULL ,
	[synonymie] [T_BOOLEEN] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[RemplaCI_Rel]    Script Date: 27/10/2000 10:10:49 ******/
/*CREATE TABLE [dbo].[RemplaCI_Rel] (
	[id_Ph_RemplaCI] [T_COMPTEUR] NOT NULL ,
	[id_T_CI] [T_COMPTEUR] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[RemplaEII_Rel]    Script Date: 27/10/2000 10:10:49 ******/
/*CREATE TABLE [dbo].[RemplaEII_Rel] (
	[id_Ph_RemplaEII] [T_COMPTEUR] NOT NULL ,
	[id_T_EII] [T_COMPTEUR] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[RemplaIndic_Rel]    Script Date: 27/10/2000 10:10:49 ******/
/*CREATE TABLE [dbo].[RemplaIndic_Rel] (
	[id_Ph_RemplaIndic] [T_COMPTEUR] NOT NULL ,
	[id_T_Indic] [T_COMPTEUR] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[RemplaPE_Rel]    Script Date: 27/10/2000 10:10:49 ******/
/*CREATE TABLE [dbo].[RemplaPE_Rel] (
	[id_Ph_RemplaPE] [T_COMPTEUR] NOT NULL ,
	[id_T_PE] [T_COMPTEUR] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[RMOClass]    Script Date: 27/10/2000 10:10:49 ******/
CREATE TABLE [dbo].[RMOClass] (
	[id_RMOClass] [T_COMPTEUR]  NOT NULL ,
	[id_ThemeCommun] [T_COMPTEUR] NULL ,
	[referenceIRIS] [T_libelle20] NOT NULL ,
	[texteRMO] [T_MEMO] NOT NULL ,
	[codeJO] [T_libelle5] NOT NULL ,
	[remarque] [T_TEXTE_LONG] NULL ,
	[bRemInterne] [T_BOOLEEN] NOT NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[dRevis] [T_DATE_SYST] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SpeAccessoires]    Script Date: 27/10/2000 10:10:50 ******/
/*CREATE TABLE [dbo].[SpeAccessoires] (
	[id_SpeMateriel] [T_COMPTEUR] NOT NULL ,
	[typeAccessoire] [T_TEXTE_LONG] NOT NULL ,
	[quantite] [T_OVP_ENTIERS] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeACP]    Script Date: 27/10/2000 10:10:50 ******/
/*CREATE TABLE [dbo].[SpeACP] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[ACP] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeAutresATC]    Script Date: 27/10/2000 10:10:50 ******/
/*CREATE TABLE [dbo].[SpeAutresATC] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[ATC] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL ,
	[CodeATC] [T_Libelle50] NULL ,
	[LibATC] [T_Libelle200] NULL
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeCI]    Script Date: 27/10/2000 10:10:50 ******/
CREATE TABLE [dbo].[SpeCI] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_SpeCI] [T_COMPTEUR] NOT NULL ,
	[id_T_CI] [T_COMPTEUR] NOT NULL ,
	[terme] [T_LIBELLE_100] NULL ,
	[relatif] [T_BOOLEEN] NOT NULL ,
	[dateRelatif] [T_DATE_SYST] NULL ,
	[origineOVP] [T_BOOLEEN] NOT NULL ,
	[dateOrigOVP] [T_DATE_SYST] NULL ,
	[pertinentOVP] [T_BOOLEEN] NOT NULL ,
	[argumentaireAuteur] [T_MEMO] NULL ,
	[commAMM] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Specialite]    Script Date: 27/10/2000 10:10:50 ******/
CREATE TABLE [dbo].[Specialite] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[bValid] [T_BOOLEEN] NOT NULL ,
	[bEnCours] [T_BOOLEEN] NOT NULL ,
	[NomUser] [T_libelle20] NULL ,
	[denomSpe] [T_libelle128] NOT NULL ,
	[forme] [T_TEXTE_LONG] NULL ,
	[dosage] [T_TEXTE_LONG] NULL ,
	[groupeDC] [T_TEXTE_LONG] NULL ,
	[complement] [T_TEXTE_LONG] NULL ,
	[commAMMPoso] [T_MEMO] NULL ,
	[reserve] [T_BOOLEEN] NOT NULL ,
	[inferieurAge] [T_OVP_ENTIERS] NULL ,
	[unitInf] [T_TEXTE_LONG] NULL ,
	[superieurAge] [T_OVP_ENTIERS] NULL ,
	[unifSup] [T_TEXTE_LONG] NULL ,
	[inferieurPoids] [T_OVP_FLOAT] NULL ,
	[superieurPoids] [T_OVP_FLOAT] NULL ,
	[denomAMM] [T_TEXTE_LONG] NULL ,
	[numdosAMM] [T_libelle20] NULL ,
	[SpeCategorie] [T_TEXTE_LONG] NULL ,
	[source] [T_TEXTE_LONG] NULL ,
	[dateSource] [T_DATE_SYST] NULL ,
	[remarques] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[dRevis] [T_DATE_SYST] NULL ,
 	[idTypeSpe] [INT] NULL,
 	[bDopant] [T_BOOLEEN] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Specialite_ExtractibleMarche]    Script Date: 27/10/2000 10:10:50 ******/
/*CREATE TABLE [dbo].[Specialite_ExtractibleMarche] (
	[id_Specialite] [T_COMPTEUR] NOT NULL
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[Specialite_IAMClass]    Script Date: 27/10/2000 10:10:50 ******/
CREATE TABLE [dbo].[Specialite_IAMClass] (
	[id_IAMClasse] [T_COMPTEUR] NOT NULL ,
	[id_Specialite] [T_COMPTEUR] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Specialite_Medicament]    Script Date: 27/10/2000 10:10:50 ******/
/*CREATE TABLE [dbo].[Specialite_Medicament] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_Medicament] [T_COMPTEUR] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[Specialite_Substance]    Script Date: 27/10/2000 10:10:51 ******/
/*CREATE TABLE [dbo].[Specialite_Substance] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_Substance] [T_COMPTEUR] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeCIExcl]    Script Date: 27/10/2000 10:10:51 ******/
/*CREATE TABLE [dbo].[SpeCIExcl] (
	[id_SpeCI] [T_COMPTEUR] NOT NULL ,
	[condition] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeCIFav]    Script Date: 27/10/2000 10:10:51 ******/
/*CREATE TABLE [dbo].[SpeCIFav] (
	[id_SpeCI] [T_COMPTEUR] NOT NULL ,
	[condition] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeCinetQuantit]    Script Date: 27/10/2000 10:10:51 ******/
/*CREATE TABLE [dbo].[SpeCinetQuantit] (
	[id_SpePharmacoCinet] [T_COMPTEUR] NOT NULL ,
	[type] [T_TEXTE_LONG] NULL ,
	[typeSuite] [T_TEXTE_LONG] NULL ,
	[commodalite] [T_libelle60] NULL ,
	[valMin] [T_OVP_FLOAT] NULL ,
	[valMax] [T_OVP_FLOAT] NULL ,
	[uniteCinet] [T_TEXTE_LONG] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeClassIRIS]    Script Date: 27/10/2000 10:10:57 ******/
CREATE TABLE [dbo].[SpeClassIRIS] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_DicoComClassIRIS] [T_COMPTEUR] NOT NULL ,
	[libelle] [T_TEXTE_LONG] NOT NULL ,
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SpeCompo]    Script Date: 27/10/2000 10:10:51 ******/
CREATE TABLE [dbo].[SpeCompo] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_SpeCompo] [T_COMPTEUR] NOT NULL ,
	[forme] [T_TEXTE_LONG] NULL ,
	[numeroForme] [T_OVP_ENTIERS] NOT NULL ,
	[couleurForme] [T_TEXTE_LONG] NULL ,
	[nbConstituantsActifs] [T_OVP_ENTIERS] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[dRevis] [T_DATE_SYST] NULL 
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[SpeConditionnementPrimaire]    Script Date: 27/10/2000 10:10:51 ******/
CREATE TABLE [dbo].[SpeConditionnementPrimaire] (
	[id_SpePresentation] [T_COMPTEUR] NOT NULL ,
	[id_PresConditionnement] [T_COMPTEUR] NOT NULL ,
	[id_Produit] [T_COMPTEUR] NOT NULL ,
	[nbCond] [T_OVP_ENTIERS] NOT NULL ,
	[typeCondPrimaire] [T_TEXTE_LONG] NULL ,
	[natureCondi] [T_TEXTE_LONG] NULL ,
	[contenance] [T_OVP_FLOAT] NULL ,
	[uniteContenance] [T_TEXTE_LONG] NULL ,
	[contenu] [T_OVP_FLOAT] NULL ,
	[uniteContenu] [T_TEXTE_LONG] NULL ,
	[rensComp] [T_libelle60] NULL ,
	[ordre] [T_ORDRE] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SpeConstituant]    Script Date: 27/10/2000 10:10:51 ******/
CREATE TABLE [dbo].[SpeConstituant] (
	[id_SpeConstituant] [T_COMPTEUR] NOT NULL ,
	[id_SpeCompo] [T_COMPTEUR] NOT NULL ,
	[denomSub] [T_LIBELLE_100] NULL ,
	[homeopathie] [T_LIBELLE_1] NULL ,
	[bConstActif] [T_BOOLEEN] NOT NULL ,
	[natureExcip] [T_TEXTE_LONG] NULL ,
	[prefixeConstituant] [T_TEXTE_LONG] NULL ,
	[postFixeConstituant] [T_TEXTE_LONG] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[excipientComm] [T_MEMO] NULL ,
	[ordre] [T_ORDRE] NOT NULL ,
	[id_T_Sub] [T_COMPTEUR] NULL ,
	[tetiere] [T_TEXTE_LONG] NULL ,
	[quantite] [T_OVP_FLOAT] NULL ,
	[unite] [T_TEXTE_LONG] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



/****** Object:  Table [dbo].[SpeEII]    Script Date: 27/10/2000 10:10:52 ******/
/*CREATE TABLE [dbo].[SpeEII] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_SpeEII] [T_COMPTEUR] NOT NULL ,
	[terme] [T_LIBELLE_100] NULL ,
	[frequence] [T_TEXTE_LONG] NULL ,
	[origineOVP] [T_BOOLEEN] NOT NULL ,
	[dateOrigOVP] [T_DATE_SYST] NULL ,
	[pertinentOVP] [T_BOOLEEN] NOT NULL ,
	[argumentaireAuteur] [T_MEMO] NULL ,
	[commAMM] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeEIIExcl]    Script Date: 27/10/2000 10:10:52 ******/
/*CREATE TABLE [dbo].[SpeEIIExcl] (
	[id_SpeEII] [T_COMPTEUR] NOT NULL ,
	[cond] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeEIIFav]    Script Date: 27/10/2000 10:10:52 ******/
/*CREATE TABLE [dbo].[SpeEIIFav] (
	[id_SpeEII] [T_COMPTEUR] NOT NULL ,
	[cond] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO


/****** Object:  Table [dbo].[SpeEvt]    Script Date: 27/10/2000 10:10:52 ******/
CREATE TABLE [dbo].[SpeEvt] (
	[id_SpeEvt] [T_COMPTEUR] NOT NULL ,
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[evenement] [T_TEXTE_LONG] NULL ,
	[source] [T_TEXTE_LONG] NULL ,
	[dateSource] [T_DATE_SYST] NULL ,
	[dateEvenement] [T_DATE_SYST] NOT NULL ,
	[traiteEven] [T_TEXTE_LONG] NULL ,
	[id_DicoSpeEvenement] [T_COMPTEUR] NOT NULL ,
        [DateCreation] [T_DATE_SYST]  NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SpeEvtPresentation]    Script Date: 27/10/2000 10:10:52 ******/
CREATE TABLE [dbo].[SpeEvtPresentation] (
	[id_SpePresentation] [T_COMPTEUR] NOT NULL ,
	[id_SpeEvtPresentation] [T_COMPTEUR] NOT NULL ,
	[evenement] [T_TEXTE_LONG] NULL ,
	[source] [T_TEXTE_LONG] NULL ,
	[dateSource] [T_DATE_SYST] NULL ,
	[dateEvenement] [T_DATE_SYST] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SpeExam]    Script Date: 27/10/2000 10:10:53 ******/
/*CREATE TABLE [dbo].[SpeExam] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_SpeExam] [T_COMPTEUR] NOT NULL ,
	[exam] [T_TEXTE_LONG] NULL ,
	[commAMM] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeExamMethode]    Script Date: 27/10/2000 10:10:53 ******/
/*CREATE TABLE [dbo].[SpeExamMethode] (
	[id_SpeExam] [T_COMPTEUR] NOT NULL ,
	[methode] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeGerme]    Script Date: 27/10/2000 10:10:53 ******/
/*CREATE TABLE [dbo].[SpeGerme] (
	[id_SpeSpectre] [T_COMPTEUR] NOT NULL ,
	[id_SpeGerme] [T_COMPTEUR] NOT NULL ,
	[sensibilite] [T_TEXTE_LONG] NULL ,
	[germe] [T_TEXTE_LONG] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeGrosAllait]    Script Date: 27/10/2000 10:10:53 ******/
/*CREATE TABLE [dbo].[SpeGrosAllait] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_SpeGrosAllait] [T_COMPTEUR] NOT NULL ,
	[bSurveilPreNatale] [T_BOOLEEN] NOT NULL ,
	[bSurveilNeoNatale] [T_BOOLEEN] NOT NULL ,
	[bCi] [T_BOOLEEN] NOT NULL ,
	[bGros] [T_BOOLEEN] NOT NULL ,
	[bAllait] [T_BOOLEEN] NOT NULL ,
	[periode] [T_TEXTE_LONG] NULL ,
	[niveaurisque] [T_TEXTE_LONG] NULL ,
	[origineOVP] [T_BOOLEEN] NOT NULL ,
	[dateOrigOVP] [T_DATE_SYST] NULL ,
	[pertinentOVP] [T_BOOLEEN] NOT NULL ,
	[argumentaireAuteur] [T_MEMO] NULL ,
	[commAMM] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeIncompatible]    Script Date: 27/10/2000 10:10:53 ******/
/*CREATE TABLE [dbo].[SpeIncompatible] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[commAMM] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeIndic]    Script Date: 27/10/2000 10:10:53 ******/
CREATE TABLE [dbo].[SpeIndic] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
--	[id_SpeEvtPresentation] [T_COMPTEUR] NULL ,
	[id_SpeIndic] [T_COMPTEUR] NOT NULL ,
	[id_T_Indic] [T_COMPTEUR] NOT NULL ,
	[terme] [T_LIBELLE_100] NULL ,
	[origineOVP] [T_BOOLEEN] NOT NULL ,
	[dateOrigOVP] [T_DATE_SYST] NULL ,
	[nonIndication] [T_BOOLEEN] NOT NULL ,
	[argumentaireAuteur] [T_MEMO] NULL ,
	[id_DicoComClassIRIS] [T_COMPTEUR] NULL ,
	[classementIRIS] [T_TEXTE_LONG] NULL ,
	[ppalClassIRIS] [T_BOOLEEN] NOT NULL ,
	[classIRISVidal] [T_TEXTE_LONG] NULL ,
	[classIRISLaboX] [T_TEXTE_LONG] NULL ,
	[commAMM] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SpeIndicAMM]    Script Date: 27/10/2000 10:10:53 ******/
/*CREATE TABLE [dbo].[SpeIndicAMM] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[commAMM] [T_MEMO] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeIndic_SpeCI]    Script Date: 27/10/2000 10:10:53 ******/
/*CREATE TABLE [dbo].[SpeIndic_SpeCI] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_SpeIndic] [T_COMPTEUR] NOT NULL ,
	[id_SpeCI] [T_COMPTEUR] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeIndic_SpeGrosAllait]    Script Date: 27/10/2000 10:10:53 ******/
/*CREATE TABLE [dbo].[SpeIndic_SpeGrosAllait] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_SpeIndic] [T_COMPTEUR] NOT NULL ,
	[id_SpeGrosAllait] [T_COMPTEUR] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeIndic_SpeMeg]    Script Date: 27/10/2000 10:10:54 ******/
/*CREATE TABLE [dbo].[SpeIndic_SpeMeg] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_SpeIndic] [T_COMPTEUR] NOT NULL ,
	[id_SpeMeg] [T_COMPTEUR] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeIndic_SpePE]    Script Date: 27/10/2000 10:10:54 ******/
/*CREATE TABLE [dbo].[SpeIndic_SpePE] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_SpeIndic] [T_COMPTEUR] NOT NULL ,
	[id_SpePE] [T_COMPTEUR] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeIndicExcl]    Script Date: 27/10/2000 10:10:54 ******/
/*CREATE TABLE [dbo].[SpeIndicExcl] (
	[id_SpeIndic] [T_COMPTEUR] NOT NULL ,
	[condition] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeIndicFav]    Script Date: 27/10/2000 10:10:54 ******/
/*CREATE TABLE [dbo].[SpeIndicFav] (
	[id_SpeIndic] [T_COMPTEUR] NOT NULL ,
	[condition] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeLabs_Rel]    Script Date: 27/10/2000 10:10:54 ******/
CREATE TABLE [dbo].[SpeLabs_Rel] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_Laboratoire] [T_COMPTEUR] NOT NULL ,
	[titulaireExploitant] [T_TEXTE_LONG] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SpeMateriel]    Script Date: 27/10/2000 10:10:54 ******/
/*CREATE TABLE [dbo].[SpeMateriel] (
	[id_SpePresentation] [T_COMPTEUR] NOT NULL ,
	[id_SpeMateriel] [T_COMPTEUR] NOT NULL ,
	[typeMateriel] [T_TEXTE_LONG] NULL ,
	[quantite] [T_OVP_ENTIERS] NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeMeg]    Script Date: 27/10/2000 10:10:54 ******/
/*CREATE TABLE [dbo].[SpeMeg] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_SpeMeg] [T_COMPTEUR] NOT NULL ,
	[terme] [T_LIBELLE_100] NULL ,
	[origineOVP] [T_BOOLEEN] NOT NULL ,
	[dateOrigOVP] [T_DATE_SYST] NULL ,
	[pertinentOVP] [T_BOOLEEN] NOT NULL ,
	[argumentaireAuteur] [T_MEMO] NULL ,
	[commAMM] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeMegExcl]    Script Date: 27/10/2000 10:10:54 ******/
/*CREATE TABLE [dbo].[SpeMegExcl] (
	[id_SpeMeg] [T_COMPTEUR] NOT NULL ,
	[condition] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeMegFav]    Script Date: 27/10/2000 10:10:54 ******/
/*CREATE TABLE [dbo].[SpeMegFav] (
	[id_SpeMeg] [T_COMPTEUR] NOT NULL ,
	[condition] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpePE]    Script Date: 27/10/2000 10:10:54 ******/
CREATE TABLE [dbo].[SpePE] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_SpePE] [T_COMPTEUR] NOT NULL ,
	[terme] [T_LIBELLE_100] NULL ,
	[origineOVP] [T_BOOLEEN] NOT NULL ,
	[dateOrigOVP] [T_DATE_SYST] NULL ,
	[pertinentOVP] [T_BOOLEEN] NOT NULL ,
	[argumentaireAuteur] [T_MEMO] NULL ,
	[commAMM] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SpePEExcl]    Script Date: 27/10/2000 10:10:55 ******/
/*CREATE TABLE [dbo].[SpePEExcl] (
	[id_SpePE] [T_COMPTEUR] NOT NULL ,
	[condition] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpePEFav]    Script Date: 27/10/2000 10:10:55 ******/
/*CREATE TABLE [dbo].[SpePEFav] (
	[id_SpePE] [T_COMPTEUR] NOT NULL ,
	[condition] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpePharmacoCinet]    Script Date: 27/10/2000 10:10:55 ******/
/*CREATE TABLE [dbo].[SpePharmacoCinet] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_SpePharmacoCinet] [T_COMPTEUR]  NOT NULL ,
	[commAMM] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpePharmacoCinet_SpeConstituan]    Script Date: 27/10/2000 10:10:55 ******/
/*CREATE TABLE [dbo].[SpePharmacoCinet_SpeConstituan] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_SpePharmacoCinet] [T_COMPTEUR] NOT NULL ,
	[id_SpeConstituant] [T_COMPTEUR] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpePoso]    Script Date: 27/10/2000 10:10:55 ******/
CREATE TABLE [dbo].[SpePoso] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_SpePrise] [T_COMPTEUR] NULL ,
	[id_SpePoso] [T_COMPTEUR] NOT NULL ,
	[relecturePar] [T_LIBELLE_1] NOT NULL ,
	[posoUsuInf] [T_OVP_FLOAT] NULL ,
	[posoUsuSup] [T_OVP_FLOAT] NULL ,
	[posoUsuType] [T_TEXTE_LONG] NULL ,
	[posoMin] [T_OVP_FLOAT] NULL ,
	[posoMinType] [T_TEXTE_LONG] NULL ,
	[posoMax] [T_OVP_FLOAT] NULL ,
	[posoMaxType] [T_TEXTE_LONG] NULL ,
	[posoTotMax] [T_OVP_FLOAT] NULL ,
	[posoTotMaxType] [T_TEXTE_LONG] NULL ,
	[freqUsuInf] [T_OVP_ENTIERS] NULL ,
	[freqUsuSup] [T_OVP_ENTIERS] NULL ,
	[freqUsuType] [T_TEXTE_LONG] NULL ,
	[freqInfPosoMax] [T_OVP_ENTIERS] NULL ,
	[freqSupPosoMax] [T_OVP_ENTIERS] NULL ,
	[freqPosoMaxType] [T_TEXTE_LONG] NULL ,
	[freqInfPosoMin] [T_OVP_ENTIERS] NULL ,
	[freqSupPosoMin] [T_OVP_ENTIERS] NULL ,
	[freqPosoMinType] [T_TEXTE_LONG] NULL ,
	[freqPosoTotMaxType] [T_TEXTE_LONG] NULL ,
	[freqInfRenouv] [T_OVP_ENTIERS] NULL ,
	[freqSupRenouv] [T_OVP_ENTIERS] NULL ,
	[freqRenouvType] [T_TEXTE_LONG] NULL ,
	[freqDiv] [T_LIBELLE_1] NOT NULL ,
	[durAdUsuInf] [T_OVP_ENTIERS] NULL ,
	[durAdUsuSup] [T_OVP_ENTIERS] NULL ,
	[durAdUsuType] [T_TEXTE_LONG] NULL ,
	[durMax] [T_OVP_ENTIERS] NULL ,
	[durMaxType] [T_TEXTE_LONG] NULL ,
	[durTotal] [T_OVP_ENTIERS] NULL ,
	[durTotalType] [T_TEXTE_LONG] NULL ,
	[durArretInf] [T_OVP_ENTIERS] NULL ,
	[durArretSup] [T_OVP_ENTIERS] NULL ,
	[durArretType] [T_TEXTE_LONG] NULL ,
	[poidsInf] [T_OVP_FLOAT] NOT NULL ,
	[poidsSup] [T_OVP_FLOAT] NULL ,
	[ageInf] [T_OVP_ENTIERS] NOT NULL ,
	[uniteAgeInf] [T_TEXTE_LONG] NULL ,
	[ageSup] [T_OVP_ENTIERS] NULL ,
	[uniteAgeSup] [T_TEXTE_LONG] NULL ,
	[phase] [T_TEXTE_LONG] NULL ,
	[ordredephase] [T_OVP_ENTIERS] NULL ,
	[lienPhase] [T_LIBELLE_1] NOT NULL ,
	[etatPreexistant] [T_TEXTE_LONG] NULL ,
	[situDsTempsPosoInf] [T_TEXTE_LONG] NULL ,
	[situDsTempsPosoSup] [T_TEXTE_LONG] NULL ,
	[renouvellement] [T_TEXTE_LONG] NULL ,
	[sexe] [T_LIBELLE_1] NOT NULL ,
	[coPrescription] [T_MEMO] NULL ,
	[repas] [T_TEXTE_LONG] NULL ,
	[conseil] [T_MEMO] NULL ,
	[modeEmploi] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[dRevis] [T_DATE_SYST] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SpePosoIndic]    Script Date: 27/10/2000 10:10:55 ******/
CREATE TABLE [dbo].[SpePosoIndic] (
	[id_SpePoso] [T_COMPTEUR] NOT NULL ,
	[id_SpeIndic] [T_COMPTEUR] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SpePosoVoie]    Script Date: 27/10/2000 10:10:55 ******/
/*CREATE TABLE [dbo].[SpePosoVoie] (
	[id_SpePoso] [T_COMPTEUR] NOT NULL ,
	[voie] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpePresentation]    Script Date: 27/10/2000 10:10:56 ******/


CREATE TABLE [dbo].[SpePresentation] (
	[id_SpePresentation] [T_COMPTEUR] NOT NULL ,
	[id_Specialite] [T_COMPTEUR]  NULL ,
	[cip] [T_libelle7] NOT NULL ,
	[ucd] [T_libelle7] NULL ,
	[ammEurope] [T_libelle20] NULL ,
	[liste] [T_TEXTE_LONG] NULL ,
	[dureePrescription] [T_TEXTE_LONG] NULL ,
	[prescriptionInitiale] [T_TEXTE_LONG] NULL ,
	[prescriptionReservee] [T_TEXTE_LONG] NULL ,
	[renouvelReserve] [T_TEXTE_LONG] NULL ,
	[medPartic] [T_BOOLEEN] NOT NULL ,
	[natureSurveillance] [T_MEMO] NULL ,
	[prixProdHTF] [T_OVP_FLOAT] NULL ,
	[prixPublicTTCF] [T_OVP_FLOAT] NULL ,
	[prixProdHTE] [T_OVP_FLOAT] NULL ,
	[prixPublicTTCE] [T_OVP_FLOAT] NULL ,
	[tva] [T_TEXTE_LONG] NULL ,
	[dCreat] [T_DATE_SYST]  NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[dRevis] [T_DATE_SYST] NULL ,
	[codeReferantGenerique] [T_Libelle_1] NULL ,
	[cipreferant] [T_libelle7]  NULL,
	[disponibilite] [T_libelle128] NULL,

	[nbPrise] [Integer] NULL ,
	[PriseUnitaire]  [T_TEXTE_LONG] NULL,

	[lieuDispo] [T_TEXTE_LONG] NULL ,
	[condDispo] [T_TEXTE_LONG] NULL ,

	[remplace] [T_libelle7] NULL ,
	[sourceRemplace] [T_TEXTE_LONG] NULL ,
	[dateSourceRemplace] [T_DATE_SYST] NULL ,
	[remplacePar] [T_libelle7] NULL ,
	[sourceRemplacePar] [T_TEXTE_LONG] NULL ,
	[dateSourceRemplacePar] [T_DATE_SYST] NULL ,

	[id_DicoCodeGene] [T_COMPTEUR] NULL ,
	[Condi] [T_libelle50] NULL ,
	[bHop] [T_BOOLEEN] NULL ,
	[id_DicoEphmra] [T_COMPTEUR] NULL,

        [EAN13] VARCHAR(13)  null    ,
        [REFERENCECATALOGUE]  [T_LIBELLE20]  null    ,
        [CLINIQUE]  [T_BOOLEEN] null    ,
    [MARQUE]                    [T_LIBELLE128]           null    ,
    [CLASSIFICATIONSTRUCTUREE]  varchar(7)            null    ,
    [FAMILLESEMP_LIBELLE]       varchar(255)          null    ,
    [GRANDEURUNITEMESURE]       [T_OVP_FLOAT]           null    ,
    [REFERENCEUNITEMESURE]      varchar(30)           null    ,
    [CODEINVENTOREX]            varchar(2)            null    ,
    [LIBELLEINVENTOREX]         [T_LIBELLE128]          null    ,
    [PRIXHOPITALHT]             [T_OVP_FLOAT]           null    ,
    [PRIXDEPARTLABORATOIREHT]   [T_OVP_FLOAT]           null    ,
    [TVAMULTIPLICATEUR]         [T_OVP_FLOAT]           null    ,
    [TVADIVISEUR]               [T_OVP_FLOAT]           null    ,
    [DUREESTOCKAGE]             [T_OVP_ENTIERS]         null    ,
    [TEMPSSTOCKAGE]             [T_LIBELLE50]           null    ,
    [TEMPERATUREMIN]            [T_OVP_ENTIERS]         null    ,
    [TEMPERATUREMAX]            [T_OVP_ENTIERS]         null    ,
    [DUREEAPRESDESTOCKAGE]      [T_OVP_ENTIERS]         null    ,
    [TEMPSAPRESDESTOCKAGE]      [T_LIBELLE50]           null    ,
    [POIDSNET]                  [T_OVP_FLOAT]           null    ,
    [VOLUMENET]                 [T_OVP_FLOAT]           null    ,
    [CODEB2]                    varchar(3)            null    ,
    [TIPS]                      [T_LIBELLE128]          null    ,
    [FICHECARACTERISTIQUE]      [T_MEMO]                null    ,
    [BASEREMBOURSEMENT]         [T_OVP_FLOAT]           null    ,
	[CODEDISPO] [Integer] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SpePresentation_DateMaxEvMarche]    Script Date: 27/10/2000 10:10:55 ******/
/*CREATE TABLE [dbo].[SpePresentation_DateMaxEvMarche] (
	[id_SpePresentation] [T_COMPTEUR] NOT NULL ,
	[MaxDedateEvenement] [T_DATE_SYST] NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpePresentation_DernierEvMarche]    Script Date: 27/10/2000 10:10:55 ******/
/*CREATE TABLE [dbo].[SpePresentation_DernierEvMarche] (
	[id_SpePresentation] [T_COMPTEUR] NOT NULL ,
	[libelle] [T_TEXTE_LONG] NOT NULL ,
	[dateEvenement] [T_DATE_SYST] NULL ,
	[id_SpeEvtPresentation] [T_COMPTEUR] NOT NULL
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpePresentationReferantGenerique]    Script Date: 18/07/2002 16:56:27 ******/
/* CREATE TABLE [dbo].[SpePresentationReferantGenerique] (
	[id_SpePresentation] [T_COMPTEUR] NOT NULL ,
	[cip] [T_libelle7] NOT NULL ,
	[id_SpePresentationReferant] [T_COMPTEUR] NULL ,
	[cipReferant] [T_libelle7] NULL 
) ON [PRIMARY] */
GO

/****** Object:  Table [dbo].[PresPrise]    Script Date: 27/10/2000 10:10:56 ******/
/*CREATE TABLE [dbo].[PresPrise] (

	[id_Presentation] [T_COMPTEUR] NOT NULL ,
	[nb_prise] [T_OVP_FLOAT] NULL ,
	[principal] [T_BOOLEEN] NULL ,
	[libelle] [T_TEXTE_LONG] NOT NULL ,

) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeReferantGener]    Script Date: 27/10/2000 10:10:56 ******/
/*CREATE TABLE [dbo].[SpeReferantGener] (
	[id_Specialite] [T_COMPTEUR]  NOT NULL ,
	[id_SpeReferant] [T_COMPTEUR] NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeSecuPreClin]    Script Date: 27/10/2000 10:10:56 ******/
/*CREATE TABLE [dbo].[SpeSecuPreClin] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[commAMM] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeSignSdComm]    Script Date: 27/10/2000 10:10:56 ******/
/*CREATE TABLE [dbo].[SpeSignSdComm] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[terme] [T_LIBELLE_100] NOT NULL ,
	[commAMM] [T_MEMO] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeSousConstituant]    Script Date: 27/10/2000 10:10:56 ******/
/*CREATE TABLE [dbo].[SpeSousConstituant] (
	[id_SpeConstituant] [T_COMPTEUR] NOT NULL ,
	[id_SpeSousConstituant] [T_COMPTEUR] NOT NULL ,
	[denomSub] [T_LIBELLE_100] NULL ,
	[homeopathie] [T_LIBELLE_1] NULL ,
	[ExpenSoit] [T_LIBELLE_1] NOT NULL ,
	[prefixeSousConstituant] [T_TEXTE_LONG] NULL ,
	[postFixeSousConstituant] [T_TEXTE_LONG] NULL ,
	[ordre] [T_ORDRE] NOT NULL ,
	[id_T_Sub] [T_COMPTEUR] NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeSpectre]    Script Date: 27/10/2000 10:10:56 ******/
/*CREATE TABLE [dbo].[SpeSpectre] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[id_SpeSpectre] [T_COMPTEUR] NOT NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[commAMM] [T_MEMO] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeSuiviSGML]    Script Date: 27/10/2000 10:10:56 ******/
CREATE TABLE [dbo].[SpeSuiviSGML] (
	[id_SpeSuiviSGML] [T_COMPTEUR] NOT NULL ,
	[id_SpePresentation] [T_COMPTEUR] NOT NULL ,
	[ouvrage] [T_TEXTE_LONG] NULL ,
	[millesime] [T_OVP_ENTIERS] NOT NULL ,
	[monographie] [T_libelle9] NOT NULL ,
	[commTexte] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dateParution] [T_DATE_SYST] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SpeSurdosage]    Script Date: 27/10/2000 10:10:57 ******/
/*CREATE TABLE [dbo].[SpeSurdosage] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[commTraitAMM] [T_MEMO] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeTetConst]    Script Date: 27/10/2000 10:10:57 ******/
/*CREATE TABLE [dbo].[SpeTetConst] (
	[id_SpeConstituant] [T_COMPTEUR] NOT NULL ,
	[id_Tetiere] [T_COMPTEUR] NOT NULL ,
	[quantite] [T_OVP_FLOAT] NULL ,
	[unite] [T_TEXTE_LONG] NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeTetSousConst]    Script Date: 27/10/2000 10:10:57 ******/
/*CREATE TABLE [dbo].[SpeTetSousConst] (
	[id_SpeSousConstituant] [T_COMPTEUR] NOT NULL ,
	[id_Tetiere] [T_COMPTEUR] NOT NULL ,
	[quantite] [T_OVP_FLOAT] NULL ,
	[unite] [T_TEXTE_LONG] NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeVigi]    Script Date: 27/10/2000 10:10:57 ******/
/*CREATE TABLE [dbo].[SpeVigi] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[origineOVP] [T_BOOLEEN] NOT NULL ,
	[dateOrigOVP] [T_DATE_SYST] NULL ,
	[pertinentOVP] [T_BOOLEEN] NOT NULL ,
	[argumentaireAuteur] [T_MEMO] NULL ,
	[commAMM] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SpeVoie]    Script Date: 27/10/2000 10:10:57 ******/
CREATE TABLE [dbo].[SpeVoie] (
	[id_Specialite] [T_COMPTEUR] NOT NULL ,
	[voie] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Sub_T_ClassChim]    Script Date: 27/10/2000 10:10:57 ******/
/*CREATE TABLE [dbo].[Sub_T_ClassChim] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[id_T_ClassChim] [T_COMPTEUR] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubATC]    Script Date: 27/10/2000 10:10:57 ******/
/*CREATE TABLE [dbo].[SubATC] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[terme] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL ,
	[CodeATC] [T_Libelle50] NULL ,
	[LibATC] [T_Libelle200] NULL
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubBiblio]    Script Date: 27/10/2000 10:10:57 ******/
/*CREATE TABLE [dbo].[SubBiblio] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[comm] [T_MEMO] NOT NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubCI]    Script Date: 27/10/2000 10:10:57 ******/
/*CREATE TABLE [dbo].[SubCI] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[id_SubCI] [T_COMPTEUR] NOT NULL ,
	[terme] [T_TEXTE_LONG] NULL ,
	[comm] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubCIExcl]    Script Date: 27/10/2000 10:10:57 ******/
/*CREATE TABLE [dbo].[SubCIExcl] (
	[id_SubCI] [T_COMPTEUR] NOT NULL ,
	[condition] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubCIFav]    Script Date: 27/10/2000 10:10:58 ******/
/*CREATE TABLE [dbo].[SubCIFav] (
	[id_SubCI] [T_COMPTEUR] NOT NULL ,
	[condition] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubCinetQuantit]    Script Date: 27/10/2000 10:10:58 ******/
/*CREATE TABLE [dbo].[SubCinetQuantit] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[id_SubCinetQuantit] [T_COMPTEUR] NOT NULL ,
	[type] [T_TEXTE_LONG] NULL ,
	[typeSuite] [T_TEXTE_LONG] NULL ,
	[commModalite] [T_libelle60] NULL ,
	[valMin] [T_OVP_FLOAT] NULL ,
	[valMax] [T_OVP_FLOAT] NULL ,
	[uniteCinet] [T_TEXTE_LONG] NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubClassIRIS]    Script Date: 27/10/2000 10:10:58 ******/
/*CREATE TABLE [dbo].[SubClassIRIS] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[terme] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubDepen]    Script Date: 27/10/2000 10:10:58 ******/
/*CREATE TABLE [dbo].[SubDepen] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[risque] [T_TEXTE_LONG] NULL ,
	[comm] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubEffet]    Script Date: 27/10/2000 10:10:58 ******/
/*CREATE TABLE [dbo].[SubEffet] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[id_SubEffet] [T_COMPTEUR] NOT NULL ,
	[libelle] [T_TEXTE_LONG] NULL ,
	[qualificatif] [T_TEXTE_LONG] NULL ,
	[comm] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubEII]    Script Date: 27/10/2000 10:10:58 ******/
/*CREATE TABLE [dbo].[SubEII] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[id_SubEII] [T_COMPTEUR] NOT NULL ,
	[libelle] [T_LIBELLE_100] NULL ,
	[imputabilite] [T_TEXTE_LONG] NULL ,
	[frequence] [T_TEXTE_LONG] NULL ,
	[comm] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubEIIExcl]    Script Date: 27/10/2000 10:10:58 ******/
/*CREATE TABLE [dbo].[SubEIIExcl] (
	[id_SubEII] [T_COMPTEUR] NOT NULL ,
	[condition] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubEIIFav]    Script Date: 27/10/2000 10:10:58 ******/
/*CREATE TABLE [dbo].[SubEIIFav] (
	[id_SubEII] [T_COMPTEUR] NOT NULL ,
	[condition] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubEvt]    Script Date: 27/10/2000 10:10:58 ******/
/*CREATE TABLE [dbo].[SubEvt] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[id_SubEvt] [T_COMPTEUR] NOT NULL ,
	[evenement] [T_TEXTE_LONG] NULL ,
	[source] [T_libelle50] NULL ,
	[raison] [T_TEXTE_LONG] NULL ,
	[dateEvenement] [T_DATE_SYST] NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubExam]    Script Date: 27/10/2000 10:10:58 ******/
/*CREATE TABLE [dbo].[SubExam] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[id_SubExam] [T_COMPTEUR] NOT NULL ,
	[exam] [T_TEXTE_LONG] NULL ,
	[comm] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubExamMethode]    Script Date: 27/10/2000 10:10:59 ******/
/*CREATE TABLE [dbo].[SubExamMethode] (
	[id_SubExam] [T_COMPTEUR] NOT NULL ,
	[methode] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubGrosDescAllait]    Script Date: 27/10/2000 10:10:59 ******/
/*CREATE TABLE [dbo].[SubGrosDescAllait] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[id_SubGrosDescAllait] [T_COMPTEUR] NOT NULL ,
	[bPE] [T_BOOLEEN] NOT NULL ,
	[bCI] [T_BOOLEEN] NOT NULL ,
	[bGros] [T_BOOLEEN] NOT NULL ,
	[bAllait] [T_BOOLEEN] NOT NULL ,
	[periode] [T_TEXTE_LONG] NULL ,
	[niveauRisque] [T_TEXTE_LONG] NULL ,
	[bDescendance] [T_BOOLEEN] NOT NULL ,
	[terme] [T_TEXTE_LONG] NULL ,
	[comm] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubIncompatible]    Script Date: 27/10/2000 10:10:59 ******/
/*CREATE TABLE [dbo].[SubIncompatible] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[comm] [T_MEMO] NOT NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubIndic]    Script Date: 27/10/2000 10:10:59 ******/
/*CREATE TABLE [dbo].[SubIndic] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[id_SubIndic] [T_COMPTEUR] NOT NULL ,
	[terme] [T_TEXTE_LONG] NULL ,
	[bAMM] [T_BOOLEEN] NOT NULL ,
	[qualificatif] [T_TEXTE_LONG] NULL ,
	[comm] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubIndicExcl]    Script Date: 27/10/2000 10:10:59 ******/
/*CREATE TABLE [dbo].[SubIndicExcl] (
	[id_SubIndic] [T_COMPTEUR] NOT NULL ,
	[condition] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubIndicFav]    Script Date: 27/10/2000 10:10:59 ******/
/*CREATE TABLE [dbo].[SubIndicFav] (
	[id_SubIndic] [T_COMPTEUR] NOT NULL ,
	[condition] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubPE]    Script Date: 27/10/2000 10:10:59 ******/
CREATE TABLE [dbo].[SubPE] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[id_SubPE] [T_COMPTEUR] NOT NULL ,
	[terme] [T_TEXTE_LONG] NULL ,
	[comm] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SubPEExcl]    Script Date: 27/10/2000 10:10:59 ******/
/*CREATE TABLE [dbo].[SubPEExcl] (
	[id_SubPE] [T_COMPTEUR] NOT NULL ,
	[condition] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubPEFav]    Script Date: 27/10/2000 10:10:59 ******/
/*CREATE TABLE [dbo].[SubPEFav] (
	[id_SubPE] [T_COMPTEUR] NOT NULL ,
	[condition] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubPharmacoCinet]    Script Date: 27/10/2000 10:11:00 ******/
/*CREATE TABLE [dbo].[SubPharmacoCinet] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[commAbsorption] [T_MEMO] NULL ,
	[commRepartition] [T_MEMO] NULL ,
	[commDemiVie] [T_MEMO] NULL ,
	[commMetabolisme] [T_MEMO] NULL ,
	[commPharmacoCin] [T_MEMO] NULL ,
	[commElimination] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubPharmacoDynamie]    Script Date: 27/10/2000 10:11:00 ******/
/*CREATE TABLE [dbo].[SubPharmacoDynamie] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[id_SubPharmacoDynamie] [T_COMPTEUR]  NOT NULL ,
	[principal] [T_BOOLEEN] NULL ,
	[comm] [T_MEMO] NOT NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubPoso]    Script Date: 27/10/2000 10:11:00 ******/
/*CREATE TABLE [dbo].[SubPoso] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[comm] [T_MEMO] NOT NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubPosoStruc]    Script Date: 27/10/2000 10:11:00 ******/
/*CREATE TABLE [dbo].[SubPosoStruc] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[id_SubPosoStruc] [T_COMPTEUR] NOT NULL ,
	[naturePosologie] [T_TEXTE_LONG] NULL ,
	[voie] [T_TEXTE_LONG] NULL ,
	[sexe] [T_LIBELLE_1] NOT NULL ,
	[classeAge] [T_TEXTE_LONG] NULL ,
	[etatPreexistant] [T_TEXTE_LONG] NULL ,
	[indication] [T_TEXTE_LONG] NULL ,
	[posologie] [T_libelle128] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubPropPharmaco]    Script Date: 27/10/2000 10:11:00 ******/
/*CREATE TABLE [dbo].[SubPropPharmaco] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[id_SubPropPharmaco] [T_COMPTEUR] NOT NULL ,
	[libelle] [T_TEXTE_LONG] NULL ,
	[qualificatif] [T_TEXTE_LONG] NULL ,
	[comm] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO



/****** Object:  Table [dbo].[Substance]    Script Date: 27/10/2000 10:11:00 ******/
CREATE TABLE [dbo].[Substance] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[bValid] [T_BOOLEEN] NOT NULL ,
	[bEnCours] [T_BOOLEEN] NOT NULL ,
	[NomUser] [T_TEXTE_LONG] NULL ,
	[denomSub] [T_LIBELLE_100] NOT NULL ,
	[homeo] [T_LIBELLE_1] NOT NULL ,
	[CAS] [T_libelle15] NULL ,
	[CASReplaced] [T_libelle15] NULL ,
	[nature] [T_TEXTE_LONG] NULL ,
	[chimie] [T_MEMO] NULL ,
	[liste] [T_TEXTE_LONG] NULL ,
	[commListe] [T_TEXTE_LONG] NULL ,
	[origineExcipient] [T_LIBELLE_1] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL ,
	[dRevis] [T_DATE_SYST] NULL ,
	[ClassDopant] [T_Texte_Long] NULL ,
	[id_T_Sub] [T_COMPTEUR] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SubSurdosage]    Script Date: 27/10/2000 10:11:00 ******/
/*CREATE TABLE [dbo].[SubSurdosage] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[bibliographie] [T_MEMO] NULL ,
	[commTrait] [T_MEMO] NULL ,
	[comm] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL ,
	[dModif] [T_DATE_SYST] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SubVoie]    Script Date: 27/10/2000 10:11:01 ******/
/*CREATE TABLE [dbo].[SubVoie] (
	[id_Substance] [T_COMPTEUR] NOT NULL ,
	[voie] [T_TEXTE_LONG] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SynonyCI_Rel]    Script Date: 27/10/2000 10:11:01 ******/
CREATE TABLE [dbo].[SynonyCI_Rel] (
	[id_T_SynonyCI] [T_COMPTEUR] NOT NULL ,
	[id_T_CI] [T_COMPTEUR] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SynonyClassChim_Rel]    Script Date: 27/10/2000 10:11:01 ******/
/*CREATE TABLE [dbo].[SynonyClassChim_Rel] (
	[id_T_SynonyClassChim] [T_COMPTEUR] NOT NULL ,
	[id_T_ClassChim] [T_COMPTEUR] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SynonyEII_Rel]    Script Date: 27/10/2000 10:11:01 ******/
/*CREATE TABLE [dbo].[SynonyEII_Rel] (
	[id_T_SynonyEII] [T_COMPTEUR] NOT NULL ,
	[id_T_EII] [T_COMPTEUR] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SynonyIndic_Rel]    Script Date: 27/10/2000 10:11:01 ******/
CREATE TABLE [dbo].[SynonyIndic_Rel] (
	[id_T_SynonyIndic] [T_COMPTEUR] NOT NULL ,
	[id_T_Indic] [T_COMPTEUR] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SynonyPE_Rel]    Script Date: 27/10/2000 10:11:01 ******/
/*CREATE TABLE [dbo].[SynonyPE_Rel] (
	[id_T_SynonyPE] [T_COMPTEUR] NOT NULL ,
	[id_T_PE] [T_COMPTEUR] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SynonyTermeRech]    Script Date: 27/10/2000 10:11:01 ******/
/*CREATE TABLE [dbo].[SynonyTermeRech] (
	[id_SynonyTermeRech] [T_COMPTEUR]  NOT NULL ,
	[libelle] [T_LIBELLE_100] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[SynonyTermeRech_TermeRechIndic]    Script Date: 27/10/2000 10:11:01 ******/
/*CREATE TABLE [dbo].[SynonyTermeRech_TermeRechIndic] (
	[id_SynonyTermeRech] [T_COMPTEUR] NOT NULL ,
	[id_TermeRechIndic] [T_COMPTEUR] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[T_CI]    Script Date: 27/10/2000 10:11:01 ******/
CREATE TABLE [dbo].[T_CI] (
	[id_T_CI] [T_COMPTEUR]  NOT NULL ,
	[libelle] [T_LIBELLE_100] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL ,
	[validation] [T_LIBELLE_1] NULL ,
	[remarques] [T_MEMO] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[T_CI_CIMCI_Rel]    Script Date: 27/10/2000 10:11:02 ******/
CREATE TABLE [dbo].[T_CI_CIMCI_Rel] (
	[id_T_CI] [T_COMPTEUR] NOT NULL ,
	[id_CimCI] [T_COMPTEUR] NOT NULL ,
	[synonymie] [T_BOOLEEN] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[T_ClassChim]    Script Date: 27/10/2000 10:11:02 ******/
/*CREATE TABLE [dbo].[T_ClassChim] (
	[id_T_ClassChim] [T_COMPTEUR] NOT NULL ,
	[libelle] [T_LIBELLE_100] NOT NULL ,
	[source] [T_TEXTE_LONG] NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL ,
	[validation] [T_LIBELLE_1] NULL ,
	[remarques] [T_MEMO] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[T_EII]    Script Date: 27/10/2000 10:11:02 ******/
/*CREATE TABLE [dbo].[T_EII] (
	[id_T_EII] [T_COMPTEUR]  NOT NULL ,
	[libelle] [T_LIBELLE_100] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL ,
	[validation] [T_LIBELLE_1] NULL ,
	[remarques] [T_MEMO] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[T_EII_CimEII_Rel]    Script Date: 27/10/2000 10:11:02 ******/
/*CREATE TABLE [dbo].[T_EII_CimEII_Rel] (
	[id_T_EII] [T_COMPTEUR] NOT NULL ,
	[id_CimEII] [T_COMPTEUR] NOT NULL ,
	[synonymie] [T_BOOLEEN] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[T_Forme]    Script Date: 27/10/2000 10:11:02 ******/
/*CREATE TABLE [dbo].[T_Forme] (
	[id_T_Forme] [T_COMPTEUR] NOT NULL ,
	[terme] [T_TEXTE_LONG] NULL ,
	[utilisable] [T_BOOLEEN] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[T_Indic]    Script Date: 27/10/2000 10:11:02 ******/
CREATE TABLE [dbo].[T_Indic] (
	[id_T_Indic] [T_COMPTEUR]  NOT NULL ,
	[libelle] [T_LIBELLE_100] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL ,
	[validation] [T_LIBELLE_1] NULL ,
	[remarques] [T_MEMO] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[T_PE]    Script Date: 27/10/2000 10:11:02 ******/
/*CREATE TABLE [dbo].[T_PE] (
	[id_T_PE] [T_COMPTEUR]  NOT NULL ,
	[libelle] [T_LIBELLE_100] NOT NULL ,
	[creation] [T_DATE_SYST] NOT NULL ,
	[validation] [T_LIBELLE_1] NULL ,
	[texte] [T_MEMO] NULL ,
	[remarques] [T_MEMO] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[T_PE_CimPE_Rel]    Script Date: 27/10/2000 10:11:02 ******/
/*CREATE TABLE [dbo].[T_PE_CimPE_Rel] (
	[id_CimPE] [T_COMPTEUR] NOT NULL ,
	[id_T_PE] [T_COMPTEUR] NOT NULL ,
	[synonymie] [T_BOOLEEN] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[T_Sub]    Script Date: 27/10/2000 10:11:02 ******/
CREATE TABLE [dbo].[T_Sub] (
	[id_T_Sub] [T_COMPTEUR] NOT NULL ,
	[libelle] [T_LIBELLE_100] NOT NULL ,
	[homeopathie] [T_LIBELLE_1] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[DC] [T_TEXTE_LONG] NULL ,
	[complementIndexSub] [T_BOOLEEN] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[T_SynonyCI]    Script Date: 27/10/2000 10:11:03 ******/
CREATE TABLE [dbo].[T_SynonyCI] (
	[id_T_SynonyCI] [T_COMPTEUR]  NOT NULL ,
	[libelle] [T_LIBELLE_100] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[T_SynonyClassChim]    Script Date: 27/10/2000 10:11:03 ******/
/*CREATE TABLE [dbo].[T_SynonyClassChim] (
	[id_T_SynonyClassChim] [T_COMPTEUR] NOT NULL ,
	[libelle] [T_LIBELLE_100] NOT NULL ,
	[source] [T_TEXTE_LONG] NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[T_SynonyEII]    Script Date: 27/10/2000 10:11:03 ******/
/*CREATE TABLE [dbo].[T_SynonyEII] (
	[id_T_SynonyEII] [T_COMPTEUR]  NOT NULL ,
	[libelle] [T_LIBELLE_100] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[T_SynonyIndic]    Script Date: 27/10/2000 10:11:03 ******/
CREATE TABLE [dbo].[T_SynonyIndic] (
	[id_T_SynonyIndic] [T_COMPTEUR]  NOT NULL ,
	[libelle] [T_LIBELLE_100] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[T_SynonyPE]    Script Date: 27/10/2000 10:11:03 ******/
/*CREATE TABLE [dbo].[T_SynonyPE] (
	[id_T_SynonyPE] [T_COMPTEUR]  NOT NULL ,
	[libelle] [T_LIBELLE_100] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[T_SynonySub]    Script Date: 27/10/2000 10:11:03 ******/
CREATE TABLE [dbo].[T_SynonySub] (
	[id_T_SynonySub] [T_COMPTEUR] NOT NULL ,
	[libelle] [T_LIBELLE_100] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[source] [T_TEXTE_LONG] NULL ,
	[DC] [T_TEXTE_LONG] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TermeRechGroupIndic_Rel]    Script Date: 27/10/2000 10:11:03 ******/
/*CREATE TABLE [dbo].[TermeRechGroupIndic_Rel] (
	[id_GroupIndic] [T_COMPTEUR] NOT NULL ,
	[id_TermeRechIndic] [T_COMPTEUR] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[creation] [T_DATE_SYST] NOT NULL ,
	[blocageCIM] [T_BOOLEEN] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[TermeRechIndic]    Script Date: 27/10/2000 10:11:03 ******/
/*CREATE TABLE [dbo].[TermeRechIndic] (
	[id_TermeRechIndic] [T_COMPTEUR] NOT NULL ,
	[terme] [T_TEXTE_LONG] NOT NULL 
) ON [PRIMARY]*/
GO

/****** Object:  Table [dbo].[Tetiere]    Script Date: 27/10/2000 10:11:03 ******/
/*CREATE TABLE [dbo].[Tetiere] (
	[id_SpeCompo] [T_COMPTEUR] NULL ,
	[id_DicoSpeCondi] [T_COMPTEUR] NULL ,
	[id_DicoSpePriseUnit] [T_COMPTEUR] NULL ,
	[id_Tetiere] [T_COMPTEUR] NOT NULL ,
	[quantite] [T_OVP_FLOAT] NULL ,
	[unite] [T_TEXTE_LONG] NULL ,
	[complement] [T_libelle50] NULL ,
	[defaut] [T_BOOLEEN] NOT NULL ,
	[ordre] [T_ORDRE] NOT NULL 
) ON [PRIMARY]*/
GO



CREATE TABLE [dbo].[Documents] (
	[id_document] T_COMPTEUR NOT NULL ,
	[nom_fichier] T_LIBELLE15 NULL ,
	[id_type] T_OVP_ENTIERS NULL ,
	[html] T_MEMO NULL ,
	[sgm] T_MEMO NULL ,
	[date_maj] [datetime] NULL ,
	[valide] T_BOOLEEN NULL ,
             CONSTRAINT PK_Documents PRIMARY KEY (id_document)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


CREATE TABLE [dbo].[Type_Documents] (
	[id_type] T_COMPTEUR NOT NULL ,
	[nom] varchar(25) NOT NULL ,
         CONSTRAINT PK_Type_Documents PRIMARY KEY (id_type)
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Presentation_Documents] (
	[id_presentation] T_OVP_ENTIERS NOT NULL ,
	[id_document] T_OVP_ENTIERS NOT NULL ,
         CONSTRAINT PK_Presentation_Documents PRIMARY KEY (id_presentation, id_document)
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[T_Sub_Parent] (
	[id_T_Sub_F] [T_OVP_ENTIERS] NOT NULL ,
	[id_T_Sub_P] [T_OVP_ENTIERS] NOT NULL ,
	[Synonyme] [T_OVP_ENTIERS] NOT NULL ,
	[ouvrage] [T_OVP_ENTIERS] NOT NULL,
        CONSTRAINt PK_T_Sub_Parent PRIMARY KEY (id_T_Sub_F, id_T_Sub_P, Synonyme, ouvrage) 
)
GO


CREATE TABLE [dbo].[T_Sub_Complement] (
	[id_T_Sub] [T_OVP_ENTIERS] NOT NULL ,
	[libelle] [T_LIBELLE_100] NOT NULL ,
	[indexMV] [T_OVP_ENTIERS] NULL ,
	[RoleCompo] [T_OVP_ENTIERS] NULL ,
	[RoleCompoHerite] [T_OVP_ENTIERS] NULL,
         CONSTRAINT PK_T_Sub_Complement PRIMARY KEY (id_T_Sub) 
)
GO


/*CREATE TABLE [dbo].[SpeNbSubs] (
	[id_Specialite] [int] NOT NULL ,
	[PA] [int] NULL ,
	[Excipient] [int] NULL ,
     CONSTRAINt PK_SpeNbSubs PRIMARY KEY (id_specialite)
)*/
GO

/* CREATE TABLE [dbo].[SpeGroupeDCI] (
	[id_specialite] [T_OVP_ENTIERS] NOT NULL ,
	[id_GroupeDCI] [T_OVP_ENTIERS] NOT NULL,
       PRIMARY KEY (id_specialite) 
) */
--GO

/* CREATE TABLE [dbo].[GroupeDCI] (
	[id_groupeDCI] [T_COMPTEUR] NOT NULL ,
	[libelle] [T_TEXTE_LONG] NULL ,
	[forme] [T_TEXTE_LONG] NULL ,
	[CodeIndic] [T_OVP_ENTIERS] NOT NULL ,
	[CodeCI] [T_OVP_ENTIERS] NOT NULL ,
	[CodeIAM] [T_OVP_ENTIERS] NOT NULL ,
	[CodeExpEN] [T_OVP_ENTIERS] NOT NULL ,
        PRIMARY KEY (id_groupeDCI)
) */
--GO

CREATE TABLE [dbo].[GroupIndic_DicoRF_CIM_Rel] (
	[id_GroupIndic] [T_COMPTEUR] NOT NULL ,
	[id_DicoRF_CIM] [T_COMPTEUR] NOT NULL ,
	[id_DicoQualifLienTerme] [T_COMPTEUR] NOT NULL ,
	[texte] [T_MEMO] NULL ,
	[dCreat] [T_DATE_SYST] NOT NULL 
)
GO



/* ============================================================ */
/*   Table : SUBSTANCE_ETENDUE                                  */
/* ============================================================ */
/* create table Substance_Etendue
(
    ID_SUBSTANCE              T_COMPTEUR            not null
    OMS                       varchar(10)           null    
    CLASSEDOPANT              varchar(2)            null    
    constraint PK_SUBSTANCE_ETENDUE primary key (ID_SUBSTANCE)
) */
/*CREATE TABLE [dbo].[T_SUB_Etendue] (
	[id_T_SUB] [T_COMPTEUR] NOT NULL, 
	[Matricule] [char] (5) NOT NULL, 
	[LibelleFrancais] [varchar] (127) NULL, 
	[libelleAnglais] [varchar] (127) NULL, 
	[libelleLatin] [varchar] (127) NULL ,
	[DCI] [T_BOOLEEN] NULL, 
	[DCF] [T_BOOLEEN] NULL, 
	[DCL] [T_BOOLEEN] NULL ,
	[classDopant] [T_TEXTE_LONG] NULL 
	CONSTRAINT [PK_T_SUB_ETENDUE] PRIMARY KEY ([id_T_SUB])
)*/
go

/*
ALTER TABLE [dbo].[T_SUB_Etendue] 
	ADD CONSTRAINT [FK_t_sub_REF_t_sub_etendue] FOREIGN KEY 
	([id_T_SUB]) REFERENCES [dbo].[T_Sub] ([id_T_Sub])
*/
--JFO 12/01/2006 : IDENTITY(1,1)
CREATE TABLE [dbo].[UCD] (
	[id_ucd] [int] NOT NULL IDENTITY(1,1),
	[Code_Ucd] [varchar] (50) NOT NULL ,
	[Code_Cip] [varchar] (7) NOT NULL ,
	[Libelle_Ucd] [varchar] (255) NOT NULL ,
	[EPhMRA] [varchar] (50) NULL 
) ON [PRIMARY]
GO


/*

if exists (select * from sysobjects where id = object_id(N'[dbo].[PresRemplace]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PresRemplace]


CREATE TABLE [dbo].[PresRemplace] (
	[id_PresRemplace] [T_COMPTEUR] NOT NULL ,
	[id_DicoRefSource] [T_COMPTEUR] NOT NULL ,
	[id_DicoTypeRp] [T_COMPTEUR] NULL ,
	[remplacant] [T_COMPTEUR] NOT NULL ,
	[remplace] [T_COMPTEUR] NOT NULL ,
	[dSource_remplace] [datetime] NOT NULL 
)




if exists (select * from sysobjects where id = object_id(N'[dbo].[Presentation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Presentation]


CREATE TABLE [dbo].[Presentation] (
	[id_Presentation] [T_COMPTEUR] NOT NULL ,
	[id_DicoSpePrescinit] [T_COMPTEUR] NULL ,
	[id_DicoSpePrescReserve] [T_COMPTEUR] NULL ,
	[id_RenouvellPresc] [T_COMPTEUR] NULL ,
	[id_DicoActeB2] [T_COMPTEUR] NULL ,
	[id_DicoComListe] [T_COMPTEUR] NULL ,
	[id_DicoListeDuree] [T_COMPTEUR] NULL ,
	[id_DicoEphmra] [T_COMPTEUR] NULL ,
	[id_DicoInventorex] [T_COMPTEUR] NULL ,
	[id_DicoSpeTva] [T_COMPTEUR] NULL ,
	[id_Specialite] [T_COMPTEUR] NULL ,
	[id_DicoClassIMS] [T_COMPTEUR] NULL ,
	[id_TypePPTTC] [T_COMPTEUR] NULL ,
	[id_TypeBaseRemb] [T_COMPTEUR] NULL ,
	[id_Couleur] [T_COMPTEUR] NULL ,
	[id_Taille] [T_COMPTEUR] NULL ,
	[CipOuAcl] [char] (7) NULL ,
	[ucd] [varchar] (7) NULL ,
	[ammEurope] [varchar] (20) NULL ,
	[cbCuvSemp] [char] (10) NULL ,
	[Ean13imprime] [char] (13) NULL ,
	[PPTTC] [real] NULL ,
	[PAPharmacienHT] [real] NULL ,
	[PFabricant] [real] NULL ,
	[PHopitaux] [real] NULL ,
	[BaseRemb] [real] NULL ,
	[PoidsBrut] [real] NULL ,
	[PoidsNet] [real] NULL ,
	[VolumeNet] [real] NULL ,
	[Condi] [varchar] (50) NULL ,
	[Nom_Court] [varchar] (45) NULL ,
	[Nom_Etendue] [varchar] (50) NULL ,
	[Present_Etendue] [varchar] (50) NULL ,
	[Nom_long] [varchar] (127) NOT NULL ,
	[post_it] [text] NULL ,
	[nature_surveillance] [text] NULL ,
	[surveillance] [T_BOOLEEN] NULL ,
	[dCreate] [datetime] NULL ,
	[dModif] [datetime] NULL ,
	[dArchive] [datetime] NULL ,
	[Remuneration] [T_BOOLEEN] NULL ,
	[UserId] [int] NULL ,
	[LockedBy] [int] NULL ,
	[ordre] [int] NULL ,
	[codeReferantGenerique] [T_LIBELLE_1] NULL ,
	[cipreferant] [T_libelle7] NULL ,
	[Disponibilite] [T_libelle128] NULL ,
	[nbPrise] [int] NULL ,
	[PriseUnitaire] [T_TEXTE_LONG] NULL ,
	[lieuDispo] [T_TEXTE_LONG] NULL ,
	[condDispo] [T_TEXTE_LONG] NULL ,
	[remplace] [T_libelle7] NULL ,
	[sourceRemplace] [T_TEXTE_LONG] NULL ,
	[dateSourceRemplace] [T_DATE_SYST] NULL ,
	[remplacePar] [T_libelle7] NULL ,
	[sourceRemplacePar] [T_TEXTE_LONG] NULL ,
	[dateSourceRemplacePar] [T_DATE_SYST] NULL ,
	[id_DicoCodeGene] [T_COMPTEUR] NULL 
)


*/