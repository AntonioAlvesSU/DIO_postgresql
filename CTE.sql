select numero,nome from banco;
select banco_numero,numero,nome from agencia;
---------------------
with tbl_tmp_banco as (
	select numero, nome
	from banco
	)
select numero, nome 
from tbl_tmp_banco;
------------------------
--CTE
with params as(
	select 213 as banco_numero),
	tbl_tmp_banco as(
	select numero,nome 
	from banco
	join params on params.banco_numero = banco.numero)
	select numero,nome
	from tbl_tmp_banco;
___________________________________________________
--sub-selects
select banco.numero, banco.nome
from banco
join(
   select 213 as banco_numero)
   params on params.banco_numero = banco.numero;
____________________________________________________   
	
	with clientes_e_transacoes as ( 
		select cliente.nome as cliente_nome,
		tipo_transacao.nome as tipo_transacao_nome,
	    cliente_transacoes.valor as tipo_transacao_valor
	    from cliente_transacoes
	join cliente on cliente.numero = cliente_transacoes.cliente_numero
	join tipo_transacao on tipo_transacao.id = cliente_transacoes.tipo_transacao_id
	)
	select cliente_nome, tipo_transacao_nome, tipo_transacao_valor
	from clientes_e_transacoes;
-------------------------------------------------------	
	
	with clientes_e_transacoes as ( 
		select cliente.nome as cliente_nome,
		tipo_transacao.nome as tipo_transacao_nome,
	    cliente_transacoes.valor as tipo_transacao_valor
	from cliente_transacoes
	join cliente on cliente.numero = cliente_transacoes.cliente_numero
	join tipo_transacao on tipo_transacao.id = cliente_transacoes.tipo_transacao_id
	join banco on banco.numero = cliente_transacoes.banco_numero
	and banco.nome ilike '%Ita%'	 
	)
	select cliente_nome, tipo_transacao_nome, tipo_transacao_valor
	from clientes_e_transacoes;
____________________________
with contas_clientes_valor as (
	select conta_corrente.numero as conta_numero,
	tipo_transacao.nome as transacao_nome,
	cliente_transacoes.valor as transacao_valor
from cliente_transacoes
join conta_corrente on conta_corrente.banco_numero = cliente_transacoes.banco_numero
join tipo_transacao on tipo_transacao.id = cliente_transacoes.tipo_transacao_id
)
select conta_numero,transacao_nome,transacao_valor
from contas_clientes_valor;
___________________________________

	
	
	
	
	
	
	
	
	