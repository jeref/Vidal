CREATE OR REPLACE PACKAGE "AVIDAL_LIVRET"     AS
-- ======================================================================================
-- Script      : AVIDAL_LIVRET    Type : Package
-- Objet       :
-- Owner       : VIDAL
-- Création    : 05/03/2001
-- Auteur      : SG K2/PixelPark
-- Généré par  :
-- Modifié par : MR - 16/03/2001 - Modification #1 : Création de RMC_GetFromKeywordLivret
--             : MR - 23/03/2001 - Modification #2 : Création de GetSpeLivret
-- ======================================================================================
--*********************************************************************
--                          Déclarations
--*********************************************************************
-- --------------------------------------------------------------------
-- Sous-types table : LIVRETVIDAL/LIVRETHOP
-- --------------------------------------------------------------------
  SUBTYPE ID_SPEPRESENTATION IS  NUMBER;
  SUBTYPE IDORGANISME        IS  LIVRETVIDAL.IDORGANISME%TYPE;
  SUBTYPE PRIX_TTC_F         IS  LIVRETVIDAL.PRIX_TTC_F%TYPE;
  SUBTYPE PRIX_TTC_E         IS  LIVRETVIDAL.PRIX_TTC_E%TYPE;
  SUBTYPE DISPO              IS  LIVRETVIDAL.DISPO%TYPE;
  SUBTYPE COMMENTAIRE        IS  LIVRETVIDAL.COMMENTAIRE%TYPE;
  SUBTYPE CODHOPITAL		 IS  LIVRETVIDAL.CODHOPITAL%TYPE;
-- --------------------------------------------------------------------
-- Record : LIVRETVIDAL/LIVRETHOP
-- --------------------------------------------------------------------
  TYPE LIVRETVIDALRec IS RECORD
  (
  ID_SPEPRESENTATION Avidal_Livret.ID_SPEPRESENTATION,
  IDORGANISME        Avidal_Livret.IDORGANISME,
  PRIX_TTC_F         VARCHAR2(24),
  PRIX_TTC_E         VARCHAR2(24),
  DISPO              Avidal_Livret.DISPO,
  COMMENTAIRE        Avidal_Livret.COMMENTAIRE,
  CODHOPITAL	    Avidal_Livret.CODHOPITAL
  );
-- --------------------------------------------------------------------
-- Ref Cursor : LIVRETVIDAL/LIVRETHOP
-- --------------------------------------------------------------------
  TYPE LIVRETVIDALCurTyp 	IS REF CURSOR RETURN Avidal_Livret.LIVRETVIDALRec;
-- --------------------------------------------------------------------
-- Sous-types table : spepresentationhop
-- --------------------------------------------------------------------
  SUBTYPE IDORGANISMEHOP        IS SPEPRESENTATIONHOP.IDORGANISME%TYPE;
  SUBTYPE ID_SPEPRESENTATIONHOP IS SPEPRESENTATIONHOP.ID_SPEPRESENTATIONHOP%TYPE;
  SUBTYPE NOM                   IS SPEPRESENTATIONHOP.NOM%TYPE;
  SUBTYPE PRESENTATION          IS SPEPRESENTATIONHOP.PRESENTATION%TYPE;
  SUBTYPE FORME                 IS SPEPRESENTATIONHOP.FORME%TYPE;
  SUBTYPE DOSAGE                IS SPEPRESENTATIONHOP.DOSAGE%TYPE;
  SUBTYPE CIP                   IS SPEPRESENTATIONHOP.CIP%TYPE;
  SUBTYPE UCD                   IS SPEPRESENTATIONHOP.UCD%TYPE;
  SUBTYPE LABO                  IS SPEPRESENTATIONHOP.LABO%TYPE;
-- --------------------------------------------------------------------
-- Sous-types table : RMC_THE
-- --------------------------------------------------------------------
  SUBTYPE THE_IDE               IS RMC_THE.THE_IDE%TYPE;
  SUBTYPE TYPE_IDE              IS RMC_THE.TYPE_IDE%TYPE;
  SUBTYPE THE_CAF               IS RMC_THE.THE_CAF%TYPE;
  SUBTYPE THE_LAF               IS RMC_THE.THE_LAF%TYPE;
  SUBTYPE ID                    IS RMC_THE.ID%TYPE;
-- --------------------------------------------------------------------
-- Record : spepresentationhop
-- --------------------------------------------------------------------
  TYPE SpepresentationHopRec IS RECORD
  (
  IDORGANISME           Avidal_Livret.IDORGANISMEHOP,
  ID_SPEPRESENTATIONHOP Avidal_Livret.ID_SPEPRESENTATIONHOP,
  NOM                   Avidal_Livret.NOM,
  PRESENTATION          Avidal_Livret.PRESENTATION,
  FORME                 Avidal_Livret.FORME,
  DOSAGE                Avidal_Livret.DOSAGE,
  CIP                   Avidal_Livret.CIP,
  UCD                   Avidal_Livret.UCD,
  LABO                  Avidal_Livret.LABO,
  CODHOPITAL			Avidal_Livret.CODHOPITAL,
  PRIX_TTC_F            VARCHAR2(24),
  PRIX_TTC_E            VARCHAR2(24),
  DISPO                 Avidal_Livret.DISPO,
  COMMENTAIRE           Avidal_Livret.COMMENTAIRE
  );
-- --------------------------------------------------------------------
-- Ref Cursor : LIVRETVIDAL/LIVRETHOP
-- --------------------------------------------------------------------
  TYPE SpepresentationHopCurTyp 	IS REF CURSOR RETURN Avidal_Livret.SpepresentationHopRec;
-- --------------------------------------------------------------------
-- Sous-types table : T_SUBHOP
-- --------------------------------------------------------------------
  SUBTYPE IDORGANISME_SUBHOP  IS  T_SUBHOP.IDORGANISME%TYPE;
  SUBTYPE ID_T_SUBHOP  IS  T_SUBHOP.ID_T_SUBHOP%TYPE;
  SUBTYPE LIBELLE      IS  T_SUBHOP.LIBELLE%TYPE;
-- --------------------------------------------------------------------
-- Record : T_SUBHOP
-- --------------------------------------------------------------------
  TYPE T_SUBHOPRec IS RECORD
  (
  IDORGANISME   Avidal_Livret.IDORGANISME_SUBHOP,
  ID_T_SUBHOP   Avidal_Livret.ID_T_SUBHOP,
  LIBELLE       Avidal_Livret.LIBELLE
  );
-- --------------------------------------------------------------------
-- Record : RMC_THE
-- --------------------------------------------------------------------
  TYPE RMC_THERec IS RECORD
  (
   THE_IDE             Avidal_Livret.THE_IDE,
   TYPE_IDE            Avidal_Livret.TYPE_IDE,
   THE_CAF             Avidal_Livret.THE_CAF,
   THE_LAF             Avidal_Livret.THE_LAF,
   ID                  Avidal_Livret.ID,
   IDORGANISME         Avidal_Livret.IDORGANISME,
   FLAG                VARCHAR2(1)
  );
-- --------------------------------------------------------------------
-- Ref Cursor : T_SUBHOP
-- --------------------------------------------------------------------
  TYPE SUBHOPCurTyp 	  IS REF CURSOR RETURN Avidal_Livret.T_SUBHOPRec;
  TYPE RMC_THEHopCurTyp IS REF CURSOR RETURN Avidal_Livret.RMC_TheRec;
  TYPE RMC_TheCurTyp    IS REF CURSOR;
-- --------------------------------------------------------------------
-- Sous-types table : COMPOVIDAL/COPMPOHOP
-- --------------------------------------------------------------------
  SUBTYPE IDORGANISME_COMPO     IS  NUMBER;
  SUBTYPE ID_SPEPRESENTATION_COMPO IS  NUMBER;
  SUBTYPE ID_T_SUB              IS  NUMBER;
-- --------------------------------------------------------------------
-- Record : COMPOVIDAL/COPMPOHOP
-- --------------------------------------------------------------------
  TYPE COMPORec IS RECORD
  (
  IDORGANISMECOMPO      Avidal_Livret.IDORGANISME_COMPO,
  ID_SPEPRESENTATIONHOP Avidal_Livret.ID_SPEPRESENTATION_COMPO,
  ID_T_SUB              Avidal_Livret.ID_T_SUB,
  LIBELLE               Avidal_Livret.LIBELLE
  );
-- --------------------------------------------------------------------
-- Ref Cursor : COMPOVIDAL/COPMPOHOP
-- --------------------------------------------------------------------
  TYPE COMPOCurTyp 	IS REF CURSOR RETURN Avidal_Livret.COMPORec;
