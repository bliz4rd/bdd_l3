--Creer par Thibaut Branlant L3 Informatique ULCO Calais
DROP TABLE HYPERMARCHE CASCADE CONSTRAINTS;
DROP TABLE RAYON CASCADE CONSTRAINTS;
DROP TABLE PRODUITS CASCADE CONSTRAINTS;
DROP TABLE EMPLOYE CASCADE CONSTRAINTS;

CREATE TABLE EMPLOYE (
    NUMERO VARCHAR(60) NOT NULL,
    NOM VARCHAR(60) NOT NULL,
    PRENOM VARCHAR(60) NOT NULL,
    ADRESSE VARCHAR(60),
    
    CONSTRAINT PK_EMPLOYE PRIMARY KEY (NUMERO)
);

CREATE TABLE HYPERMARCHE (
    NUMERO VARCHAR(60) NOT NULL,
    NOM VARCHAR(60) NOT NULL,
    ADRESSE VARCHAR(50) NOT NULL,
    VILLE VARCHAR(60) NOT NULL,
    CODEPOSTAL INT NOT NULL,
    NUMERODIRECTEUR VARCHAR(60) NOT NULL,
    
    CONSTRAINT fk_numerodirecteur
        FOREIGN KEY (NUMERODIRECTEUR)
        REFERENCES EMPLOYE(NUMERO),
        
    CONSTRAINT PK_HYPERMARCHE PRIMARY KEY (NUMERO)
);

CREATE TABLE RAYON (
    NUMERO VARCHAR(60) NOT NULL,
    NOM VARCHAR(60) NOT NULL,
    DESCRIPTIF VARCHAR(150) NOT NULL,
    CHIFFREAFFAIRE INT NOT NULL,
    NUMEROHYPER VARCHAR(60) NOT NULL,
    NUMERORESPONSABLE VARCHAR(60) NOT NULL,
    
    CONSTRAINT fk_numeroresponsable
        FOREIGN KEY (NUMERORESPONSABLE)
        REFERENCES EMPLOYE(NUMERO),
        
    CONSTRAINT fk_numerohyper
        FOREIGN KEY (NUMEROHYPER)
        REFERENCES HYPERMARCHE(NUMERO),
    
    CONSTRAINT PK_RAYON PRIMARY KEY (NUMERO)
);

CREATE TABLE PRODUITS (
    NUMERO VARCHAR(60) NOT NULL,
    LIBELLE VARCHAR(60) NOT NULL,
    NUMERORAYON VARCHAR(60) NOT NULL,
    PRIXUNITAIRE FLOAT NOT NULL,
    UNITE VARCHAR(60) NOT NULL,
    QUANTITESTOCKHYPER INT NOT NULL,
    
    CONSTRAINT fk_numerorayon
        FOREIGN KEY (NUMERORAYON)
        REFERENCES RAYON(NUMERO),
    
    CONSTRAINT PK_PRODUIT PRIMARY KEY (NUMERO)
);