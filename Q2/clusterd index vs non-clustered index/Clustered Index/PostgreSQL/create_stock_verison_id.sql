drop table if exists stockNew;

create table stockNew (
  stocksymbol INT,
    stocktime VARCHAR(200),
    quantity int,
    price int,
  primary key(stocktime)
    );
  
  
\copy stockNew from '/var/lib/postgresql/9.3/main/data.txt' (DELIMITER(','));
