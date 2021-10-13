--Creer par Thibaut Branlant L3 Informatique ULCO Calais
--1)
DECLARE
	vNUMERO employe.NUMERO%TYPE;
	vNOM employe.NOM%TYPE;
	vPRENOM employe.PRENOM%TYPE;
	vADRESSE employe.ADRESSE%TYPE;
BEGIN
	vNUMERO:='&NUMERO';
	vNOM:='&NOM';
	vPRENOM:='&PRENOM';
	vADRESSE:='&ADRESSE';

	INSERT INTO EMPLOYE VALUES(vNUMERO, vNOM, vPRENOM, vADRESSE);
END;
/

--2
DECLARE
	num employe.NUMERO%TYPE;
	vNUMERO employe.NUMERO%TYPE;
	vNOM employe.NOM%TYPE;
	vPRENOM employe.PRENOM%TYPE;
	vADRESSE employe.ADRESSE%TYPE;

BEGIN
	num:='&NUMERO';

	SELECT NUMERO, NOM, PRENOM, ADRESSE INTO vNUMERO, vNOM, vPRENOM, vADRESSE FROM EMPLOYE WHERE NUMERO LIKE num;
	DBMS_OUTPUT.PUT_LINE('NUMERO : ' || vNUMERO);
    DBMS_OUTPUT.PUT_LINE('NOM : ' || vNOM);
	DBMS_OUTPUT.PUT_LINE('PRENOM : ' || vPRENOM);
	DBMS_OUTPUT.PUT_LINE('ADRESSE : ' || vADRESSE);
END;
/

--3)
DECLARE
	moyPrix PRODUITS.prixUnitaire%TYPE;
	vNumHyper HYPERMARCHE.NUMERO%TYPE;

BEGIN
	vNumHyper:='&NUMERO';

	SELECT AVG(P.prixUnitaire) INTO moyPrix FROM PRODUITS P INNER JOIN RAYON R ON P.NUMERORayon = R.NUMERO INNER JOIN HYPERMARCHE H ON H.NUMERO = R.NUMEROHyper WHERE H.NUMERO = vNumHyper;
	DBMS_OUTPUT.PUT_LINE('Moyenne des prix : ' || moyPrix);
END;
/

--4)

CREATE SEQUENCE promo_seq START WITH 1;

CREATE TABLE promotions (
    NUMERO NUMBER(4) DEFAULT promo_seq.nextval NOT NULL,
    numproduit NUMBER(4),
    pourcentage_remise NUMBER(4,2),
    date_debut DATE,
    date_fin DATE,
    CONSTRAINT pk_promotions PRIMARY KEY (NUMERO),
    CONSTRAINT fk_promotions_produits FOREIGN KEY (numproduit) REFERENCES produits(NUMERO)
);

DECLARE
	vNumProduit produits.NUMERO%TYPE;
	vPromotion promotions.pourcentage_remise%TYPE;
	vDateDebut promotions.date_debut%TYPE;
	vDateFin promotions.date_fin%TYPE;

BEGIN
	vNumProduit:='&NUMERO';
	vPromotion:='&promotion';
	vDateDebut:=TO_DATE('&datedebut','YYYY-MM-DD');
	vDateFin:=TO_DATE('&datefin','YYYY-MM-DD');

	INSERT INTO promotions(numproduit, pourcentage_remise, date_debut, date_fin) VALUES(vNumProduit, vPromotion, vDateDebut, vDateFin);
END;
/

--4)
DECLARE
	vNumProduit PRODUITS.NUMERO%TYPE;
	vStockProduit PRODUITS.quantiteStockHyper%TYPE;

BEGIN
	vNumProduit:='&NUMERO';
	vStockProduit:='&stock';

	UPDATE produits SET quantiteStockHyper = vStockProduit WHERE NUMERO = vNumProduit;
END;
/


--6) 
--pas reussi a faire l'exercice 6)