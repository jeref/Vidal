-- Renseignement des renscomp avec [HOP] lorsque le lieu Distrib

UPDATE SpePresentation 
SET Condi = RTRIM(Condi) + ' [HOP]'
FROM SpePresentation

WHERE bHop=1
