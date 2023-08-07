

--query to find top3 products in each catagory by highest rolling 3 months total sale for jan-2020\
with cte as(
SELECT product_id,category,datepart(year,order_date) yo, datepart(month,order_date) mo, sum(sales) as t_sales
from superstore_orders
group by product_id,category,datepart(year,order_date) , datepart(month,order_date)),
cte1 as(
select *, sum(t_sales) over(partition by product_id,category order by yo,mo rows between 2 preceding and current row) roll_3_sales
from cte)
select * from(
select *, rank() over(partition by category order by roll_3_sales desc) rn 
from cte1
where  yo=2020 and mo=1)A
where rn<=3


--write a query to find month wise sales for each category for months where sale is more than the combine sales prvious two months for that category

SELECT * from superstore_orders

with cte as(
SELECT category,datepart(year,order_date) as yr,datepart(MONTH,order_date) as mnt,
sum(sales) as total_sales

 from superstore_orders
 GROUP by category,datepart(year,order_date) ,datepart(MONTH,order_date) ),

cte1 as(
SELECT *, sum(total_sales) over(partition By category order by yr,mnt rows between 2  preceding and 1 preceding ) as last_2_sales

from cte)
SELECT * from cte1
where total_sales>last_2_sales




--write a query to find the product for which month over month sales never decline

WITH cte as(
SELECT product_id,datepart(year,order_date) yr, 
datepart(MONTH,order_date) mnt ,sum(sales) as t_sales,lag(sum(sales),1,0) over(partition by product_id order by datepart(year,order_date),datepart(MONTH,order_date)) as last_month_sales
 from superstore_orders
 GROUP by product_id,datepart(year,order_date),datepart(MONTH,order_date)  ,sales
 )
 SELECT distinct product_id from cte 
 where product_id not in(
    select product_id from cte WHERE t_sales<last_month_sales 
    group by product_id
 )


WITH cte as(
SELECT product_id,datepart(year,order_date) yr, 
datepart(MONTH,order_date) mnt ,sum(sales) as t_sales--,lag(sales,1,0) over(partition by product_id order by datepart(year,order_date),datepart(MONTH,order_date)) as last_month_sales
 from superstore_orders
 GROUP by product_id,datepart(year,order_date),datepart(MONTH,order_date)
 ),cte1 as(
 select *,lag(t_sales,1,0) over(partition by product_id order by yr,mnt) as last_month_sales
 from cte)
 SELECT distinct product_id from cte1
 where product_id not in(
    select product_id from cte1 WHERE t_sales<last_month_sales 
    group by product_id
 )














