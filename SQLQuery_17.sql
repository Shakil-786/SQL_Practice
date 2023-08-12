--wihtout windows function
with cte as(
SELECT dept_id, max(salary) mx
 FROM employee
 GROUP BY dept_id
)
SELECT e.*,c.mx from cte c 
join employee e on c.dept_id=e.dept_id
WHERE salary=mx 
ORDER by salary desc;



--with windows fuction


with cte as(
 
SELECT *,rank() over (PARTITION by dept_id order by salary desc) as rn
from employee

)
SELECT * from cte 
WHERE rn=1;



with cte as(

SELECT * FROM family f 
where type='Adult'),

cte1 as(
select *  from family f2 
where type='Child')

SELECT * from cte c
left join cte1 c1 on right(c.person,1)=right(c1.person,1);

