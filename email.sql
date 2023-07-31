
/* Find the number of emails received by each user under each built-in email label.
 The email labels are: 'Promotion', 'Social', and 'Shopping'. Output the user along with the number of promotion, social, and shopping mails count,.
*/


  -- SELECT * from google_gmail_emails;
  -- SELECT * from google_gmail_labels;

with cte as(

SELECT ge.id,ge.to_user,
case when label='Promotion' then 1 else 0 end as promotion,
case when label='Social' then 1 else 0 end as social,
case when label='Shopping' then 1 else 0 end as shopping
 from google_gmail_emails ge

INNER JOIN google_gmail_labels gl on gl.email_id=ge.id)

SELECT to_user as user_name,sum(promotion)  as promotion,sum(social)  as social,sum(shopping)  as shoping from cte
GROUP BY to_user


