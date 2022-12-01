-- aula 3 - práticas com SELECT

SELECT numero, nome, ativo FROM banco;

SELECT banco_numero, numero, nome FROM agencia;

SELECT numero, nome, email FROM cliente;

SELECT id, nome FROM tipo_transacao;

select banco_numero, agencia_numero, numero, cliente_numero FROM conta_corrente;

select banco_numero, agencia_numero, cliente_numero from cliente_transacoes;

select * from cliente_transacoes;

-- aula 3 - práticas com SELECT (2)

CREATE TABLE IF NOT EXISTS teste (
	id SERIAL PRIMARY KEY,
	nome VARCHAR (50) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS teste;

CREATE TABLE IF NOT EXISTS teste (
	cpf VARCHAR (11) NOT NULL PRIMARY KEY,
	nome VARCHAR (50) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO teste (cpf, nome, created_at)
VALUES ('22344566712', 'José Coméia', '2022-07-01  12:00:00');

INSERT INTO teste (cpf, nome, created_at)
VALUES ('22344566712', 'José Coméia', '2022-07-01  12:00:00')
ON CONFLICT (cpf) DO NOTHING;

UPDATE teste SET nome = 'Pedrinho' WHERE cpf = '22344566712';

SELECT * FROM teste;