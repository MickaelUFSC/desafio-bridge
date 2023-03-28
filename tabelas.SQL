Create table cliente
(
	codigo serial not null,
	cpf bigint not null,
	nome varchar(50),
	email varchar(50),
	primary key(codigo)
);
Create table categoria
(
	codigo serial not null,
	nome varchar(50),
	primary key(codigo)
);
Create table produto
(
	codigo serial not null,
	nome varchar(50),
	valor money not null,
	descricao varchar(100),
	categoria integer not null,
	primary key(codigo),
	foreign key(categoria) references categoria(codigo)
);

Create table pedido
(
	cod_produto integer not null,
	cod_cliente integer not null,
	valor money not null,
	endereco varchar(200),
	data_pedido date not null,
	data_entrega date not null,
	foreign key(cod_produto) references produto(codigo),
	foreign key(cod_cliente) references cliente(codigo),
	primary key(cod_produto, cod_cliente, data_pedido, data_entrega)
);