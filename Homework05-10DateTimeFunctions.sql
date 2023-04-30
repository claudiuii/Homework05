--Functii DATE & TIME



--Functia 01
--GETDATE (intoarce data si ora* sistemului)
--* - a se intelege timpul in format hh:mm:ss
SELECT
	GETDATE() AS 'Data si ora curente'



--Functia 02, 03, 04
--YEAR (returneaza un numar intreg care reprezinta anul datei specificate, similar DATEPART (YEAR, date) si DATENAME (YEAR, date))
--MONTH (returneaza un numar intreg care reprezinta luna datei specificate, similar DATEPART (MONTH, date))
--DAY (returneaza un numar intreg care reprezinta ziua datei specificate, similar DATEPART (DAY, date))
--Exemplu pentru data curenta
SELECT
	GETDATE() AS 'Data si timpul curente',
	YEAR(GETDATE()) AS 'Anul curent',
	MONTH(GETDATE()) AS 'Luna curenta',
	DAY(GETDATE()) AS 'Ziua curenta';
--Exemplu pentru o data specificata
Declare @dataspf DATE
SELECT @dataspf = '2023-04-30' --se incarca data specificata intr-o variabila pentru a nu o scrie de mai multe ori
SELECT
	@dataspf AS 'Data specificata',
	YEAR(@dataspf) AS 'Anul curent',
	MONTH(@dataspf) AS 'Luna curenta',
	DAY(@dataspf) AS 'Ziua curenta';



--Functia 05
--DATEDIFF (calculeaza diferenta intre doua date calendaristice) intr-o unitate de timp specificata
--Sa se afle cate unitati de timp mai sunt din momentul de fata (data si ora curente) pana la un eveniment specificat (Revelion 2023)
DECLARE @DateEvent DATE
SELECT @DateEvent = '2023-12-31 23:59:59'
SELECT
	DATEDIFF(DAY,GETDATE(),@DateEvent) AS 'DaysDiff',
	DATEDIFF(HOUR,GETDATE(),@DateEvent) AS 'HoursDiff',
	DATEDIFF(MINUTE,GETDATE(),@DateEvent) AS 'MinutesDiff',
	DATEDIFF(SECOND,GETDATE(),@DateEvent) AS 'SecondsDiff'
--	DATEDIFF(MILISECOND,GETDATE(),@DateEvent) --Am incercat millisecond si nu functioneaza



--Functia 06
--DATEPART (extrage o parte specificata dintr-o data)
--Exemplu pentru o data specificate
SELECT
	DATEPART(YEAR,'2023-04-29 09:50:30'),
	DATEPART(HOUR,'2023-04-29 09:50:30')
--Exemplu pentru data curenta
SELECT
	DATEPART(YEAR, GETDATE()) AS 'Anul',
	DATEPART(QUARTER, GETDATE()) AS 'Trimestrul',
	DATEPART(MONTH, GETDATE()) AS 'Luna',
	DATEPART(DAY, GETDATE()) AS 'Ziua din luna',
	DATEPART(DAYOFYEAR, GETDATE()) AS 'Ziua din an',
	DATEPART(WEEK, GETDATE()) AS 'Saptamana din an',
	DATEPART(WEEKDAY, GETDATE()) AS 'Ziua saptamanii',
	DATEPART(HOUR, GETDATE()) AS 'Ora',
	DATEPART(MINUTE, GETDATE()) AS 'Minutul',
	DATEPART(SECOND, GETDATE()) AS 'Secunda'
--	DATEPART(MILISECOND, GETDATE()) AS 'Milisecunda' --Am incercat millisecond si nu functioneaza



--Functia 07
--Afiseaza numele partii specificate dintr-o data
--Exemplu pentru o data specificata
SELECT
	DATENAME(MONTH,'2023-04-29 09:50:30'),
	DATENAME(WEEKDAY,'2023-04-29 09:50:30')
--Exemplu pentru data curenta
SELECT
	DATENAME(MONTH, GETDATE()) AS 'Luna',
	DATENAME(WEEKDAY, GETDATE()) AS 'Ziua saptamanii',
--Pentru celelalte parti care pot fi specificate, intoarce acelasi rezultat ca DATEPART
	DATENAME(YEAR, GETDATE()) AS 'Anul',
	DATENAME(QUARTER, GETDATE()) AS 'Trimestrul',
	DATENAME(DAY, GETDATE()) AS 'Ziua din luna',
	DATENAME(DAYOFYEAR, GETDATE()) AS 'Ziua din an',
	DATENAME(WEEK, GETDATE()) AS 'Saptamana din an',
	DATENAME(HOUR, GETDATE()) AS 'Ora',
	DATENAME(MINUTE, GETDATE()) AS 'Minutul',
	DATENAME(SECOND, GETDATE()) AS 'Secunda'



