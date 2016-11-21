drop table if exists stock;

create table stock (
	stocksymbol INT,
    stocktime int,
    quantity int,
    price int,
	primary key(stocktime)
    );
	
	
\copy stock from '/var/lib/postgresql/9.3/main/trade.txt' (DELIMITER(','));
