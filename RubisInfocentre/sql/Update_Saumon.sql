/**
Update_Saumon.sql
JFO 10/10/2005
relancé pour MAJ des titres des documents insérés séparément
JFO 28/07/2006 : test sur where DOCID = 'ID7394' pour trouver l'erreur GetTitle...
*/

if exists (select * from sysobjects where id = object_id(N'[dbo].[GetTitle]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetTitle]
GO

CREATE PROCEDURE GetTitle(@Doc As Text, @result AS VARCHAR(255) OUTPUT) AS 
BEGIN

    DECLARE @Terme As Varchar(8000)
    DECLARE @PosBegin AS Integer
    DECLARE @PosEnd AS Integer
    DECLARE @Title As Varchar(4000)
    DECLARE @bWrite As Integer
    DECLARE @I As Integer
    DECLARE @Car As varchar(1)
    DECLARE @Chaine As varchar(4000)
    DECLARE @LenBalise  As Integer
    DECLARE @PosCar As Integer

	Set @Terme=@Doc
	Set @LenBalise=5
	SET @PosBegin=CharIndex('<nom>',@Terme)
	SET @PosEnd=CharIndex('</nom>',@Terme)
	--print 'GetTitle Doc =' 
	--print cast(@Doc As Varchar(8000))

	if @PosBegin=0 Or @PosBegin >  @PosEnd
	begin
		print '<nom thera="non">'
		SET @PosBegin=CharIndex('<nom thera="non">',@Terme)
		--SET @PosEnd=@PosBegin + CharIndex('</nom>', @Terme, @PosBegin)
		Set @LenBalise =17
	end
	if @PosBegin >  @PosEnd
	print 'pb balise a debugger !'
	
	if @PosBegin > 0 and @PosEnd > 0
	begin
		--print 'Posbegin=' + cast(@PosBegin As Varchar(5)) +', PosEnd=' + cast(@PosEnd As Varchar(5)) 
		--print 'SubString(@Terme,' + cast(@PosBegin+@LenBalise As Varchar(5)) +',' + cast(@PosEnd-@PosBegin-@LenBalise As Varchar(5)) +')'
		SET @Title=SubString(@Terme,@PosBegin+@LenBalise,@PosEnd-@PosBegin-@LenBalise)
	end
	else begin
		SET @Title=''
	end
	--print 'Title=' + @Title
	-- on dégage les entités caractères
		SET @Title=Replace(@Title,'&reg;','')
		SET @Title=Replace(@Title,'&trade;','')
		SET @Title=Replace(@Title,'&eacute;','é') 
		SET @Title=Replace(@Title,'&egrave;','è')
		SET @Title=Replace(@Title,'&ecirc;','ê')
		SET @Title=Replace(@Title,'&Eacute;','É')
		SET @Title=Replace(@Title,'&Egrave;','È')
		SET @Title=Replace(@Title,'&Ecirc;','Ê')
		SET @Title=Replace(@Title,'&acirc;','â')
		SET @Title=Replace(@Title,'&agrave;','à')
		SET @Title=Replace(@Title,'&ucirc;','û')
		SET @Title=Replace(@Title,'&Ucirc;','Û')
		SET @Title=Replace(@Title,'&iuml;','ï')
		SET @Title=Replace(@Title,'&Iuml;','Ï')
		SET @Title=Replace(@Title,'&amp;','&')
		SET @Title=Replace(@Title,'&OElig;','Œ')
		SET @Title=Replace(@Title,'&beta;','BETA')
		SET @Title=Replace(@Title,'&nbsp;',' ')
		SET @Title=Replace(@Title,'&thinsp;',' ')
		SET @Title=Replace(@Title,'<qa>',' ')
	-- Mais pb de casse ...
	Set @PosCar = CharIndex('é',@Title)
	while @PosCar > 0
	begin
		if @PosCar = 1
		begin
			Set @title = 'É' + SubString(@Title,2,Len(@Title)-1)
		end
		else begin
			Set @Car = SubString(@Title,@PosCar-1,1)
			if ascii(@Car)>64 and ascii(@Car)<91 begin
				Set @Title = SubString(@Title,1,@PosCar-1) + 'É' + SubString(@Title,@PosCar+1,Len(@Title)-@PosCar)
			end
		end
		Set @PosCar = CharIndex('é',@Title,@PosCar+1)
	end
	Set @PosCar = CharIndex('è',@Title)
	while @PosCar > 0
	begin
		if @PosCar = 1
		begin
			Set @title = 'È' + SubString(@Title,2,Len(@Title)-1)
		end
		else begin
			Set @Car = SubString(@Title,@PosCar-1,1)
			if ascii(@Car)>64 and ascii(@Car)<91 begin
				Set @Title = SubString(@Title,1,@PosCar-1) + 'È' + SubString(@Title,@PosCar+1,Len(@Title)-@PosCar)
			end
		end
		Set @PosCar = CharIndex('è',@Title,@PosCar+1)
	end
	Set @PosCar = CharIndex('ê',@Title)
	while @PosCar > 0
	begin
		if @PosCar = 1
		begin
			Set @title = 'Ê' + SubString(@Title,2,Len(@Title)-1)
		end
		else begin
			Set @Car = SubString(@Title,@PosCar-1,1)
			if ascii(@Car)>64 and ascii(@Car)<91 begin
				Set @Title = SubString(@Title,1,@PosCar-1) + 'Ê' + SubString(@Title,@PosCar+1,Len(@Title)-@PosCar)
			end
		end
		Set @PosCar = CharIndex('ê',@Title,@PosCar+1)
	end

	-- On ne garde pas les balises
	SET @I=0
	SET @bWrite=1
	SET @Car =''
	SET @Chaine =''
	WHILE @I<LEN(@Title)+1
	BEGIN
		SET @I=@I+1
		SET @Car=SUBSTRING(@Title,@I,1)
		IF @Car<>'<' And @Car<>'>'
		BEGIN
			IF @bWrite=1
			BEGIN
				SET @Chaine=@Chaine + @Car
			END
		END
		ELSE BEGIN
			IF @Car='<'
			BEGIN
				SET @bWrite=0
			END
			ELSE BEGIN
				SET @bWrite=1
			END
		END
	END
	SET @Chaine = Replace(@Chaine,'  ',' ')
	SET @result=ltrim(rtrim(@Chaine))
END
GO

DECLARE @Cur CURSOR			
DECLARE @DocId As varchar(8)
DECLARE @szTitle As varchar(255)
DECLARE @SGM As varchar(8000)
DECLARE @svgId As varchar(20)
SET @svgId=''
SET @Cur = CURSOR LOCAL FOR SELECT Saumon.DocId, Docs.SGM 
FROM Saumon Inner Join RubisExtraction..Documents As Docs On Saumon.DocId = Docs.nom_fichier 
Where Docs.Id_Type=4 And Docs.Valide=1 
--And DOCID = 'ID7394'
ORDER BY DocId

OPEN @Cur
FETCH NEXT FROM @Cur INTO @DocId, @SGM
WHILE (@@FETCH_STATUS = 0)
BEGIN
	if @svgId<>@DocId
	begin
		print 'DocId=' + @DocId
		EXEC GetTitle @SGM, @szTitle OUTPUT 
		UPDATE Saumon SET NomCompletMono=@szTitle WHERE DocId=@DocId
		SET @svgId=@DocId
	end
	FETCH NEXT FROM @Cur INTO @DocId, @SGM
END
CLOSE @Cur
DEALLOCATE @Cur
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[GetTitle]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetTitle]
GO
select * from Saumon where NOMCOMPLETMONO like "" Or NOMCOMPLETMONO is Null
print '(0 row(s) affected) si OK'

