USE diversas_tabelas;

DELIMITER $
CREATE PROCEDURE contadorW(limite INT)
BEGIN
	DECLARE x INT DEFAULT 0;
    WHILE x < limite DO
    SELECT x;
    SET x = x + 1;
    END WHILE;
END $
DELIMITER ;

CALL contadorW(10);

DELIMITER $
CREATE PROCEDURE acumulaW(limite INT)
BEGIN
	DECLARE contador INT DEFAULT 0;
    DECLARE soma INT DEFAULT 0;
    WHILE contador < limite DO
		SET contador = contador + 1;
		SET soma = soma + contador;
	END WHILE;
    SELECT soma;
END $
DELIMITER ;

CALL acumulaW(15);

DELIMITER $
CREATE PROCEDURE acumulaWN(limite INT)
BEGIN
	DECLARE contador INT DEFAULT 0;
    DECLARE soma INT DEFAULT 0;
    WHILE contador < limite DO
		SET contador = contador + 1;
		SET soma = soma + contador;
	END WHILE;
    SELECT soma;
END $
DELIMITER ;