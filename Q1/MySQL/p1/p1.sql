select stocksymbol, (sum(quantity * price))/sum(quantity) as weighted_average
from stock
group by stocksymbol
limit 1000000;
