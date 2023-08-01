-- QUESTION: Growth of Airbnb
/* Estimate the growth of Airbnb each year using the number of hosts registered as the growth metric.
The rate of growth is calculated by taking ((number of hosts registered in the current year - number of hosts registered in the previous year) / the number of hosts registered in the previous year) * 100.
Output the year, number of hosts in the current year, number of hosts in the previous year, and the rate of growth. Round the rate of growth to the nearest percent and order the result in the ascending order based on the year.
Assume that the dataset consists only of unique hosts, meaning there are no duplicate hosts listed.
*/

select YEAR(host_since) host_year,COUNT(1) as total_member,coalesce( cast(LAG(COUNT(1),1) over(order by year(host_since)) as varchar),' ') as last_year,
coalesce( cast(cast(round((COUNT(1)-LAG(COUNT(1),1) over(order by year(host_since)) )*1.0/LAG(COUNT(1),1) over(order by year(host_since))*100,2) as decimal(10)) as varchar),' ') as growth 
from airbnb_search_details
group by YEAR(host_since)


