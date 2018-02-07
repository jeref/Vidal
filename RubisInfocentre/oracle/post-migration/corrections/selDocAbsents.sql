-- **
-- selDocAbsents.sql
-- requête permettant de savoir quelle mono manque :
-- 1 : à executer sur Oracle (donne l'id_Document manquant)
-- 'requete 1 donne une erreur sur Sqlserveur : normal' As Warning
select p.* from presentation_documents p, documents d
where d.id_Document(+) = p.id_Document And d.id_Document is Null;
GO
-- 2 : à executer sur RubisExtraction (donne le nom_fichier à récupérer)
-- FI79111 : document mal transféré exemple :
-- select id_document, nom_fichier, id_type, date_maj 
-- from Documents where id_document=45589;