-- SQLite
CREATE TABLE Persons(
  PersonId INTEGER,
  LastNmae VARCHAR(12),
  FirstName VARCHAR(12),
  PhoneNumber Char(11),
  DateOfBirth DATETIME,
  Comment Text
)

INSERT INTO Persons
VALUES(
  3,'c','ds','000000000','2002/1/22','comment3'
)

SELECT * FROM Persons;

CREATE TABLE NewPersons AS
SELECT
*
FROM
Persons;

SELECT * FROM NewPersons;

DROP TABLE NewPersons;