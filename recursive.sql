select numero, nome, ativo
from banco;
-----------------
create or replace view vw_bancos as (
	select numero, nome, ativo
	from banco
);

select numero, nome, ativo
from vw_bancos;
------------------------
create or replace view vw_bancos_2 (bancos_numero,banco_nome,banco_ativo) as(
	select numero,nome,ativo
	from banco
);

select bancos_numero,banco_nome,banco_ativo
from vw_bancos_2;
--------------------------------------
insert into vw_bancos_2(bancos_numero,banco_nome,banco_ativo)
values (51,'Banco Boa Ideia',true),
		(52,'Banc Good Ideia',true),
		(53,'Banco Ideia Boa',true);
		
select 	bancos_numero,banco_nome,banco_ativo
from  vw_bancos_2
where vw_bancos_2.bancos_numero between 51 and 53;
------------------------------------------------
update vw_bancos_2  set banco_ativo =FALSE
where vw_bancos_2.bancos_numero between 51 and 53; 
delete from  vw_bancos_2
where vw_bancos_2.bancos_numero between 51 and 53;
------------------------------
create or replace temporary view vw_agencia as (
	select nome from agencia
);

select nome 
from vw_agencia;
-----------------------------------------
create or replace view vw_bancos_ativos as (
	select numero, nome, ativo
	from banco
	where ativo is true
) with local check option;

insert into vw_bancos_ativos (numero, nome, ativo)
values (51,'Banco Boa Ideia1',true),
		(52,'Banc Good Ideia',true),
		(53,'Banco Ideia Boa',true);

insert into vw_bancos_ativos (numero, nome, ativo)
values (51,'Banco Boa Ideia1',false),
--ERROR:  syntax error at end of input
--LINE 2: values (51,'Banco Boa Ideia1',false),
________________________________

create or replace view vw_bancos_com_a as (
	select numero,nome,ativo
    from vw_bancos_ativos
	where nome ilike 'a%'
) with local check option;

select numero,nome,ativo from vw_bancos_com_a;

insert into vw_bancos_com_a (numero,nome,ativo)
values (54, 'Alfa Gama',true )

insert into vw_bancos_com_a (numero,nome,ativo)
values (55, 'Alfa Gima',false )
--ERROR:  new row violates check option for view "vw_bancos_ativos"
--DETAIL:  Failing row contains (55, Alfa Gima, f, 2021-07-13 10:52:33.77322

insert into vw_bancos_com_a (numero,nome,ativo)
values (55, 'Beta Gima',true );
--ERROR:  new row violates check option for view "vw_bancos_com_a"
--DETAIL:  Failing row contains (55, Beta Gima, t, 2021-07-13 10:53:38.33823).
----------------------------------------

create or replace view vw_bancos_ativos as (
	select numero, nome, ativo
	from banco
	where ativo is true
);

insert into vw_bancos_com_a (numero,nome,ativo)
values (55, 'Alfa Gima',false );

create or replace view vw_bancos_ativos as (
	select numero, nome, ativo
	from banco
	where ativo is true
) with cascaded check option;

insert into vw_bancos_com_a (numero,nome,ativo)
values (56, 'Alfa Beta Gama',false );

--ERROR:  new row violates check option for view "vw_bancos_ativos"
--DETAIL:  Failing row contains (56, Alfa Beta Gama, f, 2021-07-13 10:59:00.757878).
-------------------------------------------------------

create table if not exists funcionarios(
	id serial,
	nome varchar(50),
	gerente integer,
	primary key (id),
	foreign key (gerente) references funcionarios(id)
); 

insert into funcionarios(nome,gerente)
values ('Ancelmo',null),
		('Beatriz',1),
		('Magno',1),
		('Cremilda',2),
		('Wagner',4);
select id,nome,gerente
from funcionarios;

select id,nome,gerente 
from funcionarios where gerente is null
union all
select id,nome,gerente 
from funcionarios where id=999;
-----------------------------------------
create or replace recursive view vw_func(id,gerente,funcionario) as (
	select id,gerente, nome
	from funcionarios
	where gerente is null
	union all
	select funcionarios.id,funcionarios.gerente,funcionarios.nome 
	from funcionarios 
	join vw_func on vw_func.gerente = funcionarios.funcionario
		);
select id,gerente,funcionario
from vw_func;

create or replace recursive view vw_func(id,gerente,nome) as (
	select id,gerente,nome
	from funcionarios
	where gerente is null
	union all
	select funcionarios.id,funcionarios.nome ,funcionarios.gerente
	from funcionarios 
	join vw_func on vw_func.id = funcionarios.gerente
		);
select id,gerente,funcionario
from vw_func;
select * from funcionarios
select funcionarios.id,funcionarios.gerente 
	from funcionarios






