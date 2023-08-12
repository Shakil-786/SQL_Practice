SELECT * from [dbo].[int_orders] ;

with cte as(
select salesperson_id,order_date, SUM(amount) as total from [dbo].[int_orders] GROUP  by salesperson_id,order_date)

select *,case when total>=100 then ((cast((total-100) as float)/100)*10)+20 else (cast(total as float)/100)*20 end as amm from cte;

with cte as(
    select *,row_number() over(partition by salesperson_id order by salesperson_id) as rn from [dbo].[int_orders] 
)
-- Select salesperson_id  from cte where rn>1
select * from cte;


select * from cte1
select salesperson_id,total, case when amm>100 then ((cast(amm as float)/100)*10)+20 else  end as ammount_dedected from cte1

--no of match played and win percentage;

select * from icc_world_cup;

with cte as(
select team_1 as team ,case when team_1=winner then 1 else 0 end as win from icc_world_cup  UNION all select team_2 as team,case when team_2=winner then 1 else 0 end as win from icc_world_cup),
cte1 as(
select team, sum(win) as total_win,COUNT(*) as match from cte  GROUP by team )
select *,match-total_win as loss,(cast(total_win as float)/match)*100.0 as win_percent from cte1;





with cte1 as(
select winner, count(winner) as win from icc_world_cup group by  winner),

cte as (
select  Team_1 from icc_world_cup  UNION all select Team_2 from icc_world_cup),
-- SELECT * from cte1;
cte2 as(
select team_1,COUNT(*) as total from cte GROUP by team_1)
select * from cte2
-- select * from cte1 as c1 join cte2 as c2 on c1.winner=c2.team_1;