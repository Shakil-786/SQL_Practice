SELECT comment as meaningFull_comments
 FROM comments
 WHERE translation is null
UNION ALL
SELECT translation as meaningFull_comments
 FROM comments
 where translation is not NULL