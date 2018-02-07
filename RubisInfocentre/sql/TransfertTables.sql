--**
-- TransfertTables.sql
-- Importation des données
-- JFO 03/07/2006 
-- Modif 10 01 04 : nouveau modele cim10

--INSERT INTO CimCI SELECT * FROM RubisExtraction..INFOIRIS_CimCI                       
INSERT INTO CimCI SELECT id_DicoCim10,Code FROM RubisExtraction..DicoCim10                       
INSERT INTO CoupleTermeSynonyme SELECT * FROM RubisExtraction..INFOIRIS_CoupleTermeSynonyme         
INSERT INTO CoupleTermeTerme SELECT * FROM RubisExtraction..INFOIRIS_CoupleTermeTerme 
GO
--JFO 08/08/05 : "id_GroupeGenerique As id_DicoCodeGene" ... car il a été changé dans Rubis...
INSERT INTO DicoCodeGene SELECT id_GroupeGenerique As id_DicoCodeGene,
 libelle, ordre, CodeIndic, CodeCI, CodeCIAllergies, CodeIAM, CodeExpEN FROM RubisExtraction..INFOIRIS_GroupeGenerique 
INSERT INTO DicoComClassIRIS SELECT id_DicoComClassIRIS, Dic_id_DicoComClassIRIS, Libelle, Ordre, MultiCritere FROM RubisExtraction..DicoComClassIRIS 
--INSERT INTO DicoRF_CIM SELECT * FROM RubisExtraction..DicoRF_CIM 
INSERT INTO DicoRF_CIM SELECT id_DicoCim10,Code,id_DicoCim10 FROM RubisExtraction..DicoCim10
--correction base 60 :delete from DicoRF_CIM; INSERT INTO DicoRF_CIM SELECT id_DicoCim10,Code,id_DicoCim10 FROM test_RubisExtraction..DicoCim10

--JFO 11/08/2005 : correction suite fusion :
--delete from DicoT_ATC_IRIS
--correction base 60 : KO <=>libelle does not allow Null!
--INSERT INTO DicoT_ATC_IRIS SELECT id_DicoT_ATC_IRIS, Dic_id_DicoT_ATC_IRIS, cast(Code + " / " + libATC As VarChar(255)) As libelle, ordre, Code As CodeATC, LibATC FROM test_RubisExtraction..DicoT_ATC_IRIS
--correction base 60 a partir de base 61 : OK
--correction base 62 : libATC est Null ! Utiliser libelle
INSERT INTO DicoT_ATC_IRIS 
SELECT id_DicoT_ATC_IRIS, Dic_id_DicoT_ATC_IRIS, cast(Code + " / " + libelle As VarChar(255)) As libelle, ordre, Code As CodeATC, libelle As LibATC 
FROM RubisExtraction..DicoT_ATC_IRIS where Code is not Null
--select * from DicoT_ATC_IRIS where code is null id_DicoT_ATC_IRIS=5416 5337
--JFO : table vide ! inutilisée...
INSERT INTO DicoEPHMRA SELECT id_DicoEPHMRA, dic_id_DicoEPHMRA, libelle_long As libelle, code, ordre FROM RubisExtraction..INFOIRIS_DicoEPHMRA 
GO

INSERT INTO GroupIndic SELECT * FROM RubisExtraction..INFOIRIS_GroupIndic 
INSERT INTO GroupIndicIndic_Rel SELECT * FROM RubisExtraction..INFOIRIS_GroupIndicIndic_Rel 
INSERT INTO HierarchieCI_Rel SELECT * FROM RubisExtraction..INFOIRIS_HierarchieCI_Rel 
GO

INSERT INTO IAMClass 
SELECT [id_IAMClasse]
      ,left(classe, 65)
      ,[definition]
      ,[remarque]
      ,[dCreat]
      ,[dModif]
      ,[dRevis]
  FROM [RubisExtraction].[dbo].[INFOIRIS_IAMClass];
INSERT INTO IAMClasse_IAMCouple SELECT * FROM RubisExtraction..INFOIRIS_IAMClasse_IAMCouple;
INSERT INTO IAMCouple SELECT * FROM RubisExtraction..INFOIRIS_IAMCouple;
GO

INSERT INTO IndexSub_Rel SELECT * FROM RubisExtraction..INFOIRIS_IndexSub_Rel 
INSERT INTO Laboratoire SELECT DISTINCT Lab.* FROM (RubisExtraction..INFOIRIS_Laboratoire As Lab INNER JOIN RubisExtraction..SpeLab_Rel As SpeLab On Lab.id_Laboratoire=SpeLab.id_Laboratoire) INNER JOIN RubisExtraction..Specialite As Spe On SpeLab.id_Specialite=Spe.id_Specialite Where Spe.idTypeSpe=0
INSERT INTO SpeLabs_Rel SELECT SpeLab.* FROM RubisExtraction..INFOIRIS_SpeLabs_Rel As SpeLab INNER JOIN RubisExtraction..Specialite As Spe ON SpeLab.id_Specialite=Spe.id_Specialite Where idTypeSpe=0
GO

