CREATE OR REPLACE FUNCTION Get_Emp_Name(numeroEmp IN employe.numE%TYPE) RETURN varchar
IS
    concat VARCHAR(50); 
BEGIN
    SELECT nomE INTO nom FROM employe where numE LIKE numeroEmp; 
    SELECT prenomE INTO prenom FROM employe WHERE numE LIKE numeroEmp; 
    concat := nom || prenom;
    RETURN concat;
END; 