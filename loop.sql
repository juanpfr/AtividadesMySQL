USE diversas_tabelas;

DELIMITER $
CREATE PROCEDURE contador(limite INT)
BEGIN
	DECLARE x INT DEFAULT 0;
    teste: LOOP
SET x = x + 1;
SELECT x;
	IF x = limite THEN
		LEAVE teste;
	END IF;
    END LOOP teste;
END $
DELIMITER ;

CALL contador(2);

DELIMITER $
CREATE PROCEDURE acumula (limite INT)
BEGIN
DECLARE contador INT DEFAULT 0;
DECLARE soma INT DEFAULT 0;
loop_teste: LOOP
	SET contador = contador + 1;
    SET soma = soma + contador;
    IF contador >= limite THEN
		LEAVE loop_teste;
	END IF;
END LOOP loop_teste;
SELECT soma;
END $
DELIMITER ;

CALL acumula(15);