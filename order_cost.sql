-- Highest Cost Orders
/*
Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01.
If customer had more than one order on a certain day, sum the order costs on daily basis.
Output their first name, total cost of their items, and the date.
For simplicity, you can assume that every first name in the dataset is unique
*/

select * from customers;
select * from orders;

WITH cte as(
SELECT o.cust_id,c.first_name,o.order_date,sum(o.total_order_cost) as total_spend
 FROM customers c 
inner join orders o on c.id=o.cust_id
where o.order_date>='2019-02-01' and order_date<='2019-05-01'
group by c.first_name,o.order_date,o.cust_id
)

select c.first_name,c.total_spend,c.order_date from cte c
where total_spend=(select max(total_spend) from cte);

-- SELECT * from orders

SELECT c.first_name,c.order_date,o.order_details,c.total_spend from cte c
join orders o on c.cust_id=o.cust_id and o.order_date=c.order_date
order by c.order


