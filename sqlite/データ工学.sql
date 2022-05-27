-- SQLite
CREATE TABLE 売上(
 売上コード CHAR(6) NOT NULL PRIMARY KEY,
 日付 DATE DEFAULT CURRENT_DATE,
 商品コード CHAR(6) REFERENCES 商品(商品コード),
 数量 INT
);

CREATE TABLE 商品(
 商品コード CHAR(6),
 商品名 VARCHAR(30),
 単価 DECIMAL(6),
 区分 CHAR(2),
 PRIMARY KEY (商品コード),
 CHECK (区分 IN('A','B','C'))
);


SELECT
*
FROM
売上;

SELECT
*
FROM
商品;

INSERT INTO 売上
VALUES
  ('001',datetime('now','localtime'),'0x001',12),
  ('002',datetime('now','localtime'),'0x002',5),
  ('003',datetime('now','localtime'),'0x003',9),
  ('004',datetime('now','localtime'),'0x004',13);

INSERT INTO 商品
VALUES
  ('0x001','aaaaaa','500','A'),
  ('0x002','bbbbbb','200','C'),
  ('0x003','cccccc','100','A'),
  ('0x004','dddddd','300','B');

INSERT INTO 商品
VALUES
  ('0x005','ssssss','1000','A'),
  ('0x006','dddddd','200','C'),
  ('0x007','eeeeee','20','A'),
  ('0x008','ffffff','900','B');

CREATE VIEW syouhin AS
SELECT
  商品名
From 商品;

SELECT * FROM syouhin;

-- CREATE domain kubun CHAR(2)
--   CHECK (kubun IN('A','B','C'));

SELECT * FROM 売上;
SELECT * FROM 商品;

SELECT * 
FROM 売上
WHERE 売上コード = '001';

SELECT 区分,count()
FROM 商品
GROUP BY 区分;
HAVING 区分=='A';

SELECT * 
FROM 商品
WHERE 単価 > 300;

Select *
from 商品
ORDER BY 単価 ASC;



CREATE TABLE 社員(
id INT(3),
氏名 CHAR(10),
年齢 INT(3)
);

INSERT INTO 社員
VALUES
  (1,'佐藤',30),
  (2,'田中',25),
  (3,'山田',42),
  (4,'木村',55),
  (5,'渡辺',28);

SELECT * FROM 社員;

CREATE TABLE 所属(
部署 CHAR(5),
社員id INT(3)
);

INSERT INTO 所属
VALUES
  ('総務',1),
  ('営業',2),
  ('経理',3),
  ('営業',4),
  ('経理',5);

SELECT * FROM 所属;

SELECT 部署 
FROM 所属
WHERE 社員id
IN(
  SELECT id 
  FROM 社員
  WHERE 年齢 >= 30
);

SELECT * FROM 社員;
SELECT * FROM 社員2;
SELECT * FROM 所属;

CREATE TABLE 社員2 AS
SELECT * FROM 社員;

UPDATE 社員
SET 年齢 = 48
WHERE id == 1; 

DELETE from 社員2
WHERE id < 3;

