select * from credit_card_transcations

        with cte as(
        select city,sum(amount) as city_spend
        from credit_card_transcations
        group by city)
        , cte1 as(select sum(cast (amount as bigint)) total_spend from credit_card_transcations),
        cte2 as(
        select c.*,c1.*
        from cte c join cte1 c1 on 1=1)
        select top 5 city, city_spend, CAST(ROUND(city_spend * 1.0 / total_spend * 100, 2) AS DECIMAL(10, 2)) as 'percent-contribution'
 
        from cte2
        order by [percent-contribution] desc




with cte as(

        select city, sum(amount) as city_total from credit_card_transcations group by city ),
        cte1 as(
        SELECT sum(cast(city_total as bigint)) as total from cte ),
        cte2 as(
        SELECT c.*,c1.* from cte as c join cte1 as c1 on 1=1),
        cte3 as(
        SELECT *,round(city_total*1.0/total*100 , 2) as contri from cte2 ),cte4 as(
        SELECT *,DENSE_RANK() over (order by city_total desc) as rank from cte3)
        select * from cte4 WHERE rank<=5



-- write a query to print highest spend month and amount  spend in that month for each type of card

