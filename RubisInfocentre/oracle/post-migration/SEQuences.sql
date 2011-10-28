--**
--SEQuences.sql
--V1.2 JFO 11/01/2007
-- A copier dans C:\Oracle\Ora81\bin
--A EXECUTER EN FAISANT @SEQ
--Origine : N:\dev web\Production_Bases_VidalCim\Traitement post Migration-ORACLE\sequences.txt
--executer les Drop manuellement Si probleme :
--drop sequence seq_id_spepresentationhop
create sequence seq_id_spepresentationhop increment by 1 start with 1 MINVALUE 0 NOCACHE  NOCYCLE;
--drop sequence seq_id_t_subhop
create sequence seq_id_t_subhop increment by 1 start with 1 MINVALUE 0 NOCACHE  NOCYCLE;
