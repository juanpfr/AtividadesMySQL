CREATE DATABASE PROJETO;

USE PROJETO;

CREATE TABLE NEW_CURSOS(
IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
NOME VARCHAR(100) NOT NULL,
HORAS INT NOT NULL,
PRECO DECIMAL(10,2) NOT NULL
);

INSERT INTO NEW_CURSOS VALUES
(NULL, 'JAVA', 30, 500.00),
(NULL, 'BANCO DE DADOS', 30, 700.00);

SELECT * FROM NEW_CURSOS;

DELIMITER $
CREATE PROCEDURE cadastrar(nome VARCHAR(100), horas INT, preco DECIMAL(10, 2))
BEGIN
INSERT INTO new_cursos (nome, horas, preco)
VALUES (nome, horas, preco);
SELECT 'Curso cadastrado com sucesso!';
END $
DELIMITER ;

CALL cadastrar('Mysql', 30, 100);

CALL cadastrar('Microsoft SQL Server', 35, 150);

CALL cadastrar('PostgreSQL', 40, 200);

CALL cadastrar('Oracle Database', 50, 250);

DELIMITER $
CREATE PROCEDURE atualizar_preco(
acrescimo DECIMAL(10,2),
id INT)
BEGIN
UPDATE new_cursos
SET preco = preco * (1 + acrescimo / 100)
WHERE idcurso = id;
SELECT 'Preço atualizado com sucesso!';
END $
DELIMITER ;

SELECT * FROM new_cursos;

CALL atualizar_preco(15, 1);

CALL atualizar_preco(18, 2);

CALL atualizar_preco(20, 3);

CALL atualizar_preco(22, 4);

CALL atualizar_preco(25, 5);

CALL atualizar_preco(28, 6);

SELECT * FROM new_cursos;

DELIMITER $
CREATE PROCEDURE atualizar_preco_bruto(
novo_preco DECIMAL(10,2),
id INT)
BEGIN
UPDATE new_cursos
SET preco = novo_preco
WHERE idcurso = id;
SELECT 'Preço atualizado com sucesso!';
END $
DELIMITER ;

CALL atualizar_preco_bruto(600, 1);

CALL atualizar_preco_bruto(800, 2);

CALL atualizar_preco_bruto(200, 3);

CALL atualizar_preco_bruto(250, 4);

CALL atualizar_preco_bruto(300, 5);

CALL atualizar_preco_bruto(350, 6);

DELIMITER $
CREATE PROCEDURE desconto(
desconto DECIMAL(10,2))
BEGIN
UPDATE new_cursos
SET preco = preco / (1 + desconto / 100);
SELECT 'Preço atualizado com sucesso!';
END $
DELIMITER ;

DROP PROCEDURE desconto;

CALL desconto(35);

SELECT * FROM new_cursos;

DELIMITER $
CREATE PROCEDURE excluir(id INT)
BEGIN
DELETE FROM new_cursos
WHERE idcurso = id;
END $
DELIMITER ;

CALL excluir(1);

DELIMITER $
CREATE PROCEDURE excluir_por_nome(nome_excluir VARCHAR(100))
BEGIN
DELETE FROM new_cursos
WHERE nome = nome_excluir;
END $
DELIMITER ;

DROP PROCEDURE excluir_por_nome;

CALL excluir_por_nome('Mysql');

SELECT * FROM new_cursos;