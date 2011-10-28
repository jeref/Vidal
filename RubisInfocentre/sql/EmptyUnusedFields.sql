-- Modif seb 06 10 04
-- Specialite. NumDosAmm
-- SpePE. ArgumentaireAuteur, dCreat, dModif
-- SpeCI. ArgumentaireAuteur, dCreat, dModif, CommAMM
-- SpeIndic. ArgumentaireAuteur, dCreat, dModif, CommAMM
-- SubPE. dCreat, dModif
-- SpeSuiviSGML. CommTexte, dCreat
-- T_SynonyCI. Texte, Creation
-- T_SynonyIndic. Texte, Creation
-- T_SynonySub. Texte, Source
-- SynonyCI_Rel. Texte, Creation
-- SynonyIndic_Rel. Texte, Creation
-- CoupleTermeSynonyme. Texte, Creation
-- CoupleTermeTerme. Texte
-- IndexSub_Rel. Texte
-- GroupIndicIndic_Rel. Texte, Creation
-- GroupIndic_DicoRF_CIM_Rel. Texte, dCreat
-- RMOClass. Remarque, dCreat, dRevis, dModif
-- Laboratoire. Commentaire

/* Table specialite */
ALTER TABLE dbo.Specialite ALTER COLUMN dCreat T_Date_Syst NULL 
GO
ALTER TABLE dbo.Specialite ALTER COLUMN bValid T_Booleen NULL 
GO
ALTER TABLE dbo.Specialite ALTER COLUMN bEnCours T_Booleen NULL 
GO
UPDATE dbo.Specialite
SET 
  bValid = NULL , 
  bEnCours = NULL , 
  NomUser = NULL ,
  numdosAMM = NULL ,
  Source = NULL ,
  DateSource = NULL ,
  Remarques = NULL ,
  dCreat = NULL ,
  dModif = NULL ,
  dRevis = NULL
GO

/* Table SpePresentation */
ALTER TABLE dbo.SpePresentation
  ALTER COLUMN dCreat T_Date_Syst NULL
GO
UPDATE dbo.SpePresentation
SET 
  PrixProdHTF = NULL ,
  PrixPublicTTCF = NULL ,
  dCreat = NULL ,
  dModif = NULL ,
  dRevis = NULL
GO

/* Table SpeEvt */
UPDATE dbo.SpeEvt
SET 
  Source = NULL ,
  DateSource = NULL ,
  TraiteEven = NULL
GO

/* Table IAMClass */
ALTER TABLE dbo.IAMClass
  ALTER COLUMN dCreat T_Date_Syst NULL
GO
UPDATE dbo.IAMClass
SET 
  Remarque = NULL ,
  dCreat = NULL ,
  dModif = NULL ,
  dRevis = NULL
GO

/* Table IAMCouple */
ALTER TABLE dbo.IAMCouple
  ALTER COLUMN dCreat T_Date_Syst NULL
GO
UPDATE dbo.IAMCouple
SET 
  Remarque = NULL ,
  dCreat = NULL ,
  dModif = NULL ,
  dRevis = NULL
GO

/* Table SpePoso */
ALTER TABLE dbo.SpePoso
  ALTER COLUMN dCreat T_Date_Syst NULL
GO
ALTER TABLE dbo.SpePoso
  ALTER COLUMN RelecturePar T_Libelle_1 NULL
GO
UPDATE dbo.SpePoso
SET 
  id_SpePrise = NULL , 
  RelecturePar = NULL , 
  dCreat = NULL ,
  dModif = NULL ,
  dRevis = NULL
GO

/* Table T_CI */
ALTER TABLE dbo.T_CI
  ALTER COLUMN Creation T_Date_Syst NULL
GO
UPDATE dbo.T_CI
SET 
  Texte = NULL ,
  Creation = NULL ,
  Validation = NULL ,
  Remarques = NULL
GO

/* Table T_Indic */
ALTER TABLE dbo.T_Indic
  ALTER COLUMN Creation T_Date_Syst NULL
GO
UPDATE dbo.T_Indic
SET 
  Texte = NULL , 
  Creation = NULL , 
  Remarques = NULL
GO
UPDATE dbo.T_Indic
SET Validation = NULL
WHERE UPPER(Validation) <> 'R'
GO

/* Table Laboratoire */
ALTER TABLE dbo.Laboratoire
  ALTER COLUMN dCreat T_Date_Syst NULL
GO
UPDATE dbo.Laboratoire
SET 
  Commentaire = Null,
  dCreat = NULL ,
  dModif = NULL ,
  dRevis = NULL
GO

