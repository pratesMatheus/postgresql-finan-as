-- aula 4 - funções
create or replace function func_somar (INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER
--RETURNS NULL ON NULL INPUT
called on null INPUT
LANGUAGE SQL
AS $$
	SELECT coalesce($1, 0) + coalesce($2, 0);
$$

SELECT func_somar (1, null);

select coalesce (null, 'Daniel');

select coalesce (null, null, 'digital', 'Daniel');
--------------------------------------------------------------

CREATE OR REPLACE FUNCTION bancos_add 
(p_numero integer, p_nome varchar, p_ativo boolean)
returns integer
security invoker
language plpgsql
called on null input 
as $$
declare variavel_id integer;
begin

if p_numero is null or p_nome is null or p_ativo is null then
	return 0;
end if;

select into variavel_id numero 
from banco 
where numero = p_numero;

if variavel_id is null then
	insert into banco(numero, nome, ativo) 
	values (p_numero, p_nome, p_ativo);
else
	return variavel_id;
end if;

select into variavel_id numero 
from banco 
where numero = p_numero;

	return variavel_id;
end; $$;

select bancos_add (1, 'Banco novo', false);
select bancos_add (5432, 'Banco novo', false);

select bancos_add (5433, 'Banco novo em uma nova porta', true);

select numero, nome, ativo from banco where numero = 5432;
