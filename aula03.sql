USE cadastro;

ALTER TABLE clientes
MODIFY COLUMN nome VARCHAR(50);

SELECT * FROM clientes;

ALTER TABLE clientes
CHANGE COLUMN sexo genero ENUM('M', 'F');

SELECT * FROM clientes;

ALTER TABLE clientes
RENAME TO clientes1;

ALTER TABLE clientes1
RENAME TO clientes;

SELECT * FROM clientes;

INSERT INTO clientes (id, nome, nascimento, genero, peso, altura, nacionalidade)
VALUES (1, 'Marcelo', '1968-11-15', 'M', '88.6', '1.85', DEFAULT),
(3, 'Fernanda', '1978-10-28', 'F', '70.5', '1.58', DEFAULT),
(4, 'Julio', '2010-08-26', 'M', '55.6', '1.69', DEFAULT),
(5, 'Davi', '2014-06-30', 'M', '33.8', '1.48', DEFAULT),
(6, 'Silvana', '1963-03-11', 'F', '64.5', '1.52', DEFAULT);


SELECT * FROM clientes;

DELETE FROM clientes WHERE id = '1';

SELECT * FROM clientes;

DESC clientes;

ALTER TABLE clientes
ADD COLUMN profissao VARCHAR(20) AFTER nome;

SELECT * FROM clientes;

ALTER TABLE clientes
CHANGE COLUMN profissao cargo VARCHAR(20);

UPDATE clientes SET cargo = 'TI' WHERE id = 1;

SELECT * FROM clientes;

UPDATE clientes SET cargo = 'Gerente' WHERE id = 3;

UPDATE clientes SET cargo = 'Administrativo' WHERE id = 4;

UPDATE clientes SET cargo = 'Assist. Contábil' WHERE id = 5;

UPDATE clientes SET cargo = 'Aux. ADM' WHERE id = 6;

SELECT * FROM cursos;

SELECT id, cargo FROM clientes;

CREATE TABLE IF NOT EXISTS clientes(
teste int
);