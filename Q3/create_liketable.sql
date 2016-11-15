drop table liketable;

create table liketable (
	person INT,
    artist INT,
    index (person),
    index (artist),
    index (person, artist)
    );