with cte as(
SELECT distinct product_id,
sum(Sales) over(partition by product_id) as sales_per_customer,
sum(Sales) over() as total_sales, 
(sum(Sales) over(partition by product_id)*1.0/sum(Sales) over()) *100 as sales_percentage
 FROM superstore_orders),
 cte1 as(

 SELECT *, sum(sales_percentage) over(order by sales_percentage desc) running_sum
 from cte )
  SELECT *
   FROM cte1 
   WHERE running_sum<=80


with cte as(
  SELECT product_id,sum(Sales) as sales_per_product
   from superstore_orders 
   group by product_id),
   cte1 as(
SELECT *,sum(sales_per_product) over(order by sales_per_product desc) as running_sales,
sum(sales_per_product) over() as total_sales
 from cte )

 SELECT product_id
  from cte1 
    where running_sales<=.8*total_sales
