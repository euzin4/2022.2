drop function asal();
create function asal() returns void as $$
begin
	update employee set salary = salary * 1.1;
end;
$$ language 'plpgsql';
