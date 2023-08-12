select * from emp

select e1.emp_name as employees_name,e2.emp_name as m_name, e3.emp_name as skip_manager, e4.emp_name as head1, e5.emp_name as head2
from emp as e1 
JOIN emp e2 on e1.manager_id=e2.emp_id 
join emp as e3 on e2.manager_id=e3.emp_id 
join emp as e4 on e3.manager_id= e4.emp_id
join emp as e5 on e4.manager_id=e5.emp_id


with cte as(
select dep_name ,AVG(salary) as avg_salary
from emp group BY dep_name),
cte1 as (
select *, rank() over(order by avg_salary desc ) as rn 
from cte)
SELECT * from cte1 where rn<=2

-- write an sql query to fetch depert wise avg salary where salry > avg 

select * from emp;


with cte as(
select *,avg(salary) over(PARTITION by dep_name) as avg_sal 
from emp)
select * from cte where salary>avg_sal;

with cte as(
select dep_name,avg(salary) sal from emp
group by dep_name)
select e.*,c.*
From cte c JOIN
emp e on e.dep_name=c.dep_name
where e.salary>c.sal;
