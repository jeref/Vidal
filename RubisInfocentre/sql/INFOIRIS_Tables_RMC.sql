/* ============================================================ */
/*   Nom de la base   :  RMC_VIDALCIM                           */
/*   Nom de SGBD      :  SQL Server 7.x                         */
/*   Date de cr‚ation :  02/04/2001  10:00                      */
/* ============================================================ */

/* ============================================================ */
/*   Table : RMC_REG                                            */
/* ============================================================ */
create table RMC_REG
(
    REG_IDE      int                   not null,
    REG_REG_IDE  int                   not null,
    REG_LIB      varchar(255)          not null,
    DAT_MAJ      datetime              not null,
    USR_MAJ      varchar(30)           not null,
    OBS_MAJ      varchar(255)          null    ,
    constraint PK_RMC_REG primary key (REG_IDE)
)
go

/* ============================================================ */
/*   Index : A_COMME_PERE_FK                                    */
/* ============================================================ */
create index A_COMME_PERE_FK on RMC_REG (REG_REG_IDE)
go

/* ============================================================ */
/*   Table : RMC_ORI                                            */
/* ============================================================ */
create table RMC_ORI
(
    ORI_IDE      int                   not null,
    ORI_LIB      varchar(255)          not null,
    DAT_MAJ      datetime              not null,
    USR_MAJ      varchar(30)           not null,
    OBS_MAJ      varchar(255)          null    ,
    constraint PK_RMC_ORI primary key (ORI_IDE)
)
go

/* ============================================================ */
/*   Table : RMC_TYPE                                           */
/* ============================================================ */
create table RMC_TYPE
(
    TYPE_IDE     int                   not null,
    TYP_LIB      varchar(30)           not null,
    DAT_MAJ      datetime              not null,
    USR_MAJ      varchar(30)           not null,
    OBS_MAJ      varchar(255)          null    ,
    constraint PK_RMC_TYPE primary key (TYPE_IDE)
)
go

/* ============================================================ */
/*   Table : RMC_THE                                            */
/* ============================================================ */
create table RMC_THE
(
    THE_IDE      int               ,--    identity,
    TYPE_IDE     int                   not null,
    THE_CAF      varchar(60)           null    ,
    THE_LAF      varchar(255)          not null,
    ID           int                   not null,
    THE_VIS      char(1)               null    ,
    DAT_MAJ      datetime              null    ,
    USR_MAJ      varchar(30)           null    ,
    OBS_MAJ      varchar(255)          null    ,
    TMP_ORI_IDE  int                   null    ,
    TMP_REG_IDE  int                   null    ,
    constraint PK_RMC_THE primary key (THE_IDE)
)
go

/* ============================================================ */
/*   Index : TYPE_THESAURUS_FK                                  */
/* ============================================================ */
create index TYPE_THESAURUS_FK on RMC_THE (TYPE_IDE)
go

/* ============================================================ */
/*   Table : RMC_CLE                                            */
/* ============================================================ */
create table RMC_CLE
(
    CLE_IDE      int                  ,-- identity,
    ORI_IDE      int                   not null,
    TYPE_IDE     int                   not null,
    CLE_LIB      varchar(255)          not null,
    DAT_MAJ      datetime              null    ,
    USR_MAJ      varchar(30)           null    ,
    OBS_MAJ      varchar(255)          null    ,
    TMP_THE_IDE  int                   null    ,
    TMP_REG_IDE  int                   null    ,
    constraint PK_RMC_CLE primary key (CLE_IDE)
)
go

/* ============================================================ */
/*   Index : THE_ORI_FK                                         */
/* ============================================================ */
create index THE_ORI_FK on RMC_CLE (ORI_IDE)
go

/* ============================================================ */
/*   Index : TYPE_MOT_CLE_FK                                    */
/* ============================================================ */
create index TYPE_MOT_CLE_FK on RMC_CLE (TYPE_IDE)
go

/* ============================================================ */
/*   Table : RMC_THE_PRO                                        */
/* ============================================================ */
create table RMC_THE_PRO
(
    THE_IDE      int                   not null,
    THE_THE_IDE  int                   not null,
    NIVEAU       numeric(10)           null    ,
    DAT_MAJ      datetime              not null,
    USR_MAJ      varchar(30)           not null,
    OBS_MAJ      varchar(255)          null    ,
    constraint PK_RMC_THE_PRO primary key (THE_IDE, THE_THE_IDE)
)
go

/* ============================================================ */
/*   Index : LIEN_56_FK                                         */
/* ============================================================ */
create index LIEN_56_FK on RMC_THE_PRO (THE_IDE)
go

/* ============================================================ */
/*   Index : LIEN_63_FK                                         */
/* ============================================================ */
create index LIEN_63_FK on RMC_THE_PRO (THE_THE_IDE)
go

