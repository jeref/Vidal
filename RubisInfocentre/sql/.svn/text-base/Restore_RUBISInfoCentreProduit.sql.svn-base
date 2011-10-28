--**
print 'Restore_RubisInfoCentreProduit.sql'
--restore depuis RubisInfoCentreProduit.dmp
--V2.0 JFO 06/02/2008 pour automatisation
select @@servername
USE msdb
--déconnecter les utilisateurs pour être sûr que ça fonctionne
exec('kill_database_users RubisInfoCentreProduit')
GO
declare @DMP VARCHAR(255)
declare @LDF VARCHAR(500)
declare @MDF VARCHAR(500)

select @DMP = value from msdb..Production_VARIABLES where PROD_ID=3 And SERVER=@@SERVERNAME And name='DMP_REP'
set @DMP = @DMP + '\RubisInfocentreProduit.dmp'
print 'Dump File = ' + @DMP
select @LDF = value from msdb..Production_VARIABLES where PROD_ID=1 And SERVER=@@SERVERNAME And name='LOG_REP'
set @LDF = @LDF + '\RubisInfocentreProduit_Log.LDF'
print 'Log Data File = ' + @LDF
select @MDF = value from msdb..Production_VARIABLES where PROD_ID=1 And SERVER=@@SERVERNAME And name='DATA_REP'
set @MDF = @MDF + '\RubisInfocentreProduit_Data.MDF'
print 'Media Data File = ' + @MDF
RESTORE DATABASE RubisInfoCentreProduit FROM DISK=@DMP WITH MOVE 'RUBISInfoCentre_Data' TO @MDF, MOVE 'RUBISInfoCentre_Log' TO  @LDF, REPLACE
go
print '---------------------------settings---------------------'
exec sp_dboption 'RUBISExtraction','select into/bulkcopy','TRUE'
exec sp_dboption 'RUBISExtraction','trunc. log on chkpt.','TRUE'
exec sp_change_users_login 'Auto_Fix', 'IrisLecture';
exec sp_change_users_login 'Auto_Fix', 'sa';
GO
use RubisInfoCentreProduit
EXEC sp_updatestats