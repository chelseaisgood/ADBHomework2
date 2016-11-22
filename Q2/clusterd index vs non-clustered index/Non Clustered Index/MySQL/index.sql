select * from stock where price = 203 limit 1000000;

select * from stock where quantity = 500 limit 1000000;

create index price_index using btree on stock (price);

select * from stock where price = 203 limit 1000000;

drop index price_index on stock;

create index quantity_index using btree on stock (quantity);
	
select * from stock where quantity = 500 limit 1000000;

drop index quantity_index on stock;