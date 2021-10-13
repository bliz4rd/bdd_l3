--Creer par Thibaut Branlant L3 Informatique ULCO Calais
delete from hypermarche where nom like 'Marrefour Market';
UPDATE rayon SET numeroresponsable = (SELECT num_emp FROM employe where nom like 'VASSEUR' and prenom like 'Jacques') 
where numeroresponsable = (SELECT num_emp FROM employe where nom like 'RICHARD' and prenom like 'Philipe');