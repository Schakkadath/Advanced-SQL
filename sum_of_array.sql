create or replace function sum_of_array(a int[])
returns int8 as
$$
declare 
	i integer;
	sum integer;
BEGIN
	sum := 0;
	foreach i in ARRAY a
	loop
		sum := sum + i;
	end loop;
return sum;
end;
$$ language plpgsql;


select sum_of_array('{1,2,3,9}')