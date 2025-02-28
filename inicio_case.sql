USE diversas_tabelas;

SELECT
	*,
		CASE
			WHEN Sexo = 'M' THEN 'Masculino'
            ELSE 'Feminino'
		END AS 'Sexo 2'
FROM clientes;

SELECT
	*,
		CASE
			WHEN Receita_Venda >= 3000 THEN 'Faturamento alto'
            WHEN Receita_Venda >= 1000 THEN 'Faturamento Médio'
            ELSE 'Faturamento Baixo'
		END AS 'Receita_Venda 2'
FROM pedidos;

SELECT
	*,
		CASE
			WHEN Sexo = 'F' AND Qtd_Filhos > 0 THEN 'Receberá Oferta do dia das mães'
            WHEN Sexo = 'M' AND Qtd_Filhos > 0 THEN 'Receberá Oferta do dia dos pais'
            ELSE 'Não receberá oferta'
		END AS 'Oferta'
FROM clientes;

SELECT * FROM produtos;

SELECT
	*,
		CASE
			WHEN Marca_Produto = 'DELL' OR Marca_Produto = 'SAMSUNG' THEN 'Receberá 15% de desconto'
            ELSE 'Não receberá oferta'
		END AS 'Oferta'
FROM produtos;

SELECT
	*,
		CASE
			WHEN Marca_Produto = 'DELL' OR Marca_Produto = 'SAMSUNG' THEN Custo_Unit - Custo_Unit * 0.15
            ELSE 'Não haverá desconto'
		END AS 'Desconto'
FROM produtos;