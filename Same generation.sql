
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

create or replace function new_node_pairs(step integer)
returns table (source integer, target integer, distance integer) AS
$$

(select  node_distance.m as m, pc.c as n, step as d
 from     node_distance, PC 
 where    node_distance.n = PC.p)
except
(select   m,n, step
 from     node_distance)

$$ language sql;


create or replace function node_distance_calculator()
returns table (m int, n int, d int) as
$$
declare step integer;

begin
	drop table if exists node_distance;
	create table node_distance (m integer, n integer, d integer);
	insert into node_distance (select distinct p,p, 0 from pc union select distinct c,c, 0 from pc);
	insert into node_distance select p, c, 1 from pc;
	step := 2;
	while exists(select new_node_pairs(step)) 
    loop
        insert into node_distance select * from new_node_pairs(step);
		step := step + 1;
   end loop;
      return query
          select * from node_distance order by 3, 1, 2;
end;
$$ language plpgsql;


-- select * from node_distance_calculator();

create or replace function sameGeneration()
returns  table (m int, n int) as
$$
BEGIN
return query
select nd1.n as m, nd2.n from node_distance_calculator() nd1, node_distance_calculator() nd2
where nd1.m = find_root_node() and nd2.m = find_root_node() and nd1.d = nd2.d order by 1,2;
END;
$$ language plpgsql;

select * from sameGeneration();


