--**
print 'ReCreate_RubisInfoCentreProduit_FK.sql'
--V1.0 - JFO 29/11/2007
--re-creation des clefs étrangères de la base RubisInfoCentreProduit et des droits
--après la DTS d'import.
--en cours de dev !
use RubisInfoCentreProduit
GO
/****** Objet :  ForeignKey [FK_COMPOHOP_LIEN_13_SPEPRESE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_COMPOHOP_LIEN_13_SPEPRESE]') AND type = 'F')
ALTER TABLE [dbo].[COMPOHOP]  WITH CHECK ADD  CONSTRAINT [FK_COMPOHOP_LIEN_13_SPEPRESE] FOREIGN KEY([IDORGANISME], [ID_SPEPRESENTATIONHOP])
REFERENCES [dbo].[SPEPRESENTATIONHOP] ([IDORGANISME], [ID_SPEPRESENTATIONHOP])
GO
/****** Objet :  ForeignKey [FK_COMPOHOP_LIEN_14_T_SUBHOP]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_COMPOHOP_LIEN_14_T_SUBHOP]') AND type = 'F')
ALTER TABLE [dbo].[COMPOHOP]  WITH CHECK ADD  CONSTRAINT [FK_COMPOHOP_LIEN_14_T_SUBHOP] FOREIGN KEY([IDORGANISME], [ID_T_SUBHOP])
REFERENCES [dbo].[T_SUBHOP] ([IDORGANISME], [ID_T_SUBHOP])
GO
/****** Objet :  ForeignKey [FK_COMPOVID_LIEN_116_SPEPRESE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_COMPOVID_LIEN_116_SPEPRESE]') AND type = 'F')
ALTER TABLE [dbo].[COMPOVIDAL]  WITH CHECK ADD  CONSTRAINT [FK_COMPOVID_LIEN_116_SPEPRESE] FOREIGN KEY([IDORGANISME], [ID_SPEPRESENTATIONHOP])
REFERENCES [dbo].[SPEPRESENTATIONHOP] ([IDORGANISME], [ID_SPEPRESENTATIONHOP])
GO
/****** Objet :  ForeignKey [FK_COMPOVID_LIEN_117_T_SUB]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_COMPOVID_LIEN_117_T_SUB]') AND type = 'F')
ALTER TABLE [dbo].[COMPOVIDAL]  WITH CHECK ADD  CONSTRAINT [FK_COMPOVID_LIEN_117_T_SUB] FOREIGN KEY([ID_T_SUB])
REFERENCES [dbo].[T_Sub] ([id_T_Sub])
GO
/****** Objet :  ForeignKey [FK_LIVRETHO_ASSOC_122_SPEPRESE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_LIVRETHO_ASSOC_122_SPEPRESE]') AND type = 'F')
ALTER TABLE [dbo].[LIVRETHOP]  WITH CHECK ADD  CONSTRAINT [FK_LIVRETHO_ASSOC_122_SPEPRESE] FOREIGN KEY([IDORGANISME], [ID_SPEPRESENTATIONHOP])
REFERENCES [dbo].[SPEPRESENTATIONHOP] ([IDORGANISME], [ID_SPEPRESENTATIONHOP])
GO
/****** Objet :  ForeignKey [FK_LIVRETVI_ASSOC_244_SPEPRESE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_LIVRETVI_ASSOC_244_SPEPRESE]') AND type = 'F')
ALTER TABLE [dbo].[LIVRETVIDAL]  WITH CHECK ADD  CONSTRAINT [FK_LIVRETVI_ASSOC_244_SPEPRESE] FOREIGN KEY([ID_SPEPRESENTATION])
REFERENCES [dbo].[SpePresentation] ([id_SpePresentation])
GO
/****** Objet :  ForeignKey [FK_RMC_CLE_THE_ORI_RMC_ORI]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_CLE_THE_ORI_RMC_ORI]') AND type = 'F')
ALTER TABLE [dbo].[RMC_CLE]  WITH CHECK ADD  CONSTRAINT [FK_RMC_CLE_THE_ORI_RMC_ORI] FOREIGN KEY([ORI_IDE])
REFERENCES [dbo].[RMC_ORI] ([ORI_IDE])
GO
/****** Objet :  ForeignKey [FK_RMC_CLE_TYPE_MOT__RMC_TYPE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_CLE_TYPE_MOT__RMC_TYPE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_CLE]  WITH CHECK ADD  CONSTRAINT [FK_RMC_CLE_TYPE_MOT__RMC_TYPE] FOREIGN KEY([TYPE_IDE])
REFERENCES [dbo].[RMC_TYPE] ([TYPE_IDE])
GO
/****** Objet :  ForeignKey [FK_RMC_REG_A_COMME_P_RMC_REG]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_REG_A_COMME_P_RMC_REG]') AND type = 'F')
ALTER TABLE [dbo].[RMC_REG]  WITH CHECK ADD  CONSTRAINT [FK_RMC_REG_A_COMME_P_RMC_REG] FOREIGN KEY([REG_REG_IDE])
REFERENCES [dbo].[RMC_REG] ([REG_IDE])
GO
/****** Objet :  ForeignKey [FK_RMC_THE_TYPE_THES_RMC_TYPE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE_TYPE_THES_RMC_TYPE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE]  WITH CHECK ADD  CONSTRAINT [FK_RMC_THE_TYPE_THES_RMC_TYPE] FOREIGN KEY([TYPE_IDE])
REFERENCES [dbo].[RMC_TYPE] ([TYPE_IDE])
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_61_RMC_THE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_61_RMC_THE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_CLE]  WITH CHECK ADD  CONSTRAINT [FK_RMC_THE__LIEN_61_RMC_THE] FOREIGN KEY([THE_IDE])
REFERENCES [dbo].[RMC_THE] ([THE_IDE])
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_62_RMC_CLE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_62_RMC_CLE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_CLE]  WITH CHECK ADD  CONSTRAINT [FK_RMC_THE__LIEN_62_RMC_CLE] FOREIGN KEY([CLE_IDE])
REFERENCES [dbo].[RMC_CLE] ([CLE_IDE])
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_64_RMC_REG]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_64_RMC_REG]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_CLE]  WITH CHECK ADD  CONSTRAINT [FK_RMC_THE__LIEN_64_RMC_REG] FOREIGN KEY([REG_IDE])
REFERENCES [dbo].[RMC_REG] ([REG_IDE])
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_59_RMC_THE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_59_RMC_THE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_HIE]  WITH CHECK ADD  CONSTRAINT [FK_RMC_THE__LIEN_59_RMC_THE] FOREIGN KEY([THE_IDE])
REFERENCES [dbo].[RMC_THE] ([THE_IDE])
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_60_RMC_THE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_60_RMC_THE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_HIE]  WITH CHECK ADD  CONSTRAINT [FK_RMC_THE__LIEN_60_RMC_THE] FOREIGN KEY([THE_THE_IDE])
REFERENCES [dbo].[RMC_THE] ([THE_IDE])
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_56_RMC_THE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_56_RMC_THE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_PRO]  WITH CHECK ADD  CONSTRAINT [FK_RMC_THE__LIEN_56_RMC_THE] FOREIGN KEY([THE_IDE])
REFERENCES [dbo].[RMC_THE] ([THE_IDE])
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_63_RMC_THE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_63_RMC_THE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_PRO]  WITH CHECK ADD  CONSTRAINT [FK_RMC_THE__LIEN_63_RMC_THE] FOREIGN KEY([THE_THE_IDE])
REFERENCES [dbo].[RMC_THE] ([THE_IDE])
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_67_RMC_REG]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_67_RMC_REG]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_REG]  WITH CHECK ADD  CONSTRAINT [FK_RMC_THE__LIEN_67_RMC_REG] FOREIGN KEY([REG_IDE])
REFERENCES [dbo].[RMC_REG] ([REG_IDE])
GO
/****** Objet :  ForeignKey [FK_RMC_THE__LIEN_68_RMC_THE]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RMC_THE__LIEN_68_RMC_THE]') AND type = 'F')
ALTER TABLE [dbo].[RMC_THE_REG]  WITH CHECK ADD  CONSTRAINT [FK_RMC_THE__LIEN_68_RMC_THE] FOREIGN KEY([THE_IDE])
REFERENCES [dbo].[RMC_THE] ([THE_IDE])
GO
/****** Objet :  ForeignKey [FK_SAUMON_SAUMONLIE_LABOSAUM]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_SAUMON_SAUMONLIE_LABOSAUM]') AND type = 'F')
ALTER TABLE [dbo].[SAUMON]  WITH CHECK ADD  CONSTRAINT [FK_SAUMON_SAUMONLIE_LABOSAUM] FOREIGN KEY([IDLABORATOIRE])
REFERENCES [dbo].[LABOSAUMON] ([IDLABORATOIRE])
GO
/****** Objet :  ForeignKey [FK_SpeCompo_Lien_Specialite]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_SpeCompo_Lien_Specialite]') AND type = 'F')
ALTER TABLE [dbo].[SpeCompo]  WITH CHECK ADD  CONSTRAINT [FK_SpeCompo_Lien_Specialite] FOREIGN KEY([id_Specialite])
REFERENCES [dbo].[Specialite] ([id_Specialite])
GO
/****** Objet :  ForeignKey [FK_SpePresentation__Specialite]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_SpePresentation__Specialite]') AND type = 'F')
ALTER TABLE [dbo].[SpePresentation]  WITH CHECK ADD  CONSTRAINT [FK_SpePresentation__Specialite] FOREIGN KEY([id_Specialite])
REFERENCES [dbo].[Specialite] ([id_Specialite])
GO
/****** Objet :  ForeignKey [FK_Substance_Lien_T_Sub]    Date de génération du script : 11/28/2007 10:49:30 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Substance_Lien_T_Sub]') AND type = 'F')
ALTER TABLE [dbo].[Substance]  WITH CHECK ADD  CONSTRAINT [FK_Substance_Lien_T_Sub] FOREIGN KEY([id_T_Sub])
REFERENCES [dbo].[T_Sub] ([id_T_Sub])
GO
GRANT SELECT ON [dbo].[CimCI] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[CoupleTermeSynonyme] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[CoupleTermeTerme] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[DicoCodeGene] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[DicoComClassIRIS] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[DicoEphmra] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[DicoRF_CIM] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[DicoT_ATC_IRIS] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[Documents] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[GroupIndic] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[GroupIndic_DicoRF_CIM_Rel] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[GroupIndicIndic_Rel] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[HierarchieCI_Rel] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[IAMClass] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[IAMClasse_IAMCouple] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[IAMCouple] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[IndexSub_Rel] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[Laboratoire] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[LABOSAUMON] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[Marqueurs] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[Presentation_Documents] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[RMC_CLE] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[RMC_ORI] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[RMC_REG] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[RMC_THE] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[RMC_THE_CLE] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[RMC_THE_HIE] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[RMC_THE_PRO] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[RMC_THE_REG] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[RMC_TYPE] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[RMOClass] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SAUMON] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SpeCI] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[Specialite] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[Specialite_IAMClass] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SpeClassIRIS] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SpeCompo] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SpeConditionnementPrimaire] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SpeConstituant] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SpeEvt] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SpeEvtPresentation] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SpeIndic] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SpeLabs_Rel] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SpePE] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SpePharmacodynamie] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SpePoso] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SpePosoIndic] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SpePresentation] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SpeSuiviSGML] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SpeVoie] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SubPE] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[Substance] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SynonyCI_Rel] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[SynonyIndic_Rel] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[T_CI] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[T_CI_CIMCI_Rel] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[T_Indic] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[T_Sub] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[T_Sub_Complement] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[T_Sub_Parent] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[T_SynonyCI] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[T_SynonyIndic] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[T_SynonySub] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[TermeRechPhonetique] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[Type_Documents] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[UCD] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[Version] TO [IRIS Developpement]
GO
GRANT DELETE ON [dbo].[Version] TO [IrisAdministrateur]
GO
GRANT INSERT ON [dbo].[Version] TO [IrisAdministrateur]
GO
GRANT SELECT ON [dbo].[Version] TO [IrisAdministrateur]
GO
GRANT UPDATE ON [dbo].[Version] TO [IrisAdministrateur]
GO
GRANT SELECT ON [dbo].[Version] TO [IrisLecture]
GO
GRANT SELECT ON [dbo].[Version] TO [IrisLectureSeule]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'IrisAdministrateur')
BEGIN
EXEC dbo.sp_addrolemember @rolename=N'IrisAdministrateur', @membername=N'jfloricheur'
EXEC dbo.sp_addrolemember @rolename=N'IrisAdministrateur', @membername=N'mtsylla'

END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'IrisLectureSeule')
BEGIN
EXEC dbo.sp_addrolemember @rolename=N'IrisLectureSeule', @membername=N'IRIS Developpement'
EXEC dbo.sp_addrolemember @rolename=N'IrisLectureSeule', @membername=N'jfloricheur'
EXEC dbo.sp_addrolemember @rolename=N'IrisLectureSeule', @membername=N'IrisLecture'
EXEC dbo.sp_addrolemember @rolename=N'IrisLectureSeule', @membername=N'mtsylla'
EXEC dbo.sp_addrolemember @rolename=N'IrisLectureSeule', @membername=N'IrisAdministrateur'

END
GO
print 'controle'
SELECT '#erreur [M' +'icrosoft] : manque des contraintes !' ,count(*) FROM dbo.sysobjects WHERE type = 'F' having count(*) < 23
GO
print '##Fin ReCreate_RubisInfoCentreProduit_FK.sql'
