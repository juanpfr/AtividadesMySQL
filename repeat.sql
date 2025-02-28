DELIMITER $
CREATE PROCEDURE contadorR(limite INT)
BEGIN
DECLARE x INT DEFAULT 0;
REPEAT
	set x = x + 1;
    SELECT x;
    UNTIL x = limite
END REPEAT;
END $
DELIMITER ;

CALL contadorR(4);

DELIMITER $
CREATE PROCEDURE acumulaR(limite INT)
BEGIN
	DECLARE contador INT DEFAULT 0;
    DECLARE soma INT DEFAULT 0;
	REPEAT
		SET contador = contador + 1;
		SET soma = soma + contador;
		UNTIL contador >= limite
	END REPEAT;
    SELECT soma;
END $
DELIMITER ;


CALL acumulaR(15);