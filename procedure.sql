USE clientes;

DELIMITER $

CREATE PROCEDURE nome_senai()
BEGIN
SELECT 'ESCOLA SENAI' AS nome_escola;
END $

DELIMITER ;

CALL nome_senai();

DELIMITER $$

CREATE PROCEDURE soma(n1 INT, n2 INT)
BEGIN
SELECT n1 + n2 AS soma;
END $$

DELIMITER ;

CALL soma(20, 500);