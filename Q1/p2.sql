select @total = 70002;
set @i = 1;

drop table if exists temp1;
drop table if exists temp2;
drop table if exists result;
set @row = 0;

create temporary table result (stocksymbol int, running_average double);
#create table temp1 as (select (@row:=@row + 1) as num, stocksymbol, quantity, price from stock where stocksymbol in (select distinct stocksymbol from stock) );
create table temp1 as (select (@row:=@row + 1) as num, stocksymbol, quantity, price from stock where stocksymbol = 1);
create table temp2 as (select * from temp1);
select * from temp1;
select * from temp2;

select stocksymbol, avg(sub.price) as running_average
from
(
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 9 = temp2.num)
union
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 8 = temp2.num)
union
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 7 = temp2.num)
union
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 6 = temp2.num)
union
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 5 = temp2.num)
union
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 4 = temp2.num)
union
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 3 = temp2.num)
union
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 2 = temp2.num)
union
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 1 = temp2.num)
union
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num = temp2.num)
) as sub
group by stocksymbol, num;