--3- Crie uma tabela com a assinatura “usuario (id int, nome varchar(50))”. 
--Após inserir 5 tuplas, faça uma função capaz de retornar os nomes com id maiores que a média;

create or replace function id_maior()
returns table(texto varchar(50)) as $$
begin
    return query select nome from usuario where id > (select avg(id) from usuario);
end;
$$ LANGUAGE plpgsql;

select id_maior();