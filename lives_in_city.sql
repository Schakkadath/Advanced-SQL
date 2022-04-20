create or replace function lives_in_city(city text)
returns integer as
$$
declare 
	city text;
	p record;
	c integer;
BEGIN
	c := 0;
	for p in select * from person
	loop
		if p.city = lives_in_city.city then c = c+1;
		end if;
	end loop;
return c;
END;
$$ language plpgsql; 

-- select * from person
select lives_in_city('Cupertino')








