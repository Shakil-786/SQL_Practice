select * from emp

--write an sql query to extract emp_name with there manager name means need two column empname and manager name

SELECT e1.emp_name as employees, e2.emp_name as managers,
       e1.salary as employees_salary, e2.salary as managers_salary,
       e1.emp_age as emp_age, e2.emp_age as managers_age
from emp as e1 
join emp as e2 
on 
   e1.manager_id=e2.emp_id
where 
   e1.salary>e2.salary 
AND 
   e1.emp_age>e2.emp_age



select * from emp;



SELECT e1.emp_name as employee, e2.emp_name as manager from emp as e1 join emp as e2 on e1.emp_id=e2.manager_id;

with cte1 as(
select  dep_name,  AVG(salary) as salary from emp group by dep_name),
cte2 as(
SELECT  c1.dep_name,c1.salary,avg(c2.salary) as office_salary from cte1 as c1 join cte1 as c2 on c1.dep_name!=c2.dep_name GROUP by c1.dep_name,c1.salary)
SELECT * from cte2 where salary>=office_salary;
