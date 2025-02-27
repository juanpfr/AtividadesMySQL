CREATE DATABASE tcl;

USE tcl;

CREATE TABLE dados(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
endereco VARCHAR(100),
cpf VARCHAR(12),
sexo ENUM('M', 'F')
);

INSERT INTO dados (nome, endereco, cpf, sexo) VALUES
('Bruno', 'São Mateus', '12345678910', 'M'),
('Flávia', 'Ermelino', '99345678910', 'F'),
('Manuela', 'São Paulo', '44445678910', 'F');

UPDATE dados SET nome = 'Naldo'
WHERE id = 1;

SELECT * FROM dados;

START TRANSACTION;

DELETE FROM dados WHERE id = 3;

SELECT * FROM dados;

ROLLBACK;

SELECT * FROM dados;

START TRANSACTION;

DELETE FROM dados WHERE id = 2;

COMMIT;

ROLLBACK;

SELECT * FROM dados;