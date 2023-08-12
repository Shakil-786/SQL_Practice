SELECT * from [dbo].[int_orders] ;

with cte as(
select salesperson_id, SUM(amount) as total from [dbo].[int_orders] GROUP  by salesperson_id)

select *,case when total>100 then ((total-100)*0.9)+80 else total*0.8 end as received from cte





cte1 as(
select *,case when total>=100 then total-100 else total end as amm from cte),
cte2 as(
select salesperson_id,total, case when amm>100 then ((cast(amm as float)/100)*10)+20 else 20 end as ammount_dedected from cte1)
select *, total-ammount_dedected as amount_recieve from cte2