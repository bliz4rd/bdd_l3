CREATE TABLE PRIMES
(
	numero INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    CONSTRAINT pk_primes PRIMARY KEY (numero),
	numeroEmploye INT,
    CONSTRAINT fk_primeNumeroEmploye FOREIGN KEY (numeroEmploye) REFERENCES EMPLOYE(numero),
	numeroRayon INT,
    CONSTRAINT fk_primeNumeroRayon FOREIGN KEY (numeroRayon) REFERENCES RAYON(numero),
    montantPrime INT,
    moisAnnee VARCHAR(100)
);

CREATE OR REPLACE prime_employe(p1 NUMBER, p2 NUMBER, p3 NUMBER)
AS
    CURSOR cur IS
    SELECT NUMERO, NUMERORESPONSABLE, CHIFFREAFFAIRE FROM RAYON
    ORDER BY CHIFFREAFFAIRE DESC;
    res cur%ROWTYPE;
    compteur INTEGER;
BEGIN
    compteur := 1;
    OPEN cur;
    LOOP
        FETCH cur INTO res;
        EXIT WHEN cur%NOTFOUND;
        dbms_output.put_line('Prime versé pour : ') || res.NUMERORESPONSABLE);

        IF compteur = 1 THEN
            INSERT INTO primes(numemp, numrayon , montantprime, moisanne) VALUES
            (res.NUMERORESPONSABLE, res.NUMERO, p1, sysdate);
        END IF;

        IF compteur = 2 THEN
            INSERT INTO primes(numemp, numrayon , montantprime, moisanne) VALUES
            (res.NUMERORESPONSABLE, res.NUMERO, p2, sysdate);
        END IF;

        IF compteur = 3 THEN
            INSERT INTO primes(numemp, numrayon , montantprime, moisanne) VALUES
            (res.NUMERORESPONSABLE, res.NUMERO, p3, sysdate);
        END IF;
        compteur := compteur + 1;
    END LOOP;
    CLOSE cur;
END;
