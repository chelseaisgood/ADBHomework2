select stocksymbol, avg(price)
from stock join
	(select stocksymbol, price
	  from stock
	  limit 10) as stock1
group by stocksymbol
