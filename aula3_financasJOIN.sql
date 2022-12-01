-- Trabalhando com Join
SELECT numero, nome FROM banco;
SELECT banco_numero, numero, nome FROM agencia;
SELECT numero, nome FROM cliente;
SELECT banco_numero, agencia_numero, numero, digito, cliente_numero FROM conta_corrente;
SELECT id, nome FROM tipo_transacao;
SELECT banco_numero, agencia_numero, conta_corrente_numero, conta_corrente_digito, cliente_numero, valor FROM cliente_transacoes;

SELECT COUNT(1) FROM banco; -- 151
SELECT COUNT(1) FROM agencia; --296

--296
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT COUNT(banco.numero) FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT banco.numero FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero
GROUP BY banco.numero;
-- são 9 agências
SELECT COUNT( distinct banco.numero) FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
LEFT JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT agencia.numero, agencia.nome, banco.numero, banco.nome
FROM agencia
RIGHT JOIN banco ON banco.numero = agencia.banco_numero;

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
FULL JOIN agencia ON agencia.banco_numero = banco.numero;

CREATE TABLE IF NOT EXISTS teste_a (id serial primary key, valor varchar(10));
CREATE TABLE IF NOT EXISTS teste_b (id serial primary key, valor varchar(10));

insert into teste_a (valor) values ('teste1');
insert into teste_a (valor) values ('teste2');
insert into teste_a (valor) values ('teste3');
insert into teste_a (valor) values ('teste4');

insert into teste_b (valor) values ('teste_a');
insert into teste_b (valor) values ('teste_b');
insert into teste_b (valor) values ('teste_c');
insert into teste_b (valor) values ('teste_d');

SELECT tbla.valor, tblb.valor
FROM teste_a tbla
CROSS JOIN teste_b tblb;

DROP TABLE IF EXISTS teste_a;
DROP TABLE IF EXISTS teste_b;

SELECT 	banco.nome,
		agencia.nome, 
		conta_corrente.numero, 
		conta_corrente.digito, 
		cliente.nome
FROM banco 
JOIN agencia ON agencia.banco_numero = banco.numero
JOIN conta_corrente ON conta_corrente.banco_numero = banco.numero
JOIN cliente on cliente.numero = conta_corrente.cliente_numero;
