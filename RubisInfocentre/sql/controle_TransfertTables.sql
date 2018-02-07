-- **
print 'controle_TransfertTables.sql'
-- V1.2 JFO 04/04/2008
-- controle que l'import lors de la prod RubisInfoCentre s'est bien passé.
use RubisInfoCentreProduit;
--
select '#Erreur d''import GroupIndic : count = ' + cast(count(*) As VarChar) As 'Warning :' FROM RubisExtraction..INFOIRIS_GroupIndic
having count(*) != (select count(*) from dbo.GroupIndic);
select '#Erreur d''import GroupIndicIndic_Rel : count = ' + cast(count(*) As VarChar) As 'Warning :' FROM RubisExtraction..INFOIRIS_GroupIndicIndic_Rel
having count(*) != (select count(*) FROM dbo.GroupIndicIndic_Rel);
SELECT '#Erreur d''import HierarchieCI_Rel : count = ' + cast(count(*) As VarChar) As 'Warning :' FROM RubisExtraction..INFOIRIS_HierarchieCI_Rel
having count(*) != (select count(*) FROM dbo.HierarchieCI_Rel);
--
select '#Erreur d''import IAMCouple : count = ' + cast(count(*) As VarChar) As 'Warning :' FROM RubisExtraction..INFOIRIS_IAMCouple
having count(*) != (select count(*) FROM IAMCouple);
select '#Erreur d''import IAMClass : count = ' + cast(count(*) As VarChar)  As 'Warning :'  FROM [RubisInfoCentreProduit]..IAMClass 
having count(*) != (select count(*) FROM RubisExtraction..INFOIRIS_IAMClass);
select '#Erreur d''import IAMClasse_IAMCouple : count = ' + cast(count(*) As VarChar)  As 'Warning :'  FROM RubisExtraction..INFOIRIS_IAMClasse_IAMCouple 
having count(*) != (select count(*) FROM IAMClasse_IAMCouple);
--
select classe 'Classe RUBIS', left(classe, 65) 'Warning : Classe tronquée !' 
from RubisExtraction..INFOIRIS_IAMClass where len(classe) > 65;
--
select substring(IAMClass.classe, 1,65) As classe_inseree, IAMClass.*
from RubisExtraction..Specialite_IAMClass As Specialite_IAMClass, 
RubisExtraction..INFOIRIS_IAMClass As IAMClass, 
RubisExtraction..Specialite As Specialite where
Specialite_IAMClass.id_IAMClasse = IAMClass.id_IAMClasse
And Specialite.id_Specialite = Specialite_IAMClass.id_Specialite
And len(classe) > 65 
order by Specialite_IAMClass.id_Specialite;
-- id_IAMClasse en erreur : 917