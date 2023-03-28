create or replace function produtos_aleatorios(linhas integer) returns void AS

$$
declare
	counter integer := 0;
	texto varchar := 'produto';
	descr varchar := 'descricao';
	valor numeric := random()*1000 + 1;
	categoria int := (SELECT codigo FROM categoria ORDER BY codigo DESC LIMIT 1);
	
begin
	while counter < linhas loop
		categoria := random()*(1-categoria)+categoria;
		insert into produto(nome, valor, descricao, categoria) values(texto||counter, valor, descr||categoria||valor, categoria);
		counter := counter +1;
		valor := random()*1000 + 1;
	end loop;
end;
$$
language plpgsql;


create or replace function clientes_aleatorios(linhas integer) returns void AS

$$
declare
	counter integer := 0;
	texto varchar := 'cliente';
	cpf bigint := random()*(10000000000-99999999999)+99999999999;
	minv int := random()*(1-10)+10;
	maxv int := random()*(11-27)+27;
	email varchar := substring('abcdefghijklmknopqrstubwxyz' from minv for maxv) || '@email.com';
begin
	while counter < linhas loop
		insert into cliente(cpf, nome, email) values(cpf, texto||counter, email);
		counter := counter +1;
		cpf := random()*(10000000000-99999999999)+99999999999;
		email := substring('abcdefghijklmknopqrstubwxyz' from minv for maxv) ||'@email.com';
		minv := random()*(1-10)+10;
		maxv := random()*(11-27)+27;

	
	end loop;
end;
$$
language plpgsql;

create or replace function categorias_aleatorias(linhas integer) returns void AS

$$
declare
	counter integer := 0;
	texto varchar := 'categoria';
begin
	while counter < linhas loop
		insert into categoria(nome) values(texto||counter);
		counter := counter +1;
	end loop;
end;
$$
language plpgsql;



create or replace function pedidos_aleatorios(linhas integer) returns void AS

$$
declare
	counter integer := 0;
	texto varchar ;
	ultimo_produto integer := (SELECT codigo FROM produto ORDER BY codigo DESC LIMIT 1);
	ultimo_cliente integer := (SELECT codigo FROM cliente ORDER BY codigo DESC LIMIT 1);
	data_pedido date;
	data_entrega date;
	val money;
	endereco varchar(200);
begin
   while counter < linhas loop
	  counter := counter + 1;
	  
	  data_pedido := (SELECT current_date + round(random()*365)::int * '1 day'::interval AS data);
	  data_entrega := (SELECT data_pedido + round(random()*365)::int * '1 day'::interval AS data);
	  ultimo_produto := random()*(1-ultimo_produto)+ultimo_produto;
	  ultimo_cliente := random()*(1-ultimo_cliente)+ultimo_cliente;
	  endereco := 'rua' || counter || 'casa' || ultimo_produto;
	  texto  := (select nome from cliente where codigo = ultimo_cliente)||(select nome from produto where codigo = ultimo_produto);
	  val  := (select valor from produto where codigo = ultimo_produto);
	  insert into pedido(cod_produto, cod_cliente, valor, endereco, data_pedido, data_entrega) values(ultimo_produto, ultimo_cliente, val, endereco, data_pedido, data_entrega);
	  raise notice '%',texto;
   end loop;
   
end;
$$
language plpgsql;