INSERT INTO RMOClass SELECT * FROM RubisExtraction..INFOIRIS_RMOClass 
INSERT INTO SpeCI SELECT SpeCI.* FROM RubisExtraction..INFOIRIS_SpeCI As SpeCI INNER JOIN RubisExtraction..Specialite As Spe ON SpeCI.id_Specialite=Spe.id_Specialite Where idTypeSpe=0
INSERT INTO Specialite SELECT * FROM RubisExtraction..INFOIRIS_Specialite Where idTYpeSpe=0
INSERT INTO Specialite_IAMClass SELECT IAM.* FROM RubisExtraction..INFOIRIS_Specialite_IAMClass As IAM INNER JOIN RubisExtraction..Specialite As Spe ON IAM.id_Specialite=Spe.id_Specialite Where idTypeSpe=0
INSERT INTO SpeClassIRIS SELECT class.* FROM RubisExtraction..INFOIRIS_SpeClassIRIS As class INNER JOIN RubisExtraction..Specialite As Spe ON Class.id_Specialite=Spe.id_Specialite Where idTypeSpe=0      
GO

INSERT INTO SpeCompo SELECT RubisExtraction..INFOIRIS_SpeCompo.* FROM RubisExtraction..INFOIRIS_SpeCompo INNER JOIN Specialite ON RubisExtraction..INFOIRIS_SpeCompo.id_Specialite=Specialite.id_Specialite Where Specialite.idTypeSpe=0         
INSERT INTO SpeConditionnementPrimaire SELECT Prim.* FROM (RubisExtraction..INFOIRIS_SpeConditionnementPrimaire As Prim INNER JOIN RubisExtraction..Presentation As Pres ON Prim.id_Spepresentation=Pres.id_Presentation) INNER JOIN RubisExtraction..Specialite As Spe ON Pres.id_Specialite=Spe.id_Specialite Where IdTypeSpe=0 And Prim.nbCond Is Not Null
INSERT INTO SpeConstituant SELECT Const.* FROM RubisExtraction..INFOIRIS_SpeConstituant As Const INNER JOIN SpeCompo ON Const.id_SpeCompo=SpeCompo.id_SpeCompo
GO
--JFO 11/08/2005 : correction du problème d'insertion multiple dans speevt : PK_speevt
--=>il n'est pas possible d'utiliser INFOIRIS_SpeEvt comme avant (modifié par la fusion) suite à la création de speevttraitement
--test_RubisExtraction=base 60 :delete from SpeEvt; INSERT INTO SpeEvt SELECT Evt.id_SpeEvt, Evt.id_Specialite, Null As Evenement, Null As source, Evt.dateSource, Evt.dateEvenement, Null As traiteEven, Evt.id_DicoSpeEvenement, Evt.datecreation FROM test_RubisExtraction..SpeEvt As Evt INNER JOIN test_RubisExtraction..Specialite As Spe ON Evt.id_Specialite=Spe.id_Specialite Where idTypeSpe=0
INSERT INTO SpeEvt SELECT Evt.id_SpeEvt, Evt.id_Specialite, Null As Evenement, Null As source, Evt.dateSource, Evt.dateEvenement, Null As traiteEven, Evt.id_DicoSpeEvenement, Evt.datecreation 
FROM RubisExtraction..SpeEvt As Evt INNER JOIN RubisExtraction..Specialite As Spe ON Evt.id_Specialite=Spe.id_Specialite Where idTypeSpe=0

--JFO 03/07/2006 : corection Bug 2465 : récupération de l'évènement "Radiation du remboursement"
-- 04/07/2006 : utiliser plutôt DicoActeB2 qui évitera de mettre un évènement à un produit hospitalier (forfait hospitalier) vu avec PBR
INSERT INTO SpeEvtPresentation SELECT Evt.* FROM (RubisExtraction..INFOIRIS_SpeEvtPresentation As Evt INNER JOIN RubisExtraction..Presentation As Pres ON Evt.id_Spepresentation=Pres.id_Presentation) INNER JOIN RubisExtraction..Specialite As Spe ON Pres.id_Specialite=Spe.id_Specialite Where IdTypeSpe=0 And (Evt.Evenement like 'Remboursé à %' Or Evt.Evenement like 'Radiation%remboursement')
GO
--Ajout JFO 01/09/2005 : correction Bug 1566 et 1565
UPDATE SpeEvtPresentation SET DateEvenement = DateSource where DateEvenement is Null And DateSource is not null
UPDATE SpeEvtPresentation SET DateEvenement = '14-07-1789' where DateEvenement is Null
GO
--JFO 18/08/2005 : correction Bug 1567 : Doublons d'événements de remboursement 
delete from speevtpresentation where speevtpresentation.id_SpeEvtPresentation in ( select evt.id_SpeEvtPresentation
from speevtpresentation as evt1, speevtpresentation as evt 
--left outer join RubisExtraction..presrembindic ON RubisExtraction..presrembindic.id_SpeEvtPresentation = evt.id_SpeEvtPresentation
where evt1.id_SpePresentation = evt.id_SpePresentation And evt.dateEvenement < evt1.dateEvenement
)
GO

