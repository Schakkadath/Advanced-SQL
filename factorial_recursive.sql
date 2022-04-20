create or replace function factorial_recursive(n integer)
returns integer as
$$
BEGIN
	if n <=0 then return 1;
	else return n * factorial_recursive(n-1);
	end if;
END;

$$ language plpgsql;

select factorial_recursive(3)