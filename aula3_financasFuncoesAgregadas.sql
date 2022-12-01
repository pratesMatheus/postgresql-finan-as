-- aula 3 1.4 - funções agregadas

SELECT numero, nome FROM banco;
SELECT banco_numero, numero, nome FROM agencia;
SELECT numero, nome, email FROM clinete;
SELECT banco_numero, agencia_numero, cliente_numero FROM cliente_transacoes;

SELECT * FROM conta_corrente;

-- ese é um catálogo do BD que mostra todas as colunas que tem numa determinada tabela
SELECT * FROM information_schema.columns WHERE table_name = 'banco';
-- nesse caso, retorna o nome do campo da tabela + o tipo de dado
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'banco';

-- AVG
select avg (valor) from cliente_transacoes;
-- COUNT (+ opção: HAVING)
SELECT COUNT (numero) FROM cliente;

SELECT COUNT (numero), email FROM cliente WHERE email ILIKE '%gmail.com' GROUP BY email;

SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'cliente_transacoes';

SELECT COUNT(id), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id;
-- MAX
SELECT MAX (valor) FROM cliente_transacoes;

SELECT MAX (valor) tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id HAVING COUNT (id) > 150;
-- MIN
SELECT MIN (numero) FROM cliente;
SELECT MIN (valor) FROM cliente_transacoes;

SELECT MIN (valor) tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id;
-- SUM
SELECT SUM (valor) FROM cliente_transacoes;

select sum (valor), tipo_transacao_id from cliente_transacoes group by tipo_transacao_id order by tipo_transacao_id asc;

select sum (valor), tipo_transacao_id from cliente_transacoes group by tipo_transacao_id order by tipo_transacao_id desc;


