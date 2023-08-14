-- SELECT personID,name, (select sum(score) from s 

with cte as(
select p.*,f.friendID from person p
 join  friend f on p.personID=f.personID),

cte1 as(
SELECT c.personID,c.name,c.friendID,p.score
   from cte c
 join person p on c.friendID=p.personID),
 cte2 as(

 SELECT personID,name,sum(score) as score, count(friendID) as total_friend
  from cte1 
GROUP by personID,name)
select * from cte2
where score>=100