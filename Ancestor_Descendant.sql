-- create table anc (a int, d int)

-- insert into anc  (select * from pc order by 1)

-- -- select * from anc order by 1

-- -- create table pc (p int, c int)
-- -- insert into pc values(1,2),(1,3),(1,4),(2,5),(2,6),(3,7),(4,8),(5,9),(9,12),(7,10),(7,11)

-- table pc
-- table anc
-- -- drop table anc



create or replace function new_ANC_pairs()
returns table (A integer, D integer) AS
$$
   (select A, c
    from   ANC JOIN PC ON D = p)
   except
   (select  A, D
    from    ANC);
$$ LANGUAGE SQL;

create or replace function Ancestor_Descendant()
returns void as $$
begin
   drop table if exists ANC;   
   create table ANC(A integer, D integer);
   
   insert into ANC select * from PC;
    
   while exists(select * from new_ANC_pairs()) 
   loop
        insert into ANC select * from new_ANC_pairs();
   end loop;
end;
$$ language plpgsql;

select * from anc order by 1

select Ancestor_Descendant()