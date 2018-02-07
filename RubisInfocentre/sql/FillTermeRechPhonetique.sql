		--****************************************************************************
		--*		SOUNDEX							     *
		--****************************************************************************
		-- Modif du 13 05 04 pour Ajout LibSsAccent & UCD
		--************************************************

Delete From TermeRechPhonetique
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[New_Soundex]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[New_Soundex]
GO

CREATE PROCEDURE New_Soundex(@terme varchar(255), @result AS VARCHAR(255) OUTPUT) AS 
BEGIN

    DECLARE @terme_soundex AS VARCHAR(255)
    DECLARE @lettre AS CHAR(1)
    DECLARE @mot AS VARCHAR(255)
    DECLARE @chaine AS VARCHAR (255)
    DECLARE @I AS INTEGER
    DECLARE @FirstMot AS BIT

	SET @terme_soundex=@terme
	SET @terme_soundex=replace(@terme_soundex,"0","")
	SET @terme_soundex=replace(@terme_soundex,"1","") 
	SET @terme_soundex=replace(@terme_soundex,"2","") 
	SET @terme_soundex=replace(@terme_soundex,"3","") 
	SET @terme_soundex=replace(@terme_soundex,"4","") 
	SET @terme_soundex=replace(@terme_soundex,"5","") 
	SET @terme_soundex=replace(@terme_soundex,"6","") 
	SET @terme_soundex=replace(@terme_soundex,"7","") 
	SET @terme_soundex=replace(@terme_soundex,"8","")  
	SET @terme_soundex=replace(@terme_soundex,"9","") 
	SET @terme_soundex=replace(@terme_soundex,",","") 
	SET @terme_soundex=replace(@terme_soundex,".","") 
	SET @terme_soundex=replace(@terme_soundex,"%","") 

	SET @terme_soundex=replace(@terme_soundex,"(","") 
	SET @terme_soundex=replace(@terme_soundex,")","") 
	SET @terme_soundex=replace(@terme_soundex,"[","") 
	SET @terme_soundex=replace(@terme_soundex,"]","") 
	SET @terme_soundex=replace(@terme_soundex,"{","") 
	SET @terme_soundex=replace(@terme_soundex,"}","") 
	SET @terme_soundex=replace(@terme_soundex,"/","") 
	SET @terme_soundex=replace(@terme_soundex,"\","") 
	SET @terme_soundex=replace(@terme_soundex,"µ","") 
	SET @terme_soundex=replace(@terme_soundex,"+","") 
	SET @terme_soundex=replace(@terme_soundex,'"','') 

	--on passe en majuscules
	SET @terme_soundex=UPPER(@terme_soundex)
	SET @terme_soundex=replace(@terme_soundex,UPPER("ç"),"C")
										
	--on enleve les tirets
	SET @terme_soundex=replace(@terme_soundex,"-","")
	SET @terme_soundex=replace(@terme_soundex,"'","")
										
	--on remplace les groupes de lettres
	SET @terme_soundex=replace(@terme_soundex,"GUI","KI") 
	SET @terme_soundex=replace(@terme_soundex,"GUE","KE") 
	SET @terme_soundex=replace(@terme_soundex,"GA","KA") 
	SET @terme_soundex=replace(@terme_soundex,"GO","KO") 
	SET @terme_soundex=replace(@terme_soundex,"GU","K") 
	SET @terme_soundex=replace(@terme_soundex,"CA","KA") 
	SET @terme_soundex=replace(@terme_soundex,"CO","KO") 
	SET @terme_soundex=replace(@terme_soundex,"CU","KU") 
	SET @terme_soundex=replace(@terme_soundex,"Q","K") 
	SET @terme_soundex=replace(@terme_soundex,"CC","K") 
	SET @terme_soundex=replace(@terme_soundex,"CK","K")
										
	--on remplace les voyelles par A (sauf le y)
	SET @terme_soundex=replace(@terme_soundex,"Y","I")
	SET @terme_soundex=replace(@terme_soundex,"AIN","IN")
	SET @terme_soundex=replace(@terme_soundex,"AI","E")
	SET @terme_soundex=replace(@terme_soundex,"EI","E")
	SET @terme_soundex=replace(@terme_soundex,"EU","E")
	SET @terme_soundex=replace(@terme_soundex,"IE","E")
	--SET @terme_soundex=replace(@terme_soundex,"OE","E")
	SET @terme_soundex=replace(@terme_soundex,UPPER("œ"),"E")
	SET @terme_soundex=replace(@terme_soundex,"AU","O")
	SET @terme_soundex=replace(@terme_soundex,"OI","A")
	SET @terme_soundex=replace(@terme_soundex,"UA","A")
	SET @terme_soundex=replace(@terme_soundex,"UE","E")
	SET @terme_soundex=replace(@terme_soundex,"UI","I")
	SET @terme_soundex=replace(@terme_soundex,"UO","O")
	SET @terme_soundex=replace(@terme_soundex,UPPER("é"),"E")
	SET @terme_soundex=replace(@terme_soundex,UPPER("è"),"E")
	SET @terme_soundex=replace(@terme_soundex,UPPER("ê"),"E")
	SET @terme_soundex=replace(@terme_soundex,UPPER("ë"),"E")
	SET @terme_soundex=replace(@terme_soundex,UPPER("î"),"I")
	SET @terme_soundex=replace(@terme_soundex,UPPER("ï"),"I")
	SET @terme_soundex=replace(@terme_soundex,"O","A")
	SET @terme_soundex=replace(@terme_soundex,UPPER("ô"),"A")
	SET @terme_soundex=replace(@terme_soundex,UPPER("ö"),"A")
	SET @terme_soundex=replace(@terme_soundex,"U","A")
	SET @terme_soundex=replace(@terme_soundex,UPPER("û"),"A")
	SET @terme_soundex=replace(@terme_soundex,UPPER("ü"),"A")
	SET @terme_soundex=replace(@terme_soundex,UPPER("ä"),"A")
	SET @terme_soundex=replace(@terme_soundex,UPPER("à"),"A")
	SET @terme_soundex=replace(@terme_soundex,UPPER("â"),"A")
										
	--on remplace les préfixes
	SET @terme_soundex=replace(@terme_soundex,"MAC","MCC")  
	SET @terme_soundex=replace(@terme_soundex,"ASA","AZA") 
	SET @terme_soundex=replace(@terme_soundex,"KN","NN") 
	SET @terme_soundex=replace(@terme_soundex,"PF","FF")
	SET @terme_soundex=replace(@terme_soundex,"SCH","SSS") 
	SET @terme_soundex=replace(@terme_soundex,"PH","FF") 
										
	--on remplace les H (sauf SH et CH)
	-- Methode Seb :
	-- On transcode SH et CH par un caractere bidon qu'on sait inexistant
	-- On supprime ensuite H
	-- On retranscode la caractere bidon en CH et SH
	SET @terme_soundex=replace(@terme_soundex,"CH","Y") 
	SET @terme_soundex=replace(@terme_soundex,"SH","YY") 
	SET @terme_soundex=replace(@terme_soundex,"H","") 
	SET @terme_soundex=replace(@terme_soundex,"YY","SH") 
	SET @terme_soundex=replace(@terme_soundex,"Y","CH") 

	-- on remplace les Y (sauf AY)
	-- Ne sert e rien car Y deja transcode en I et AY => AI => E
											
	-- on enleve les terminaisons T D S
	--if (right(terme_soundex,1)="T" or right(terme_soundex,1)="D" or right(terme_soundex,1)="S") then terme_soundex=left(terme_soundex,len(terme_soundex)-1)
	--on enleve les A (sauf la première lettre)
	--terme_soundex=left(terme_soundex,1) & replace(mid(terme_soundex,2),"A","")
	IF right(@terme_soundex,1)='W'	
	BEGIN 
		SET @terme_soundex=left(@terme_soundex,len(@terme_soundex)-1)
	END
											
											
	--on enleve les lettres répétitives
	SET @lettre=LEFT(@terme_soundex,1)
	SET @chaine=@lettre
	SET @I=1
	WHILE @I<LEN(@terme_soundex)
	BEGIN
		SET @I=@I+1
		IF SUBSTRING(@terme_soundex,@I,1)<>@lettre
		BEGIN
			SET @lettre=SUBSTRING(@terme_soundex,@I,1)
			SET @chaine=@chaine + @lettre
		END
	END
--	print 'avant : ' + @terme_soundex + ' , après : ' + @chaine
	SET @terme_soundex=@chaine
	
	--on enleve les blancs
	--terme_soundex=replace(terme_soundex," ","")
		
	-- On remplace les lettres pas des poids
	SET @terme_soundex=replace(@terme_soundex,"B","1") -- B
	SET @terme_soundex=replace(@terme_soundex,"F","1") -- F
	SET @terme_soundex=replace(@terme_soundex,"P","1") -- P
	SET @terme_soundex=replace(@terme_soundex,"V","1") -- V
	SET @terme_soundex=replace(@terme_soundex,"W","1") -- W
	SET @terme_soundex=replace(@terme_soundex,"C","2") -- C
	SET @terme_soundex=replace(@terme_soundex,"G","2") -- G
	SET @terme_soundex=replace(@terme_soundex,"J","2") -- J
	SET @terme_soundex=replace(@terme_soundex,"K","2") -- K
	SET @terme_soundex=replace(@terme_soundex,"Q","2") -- Q
	SET @terme_soundex=replace(@terme_soundex,"S","2") -- S
	SET @terme_soundex=replace(@terme_soundex,"X","2") -- X
	SET @terme_soundex=replace(@terme_soundex,"Z","2") -- Z
	SET @terme_soundex=replace(@terme_soundex,"D","3") -- D
	SET @terme_soundex=replace(@terme_soundex,"T","3") -- T
	SET @terme_soundex=replace(@terme_soundex,"L","4") -- L
	SET @terme_soundex=replace(@terme_soundex,"M","5") -- M
	SET @terme_soundex=replace(@terme_soundex,"N","5") -- N
	SET @terme_soundex=replace(@terme_soundex,"R","6") -- R				
	SET @terme_soundex=replace(@terme_soundex,"A","0") -- A
	SET @terme_soundex=replace(@terme_soundex,"E","7") -- E	
	SET @terme_soundex=replace(@terme_soundex,"I","8") -- I
	SET @terme_soundex=replace(@terme_soundex,"H","9") -- H		
	
	-- Manque : O, U, Y,

	-- On ne garde que les mots de plus de 3 lettres
	SET @I=0
	SET @FirstMot=1
	SET @mot =''
	SET @chaine =''
	WHILE @I<LEN(@terme_soundex)+1
	BEGIN
		SET @I=@I+1
		IF SUBSTRING(@terme_soundex,@I,1)<>' '
		BEGIN
			SET @mot=@mot + SUBSTRING(@terme_soundex,@I,1)
		END
		ELSE BEGIN
			IF LEN(@mot)>3
			BEGIN
				IF @FirstMot=0
				BEGIN
					SET @chaine=@chaine + ' ' + @mot
				END
				ELSE BEGIN
					SET @chaine=@mot
					SET @FirstMot=0
				END
			END
			SET @mot=''
		END
	END
	SET @terme_soundex=@chaine
	SET @result=@terme_soundex
END
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[ReplaceAccent]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ReplaceAccent]
GO