--*********************************************************************
--                      Procédure
--*********************************************************************
  -- ----------------------------------------------------------
  -- Procedure d'insertion - Table : LIVRETVIDAL/LIVRETHOP
  -- ----------------------------------------------------------
  PROCEDURE P_Ins_Livret(
      Param              IN  NUMBER,
      ID_SPEPRESENTATION IN  Avidal_Livret.ID_SPEPRESENTATION,
      IDORGANISME        IN  Avidal_Livret.IDORGANISME,
      PRIX_TTC_F         IN  Avidal_Livret.PRIX_TTC_F,
      PRIX_TTC_E         IN  Avidal_Livret.PRIX_TTC_E,
      DISPO              IN  Avidal_Livret.DISPO,
      COMMENTAIRE        IN  Avidal_Livret.COMMENTAIRE,
	  CODHOPITAL		 IN  Avidal_Livret.CODHOPITAL,
      Cod_Trt            OUT VARCHAR2);
  -- ----------------------------------------------------------
  -- Procedure d'suppression - Table : LIVRETVIDAL/LIVRETHOP
  -- ----------------------------------------------------------
  PROCEDURE P_Del_Livret(
      Param              IN  NUMBER,
      ID_SPEPRESENTATION IN  Avidal_Livret.ID_SPEPRESENTATION,
      IDORGANISME        IN  Avidal_Livret.IDORGANISME,
      Cod_Trt            OUT VARCHAR2);
  -- ----------------------------------------------------------
  -- Procedure de Modification - Tables : LIVRETVIDAL/LIVRETHOP
  -- ----------------------------------------------------------
  PROCEDURE P_Upd_Livret(
      Param              IN  NUMBER,
      ID_SPEPRESENTATION IN  Avidal_Livret.ID_SPEPRESENTATION,
      IDORGANISME        IN  Avidal_Livret.IDORGANISME,
      PRIX_TTC_F         IN  Avidal_Livret.PRIX_TTC_F,
      PRIX_TTC_E         IN  Avidal_Livret.PRIX_TTC_E,
      DISPO              IN  Avidal_Livret.DISPO,
      COMMENTAIRE        IN  Avidal_Livret.COMMENTAIRE,
      CODHOPITAL		 IN  Avidal_Livret.CODHOPITAL,
      Cod_Trt            OUT VARCHAR2);
  -- ----------------------------------------------------------
  -- Procedure de Modification ou d'Insertion - Tables : LIVRETVIDAL/LIVRETHOP
  -- Si l'enregistrement n'existe pas insert si non update
  -- ----------------------------------------------------------
  PROCEDURE P_InsUpd_Livret(
      Param              IN  NUMBER,
      ID_SPEPRESENTATION IN  Avidal_Livret.ID_SPEPRESENTATION,
      IDORGANISME        IN  Avidal_Livret.IDORGANISME,
      PRIX_TTC_F         IN  VARCHAR2,
      PRIX_TTC_E         IN  VARCHAR2,
      DISPO              IN  Avidal_Livret.DISPO,
      COMMENTAIRE        IN  Avidal_Livret.COMMENTAIRE,
      CODHOPITAL		 IN  Avidal_Livret.CODHOPITAL,
      Cod_Trt            OUT VARCHAR2);
  -- ----------------------------------------------------------
  -- Procedure de Sélection - Tables : LIVRETVIDAL/LIVRETHOP
  -- Toutes les colonnes
  -- Retour par ref_Cursor
  -- ----------------------------------------------------------
  PROCEDURE P_Sel_Livret(
      Param              IN  NUMBER,
      ID_SPEPRESENTATION IN  Avidal_Livret.ID_SPEPRESENTATION,
      IDORGANISME        IN  Avidal_Livret.IDORGANISME,
      PRIX_TTC_F         IN  VARCHAR2,
      PRIX_TTC_E         IN  VARCHAR2,
      DISPO              IN  Avidal_Livret.DISPO,
      COMMENTAIRE        IN  Avidal_Livret.COMMENTAIRE,
      CODHOPITAL		 IN  Avidal_Livret.CODHOPITAL,
      RefLIVRET          OUT Avidal_Livret.LIVRETVIDALCurTyp,
      Ret			           OUT NUMBER);
  -- ----------------------------------------------------------
  -- Procedure d'insertion - Table : COMPOVIDAL/COMPOHOP
  -- ----------------------------------------------------------
  PROCEDURE P_Ins_Compo(
      Param                 IN  NUMBER,
      IDORGANISME           IN  Avidal_Livret.IDORGANISME,
      ID_SPEPRESENTATIONHOP IN  Avidal_Livret.ID_SPEPRESENTATIONHOP,
      ID_T_SUB              IN  Avidal_Livret.ID_T_SUB,
      Cod_Trt               OUT VARCHAR2);
  -- ----------------------------------------------------------
  -- Procedure d'suppression - Table : COMPOVIDAL/COMPOHOP
  -- ----------------------------------------------------------
  PROCEDURE P_Del_Compo(
      Param                 IN  NUMBER,
      IDORGANISME           IN  Avidal_Livret.IDORGANISME,
      ID_SPEPRESENTATIONHOP IN  Avidal_Livret.ID_SPEPRESENTATIONHOP,
      ID_T_SUB              IN  Avidal_Livret.ID_T_SUB,
      Cod_Trt               OUT VARCHAR2);
  -- ----------------------------------------------------------
  -- Procedure de Sélection - Tables : COMPOVIDAL/COMPOHOP
  -- Toutes les colonnes
  -- Retour par ref_Cursor
  -- ----------------------------------------------------------
  PROCEDURE P_Sel_Compo(
      Param                 IN  NUMBER,
      IDORGANISME           IN  Avidal_Livret.IDORGANISME,
      ID_SPEPRESENTATIONHOP IN  Avidal_Livret.ID_SPEPRESENTATIONHOP,
      ID_T_SUB              IN  Avidal_Livret.ID_T_SUB,
      RefCOMPO              OUT Avidal_Livret.COMPOCurTyp,
      Ret			              OUT NUMBER);
  -- ----------------------------------------------------------
  -- Procedure d'insertion - Table : SpepresentationHop
  -- ----------------------------------------------------------
 PROCEDURE P_Ins_SpepresentationHop(
      IDORGANISME           IN  Avidal_Livret.IDORGANISME,
      ID_SPEPRESENTATIONHOP OUT Avidal_Livret.ID_SPEPRESENTATIONHOP,
      NOM                   IN  Avidal_Livret.NOM,
      PRESENTATION          IN  Avidal_Livret.PRESENTATION,
      FORME                 IN  Avidal_Livret.FORME,
      DOSAGE                IN  Avidal_Livret.DOSAGE,
      CIP                   IN  Avidal_Livret.CIP,
      UCD                   IN  Avidal_Livret.UCD,
      LABO                  IN  Avidal_Livret.LABO,
      CODHOPITAL            IN  Avidal_Livret.CODHOPITAL,
      PRIX_TTC_F            IN  VARCHAR2,
      PRIX_TTC_E            IN  VARCHAR2,
      DISPO                 IN  Avidal_Livret.DISPO,
      COMMENTAIRE           IN  Avidal_Livret.COMMENTAIRE,
      Cod_Trt               OUT VARCHAR2);
  -- ----------------------------------------------------------
  -- Procedure d'suppression - Table : SpepresentationHop
  -- ----------------------------------------------------------
  PROCEDURE P_Del_SpepresentationHop(
      IDORGANISME           IN  Avidal_Livret.IDORGANISME,
      ID_SPEPRESENTATIONHOP IN  Avidal_Livret.ID_SPEPRESENTATIONHOP,
      Cod_Trt            OUT VARCHAR2);
  -- ----------------------------------------------------------
  -- Procedure de Modification - Tables : SpepresentationHop
  -- ----------------------------------------------------------
  PROCEDURE P_Upd_SpepresentationHop(
      IDORGANISME           IN  Avidal_Livret.IDORGANISME,
      ID_SPEPRESENTATIONHOP IN  Avidal_Livret.ID_SPEPRESENTATIONHOP,
      NOM                   IN  Avidal_Livret.NOM,
      PRESENTATION          IN  Avidal_Livret.PRESENTATION,
      FORME                 IN  Avidal_Livret.FORME,
      DOSAGE                IN  Avidal_Livret.DOSAGE,
      CIP                   IN  Avidal_Livret.CIP,
      UCD                   IN  Avidal_Livret.UCD,
      LABO                  IN  Avidal_Livret.LABO,
      CODHOPITAL            IN  Avidal_Livret.CODHOPITAL,
      PRIX_TTC_F            IN  VARCHAR2,
      PRIX_TTC_E            IN  VARCHAR2,
      DISPO                 IN  Avidal_Livret.DISPO,
      COMMENTAIRE           IN  Avidal_Livret.COMMENTAIRE,
      Cod_Trt            OUT VARCHAR2);
  -- ----------------------------------------------------------
  -- Procedure de Sélection - Tables : SpepresentationHop
  -- Toutes les colonnes
  -- Retour par ref_Cursor
  -- ----------------------------------------------------------
  PROCEDURE P_Sel_SpepresentationHop(
      IDORGANISME           IN  Avidal_Livret.IDORGANISME,
      ID_SPEPRESENTATIONHOP IN  Avidal_Livret.ID_SPEPRESENTATIONHOP,
      NOM                   IN  Avidal_Livret.NOM,
      PRESENTATION          IN  Avidal_Livret.PRESENTATION,
      FORME                 IN  Avidal_Livret.FORME,
      DOSAGE                IN  Avidal_Livret.DOSAGE,
      CIP                   IN  Avidal_Livret.CIP,
      UCD                   IN  Avidal_Livret.UCD,
      LABO                  IN  Avidal_Livret.LABO,
      CODHOPITAL            IN  Avidal_Livret.CODHOPITAL,
      PRIX_TTC_F            IN  VARCHAR2,
      PRIX_TTC_E            IN  VARCHAR2,
      DISPO                 IN  Avidal_Livret.DISPO,
      COMMENTAIRE           IN  Avidal_Livret.COMMENTAIRE,
      RefSpepresentationHop OUT Avidal_Livret.SpepresentationHopCurTyp,
      Ret			          OUT NUMBER);
  -- ----------------------------------------------------------
  -- Procedure d'insertion - Table : T_SUBHOP
  -- ----------------------------------------------------------
 PROCEDURE P_Ins_SUBHOP(
      IDORGANISME   IN Avidal_Livret.IDORGANISME,
      ID_T_SUBHOP   OUT Avidal_Livret.ID_T_SUBHOP,
      LIBELLE       IN Avidal_Livret.LIBELLE,
      Cod_Trt       OUT VARCHAR2);
  -- ----------------------------------------------------------
  -- Procedure d'suppression - Table : T_SUBHOP
  -- ----------------------------------------------------------
  PROCEDURE P_Del_SUBHOP(
      IDORGANISME  IN Avidal_Livret.IDORGANISME,
      ID_T_SUBHOP  IN Avidal_Livret.ID_T_SUBHOP,
      Cod_Trt      OUT VARCHAR2);
  -- ----------------------------------------------------------
  -- Procedure de Modification - Tables : T_SUBHOP
  -- ----------------------------------------------------------
  PROCEDURE P_Upd_SUBHOP(
      IDORGANISME  IN Avidal_Livret.IDORGANISME,
      ID_T_SUBHOP  IN Avidal_Livret.ID_T_SUBHOP,
      LIBELLE      IN Avidal_Livret.LIBELLE,
      Cod_Trt      OUT VARCHAR2);
  -- ----------------------------------------------------------
  -- Procedure de Sélection - Tables : T_SUBHOP
  -- Toutes les colonnes
  -- Retour par ref_Cursor
  -- ----------------------------------------------------------
  PROCEDURE P_Sel_SUBHOP(
      IDORGANISME  IN Avidal_Livret.IDORGANISME,
      ID_T_SUBHOP  IN Avidal_Livret.ID_T_SUBHOP,
      LIBELLE      IN Avidal_Livret.LIBELLE,
      RefSUBHOP OUT Avidal_Livret.SUBHOPCurTyp,
      Ret			              OUT NUMBER);
  -- ----------------------------------------------------------------
  -- Procedure de Sélection - Tables : T_SUBHOP
  -- Toutes les colonnes
  -- Retour par ref_Cursor
  -- Modification #1 : Effectue une recherche dans la table des mots clés
  --   sur le début des Mots clés extraits de la string de recherche.
  --   Permet d'atteindre un élément de type quelconque de thesaurus.
  --   Dans le cas d'une spécialité : recherche dans le Livret de
  --   l'organisme (Id_hop) concerné et/ou dans RMC_THE selon la demande (Recherche).
  -- ----------------------------------------------------------------
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--Nouvelles Entrées
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  PROCEDURE RMC_GetFromKeyWordLivret_txt( ORI_IDE       IN     Rmc_Cle_Pubres.ORI_IDE  DEFAULT NULL,
                                      TYPE_IDE      IN     Rmc_Cle_Pubres.TYPE_IDE DEFAULT 2,
                                      CLE_LIB       IN     Rmc_Cle_Pubres.CLE_LIB  DEFAULT '%',
                                      Recherche     IN     VARCHAR2,
                                      Id_hop        IN     Avidal_Livret.IDORGANISME,
                                      RefLnkTHE     OUT    Avidal_Livret.RMC_THECurtyp,
                                      Ret           OUT    NUMBER);
  FUNCTION RMC_GetFromKeyWordLivret_txt( ORI_IDE       IN     Rmc_Cle_Pubres.ORI_IDE  DEFAULT NULL,
                                     TYPE_IDE      IN     Rmc_Cle_Pubres.TYPE_IDE DEFAULT 2,
                                     CLE_LIB       IN     Rmc_Cle_Pubres.CLE_LIB  DEFAULT '%',
                                     Recherche     IN     VARCHAR2,
                                     Id_hop        IN     Avidal_Livret.IDORGANISME,
                                     RefLnkTHE     OUT    Avidal_Livret.RMC_THECurtyp)
                                   RETURN  NUMBER;
  -- ----------------------------------------------------------------
  -- Procedure de Sélection
  -- Toutes les colonnes
  -- Retour par ref_Cursor
  -- Modification #2 : Retourne les spécialités répertoriées dans
  --                   les Livrets (VIDAL et HOPITAL) de l'Organisme
  --                   passé en paramètre (Id_hop).
  -- ----------------------------------------------------------------
  PROCEDURE GetSpeLivret_id ( Id_hop      IN    Avidal_Livret.IDORGANISME,
                           RefLnkTHE   OUT   Specialite_Pubres.SPECIALITECurTyp2,
                           Ret         OUT   NUMBER);
  FUNCTION GetSpeLivret_id ( Id_hop      IN    Avidal_Livret.IDORGANISME,
                          RefLnkTHE   OUT   Specialite_Pubres.SPECIALITECurTyp2)
                        RETURN  NUMBER;
       -- -------------------------------------------------------------------
       -- Procedure   : RMC_GetSpeLivret
       -- -------------------------------------------------------------------
  PROCEDURE RMC_GetSpeLivret_id ( The_Ide    IN    Rmc_The_Pubres.THE_IDE,
                               Type_Ide   IN    Rmc_The_Pubres.TYPE_IDE,
                               Hop        IN    NUMBER,
                               RefThe     OUT   Avidal_Livret.RMC_THEHopCurTyp,
                               Ret        OUT   NUMBER);
       -- -------------------------------------------------------------------
       -- Fonction   : RMC_GetSpeLivret
       -- Objet      : Recherche des spécifications à partir (au choix)
       --              . D'un code CIP        : recherche hiérachique père
       --              . D'une substance      : Recherche profil père
       --              . D'une indication     : Recherche profil père
       --              . D'une contre indic.  : Recherche profil père
       --              . D'une classe thera.  : Recherche profil père
       --              . D'une classe IAM     : Recherche profil père
       --              . D'un labo            : Recherche profil père
       --            : Modification #1
       --              . D'un labo            : Recherche profil fils
       --              . D'une classe IAM     : Recherche profil fils
       -- -------------------------------------------------------------------
  FUNCTION RMC_GetSpeLivret_id ( The_Ide    IN    Rmc_The_Pubres.THE_IDE,
                              Type_Ide   IN    Rmc_The_Pubres.TYPE_IDE,
                              Hop        IN    NUMBER,
                              RefThe     OUT   Avidal_Livret.RMC_THEHopCurTyp)
                           RETURN NUMBER;

  -- -------------------------------------------------------------------------------------------------
  -- Procedure de suppression - Table : LIVRETVIDAL/LIVRETHOP/LIVRETVIDALTEMP/LIVRETHOPTEMP
  -- -------------------------------------------------------------------------------------------------
  PROCEDURE P_Delete_Tables_Livret(
      Idorganisme        IN  NUMBER,
      Cod_Trt            OUT VARCHAR2);

--===================================================================================================================
   TTyp_Cst  Rmc_The_Pubres.TabType_Cst;
   ch1       VARCHAR2(255) := 'éêèëàäâïîöôüûùÿ';
   ch2       VARCHAR2(255) := 'eeeeaaaiioouuuy';

END Avidal_Livret;
/