INSERT INTO SpeIndic SELECT Indic.* FROM RubisExtraction..INFOIRIS_SpeIndic As Indic INNER JOIN RubisExtraction..Specialite As Spe ON Indic.id_Specialite=Spe.id_Specialite Where idTypeSpe=0
INSERT INTO SpePE SELECT SpePE.* FROM RubisExtraction..INFOIRIS_SpePE As SpePE INNER JOIN RubisExtraction..Specialite As Spe ON SpePE.id_Specialite=Spe.id_Specialite Inner Join RubisExtraction..SpePE As SpePE_ref On SpePE.id_SpePE = SpePE_Ref.id_SpePE Inner Join RubisExtraction..T_PE As T_PE On SpePE_Ref.id_T_PE = T_PE.id_T_PE Where idTypeSpe=0 And T_PE.Texte like 'VU PE%'
GO
--JFO 10/08/2005 delete from SpePharmacodynamie 
INSERT INTO SpePharmacodynamie SELECT Pharmaco.id_Specialite, Pharmaco.CodeATC + " / " + Pharmaco.ATC_IRIS As ATC_IRIS, Pharmaco.bATC, Pharmaco.codeEPHMRA, Pharmaco.commAMM, Pharmaco.dCreat, Pharmaco.dModif, Pharmaco.CodeATC, Pharmaco.LibATC FROM RubisExtraction..INFOIRIS_SpePharmacodynamie As Pharmaco INNER JOIN RubisExtraction..Specialite As Spe ON Pharmaco.id_Specialite=Spe.id_Specialite Where idTypeSpe=0
--pour correction 60 :INSERT INTO SpePharmacodynamie SELECT Pharmaco.id_Specialite, Pharmaco.CodeATC + " / " + Pharmaco.ATC_IRIS As ATC_IRIS, Pharmaco.bATC, Pharmaco.codeEPHMRA, Pharmaco.commAMM, Pharmaco.dCreat, Pharmaco.dModif, Pharmaco.CodeATC, Pharmaco.LibATC FROM test_RubisExtraction..INFOIRIS_SpePharmacodynamie As Pharmaco INNER JOIN test_RubisExtraction..Specialite As Spe ON Pharmaco.id_Specialite=Spe.id_Specialite Where idTypeSpe=0
UPDATE SpePharmacodynamie set ATC_IRIS = 'NON RENSEIGNE' where ATC_IRIS like 'Z00 /%'

INSERT INTO SpePresentation SELECT Pres.* FROM RubisExtraction..INFOIRIS_Presentation As Pres INNER JOIN RubisExtraction..Specialite As Spe ON Pres.id_Specialite=Spe.id_Specialite Where idTypeSpe=0

INSERT INTO SpeSuiviSGML SELECT Suivi.* FROM (RubisExtraction..INFOIRIS_SpeSuiviSGML As Suivi INNER JOIN RubisExtraction..Presentation As Pres ON Suivi.id_SpePresentation=Pres.id_Presentation) INNER JOIN RubisExtraction..Specialite As Spe ON Pres.id_Specialite=Spe.id_Specialite Where IdTypeSpe=0
INSERT INTO SpeVoie SELECT Voie.* FROM RubisExtraction..INFOIRIS_SpeVoie As Voie INNER JOIN RubisExtraction..Specialite As Spe ON Voie.id_Specialite=Spe.id_Specialite Where idTypeSpe=0
GO

INSERT INTO SubPE SELECT * FROM RubisExtraction..INFOIRIS_SubPE          
GO

INSERT INTO SynonyCI_Rel SELECT * FROM RubisExtraction..INFOIRIS_SynonyCI_Rel 
INSERT INTO SynonyIndic_Rel SELECT * FROM RubisExtraction..INFOIRIS_SynonyIndic_Rel 
GO

