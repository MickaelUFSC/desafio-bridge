

/* Cria os dados aleatorios*/
/*
select categorias_aleatorias(15);
select produtos_aleatorios(1000);
select clientes_aleatorios(1000);
select pedidos_aleatorios(1000);
*/

/*Retorna os produtos em ordem crescente de nome*/
/*
select nome, descricao, valor
from produto
order by nome;
*/

/* retorna o nome da categoria e o numero de produtos registrados com essa categoria*/
/*
select c.nome, count(p.codigo)
from categoria c join produto p on p.categoria = c.codigo
*/

/* retorna os pedidos ordenados por data decrescente */
/*
select p.data_pedido, p.endereco, sum(p.valor)
from pedido p
group by p.data_pedido, p.endereco
order by p.data_pedido DESC
*/

/* retorna os nomes e qualtidade de produtos registrados em pedidos  */
/*
select distinct prod.nome,prod.descricao, prod.valor, count(prod.codigo)
from pedido ped NATURAL JOIN produto prod
group by prod.nome, prod.descricao, prod.valor
order by nome
*/


/* retorna as entregas dos pedidos correspondente ao cliente com codigo 2 entre um intervalo de data*/
/*
select c.nome, p.data_entrega
from cliente c join pedido p on c.codigo = p.cod_cliente
where p.data_pedido between '2023-10-09' and '2024-02-12' and c.codigo = 2;
*/

/* conta os nomes repedidos e retorna ao lado do valor em ordem decrescente*/
/*
select nome, count(nome)
from cliente
group by nome
order by count(nome) DESC
*/