
SELECT * from employee_checkin_details1;

SELECT * from  employee_details ;

--employeeid ,employee_default_phone_number, totalentry,totallogin,totallogout,latestlogin,latestlogout

with cte as(
SELECT employeeid,count(entry_details) as totallogin,
max(timestamp_details) as latestlogin
 from employee_checkin_details1
where entry_details='login'
GROUP by employeeid
),
cte1 as(
SELECT employeeid,count(entry_details) as totallogout,
max(timestamp_details) as latestlogout
 from employee_checkin_details1
where entry_details='logout'
GROUP by employeeid
)
SELECT c.*,c1.totallogout,c1.latestlogout,totallogin+totallogout as totalentry,
coalesce( cast(d.phone_number as varchar),' ') as phone_number
 from cte c
 join  cte1 c1 on c.employeeid=c1.employeeid
 left join employee_details d on c.employeeid=d.employeeid and isdefault = 'true'





 SELECT d1.employeeid, count(d1.employeeid) as total_entry,
count(case when entry_details='login' then entry_details else null end) as totallogin,
count(case when entry_details='logout' then entry_details else null end) as totallogout,
max(case when entry_details='login' then timestamp_details else null end) as latestlogin,
max(case when entry_details='logout' then timestamp_details else null end) as latestlogout,

coalesce(cast (d.phone_number as varchar),'') as phone_number

from employee_checkin_details1 d1
left join employee_details d on d1.employeeid=d.employeeid and isdefault='true'
GROUP by d1.employeeid,d.phone_number







select * from employee_details1
