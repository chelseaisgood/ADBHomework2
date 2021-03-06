drop table if exists temp;
drop table if exists temp1;
drop table if exists temp2;
	
create table temp as (select * from stock where stocktime <= 200000 order by stocksymbol asc, stocktime asc);
set @row = 0;
create table temp1 as (select (@row:=@row + 1) as num, stocksymbol, quantity, price from temp);
create table temp2 as (select * from temp1);

drop table if exists final_result;
create table final_result as
(
select stocksymbol, ((sum(sub.price * sub.quantity))/(sum(sub.quantity))) as running_average_weighted
from
(
select temp1.stocksymbol, temp1.num, temp2.quantity, temp2.price from temp1 inner join temp2 on (temp1.stocksymbol = temp2.stocksymbol) and (temp1.num - 9 <= temp2.num) and (temp1.num >= temp2.num)
) as sub
group by stocksymbol, num);

select * from final_result;
#into outfile '/var/lib/mysql-files/result_1_3.txt';
