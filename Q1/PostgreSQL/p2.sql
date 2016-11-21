drop table if exists temp;
drop table if exists temp1;
drop table if exists temp2;
	
create table temp as (select * from stock order by stocksymbol asc, stocktime asc);
create table temp1 as (select row_number() over() as num,* from temp);	
create table temp2 as (select * from temp1);


select stocksymbol, avg(sub.price) as running_average_unweighted
from
(
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 9 = temp2.num)
union all
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 8 = temp2.num)
union all
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 7 = temp2.num)
union all
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 6 = temp2.num)
union all
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 5 = temp2.num)
union all
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 4 = temp2.num)
union all
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 3 = temp2.num)
union all
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 2 = temp2.num)
union all
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 1 = temp2.num)
union all
select temp1.stocksymbol, temp1.num, temp2.price from temp1, temp2 where (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num = temp2.num)
) as sub
group by stocksymbol, num;