create or replace function if_sample(x float)
returns text as
$$

BEGIN
	if x = 0 then return 'f';
	else
	if x = 1 then return 't';
	else return 'Invalid';
	end if;
	end if;
end;
$$ language plpgsql;

select if_sample(100)
	