INSERT INTO T_CI SELECT * FROM RubisExtraction..INFOIRIS_T_CI                       
--INSERT INTO T_CI_CIMCI_Rel SELECT * FROM RubisExtraction..INFOIRIS_T_CI_CIMCI_Rel 
INSERT INTO T_CI_CIMCI_Rel SELECT * FROM RubisExtraction..CICim10 
GO
--JFO 9/01/2006 :
--création des liens avec les CI des ancètres (en fonction de DicoCim10)
begin TRAN
set NOCOUNT ON
DECLARE @id_T_CI INT
DECLARE @id_CimCI INT
DECLARE @Dic_id_Cim10 INT
DECLARE @synonymie As [T_BOOLEEN]
if exists (select name from sysobjects where id = object_id(N'[dbo].[T_CI_CIMCI_Rel_H]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_CI_CIMCI_Rel_H]

CREATE TABLE [dbo].[T_CI_CIMCI_Rel_H] (
	[id_T_CI] Int Not Null,
	[id_CimCI] Int Not Null,
	[synonymie] T_BOOLEEN Not Null
)

DECLARE @Cur CURSOR
SET @Cur = CURSOR LOCAL FOR 
SELECT distinct id_CimCI, synonymie FROM T_CI_CIMCI_Rel 
--SELECT distinct id_CimCI FROM T_CI_CIMCI_Rel 
OPEN @Cur
--boucle sur les CimCI : 
FETCH NEXT FROM @Cur INTO @id_CimCI, @synonymie
WHILE ( @@FETCH_STATUS = 0 )
BEGIN
--print 'Cim10 = ' + cast(@id_CimCI As VARCHAR )
--recuperation du Cim10 père :
set @Dic_id_Cim10 = 0
set @Dic_id_Cim10 = (select Dic_id_DicoCim10 from RubisExtraction..DicoCIm10 where id_DicoCim10= @id_CimCI)
--print 'Cim10 pere =' + cast(@Dic_id_Cim10 As VARCHAR )
--boucle sur tous les ancètres
WHILE (@Dic_id_Cim10 <> 0 )
BEGIN 
	--print 'insertion nouvelle CI pour ' + cast(@id_CimCI As VARCHAR ) + ' ' + cast(@synonymie As VARCHAR )
	insert into T_CI_CIMCI_Rel_H (id_T_CI, id_CimCI, synonymie)
		select id_T_CI, @id_CimCI, @synonymie from T_CI_CIMCI_Rel where id_CimCI = @Dic_id_Cim10
					--@synonymie
	set @Dic_id_Cim10 = 0
	set @Dic_id_Cim10 = (select Dic_id_DicoCim10 from RubisExtraction..DicoCIm10 where id_DicoCim10= @Dic_id_Cim10)
END
--récupération du CimCI suivant.
FETCH NEXT FROM @Cur INTO @id_CimCI, @synonymie
END
CLOSE @Cur
DEALLOCATE @Cur
Print 'Nombre des CI hierarchiques :' 
select count(*) from T_CI_CIMCI_Rel_H
Print 'Nombre des CI deja existantes :'
select count(*) from T_CI_CIMCI_Rel
Print 'Nombre des CI a inserer :'
select count(*) from T_CI_CIMCI_Rel_H Left Join T_CI_CIMCI_Rel 
ON ( T_CI_CIMCI_Rel.id_T_CI = T_CI_CIMCI_Rel_H.id_T_CI And T_CI_CIMCI_Rel.id_CimCI = T_CI_CIMCI_Rel_H.id_CimCI)
where T_CI_CIMCI_Rel.id_CimCI is Null
--insertion :
insert into T_CI_CIMCI_Rel (id_T_CI, id_CimCI, synonymie) 
select distinct T_CI_CIMCI_Rel_H.id_T_CI, T_CI_CIMCI_Rel_H.id_CimCI, 1 from T_CI_CIMCI_Rel_H Left Join T_CI_CIMCI_Rel 
ON ( T_CI_CIMCI_Rel.id_T_CI = T_CI_CIMCI_Rel_H.id_T_CI And T_CI_CIMCI_Rel.id_CimCI = T_CI_CIMCI_Rel_H.id_CimCI)
where T_CI_CIMCI_Rel.id_CimCI is Null group by T_CI_CIMCI_Rel_H.id_T_CI, T_CI_CIMCI_Rel_H.id_CimCI
Print 'Nombre des CI apres insertion :'
select count(*) from T_CI_CIMCI_Rel
Drop TABLE [dbo].[T_CI_CIMCI_Rel_H]
COMMIT TRAN
---fin de création des liens avec les CI ancètres.

INSERT INTO T_Indic SELECT * FROM RubisExtraction..INFOIRIS_T_Indic                       
GO

INSERT INTO T_Sub SELECT * FROM RubisExtraction..INFOIRIS_T_Sub 
INSERT INTO T_SynonyCI SELECT * FROM RubisExtraction..INFOIRIS_T_SynonyCI      
INSERT INTO T_SynonyIndic SELECT * FROM RubisExtraction..INFOIRIS_T_SynonyIndic 
INSERT INTO T_SynonySub SELECT * FROM RubisExtraction..INFOIRIS_T_SynonySub 
--INSERT INTO Tetiere SELECT Tet.* FROM RubisExtraction..INFOIRIS_Tetiere As Tet INNER JOIN SpeCompo ON Tet.id_SpeCompo=SpeCompo.id_SpeCompo
INSERT INTO Substance SELECT * FROM RubisExtraction..INFOIRIS_Substance
GO
--
--JFO 04/09/2006 pour correction bug 2393
--Il faut arrêter de faire les REPLACE dans le traitement Update_RMC.sql de RubisExtraction.
delete from RMC_ORI
delete from RMC_REG
delete from RMC_THE_REG
delete from RMC_THE
delete from RMC_THE_CLE
delete from RMC_THE_HIE
delete from RMC_THE_PRO
--Contraintes ! :
delete from RMC_TYPE
delete from RMC_CLE
GO
------------------------------------------
INSERT INTO RMC_TYPE SELECT * FROM RubisExtraction..RMC_TYPE 
INSERT INTO RMC_ORI SELECT * FROM RubisExtraction..RMC_ORI 
INSERT INTO RMC_REG SELECT * FROM RubisExtraction..RMC_REG 
INSERT INTO RMC_THE_REG SELECT * FROM RubisExtraction..RMC_THE_REG
INSERT INTO RMC_THE SELECT * FROM RubisExtraction..RMC_THE 
INSERT INTO RMC_CLE SELECT * FROM RubisExtraction..RMC_CLE 
INSERT INTO RMC_THE_CLE SELECT * FROM RubisExtraction..RMC_THE_CLE 
INSERT INTO RMC_THE_HIE SELECT * FROM RubisExtraction..RMC_THE_HIE             
INSERT INTO RMC_THE_PRO SELECT * FROM RubisExtraction..RMC_THE_PRO
GO
print 'Controles tables RMC_* vides'
set NOCOUNT ON
select '#erreur [M' +'icrosoft] : RMC_TYPE vide ! ' from RMC_TYPE having count(*) = 0          
select '#erreur [M' +'icrosoft] : RMC_ORI vide ! ' from RMC_ORI having count(*) = 0     
select '#erreur [M' +'icrosoft] : RMC_REG vide ! ' from RMC_REG having count(*) = 0     
--C'est apparemment normal...select '#erreur [M' +'icrosoft] : RMC_THE_REG vide ! ' from RMC_THE_REG having count(*) = 0     
select '#erreur [M' +'icrosoft] : RMC_THE vide ! ' from RMC_THE having count(*) = 0
select '#erreur [M' +'icrosoft] : RMC_CLE vide ! ' from RMC_CLE having count(*) = 0
select '#erreur [M' +'icrosoft] : RMC_THE_CLE vide ! ' from RMC_THE_CLE having count(*) = 0
select '#erreur [M' +'icrosoft] : RMC_THE_HIE vide ! ' from RMC_THE_HIE having count(*) = 0
select '#erreur [M' +'icrosoft] : RMC_THE_PRO vide ! ' from RMC_THE_PRO having count(*) = 0
GO
INSERT INTO T_Sub_Parent SELECT * FROM RubisExtraction..T_Sub_Parent             
INSERT INTO T_Sub_Complement SELECT * FROM RubisExtraction..T_Sub_Complement 
GO

--INSERT INTO GroupIndic_DicoRF_CIM_Rel SELECT * FROM RubisExtraction..GroupIndic_DicoRF_CIM_Rel 
INSERT INTO GroupIndic_DicoRF_CIM_Rel SELECT id_GroupIndic, id_DicoCim10, 2, Null, GetDate() FROM RubisExtraction..GICim10 
--INSERT INTO LaboSaumon SELECT * FROM RubisExtraction..LaboSaumon
--select * from GroupIndic_DicoRF_CIM_Rel
--id_GroupIndic, id_DicoRF_CIM, id_DicoQualifLienTerme, texte, dCreat
INSERT INTO LaboSaumon SELECT Distinct DicoLabo.id_DicoLaboratoire, DicoLabo.Libelle, Null FROM RubisExtraction..PresLaboReference As PresLabo Inner Join RubisExtraction..DicoLaboratoire As DicoLabo On PresLabo.id_DicoLaboratoire = DicoLabo.id_DicoLaboratoire Where PresLabo.id_Presentation > 6000000
GO
--INSERT INTO Saumon SELECT * FROM RubisExtraction..Saumon
INSERT INTO Saumon (Produit, DocId, IdLaboratoire) SELECT Pres.Nom_Long, Docs.Nom_Fichier, PresLabo.id_DicoLaboratoire FROM RubisExtraction..Presentation As Pres Left Join RubisExtraction..PresLaboReference As PresLabo On Pres.id_Presentation = PresLabo.id_Presentation Left Join RubisExtraction..Presentation_Documents As PresDocs On Pres.id_Presentation = PresDocs.id_Presentation Left Join RubisExtraction..Documents As Docs On PresDocs.id_Document = Docs.id_Document Where Pres.id_Presentation > 6000000 And Docs.id_Type = 4
GO
--JFO 12/01/2006 :
--set IDENTITY_INSERT UCD OFF
INSERT INTO UCD (Code_Ucd, Code_Cip, Libelle_Ucd, EPhMRA)
--avant modification du modèle : SELECT * FROM RubisExtraction..UCD
select RubisExtraction..ucd.CODE, RubisExtraction..presentation.CipOuAcl, RubisExtraction..ucd.Libelle, RubisExtraction..DicoEphmra.code 
from RubisExtraction..presentation, RubisExtraction..ucd , RubisExtraction..DicoEphmra
where RubisExtraction..ucd.CODE = RubisExtraction..Presentation.ucd And RubisExtraction..presentation.id_DicoEphmra = RubisExtraction..DicoEphmra.id_DicoEphmra
--source : ID_Ucd, Libelle, CODE, ID_DicoTypePrixHT2A, ID_DicoTypePrixRetro, TAUXPriseENCharge, DatePriseENCharge, PrixHT2A, DatePrixHT2A, PrixReTroCession, DatePrixReTroCession
--destination : id_ucd, Code_Ucd, Code_Cip, Libelle_Ucd, EPhMRA
--manque : Code_Cip, EPhMRA (code)
--select ucd.ID_Ucd, ucd.CODE, presentation.CipOuAcl, ucd.Libelle, 
GO
INSERT INTO type_documents SELECT * FROM RubisExtraction..type_documents
print 'insert Documents'
INSERT INTO Documents (id_document,nom_fichier,id_type,html,date_maj,valide) SELECT id_document,nom_fichier,id_type,html,date_maj,valide FROM RubisExtraction..Documents Where id_Type In (1,2,4,6)
GO
print 'insert Presentation_Documents'
INSERT INTO Presentation_Documents (id_Presentation,id_Document) SELECT PresDocs.id_Presentation, PresDocs.id_Document FROM RubisExtraction..Presentation_Documents As PresDocs INNER JOIN RubisExtraction..Documents As Docs ON PresDocs.id_Document=Docs.id_Document Where Docs.id_Type In (1,2,4,6)
GO

--INSERT INTO SpePresentation_Etendue SELECT * FROM RubisExtraction..SpePresentation_Etendue 
--INSERT INTO Presentation SELECT * FROM RubisExtraction..Presentation
--INSERT INTO dicospelieudistrib SELECT * FROM RubisExtraction..dicospelieudistrib
--INSERT INTO preslieudistrib SELECT * FROM RubisExtraction..preslieudistrib
--INSERT INTO DicoRefSource SELECT * FROM RubisExtraction..DicoRefSource
--INSERT INTO PresRemplace SELECT * FROM RubisExtraction..PresRemplace

--INSERT INTO CimTermRechIndic SELECT * FROM RubisExtraction..INFOIRIS_CimTermRechIndic       
--INSERT INTO RechIndicCim_Rel SELECT * FROM RubisExtraction..INFOIRIS_RechIndicCim_Rel 
--INSERT INTO SpePoso SELECT * FROM RubisExtraction..INFOIRIS_SpePoso SpePoso                      
--INSERT INTO SpePosoIndic SELECT * FROM RubisExtraction..INFOIRIS_SpePosoIndic 
--INSERT INTO SpePosoVoie SELECT * FROM RubisExtraction..INFOIRIS_SpePosoVoie 
--INSERT INTO SynonyTermeRech SELECT * FROM RubisExtraction..INFOIRIS_SynonyTermeRech 
--INSERT INTO SynonyTermeRech_TermeRechIndic SELECT * FROM RubisExtraction..INFOIRIS_SynonyTermeRech_TermeRechIndic 
--INSERT INTO TermeRechGroupIndic_Rel SELECT * FROM RubisExtraction..INFOIRIS_TermeRechGroupIndic_Rel 
--INSERT INTO TermeRechIndic SELECT * FROM RubisExtraction..INFOIRIS_TermeRechIndic 

--INSERT INTO CimEII SELECT * FROM RubisExtraction..INFOIRIS_CimEII                       
--INSERT INTO CimPE SELECT * FROM RubisExtraction..INFOIRIS_CimPE                       
--INSERT INTO FormOrigines SELECT * FROM RubisExtraction..INFOIRIS_FormOrigines        
--INSERT INTO GroupIndicGroupIndic_Rel SELECT * FROM RubisExtraction..INFOIRIS_GroupIndicGroupIndic_Rel 
--INSERT INTO HierarchieEII_Rel SELECT * FROM RubisExtraction..INFOIRIS_HierarchieEII_Rel 
--INSERT INTO IAMClass_IAMAliment SELECT * FROM RubisExtraction..INFOIRIS_IAMClass_IAMAliment 
--INSERT INTO IAMCLassIRISCond SELECT * FROM RubisExtraction..INFOIRIS_IAMCLassIRISCond 
--INSERT INTO IAMSubCond SELECT * FROM RubisExtraction..INFOIRIS_IAMSubCond   
--INSERT INTO Indexe SELECT * FROM RubisExtraction..INFOIRIS_Indexe 
--INSERT INTO IndexSy_Rel SELECT * FROM RubisExtraction..INFOIRIS_IndexSy_Rel 
--INSERT INTO LaboratoireEtranger SELECT * FROM RubisExtraction..INFOIRIS_LaboratoireEtranger 
--INSERT INTO MeddraCI SELECT * FROM RubisExtraction..INFOIRIS_MeddraCI 
--INSERT INTO MeddraEII SELECT * FROM RubisExtraction..INFOIRIS_MeddraEII    
--INSERT INTO MeddraIndic SELECT * FROM RubisExtraction..INFOIRIS_MeddraIndic        
--INSERT INTO MeddraPE SELECT * FROM RubisExtraction..INFOIRIS_MeddraPE    
--INSERT INTO Medicament SELECT * FROM RubisExtraction..INFOIRIS_Medicament
--INSERT INTO OMSEII SELECT * FROM RubisExtraction..INFOIRIS_OMSEII 
--INSERT INTO Ph_RemplaCI SELECT * FROM RubisExtraction..INFOIRIS_Ph_RemplaCI       
--INSERT INTO Ph_RemplaEII SELECT * FROM RubisExtraction..INFOIRIS_Ph_RemplaEII 
--INSERT INTO Ph_RemplaIndic SELECT * FROM RubisExtraction..INFOIRIS_Ph_RemplaIndic 
--INSERT INTO Ph_RemplaPE SELECT * FROM RubisExtraction..INFOIRIS_Ph_RemplaPE 
--INSERT INTO RemplaCI_Rel SELECT * FROM RubisExtraction..INFOIRIS_RemplaCI_Rel 
--INSERT INTO RemplaEII_Rel SELECT * FROM RubisExtraction..INFOIRIS_RemplaEII_Rel 
--INSERT INTO RemplaIndic_Rel SELECT * FROM RubisExtraction..INFOIRIS_RemplaIndic_Rel 
--INSERT INTO RemplaPE_Rel SELECT * FROM RubisExtraction..INFOIRIS_RemplaPE_Rel 
--INSERT INTO SpeAccessoires SELECT * FROM RubisExtraction..INFOIRIS_SpeAccessoires 
--INSERT INTO SpeACP SELECT * FROM RubisExtraction..INFOIRIS_SpeACP          
--INSERT INTO SpeAutresATC SELECT * FROM RubisExtraction..INFOIRIS_SpeAutresATC 
--INSERT INTO SpeCIExcl SELECT * FROM RubisExtraction..INFOIRIS_SpeCIExcl                      
--INSERT INTO SpeCIFav SELECT * FROM RubisExtraction..INFOIRIS_SpeCIFav                       
--INSERT INTO Specialite_Medicament SELECT * FROM RubisExtraction..INFOIRIS_Specialite_Medicament 
--INSERT INTO Specialite_Substance SELECT * FROM RubisExtraction..INFOIRIS_Specialite_Substance 
--INSERT INTO SpeCinetQuantit SELECT * FROM RubisExtraction..INFOIRIS_SpeCinetQuantit 
--INSERT INTO SpeEII SELECT * FROM RubisExtraction..INFOIRIS_SpeEII                       
--INSERT INTO SpeEIIExcl SELECT * FROM RubisExtraction..INFOIRIS_SpeEIIExcl                      
--INSERT INTO SpeEIIFav SELECT * FROM RubisExtraction..INFOIRIS_SpeEIIFav                       
--INSERT INTO SpeExam SELECT * FROM RubisExtraction..INFOIRIS_SpeExam                       
--INSERT INTO SpeExamMethode SELECT * FROM RubisExtraction..INFOIRIS_SpeExamMethode        
--INSERT INTO SpeGerme SELECT * FROM RubisExtraction..INFOIRIS_SpeGerme 
--INSERT INTO SpeGrosAllait SELECT * FROM RubisExtraction..INFOIRIS_SpeGrosAllait 
--INSERT INTO SpeIncompatible SELECT * FROM RubisExtraction..INFOIRIS_SpeIncompatible 
--INSERT INTO SpeIndicExcl SELECT * FROM RubisExtraction..INFOIRIS_SpeIndicExcl 
--INSERT INTO SpeIndicFav SELECT * FROM RubisExtraction..INFOIRIS_SpeIndicFav 
--INSERT INTO SpeIndicAMM SELECT * FROM RubisExtraction..INFOIRIS_SpeIndicAMM 
--INSERT INTO SpeIndic_SpeCI SELECT * FROM RubisExtraction..INFOIRIS_SpeIndic_SpeCI 
--INSERT INTO SpeIndic_SpeGrosAllait SELECT * FROM RubisExtraction..INFOIRIS_SpeIndic_SpeGrosAllait 
--INSERT INTO SpeIndic_SpeMeg SELECT * FROM RubisExtraction..INFOIRIS_SpeIndic_SpeMeg 
--INSERT INTO SpeIndic_SpePE SELECT * FROM RubisExtraction..INFOIRIS_SpeIndic_SpePE 
--INSERT INTO SpeMateriel SELECT * FROM RubisExtraction..INFOIRIS_SpeMateriel 
--INSERT INTO SpeMeg SELECT * FROM RubisExtraction..INFOIRIS_SpeMeg SpeMeg                      
--INSERT INTO SpeMegExcl SELECT * FROM RubisExtraction..INFOIRIS_SpeMegExcl 
--INSERT INTO SpeMegFav SELECT * FROM RubisExtraction..INFOIRIS_SpeMegFav 
--INSERT INTO SpePEExcl SELECT * FROM RubisExtraction..INFOIRIS_SpePEExcl
--INSERT INTO SpePEFav SELECT * FROM RubisExtraction..INFOIRIS_SpePEFav 
--INSERT INTO SpePharmacoCinet SELECT * FROM RubisExtraction..INFOIRIS_SpePharmacoCinet 
--INSERT INTO SpePharmacoCinet_SpeConstituan SELECT * FROM RubisExtraction..INFOIRIS_SpePharmacoCinet_SpeConstituan 
--INSERT INTO SpePresentation_DateMaxEvMarche SELECT * FROM RubisExtraction..INFOIRIS_SpePresentation_DateMaxEvMarche 
--INSERT INTO SpePresentation_DernierEvMarche SELECT * FROM RubisExtraction..INFOIRIS_SpePresentation_DernierEvMarche 
--INSERT INTO PresPrise SELECT * FROM RubisExtraction..INFOIRIS_SpePrise
--INSERT INTO SpeReferantGener SELECT * FROM RubisExtraction..INFOIRIS_SpeReferantGener 
--INSERT INTO SpeSecuPreClin SELECT * FROM RubisExtraction..INFOIRIS_SpeSecuPreClin 
--INSERT INTO SpeSignSdComm SELECT * FROM RubisExtraction..INFOIRIS_SpeSignSdComm 
--INSERT INTO SpeSousConstituant SELECT * FROM RubisExtraction..INFOIRIS_SpeSousConstituant 
--INSERT INTO SpeSpectre SELECT * FROM RubisExtraction..INFOIRIS_SpeSpectre          
--INSERT INTO SpeSurdosage SELECT * FROM RubisExtraction..INFOIRIS_SpeSurdosage 
--INSERT INTO SpeTetConst SELECT * FROM RubisExtraction..INFOIRIS_SpeTetConst 
--INSERT INTO SpeTetSousConst SELECT * FROM RubisExtraction..INFOIRIS_SpeTetSousConst 
--INSERT INTO SpeVigi SELECT * FROM RubisExtraction..INFOIRIS_SpeVigi                      
--INSERT INTO Sub_T_ClassChim SELECT * FROM RubisExtraction..INFOIRIS_Sub_T_ClassChim                      
--INSERT INTO SubATC SELECT * FROM RubisExtraction..INFOIRIS_SubATC 
--INSERT INTO SubBiblio SELECT * FROM RubisExtraction..INFOIRIS_SubBiblio 
--INSERT INTO SubCI SELECT * FROM RubisExtraction..INFOIRIS_SubCI         
--INSERT INTO SubCIExcl SELECT * FROM RubisExtraction..INFOIRIS_SubCIExcl                       
--INSERT INTO SubCIFav SELECT * FROM RubisExtraction..INFOIRIS_SubCIFav                      
--INSERT INTO SubCinetQuantit SELECT * FROM RubisExtraction..INFOIRIS_SubCinetQuantit 
--INSERT INTO SubClassIRIS SELECT * FROM RubisExtraction..INFOIRIS_SubClassIRIS 
--INSERT INTO SubDepen SELECT * FROM RubisExtraction..INFOIRIS_SubDepen 
--INSERT INTO SubEffet SELECT * FROM RubisExtraction..INFOIRIS_SubEffet                      
--INSERT INTO SubEII SELECT * FROM RubisExtraction..INFOIRIS_SubEII 
--INSERT INTO SubEIIExcl SELECT * FROM RubisExtraction..INFOIRIS_SubEIIExcl
--INSERT INTO SubEIIFav SELECT * FROM RubisExtraction..INFOIRIS_SubEIIFav                      
--INSERT INTO SubEvt SELECT * FROM RubisExtraction..INFOIRIS_SubEvt
--INSERT INTO SubExam SELECT * FROM RubisExtraction..INFOIRIS_SubExam
--INSERT INTO SubExamMethode SELECT * FROM RubisExtraction..INFOIRIS_SubExamMethode 
--INSERT INTO SubGrosDescAllait SELECT * FROM RubisExtraction..INFOIRIS_SubGrosDescAllait 
--INSERT INTO SubIncompatible SELECT * FROM RubisExtraction..INFOIRIS_SubIncompatible 
--INSERT INTO SubIndic SELECT * FROM RubisExtraction..INFOIRIS_SubIndic
--INSERT INTO SubIndicExcl SELECT * FROM RubisExtraction..INFOIRIS_SubIndicExcl 
--INSERT INTO SubIndicFav SELECT * FROM RubisExtraction..INFOIRIS_SubIndicFav 
--INSERT INTO SubPEExcl SELECT * FROM RubisExtraction..INFOIRIS_SubPEExcl
--INSERT INTO SubPEFav SELECT * FROM RubisExtraction..INFOIRIS_SubPEFav
--INSERT INTO SubPharmacoCinet SELECT * FROM RubisExtraction..INFOIRIS_SubPharmacoCinet 
--INSERT INTO SubPharmacoDynamie SELECT * FROM RubisExtraction..INFOIRIS_SubPharmacoDynamie 
--INSERT INTO SubPoso SELECT * FROM RubisExtraction..INFOIRIS_SubPoso 
--INSERT INTO SubPosoStruc SELECT * FROM RubisExtraction..INFOIRIS_SubPosoStruc 
--INSERT INTO SubPropPharmaco SELECT * FROM RubisExtraction..INFOIRIS_SubPropPharmaco 
--INSERT INTO SubSurdosage SELECT * FROM RubisExtraction..INFOIRIS_SubSurdosage 
--INSERT INTO SubVoie SELECT * FROM RubisExtraction..INFOIRIS_SubVoie
--INSERT INTO SynonyClassChim_Rel SELECT * FROM RubisExtraction..INFOIRIS_SynonyClassChim_Rel 
--INSERT INTO SynonyEII_Rel SELECT * FROM RubisExtraction..INFOIRIS_SynonyEII_Rel 
--INSERT INTO SynonyPE_Rel SELECT * FROM RubisExtraction..INFOIRIS_SynonyPE_Rel 
--INSERT INTO T_ClassChim SELECT * FROM RubisExtraction..INFOIRIS_T_ClassChim 
--INSERT INTO T_EII SELECT * FROM RubisExtraction..INFOIRIS_T_EII          
--INSERT INTO T_EII_CimEII_Rel SELECT * FROM RubisExtraction..INFOIRIS_T_EII_CimEII_Rel 
--INSERT INTO T_Forme SELECT * FROM RubisExtraction..INFOIRIS_T_Forme                      
--INSERT INTO T_PE SELECT * FROM RubisExtraction..INFOIRIS_T_PE                       
--INSERT INTO T_PE_CimPE_Rel SELECT * FROM RubisExtraction..INFOIRIS_T_PE_CimPE_Rel 
--INSERT INTO T_SynonyClassChim SELECT * FROM RubisExtraction..INFOIRIS_T_SynonyClassChim 
--INSERT INTO T_SynonyEII SELECT * FROM RubisExtraction..INFOIRIS_T_SynonyEII 
--INSERT INTO T_SynonyPE SELECT * FROM RubisExtraction..INFOIRIS_T_SynonyPE 
--INSERT INTO RMC_TYPE SELECT * FROM RubisExtraction..RMC_TYPE 
--INSERT INTO RMC_ORI SELECT * FROM RubisExtraction..RMC_ORI 
--INSERT INTO RMC_REG SELECT * FROM RubisExtraction..RMC_REG 
--INSERT INTO RMC_THE_REG SELECT * FROM RubisExtraction..RMC_THE_REG
--INSERT INTO T_Sub_etendue SELECT * FROM RubisExtraction..T_Sub_etendue           
--INSERT INTO SpeNbSubs SELECT * FROM RubisExtraction..SpeNbSubs

