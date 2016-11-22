drop table if exists temp;
drop table if exists temp1;
drop table if exists temp2;
drop table if exists temp3;
drop table if exists temp4;
drop table if exists temp5;
drop table if exists temp6;

create temporary table temp as (select stocksymbol, stocktime, price from stock where stocktime <= 200000 order by stocksymbol asc, stocktime asc);

set @row = 0;
create table temp1 as (select (@row:=@row + 1) as num, stocksymbol, stocktime, price from temp);	
create table temp2 as (select * from temp1);

create table temp3 as 
(
select *
from
(
select temp1.stocksymbol, temp1.num, temp2.stocktime, temp2.price from temp1 inner join temp2 on (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 9 <= temp2.num) and (temp1.num >= temp2.num)
) as sub1
order by stocksymbol, num
);

create table temp4 as
(
select stocksymbol, num, min(price) as price
from temp3
group by stocksymbol, num
);

create table temp5 as
(
select temp3.* from temp4 left  join temp3 on(temp4.stocksymbol = temp3.stocksymbol and temp4.num = temp3.num and temp4.price = temp3.price)
);

create table temp6 as
(
select temp1.stocksymbol, temp5.stocktime as buy_time, temp1.stocktime as sell_time, (temp1.price - temp5.price) as profit
from temp1, temp5
where temp1.stocksymbol = temp1.stocksymbol and temp1.num = temp5.num
);

drop table if exists result;
create temporary table result as(
select * from temp6 where profit = (select max(profit) from temp6) limit 1);

select * from result;
