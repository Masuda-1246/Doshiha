-- SQLite
SELECT
*
FROM
Persons;

SELECT
LastNmae,FirstName
FROM
Persons;

SELECT 1+1;

SELECT
  LastNmae AS 名字,
  FirstName AS 名前
FROM
Persons;

SELECT
*
FROM
Persons
WHERE
PersonId = 1;

SELECT
lastNmae || ' ' || FirstName AS 本名
FROM
Persons
WHERE
PersonId = 1;

CREATE TABLE Countires(
  Id INTEGER,
  Name VARCHAR(255),
  Capital VARCHAR(255)
);

INSERT INTO Countires VALUES(
  1,'Japan','Tokyo'
)

INSERT INTO Countires(Name, Capital)
VALUES('US','DC');

INSERT INTO Countires(Id, Name, Capital)
VALUES
  (2,'UK','Rondon'),
  (3,'Franve','Paris'),
  (4,'Italy','Roma');

SELECT * FROM Countires;

