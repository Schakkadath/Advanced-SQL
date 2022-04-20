create or replace function case_sample (day text)
returns integer as
$$
BEGIN
	case when day = 'Sunday' then return 1;
		 when day = 'Monday' then return 2;
		 when day = 'Tuesday' then return 3;
		 when day = 'Wednesday' then return 4;
		 when day = 'Thursday' then return 5;
		 when day = 'Friday' then return 6;
		 when day = 'Saturday' then return 7;
		 else return 0;
	END CASE;
END;
$$ language plpgsql;


select case_sample('bday')