drop table if exists temp;
drop table if exists temp1;
drop table if exists temp2;
drop table if exists final_result;

create table temp as (select * from stock where stocktime <= 200000 order by stocksymbol asc, stocktime asc);

set @row = 0;
#create table temp1 as (select (@row:=@row + 1) as num, stocksymbol, quantity, price from stock where stocksymbol in (select distinct stocksymbol from stock) );
create table temp1 as (select (@row:=@row + 1) as num, stocksymbol, quantity, price from temp);
create table temp2 as (select * from temp1);

drop table if exists final_result;
create table final_result as
(
select stocksymbol, (sum(sub.price)/count(sub.price)) as running_average_unweighted
from
(
select temp1.stocksymbol, temp1.num, temp2.price from temp1 inner join temp2 on (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 9 <= temp2.num) and (temp1.num >= temp2.num)
#select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 9 <= temp2.num) and (temp1.num >= temp2.num)
) as sub
group by stocksymbol, num
);

