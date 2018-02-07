insert into Documents (id_document, Nom_Fichier, id_Type, html, valide)
select 45583 As id_document, 'FI78653' As Nom_fichier, 1 As id_type, dbms_lob.substr(html, 4000,1) As html, '1' As valide
from DVP_loader where id_document = 45583;
insert into Documents (id_document, Nom_Fichier, id_Type, html, valide)
select 38080 As id_document, 'VIDV4236' As Nom_fichier, 1 As id_type, dbms_lob.substr(html, 4000,1) As html, '1' As valide
from DVP_loader where id_document = 38080;
insert into Documents (id_document, Nom_Fichier, id_Type, html, valide)
select 46497 As id_document, 'FI73760' As Nom_fichier, 1 As id_type, dbms_lob.substr(html, 4000,1) As html, '1' As valide
from DVP_loader where id_document = 46497;
drop table DVP_loader;