CREATE PROCEDURE ReplaceAccent(@terme varchar(255), @result AS VARCHAR(255) OUTPUT) AS 
BEGIN
    DECLARE @szTemp AS VARCHAR(255)
	SET @szTemp=@terme
    SET @szTemp = Replace(@szTemp, 'À', 'A')
    SET @szTemp = Replace(@szTemp, 'Á', 'A')
    SET @szTemp = Replace(@szTemp, 'Â', 'A')
    SET @szTemp = Replace(@szTemp, 'Ã', 'A')
    SET @szTemp = Replace(@szTemp, 'Ä', 'A')
    SET @szTemp = Replace(@szTemp, 'Å', 'A')
    SET @szTemp = Replace(@szTemp, 'à', 'a')
    SET @szTemp = Replace(@szTemp, 'á', 'a')
    SET @szTemp = Replace(@szTemp, 'â', 'a')
    SET @szTemp = Replace(@szTemp, 'ã', 'a')
    SET @szTemp = Replace(@szTemp, 'ä', 'a')
    SET @szTemp = Replace(@szTemp, 'å', 'a')
    SET @szTemp = Replace(@szTemp, 'È', 'E')
    SET @szTemp = Replace(@szTemp, 'É', 'E')
    SET @szTemp = Replace(@szTemp, 'Ê', 'E')
    SET @szTemp = Replace(@szTemp, 'Ë', 'E')
    SET @szTemp = Replace(@szTemp, 'è', 'e')
    SET @szTemp = Replace(@szTemp, 'é', 'e')
    SET @szTemp = Replace(@szTemp, 'ê', 'e')
    SET @szTemp = Replace(@szTemp, 'ë', 'e')
    SET @szTemp = Replace(@szTemp, 'Ì', 'I')
    SET @szTemp = Replace(@szTemp, 'Í', 'I')
    SET @szTemp = Replace(@szTemp, 'Î', 'I')
    SET @szTemp = Replace(@szTemp, 'Ï', 'I')
    SET @szTemp = Replace(@szTemp, 'ì', 'i')
    SET @szTemp = Replace(@szTemp, 'í', 'i')
    SET @szTemp = Replace(@szTemp, 'î', 'i')
    SET @szTemp = Replace(@szTemp, 'ï', 'i')
