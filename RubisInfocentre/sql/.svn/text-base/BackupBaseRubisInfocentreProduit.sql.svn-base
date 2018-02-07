--**
print 'BackupBaseRubisInfocentreProduit.sql'
--sauvegarde de RubisInfocentreProduit
declare @DMP VARCHAR(255)
select @DMP = value from msdb..Production_VARIABLES where PROD_ID=3 And SERVER=@@SERVERNAME And name='DMP_REP'
set @DMP = @DMP + '\RubisInfocentreProduit.dmp'
print 'BACKUP DATABASE RubisInfocentreProduit TO DISK= ' +@DMP +' WITH INIT'
BACKUP DATABASE RubisInfocentreProduit TO DISK= @DMP WITH INIT
go
