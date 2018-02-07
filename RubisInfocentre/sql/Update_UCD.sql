begin transaction

Delete UCD from UCD left join SpePresentation on UCD.Code_Cip = SpePresentation.Cip
where SpePresentation.id_SpePresentation Is Null
GO

Delete UCD from UCD left join SpePresentation on UCD.Code_Cip = SpePresentation.Cip
Where SpePresentation.CodeDispo In (4,5)
GO

Update SpePresentation 
Set SpePresentation.ucd = Null
Where id_SpePresentation In (
	Select SpePresentation.id_SpePresentation From SpePresentation left join ucd On SpePresentation.ucd = UCD.Code_Ucd
	Where SpePresentation.ucd Is Not Null
	And UCD.id_ucd Is Null
	)
GO

commit transaction
