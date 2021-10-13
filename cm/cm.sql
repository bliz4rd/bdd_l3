-- CREATED BY THIBAUT BRANLANT 
-- 1 )
CREATE TABLE ETUDIANT(
    NUMERO int, 
    NOM varchar, 
    PRENOM varchar, 
    NUMEROFILIERE int, 
    MOYENNE real,
    ADD CONSTRAINT CK_MOYENNE CHECK( MOYENNE > 2 AND NUMEROFILIERE = 2)
)

-- 2 )
CREATE OR REPLACE TRIGGER VERIFIER_CB
BEFORE INSERT ON journalcb
FOR EACH ROW
DECLARE
    total3jours number;
BEGIN
    SELECT sum(montant) INTO total3jours FROM journalcb WHERE numcarte = :New.numcarte AND datetrans >= sysdate-3;
    IF total3jours > 3000 THEN
        INSERT INTO jourcbaverifier(numcarte, montant, numvendeur, datetrans) VALUES (:new.numcarte, :new.montant, :new.numvendeur, :new.datetrans);
    END IF;
END;

-- 3 )
CREATE OR REPLACE TRIGGER VERIFIER_HEURE
BEFORE INSERT ON commande
FOR EACH ROW
BEGIN
    IF (tonumber(tochar(sysdate, 'HH24'))>17) THEN
        :new.verifmanuelle := 'oui';
    END IF;
END;