--    SET @szTemp = Replace(@szTemp, 'Ñ', 'N')
--    SET @szTemp = Replace(@szTemp, 'ñ', 'n')
    SET @szTemp = Replace(@szTemp, 'Ò', 'O')
    SET @szTemp = Replace(@szTemp, 'Ó', 'O')
    SET @szTemp = Replace(@szTemp, 'Ô', 'O')
    SET @szTemp = Replace(@szTemp, 'Õ', 'O')
    SET @szTemp = Replace(@szTemp, 'Ö', 'O')
    SET @szTemp = Replace(@szTemp, 'ó', 'o')
    SET @szTemp = Replace(@szTemp, 'ô', 'o')
    SET @szTemp = Replace(@szTemp, 'õ', 'o')
    SET @szTemp = Replace(@szTemp, 'ö', 'o')
    SET @szTemp = Replace(@szTemp, 'ò', 'o')
--    SET @szTemp = Replace(@szTemp, 'Š', 'S')
--    SET @szTemp = Replace(@szTemp, 'š', 's')
    SET @szTemp = Replace(@szTemp, 'Ù', 'U')
    SET @szTemp = Replace(@szTemp, 'Ú', 'U')
    SET @szTemp = Replace(@szTemp, 'Û', 'U')
    SET @szTemp = Replace(@szTemp, 'Ü', 'U')
    SET @szTemp = Replace(@szTemp, 'ù', 'u')
    SET @szTemp = Replace(@szTemp, 'ú', 'u')
    SET @szTemp = Replace(@szTemp, 'û', 'u')
    SET @szTemp = Replace(@szTemp, 'ü', 'u')
    SET @szTemp = Replace(@szTemp, 'Ý', 'Y')
    SET @szTemp = Replace(@szTemp, 'Ÿ', 'Y')
    SET @szTemp = Replace(@szTemp, 'ý', 'y')
    SET @szTemp = Replace(@szTemp, 'ÿ', 'y')
