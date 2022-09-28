--2-Crie uma função capaz de retornar um texto passado por argumento;

create or replace function texto(a varchar(50))
returns void as $$
begin
	raise notice '%',a;
end;
$$ language 'plpgsql';

select texto('algo');
