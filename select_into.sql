create or replace function size_of_table()
returns integer as
$$
declare counter integer;

BEGIN
	select into counter count(*) from r;
	return counter;

END;

$$ LANGUAGE plpgsql;

select * from size_of_table()

-- 	return (select count(*) from r);
-- counter := (select count(*) from r);
-- 	return counter;