--    SET @szTemp = Replace(@szTemp, 'Ž', 'Z')
--    SET @szTemp = Replace(@szTemp, 'ž', 'z')

	SET @result=@szTemp
END
GO

	DECLARE @Cur CURSOR			
	DECLARE @szSQL AS VARCHAR(255)
	DECLARE @Libelle AS VARCHAR (255)
	DECLARE @Id AS VARCHAR(50)
	DECLARE @szSoundex AS VARCHAR(255)
	DECLARE @Homeo AS CHAR(1)
	DECLARE @SynoLibelle AS VARCHAR(255)
	DECLARE @Condi AS VARCHAR(50)
	DECLARE @CodeDispo AS VARCHAR(1)
	DECLARE @szLibSsAccent AS VARCHAR(255)

	SET NOCOUNT ON
			
	--***************************************************************************************************
	-- MEDICAMENTS
	--***************************************************************************************************						
	SET @Cur = CURSOR LOCAL FOR SELECT DISTINCT  SpePresentation.id_SpePresentation, Specialite.DenomSpe , SpePresentation.Condi, SpePresentation.CodeDispo FROM Specialite, SpePresentation WHERE Specialite.id_specialite=SpePresentation.id_specialite AND Specialite.idTypeSpe=0 ORDER BY SpePresentation.id_SpePresentation
	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @Id, @Libelle, @Condi, @CodeDispo
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		IF LEN(RTRIM(@Condi))>0
		BEGIN
			SET @Libelle=@Libelle + ' : ' + @Condi
		END
		EXEC New_Soundex @Libelle, @szSoundex OUTPUT 
		EXEC ReplaceAccent @Libelle, @szLibSsAccent OUTPUT 
		INSERT INTO TermeRechPhonetique (Terme_libelle, Terme_soundex, Type_Terme, id_Terme, CodeDispo, Terme_LibSsAccent)
		VALUES (@Libelle,LEFT(@szSoundex,35),'1spe',@Id,@CodeDispo,@szLibSsAccent)
		FETCH NEXT FROM @Cur INTO @Id, @Libelle, @Condi, @CodeDispo
	END
	CLOSE @Cur
	DEALLOCATE @Cur

						
	--***************************************************************************************************
	-- SUBSTANCES PA
	--***************************************************************************************************
	SET @Cur = CURSOR LOCAL FOR SELECT DISTINCT t_sub_complement.id_t_sub, T_Sub_Complement.Libelle, homeopathie FROM t_sub ,t_sub_complement WHERE t_sub.id_t_sub=t_sub_complement.id_t_sub AND indexMV=1 AND (RoleCompoherite=1 OR RoleCompoherite=3) ORDER BY t_sub_complement.id_T_Sub
	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @Id, @Libelle, @Homeo
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		IF @Homeo='V'
		BEGIN
			SET @Libelle=@Libelle+' [Homéo]'
		END
		EXEC New_Soundex @Libelle, @szSoundex OUTPUT 
		EXEC ReplaceAccent @Libelle, @szLibSsAccent OUTPUT 
		INSERT INTO TermeRechPhonetique (Terme_libelle, Terme_soundex, Type_Terme, id_Terme, Terme_LibSsAccent)
		VALUES (@Libelle,LEFT(@szSoundex,35),'2pa',@Id,@szLibSsAccent)
		FETCH NEXT FROM @Cur INTO @Id, @Libelle, @Homeo
	END
	CLOSE @Cur
	DEALLOCATE @Cur

	SET @Cur = CURSOR LOCAL FOR SELECT DISTINCT t_sub_complement.id_t_sub, T_Sub_Complement.Libelle, t_synonysub.libelle AS SynoLibelle FROM CoupleTermeSynonyme, t_synonysub, t_sub_complement WHERE t_synonysub.id_t_synonysub = CoupleTermeSynonyme.id_t_synonysub AND CoupleTermeSynonyme.id_t_sub=t_sub_complement.id_t_sub AND t_sub_complement.indexMV=1 AND (t_sub_complement.RoleCompoherite=1 OR t_sub_complement.RoleCompoherite=3) ORDER BY T_Sub_Complement.id_T_Sub
	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @Id, @Libelle, @SynoLibelle
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		SET @Libelle=@SynoLibelle + ' = ' + @Libelle
		EXEC New_Soundex @Libelle, @szSoundex OUTPUT 
		EXEC ReplaceAccent @Libelle, @szLibSsAccent OUTPUT 
		INSERT INTO TermeRechPhonetique (Terme_libelle, Terme_soundex, Type_Terme, id_Terme, Terme_LibSsAccent)
		VALUES (@Libelle,LEFT(@szSoundex,35),'2pa',@Id,@szLibSsAccent)
		FETCH NEXT FROM @Cur INTO @Id, @Libelle, @SynoLibelle
	END
	CLOSE @Cur
	DEALLOCATE @Cur


	--***************************************************************************************************
	-- SUBSTANCES EXCI
	--***************************************************************************************************
	SET @Cur = CURSOR LOCAL FOR SELECT DISTINCT t_sub_complement.id_t_sub, t_sub_complement.libelle, homeopathie FROM t_sub ,t_sub_complement WHERE t_sub.id_t_sub=t_sub_complement.id_t_sub AND indexMV=1 AND (RoleCompoherite=2 OR RoleCompoherite=3) ORDER BY t_sub_complement.id_T_Sub
	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @Id, @Libelle, @Homeo
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		IF @Homeo='V'
		BEGIN
			SET @Libelle=@Libelle+' [Homéo]'
		END
		EXEC New_Soundex @Libelle, @szSoundex OUTPUT 
		EXEC ReplaceAccent @Libelle, @szLibSsAccent OUTPUT 
		INSERT INTO TermeRechPhonetique (Terme_libelle, Terme_soundex, Type_Terme, id_Terme, Terme_LibSsAccent)
		VALUES (@Libelle,LEFT(@szSoundex,35),'3exci',@Id,@szLibSsAccent)
		FETCH NEXT FROM @Cur INTO @Id, @Libelle, @Homeo
	END
	CLOSE @Cur
	DEALLOCATE @Cur

	SET @Cur = CURSOR LOCAL FOR SELECT DISTINCT t_sub_complement.id_t_sub, T_Sub_Complement.Libelle, t_synonysub.libelle AS SynoLibelle FROM CoupleTermeSynonyme, t_synonysub, t_sub_complement WHERE t_synonysub.id_t_synonysub = CoupleTermeSynonyme.id_t_synonysub AND CoupleTermeSynonyme.id_t_sub=t_sub_complement.id_t_sub AND t_sub_complement.indexMV=1 AND (t_sub_complement.RoleCompoherite=2 OR t_sub_complement.RoleCompoherite=3) ORDER BY T_Sub_Complement.id_T_Sub
	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @Id, @Libelle, @SynoLibelle
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		SET @Libelle=@SynoLibelle + ' = ' + @Libelle
		EXEC New_Soundex @Libelle, @szSoundex OUTPUT 
		EXEC ReplaceAccent @Libelle, @szLibSsAccent OUTPUT 
		INSERT INTO TermeRechPhonetique (Terme_libelle, Terme_soundex, Type_Terme, id_Terme, Terme_LibSsAccent)
		VALUES (@Libelle,LEFT(@szSoundex,35),'3exci',@Id,@szLibSsAccent)
		FETCH NEXT FROM @Cur INTO @Id, @Libelle, @SynoLibelle
	END
	CLOSE @Cur
	DEALLOCATE @Cur


	--***************************************************************************************************
	--  SAUMON
	--***************************************************************************************************
	SET @Cur = CURSOR LOCAL FOR SELECT DISTINCT docid, produit FROM saumon ORDER BY docid
	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @Id, @Libelle
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		EXEC New_Soundex @Libelle, @szSoundex OUTPUT 
		EXEC ReplaceAccent @Libelle, @szLibSsAccent OUTPUT 
		INSERT INTO TermeRechPhonetique (Terme_libelle, Terme_soundex, Type_Terme, id_Terme, Terme_LibSsAccent)
		VALUES (@Libelle,LEFT(@szSoundex,35),'4saumon',@Id,@szLibSsAccent)
		FETCH NEXT FROM @Cur INTO @Id, @Libelle
	END
	CLOSE @Cur
	DEALLOCATE @Cur


	--***************************************************************************************************
	-- LABORATOIRES
	--***************************************************************************************************
	SET @Cur = CURSOR LOCAL FOR SELECT DISTINCT Laboratoire.id_Laboratoire, Laboratoire.Laboratoire FROM Laboratoire INNER JOIN SpeLabs_Rel ON Laboratoire.id_Laboratoire=SpeLabs_Rel.id_Laboratoire INNER JOIN Specialite ON SpeLabs_Rel.id_Specialite=Specialite.id_Specialite Where Specialite.idTypeSpe = 0  ORDER BY Laboratoire.id_Laboratoire
	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @Id, @Libelle
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		EXEC New_Soundex @Libelle, @szSoundex OUTPUT 
		EXEC ReplaceAccent @Libelle, @szLibSsAccent OUTPUT 
		INSERT INTO TermeRechPhonetique (Terme_libelle, Terme_soundex, Type_Terme, id_Terme, Terme_LibSsAccent)
		VALUES (@Libelle,LEFT(@szSoundex,35),'5labo',@Id,@szLibSsAccent)
		FETCH NEXT FROM @Cur INTO @Id, @Libelle
	END
	CLOSE @Cur
	DEALLOCATE @Cur


	--***************************************************************************************************
	-- UCD
	--***************************************************************************************************
	SET @Cur = CURSOR LOCAL FOR SELECT DISTINCT Code_Ucd, Libelle_Ucd FROM Ucd ORDER BY Code_Ucd
	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @Id, @Libelle
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		EXEC New_Soundex @Libelle, @szSoundex OUTPUT 
		EXEC ReplaceAccent @Libelle, @szLibSsAccent OUTPUT 
		INSERT INTO TermeRechPhonetique (Terme_libelle, Terme_soundex, Type_Terme, id_Terme, Terme_LibSsAccent)
		VALUES (@Libelle,LEFT(@szSoundex,35),'6lib_ucd',@Id,@szLibSsAccent)
		FETCH NEXT FROM @Cur INTO @Id, @Libelle
	END
	CLOSE @Cur
	DEALLOCATE @Cur

	SET NOCOUNT OFF

GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[New_Soundex]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[New_Soundex]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[ReplaceAccent]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ReplaceAccent]
GO

