--Creer par Thibaut Branlant L3 Informatique ULCO Calais
CREATE TABLE Habitant_Calais
AS SELECT NUMERO,NOM,PRENOM,ADRESSE
FROM EMPLOYE
WHERE ADRESSE LIKE '%Calais%' ;

CREATE TABLE HYPERMARCHE_RAYON(nomHyper, nomRayon, chiffreAffaire)
AS SELECT H.nom, R.nom, R.chiffreAffaire FROM RAYON R
INNER JOIN HYPERMARCHE H on H.numero = R.numeroHyper;


