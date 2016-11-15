select A.person1 as person1, B.person1 as person2, L.artist as artist
from (select person1 as person1
		from question3.friend
		union
		select person2  as person1
		from question3.friend) as A,
	(select person1 as person1
		from question3.friend
		union
		select person2 as person1
		from question3.friend) as B,
	(select distinct artist
		from liketable) as L
where 
	
	(
		(A.person1, B.person1) in (select * from question3.friend)
		or
		(B.person1, A.person1) in (select * from question3.friend)
	)
	
	and 
	
	(B.person1, L.artist) in (select * from liketable)
	
	and
	
	(A.person1, L.artist) not in (select * from liketable)
LIMIT 0,1500000
#into outfile 'F:/wamp64/tmp/record.txt';