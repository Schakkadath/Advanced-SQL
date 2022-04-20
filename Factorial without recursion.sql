create or replace function factorial(x integer)
returns integer as
$$

DECLARE 
 i integer;
 result integer;
BEGIN
	result :=1;
	for i IN 1..x
	loop 
		result := i * result;
	end loop;
return result;

END;

$$ language plpgsql;

select factorial(2)