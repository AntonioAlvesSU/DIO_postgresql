select numero, nome, ativo from banco;
select banco_numero,numero, nome from agencia;
select id, nome from tipo_transacao ;
select banco_numero, agencia_numero, numero, cliente_numero from conta_corrente;
select banco_numero, agencia_numero,cliente_numero from cliente_transacoes;
-------------------------------------------------------------
select * from  information_schema.columns where table_name='banco';
select column_name,data_type from  information_schema.columns where table_name='banco';
select column_name,data_type from  information_schema.columns where table_name='cliente_transacoes';
------------------------------------------------------------------
--avg
--count (having)
--max
--min
--sum

select * from conta_corrente;
select avg (valor) from cliente_transacoes;

select* from cliente;
select count(numero) from cliente;

select count(numero),email from cliente 
where email ilike '%hotamil.com'
group by email;

select max (numero) from cliente;
select min (numero) from cliente;

select max (valor) from cliente_transacoes;
select min (valor) from cliente_transacoes;

select max (valor),tipo_transacao_id from cliente_transacoes
group by tipo_transacao_id;

select min (valor),tipo_transacao_id from cliente_transacoes
group by tipo_transacao_id;

select count(id), tipo_transacao_id from cliente_transacoes
group by tipo_transacao_id;

select count(id), tipo_transacao_id from cliente_transacoes
group by tipo_transacao_id
having count(id)>1;

select sum(valor), tipo_transacao_id from cliente_transacoes
group by tipo_transacao_id;

select sum(valor), tipo_transacao_id from cliente_transacoes
group by tipo_transacao_id
order by tipo_transacao_id asc ;

select sum(valor), tipo_transacao_id from cliente_transacoes
group by tipo_transacao_id
order by tipo_transacao_id desc ;













