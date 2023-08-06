/* There are 10 IPL team. write an sql query such that each team play with every other team just once. */


SELECT t1.team_name,t2.team_name FROM teams T1
inner JOIN teams t2 ON t2.team_code<>t1.team_code
where t2.team_name>t1.team_name
order by t1.team_name 