select pessoa.nome, pessoa.email, pessoa.telefone from pessoa
inner join cliente
on pessoa.id_pessoa = cliente.id_cliente;

select * from pessoa inner join cliente
on pessoa.id_pessoa = cliente.id_cliente;

select pessoa.nome, pessoa.email, pessoa.telefone from pessoa left join cliente
on pessoa.id_pessoa = cliente.id_cliente;

select pessoa.nome, pessoa.email, pessoa.telefone from pessoa right join cliente
on pessoa.id_pessoa = cliente.id_cliente;

select pessoa.nome, pessoa.email, pessoa.telefone from pessoa cross join cliente;