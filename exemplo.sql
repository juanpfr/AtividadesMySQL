CREATE DATABASE exemplo;

USE exemplo;

CREATE TABLE p_curso(
id_curso INT AUTO_INCREMENT PRIMARY KEY,
nome_curso VARCHAR(100),
preco_curso decimal(10,2)
);

INSERT INTO p_curso (nome_curso, preco_curso)
VALUES ('Excel', 500),
('VBA', 280),
('Power BI', 150);

SELECT * FROM p_curso;

DELIMITER $
CREATE PROCEDURE p_atualiza_preco(
novo_preco DECIMAL(10,2),
id INT)
BEGIN
UPDATE p_curso
SET preco_curso = novo_preco
WHERE id_curso = id;
SELECT 'Preço atualizado com sucesso!';
END $
DELIMITER ;

CALL p_atualiza_preco(600, 1);

SELECT * FROM p_curso;

DELIMITER $
CREATE PROCEDURE p_cadastrar_cursos(nome VARCHAR(100), preco DECIMAL(10, 2))
BEGIN
INSERT INTO p_curso (nome_curso, preco_curso)
VALUES (nome, preco);
SELECT 'Curso cadastrado com sucesso!';
END $
DELIMITER ;

CALL p_cadastrar_cursos('Banco de dados', 1000);

CALL p_cadastrar_cursos('Python', 1200);

SELECT * FROM p_curso;

DELIMITER $
CREATE PROCEDURE p_acrescimo_geral(
acrescimo DECIMAL (10, 2))
BEGIN
UPDATE p_curso
SET preco_curso = preco_curso * (1 + acrescimo / 100);
SELECT 'Acrescimo adicionado com sucesso!' AS situacao;
END $
DELIMITER ;

CALL p_acrescimo_geral(10);

SELECT * FROM p_curso;


DELIMITER $
CREATE PROCEDURE p_excluir_cursos(
id INT)
BEGIN
DELETE FROM p_curso
WHERE id_curso = id;
END $
DELIMITER ;

CALL p_excluir_cursos(5);

DELIMITER $
CREATE PROCEDURE p_excluir_cursos_nome(
nome VARCHAR(100))
BEGIN
DELETE FROM p_curso
WHERE nome_curso = nome;
END $
DELIMITER ;

CALL p_excluir_cursos_nome('VBA');

SELECT * FROM p_curso;