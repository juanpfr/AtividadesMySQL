set @vencimento = "10/03/2023";

SELECT
	IF(@vencimento >= "10/06/2023", 'Passou da validade', 'Está na validade') AS validade;

SELECT
	ID_Cliente, Nome, Estado_Civil, Renda_Anual,
		CASE
			WHEN Renda_anual > 80000 THEN 'Bônus 0.07'
            WHEN Renda_anual >= 60000 THEN 'Bônus 0.1'
            WHEN Renda_anual >= 40000 THEN 'Bônus 0.15'
            ELSE 'Bônus 0.2'
		END AS 'Bônus'
FROM clientes;

SELECT
	*,
		CASE
			WHEN Renda_Anual >= 0 THEN 'Bônus de 10%'
            ELSE 'Não haverá bônus'
		END AS 'Bônus'
FROM clientes;

SELECT
	*,
		CASE
			WHEN Renda_Anual >= 0 THEN Renda_Anual + Renda_Anual * 0.1
            ELSE 'Não haverá bônus'
		END AS 'Bônus'
FROM clientes;