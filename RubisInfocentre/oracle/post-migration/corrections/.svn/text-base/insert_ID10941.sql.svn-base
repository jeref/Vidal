insert into Documents (id_document, Nom_Fichier, id_Type, html, valide) 
select 45918 As id_document, 'ID10941' As Nom_fichier, 1 As id_type, dbms_lob.substr(html, 4000,1) As html, '1' As valide 
from DVP_loader where id_document = 45918; 
