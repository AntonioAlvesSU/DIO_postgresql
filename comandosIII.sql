CREATE TABLE IF NOT EXISTS banco (
    numero INTEGER NOT null,
	nome VARCHAR(50) NOT null,
	ativo BOOLEAN NOT null DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (numero)
);
Insert into banco
  (numero,nome) 
  values
 (335,'Banco Digio S.A.'),
 (260,'Nu Pagamentos S.A'),
 (290,'PagSeguro Internet S.A.'),
 (323,'Mercado Pago – Conta Mercado Livre'),
 (637,'Banco Sofisa S.A (Sofisa Direto)'),
 (077,'Banco Inter S.A.'),
 (341,'Itaú Unibanco S.A.'),
 (104,'Caixa Econômica Federal (CEF)');

CREATE TABLE IF NOT EXISTS agencia (
	banco_numero INTEGER NOT NULL,
	numero INTEGER NOT NULL,
	nome VARCHAR(80) NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (banco_numero,numero),
	FOREIGN KEY (banco_numero) REFERENCES banco(numero)
	);
	Insert into agencia
  (banco_numero,numero,nome) 
  values
 (335,1,'AG_Centro_Banco Digio S.A.'),
 (260,2,'AG_Internete_Nu Pagamentos S.A'),
 (290,3,'AG_Internete_PagSeguro Internet S.A.'),
 (323,4,'AG_Internete_Mercado Pago – Conta Mercado Livre'),
 (637,5,'AG_FLORAMAR_Banco Sofisa S.A (Sofisa Direto)'),
 (077,6,'AG_TUPI_Banco Inter S.A.'),
 (341,7,'AG_GUARANI_Itaú Unibanco S.A.'),
 (104,8,'AG_PLANALTO_Caixa Econômica Federal (CEF)');
 
 select * from agencia;
	
	CREATE TABLE cliente (
		numero BIGSERIAL PRIMARY KEY,
		nome VARCHAR(120) NOT NULL,
		email VARCHAR(250) NOT NULL,
		data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
		);
		
		Insert into cliente
  (numero,nome,email) 
  values
 (1,'Antonio','aalves_su@hotamil.com'),
 (2,'Pedro','pedro@hotamil.com'),
 (3,'Augusto','augusto@hotamil.com'),
 (4,'Marcio','marcio@hotamil.com'),
 (5,'Osvalvo','osvalvou@hotamil.com'),
 (6,'Sueli','sueli@hotamil.com'),
 (7,'Italo','italo@hotamil.com'),
 (8,'Eduarda','eduarda@hotamil.com');
 
 select * from cliente;
 
	CREATE TABLE conta_corrente(
		banco_numero INTEGER NOT NULL,
		agencia_numero INTEGER NOT NULL,
		numero BIGINT NOT NULL,
		digito SMALLINT NOT NULL,
		cliente_numero BIGINT NOT NULL,
		ativo BOOLEAN NOT NULL DEFAULT TRUE,
		data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
		PRIMARY KEY (banco_numero,agencia_numero,numero,digito,cliente_numero),
		FOREIGN KEY (banco_numero,agencia_numero) REFERENCES agencia(banco_numero, numero),
		FOREIGN KEY (cliente_numero) REFERENCES cliente (numero)
		);
		
		Insert into conta_corrente
  (banco_numero,agencia_numero,numero,digito,cliente_numero) 
  values
 (335,1,37471392,1,1),
 (260,2,0664403,1,2),
 (290,3,60217764,6,3),
 (323,4,138513,5,4),
 (637,5,09302,6,5),
 (077,6,53869208,2,6),
 (341,7,59138,2,7),
 (104,8,14981,0,8);
 
 select * from conta_corrente;
 
	CREATE TABLE tipo_transacao(
		id SMALLSERIAL PRIMARY KEY,
		nome VARCHAR(50) NOT NULL,
		ativo BOOLEAN NOT NULL DEFAULT TRUE,
		data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
	CREATE TABLE tipo_transacao(
		);	
		
		Insert into tipo_transacao
  (nome) 
  values
 ('Cartões'),
 ('Transferências Bancárias'),
 ('Documento de Ordem de Crédito (DOC)'),
 ('Transferência Eletrônica Disponível (TED)'),
 ('Boletos'),
 ('Voucher'),
 ('Duplicatas'),
 ('Emprestimos');
		
		select * from tipo_transacao;
		
	CREATE TABLE cliente_transacoes(
		id BIGSERIAL PRIMARY KEY,
		banco_numero INTEGER NOT NULL,
		agencia_numero INTEGER NOT NULL,
		conta_corrente_numero BIGINT NOT NULL,
		conta_corrente_digito SMALLINT NOT NULL,
		cliente_numero BIGINT NOT NULL,
		tipo_transacao_id SMALLINT NOT NULL,
		valor NUMERIC(15,2) NOT NULL,
		data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
		FOREIGN KEY (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero) REFERENCES conta_corrente(banco_numero,agencia_numero,numero,digito,cliente_numero)
		);	
		Insert into cliente_transacoes
  (banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) 
  values
 (335,1,37471392,1,1,1,1050),
 (260,2,0664403,1,2,2,650),
 (290,3,60217764,6,3,3,1000000),
 (323,4,138513,5,4,4,9555),
 (637,5,09302,6,5,5,675.55),
 (077,6,53869208,2,6,6,900000),
 (341,7,59138,2,7,7,845),
 (104,8,14981,0,8,8,90000);
		select * from cliente_transacoes;

 
 
	