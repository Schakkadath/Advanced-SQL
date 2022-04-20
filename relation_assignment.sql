create or replace function relation_assignment()
returns void as
$$
BEGIN
	create table if not exists ab (a int, b int);
	delete from ab;
	insert into ab values (1,2), (2,3),(3,4);
	update ab set a = a*a where b = 3; 

END;
$$ Language plpgsql;


select relation_assignment()

table ab