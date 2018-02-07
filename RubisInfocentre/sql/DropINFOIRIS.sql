/*******************************************************************/
/*  Modification SL du 19/12/02 :                                  */
/*  - Suppression des tables GroupeDCI et SpeGroupeDCI             */
/*                                                                 */
/*******************************************************************/

--ALTER TABLE [dbo].[DicoComClassIRIS] DROP CONSTRAINT FK_DICOCOMC_DICO_CLAS_DICOCOMC
GO

--ALTER TABLE [dbo].[DicoComClassLaboX] DROP CONSTRAINT FK_DICOCOMC_REF_11303_DICOCOMC
GO

--ALTER TABLE [dbo].[DicoComClassVIDAL] DROP CONSTRAINT FK_DICOCOMC_REF_11304_DICOCOMC
GO

--ALTER TABLE [dbo].[DicoComEtatGrosAllait_Rel] DROP CONSTRAINT FK_DICOCOME_DICOCOMET_DICOCOME
GO

--ALTER TABLE [dbo].[DicoComEtatGrosAllait_Rel] DROP CONSTRAINT FK_DICOCOME_REF_11308_DICOCOME
GO

--ALTER TABLE [dbo].[DicoComIndic_Rel] DROP CONSTRAINT FK_DICOCOMI_REF_54212_DICOCOMI
GO

--ALTER TABLE [dbo].[DicoComIndic_Rel] DROP CONSTRAINT FK_DICOCOMI_REF_54216_DICOCOMI
GO

--ALTER TABLE [dbo].[DicoComMeddra_Rel] DROP CONSTRAINT FK_DICOCOMM_REF_11304_DICOCOMM
GO

---ALTER TABLE [dbo].[DicoComMeddra_Rel] DROP CONSTRAINT FK_DICOCOMM_REF_11305_DICOCOMM
GO

--ALTER TABLE [dbo].[DicoComOMS_Rel] DROP CONSTRAINT FK_DICOCOMO_DICOCOMOM_DICOCOMO
GO

--ALTER TABLE [dbo].[DicoComOMS_Rel] DROP CONSTRAINT FK_DICOCOMO_REF_11306_DICOCOMO
GO

--ALTER TABLE [dbo].[DicoComUnite_Rel] DROP CONSTRAINT FK_DICOCOMU_REF_13709_DICOCOMU
GO

--ALTER TABLE [dbo].[DicoComUnite_Rel] DROP CONSTRAINT FK_DICOCOMU_REF_13710_DICOCOMU
GO

--ALTER TABLE [dbo].[DicoComVoie] DROP CONSTRAINT FK_DICOCOMV_DVOIE_DIC_DICOCOMV
GO

--ALTER TABLE [dbo].[DicoLabEtrange_Rel] DROP CONSTRAINT FK_DICOLABE_REF_11319_DICOLABE
GO

--ALTER TABLE [dbo].[DicoLabEtrange_Rel] DROP CONSTRAINT FK_DICOLABE_REF_DICOL_DICOLABE
GO

--ALTER TABLE [dbo].[DicoLaboratoire] DROP CONSTRAINT FK_DICOLABO_DICOLABOR_DICOLABO
GO

--ALTER TABLE [dbo].[DicoSpeEvenement] DROP CONSTRAINT FK_DICOSPEE_DICOSPEEV_DICOSPEE
GO

--ALTER TABLE [dbo].[DicoSpeForme_Rel] DROP CONSTRAINT FK_DICOSPEF_REF_13707_DICOSPEF
GO

--ALTER TABLE [dbo].[DicoSpeForme_Rel] DROP CONSTRAINT FK_DICOSPEF_REF_13708_DICOSPEF
GO

--ALTER TABLE [dbo].[DicoSpeMateriau_Rel] DROP CONSTRAINT FK_DICOSPEM_REF_49882_DICOSPEM
GO

--ALTER TABLE [dbo].[DicoSpeMateriau_Rel] DROP CONSTRAINT FK_DICOSPEM_REF_49886_DICOSPEM
GO

--ALTER TABLE [dbo].[DicoSpePresEvt] DROP CONSTRAINT FK_DICOSPEP_DICOSPEPR_DICOSPEP
GO

