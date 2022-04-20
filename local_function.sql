create or replace function global_function()
returns void as
$glob$
	BEGIN
		CREATE OR REPLACE FUNCTION local_function()
		returns integer as
			$loc$
				SELECT 4;
				;
			$loc$ language sql;
	END;
$glob$ LANGUAGE plpgsql;



  
select global_function();