/* ============================================================ */
/*   Table : RMC_THE_HIE                                        */
/* ============================================================ */
create table RMC_THE_HIE
(
    THE_IDE      int                   not null,
    THE_THE_IDE  int                   not null,
    DAT_MAJ      datetime              null    ,
    USR_MAJ      varchar(30)           null    ,
    OBS_MAJ      varchar(255)          null    ,
    constraint PK_RMC_THE_HIE primary key (THE_IDE, THE_THE_IDE)
)
go

/* ============================================================ */
/*   Index : LIEN_59_FK                                         */
/* ============================================================ */
create index LIEN_59_FK on RMC_THE_HIE (THE_IDE)
go

/* ============================================================ */
/*   Index : LIEN_60_FK                                         */
/* ============================================================ */
create index LIEN_60_FK on RMC_THE_HIE (THE_THE_IDE)
go

/* ============================================================ */
/*   Table : RMC_THE_CLE                                        */
/* ============================================================ */
create table RMC_THE_CLE
(
    THE_IDE      int                   not null,
    CLE_IDE      int                   not null,
    REG_IDE      int                   not null,
    constraint PK_RMC_THE_CLE primary key (THE_IDE, CLE_IDE, REG_IDE)
)
go

/* ============================================================ */
/*   Index : LIEN_61_FK                                         */
/* ============================================================ */
create index LIEN_61_FK on RMC_THE_CLE (THE_IDE)
go

/* ============================================================ */
/*   Index : LIEN_62_FK                                         */
/* ============================================================ */
create index LIEN_62_FK on RMC_THE_CLE (CLE_IDE)
go

/* ============================================================ */
/*   Index : LIEN_64_FK                                         */
/* ============================================================ */
create index LIEN_64_FK on RMC_THE_CLE (REG_IDE)
go

/* ============================================================ */
/*   Table : RMC_THE_REG                                        */
/* ============================================================ */
create table RMC_THE_REG
(
    REG_IDE      int                   not null,
    THE_IDE      int                   not null,
    constraint PK_RMC_THE_REG primary key (REG_IDE, THE_IDE)
)
go

/* ============================================================ */
/*   Index : LIEN_67_FK                                         */
/* ============================================================ */
create index LIEN_67_FK on RMC_THE_REG (REG_IDE)
go

/* ============================================================ */
/*   Index : LIEN_68_FK                                         */
/* ============================================================ */
create index LIEN_68_FK on RMC_THE_REG (THE_IDE)
go

alter table RMC_REG
    add constraint FK_RMC_REG_A_COMME_P_RMC_REG foreign key  (REG_REG_IDE)
       references RMC_REG (REG_IDE)
go

alter table RMC_THE
    add constraint FK_RMC_THE_TYPE_THES_RMC_TYPE foreign key  (TYPE_IDE)
       references RMC_TYPE (TYPE_IDE)
go

alter table RMC_CLE
    add constraint FK_RMC_CLE_THE_ORI_RMC_ORI foreign key  (ORI_IDE)
       references RMC_ORI (ORI_IDE)
go

alter table RMC_CLE
    add constraint FK_RMC_CLE_TYPE_MOT__RMC_TYPE foreign key  (TYPE_IDE)
       references RMC_TYPE (TYPE_IDE)
go

alter table RMC_THE_PRO
    add constraint FK_RMC_THE__LIEN_56_RMC_THE foreign key  (THE_IDE)
       references RMC_THE (THE_IDE)
go

alter table RMC_THE_PRO
    add constraint FK_RMC_THE__LIEN_63_RMC_THE foreign key  (THE_THE_IDE)
       references RMC_THE (THE_IDE)
go

alter table RMC_THE_HIE
    add constraint FK_RMC_THE__LIEN_59_RMC_THE foreign key  (THE_IDE)
       references RMC_THE (THE_IDE)
go

alter table RMC_THE_HIE
    add constraint FK_RMC_THE__LIEN_60_RMC_THE foreign key  (THE_THE_IDE)
       references RMC_THE (THE_IDE)
go

alter table RMC_THE_CLE
    add constraint FK_RMC_THE__LIEN_61_RMC_THE foreign key  (THE_IDE)
       references RMC_THE (THE_IDE)
go

alter table RMC_THE_CLE
    add constraint FK_RMC_THE__LIEN_62_RMC_CLE foreign key  (CLE_IDE)
       references RMC_CLE (CLE_IDE)
go

alter table RMC_THE_CLE
    add constraint FK_RMC_THE__LIEN_64_RMC_REG foreign key  (REG_IDE)
       references RMC_REG (REG_IDE)
go

alter table RMC_THE_REG
    add constraint FK_RMC_THE__LIEN_67_RMC_REG foreign key  (REG_IDE)
       references RMC_REG (REG_IDE)
go

alter table RMC_THE_REG
    add constraint FK_RMC_THE__LIEN_68_RMC_THE foreign key  (THE_IDE)
       references RMC_THE (THE_IDE)
go

