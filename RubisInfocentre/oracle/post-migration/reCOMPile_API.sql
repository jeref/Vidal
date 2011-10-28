reCOMPile API.sql
-- pour recompiler les API (requete a executer en boucle jusqu'a ce que tous les packages soient compiles).
set heading off;
spool compile.sql;
select 'ALTER package ' || object_name || ' compile package;' from user_objects where status ='INVALID';
spool off;
@compile.sql;
set heading on;
