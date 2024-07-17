-- Table 1
CREATE DATABASE orders;

SHOW DATABASES;
CREATE TABLE items(
Item_no INT,
Item_name VARCHAR(50),
cost FLOAT
);
SHOW TABLES;
DESC items;

ALTER TABLE items ADD COLUMN dateofpurchase DATE;
DESC items;

ALTER TABLE items ADD COLUMN timepurchase INT AFTER cost;
DESC items;

DROP TABLE items;
DROP DATABASE ssb;


