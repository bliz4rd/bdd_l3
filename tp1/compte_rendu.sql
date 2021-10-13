--Creer par Thibaut Branlant L3 Informatique ULCO Calais
--1)
SELECT descriptif FROM RAYON WHERE chiffreaffaire > 1000000;
vêtement
--2)
SELECT nom FROM HYPERMARCHE WHERE ville LIKE 'Calais';
MDO-SPORT
DealerPrice
--3)
SELECT nom FROM HYPERMARCHE WHERE codepostal LIKE '62%';

--4)
SELECT employe.nom, employe.prenom FROM employe INNER JOIN RAYON ON rayon.numeroresponsable = employe.num_emp WHERE chiffreaffaire > 1000000;

--5)
SELECT employe.nom, employe.prenom FROM employe INNER JOIN RAYON ON rayon.numeroresponsable = employe.num_emp 
INNER JOIN HYPERMARCHE ON HYPERMARCHE.num_hyper = RAYON.numerohyper WHERE chiffreaffaire < 5000000 AND HYPERMARCHE.nom LIKE 'Marrefour Coquelles';

--6)
SELECT employe.nom FROM employe INNER JOIN hypermarche ON employe.num_emp = hypermarche.numerodirecteur
INNER JOIN rayon ON hypermarche.num_hyper = rayon.numerohyper WHERE hypermarche.ville LIKE 'Calais' AND rayon.chiffreaffaire < 500000 
AND rayon.numeroresponsable IN (SELECT num_emp FROM employe WHERE employe.nom LIKE 'Stevenson' AND employe.prenom LIKE 'Max');

--7)
SELECT num FROM HYPERMARCHE WHERE num_hyper IN (SELECT numerohyper FROM RAYON WHERE chiffreaffaire IN (SELECT MAX(chiffreaffaire) FROM RAYON));

SELECT HYPERMARCHE.nom FROM HYPERMARCHE INNER JOIN RAYON ON HYPERMARCHE.num_hyper = RAYON.numerohyper WHERE RAYON.chiffreaffaire IN (SELECT MAX(chiffreaffaire) FROM RAYON);

--8)
SELECT employe.nom FROM employe INNER JOIN RAYON ON employe.num_emp = RAYON.numeroresponsable
 INNER JOIN HYPERMARCHE ON RAYON.numerohyper = HYPERMARCHE.num_hyper WHERE RAYON.chiffreaffaire 
 IN (SELECT MAX(chiffreaffaire) FROM RAYON INNER JOIN HYPERMARCHE ON RAYON.numerohyper = HYPERMARCHE.num_hyper WHERE HYPERMARCHE.nom LIKE 'Marrefour Coquelles' );

SELECT employe.nom FROM employe WHERE num_emp IN (SELECT numeroresponsable FROM rayon WHERE chiffreaffaire IN (SELECT MAX(chiffreaffaire) FROM rayon 
WHERE numerohyper IN (SELECT num_hyper FROM hypermarche WHERE hypermarche.nom LIKE 'Marrefour Coquelles')) 
AND numerohyper IN (SELECT num_hyper FROM hypermarche WHERE hypermarche.nom LIKE 'Marrefour Coquelles'));

--9)
SELECT hypermarche.nom FROM hypermarche INNER JOIN rayon ON hypermarche.num_hyper = rayon.numerohyper WHERE rayon.chiffreaffaire NOT IN (SELECT MAX(chiffreaffaire) FROM rayon);

SELECT nom FROM hypermarche WHERE num_hyper IN (SELECT numerohyper FROM rayon WHERE chiffreaffaire NOT IN (SELECT MAX(chiffreaffaire) FROM rayon));

--10)
SELECT SUM(chiffreaffaire) FROM RAYON;

--11)
SELECT SUM(rayon.chiffreaffaire) FROM employe 
    INNER JOIN hypermarche ON employe.num_emp = hypermarche.numerodirecteur
    INNER JOIN rayon ON hypermarche.num_hyper = rayon.numerohyper
    WHERE hypermarche.numerodirecteur IN (SELECT num_emp FROM employe WHERE nom LIKE 'Dupont' AND prenom LIKE 'jean');

--12)

SELECT SUM(chiffreaffaire), hypermarche.nom FROM rayon INNER JOIN hypermarche ON rayon.numerohyper = hypermarche.num_hyper 
GROUP BY hypermarche.nom HAVING AVG(chiffreaffaire) < 1500000;