CREATE OR REPLACE PACKAGE BODY "AVIDAL_LIVRET"          AS
-- =======================================================================================
-- Script      : AVIDAL_LIVRET    Type : Package Body
-- Objet       :
-- Owner       : VIDAL
-- Création    : 05/03/2001
-- Auteur      : SG K2/PixelPark
-- Généré par  :
-- Modifié par : MR - 16/03/2001 : Modification #1 : Création de RMC_GetFromKeywordLivret
--             : MR - 23/03/2001 - Modification #2 : Création de GetSpeLivret
-- =======================================================================================
  -- --------------------------------------------------------
  -- Variables du package
  -- --------------------------------------------------------
  MotEt         VARCHAR2(1) := '&';
  MotOu         VARCHAR2(1) := '|';
  MotSauf       VARCHAR2(1) := '#';
  MotParOpen    VARCHAR2(1) := '(';
  MotParClose   VARCHAR2(1) := ')';
  Home_Hie      VARCHAR2(60) := 'HIER_0';    -- Home hierarchique
  Home_Prf      VARCHAR2(60) := 'PROF_0';    -- Home profile
  Type_To       Rmc_The_Pubres.TYPE_IDE;
  -- ----------------------------------------------------------
  -- Procedure d'insertion - Table : LIVRETVIDAL/LIVRETHOP
  -- ----------------------------------------------------------
 PROCEDURE P_Ins_Livret(
      Param              IN  NUMBER,
      ID_SPEPRESENTATION IN  Avidal_Livret.ID_SPEPRESENTATION,
      IDORGANISME        IN  Avidal_Livret.IDORGANISME,
      PRIX_TTC_F         IN  Avidal_Livret.PRIX_TTC_F,
      PRIX_TTC_E         IN  Avidal_Livret.PRIX_TTC_E,
      DISPO              IN  Avidal_Livret.DISPO,
      COMMENTAIRE        IN  Avidal_Livret.COMMENTAIRE,
	  CODHOPITAL		 IN  Avidal_Livret.CODHOPITAL,
      Cod_Trt            OUT VARCHAR2) IS
 BEGIN
  IF P_Ins_Livret.Param = 1 THEN
    INSERT INTO LIVRETVIDAL(
           ID_SPEPRESENTATION,
           IDORGANISME,
           PRIX_TTC_F,
           PRIX_TTC_E,
           DISPO,
           COMMENTAIRE,
		   CODHOPITAL)
    VALUES (
           P_Ins_Livret.ID_SPEPRESENTATION,
           P_Ins_Livret.IDORGANISME,
           P_Ins_Livret.PRIX_TTC_F,
           P_Ins_Livret.PRIX_TTC_E,
           P_Ins_Livret.DISPO,
           P_Ins_Livret.COMMENTAIRE,
		   P_Ins_Livret.CODHOPITAL);
    P_Ins_Livret.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
    COMMIT;
  ELSIF P_Ins_Livret.Param = 2 THEN
    INSERT INTO LIVRETHOP(
           ID_SPEPRESENTATIONHOP,
           IDORGANISME,
           PRIX_TTC_F,
           PRIX_TTC_E,
           DISPO,
           COMMENTAIRE,
		   CODHOPITAL)
    VALUES (
           P_Ins_Livret.ID_SPEPRESENTATION,
           P_Ins_Livret.IDORGANISME,
           P_Ins_Livret.PRIX_TTC_F,
           P_Ins_Livret.PRIX_TTC_E,
           P_Ins_Livret.DISPO,
           P_Ins_Livret.COMMENTAIRE,
		   P_Ins_Livret.CODHOPITAL);
    P_Ins_Livret.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
    COMMIT;
  END IF;
  EXCEPTION
   WHEN OTHERS THEN
    P_Ins_Livret.Cod_Trt := SUBSTR(SQLERRM,1,255);
    ROLLBACK;
 END P_Ins_Livret;
  -- ----------------------------------------------------------
  -- Procedure d'suppression - Table : LIVRETVIDAL/LIVRETHOP
  -- ----------------------------------------------------------
  PROCEDURE P_Del_Livret(
      Param              IN  NUMBER,
      ID_SPEPRESENTATION IN  Avidal_Livret.ID_SPEPRESENTATION,
      IDORGANISME        IN  Avidal_Livret.IDORGANISME,
      Cod_Trt            OUT VARCHAR2) IS
  BEGIN
  IF P_Del_Livret.Param = 1 THEN
    DELETE FROM LIVRETVIDAL
      WHERE ID_SPEPRESENTATION = P_Del_Livret.ID_SPEPRESENTATION
      AND   IDORGANISME = P_Del_Livret.IDORGANISME;
    P_Del_Livret.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
    COMMIT;
  ELSIF P_Del_Livret.Param = 2 THEN
    DELETE FROM LIVRETHOP
      WHERE ID_SPEPRESENTATIONHOP = P_Del_Livret.ID_SPEPRESENTATION
      AND   IDORGANISME = P_Del_Livret.IDORGANISME;
    P_Del_Livret.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
    COMMIT;
  END IF;
  EXCEPTION
   WHEN OTHERS THEN
    P_Del_Livret.Cod_Trt := SUBSTR(SQLERRM,1,255);
    ROLLBACK;
  END P_Del_Livret;
  -- ----------------------------------------------------------
  -- Procedure de Modification - Tables : LIVRETVIDAL/LIVRETHOP
  -- ----------------------------------------------------------
  PROCEDURE P_Upd_Livret(
      Param              IN  NUMBER,
      ID_SPEPRESENTATION IN  Avidal_Livret.ID_SPEPRESENTATION,
      IDORGANISME        IN  Avidal_Livret.IDORGANISME,
      PRIX_TTC_F         IN  Avidal_Livret.PRIX_TTC_F,
      PRIX_TTC_E         IN  Avidal_Livret.PRIX_TTC_E,
      DISPO              IN  Avidal_Livret.DISPO,
      COMMENTAIRE        IN  Avidal_Livret.COMMENTAIRE,
	  CODHOPITAL		 IN  Avidal_Livret.CODHOPITAL,
      Cod_Trt            OUT VARCHAR2)IS
  BEGIN
  IF P_Upd_Livret.Param = 1 THEN
    UPDATE LIVRETVIDAL
    SET PRIX_TTC_F  = P_Upd_Livret.PRIX_TTC_F,
        PRIX_TTC_E  = P_Upd_Livret.PRIX_TTC_E,
        DISPO       = P_Upd_Livret.DISPO,
        COMMENTAIRE = P_Upd_Livret.COMMENTAIRE,
		CODHOPITAL  = P_Upd_Livret.CODHOPITAL
    WHERE ID_SPEPRESENTATION = P_Upd_Livret.ID_SPEPRESENTATION
      AND IDORGANISME = P_Upd_Livret.IDORGANISME;
    P_Upd_Livret.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
    COMMIT;
  ELSIF P_Upd_Livret.Param = 2 THEN
    UPDATE LIVRETHOP
    SET PRIX_TTC_F  = P_Upd_Livret.PRIX_TTC_F,
        PRIX_TTC_E  = P_Upd_Livret.PRIX_TTC_E,
        DISPO       = P_Upd_Livret.DISPO,
        COMMENTAIRE = P_Upd_Livret.COMMENTAIRE,
		CODHOPITAL  = P_Upd_Livret.CODHOPITAL
    WHERE ID_SPEPRESENTATIONHOP = P_Upd_Livret.ID_SPEPRESENTATION
      AND IDORGANISME = P_Upd_Livret.IDORGANISME;
    P_Upd_Livret.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
    COMMIT;
  END IF;
  EXCEPTION
   WHEN OTHERS THEN
    P_Upd_Livret.Cod_Trt := SUBSTR(SQLERRM,1,255);
    ROLLBACK;
  END P_Upd_Livret;
  -- -------------------------------------------------------------------------
  -- Procedure de Modification ou d'Insertion - Tables : LIVRETVIDAL/LIVRETHOP
  -- Si l'enregistrement n'existe pas insert si non update
  -- -------------------------------------------------------------------------
  PROCEDURE P_InsUpd_Livret(
      Param              IN  NUMBER,
      ID_SPEPRESENTATION IN  Avidal_Livret.ID_SPEPRESENTATION,
      IDORGANISME        IN  Avidal_Livret.IDORGANISME,
      PRIX_TTC_F         IN  VARCHAR2,
      PRIX_TTC_E         IN  VARCHAR2,
      DISPO              IN  Avidal_Livret.DISPO,
      COMMENTAIRE        IN  Avidal_Livret.COMMENTAIRE,
	  CODHOPITAL		 IN  Avidal_Livret.CODHOPITAL,
      Cod_Trt            OUT VARCHAR2)IS
    cpt NUMBER;
  BEGIN
  cpt := -1;
  --défini si insert ou update
  IF P_InsUpd_Livret.Param = 1 THEN
    SELECT COUNT(1) INTO cpt FROM LIVRETVIDAL
      WHERE ID_SPEPRESENTATION = P_InsUpd_Livret.ID_SPEPRESENTATION
      AND IDORGANISME          = P_InsUpd_Livret.IDORGANISME;
  ELSIF P_InsUpd_Livret.Param = 2 THEN
    SELECT COUNT(1) INTO cpt FROM LIVRETHOP
      WHERE ID_SPEPRESENTATIONHOP = P_InsUpd_Livret.ID_SPEPRESENTATION
      AND IDORGANISME             = P_InsUpd_Livret.IDORGANISME;
  END IF;
  IF cpt > 0 THEN
      IF P_InsUpd_Livret.Param = 1 THEN
        UPDATE LIVRETVIDAL
        SET PRIX_TTC_F  = TO_NUMBER(P_InsUpd_Livret.PRIX_TTC_F),
            PRIX_TTC_E  = TO_NUMBER(P_InsUpd_Livret.PRIX_TTC_E),
            DISPO       = P_InsUpd_Livret.DISPO,
            COMMENTAIRE = P_InsUpd_Livret.COMMENTAIRE,
			CODHOPITAL  = P_InsUpd_Livret.CODHOPITAL
        WHERE ID_SPEPRESENTATION = P_InsUpd_Livret.ID_SPEPRESENTATION
          AND IDORGANISME = P_InsUpd_Livret.IDORGANISME;
        P_InsUpd_Livret.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
        COMMIT;
      ELSIF P_InsUpd_Livret.Param = 2 THEN
        UPDATE LIVRETHOP
        SET PRIX_TTC_F  = TO_NUMBER(P_InsUpd_Livret.PRIX_TTC_F),
            PRIX_TTC_E  = TO_NUMBER(P_InsUpd_Livret.PRIX_TTC_E),
            DISPO       = P_InsUpd_Livret.DISPO,
            COMMENTAIRE = P_InsUpd_Livret.COMMENTAIRE,
			CODHOPITAL  = P_InsUpd_Livret.CODHOPITAL
        WHERE ID_SPEPRESENTATIONHOP = P_InsUpd_Livret.ID_SPEPRESENTATION
          AND IDORGANISME = P_InsUpd_Livret.IDORGANISME;
        P_InsUpd_Livret.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
        COMMIT;
      END IF;
  ELSIF cpt = 0 THEN
      IF P_InsUpd_Livret.Param = 1 THEN
        INSERT INTO LIVRETVIDAL(
               ID_SPEPRESENTATION,
               IDORGANISME,
               PRIX_TTC_F,
               PRIX_TTC_E,
               DISPO,
               COMMENTAIRE,
			   CODHOPITAL)
        VALUES (
               P_InsUpd_Livret.ID_SPEPRESENTATION,
               P_InsUpd_Livret.IDORGANISME,
               TO_NUMBER(P_InsUpd_Livret.PRIX_TTC_F),
               TO_NUMBER(P_InsUpd_Livret.PRIX_TTC_E),
               P_InsUpd_Livret.DISPO,
               P_InsUpd_Livret.COMMENTAIRE,
			   P_InsUpd_Livret.CODHOPITAL);
        P_InsUpd_Livret.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
        COMMIT;
      ELSIF P_InsUpd_Livret.Param = 2 THEN
        INSERT INTO LIVRETHOP(
               ID_SPEPRESENTATIONHOP,
               IDORGANISME,
               PRIX_TTC_F,
               PRIX_TTC_E,
               DISPO,
               COMMENTAIRE,
			   CODHOPITAL)
        VALUES (
               P_InsUpd_Livret.ID_SPEPRESENTATION,
               P_InsUpd_Livret.IDORGANISME,
               TO_NUMBER(P_InsUpd_Livret.PRIX_TTC_F),
               TO_NUMBER(P_InsUpd_Livret.PRIX_TTC_E),
               P_InsUpd_Livret.DISPO,
               P_InsUpd_Livret.COMMENTAIRE,
			   P_InsUpd_Livret.CODHOPITAL);
        P_InsUpd_Livret.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
        COMMIT;
      END IF;
  END IF;
  EXCEPTION
   WHEN OTHERS THEN
    P_InsUpd_Livret.Cod_Trt := SUBSTR(SQLERRM,1,255);
    ROLLBACK;
  END P_InsUpd_Livret;
  -- ----------------------------------------------------------
  -- Procedure de Sélection - Tables : LIVRETVIDAL/LIVRETHOP
  -- Toutes les colonnes
  -- Retour par ref_Cursor
  -- ----------------------------------------------------------
  PROCEDURE P_Sel_Livret(
      Param              IN  NUMBER,
      ID_SPEPRESENTATION IN  Avidal_Livret.ID_SPEPRESENTATION,
      IDORGANISME        IN  Avidal_Livret.IDORGANISME,
      PRIX_TTC_F         IN  VARCHAR2,
      PRIX_TTC_E         IN  VARCHAR2,
      DISPO              IN  Avidal_Livret.DISPO,
      COMMENTAIRE        IN  Avidal_Livret.COMMENTAIRE,
	  CODHOPITAL		 IN  Avidal_Livret.CODHOPITAL,
      RefLIVRET          OUT Avidal_Livret.LIVRETVIDALCurTyp,
      Ret                OUT NUMBER)IS
	BEGIN
  IF P_Sel_Livret.Param = 1 THEN
		OPEN RefLIVRET FOR
		SELECT ID_SPEPRESENTATION,IDORGANISME,TO_CHAR(PRIX_TTC_F) PRIX_TTC_F, TO_CHAR(PRIX_TTC_E) PRIX_TTC_E, DISPO,COMMENTAIRE,CODHOPITAL
		  FROM LIVRETVIDAL
		 WHERE ID_SPEPRESENTATION = NVL(P_Sel_Livret.ID_SPEPRESENTATION,ID_SPEPRESENTATION)
		   AND IDORGANISME = P_Sel_Livret.IDORGANISME
		   AND NVL(PRIX_TTC_F,0.0)  = NVL(P_Sel_Livret.PRIX_TTC_F,NVL(PRIX_TTC_F,0.0))
		   AND NVL(PRIX_TTC_E,0.0)  = NVL(P_Sel_Livret.PRIX_TTC_E,NVL(PRIX_TTC_E,0.0))
		   AND UPPER(NVL(DISPO,'AAAAAAAA'))       LIKE UPPER(NVL(P_Sel_Livret.DISPO,NVL(DISPO,'AAAAAAAA')))
		   AND UPPER(NVL(COMMENTAIRE,'AAAAAAAA')) LIKE UPPER(NVL(P_Sel_Livret.COMMENTAIRE,NVL(COMMENTAIRE,'AAAAAAAA')))
		   AND UPPER(NVL(CODHOPITAL,'AAAAAAAA')) LIKE UPPER(NVL(P_Sel_Livret.CODHOPITAL,NVL(CODHOPITAL,'AAAAAAAA')));
   	P_Sel_Livret.Ret := 1;
	ELSIF P_Sel_Livret.Param = 2 THEN
		OPEN RefLIVRET FOR
		SELECT ID_SPEPRESENTATIONHOP,IDORGANISME,TO_CHAR(PRIX_TTC_F) PRIX_TTC_F, TO_CHAR(PRIX_TTC_E) PRIX_TTC_E,DISPO,COMMENTAIRE,CODHOPITAL
		  FROM LIVRETHOP
		 WHERE ID_SPEPRESENTATIONHOP = NVL(P_Sel_Livret.ID_SPEPRESENTATION,ID_SPEPRESENTATIONHOP)
		   AND IDORGANISME = P_Sel_Livret.IDORGANISME
		   AND NVL(PRIX_TTC_F,0.0)  = NVL(P_Sel_Livret.PRIX_TTC_F,NVL(PRIX_TTC_F,0.0))
		   AND NVL(PRIX_TTC_E,0.0)  = NVL(P_Sel_Livret.PRIX_TTC_E,NVL(PRIX_TTC_E,0.0))
		   AND UPPER(NVL(DISPO,'AAAAAAAA'))       LIKE UPPER(NVL(P_Sel_Livret.DISPO,NVL(DISPO,'AAAAAAAA')))
		   AND UPPER(NVL(COMMENTAIRE,'AAAAAAAA')) LIKE UPPER(NVL(P_Sel_Livret.COMMENTAIRE,NVL(COMMENTAIRE,'AAAAAAAA')))
		   AND UPPER(NVL(CODHOPITAL,'AAAAAAAA')) LIKE UPPER(NVL(P_Sel_Livret.CODHOPITAL,NVL(CODHOPITAL,'AAAAAAAA')));
   	P_Sel_Livret.Ret := 1;
	END IF;
  EXCEPTION
		WHEN OTHERS THEN
			 P_Sel_Livret.Ret := SQLCODE;
  END P_Sel_Livret;
  -- ----------------------------------------------------------
  -- Procedure d'insertion - Table : COMPOVIDAL/COMPOHOP
  -- ----------------------------------------------------------
 PROCEDURE P_Ins_Compo(
      Param                 IN  NUMBER,
      IDORGANISME           IN  Avidal_Livret.IDORGANISME,
      ID_SPEPRESENTATIONHOP IN  Avidal_Livret.ID_SPEPRESENTATIONHOP,
      ID_T_SUB              IN  Avidal_Livret.ID_T_SUB,
      Cod_Trt               OUT VARCHAR2) IS
 BEGIN
  IF P_Ins_Compo.Param = 1 THEN
    INSERT INTO COMPOVIDAL(
           IDORGANISME,
           ID_SPEPRESENTATIONHOP,
           ID_T_SUB)
    VALUES (
           P_Ins_Compo.IDORGANISME,
           P_Ins_Compo.ID_SPEPRESENTATIONHOP,
           P_Ins_Compo.ID_T_SUB);
    P_Ins_Compo.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
    COMMIT;
  ELSIF P_Ins_Compo.Param = 2 THEN
    INSERT INTO COMPOHOP(
           IDORGANISME,
           ID_SPEPRESENTATIONHOP,
           ID_T_SUBHOP)
    VALUES (
           P_Ins_Compo.IDORGANISME,
           P_Ins_Compo.ID_SPEPRESENTATIONHOP,
           P_Ins_Compo.ID_T_SUB);
    P_Ins_Compo.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
    COMMIT;
  END IF;
  EXCEPTION
   WHEN OTHERS THEN
    P_Ins_Compo.Cod_Trt := SUBSTR(SQLERRM,1,255);
    ROLLBACK;
 END P_Ins_Compo;
  -- ----------------------------------------------------------
  -- Procedure d'suppression - Table : COMPOVIDAL/COMPOHOP
  -- ----------------------------------------------------------
 PROCEDURE P_Del_Compo(
      Param              IN  NUMBER,
      IDORGANISME           IN  Avidal_Livret.IDORGANISME,
      ID_SPEPRESENTATIONHOP IN  Avidal_Livret.ID_SPEPRESENTATIONHOP,
      ID_T_SUB              IN  Avidal_Livret.ID_T_SUB,
      Cod_Trt            OUT VARCHAR2) IS
 BEGIN
   --
   -- pour supprimer toutes les associations d'un ID_SPEPRESENTATIONHOP et d'un IDORGANISME,
   -- il faut passer ID_T_SUB = 0 en parametre.
   --
  IF P_Del_Compo.Param = 1 THEN
    DELETE FROM COMPOVIDAL
      WHERE IDORGANISME = P_Del_Compo.IDORGANISME
        AND ID_SPEPRESENTATIONHOP = P_Del_Compo.ID_SPEPRESENTATIONHOP
        AND (  P_Del_Compo.ID_T_SUB = 0 OR ID_T_SUB = P_Del_Compo.ID_T_SUB);
    P_Del_Compo.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
    COMMIT;
  ELSIF P_Del_Compo.Param = 2 THEN
    DELETE FROM COMPOHOP
      WHERE IDORGANISME = P_Del_Compo.IDORGANISME
        AND ID_SPEPRESENTATIONHOP = P_Del_Compo.ID_SPEPRESENTATIONHOP
        AND ( P_Del_Compo.ID_T_SUB = 0 OR ID_T_SUBHOP = P_Del_Compo.ID_T_SUB);
    P_Del_Compo.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
    COMMIT;
  END IF;
  EXCEPTION
   WHEN OTHERS THEN
    P_Del_Compo.Cod_Trt := SUBSTR(SQLERRM,1,255);
    ROLLBACK;
 END P_Del_Compo;
  -- ----------------------------------------------------------
  -- Procedure de Sélection - Tables : COMPOVIDAL/COMPOHOP
  -- Toutes les colonnes
  -- Retour par ref_Cursor
  -- ----------------------------------------------------------
 PROCEDURE P_Sel_Compo(
      Param                 IN  NUMBER,
      IDORGANISME           IN  Avidal_Livret.IDORGANISME,
      ID_SPEPRESENTATIONHOP IN  Avidal_Livret.ID_SPEPRESENTATIONHOP,
      ID_T_SUB              IN  Avidal_Livret.ID_T_SUB,
      RefCOMPO              OUT Avidal_Livret.COMPOCurTyp,
      Ret			              OUT NUMBER) IS
 BEGIN
  IF P_Sel_Compo.Param = 1 THEN
		OPEN RefCOMPO FOR
		SELECT C.IDORGANISME, C.ID_SPEPRESENTATIONHOP, C.ID_T_SUB, T.LIBELLE
      FROM COMPOVIDAL C, T_SUB T
		 WHERE C.IDORGANISME = P_Sel_Compo.IDORGANISME
		   AND C.ID_SPEPRESENTATIONHOP = DECODE(P_Sel_Compo.ID_SPEPRESENTATIONHOP,0,C.ID_SPEPRESENTATIONHOP,P_Sel_Compo.ID_SPEPRESENTATIONHOP)
		   AND C.ID_T_SUB  = DECODE(P_Sel_Compo.ID_T_SUB,0,C.ID_T_SUB,P_Sel_Compo.ID_T_SUB)
		   AND C.ID_T_SUB = T.ID_T_SUB;
   	P_Sel_Compo.Ret := 1;
	ELSIF P_Sel_Compo.Param = 2 THEN
		OPEN RefCOMPO FOR
		SELECT C.IDORGANISME, C.ID_SPEPRESENTATIONHOP, C.ID_T_SUBHOP, T.LIBELLE
      FROM COMPOHOP C, T_SUBHOP T
		 WHERE C.IDORGANISME = P_Sel_Compo.IDORGANISME
		   AND C.ID_SPEPRESENTATIONHOP = DECODE(P_Sel_Compo.ID_SPEPRESENTATIONHOP,0,C.ID_SPEPRESENTATIONHOP,P_Sel_Compo.ID_SPEPRESENTATIONHOP)
		   AND C.ID_T_SUBHOP  = DECODE(P_Sel_Compo.ID_T_SUB,0,C.ID_T_SUBHOP,P_Sel_Compo.ID_T_SUB)
		   AND C.IDORGANISME = T.IDORGANISME
		   AND C.ID_T_SUBHOP = T.ID_T_SUBHOP;
   	P_Sel_Compo.Ret := 1;
	END IF;
  EXCEPTION
		WHEN OTHERS THEN
			 P_Sel_Compo.Ret := SQLCODE;
  END P_Sel_Compo;
  -- ----------------------------------------------------------
  -- Procedure d'insertion - Table : SpepresentationHop
  -- ----------------------------------------------------------
 PROCEDURE P_Ins_SpepresentationHop(
      IDORGANISME           IN  Avidal_Livret.IDORGANISME,
      ID_SPEPRESENTATIONHOP OUT Avidal_Livret.ID_SPEPRESENTATIONHOP,
      NOM                   IN  Avidal_Livret.NOM,
      PRESENTATION          IN  Avidal_Livret.PRESENTATION,
      FORME                 IN  Avidal_Livret.FORME,
      DOSAGE                IN  Avidal_Livret.DOSAGE,
      CIP                   IN  Avidal_Livret.CIP,
      UCD                   IN  Avidal_Livret.UCD,
      LABO                  IN  Avidal_Livret.LABO,
	  CODHOPITAL			IN  Avidal_Livret.CODHOPITAL,
      PRIX_TTC_F            IN  VARCHAR2,
      PRIX_TTC_E            IN  VARCHAR2,
      DISPO                 IN  Avidal_Livret.DISPO,
      COMMENTAIRE           IN  Avidal_Livret.COMMENTAIRE,
      Cod_Trt               OUT VARCHAR2) IS
   v_id_spepresentationhop NUMBER;
 BEGIN
    SELECT SEQ_ID_SPEPRESENTATIONHOP.NEXTVAL
    INTO v_id_spepresentationhop
    FROM dual;
    INSERT INTO SPEPRESENTATIONHOP(
        IDORGANISME,
        ID_SPEPRESENTATIONHOP,
        NOM,
        PRESENTATION,
        FORME,
        DOSAGE,
        CIP,
        UCD,
        LABO)
    VALUES (
        P_Ins_SpepresentationHop.IDORGANISME,
        v_id_spepresentationhop,
        P_Ins_SpepresentationHop.NOM,
        P_Ins_SpepresentationHop.PRESENTATION,
        P_Ins_SpepresentationHop.FORME,
        P_Ins_SpepresentationHop.DOSAGE,
        P_Ins_SpepresentationHop.CIP,
        P_Ins_SpepresentationHop.UCD,
        P_Ins_SpepresentationHop.LABO);
    INSERT INTO LIVRETHOP(
           ID_SPEPRESENTATIONHOP,
           IDORGANISME,
           PRIX_TTC_F,
           PRIX_TTC_E,
           DISPO,
           COMMENTAIRE,
		   CODHOPITAL)
    VALUES (
           v_id_spepresentationhop,
           P_Ins_SpepresentationHop.IDORGANISME,
           TO_NUMBER(P_Ins_SpepresentationHop.PRIX_TTC_F),
           TO_NUMBER(P_Ins_SpepresentationHop.PRIX_TTC_E),
           P_Ins_SpepresentationHop.DISPO,
           P_Ins_SpepresentationHop.COMMENTAIRE,
		   P_Ins_SpepresentationHop.CODHOPITAL);
    P_Ins_SpepresentationHop.ID_SPEPRESENTATIONHOP := v_id_spepresentationhop;
    P_Ins_SpepresentationHop.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
    COMMIT;
 EXCEPTION
   WHEN OTHERS THEN
    P_Ins_SpepresentationHop.Cod_Trt := SUBSTR(SQLERRM,1,255);
    ROLLBACK;
 END P_Ins_SpepresentationHop;
  -- ----------------------------------------------------------
  -- Procedure d'suppression - Table : SpepresentationHop
  -- ----------------------------------------------------------
 PROCEDURE P_Del_SpepresentationHop(
      IDORGANISME           IN  Avidal_Livret.IDORGANISME,
      ID_SPEPRESENTATIONHOP IN  Avidal_Livret.ID_SPEPRESENTATIONHOP,
      Cod_Trt            OUT VARCHAR2) IS
 BEGIN
    DELETE FROM COMPOVIDAL
      WHERE IDORGANISME           = P_Del_SpepresentationHop.IDORGANISME
        AND ID_SPEPRESENTATIONHOP = P_Del_SpepresentationHop.ID_SPEPRESENTATIONHOP;
    DELETE FROM COMPOHOP
      WHERE IDORGANISME           = P_Del_SpepresentationHop.IDORGANISME
        AND ID_SPEPRESENTATIONHOP = P_Del_SpepresentationHop.ID_SPEPRESENTATIONHOP;
    DELETE FROM LIVRETHOP
      WHERE IDORGANISME           = P_Del_SpepresentationHop.IDORGANISME
        AND ID_SPEPRESENTATIONHOP = P_Del_SpepresentationHop.ID_SPEPRESENTATIONHOP;
    DELETE FROM SPEPRESENTATIONHOP
      WHERE IDORGANISME           = P_Del_SpepresentationHop.IDORGANISME
        AND ID_SPEPRESENTATIONHOP = P_Del_SpepresentationHop.ID_SPEPRESENTATIONHOP;
    P_Del_SpepresentationHop.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
    COMMIT;
 EXCEPTION
   WHEN OTHERS THEN
    P_Del_SpepresentationHop.Cod_Trt := SUBSTR(SQLERRM,1,255);
    ROLLBACK;
 END P_Del_SpepresentationHop;
  -- ----------------------------------------------------------
  -- Procedure de Modification - Tables : SpepresentationHop
  -- ----------------------------------------------------------
 PROCEDURE P_Upd_SpepresentationHop(
      IDORGANISME           IN  Avidal_Livret.IDORGANISME,
      ID_SPEPRESENTATIONHOP IN  Avidal_Livret.ID_SPEPRESENTATIONHOP,
      NOM                   IN  Avidal_Livret.NOM,
      PRESENTATION          IN  Avidal_Livret.PRESENTATION,
      FORME                 IN  Avidal_Livret.FORME,
      DOSAGE                IN  Avidal_Livret.DOSAGE,
      CIP                   IN  Avidal_Livret.CIP,
      UCD                   IN  Avidal_Livret.UCD,
      LABO                  IN  Avidal_Livret.LABO,
      CODHOPITAL            IN  Avidal_Livret.CODHOPITAL,
      PRIX_TTC_F            IN  VARCHAR2,
      PRIX_TTC_E            IN  VARCHAR2,
      DISPO                 IN  Avidal_Livret.DISPO,
      COMMENTAIRE           IN  Avidal_Livret.COMMENTAIRE,
      Cod_Trt            OUT VARCHAR2)IS
 BEGIN
    UPDATE SPEPRESENTATIONHOP
    SET NOM                   = P_Upd_SpepresentationHop.NOM,
        PRESENTATION          = P_Upd_SpepresentationHop.PRESENTATION,
        FORME                 = P_Upd_SpepresentationHop.FORME,
        DOSAGE                = P_Upd_SpepresentationHop.DOSAGE,
        CIP                   = P_Upd_SpepresentationHop.CIP,
        UCD                   = P_Upd_SpepresentationHop.UCD,
        LABO                  = P_Upd_SpepresentationHop.LABO
    WHERE IDORGANISME           = P_Upd_SpepresentationHop.IDORGANISME
      AND ID_SPEPRESENTATIONHOP = P_Upd_SpepresentationHop.ID_SPEPRESENTATIONHOP;
    UPDATE LIVRETHOP
    SET PRIX_TTC_F  = TO_NUMBER(P_Upd_SpepresentationHop.PRIX_TTC_F),
        PRIX_TTC_E  = TO_NUMBER(P_Upd_SpepresentationHop.PRIX_TTC_E),
        DISPO       = P_Upd_SpepresentationHop.DISPO,
        COMMENTAIRE = P_Upd_SpepresentationHop.COMMENTAIRE,
		CODHOPITAL  = P_Upd_SpepresentationHop.CODHOPITAL
    WHERE ID_SPEPRESENTATIONHOP  = P_Upd_SpepresentationHop.ID_SPEPRESENTATIONHOP
      AND IDORGANISME            = P_Upd_SpepresentationHop.IDORGANISME;
    P_Upd_SpepresentationHop.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
    COMMIT;
 EXCEPTION
   WHEN OTHERS THEN
    P_Upd_SpepresentationHop.Cod_Trt := SUBSTR(SQLERRM,1,255);
    ROLLBACK;
 END P_Upd_SpepresentationHop;
  -- ----------------------------------------------------------
  -- Procedure de Sélection - Tables : SpepresentationHop
  -- Toutes les colonnes
  -- Retour par ref_Cursor
  -- ----------------------------------------------------------
 PROCEDURE P_Sel_SpepresentationHop(
      IDORGANISME           IN  Avidal_Livret.IDORGANISME,
      ID_SPEPRESENTATIONHOP IN  Avidal_Livret.ID_SPEPRESENTATIONHOP,
      NOM                   IN  Avidal_Livret.NOM,
      PRESENTATION          IN  Avidal_Livret.PRESENTATION,
      FORME                 IN  Avidal_Livret.FORME,
      DOSAGE                IN  Avidal_Livret.DOSAGE,
      CIP                   IN  Avidal_Livret.CIP,
      UCD                   IN  Avidal_Livret.UCD,
      LABO                  IN  Avidal_Livret.LABO,
      CODHOPITAL            IN  Avidal_Livret.CODHOPITAL,
      PRIX_TTC_F            IN  VARCHAR2,
      PRIX_TTC_E            IN  VARCHAR2,
      DISPO                 IN  Avidal_Livret.DISPO,
      COMMENTAIRE           IN  Avidal_Livret.COMMENTAIRE,
      RefSpepresentationHop OUT Avidal_Livret.SpepresentationHopCurTyp,
      Ret			              OUT NUMBER)  IS
 BEGIN
      --
      -- Pour chercher tous les spepresentationhop il faut passer en paramètre ID_SPEPRESENTATIONHOP=0
      --
		OPEN RefSpepresentationHop FOR
		SELECT S.IDORGANISME,
		       S.ID_SPEPRESENTATIONHOP,
		       S.NOM,PRESENTATION,
		       S.FORME,
		       S.DOSAGE,
		       S.CIP,
		       S.UCD,
		       S.LABO,
		       L.CODHOPITAL,
		       TO_CHAR(L.PRIX_TTC_F) PRIX_TTC_F,
		       TO_CHAR(L.PRIX_TTC_E) PRIX_TTC_E,
		       L.DISPO,
		       L.COMMENTAIRE
		 FROM SPEPRESENTATIONHOP S, LIVRETHOP L
		 WHERE S.IDORGANISME           = P_Sel_SpepresentationHop.IDORGANISME
		   AND S.ID_SPEPRESENTATIONHOP = DECODE(P_Sel_SpepresentationHop.ID_SPEPRESENTATIONHOP, 0, S.ID_SPEPRESENTATIONHOP, P_Sel_SpepresentationHop.ID_SPEPRESENTATIONHOP)
		   AND UPPER(S.NOM)            LIKE UPPER(NVL(P_Sel_SpepresentationHop.NOM,S.NOM))
		   AND UPPER(NVL(S.PRESENTATION, 'AAAAAAAA'))   LIKE UPPER(NVL(P_Sel_SpepresentationHop.PRESENTATION, NVL(S.PRESENTATION, 'AAAAAAAA')))
		   AND UPPER(NVL(S.FORME, 'AAAAAAAA'))          LIKE UPPER(NVL(P_Sel_SpepresentationHop.FORME, NVL(S.FORME, 'AAAAAAAA')))
		   AND UPPER(NVL(S.DOSAGE, 'AAAAAAAA'))         LIKE UPPER(NVL(P_Sel_SpepresentationHop.DOSAGE, NVL(S.DOSAGE, 'AAAAAAAA')))
		   AND UPPER(NVL(S.CIP, 'AAAAAAAA'))            LIKE UPPER(NVL(P_Sel_SpepresentationHop.CIP, NVL(S.CIP, 'AAAAAAAA')))
		   AND UPPER(NVL(S.UCD, 'AAAAAAAA'))            LIKE UPPER(NVL(P_Sel_SpepresentationHop.UCD, NVL(S.UCD, 'AAAAAAAA')))
		   AND UPPER(NVL(S.LABO, 'AAAAAAAA'))           LIKE UPPER(NVL(P_Sel_SpepresentationHop.LABO, NVL(S.LABO, 'AAAAAAAA')))
		   AND UPPER(NVL(L.CODHOPITAL, 'AAAAAAAA'))     LIKE UPPER(NVL(P_Sel_SpepresentationHop.CODHOPITAL,NVL(L.CODHOPITAL, 'AAAAAAAA')))
		   AND S.IDORGANISME = L.IDORGANISME
		   AND S.ID_SPEPRESENTATIONHOP = L.ID_SPEPRESENTATIONHOP
		   AND NVL(L.PRIX_TTC_F, 0) = NVL(P_Sel_SpepresentationHop.PRIX_TTC_F, NVL(L.PRIX_TTC_F, 0))
		   AND NVL(L.PRIX_TTC_E, 0) = NVL(P_Sel_SpepresentationHop.PRIX_TTC_E, NVL(L.PRIX_TTC_E, 0))
		   AND UPPER(NVL(L.DISPO, 'AAAAAAAA'))           LIKE UPPER(NVL(P_Sel_SpepresentationHop.DISPO, NVL(L.DISPO, 'AAAAAAAA')))
		   AND UPPER(NVL(L.COMMENTAIRE, 'AAAAAAAA'))     LIKE UPPER(NVL(P_Sel_SpepresentationHop.COMMENTAIRE, NVL(L.COMMENTAIRE, 'AAAAAAAA')));
   	P_Sel_SpepresentationHop.Ret := 1;
 EXCEPTION
		WHEN OTHERS THEN
			 P_Sel_SpepresentationHop.Ret := SQLCODE;
 END P_Sel_SpepresentationHop;
  -- ----------------------------------------------------------
  -- Procedure d'insertion - Table : T_SUBHOP
  -- ----------------------------------------------------------
 PROCEDURE P_Ins_SUBHOP(
      IDORGANISME   IN Avidal_Livret.IDORGANISME,
      ID_T_SUBHOP   OUT Avidal_Livret.ID_T_SUBHOP,
      LIBELLE       IN Avidal_Livret.LIBELLE,
      Cod_Trt       OUT VARCHAR2) IS
      v_id_subhop NUMBER;
 BEGIN
    SELECT SEQ_ID_T_SUBHOP.NEXTVAL INTO v_id_subhop FROM dual;
    INSERT INTO T_SUBHOP(
      IDORGANISME,
      ID_T_SUBHOP,
      LIBELLE)
    VALUES (
        P_Ins_SUBHOP.IDORGANISME,
        v_id_subhop,
        P_Ins_SUBHOP.LIBELLE);
    P_Ins_SUBHOP.ID_T_SUBHOP := v_id_subhop;
    P_Ins_SUBHOP.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
    COMMIT;
 EXCEPTION
   WHEN OTHERS THEN
    P_Ins_SUBHOP.Cod_Trt := SUBSTR(SQLERRM,1,255);
    ROLLBACK;
 END P_Ins_SUBHOP;
  -- ----------------------------------------------------------
  -- Procedure d'suppression - Table : T_SUBHOP
  -- ----------------------------------------------------------
 PROCEDURE P_Del_SUBHOP(
      IDORGANISME   IN Avidal_Livret.IDORGANISME,
      ID_T_SUBHOP   IN Avidal_Livret.ID_T_SUBHOP,
      Cod_Trt       OUT VARCHAR2)  IS
 BEGIN
    DELETE FROM COMPOHOP
      WHERE IDORGANISME = P_Del_SUBHOP.IDORGANISME
        AND ID_T_SUBHOP = P_Del_SUBHOP.ID_T_SUBHOP;
    DELETE FROM T_SUBHOP
      WHERE IDORGANISME = P_Del_SUBHOP.IDORGANISME
        AND ID_T_SUBHOP = P_Del_SUBHOP.ID_T_SUBHOP;
    P_Del_SUBHOP.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
    COMMIT;
 EXCEPTION
   WHEN OTHERS THEN
    P_Del_SUBHOP.Cod_Trt := SUBSTR(SQLERRM,1,255);
    ROLLBACK;
 END P_Del_SUBHOP;
  -- ----------------------------------------------------------
  -- Procedure de Modification - Tables : T_SUBHOP
  -- ----------------------------------------------------------
 PROCEDURE P_Upd_SUBHOP(
      IDORGANISME   IN Avidal_Livret.IDORGANISME,
      ID_T_SUBHOP   IN Avidal_Livret.ID_T_SUBHOP,
      LIBELLE       IN Avidal_Livret.LIBELLE,
      Cod_Trt       OUT VARCHAR2) IS
 BEGIN
    UPDATE T_SUBHOP
    SET LIBELLE = P_Upd_SUBHOP.LIBELLE
    WHERE IDORGANISME = P_Upd_SUBHOP.IDORGANISME
      AND ID_T_SUBHOP = P_Upd_SUBHOP.ID_T_SUBHOP;
    P_Upd_SUBHOP.Cod_Trt := 'ORA-00000 : Normal, Successful completion';
    COMMIT;
 EXCEPTION
   WHEN OTHERS THEN
    P_Upd_SUBHOP.Cod_Trt := SUBSTR(SQLERRM,1,255);
    ROLLBACK;
 END P_Upd_SUBHOP;
  -- ----------------------------------------------------------
  -- Procedure de Sélection - Tables : T_SUBHOP
  -- Toutes les colonnes
  -- Retour par ref_Cursor
  -- ----------------------------------------------------------
 PROCEDURE P_Sel_SUBHOP(
      IDORGANISME  IN Avidal_Livret.IDORGANISME,
      ID_T_SUBHOP  IN Avidal_Livret.ID_T_SUBHOP,
      LIBELLE      IN Avidal_Livret.LIBELLE,
      RefSUBHOP    OUT Avidal_Livret.SUBHOPCurTyp,
      Ret			     OUT NUMBER) IS
 BEGIN
    OPEN RefSUBHOP FOR
     SELECT IDORGANISME,ID_T_SUBHOP,LIBELLE
     FROM T_SUBHOP
     WHERE IDORGANISME                   =    P_Sel_SUBHOP.IDORGANISME
     AND ID_T_SUBHOP                     =    DECODE(P_Sel_SUBHOP.ID_T_SUBHOP, 0, ID_T_SUBHOP, P_Sel_SUBHOP.ID_T_SUBHOP)
     AND UPPER(NVL(LIBELLE,'AAAAAAAA'))  LIKE UPPER(NVL(P_Sel_SUBHOP.LIBELLE,NVL(LIBELLE,'AAAAAAAA')));
   	P_Sel_SUBHOP.Ret := 1;
 EXCEPTION
		WHEN OTHERS THEN
			 P_Sel_SUBHOP.Ret := SQLCODE;
 END P_Sel_SUBHOP;

