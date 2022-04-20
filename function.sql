CREATE OR REPLACE FUNCTION functionName (parameters type)
returns return type as
$$
	<label>
	DECLARE <ddeclarations>
	BEGIN
		sequence of statements;
	END
	<label>;
$$ language plpgsql;