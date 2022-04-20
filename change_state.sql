create or replace function state_change()
returns VOID as
$$
BEGIN
drop table foo;
create table foo (Letter text,
				 Num integer);
insert into foo values('a',1);
END;
$$ language plpgsql;

select state_change()

select * from foo