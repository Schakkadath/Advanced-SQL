create table if not exists SG(m integer, n integer); 

create or replace function new_SG_pairs()
returns table (source integer, target integer) AS
$$

(select   t1.c as m, t2.c as n
 from     SG, PC t1, PC t2 
 where    SG.m=t1.p and SG.n = t2.p)
except
(select   *
 from     SG)
$$ language sql;

create or replace function sameGeneration()
returns table (m int, n int) as 
$$
begin
   drop table if exists SG;
   create table SG(m integer, n integer); 

   insert into SG select distinct t1.p as m, t1.p as n 
                  from   PC t1
                  where  not exists (select 1 from PC t2 where t2.c = t1.p);
				  

   while exists(select new_SG_pairs()) 
   loop
        insert into SG select * from new_SG_pairs();
   end loop;
   return query
          select * from SG order by 1,2;
end;
$$ language plpgsql;

-- table PC;

select * from sameGeneration();

-- table PC;
