drop table if exists result;
create temporary table result as(
select stocksymbol, (sum(quantity * price))/sum(quantity) as weighted_average
from stock
group by stocksymbol
order by stocksymbol asc);

select * from result;
#\COPY result TO '/var/lib/postgresql/9.3/main/result1.csv' DELIMITER ',' CSV HEADER;