--Functia 08
--DATEADD (adauga la o data specificata, un numar de unitati de timp specificate)
--Sa se determine ce data va fi peste 1 an, 2 luni, 3 saptamani si 4 zile (fata de data curenta)
SELECT DATEADD(DAY, 1, (DATEADD(WEEK, 2, (DATEADD(MONTH, 3, (DATEADD(YEAR, 4, GETDATE())))))))



--Functia 09
--DATEFROMPARTS (returneaza data pentru anul, luna si ziua specificate)
--Functia 05 v.01
--Cerinta de mai sus, fara afisarea timpului
DECLARE @data DATE
SELECT @data = DATEFROMPARTS(YEAR(GETDATE()),MONTH(GETDATE()),DAY(GETDATE()));
SELECT DATEADD(DAY, 1, (DATEADD(WEEK, 2, (DATEADD(MONTH, 3, (DATEADD(YEAR, 4, @data)))))))
--Functia 05 v.02
--Schimbarea formatului datei
DECLARE @dataRo VARCHAR(10)
SELECT @dataRo = '30.04.2023';
SELECT
	@dataRo AS DataRO,
	DATEFROMPARTS(SUBSTRING(@dataRo, 7, 4), SUBSTRING(@dataRo, 4, 2), SUBSTRING(@dataRo, 1, 2)) AS DataEN



--Functia 10
--EOMONTH (returneaza data ultimei zile din luna in care se afladata specificata)
SELECT EOMONTH(GETDATE()) AS 'Data ultimei zile din luna curenta'
SELECT EOMONTH(GETDATE(),1) AS 'Data ultimei zile din luna urmatoare'
SELECT EOMONTH(GETDATE(),-1) AS 'Data ultimei zile din luna anterioara'
SELECT EOMONTH('2023-02-15') AS 'Data ultimei zile din luna Februarie 2023'
SELECT EOMONTH('2024-02-15') AS 'Data ultimei zile din luna Februarie 2024' --stie si de an bisect :)



--Bonus (Aceasta functie nu este specifica Date&Time)
-- SET LANGUAGE (specifica mediul lingvistic pentru sesiunea curenta, fecteaza modul de afisare a datei si mesajelor sistem - vezi panoul Messages dupa Execute Query)
--Exemplu:
--Afisarea datei curente in format dddd dd.mmmm.yyyy intr-o limba specificata
DECLARE @cl VARCHAR(50)
SELECT @cl = @@LANGUAGE --se incarca limbajul curent al sistemului intr-o variabila deoarece limbajul sesiunii ramane cel setat ultimul, in cazul de fata Italian
SET LANGUAGE Romanian;  
SELECT CONCAT(DATENAME(WEEKDAY,GETDATE()), ' ', DAY(GETDATE()), '.', DATENAME(MONTH,GETDATE()), '.', YEAR(GETDATE())) AS 'Romana';
SET LANGUAGE English;  
SELECT CONCAT(DATENAME(WEEKDAY,GETDATE()), ' ', DAY(GETDATE()), '.', DATENAME(MONTH,GETDATE()), '.', YEAR(GETDATE())) AS 'Engleza';
SET LANGUAGE Greek;  
SELECT CONCAT(DATENAME(WEEKDAY,GETDATE()), ' ', DAY(GETDATE()), '.', DATENAME(MONTH,GETDATE()), '.', YEAR(GETDATE())) AS 'Greaca';
SET LANGUAGE Turkish;  
SELECT CONCAT(DATENAME(WEEKDAY,GETDATE()), ' ', DAY(GETDATE()), '.', DATENAME(MONTH,GETDATE()), '.', YEAR(GETDATE())) AS 'Turca';
SET LANGUAGE Italian;  
SELECT CONCAT(DATENAME(WEEKDAY,GETDATE()), ' ', DAY(GETDATE()), '.', DATENAME(MONTH,GETDATE()), '.', YEAR(GETDATE())) AS 'Italiana';
SET LANGUAGE @cl; --se apeleaza variabila si se restaureaza limbajul sistemului daca nu se face acest lucru, ultimul limbaj setat se pastreaza pana la inchiderea sesiunii
--Oricum, urmatoarea sesiune va porni cu limbajul implicit al sistemului
