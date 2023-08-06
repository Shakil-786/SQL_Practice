

select * from Trade_tbl;

select * from employee;

with cte as(
select emp_name,dept_id,salary, ROW_NUMBER() over( PARTITION by dept_id order by salary desc) as highest from employee),
cte1 as(
    select emp_name,dept_id,salary, ROW_NUMBER() over( PARTITION by dept_id order by salary asc) as lowest from employee

)
select c.emp_name,c.salary,c.dept_id,c1.emp_name,c1.salary,c1.dept_id from cte as c join cte1 as c1 on c.dept_id=c1.dept_id where highest<=1 and lowest<=1


with cte as(

select *,dense_rank() over(partition by dept_id order by salary asc) as arn, dense_rank() over(partition by dept_id order by salary desc ) as drn from employee

)
select *,case when drn =1 then 'Top' else 'Bottom' end as top_bottom
from cte
where drn =1 or arn=1






select * from employe