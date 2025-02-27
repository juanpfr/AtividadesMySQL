#-------------------- ATIVIDADE --------------------

CREATE DATABASE ti;

USE ti;

CREATE TABLE clientes(
id INT AUTO_INCREMENT PRIMARY KEY,
cpf VARCHAR(14) UNIQUE,
nome VARCHAR(30),
nascimento DATE,
endereco VARCHAR(20),
cep VARCHAR(9),
bairro VARCHAR(20),
cidade VARCHAR(20),
uf VARCHAR(20)
);

ALTER TABLE clientes
ADD COLUMN ultima_compra DATE;

DESC clientes;

SELECT * FROM clientes;

INSERT INTO clientes (cpf, nome, nascimento, endereco, cep, bairro, cidade, uf, ultima_compra)
VALUES ('022.963.327-80', 'Marcos da Silva', '1970-11-25', 'Rua Pedro Marques', '88045-968', 'Santana', 'São Paulo', 'SP', '2024-06-17'),
('082.850.314-90', 'Ana Ana Julia', '1985-10-21', 'Rua Paradigma Novais', '99078-923', 'Leblon', 'Rio de Janeiro', 'RJ', '2024-06-18'),
('055.503.149-05', 'Jorge Soares', '1989-03-05', 'Rua das Banguelas', '77048-917', 'Copacabana', 'Rio de Janeiro', 'RJ', '2024-06-16'),
('011.503.149-05', 'Juvenal Soares', '1989-04-15', 'Rua das Tabuinhas', '69048-917', 'Minerva', 'Minas Gerais', 'MG', '2024-06-19');

SELECT * FROM clientes
WHERE uf = 'RJ';

ALTER TABLE clientes
ADD COLUMN produto VARCHAR(30);

UPDATE clientes SET produto = 'TV' WHERE id = 1;
UPDATE clientes SET produto = 'Geladeira' WHERE id = 2;
UPDATE clientes SET produto = 'Notebook' WHERE id = 3;
UPDATE clientes SET produto = 'Celular' WHERE id = 4;

DELETE FROM clientes WHERE uf = 'SP';

SELECT * FROM clientes;