drop table if exists stock;

create table stock (
	stocksymbol INT,
    stocktime int,
    quantity int,
    price int,
	primary key(stocktime)
    );
	
	
#LOAD DATA INFILE 'F:/wamp64/tmp/trade.json' INTO TABLE stock.stock
LOAD DATA INFILE '/var/lib/mysql-files/data.txt' INTO TABLE question2.stock
      FIELDS
          TERMINATED BY ',';