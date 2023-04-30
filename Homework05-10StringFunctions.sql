--Functii STRING



USE AdventureWorks2012



--Functia 01
--Operatorul matematic "+" (imbinarea sirurilor de caractere)
--Exemplu
SELECT 'abc' + 'defg' AS Text
--Afisarea numelui complet in aceeasi coloana, pentru persoanele din tabelul Person.Person
--Dezavantaj: daca un cel putin termen (sir de caractere) este NULL, rezultatul va fi NULL
SELECT 
	BusinessEntityId,
	FirstName,
	MiddleName,
	LastName,
	FirstName + ' ' + MiddleName + ' ' + LastName AS 'Person Name'
FROM Person.Person
ORDER BY BusinessEntityId



--Functia 02
--CONCAT (imbinarea sirurilor de caractere)
--Exemplu
SELECT CONCAT ('abc', 'defg', 'hi') AS Text
--Afisarea numelui complet in aceeasi coloana, pentru persoanele din tabelul Person.Person
SELECT
	BusinessEntityId,
	FirstName,
	MiddleName,
	LastName,
	CONCAT (FirstName, MiddleName, LastName) AS 'Person Name'
FROM Person.Person
ORDER BY BusinessEntityId



--Functia 03
--CONCAT_WS (imbina siruri de caractere delimitandu-le cu un separator specificat)
--Exemplu
SELECT CONCAT_WS (' / ', 'abc', 'defg', 'hi') AS Text
--Afisarea unor informatii despre produsele din tabelul Production.Product
SELECT CONCAT_WS (' - ', Name, SafetyStockLevel, ProductId, ProductNumber) AS ProductInfo
FROM Production.Product
ORDER BY Name



--Functia 04
--LOWER (convertirea tuturor caracterelor text in litere mici)
--Exemplu
SELECT LOWER ('AbCdEfGhIj') AS 'Litere mici'
--Generare adresa de email de forma firstname.lastname@yahoo.com, pentru persoanele din tabelul Person.Person
SELECT
	BusinessEntityId,
	FirstName,
	MiddleName,
	LastName,
	CONCAT ( LOWER(FirstName), '.', LOWER(LastName), '@yahoo.com') AS 'Email'
FROM Person.Person
ORDER BY BusinessEntityId



--Functia 05
--UPPER (convertirea tuturor caracterelor text in litere mari, ignora celelalte caractere)
--Exemplu
SELECT UPPER ('AbCdEfGhIj') AS 'Litere mari', UPPER ('2023-Aprilie-29') AS 'Test si cu numere'
--Generare date pentru ecusoane de forma FIRSTNAME LASTNAME, pentru persoanele din tabelul Person.Person
SELECT
	BusinessEntityId,
	FirstName,
	MiddleName,
	LastName,
	CONCAT ( UPPER(FirstName), ' ', UPPER(LastName)) AS 'Ecuson'
FROM Person.Person
ORDER BY BusinessEntityId



--Functia 06
--LEN (intoarce numarul de caractere dintr-un sir)
SELECT LEN ('ab2c de&') AS 'Numar caractere'
--Aflarea celui/celor mai lung/lungi nume din tabelul Person.Person
SELECT
	BusinessEntityId,
	FirstName,
	MiddleName,
	LastName,
	LEN (CONCAT ( FirstName, ' ', MiddleName, ' ' , LastName)) AS 'FullNameLenght'
FROM Person.Person
ORDER BY FullNameLenght DESC



--Functia 07, 08, 09, 10
--LEFT (intoarce un numar specificat de caractere de la inceputul unui sir)
--RIGHT (intoarce un numar specificat de caractere de la sfarsitul unui sir)
--SUBSTRING (intoarce o portiune de caractere consecutive dintr-un sir, de o lungime specificate, incepand de la o pozitie specificata din sir)
--REVERSE (transpune un sir de caractere in ordine inversa)
DECLARE @alfabet NVARCHAR(50)
SELECT @alfabet = 'abcdefghijklmnopqrstuwxyz';
SELECT
	LEFT(@alfabet,3) AS 'Primele 3 litere',
	RIGHT(@alfabet,5) AS 'Ultimele 5 litere',
	SUBSTRING(@alfabet,3,7) AS '7 litere incepand cu a 3-a', --sa se extraga din alfabet 7 litere incepand cu a 3-a litera
	SUBSTRING(@alfabet,13,1) AS 'Litera 13',
	REVERSE(@alfabet) AS 'Alfabet intors'
