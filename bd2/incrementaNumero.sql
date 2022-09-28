--1-Crie uma função capaz de incrementar um dado número;

create or replace function incrementa(a int)
returns void as $$
declare 
	temp int;
begin
	temp = a+1;
	raise notice 'valor + 1 = %',temp;
end;
$$ language 'plpgsql';

select incrementa(1);