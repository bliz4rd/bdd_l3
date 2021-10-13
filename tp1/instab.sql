--Creer par Thibaut Branlant L3 Informatique ULCO Calais

INSERT INTO EMPLOYE VALUES ('EMP1090','DUPONT','Jean','332, rue jean-dupont, Calais');
INSERT INTO EMPLOYE VALUES ('EMP1301','DUVIVIER','Renaud','345, rue renaud-duviver, Paris');
INSERT INTO EMPLOYE VALUES ('EMP1208','GODART','Claude','674, rue claude-godart, Ardre');
INSERT INTO EMPLOYE VALUES ('EMP2025','FONTAINE','Fabien','456, rue jean-louis, Calais');
INSERT INTO EMPLOYE VALUES ('EMP1505','VASSEUR','Jacques','778, rue vasseur, Saint-Omer');
INSERT INTO EMPLOYE VALUES ('EMP7645','BERNARD','Martin','876, rue martin, Sangatte');
INSERT INTO EMPLOYE VALUES ('EMP2341','RICHARD','Philipe','955, rue bernard, Coudekerque ');
INSERT INTO EMPLOYE VALUES ('EMP8765','Hugo','Victor','432,rue victor-hugo, Frethun');
INSERT INTO EMPLOYE VALUES ('EMP4328','Stevenson','Max','874, rue max-stevenson, Cologne');
INSERT INTO EMPLOYE VALUES ('EMP7862','DURAND','Christophe','543, rue durand, Calais');


INSERT INTO HYPERMARCHE VALUES ('HYP12','Marrefour Coquelles', '12 Bd du Kent', 'Coquelles','62231','EMP1090');
INSERT INTO HYPERMARCHE VALUES ('HYP56','DO-SPORT','45 AVBlue','Calais','62100','EMP1208');
INSERT INTO HYPERMARCHE VALUES ('HYP76','Marrefour Market','68 AV Bleriot','Lille','59160','EMP1301');
INSERT INTO HYPERMARCHE VALUES ('HYP43','Dealer Price','52, Bd Hugo','Calais','62100','EMP8765');

INSERT INTO RAYON VALUES ('RAY34','Boucherie','vente de viandes volailles etc.',1000000,'HYP12','EMP7862');
INSERT INTO RAYON VALUES ('RAY45','Textile','Vetements',50000000,'HYP56','EMP1505');
INSERT INTO RAYON VALUES ('RAY67','Chaussure','Des chaussures de cuir des chaussures de marche',800000,'HYP56','EMP7645');
INSERT INTO RAYON VALUES ('RAY86','Poissonnerie','Poissonerie traiteur,plateau defruits de mer.',950000,'HYP12','EMP2341');
INSERT INTO RAYON VALUES ('RAY19','Légumes','Fruits et Légumes',450000,'HYP43','EMP4328');
INSERT INTO RAYON VALUES ('RAY98','Boucherie','vente de viandes volailles etc.',500000,'HYP43','EMP2025');


INSERT INTO PRODUITS VALUES ('PR1234', 'Côtes de bœuf', 'RAY34', 12.5, 'kg', 345);
INSERT INTO PRODUITS VALUES ('PR5783','Chaussure Mike','RAY67',109.99,'unité',56660);
INSERT INTO PRODUITS VALUES ('PR6765','SWEAT CORERUNNER','RAY45',59.00,'unité',87778);




