/************************************************************************************/
/*  Modification SL du 27/02/03 :                                                   */
/*                                                                                  */
/*   Modifs 10/03/03                                                                */
/*   renommage PK et FK                                                             */
/*     FK_CoupleTermeSynonyme_Lien_T_Sub -> FK_CoupleTermeSyno_Lien_T_Sub           */
/*     FK_CoupleTermeSynonyme_Lien_T_SSynonySub -> FK_CoupleTermeSyno__T_SynoSub    */
/*     FK_SpeCompo_Lien_SpeConditionnementPrimaire -> FK_Compo__ConditionnementPrim */
/*     FK_SpePresentation_Lien_Specialite -> FK_SpePresentation__Specialite         */
/*     FK_SpeSousConstituant_Lien_SpeConstituant -> FK_SousConstituant__Constituan  */
/*                                                                                  */
/************************************************************************************/



ALTER TABLE [dbo].[SpeCompo] ADD 
	CONSTRAINT [FK_SpeCompo_Lien_Specialite] FOREIGN KEY 
	(
		[ID_Specialite]
	) REFERENCES [dbo].[Specialite] (
		[ID_Specialite]
	)
GO

ALTER TABLE [dbo].[SpePresentation] ADD 
	CONSTRAINT [FK_SpePresentation__Specialite] FOREIGN KEY 
	(
		[ID_Specialite]
	) REFERENCES [dbo].[Specialite] (
		[ID_Specialite]
	)
GO

/*
ALTER TABLE [dbo].[SpePoso] ADD 
	CONSTRAINT [FK_SpePoso_Lien_Specialite] FOREIGN KEY 
	(
		[ID_Specialite]
	) REFERENCES [dbo].[Specialite] (
		[ID_Specialite]
	),
	CONSTRAINT [FK_SpePoso_Lien_SpePrise] FOREIGN KEY 
	(
		[ID_SpePrise]
	) REFERENCES [dbo].[SpePrise] (
		[id_SpePrise]
	)
*/
GO


ALTER TABLE [dbo].[Substance] ADD 
	CONSTRAINT [FK_Substance_Lien_T_Sub] FOREIGN KEY 
	(
		[ID_T_Sub]
	) REFERENCES [dbo].[T_Sub] (
		[ID_T_Sub]
	)
GO