--ALTER TABLE [dbo].[DicoT_ACP] DROP CONSTRAINT FK_DICOT_AC_DICOT_ACP_DICOT_AC
GO

--ALTER TABLE [dbo].[DicoT_ATC_IRIS] DROP CONSTRAINT FK_DICOT_AT_DICOT_ATC_DICOT_AT
GO

--ALTER TABLE [dbo].[DicoT_EPHMRA] DROP CONSTRAINT FK_DICOT_EP_DICOT_EPH_DICOT_EP
GO

ALTER TABLE [dbo].[RMC_THE_CLE] DROP CONSTRAINT FK_RMC_THE__LIEN_62_RMC_CLE
GO

ALTER TABLE [dbo].[RMC_CLE] DROP CONSTRAINT FK_RMC_CLE_THE_ORI_RMC_ORI
GO

ALTER TABLE [dbo].[RMC_REG] DROP CONSTRAINT FK_RMC_REG_A_COMME_P_RMC_REG
GO

ALTER TABLE [dbo].[RMC_THE_CLE] DROP CONSTRAINT FK_RMC_THE__LIEN_64_RMC_REG
GO

ALTER TABLE [dbo].[RMC_THE_REG] DROP CONSTRAINT FK_RMC_THE__LIEN_67_RMC_REG
GO

ALTER TABLE [dbo].[RMC_THE_CLE] DROP CONSTRAINT FK_RMC_THE__LIEN_61_RMC_THE
GO

ALTER TABLE [dbo].[RMC_THE_HIE] DROP CONSTRAINT FK_RMC_THE__LIEN_59_RMC_THE
GO

ALTER TABLE [dbo].[RMC_THE_HIE] DROP CONSTRAINT FK_RMC_THE__LIEN_60_RMC_THE
GO

ALTER TABLE [dbo].[RMC_THE_PRO] DROP CONSTRAINT FK_RMC_THE__LIEN_56_RMC_THE
GO

ALTER TABLE [dbo].[RMC_THE_PRO] DROP CONSTRAINT FK_RMC_THE__LIEN_63_RMC_THE
GO

ALTER TABLE [dbo].[RMC_THE_REG] DROP CONSTRAINT FK_RMC_THE__LIEN_68_RMC_THE
GO

ALTER TABLE [dbo].[RMC_CLE] DROP CONSTRAINT FK_RMC_CLE_TYPE_MOT__RMC_TYPE
GO

ALTER TABLE [dbo].[RMC_THE] DROP CONSTRAINT FK_RMC_THE_TYPE_THES_RMC_TYPE
GO

--ALTER TABLE [dbo].[CoupleTermeSynonyme] DROP CONSTRAINT FK_CoupleTermeSynonyme_Lien_T_Sub
GO

--ALTER TABLE [dbo].[CoupleTermeSynonyme] DROP CONSTRAINT FK_CoupleTermeSynonyme_Lien_T_SSynonySub
GO

--ALTER TABLE [dbo].[SpeSousConstituant] DROP CONSTRAINT FK_SpeSousConstituant_Lien_SpeConstituant
GO

--ALTER TABLE [dbo].[SpeCompo] DROP CONSTRAINT FK_SpeCompo_Lien_Specialite
GO

--ALTER TABLE [dbo].[SpeCompo] DROP CONSTRAINT FK_SpeCompo_Lien_SpeConditionnementPrimaire
GO

--ALTER TABLE [dbo].[SpePresentation] DROP CONSTRAINT FK_SpePresentation_Lien_Specialite
GO

--ALTER TABLE [dbo].[SpePoso] DROP CONSTRAINT FK_SpePoso_Lien_Specialite
GO

