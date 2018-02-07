insert into Documents (id_document, Nom_Fichier, id_Type, html, valide)
select 68555 As id_document, 'FI86417' As Nom_fichier, 1 As id_type,
dbms_lob.substr(html, 4000,1) As html, '1' As valide
from DVP_loader where id_document = 68555;
drop table DVP_loader;