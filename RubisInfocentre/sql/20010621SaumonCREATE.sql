/* ============================================================ */
/*   Nom de la base   :  SAUMON                                 */
/*   Nom de SGBD      :  SQL Server 7.x                         */
/*   Date de cr‚ation :  21/06/2001  15:08                      */
/* ============================================================ */

/* ============================================================ */
/*   Table : LABOSAUMON                                         */
/* ============================================================ */
create table LABOSAUMON
(
    IDLABORATOIRE   varchar(50)           not null,
    LABORATOIRE     varchar(255)          not null,
    COMMUN          varchar(50)           null    ,
    constraint PK_LABOSAUMON primary key (IDLABORATOIRE)
)
go

/* ============================================================ */
/*   Table : SAUMON                                             */
/* ============================================================ */
create table SAUMON
(
    PRODUIT         varchar(100)          not null,
    DOCID           varchar(255)          not null,
    NOMCOMPLETMONO  varchar(255)          null    ,
    IDLABORATOIRE   varchar(50)           null    ,
    constraint PK_SAUMON primary key (PRODUIT)
)
go

alter table SAUMON
    add constraint FK_SAUMON_SAUMONLIE_LABOSAUM foreign key  (IDLABORATOIRE)
       references LABOSAUMON (IDLABORATOIRE)
go

