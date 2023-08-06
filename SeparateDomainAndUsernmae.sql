with cte as(
select  *,lead(value,1) over(partition by EmailAddress order by (select null)) as domain
 FROM Emails
cross apply string_split(EmailAddress,'@')
)
select EmailAddress, value as username,domain
 from cte 
 where domain is not null


SELECT *, 
LEFT(EmailAddress,charindex('@',EmailAddress)-1) as username,
RIGHT(EmailAddress,len(EmailAddress)-charindex('@',EmailAddress)) as domain
from Emails

