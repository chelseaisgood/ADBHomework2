alter table stock drop primary key;

select * from stock where quantity > 8000;

alter table stock add primary key(stocktime);

select * from stock where quantity > 8000;

alter table stockNew drop primary key;

select * from stockNew where quantity > 8000;

alter table stockNew add primary key(stocktime);

select * from stockNew where quantity > 8000;