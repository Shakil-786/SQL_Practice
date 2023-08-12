select * from events;

select gold, count(1) as no_of_gold from events  where events.gold not in (select silver from events UNION all  select bronze) group by gold;