set @varQuantidade = 10;

set @varPreco = 10.9;

SELECT (@varQuantidade * @varPreco) AS 'Receita Total';

SELECT ROUND(@varQuantidade * @varPreco, 2) AS 'Receita Total'; 

SELECT
IF (10 > 5, 'VERDADEIRO', 'FALSO') AS situação;

SELECT
IF (10 > 12, 'VERDADEIRO', 'FALSO') AS situação;

SET @varNotaDesempenho = 8.5;

SELECT
IF (@varNotaDesempenho >= 7, 0.1, 'Sem bônus') AS bonus;

SET @varNotaDesempenho = 5;

SELECT
IF (@varNotaDesempenho >= 7, 0.1, 'Sem bônus') AS bonus;

SET @varNotaDesempenho = 9;
SET @varNotaDesempenho = 6;
SET @varNotaDesempenho = 2;

SELECT
IF(@varNotaDesempenho >= 7, 'Recebe bônus de 10%',
IF(@varNotaDesempenho >= 5, 'Recebe bônus de 5%', 'Não recebe bônus')) AS RESULTADO;