--ALTER TABLE [dbo].[SpePoso] DROP CONSTRAINT FK_SpePoso_Lien_SpePrise
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[CimCI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CimCI]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[CimEII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CimEII]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[CimPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CimPE]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[CimTermRechIndic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CimTermRechIndic]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[CoupleTermeSynonyme]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CoupleTermeSynonyme]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[CoupleTermeTerme]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CoupleTermeTerme]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoCodeGene]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoCodeGene]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComCinetModal]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComCinetModal]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComCinetType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComCinetType]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComClassIRIS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComClassIRIS]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComClassIRIS_DENORM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComClassIRIS_DENORM]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComClassLaboX]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComClassLaboX]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComClassVIDAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComClassVIDAL]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComCond]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComCond]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComEtatGrosAllait]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComEtatGrosAllait]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComEtatGrosAllait_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComEtatGrosAllait_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComExam]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComExam]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComExamMethode]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComExamMethode]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComGermes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComGermes]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComGrosAllait]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComGrosAllait]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComIndic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComIndic]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComIndic_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComIndic_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComListe]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComListe]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComMeddra]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComMeddra]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComMeddra_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComMeddra_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComOMS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComOMS]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComOMS_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComOMS_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComSensibilite]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComSensibilite]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComTerrain]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComTerrain]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComUnite]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComUnite]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComUnite_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComUnite_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoComVoie]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoComVoie]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoIAMNivGrav]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoIAMNivGrav]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoLabEtrange]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoLabEtrange]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoLabEtrange_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoLabEtrange_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoLaboratoire]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoLaboratoire]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoListeDuree]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoListeDuree]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoMaterielDoseur]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoMaterielDoseur]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoMomentPrise]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoMomentPrise]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoOuvrage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoOuvrage]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoRefSource]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoRefSource]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoRF_CIM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoRF_CIM]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSourceSubClassChim]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSourceSubClassChim]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeAccessoire]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeAccessoire]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeAge]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeAge]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeCategorie]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeCategorie]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeComp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeComp]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeCondi]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeCondi]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeCouleur]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeCouleur]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeDosage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeDosage]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeEIIFreq]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeEIIFreq]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeEvenement]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeEvenement]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeForme]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeForme]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeForme_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeForme_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeFormOrig]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeFormOrig]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeLieuDistrib]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeLieuDistrib]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeMateriau]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeMateriau]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeMateriau_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeMateriau_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeNatureExcip]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeNatureExcip]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpePays]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpePays]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpePhase]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpePhase]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpePosoType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpePosoType]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpePrecaution]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpePrecaution]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpePrescInit]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpePrescInit]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpePrescReserve]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpePrescReserve]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpePresDispo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpePresDispo]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpePresEvt]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpePresEvt]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpePriseUnit]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpePriseUnit]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeRenouvel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeRenouvel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeRepas]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeRepas]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSpeTva]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSpeTva]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSubCIPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSubCIPE]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSubClassAge]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSubClassAge]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSubDC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSubDC]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSubDesc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSubDesc]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSubEffet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSubEffet]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSubEIIFreq]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSubEIIFreq]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSubEIIImput]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSubEIIImput]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSubEtat]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSubEtat]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSubEvenement]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSubEvenement]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSubIndicQual]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSubIndicQual]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSubNature]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSubNature]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSubPharmaQual]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSubPharmaQual]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSubPosoNat]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSubPosoNat]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSubPropPharmaco]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSubPropPharmaco]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoSubRisqueDepen]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoSubRisqueDepen]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoT_ACP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoT_ACP]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoT_ATC_IRIS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoT_ATC_IRIS]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoT_EPHMRA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoT_EPHMRA]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoTetiere]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoTetiere]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoTituExpl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoTituExpl]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoTraiteDoc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoTraiteDoc]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[DicoTypeGroupIndic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DicoTypeGroupIndic]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[FormOrigines]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FormOrigines]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[GroupIndic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GroupIndic]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[GroupIndicGroupIndic_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GroupIndicGroupIndic_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[GroupIndicIndic_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GroupIndicIndic_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[HierarchieCI_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[HierarchieCI_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[HierarchieEII_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[HierarchieEII_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Histo_IAM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Histo_IAM]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[IAMAliment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IAMAliment]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[IAMClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IAMClass]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[IAMClass_IAMAliment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IAMClass_IAMAliment]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[IAMClassChimCond]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IAMClassChimCond]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[IAMClasse_IAMCouple]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IAMClasse_IAMCouple]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[IAMCLassIRISCond]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IAMCLassIRISCond]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[IAMCouple]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IAMCouple]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[IAMSubCond]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IAMSubCond]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Indexe]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Indexe]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[IndexSub_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IndexSub_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[IndexSy_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IndexSy_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Laboratoire]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Laboratoire]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[LaboratoireEtranger]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LaboratoireEtranger]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[MeddraCI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MeddraCI]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[MeddraEII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MeddraEII]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[MeddraIndic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MeddraIndic]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[MeddraPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MeddraPE]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Medicament]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Medicament]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[OMSEII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[OMSEII]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Ph_RemplaCI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Ph_RemplaCI]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Ph_RemplaEII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Ph_RemplaEII]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Ph_RemplaIndic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Ph_RemplaIndic]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Ph_RemplaPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Ph_RemplaPE]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RechIndicCim_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RechIndicCim_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RemplaCI_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RemplaCI_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RemplaEII_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RemplaEII_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RemplaIndic_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RemplaIndic_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RemplaPE_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RemplaPE_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RMC_CLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RMC_CLE]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RMC_ORI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RMC_ORI]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RMC_REG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RMC_REG]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RMC_THE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RMC_THE]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RMC_THE_CLE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RMC_THE_CLE]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RMC_THE_HIE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RMC_THE_HIE]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RMC_THE_PRO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RMC_THE_PRO]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RMC_THE_REG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RMC_THE_REG]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RMC_TYPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RMC_TYPE]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RMOClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RMOClass]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RMOClass_Specialite]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RMOClass_Specialite]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RMOClassIRISCond]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RMOClassIRISCond]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RMOIndicCond]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RMOIndicCond]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RMOSubCond]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RMOSubCond]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RVCoupleTermeSyn]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RVCoupleTermeSyn]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[RVCoupleTermeTerme]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RVCoupleTermeTerme]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeAccessoires]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeAccessoires]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeACP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeACP]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeAutresATC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeAutresATC]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeCI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeCI]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Specialite_IAMClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Specialite_IAMClass]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Specialite_Medicament]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Specialite_Medicament]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Specialite_Substance]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Specialite_Substance]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeCIExcl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeCIExcl]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeCIFav]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeCIFav]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeCinetQuantit]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeCinetQuantit]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeClassIRIS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeClassIRIS]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeCompo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeCompo]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeCondCons]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeCondCons]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeCondDecond]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeCondDecond]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeConditionnementPrimaire]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeConditionnementPrimaire]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeConstituant]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeConstituant]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeContenance]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeContenance]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeDureeCons]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeDureeCons]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeDureeDecond]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeDureeDecond]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeEII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeEII]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeEIIExcl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeEIIExcl]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeEIIFav]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeEIIFav]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeEtrange]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeEtrange]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeEtrangePA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeEtrangePA]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeEvt]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeEvt]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeEvtPresentation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeEvtPresentation]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeExam]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeExam]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeExamMethode]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeExamMethode]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeGerme]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeGerme]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeGrosAllait]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeGrosAllait]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeIncompatible]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeIncompatible]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeIndic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeIndic]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeIndicAMM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeIndicAMM]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeIndic_SpeCI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeIndic_SpeCI]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeIndic_SpeGrosAllait]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeIndic_SpeGrosAllait]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeIndic_SpeMeg]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeIndic_SpeMeg]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeIndic_SpePE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeIndic_SpePE]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeIndicExcl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeIndicExcl]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeIndicFav]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeIndicFav]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeLabs_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeLabs_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeMateriel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeMateriel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeMeg]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeMeg]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeMegExcl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeMegExcl]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeMegFav]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeMegFav]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpePE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpePE]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpePEExcl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpePEExcl]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpePEFav]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpePEFav]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpePharmacoCinet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpePharmacoCinet]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpePharmacoCinet_SpeConstituan]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpePharmacoCinet_SpeConstituan]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpePharmacodynamie]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpePharmacodynamie]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpePoso]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpePoso]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpePosoIndic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpePosoIndic]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpePosoVoie]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpePosoVoie]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpePresentation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpePresentation]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpePresentation_DateMaxEvMarche]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpePresentation_DateMaxEvMarche]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpePresentation_DernierEvMarche]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpePresentation_DernierEvMarche]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpePresentationReferantGenerique]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpePresentationReferantGenerique]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpePrise]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpePrise]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeReferantGener]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeReferantGener]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeSecuPreClin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeSecuPreClin]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeSignSdComm]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeSignSdComm]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeSousConstituant]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeSousConstituant]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeSpectre]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeSpectre]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeSuiviSGML]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeSuiviSGML]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeSurdosage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeSurdosage]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeTetConst]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeTetConst]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeTetSousConst]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeTetSousConst]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeVigi]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeVigi]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeVoie]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeVoie]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Sub_T_ClassChim]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Sub_T_ClassChim]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubATC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubATC]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubBiblio]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubBiblio]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubCI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubCI]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubCIExcl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubCIExcl]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubCIFav]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubCIFav]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubCinetQuantit]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubCinetQuantit]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubClassIRIS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubClassIRIS]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubDepen]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubDepen]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubEffet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubEffet]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubEII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubEII]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubEIIExcl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubEIIExcl]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubEIIFav]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubEIIFav]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubEvt]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubEvt]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubExam]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubExam]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubExamMethode]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubExamMethode]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubGrosDescAllait]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubGrosDescAllait]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubIncompatible]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubIncompatible]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubIndic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubIndic]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubIndicExcl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubIndicExcl]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubIndicFav]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubIndicFav]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubPE]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubPEExcl]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubPEExcl]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubPEFav]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubPEFav]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubPharmacoCinet]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubPharmacoCinet]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubPharmacoDynamie]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubPharmacoDynamie]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubPoso]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubPoso]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubPosoStruc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubPosoStruc]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubPropPharmaco]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubPropPharmaco]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubSignSdComm]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubSignSdComm]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubSpectre]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubSpectre]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Substance]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Substance]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubSurdosage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubSurdosage]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SubVoie]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubVoie]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SynonyCI_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SynonyCI_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SynonyClassChim_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SynonyClassChim_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SynonyEII_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SynonyEII_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SynonyIndic_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SynonyIndic_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SynonyPE_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SynonyPE_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SynonyTermeRech]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SynonyTermeRech]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SynonyTermeRech_TermeRechIndic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SynonyTermeRech_TermeRechIndic]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_CI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_CI]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_CI_CIMCI_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_CI_CIMCI_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_ClassChim]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_ClassChim]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_EII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_EII]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_EII_CimEII_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_EII_CimEII_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_Forme]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_Forme]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_Indic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_Indic]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_PE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_PE]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_PE_CimPE_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_PE_CimPE_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_Sub]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_Sub]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_SynonyCI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_SynonyCI]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_SynonyClassChim]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_SynonyClassChim]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_SynonyEII]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_SynonyEII]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_SynonyIndic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_SynonyIndic]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_SynonyPE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_SynonyPE]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_SynonySub]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_SynonySub]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[TermeRechGroupIndic_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TermeRechGroupIndic_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[TermeRechIndic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TermeRechIndic]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Tetiere]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Tetiere]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[ThemeCommun]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ThemeCommun]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Documents]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Documents]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Type_Documents]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Type_Documents] 
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Presentation_Documents]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Presentation_Documents] 
GO

/* if exists (select * from sysobjects where id = object_id(N'[dbo].[GroupeDCI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GroupeDCI] */
--GO

/* if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeGroupeDCI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeGroupeDCI] */
--GO


if exists (select * from sysobjects where id = object_id(N'[dbo].[T_Sub_Parent]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_Sub_Parent] 
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[T_Sub_Complement]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_Sub_Complement] 
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SpeNbSubs]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SpeNbSubs] 
GO


if exists (select * from sysobjects where id = object_id(N'[dbo].[Specialite_extractibleMarche]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Specialite_extractibleMarche] 
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[GroupIndic_DicoRF_CIM_Rel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GroupIndic_DicoRF_CIM_Rel]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[Specialite]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Specialite]
GO

