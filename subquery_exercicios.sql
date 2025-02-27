USE diversas_tabelas;

SET @categoriaSubQuery = 'microfone';

SELECT * FROM produtos
WHERE id_categoria = (select id_categoria FROM categorias
WHERE categoria = @categoriaSubQuery);

SELECT min(custo_venda) as 'Custo mínimo', max(custo_venda) as 'Custo máximo', 
avg(custo_venda) as 'Custo médio' FROM (SELECT id_produto, Count(*) as 'QTD_VENDAS' FROM pedidos
GROUP BY id_produto
ORDER BY qtd_vendas) as V;

SELECT id_cliente, SUM(receita_venda) FROM pedidos
GROUP BY id_cliente
ORDER BY SUM(receita_venda) DESC;

SELECT id_cliente, SUM(receita_venda) FROM pedidos
GROUP BY id_cliente
ORDER BY SUM(receita_venda) DESC
LIMIT 1;

SELECT id_cliente FROM pedidos
GROUP BY id_cliente
ORDER BY SUM(receita_venda) DESC
LIMIT 1;

SELECT * FROM clientes WHERE id_cliente = (SELECT id_cliente FROM pedidos
GROUP BY id_cliente
ORDER BY SUM(receita_venda) DESC
LIMIT 1);

SELECT * FROM locais;

SELECT cidade FROM locais WHERE região = 'Sudeste';

SELECT * FROM lojas WHERE loja IN (SELECT cidade FROM locais WHERE região = 'Sudeste');

SELECT id_loja FROM lojas WHERE loja IN (SELECT cidade FROM locais WHERE região = 'Sudeste');

SELECT * FROM pedidos WHERE id_loja IN (SELECT id_loja FROM lojas WHERE loja in (SELECT cidade FROM locais WHERE região = 'Sudeste'));