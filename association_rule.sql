SELECT Order_ID,
STRING_AGG(Sub_Category,',') as combine_product
 from superstore_orders
GROUP by Order_ID
HAVING count(Order_ID)>1;


with cte as(
SELECT distinct Order_ID,Sub_Category 
from superstore_orders)
SELECT Order_ID,
STRING_AGG(Sub_Category,',') as combine_product
 from cte
 GROUP BY Order_ID
  HAVING COUNT(Order_ID)>1; 




select * from superstore_orders




