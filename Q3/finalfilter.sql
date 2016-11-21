CREATE TEMPORARY TABLE friend_temp SELECT * FROM friend;

INSERT INTO friend_temp SELECT person2, person1 FROM friend;

select A.person2 as person1, A.person1 as person2, B.artist as artist
from friend_temp as A 
	inner join liketable as B on A.person1 = B.person 
	left outer join liketable as C on A.person2 = C.person and B.artist = C.artist
where C.person is null;


SELECT
  a.person2 AS user,
  b.artist AS artist,
  a.person1 AS friend_who_likes_artist
FROM friends_sym a
INNER JOIN likes b
  ON a.person1 = b.person
LEFT OUTER JOIN likes c
  ON a.person2 = c.person AND b.artist = c.artist
WHERE c.person IS NULL;