/* Table T_Sub */
ALTER TABLE dbo.T_Sub
  ALTER COLUMN ComplementIndexSub T_Booleen NULL
GO
UPDATE dbo.T_Sub
SET 
  Texte = NULL , 
  ComplementIndexSub = NULL
GO

/* Table substance */
ALTER TABLE dbo.Substance
  ALTER COLUMN dCreat T_Date_Syst NULL
GO
ALTER TABLE dbo.Substance
  ALTER COLUMN bValid T_Booleen NULL
GO
ALTER TABLE dbo.Substance
  ALTER COLUMN bEnCours T_Booleen NULL
GO
UPDATE dbo.Substance
SET 
  bValid = NULL , 
  bEnCours = NULL , 
  NomUser = NULL ,
  dCreat = NULL ,
  dModif = NULL ,
  dRevis = NULL
GO

/* Table RMC_THE */
UPDATE dbo.RMC_THE
SET 
  THE_VIS = NULL , 
  DAT_MAJ = NULL ,
  USR_MAJ = NULL ,
  OBS_MAJ = NULL
GO

UPDATE dbo.SpePresentation
SET
  FicheCaracteristique = NULL
GO

ALTER TABLE dbo.SpePE Alter COLUMN dCreat T_Date_Syst NULL 
GO
Update SpePE
Set
  ArgumentaireAuteur = Null,
  dCreat = Null,
  dModif = Null
GO

ALTER TABLE dbo.SpeCI Alter COLUMN dCreat T_Date_Syst NULL 
GO
Update SpeCI
Set
  ArgumentaireAuteur = Null,
  CommAMM = Null,
  dCreat = Null,
  dModif = Null
GO

ALTER TABLE dbo.SpeIndic Alter COLUMN dCreat T_Date_Syst NULL 
GO
Update SpeIndic
Set
  ArgumentaireAuteur = Null,
  CommAMM = Null,
  dCreat = Null,
  dModif = Null
GO

ALTER TABLE dbo.SubPE Alter COLUMN dCreat T_Date_Syst NULL 
GO
Update SubPE
Set
  dCreat = Null,
  dModif = Null
GO

ALTER TABLE dbo.SpeSuiviSGML Alter COLUMN dCreat T_Date_Syst NULL 
GO
Update SpeSuiviSGML
Set 
  CommTexte = Null,
  dCreat = Null
GO

ALTER TABLE dbo.T_SynonyCI Alter COLUMN Creation T_Date_Syst NULL 
GO
Update T_SynonyCI
Set 
  Texte = Null,
  Creation = Null
GO

ALTER TABLE dbo.T_SynonyIndic Alter COLUMN Creation T_Date_Syst NULL 
GO
Update T_SynonyIndic
Set 
  Texte = Null,
  Creation = Null
GO

Update T_SynonySub
Set 
  Texte = Null,
  Source = Null
GO

ALTER TABLE dbo.SynonyCI_Rel Alter COLUMN Creation T_Date_Syst NULL 
GO
Update SynonyCI_Rel
Set
  Texte = Null,
  Creation = Null
GO

ALTER TABLE dbo.SynonyIndic_Rel Alter COLUMN Creation T_Date_Syst NULL 
GO
Update SynonyIndic_Rel
Set
  Texte = Null,
  Creation = Null
GO

ALTER TABLE dbo.CoupleTermeSynonyme Alter COLUMN Creation T_Date_Syst NULL 
GO
Update CoupleTermeSynonyme
Set
  Texte = Null,
  Creation = Null
GO

Update CoupleTermeTerme
Set
  Texte = Null
GO

Update IndexSub_Rel
Set
  Texte = Null
GO

ALTER TABLE dbo.GroupIndicIndic_Rel Alter COLUMN Creation T_Date_Syst NULL 
GO
Update GroupIndicIndic_Rel
Set
  Texte = Null,
  Creation = Null
GO

ALTER TABLE dbo.GroupIndic_DicoRF_CIM_Rel Alter COLUMN dCreat T_Date_Syst NULL 
GO
Update GroupIndic_DicoRF_CIM_Rel
Set
  Texte = Null,
  dCreat = Null
GO

ALTER TABLE dbo.RMOClass Alter COLUMN dCreat T_Date_Syst NULL 
GO
Update RMOClass
Set
  Remarque = Null,
  dCreat = Null,
  dModif = Null,
  dRevis = Null
GO

Delete From SpeEvt 
Where Evenement like 'Fiche établie sur la base de l''information officielle'
Or Evenement like 'Sage-Femme%'
Or Evenement like 'DL'
Or Evenement like 'B'
Or Evenement like 'Irisé'
GO
