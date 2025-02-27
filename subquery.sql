USE diversas_tabelas;

SELECT * FROM pedidos;

SELECT * FROM lojas;

SELECT * FROM pedidos
WHERE ID_Loja = 3;

SELECT ID_Loja FROM lojas WHERE Gerente = 'Pedro Martins';

SET @varNomeGerente = 'Pedro Martins';

SET @varNomeGerente = 'Amanda Lima';

SET @varNomeGerente = 'Carlos Henrique';

SELECT * FROM pedidos WHERE ID_Loja = (SELECT ID_Loja FROM lojas WHERE gerente = @varNomeGerente);

SELECT AVG(Preco_Unit) FROM pedidos;

SELECT * FROM produtos WHERE Preco_Unit > 1793.8806;

SELECT * FROM produtos WHERE Preco_Unit > (SELECT AVG(Preco_Unit) FROM produtos);

SELECT * FROM categorias;

SELECT id_categoria FROM categorias WHERE categoria = 'Notebook';

SELECT * FROM produtos WHERE id_categoria = (SELECT id_categoria FROM categorias WHERE categoria = 'Notebook');

SELECT * FROM produtos WHERE marca_produto = 'Dell';

SELECT id_produto FROM produtos WHERE marca_produto = 'Dell';

SELECT * FROM pedidos WHERE id_produto IN (SELECT id_produto FROM produtos WHERE marca_produto = 'Dell');

SELECT CONCAT('R$', REPLACE(FORMAT(SUM(receita_venda), 2), ',', '.')) AS 'Receita Marca DELL' FROM pedidos
WHERE id_produto IN(SELECT id_produto FROM produtos WHERE marca_produto = 'DELL');
 
SELECT CONCAT('R$', FORMAT(SUM(receita_venda), 2, 'de DE')) AS 'Receita Marca DELL' FROM pedidos
WHERE id_produto IN(SELECT id_produto FROM produtos WHERE marca_produto = 'DELL');