create or replace function find_root_node()
returns integer as
$$
declare
node integer;
BEGIN
	select into node distinct p from pc where p not in (select c from pc);
	return node;
END;
$$ language plpgsql;


select * from find_root_node();