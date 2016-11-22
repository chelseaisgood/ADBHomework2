drop table if exists stockNew;

create table stockNew (
	stocksymbol INT,
    stocktime varchar(200),
    quantity int,
    price int,
	primary key(stocktime)
    );
	
	
#LOAD DATA INFILE 'F:/wamp64/tmp/trade.json' INTO TABLE stock.stock
LOAD DATA INFILE '/var/lib/mysql-files/data.txt' INTO TABLE question2.stockNew
      FIELDS
          TERMINATED BY ',';