create or replace function select_from_r()
returns integer as
$$
DECLARE
a integer;
BEGIN
select into a r.k from (select k from r order by random())r;
return a;

END;

$$ language plpgsql;


select select_from_r()