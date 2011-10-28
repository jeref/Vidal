--**
print 'MajVersion.sql'
--V2.0 JFO 02/03/2007 - production numérique - BackOffice VIDAL
--Maj table Version + controles
--suite erreur de saisie :
--select * from version order by DATE_INFO DESC
--update version set ID_VERSION='2.31' where DATE_INFO = '2006-09-21' And ID_TYPE_INFO='DB'
-- Incrémenter ID_Version de 1 à chaque extraction pour ID_TYPE = DB
-- Changer DATE_INFO et COMMENTAIRE pour ID_TYPE = DB et API
use RubisInfoCentreProduit
GO
set DateFormat ymd
-- calcul du N° de Mise à jour à insérer éventuellement dans le commentaire
Declare @Majcommentaire Varchar(100);
set @Majcommentaire = (
select top 1 CASE Substring(RIGHT(RTRIM(COMMENTAIRE), 5),1,3)
		WHEN Null THEN ' Maj 1'
		WHEN 'Maj' THEN ' Maj ' +Cast(Cast(RIGHT(RTRIM(COMMENTAIRE), 1) As Int)+1 As Char(1))
		ELSE ' Maj 1'
	END
	from version where ID_TYPE_INFO = 'DB'
order by DATE_INFO DESC
);
print 'Mise à jour calculee : ' +@Majcommentaire;
-- calcul de la version (version maximum + 1) :
Declare @DB Varchar(7);
select @DB = '2.' + Cast(Cast(Substring(MAX(ID_VERSION),3,2) As Int) +1 As Char(2)) from version where ID_TYPE_INFO = 'DB' And len(ID_VERSION)=4
print 'version calculee : ' +@DB;
Declare @DATE_INFO DateTime;
select @DATE_INFO = cast( cast(DatePart(year, Date_DONNEES) As Varchar(4))+'-' + '0' +cast(DatePart(month, Date_DONNEES) As Varchar(2)) +'-' +Cast(DatePart(Day, Date_DONNEES) As Varchar(2)) As DateTime) 
from RubisExtraction.dbo.infobase
--
print 'date calculée = ' +cast(@DATE_INFO As Varchar(50));
-- 
print 'contrôle de la date d''extraction : ne pas faire l''insertion si ça a déjà été fait.';
IF (select Max (DATE_INFO) from version) = @DATE_INFO
BEGIN
	RAISERROR('Error Maj version already done', 11, 1);
	RETURN
END
ELSE 
BEGIN
	print 'nouvelle Date Maj > Max(DATE_INFO)';
	select Max (DATE_INFO) As Max_Date_Info, @DATE_INFO As 'date_Info calculée' from version
END


-- DB :
-- delete from  version where COMMENTAIRE = '2/3 2010'
-- calcul du commentaire :
Declare @COMMENTAIRE Varchar(1000);
select @COMMENTAIRE=(
	select case 
		when DatePart(month, Date_DONNEES) < 4 Or DatePart(month, Date_DONNEES) = 12 then '1'
		when DatePart(month, Date_DONNEES) >= 4 And DatePart(month, Date_DONNEES) <= 8 then '2'
		when DatePart(month, Date_DONNEES) > 8 And DatePart(month, Date_DONNEES) < 12 then '3'
	END from RubisExtraction.dbo.infobase
		) +'/3 ' +(select MILLESIME from RubisExtraction.dbo.infobase);
-- insertion de la version
insert into version (ID_TYPE_INFO, ID_VERSION, DATE_INFO, NOM, COMMENTAIRE) 
-- exemple VALUES ('DB', '2.59', '2009-01-22', 'SA', '1/3 2009 Maj 1')
select
'DB',
@DB,
@DATE_INFO,
'SA', 
@COMMENTAIRE +(select case 
		when (DatePart(month, Date_DONNEES) = 12 Or DatePart(month, Date_DONNEES) = 4 Or DatePart(month, Date_DONNEES) = 9 ) then ''
		else @Majcommentaire
	END from RubisExtraction.dbo.infobase
	);

-- API :
insert into version (ID_TYPE_INFO, ID_VERSION, DATE_INFO, NOM, COMMENTAIRE)
select 'API', '2.11', 
@DATE_INFO,
'SA',
-- on reprend le commentaire inséré au-dessus.
(select COMMENTAIRE from version where ID_TYPE_INFO = 'DB' 
	And DATE_INFO = @DATE_INFO
)
;
GO
use RubisInfoCentreProduit;
-- Controles :
Declare @sql As Varchar(1000);
-- select MILLESIME +'2010%''' from RubisExtraction..infobase
select @sql='select * from version  where COMMENTAIRE like ''%' +MILLESIME +'%'' order by DATE_INFO DESC;' from RubisExtraction..infobase;
print @SQL
exec(@sql);
-- select * from version order by DATE_INFO DESC

select '#erreur [M' +'icrosoft] : doublon d''ID_VERSION pour ' + ID_TYPE_INFO + ' ' + cast(ID_VERSION As varchar) from version where ID_TYPE_INFO = 'DB' group by ID_VERSION, ID_TYPE_INFO having count(*) >1 ;
select '#erreur [M' +'icrosoft] : doublon d''ID_VERSION pour ' + ID_TYPE_INFO + ' ' + cast(ID_VERSION As varchar)  +' du ' +cast(DATE_INFO As Varchar(20)) from version where ID_TYPE_INFO = 'API' group by ID_VERSION, DATE_INFO, ID_TYPE_INFO having count(*) >1 ;
-- delete from version where DATE_INFO='2010-12-09' And COMMENTAIRE like '1/3 2011%'
-- insert into version select * from [SRV-VID-FABSQL7].RubisInfoCentreProduit.dbo.version where COMMENTAIRE like '1/3 2010%'
-- set dateformat ymd; update version set COMMENTAIRE = '2/3 2010 Maj 1' where COMMENTAIRE = '2/3 2010 maj 1' -- where DATE_INFO='2010-05-20'
-- select * from version where COMMENTAIRE like '2/3 2010%' 
-- select count(*) from spepresentation
-- select * from version  where COMMENTAIRE like '1/3 2010%'