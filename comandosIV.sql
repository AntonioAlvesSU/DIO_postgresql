select numero, nome, ativo from banco;
select banco_numero,numero, nome from agencia;
select id, nome from tipo_transacao ;
select banco_numero, agencia_numero, numero, cliente_numero from conta_corrente;
select banco_numero, agencia_numero,cliente_numero from cliente_transacoes;
select * from teste;
___________________
create table if not exists teste (
	id serial primary key,
	nome varchar(58) not null,
	created_at timestamp not null default current_timestamp
);
drop table if exists teste;

create table if not exists teste (
	cpf varchar(11) not null,
	nome varchar(50) not null,
	created_at timestamp not null default current_timestamp,
	primary key (cpf)
);

insert into teste( cpf,nome)
values
('8316631688','Antonio Alves')

insert into teste( cpf,nome)
values
('8316631688','Antonio Alves') on conflict (cpf) do nothing;

update teste set nome='Antonio Miguel' where cpf='8316631688';



