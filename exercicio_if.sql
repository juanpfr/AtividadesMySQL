USE diversas_tabelas;

SELECT * FROM lojas;

SELECT
	*,
    IF(Num_Funcionarios >= 20, 'Recebe reforma', 'Não recebe reforma') AS 'Status' FROM lojas;
    
SELECT
	IFNULL(NULL, 'Valor alternativo') AS tipo;
    
SELECT
	IFNULL(100, 'Valor alternativo') AS tipo;
    
SELECT
	*,
    IFNULL(Telefone, '0800-999-9999') AS 'Telefone corrigido'
FROM lojas;

SELECT * FROM clientes;

SELECT
	*,
    ISNULL(Telefone) AS 'Check'
FROM clientes;

SELECT
	*,
    IF(ISNULL(Telefone), 'Verificar', 'Ok') AS 'Status'
FROM clientes;

SET @var1 = 100;

SET @var2 = 100;

SELECT
	NULLIF(@var1 ,@var2) AS Tipo;
    
SET @var1 = 50;

SET @var2 = 500;

SELECT
	NULLIF(@var1, @var2) AS Tipo;

SET @nota = 9;

SELECT
IF(@nota >= 6, 'Aprovado', 'Reprovado') AS 'Nota';

SET @nota = 9;

SELECT
	IF(@nota >= 6, 'Aprovado',
	IF(@nota BETWEEN 4 AND 5, 'Recuperação', 'Reprovado')) AS 'Nota';

SET @preco = 100000;

SELECT
	IF(@preco >= 40000, 'Luxo',
    IF(@preco >= 10000, 'Econômico', 'Básico')) AS Preco;


