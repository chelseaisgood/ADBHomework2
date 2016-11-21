drop table if exists friend_temp;

create temporary table friend_temp as (select * from friend);

insert into friend_temp (select person2, person1 from friend);

select A.person2 as person1, A.person1 as person2, B.artist as artist
from friend_temp as A 
	inner join liketable as B on A.person1 = B.person 
	left outer join liketable as C on A.person2 = C.person and B.artist = C.artist
where C.person is null;
