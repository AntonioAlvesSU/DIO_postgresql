select numero, nome from banco;
select banco_numero, numero, nome from agencia;
select numero, nome from cleinte;
select banco_numero,agencia_numero, numero, digito,cliente_numero from conta_corrente;
select id, nome from tipo_trnasacao;
select banco_numero,agencia_numero,conta_corrente_numero, conta_corrente_digito, cliente_numero, valor from
cliente_transacoes;
---------------
select count(1) from banco;  --9
select count(1) from agencia; --8
------------------------
select banco.numero,banco.nome, agencia.numero, agencia.nome 
from banco
join agencia on agencia.banco_numero = banco.numero;
____________________________________

select banco.numero
from banco
join agencia on agencia.banco_numero = banco.numero
group by banco.numero;
----------------------------------------------
select count (distinct banco.numero)
from banco
join agencia on agencia.banco_numero = banco.numero;
---------------------------------
select banco.numero,banco.nome,agencia.numero,agencia.nome
from banco 
left join agencia on agencia.banco_numero = banco.numero;
___________________________________________________________
select agencia.numero,agencia.nome,banco.numero,banco.nome
from agencia
right join banco on banco.numero = agencia.banco_numero;
-------------------------------------------
select agencia.numero,agencia.nome,banco.numero,banco.nome
from agencia
left join banco on banco.numero = agencia.banco_numero;
________________________________________
select banco.numero,banco.nome,agencia.numero,agencia.nome
from banco
full join agencia on agencia.banco_numero = banco.numero;
-----------------------------------------
create table if not exists teste_a (id serial primary key , valor varchar(18));
create table if not exists teste_b (id serial primary key , valor varchar(18));
-----------------------------------------------------------
insert into teste_a(valor)
values ('teste1'),
	   ('teste2'),
	   ('teste3'),
	   ('teste4');
	  
insert into teste_b(valor)
values ('testea'),
	   ('testeb'),
	   ('testec'),
	   ('tested');
____________________________	   
select tbla.valor, tblb.valor
from teste_a tbla
cross join teste_b tblb;
_________________________________

select banco.nome,
	   agencia.nome,
	   conta_corrente.numero,
	   conta_corrente.digito,
	   cliente.nome
from banco
join agencia on agencia.banco_numero = banco.numero
join conta_corrente 
     --On conta_corrente.banco_numero = agencia.banco_numero
	 on conta_corrente.banco_numero = banco.numero
	 and conta_corrente.agencia_numero = agencia.numero
join cliente
     on cliente.numero = conta_corrente.cliente_numero;
_______________________________	 
	 select banco.nome,
	   agencia.nome,
	   conta_corrente.numero,
	   conta_corrente.digito,
	   cliente.nome,
	   cliente_transacoes,
	   tipo_transacao
from banco
join agencia on agencia.banco_numero = banco.numero
join conta_corrente 
     --On conta_corrente.banco_numero = agencia.banco_numero
	 on conta_corrente.banco_numero = banco.numero
	 and conta_corrente.agencia_numero = agencia.numero
join cliente
     on cliente.numero = conta_corrente.cliente_numero
join cliente_transacoes
     on cliente_transacoes.banco_numero = banco.numero
join tipo_transacao	 
     on tipo_transacao.id =  cliente_transacoes.tipo_transacao_id;
____________________________________

select * from tipo_transacao;
select * from cliente_transacoes;













