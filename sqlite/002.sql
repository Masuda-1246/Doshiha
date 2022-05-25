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

SELECT *
FROM 商品
GROUP BY 単価；
-- HAVING 区分='A';