--=========================================================================
-- Fonctions nécessaires au procédures du package et à d'autres procédures
--=========================================================================
  -- -------------------------------------------------------------------------
  -- Fonction     : RMC_Get_Type
  -- Objet        : Obtenir l'identifiant type à partir de la constante de
  --                représentation
  -- --------------------------------------------------------------------------
  FUNCTION  RMC_Get_Type(Typ_Lib     IN VARCHAR2) RETURN PLS_INTEGER IS
       I PLS_INTEGER;
  BEGIN
        -------------------------------------------------------------
        --Statistiques sur la procedure - rempli la table Marqueurs
        --le 25/05/2004
        -------------------------------------------------------------
        -- Update Marqueurs SET
        --          Compteur = Compteur + 1
        --          where upper(proc_name) Like UPPER('%RMC_Get_Type%');
        -- COMMIT;

       I := Avidal_Livret.TTyp_Cst.First;
           WHILE I <= Avidal_Livret.TTyp_Cst.Last AND Avidal_Livret.TTyp_Cst(I) <> RMC_Get_Type.Typ_Lib
           LOOP
           I := I + 1;
           END LOOP;
       IF I > Avidal_Livret.TTyp_Cst.Last THEN
               RETURN 0;
           ELSE
               RETURN I;
           END IF;
