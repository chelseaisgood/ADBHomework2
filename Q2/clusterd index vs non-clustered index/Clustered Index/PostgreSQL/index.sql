ALTER TABLE stock DROP CONSTRAINT stock_pkey;

select * from stock where quantity > 8000;

ALTER TABLE stock ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (stocktime);

select * from stock where quantity > 8000;


ALTER TABLE stockNew DROP CONSTRAINT stockNew_pkey;

select * from stockNew where quantity > 8000;

ALTER TABLE stockNew ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (stocktime);

select * from stockNew where quantity > 8000;