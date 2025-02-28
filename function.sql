USE diversas_tabelas;

DELIMITER $
CREATE FUNCTION fn_BoasVindas(nome VARCHAR(100))
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
RETURN CONCAT('Bem Vindo ', nome, ', tudo bem?');
END $
DELIMITER ;

SELECT fn_BoasVindas('Juan') as 'Bom dia';


DELIMITER $
CREATE FUNCTION fn_faturamento(preco DECIMAL(10,2), quantidade INT)
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
	RETURN preco* quantidade;
END $
DELIMITER ;

SELECT fn_faturamento(133,7) AS 'Faturamento';

DELIMITER $

CREATE FUNCTION fn_removeacentos (texto VARCHAR(100))
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
	SET texto = REPLACE(texto, 'á', 'a'),
    texto = REPLACE(texto, 'à', 'a'),
    texto = REPLACE(texto, 'â', 'a'),
    texto = REPLACE(texto, 'ã', 'a'),
    texto = REPLACE(texto, 'ä', 'a'),
    texto = REPLACE(texto, 'é', 'e'),
    texto = REPLACE(texto, 'è', 'e'),
    texto = REPLACE(texto, 'ê', 'e'),
    texto = REPLACE(texto, 'ë', 'e'),
	texto = REPLACE(texto, 'í', 'i'),
    texto = REPLACE(texto, 'ì', 'i'),
    texto = REPLACE(texto, 'î', 'i'),
    texto = REPLACE(texto, 'ï', 'i'),
	texto = REPLACE(texto, 'ô', 'o'),
    texto = REPLACE(texto, 'ó', 'o'),
    texto = REPLACE(texto, 'ò', 'o'),
    texto = REPLACE(texto, 'ö', 'o'),
    texto = REPLACE(texto, 'ú', 'u'),
    texto = REPLACE(texto, 'ù', 'u'),
    texto = REPLACE(texto, 'û', 'u'),
    texto = REPLACE(texto, 'ü', 'u'),
    texto = REPLACE(texto, 'ç', 'c');
RETURN texto;
END $

DELIMITER ;

SELECT fn_removeacentos('à aliança da dicípula alemã') AS remove_acento;

SELECT fn_removeacentos('Olá, você está bem Müller') AS remove_acento;

SELECT fn_removeacentos('João entrou no ônibus com  carrinho de rolemã') AS remove_acento;

DELIMITER $

CREATE FUNCTION data_hoje()
RETURNS DATE
DETERMINISTIC
BEGIN
	RETURN CURDATE();
END $
DELIMITER ;

SELECT data_hoje();

DELIMITER $

CREATE FUNCTION data_mais_20_dias()
RETURNS DATE
DETERMINISTIC
BEGIN
	RETURN DATE_ADD(CURDATE(), INTERVAL 20 DAY);
END $
DELIMITER ;

DELIMITER $

CREATE FUNCTION data_mais_2_anos_5_meses_18_dias()
RETURNS DATE
DETERMINISTIC
BEGIN
	RETURN DATE_ADD(CURDATE(), INTERVAL 2 YEAR) + INTERVAL 5 MONTH + INTERVAL 18 DAY;
END $
DELIMITER ;

SELECT data_mais_2_anos_5_meses_18_dias();