-------------------------------------------------------------
  END RMC_Get_Type;
  -- --------------------------------------------------------------------------
  -- Fonction     : RMC_GetHie_Pro
  -- Objet        : Recherche par hiérarchie ou profil ascendant ou descendant
  --                en tenant compte de l'origine des Thesaurus recherchés
  -- Param In     : Thesaurus de départ
  --                Indicateur hiérarchie - Profil
  --                Type de l'information de depart
  --                Type de l'information d'arrivée
  -- Param Out    : Jeu d'enregistrement
  --                Code retour
  -- Historique
  -- Creation     : 20/12/2000
  -- Auteur       : AgdF (from Data to Information)
  -- --------------------------------------------------------------------------
  FUNCTION RMC_GetHie_Pro ( The_Ide     IN    Rmc_The_Pubres.THE_IDE,
                            Ind_H_P     IN    VARCHAR2,
                            Type_From   IN    Rmc_The_Pubres.Type_Ide,
                            Type_To     IN    Rmc_The_Pubres.Type_Ide,
                            Hop         IN    NUMBER,
                            RefThe      OUT   Avidal_Livret.RMC_THEHopCurTyp)
                          RETURN NUMBER IS
  BEGIN
        -------------------------------------------------------------
        --Statistiques sur la procedure - rempli la table Marqueurs
        --le 25/05/2004
        -------------------------------------------------------------
        --  Update Marqueurs SET
        --          Compteur = Compteur + 1
        --          where upper(proc_name) Like UPPER('%RMC_GetHie_Pro%');
        -- COMMIT;

       -- ----------------------------------------------------
       --
           --              A c c e s   p a r   P r o f i l
       --
       -- ----------------------------------------------------
       IF RMC_GetHie_Pro.Ind_H_P = 'P' THEN
              -- -----------------------------------------------
                  --  Acces aux parents profil, Le type est négatif
              -- -----------------------------------------------
                  IF RMC_GetHie_Pro.Type_From < 0 THEN
                     OPEN RMC_GetHie_Pro.RefTHE FOR
                     SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID, 0 IDORGANISME, 'N' FLAG
                       FROM RMC_THE a, RMC_THE_PRO b, RMC_THE c
                      WHERE a.THE_IDE      = RMC_GetHie_Pro.The_Ide
                                AND a.TYPE_IDE     = ABS(RMC_GetHie_Pro.Type_From)
                                AND b.THE_THE_IDE  = a.THE_IDE
                                AND c.THE_IDE      = b.THE_IDE
                                AND c.TYPE_IDE     = RMC_GetHie_Pro.Type_To
                                AND NOT EXISTS ( SELECT NULL
                                                 FROM  LIVRETVIDAL d , SPEPRESENTATION e
                                                 WHERE d.IDORGANISME = RMC_GetHie_Pro.hop
                                                  AND  d.ID_SPEPRESENTATION = e.ID_SPEPRESENTATION
                                                  AND  e.ID_SPECIALITE = c.ID )
                     UNION
                     SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID, d.IDORGANISME  IDORGANISME, 'A' FLAG
                       FROM RMC_THE a, RMC_THE_PRO b, RMC_THE c , LIVRETVIDAL d , SPEPRESENTATION e
                      WHERE a.THE_IDE      = RMC_GetHie_Pro.The_Ide
                                AND a.TYPE_IDE     = ABS(RMC_GetHie_Pro.Type_From)
                                AND b.THE_THE_IDE  = a.THE_IDE
                                AND c.THE_IDE      = b.THE_IDE
                                AND c.TYPE_IDE     = RMC_GetHie_Pro.Type_To
                                AND d.IDORGANISME  = RMC_GetHie_Pro.hop
                                AND d.ID_SPEPRESENTATION = e.ID_SPEPRESENTATION
                                AND e.ID_SPECIALITE = c.ID
                    ORDER BY 4;
              -- -----------------------------------------------
                  ELSIF RMC_GetHie_Pro.Type_From > 0 THEN
              -- -----------------------------------------------
                  --  Acces aux fils profil, Le type est positif
              -- -----------------------------------------------
                     OPEN RMC_GetHie_Pro.RefTHE FOR
                     SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID , 0 IDORGANISME, 'N' FLAG
                       FROM RMC_THE a, RMC_THE_PRO b, RMC_THE c
                      WHERE a.THE_IDE      = RMC_GetHie_Pro.The_Ide
                                AND a.TYPE_IDE     = ABS(RMC_GetHie_Pro.Type_From)
                                AND b.THE_IDE      = a.THE_IDE
                                AND c.THE_IDE      = b.THE_THE_IDE
                                AND c.TYPE_IDE     = RMC_GetHie_Pro.Type_To
                                AND NOT EXISTS ( SELECT NULL
                                                 FROM  LIVRETVIDAL d , SPEPRESENTATION e
                                                 WHERE d.IDORGANISME = RMC_GetHie_Pro.hop
                                                  AND  d.ID_SPEPRESENTATION = e.ID_SPEPRESENTATION
                                                  AND  e.ID_SPECIALITE = c.ID )
                     UNION
                     SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID , d.IDORGANISME IDORGANISME, 'A' FLAG
                       FROM RMC_THE a, RMC_THE_PRO b, RMC_THE c , LIVRETVIDAL d , SPEPRESENTATION e
                      WHERE a.THE_IDE      = RMC_GetHie_Pro.The_Ide
                                AND a.TYPE_IDE     = ABS(RMC_GetHie_Pro.Type_From)
                                AND b.THE_IDE      = a.THE_IDE
                                AND c.THE_IDE      = b.THE_THE_IDE
                                AND c.TYPE_IDE     = RMC_GetHie_Pro.Type_To
                                AND d.IDORGANISME  = RMC_GetHie_Pro.hop
                                AND d.ID_SPEPRESENTATION = e.ID_SPEPRESENTATION
                                AND e.ID_SPECIALITE = c.ID
                     ORDER BY 4;
                  ELSE
              -- -----------------------------------------------
                  --  Selection Vide
              -- -----------------------------------------------
                     OPEN RMC_GetHie_Pro.RefTHE FOR
                     SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID, 0 IDORGANISME, 'N' FLAG
                       FROM RMC_THE c
                          WHERE 1 = 2;
                  END IF;
              -- -----------------------------------------------
       -- ----------------------------------------------------
           --
           --        A c c e s   p a r    H i e r a r c h i e
           --
       -- ----------------------------------------------------
       ELSE
              -- -----------------------------------------------
                  --  Acces aux parents hiérarchiques, Le type est négatif
              -- -----------------------------------------------
                  IF RMC_GetHie_Pro.Type_From < 0 THEN
                     OPEN RMC_GetHie_Pro.RefTHE FOR
                     SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID, 0 IDORGANISME, 'N' FLAG
                       FROM RMC_THE a, RMC_THE_HIE b, RMC_THE c
                      WHERE a.THE_IDE  = RMC_GetHie_Pro.The_Ide
                                AND a.TYPE_IDE = ABS(RMC_GetHie_Pro.Type_From)
                                AND b.THE_THE_IDE  = a.THE_IDE
                                AND c.THE_IDE      = b.THE_IDE
                                AND c.TYPE_IDE = RMC_GetHie_Pro.Type_To
                                AND NOT EXISTS ( SELECT NULL
                                                 FROM  LIVRETVIDAL d , SPEPRESENTATION e
                                                 WHERE d.IDORGANISME = RMC_GetHie_Pro.hop
                                                  AND  d.ID_SPEPRESENTATION = e.ID_SPEPRESENTATION
                                                  AND  e.ID_SPECIALITE = c.ID )
                     UNION
                     SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID, d.IDORGANISME IDORGANISME, 'A' FLAG
                     FROM RMC_THE a, RMC_THE_HIE b, RMC_THE c , LIVRETVIDAL d , SPEPRESENTATION e
                     WHERE a.THE_IDE  = RMC_GetHie_Pro.The_Ide
                                AND a.TYPE_IDE = ABS(RMC_GetHie_Pro.Type_From)
                                AND b.THE_THE_IDE  = a.THE_IDE
                                AND c.THE_IDE      = b.THE_IDE
                                AND c.TYPE_IDE = RMC_GetHie_Pro.Type_To
                                AND d.IDORGANISME = RMC_GetHie_Pro.hop
                                AND d.ID_SPEPRESENTATION = e.ID_SPEPRESENTATION
                                AND e.ID_SPECIALITE = c.ID
                    ORDER BY 4;
              -- -----------------------------------------------
                  ELSIF RMC_GetHie_Pro.Type_From > 0 THEN
              -- -----------------------------------------------
                  --  Acces aux fils hierarchique, Le type est positif
              -- -----------------------------------------------
                     OPEN RMC_GetHie_Pro.RefTHE FOR
                     SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID, 0 IDORAGNISME, 'N' FLAG
                       FROM RMC_THE a, RMC_THE_HIE b, RMC_THE c
                      WHERE a.THE_IDE      = RMC_GetHie_Pro.The_Ide
                                AND a.TYPE_IDE     = ABS(RMC_GetHie_Pro.Type_From)
                                AND b.THE_IDE      = a.THE_IDE
                                AND c.THE_IDE      = b.THE_THE_IDE
                                AND c.TYPE_IDE     = RMC_GetHie_Pro.Type_To
                                AND NOT EXISTS ( SELECT NULL
                                                 FROM  LIVRETVIDAL d , SPEPRESENTATION e
                                                 WHERE d.IDORGANISME = RMC_GetHie_Pro.hop
                                                  AND  d.ID_SPEPRESENTATION = e.ID_SPEPRESENTATION
                                                  AND  e.ID_SPECIALITE = c.ID )
                     UNION
                     SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID, d.IDORGANISME IDORAGNISME, 'A' FLAG
                       FROM RMC_THE a, RMC_THE_HIE b, RMC_THE c , LIVRETVIDAL d , SPEPRESENTATION e
                      WHERE a.THE_IDE      = RMC_GetHie_Pro.The_Ide
                                AND a.TYPE_IDE     = ABS(RMC_GetHie_Pro.Type_From)
                                AND b.THE_IDE      = a.THE_IDE
                                AND c.THE_IDE      = b.THE_THE_IDE
                                AND c.TYPE_IDE     = RMC_GetHie_Pro.Type_To
                                AND d.IDORGANISME  = RMC_GetHie_Pro.hop
                                AND d.ID_SPEPRESENTATION = e.ID_SPEPRESENTATION
                                AND e.ID_SPECIALITE = c.ID
                    ORDER BY 4;
                  ELSE
              -- -----------------------------------------------
                  --  Selection Vide
              -- -----------------------------------------------
                     OPEN RMC_GetHie_Pro.RefTHE FOR
                     SELECT c.THE_IDE, c.TYPE_IDE, c.THE_CAF, c.THE_LAF, c.ID, 0 IDORAGNISME, 'N' FLAG
                       FROM RMC_THE c
                          WHERE 1 = 2;
                  END IF;
              -- -----------------------------------------------
           END IF;
       RETURN (1);
  EXCEPTION
       WHEN OTHERS THEN
           RETURN (SQLCODE);
  END RMC_GetHie_Pro;

   --/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--  Nouvelles Entrées
  --/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  -- ---------------------------------------------------------------
  -- Fonction de sélection  : RMC_GetFromKeyWordLivret_txt
  -- Toutes les colonnes
  -- Retour par ref_Cursor
  -- Modification #1 : Effectue une recherche dans la table des mots clés
  --   sur le début des Mots clés extraits de la string de recherche.
  --   Permet d'atteindre un élément de type quelconque de thesaurus.
  --   Dans le cas d'une spécialité : recherche dans le Livret de
  --   l'organisme (Id_hop) concerné et/ou dans RMC_THE selon la demande (Recherche).
  -- --------------------------------------------------------------

       PROCEDURE RMC_GetFromKeyWordLivret_txt ( ORI_IDE     IN    Rmc_Cle_Pubres.ORI_IDE  DEFAULT NULL,
                                            TYPE_IDE    IN    Rmc_Cle_Pubres.TYPE_IDE DEFAULT 2,
                                            CLE_LIB     IN    Rmc_Cle_Pubres.CLE_LIB  DEFAULT '%',
                                            Recherche   IN    VARCHAR2,
                                            Id_hop      IN    Avidal_Livret.IDORGANISME,
                                            RefLnkTHE   OUT   Avidal_Livret.RMC_THECurtyp,
                                            Ret         OUT   NUMBER)
       IS
       BEGIN
           Ret := Avidal_Livret.RMC_GetFromKeyWordLivret_txt ( RMC_GetFromKeyWordLivret_txt.Ori_Ide,
                                                           RMC_GetFromKeyWordLivret_txt.Type_Ide,
                                                           RMC_GetFromKeyWordLivret_txt.Cle_Lib,
                                                           RMC_GetFromKeyWordLivret_txt.Recherche,
                                                           RMC_GetFromKeyWordLivret_txt.Id_hop,
                                                           RMC_GetFromKeyWordLivret_txt.RefLnkThe);
           END RMC_GetFromKeyWordLivret_txt;
       FUNCTION RMC_GetFromKeyWordLivret_txt( ORI_IDE      IN    Rmc_Cle_Pubres.ORI_IDE  DEFAULT NULL,
                                          TYPE_IDE     IN    Rmc_Cle_Pubres.TYPE_IDE DEFAULT 2,
                                          CLE_LIB      IN    Rmc_Cle_Pubres.CLE_LIB  DEFAULT '%',
                                          Recherche    IN    VARCHAR2,
                                          Id_hop       IN    Avidal_Livret.IDORGANISME,
                                          RefLnkTHE    OUT   Avidal_Livret.RMC_THECurtyp)
                                        RETURN  NUMBER
       IS
         TYPE  R_Mot  IS RECORD
              ( Cle_Mot   VARCHAR2(255),
                IFirst    PLS_INTEGER,
                ILast     PLS_INTEGER
              );
         TYPE         Tab_Mot IS TABLE OF R_Mot         INDEX BY BINARY_INTEGER;
         TYPE         Tab_Req IS TABLE OF VARCHAR2(500) INDEX BY BINARY_INTEGER;
         T_Mot        Tab_Mot;
         T_Req        Tab_Req;
         T_Res        Tab_Req;
         Mot_Cle      VARCHAR2(255);
         Chaine_Epure VARCHAR2(255);
         Boo_Mot      BOOLEAN;
         Boo_Jump     BOOLEAN;
         Requete1     VARCHAR2(10000);
         Requete2     VARCHAR2(10000);
         Requete3     VARCHAR2(10000);
         Requete      VARCHAR2(25000);
         I            PLS_INTEGER;
         Ind_Mot      PLS_INTEGER;
         Cpt          PLS_INTEGER;
       BEGIN


         -- ---------------------------------------
         -- Cette partie de traitement elimine les
         -- caracteres & | et # se trouvant à l'exterieur
         -- des mots clés
         -- ---------------------------------------
         Chaine_Epure := RTRIM(LTRIM(RMC_GetFromKeyWordLivret_txt.Cle_lib,MotEt),MotEt);
         Chaine_Epure := RTRIM(LTRIM(Chaine_Epure,MotOu),MotOu);
         Chaine_Epure := RTRIM(LTRIM(Chaine_Epure,MotSauf),MotSauf);
         Boo_Mot      := FALSE;
         Ind_Mot      := 0;
         -- ---------------------------------------
         -- Compteur de parenthese
         -- Cette partie de traitement equilibre le nombre de
         -- parenthese droite et gauche
         -- ---------------------------------------
         Cpt          := 0;
         FOR I IN 1..LENGTH(Chaine_Epure)
         LOOP
           IF SUBSTR(Chaine_Epure,I,1) = '(' THEN
             Cpt := Cpt + 1;
           END IF;
           IF SUBSTR(Chaine_Epure,I,1) = ')' THEN
             Cpt := Cpt - 1;
           END IF;
         END LOOP;
         IF Cpt > 0 THEN
           Chaine_Epure := RPAD(Chaine_Epure,LENGTH(Chaine_Epure) + Cpt, ')');
         ELSIF Cpt < 0 THEN
           Chaine_Epure := LPAD(Chaine_Epure,LENGTH(Chaine_Epure) + ABS(Cpt), '(');
         END IF;
         -- ---------------------------------------
         -- Lecture lettre par lettre
         --  Constitution du tableau des mots
         -- ---------------------------------------
         FOR I IN 1..LENGTH(Chaine_Epure)
         LOOP
           Boo_Jump := FALSE;
           IF SUBSTR(Chaine_Epure,I,1) IN (MotEt, MotOu, MotSauf, MotParOpen, MotParClose) THEN
             Boo_Jump := TRUE;
             IF Boo_Mot THEN
               T_Mot(Ind_Mot).Ilast  := I-1;
               Boo_Mot := FALSE;
             END IF;
           END IF;
           IF NOT Boo_Mot AND SUBSTR(Chaine_Epure,I,1) = ' ' THEN
             Boo_Jump := TRUE;
           END IF;
           IF NOT Boo_Jump THEN
             IF NOT Boo_Mot THEN
               Ind_Mot                := Ind_Mot + 1;
               T_Mot(Ind_Mot).Cle_Mot := SUBSTR(Chaine_Epure,I,1);
               T_Mot(Ind_Mot).IFirst  := I;
               Boo_Mot                := TRUE;
             ELSE
               T_Mot(Ind_Mot).Cle_Mot := T_Mot(Ind_Mot).Cle_Mot||SUBSTR(Chaine_Epure,I,1);
             END IF;
           END IF;
         END LOOP;
         IF Boo_Mot THEN
           T_Mot(Ind_Mot).Ilast  := LENGTH(Chaine_Epure);
         END IF;
         -- ---------------------------------------------------------
         -- Constitution des requetes.
         -- Tableau de requete pour chaque mot clé trouvé
         -- ---------------------------------------------------------

         FOR I IN T_Mot.First..T_Mot.Last
         LOOP
           -- Suppression des BLancs
