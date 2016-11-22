drop table if exists friend;

create table friend (
	person1 int,
    person2 int,
    index (person1),
    index (person2),
    index (person1, person2)
    );