--           Mot_Cle := Upper(Ltrim(Rtrim(T_Mot(I).Cle_Mot)));
             Mot_Cle := LTRIM(RTRIM(T_Mot(I).Cle_Mot));
           -- Requete dans le tableau
		   T_Req(I) :=    'Select Distinct a.The_ide, a.Type_ide, a.the_Caf, a.the_laf, a.id From Rmc_The a, Rmc_The_Cle b, Rmc_Cle c '
                  || ' Where UPPER(TRANSLATE(c.CLE_LIB, ''' || Avidal_RMC.ch1 || ''', ''' || Avidal_RMC.ch2 || '''))'
					        || ' Like upper(translate(Nvl('''||Mot_Cle||''',''%'')||''%'''
                  || ',''' || Avidal_RMC.ch1 || ''', ''' || Avidal_RMC.ch2 || '''))'
                  || ' And c.TYPE_IDE = Nvl('||RMC_GetFromKeyWordLivret_txt.TYPE_IDE||',c.TYPE_IDE) '
                  || ' And b.cle_ide = c.cle_ide '
					        || ' And b.the_ide = a.The_ide '
        				  || ' And a.type_ide = c.type_ide ';

       T_Res(I) := 'Select Distinct L.ID_SPEPRESENTATIONHOP THE_IDE, 2 TYPE_IDE, '''' THE_CAF, S.NOM THE_LAF, '
                      ||'L.ID_SPEPRESENTATIONHOP ID, '||RMC_GetFromKeyWordLivret_txt.Id_hop||' IDORGANISME, ''C'' FLAG From '
                      || 'SPEPRESENTATIONHOP S, LIVRETHOP L '
                      ||'Where UPPER(translate(S.NOM, ''' || Avidal_Livret.ch1 || ''', '''
                      || Avidal_Livret.ch2 || ''')) Like upper(translate(Nvl('''||Mot_Cle||''',''%'')||''%'''
                      || ',''' || Avidal_Livret.ch1 || ''', ''' || Avidal_Livret.ch2 || '''))'
                      || ' And L.ID_SPEPRESENTATIONHOP = S.ID_SPEPRESENTATIONHOP'
                      || ' And L.IDORGANISME           = S.IDORGANISME'
                      || ' And L.IDORGANISME           = '||RMC_GetFromKeyWordLivret_txt.Id_hop ;

   		   -- T_Req(I) :=    'Select Distinct c.Cle_ide From Rmc_Cle c '
           --                || 'Where c.CLE_LIB Like upper(translate(Nvl('''||Mot_Cle||''',''%'')||''%'''
           --                || ',''' || AVIDAL_LIVRET.ch1 || ''', ''' || AVIDAL_LIVRET.ch2 || '''))'
           --                || ' And c.TYPE_IDE = Nvl('||RMC_GetFromKeyWordLivret_txt.TYPE_IDE||',c.TYPE_IDE) ';
         --                ||  ' And c.ORI_IDE = Nvl('||RMC_GetFromKeyWordLivret_txt.ORI_IDE||',c.ORI_IDE) '
         END LOOP;
         -- ---------------------------------------------
         -- Constitution requete  MR 19/03/2001
         -- ---------------------------------------------
         IF ( RMC_GetFromKeyWordLivret_txt.TYPE_IDE = 2 ) THEN
           -- cas du C
           --Requete1 := 'Select /*+ ORDERED */ Distinct L.ID_SPEPRESENTATIONHOP THE_IDE, 2 TYPE_IDE, '''' THE_CAF, S.NOM THE_LAF, '
           --            ||'L.ID_SPEPRESENTATIONHOP ID, '||RMC_GetFromKeyWordLivret_txt.Id_hop||' IDORGANISME, ''C'' FLAG From ';
        --  Requete1 := 'Select Distinct L.ID_SPEPRESENTATIONHOP THE_IDE, 2 TYPE_IDE, '''' THE_CAF, S.NOM THE_LAF, '
                 --    ||'L.ID_SPEPRESENTATIONHOP ID, '||RMC_GetFromKeyWordLivret_txt.Id_hop||' IDORGANISME, ''C'' FLAG From ';
           Requete1 := ' ';
           -- cas du N et du A
           --Requete2 := 'Select /*+ ORDERED */ --Distinct t.The_Ide THE_IDE, 2 TYPE_IDE, t.The_Caf THE_CAF, t.The_Laf THE_LAF, '
           --            ||'t.id ID, 0 IDORGANISME, ''N'' FLAG From (';
           Requete2 := 'Select Distinct t.The_Ide THE_IDE, 2 TYPE_IDE, t.The_Caf THE_CAF, t.The_Laf THE_LAF, '
                       ||'t.id ID, 0 IDORGANISME, ''N'' FLAG From (';
           -- cas du A
           --Requete3 := 'Select /*+ ORDERED */ Distinct t.The_Ide THE_IDE, 2 THE_IDE, t.The_Caf THE_CAF, t.The_Laf THE_LAF, '
           --            ||'t.id ID, ' ||RMC_GetFromKeyWordLivret_txt.Id_hop||' IDORGANISME, ''A'' FLAG From (';
           Requete3 := 'Select Distinct t.The_Ide THE_IDE, 2 TYPE_IDE, t.The_Caf THE_CAF, t.The_Laf THE_LAF, '
                       ||'t.id ID, ' ||RMC_GetFromKeyWordLivret_txt.Id_hop||' IDORGANISME, ''A'' FLAG From (';

           FOR I IN T_Mot.First..T_Mot.Last
           LOOP
             -- ---------------------
             -- Cas premier Mot
             -- ---------------------
             IF I = T_Mot.First AND T_Mot(I).Ifirst <> 1 THEN
               Requete1 := Requete1 || ' ' || SUBSTR(Chaine_Epure,1,T_Mot(I).Ifirst-1);
               Requete2 := Requete2 || ' ' || SUBSTR(Chaine_Epure,1,T_Mot(I).Ifirst-1);
               Requete3 := Requete3 || ' ' || SUBSTR(Chaine_Epure,1,T_Mot(I).Ifirst-1);
             END IF;
             -- ---------------------------------------
             -- Inserton requete dans chaine generale
             -- --------------------------------------
             Requete2 := Requete2 || ' ' ||T_Req(I);
             Requete3 := Requete3 || ' ' ||T_Req(I);
             Requete1 := Requete1 || ' ' ||T_Res(I);
             -- ---------------------
             -- Inter mots
             -- ---------------------
             IF I <> T_Mot.Last  THEN
               Mot_Cle := SUBSTR(Chaine_Epure,T_Mot(I).Ilast+1, T_Mot(I+1).Ifirst-T_Mot(I).Ilast-1);
               Requete1 := Requete1 || REPLACE(REPLACE(REPLACE(Mot_Cle,MotEt,' Intersect '), MotOu,' Union '), Motsauf,' Minus ');
               Requete2 := Requete2 || REPLACE(REPLACE(REPLACE(Mot_Cle,MotEt,' Intersect '), MotOu,' Union '), Motsauf,' Minus ');
               Requete3 := Requete3 || REPLACE(REPLACE(REPLACE(Mot_Cle,MotEt,' Intersect '), MotOu,' Union '), Motsauf,' Minus ');
             END IF;
             -- ----------------------------------------
             -- Cas dernier mot
             -- ----------------------------------------
             IF I = T_Mot.Last AND T_Mot(I).Ilast <> LENGTH(Chaine_Epure) THEN
               Requete1 := Requete1 || SUBSTR(Chaine_Epure,T_Mot(I).Ilast+1);
               Requete2 := Requete2 || SUBSTR(Chaine_Epure,T_Mot(I).Ilast+1);
               Requete3 := Requete3 || SUBSTR(Chaine_Epure,T_Mot(I).Ilast+1);
             END IF;
           END LOOP;
           -- --------------------------------------------------
           --  Construction de la fin de la requete
           -- --------------------------------------------------
           -- cas du C
         /*   Requete1 := Requete1 ||'SPEPRESENTATIONHOP S, LIVRETHOP L '
                                ||'Where UPPER(translate(S.NOM, ''' || Avidal_Livret.ch1 || ''', '''
                                || Avidal_Livret.ch2 || ''')) Like upper(translate(Nvl('''||Mot_Cle||''',''%'')||''%'''
                                || ',''' || Avidal_Livret.ch1 || ''', ''' || Avidal_Livret.ch2 || '''))'
                                || ' And L.ID_SPEPRESENTATIONHOP = S.ID_SPEPRESENTATIONHOP'
                                || ' And L.IDORGANISME           = S.IDORGANISME'
                                || ' And L.IDORGANISME           = '||RMC_GetFromKeyWordLivret_txt.Id_hop;
*/
          -- cas du N
		  Requete2 := Requete2 ||') t '
                                ||'Where NOT EXISTS ( Select Null From LIVRETVIDAL L , SPEPRESENTATION S '
                                ||'Where L.IDORGANISME = '||RMC_GetFromKeyWordLivret_txt.Id_hop
                                ||' And L.ID_SPEPRESENTATION = S.ID_SPEPRESENTATION AND S.ID_SPECIALITE = T.ID )';
           --Requete2 := Requete2 ||') T, LIVRETVIDAL L , SPECIALITE S, SPEPRESENTATION P '
           --                     ||'Where T.ID = S.ID_SPECIALITE AND S.ID_SPECIALITE = P.ID_SPECIALITE '
           --                     ||'AND P.ID_SPEPRESENTATION = L.ID_SPEPRESENTATION(+) And L.IDORGANISME(+) = '||RMC_GetFromKeyWordLivret_txt.Id_hop;
           --Requete2 := Requete2 ||') x, RMC_THE_CLE c, RMC_THE T '
           --                     ||'Where c.CLE_IDE = x.CLE_IDE And t.THE_IDE = c.THE_IDE And T.TYPE_IDE = 2 '
           --                     ||'And NOT EXISTS ( Select Null From LIVRETVIDAL L , SPEPRESENTATION S '
           --                     ||'Where L.IDORGANISME = '||RMC_GetFromKeyWordLivret_txt.Id_hop
           --                     ||' And L.ID_SPEPRESENTATION = S.ID_SPEPRESENTATION AND S.ID_SPECIALITE = T.ID )';
           -- cas du A
         Requete3 := Requete3 ||') T, LIVRETVIDAL L , SPECIALITE S, SPEPRESENTATION P '
                                ||'Where T.ID = S.ID_SPECIALITE AND S.ID_SPECIALITE = P.ID_SPECIALITE '
                                ||'AND P.ID_SPEPRESENTATION = L.ID_SPEPRESENTATION And L.IDORGANISME = '||RMC_GetFromKeyWordLivret_txt.Id_hop;
           --Requete3 := Requete3 ||') x, RMC_THE_CLE c, RMC_THE T, LIVRETVIDAL L , SPECIALITE S, SPEPRESENTATION P '
           --                     ||'Where c.CLE_IDE = x.CLE_IDE And t.THE_IDE = c.THE_IDE And T.TYPE_IDE = 2 '
           --                     ||'And T.ID = S.ID_SPECIALITE AND S.ID_SPECIALITE = P.ID_SPECIALITE '
           --                     ||'AND P.ID_SPEPRESENTATION = L.ID_SPEPRESENTATION And L.IDORGANISME = '||RMC_GetFromKeyWordLivret_txt.Id_hop;

		   IF ( Recherche = 'O' ) THEN
             --Requete := Requete1||' Union '||Requete2||' Union '||Requete3;
             Requete := Requete1||' Union All ('||Requete2|| ' Union ' ||Requete3|| ') order by 4';

           ELSE
             Requete := Requete1||' Union All '||Requete3||' order by 4';
         --    Requete := Requete3||' order by 4';
           END IF;
         ELSE
           -- autre que spécialité
           Requete := 'Select Distinct t.The_Ide THE_IDE, t.Type_ide TYPE_IDE, t.the_Caf THE_CAF, '
                    ||'t.The_Laf THE_LAF, t.id ID, 0 IDORGANISME, '''' FLAG From (';
           FOR I IN T_Mot.First..T_Mot.Last
           LOOP
             -- ---------------------
             -- Cas premier Mot
             -- ---------------------
             IF I = T_Mot.First AND T_Mot(I).Ifirst <> 1 THEN
               Requete := Requete || ' ' || SUBSTR(Chaine_Epure,1,T_Mot(I).Ifirst-1);
             END IF;
             -- ---------------------------------------
             -- Inserton requete dans chaine generale
             -- --------------------------------------
             Requete := Requete || ' ' ||T_Req(I);
             -- ---------------------
             -- Inter mots
             -- ---------------------
             IF I <> T_Mot.Last  THEN
               Mot_Cle := SUBSTR(Chaine_Epure,T_Mot(I).Ilast+1, T_Mot(I+1).Ifirst-T_Mot(I).Ilast-1);
               Requete := Requete || REPLACE(REPLACE(REPLACE(Mot_Cle,MotEt,' Intersect '), MotOu,' Union '), Motsauf,' Minus ');
             END IF;
             -- ----------------------------------------
             -- Cas dernier mot
             -- ----------------------------------------
             IF I = T_Mot.Last AND T_Mot(I).Ilast <> LENGTH(Chaine_Epure) THEN
               Requete := Requete || SUBSTR(Chaine_Epure,T_Mot(I).Ilast+1);
             END IF;
           END LOOP;
           -- --------------------------------------------------
           --  Construction de la fin de la requete
           -- --------------------------------------------------
           Requete := Requete ||') T ';
           --Requete := Requete ||') x, RMC_THE_CLE c, RMC_THE T '
           --                   ||'Where c.CLE_IDE = x.CLE_IDE And t.THE_IDE = c.THE_IDE ';

		   IF RMC_GetFromKeyWordLivret_txt.TYPE_IDE IS NOT NULL THEN
             Requete := Requete || ' Where t.TYPE_IDE = '||RMC_GetFromKeyWordLivret_txt.Type_Ide||' ';
           END IF;
		   --If RMC_GetFromKeyWordLivret_txt.TYPE_IDE is not null Then
           --  Requete := Requete || ' And t.TYPE_IDE = '||RMC_GetFromKeyWordLivret_txt.Type_Ide||' ';
           --End if;
		   IF RMC_GetFromKeyWordLivret_txt.TYPE_IDE = 8 THEN
		   	  requete := requete || ' order by 3';
		   END IF;
           -- --------------------------------------------------
           -- Cas particulier du groupe d'indication
           -- --------------------------------------------------
           IF RMC_GetFromKeyWordLivret_txt.TYPE_IDE  = 5  THEN
               Requete :=  Requete
                      || ' union '
                      || ' select  Distinct a.The_Ide THE_IDE, a.Type_ide TYPE_IDE, a.the_Caf THE_CAF, '
                      || ' a.The_Laf THE_LAF, a.id ID, 0 IDORGANISME, '''' FLAG '
                      || ' from RMC_THE a, RMC_THE_PRO b, RMC_THE c, RMC_THE_CLE d ,(select CLE_IDE from RMC_CLE  '
                                                                                     || ' Where  TYPE_IDE       = 4 '
                                                                                     || ' And  UPPER(TRANSLATE(CLE_LIB,''' || Avidal_RMC.ch1 || ''', ''' || Avidal_RMC.ch2 || '''))'
																					 || ' like upper(translate(''' || Mot_cle || '%'', '''
                                                                                     || Avidal_Livret.ch1 || ''', ''' || Avidal_Livret.ch2 || '''))) e'
                      || ' Where  a.TYPE_IDE       = 5 '
                      || ' And  b.THE_IDE        = a.THE_IDE '
                      || ' And  c.THE_IDE        = b.THE_THE_IDE '
                      || ' And  c.TYPE_IDE       = 4 '
                      || ' And  c.THE_IDE        = d.THE_IDE '
                      || ' And  d.CLE_IDE        = e.CLE_IDE '
                      || ' Order by 4' ;
           END IF;
           -- ----------------------------------------------
           -- Clause Order ... en instance
           -- ----------------------------------------------
         END IF;
--       If P_Sel_Dyn.Att_Ide is null Then
--         Requete := Requete || 'And Rownum <= '||The_Res.max_Enr ||' Order By 2';
--         INSERT INTO REQ VALUES (REQUETE);
--       Else
--         Requete := Requete || 'And Rownum <= '||The_Res.max_Enr ||' Order By 6';
--         INSERT INTO REQ VALUES (REQUETE);
--       End if;
         -- ----------------------------------------------
         -- Ouverture curseur
         -- ----------------------------------------------
         OPEN RMC_GetFromKeyWordLivret_txt.RefLnkthe FOR Requete;

-------------------------------------------------------------
--Statistiques sur la procedure - rempli la table Marqueurs
--le 25/05/2004
-------------------------------------------------------------
--         Update Marqueurs SET
--                  Compteur = Compteur + 1
--                  where upper(proc_name) Like UPPER('%RMC_GetFromKeyWordLivret_txt%');
--         COMMIT;
-------------------------------------------------------------

         RETURN 1;
         EXCEPTION
           WHEN OTHERS THEN
             RETURN SQLCODE;
       END RMC_GetFromKeyWordLivret_txt;
  -- ----------------------------------------------------------------
  -- Procedure de Sélection
  -- Toutes les colonnes
  -- Retour par ref_Cursor
  -- Modification #2 : Retourne les spécialités répertoriées dans
  --                   les Livrets (VIDAL et HOPITAL) de l'Organisme
  --                   passé en paramètre (Id_hop).
  -- ----------------------------------------------------------------
       PROCEDURE GetSpeLivret_id ( Id_hop      IN    Avidal_Livret.IDORGANISME,
                                RefLnkTHE   OUT   Specialite_Pubres.SPECIALITECurTyp2,
                                Ret         OUT   NUMBER)
       IS
       BEGIN
             Ret := Avidal_Livret.GetSpeLivret_id ( Id_hop, RefLnkTHE);
       END GetSpeLivret_id;
       FUNCTION GetSpeLivret_id ( Id_hop      IN    Avidal_Livret.IDORGANISME,
                               RefLnkTHE   OUT   Specialite_Pubres.SPECIALITECurTyp2)
                             RETURN  NUMBER
       IS
       BEGIN
         OPEN GetSpeLivret_id.RefLnkTHE FOR
           SELECT  b.ID_SPECIALITE, b.BVALID, b.BENCOURS, b.NOMUSER,
                   b.DENOMSPE, b.FORME, b.DOSAGE, b.complement,
                   b.COMMAMMPOSO, b.RESERVE, b.INFERIEURAGE,
                   b.UNITINF, b.SUPERIEURAGE, b.UNIFSUP,
                   b.INFERIEURPOIDS, b.SUPERIEURPOIDS, b.DENOMAMM,
                   b.NUMDOSAMM, b.SPECATEGORIE, b.SOURCE, b.DATESOURCE,
                   b.REMARQUES, b.DCREAT, b.DMODIF, b.DREVIS,
                   a.ID_SPEPRESENTATION, c.IDORGANISME, 'V'
           FROM    SPECIALITE b , SPEPRESENTATION a, LIVRETVIDAL c
           WHERE   c.IDORGANISME        = GetSpeLivret_id.Id_hop
             AND   c.ID_SPEPRESENTATION = a.ID_SPEPRESENTATION
             AND   a.ID_SPECIALITE      = b.ID_SPECIALITE
          UNION
           SELECT  0 Id_Specialite, '' BVALID, '' BENCOURS, ''NOMUSER,
                   b.NOM, b.FORME, b.DOSAGE, '' complement,
                   '' COMMAMMPOSO, '' RESERVE, 0 INFERIEURAGE,
                   '' UNITINF, 0 SUPERIEURAGE, '' UNIFSUP,
                   0 INFERIEURPOIDS, 0 SUPERIEURPOIDS, '' DENOMAMM,
                   '' NUMDOSAMM, '' SPECATEGORIE, '' SOURCE,
                   TO_DATE('31/12/2099','DD/MM/YYYY') DATESOURCE,
                   '' REMARQUES, TO_DATE('31/12/2099','DD/MM/YYYY') DCREAT,
                   TO_DATE('31/12/2099','DD/MM/YYYY') DMODIF,
                   TO_DATE('31/12/2099','DD/MM/YYYY') DREVIS,
                   b.ID_SPEPRESENTATIONHOP, a.IDORGANISME, 'H'
           FROM    SPEPRESENTATIONHOP b, LIVRETHOP a
           WHERE   a.ID_SPEPRESENTATIONHOP = b.ID_SPEPRESENTATIONHOP
             AND   a.IDORGANISME           = b.IDORGANISME
             AND   a.IDORGANISME           = GetSpeLivret_id.Id_hop;

-------------------------------------------------------------
--Statistiques sur la procedure - rempli la table Marqueurs
--le 25/05/2004
-------------------------------------------------------------
--         Update Marqueurs SET
--                  Compteur = Compteur + 1
--                  where upper(proc_name) Like UPPER('%GetSpeLivret_id%');
--         COMMIT;
-------------------------------------------------------------

         RETURN 1;
         EXCEPTION
           WHEN OTHERS THEN
             RETURN SQLCODE;
       END GetSpeLivret_id;
  -- -------------------------------------------------------------------
  -- Fonction   : RMC_GetSpeLivret_id
  -- Objet      : Recherche des spécifications à partir (au choix)
  --              . D'un code CIP        : recherche hiérachique pere
  --              . D'une substance      : Recherche profil pere
  --              . D'une indication     : Recherche profil fils
  --              . D'une contre indic.  : Recherche profil fils
  --              . D'une classe thera.  : Recherche profil fils
  --              . D'une classe IAM     : Recherche profil père
  --              . D'un labo            : Recherche profil père
  --             : Modification #1
  --              . D'un labo            : Recherche profil fils
  --              . D'une classe IAM     : Recherche profil fils
  -- -------------------------------------------------------------------
  -- -------------------------------------------------------------------
  PROCEDURE RMC_GetSpeLivret_id (The_Ide      IN     Rmc_The_Pubres.THE_IDE,
                            Type_Ide     IN     Rmc_The_Pubres.TYPE_IDE,
                            Hop          IN     NUMBER,
                            RefThe       OUT    Avidal_Livret.RMC_THEHopCurTyp,
                            Ret          OUT    NUMBER) IS
   BEGIN
       RMC_GetSpeLivret_id.Ret := Avidal_Livret.Rmc_GetSpeLivret_id(RMC_GetSpeLivret_id.The_Ide, RMC_GetSpeLivret_id.Type_Ide, RMC_GetSpeLivret_id.Hop, RMC_GetSpeLivret_id.RefThe);
   END RMC_GetSpeLivret_id ;

   FUNCTION RMC_GetSpeLivret_id (The_Ide      IN     Rmc_The_Pubres.THE_IDE,
                           Type_Ide     IN     Rmc_The_Pubres.TYPE_IDE,
                           Hop          IN     NUMBER,
                           RefThe       OUT    Avidal_Livret.RMC_THEHopCurTyp)
                           RETURN NUMBER IS
    BEGIN

      -------------------------------------------------------------
      --Statistiques sur la procedure - rempli la table Marqueurs
      --le 25/05/2004
      -------------------------------------------------------------
      --         Update Marqueurs SET
      --                   Compteur = Compteur + 1
      --                  where upper(proc_name) Like UPPER('%RMC_GetSpeLivret_id%');
      --         COMMIT;
      -- ---------------------------------------------
           -- Recuperation code spécialité
       -- ---------------------------------------------
       Type_To := RMC_Get_Type('SPE');
       -- ---------------------------------------------
           -- Test des types attendues
       -- ---------------------------------------------
       IF     Avidal_Livret.TTyp_Cst(ABS(RMC_GetSpeLivret_id.Type_Ide))  = 'CIP' THEN
          -- -------------------------------------------------
                  -- Recherche hiérarchique père pour les CIP
                  -- -------------------------------------------------
          RETURN(RMC_GetHie_Pro(RMC_GetSpeLivret_id.The_Ide,'H',ABS(RMC_GetSpeLivret_id.Type_Ide)*-1,Type_To, RMC_GetSpeLivret_id.Hop,
                                        RMC_GetSpeLivret_id.RefThe));
           ELSIF  Avidal_Livret.TTyp_Cst(ABS(RMC_GetSpeLivret_id.Type_Ide)) IN ('INDIC','CINDIC','THERA','LABO','IAM') THEN
          -- --------------------------------------------------------------
          -- Recherche profil Fils pour les les indications,
          -- les contre indications, les classes thera,
          -- Modifié le 13/03/2001 : MR - plus les labos et les Classes IAM
          -- --------------------------------------------------------------
          RETURN(RMC_GetHie_Pro(RMC_GetSpeLivret_id.The_Ide,'P',ABS(RMC_GetSpeLivret_id.Type_Ide),Type_To, RMC_GetSpeLivret_id.Hop,
                                        RMC_GetSpeLivret_id.RefThe));
           ELSIF  Avidal_Livret.TTyp_Cst(ABS(RMC_GetSpeLivret_id.Type_Ide)) = 'SUB' THEN
          -- -----------------------------------------------------
          -- Recherche profil père pour les substances
          -- Modifié le 13/03/2001 : MR - seulement les substances
          --                           ( retrait des LABO et IAM )
          -- -----------------------------------------------------
          RETURN(RMC_GetHie_Pro(RMC_GetSpeLivret_id.The_Ide,'P',ABS(RMC_GetSpeLivret_id.Type_Ide)*-1,Type_To, RMC_GetSpeLivret_id.Hop,
                                        RMC_GetSpeLivret_id.RefThe));
           ELSE
          -- -------------------------------------------------
                  -- Retour vide sur type non attendue
          -- -------------------------------------------------
          RETURN(RMC_GetHie_Pro(RMC_GetSpeLivret_id.The_Ide,'P',0,Type_To, RMC_GetSpeLivret_id.Hop, RMC_GetSpeLivret_id.RefThe));
           END IF;
    EXCEPTION
       WHEN NO_DATA_FOUND THEN
           -- -------------------------------------------------
                   -- Retour vide sur type non Initialisée
           -- -------------------------------------------------
           BEGIN
              RETURN(RMC_GetHie_Pro(RMC_GetSpeLivret_id.The_Ide,'P',0,Type_To, RMC_GetSpeLivret_id.Hop, RMC_GetSpeLivret_id.RefThe));
           EXCEPTION
                     WHEN OTHERS THEN
                      RETURN SQLCODE;
                   END;
           WHEN OTHERS THEN
               RETURN SQLCODE;
    END RMC_GetSpeLivret_id;

  -- -------------------------------------------------------------------------------------------------
  -- Procedure de suppression - Table : LIVRETVIDAL/LIVRETHOP/LIVRETVIDALTEMP/LIVRETHOPTEMP
  -- -------------------------------------------------------------------------------------------------
 PROCEDURE P_Delete_Tables_Livret(
      IDORGANISME   IN NUMBER,
      Cod_Trt       OUT VARCHAR2)  IS
 BEGIN
  If IDORGANISME is not null THEN
      DELETE FROM LIVRETVIDAL
        WHERE IDORGANISME = P_Delete_Tables_Livret.IDORGANISME;
      DELETE FROM LIVRETVIDALTEMP
        WHERE IDORGANISME = P_Delete_Tables_Livret.IDORGANISME;
      DELETE FROM LIVRETHOP
        WHERE IDORGANISME = P_Delete_Tables_Livret.IDORGANISME;
      DELETE FROM LIVRETHOPTEMP
        WHERE IDORGANISME = P_Delete_Tables_Livret.IDORGANISME;
      DELETE FROM COMPOHOP
        WHERE IDORGANISME = P_Delete_Tables_Livret.IDORGANISME;
      DELETE FROM COMPOHOPTEMP
        WHERE IDORGANISME = P_Delete_Tables_Livret.IDORGANISME;
      DELETE FROM T_SUBHOP
        WHERE IDORGANISME = P_Delete_Tables_Livret.IDORGANISME;
      DELETE FROM T_SUBHOPTEMP
        WHERE IDORGANISME = P_Delete_Tables_Livret.IDORGANISME;
      DELETE FROM SPEPRESENTATIONHOP
        WHERE IDORGANISME = P_Delete_Tables_Livret.IDORGANISME;
      DELETE FROM SPEPRESENTATIONHOPTEMP
        WHERE IDORGANISME = P_Delete_Tables_Livret.IDORGANISME;
      DELETE FROM COMPOVIDAL
        WHERE IDORGANISME = P_Delete_Tables_Livret.IDORGANISME;
      DELETE FROM COMPOVIDALTEMP
        WHERE IDORGANISME = P_Delete_Tables_Livret.IDORGANISME;

  ELSE
      DELETE FROM LIVRETVIDAL;
      DELETE FROM LIVRETVIDALTEMP;
      DELETE FROM LIVRETHOP;
      DELETE FROM LIVRETHOPTEMP;
      DELETE FROM T_SUBHOP;
      DELETE FROM T_SUBHOPTEMP;
      DELETE FROM COMPOHOP;
      DELETE FROM COMPOHOPTEMP;
      DELETE FROM SPEPRESENTATIONHOP;
      DELETE FROM SPEPRESENTATIONHOPTEMP;
      DELETE FROM COMPOVIDAL;
      DELETE FROM COMPOVIDALTEMP;


  END IF;

    P_Delete_Tables_Livret.Cod_Trt := 'ORA-00000 : Normal, Successful completion';

 COMMIT;

 EXCEPTION
   WHEN OTHERS THEN
    P_Delete_Tables_Livret.Cod_Trt := SUBSTR(SQLERRM,1,255);
    ROLLBACK;
 END P_Delete_Tables_Livret;
--==================================================================
--    FIN DE PACKAGE
--==================================================================
BEGIN
      -- ----------------------------------------------------------
          -- Initailisation du Package
      -- ----------------------------------------------------------
          Avidal_Livret.TTyp_Cst.DELETE;
          Avidal_Livret.TTyp_Cst(1)  := 'CIP';     -- Valeur 1  CIP
          Avidal_Livret.TTyp_Cst(2)  := 'SPE';     -- Valeur 2  Spécialité
          Avidal_Livret.TTyp_Cst(3)  := 'SUB';     -- Valeur 3  Substance
          Avidal_Livret.TTyp_Cst(4)  := 'INDIC';   -- Valeur 4  Indications
          Avidal_Livret.TTyp_Cst(5)  := 'GINDIC';  -- Valeur 5  Groupe d'indication, situation de prescription
          Avidal_Livret.TTyp_Cst(6)  := 'CINDIC';  -- Valeur 6  Contre indication
          Avidal_Livret.TTyp_Cst(7)  := 'THERA';   -- Valeur 7  Classe therapeutique
          Avidal_Livret.TTyp_Cst(8)  := 'CIM';     -- Valeur 8  CIM10
          Avidal_Livret.TTyp_Cst(9) := 'LABO';     -- Valeur 9 laboratoire
	        Avidal_Livret.TTyp_Cst(10)  := 'IAM';    -- Valeur 10  Classe d'interaction
          Avidal_Livret.TTyp_Cst(11) := 'DIAG';    -- Valeur 11 Dignostic
END Avidal_Livret;
/