CREATE DATABASE clientes;

USE clientes;

CREATE TABLE cliente(
idcliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(30),
sexo ENUM('M', 'F') NOT NULL,
email VARCHAR(50) UNIQUE,
cpf VARCHAR(15) UNIQUE
);

INSERT INTO cliente (nome, sexo, email, cpf)
VALUES ('Joao','M', 'joao@bol.com','76984352456'),
('Carla','F', 'carla@bol.com','76984356699'),
('Ana','F', 'ana@bol.com','76984357755'),
('Clara','F', 'clara@bol.com','76984353344'),
('Jorge','M', 'jorge@bol.com','76984352211'),
('Celia','F', 'celia@bol.com','76984359988');

CREATE TABLE endereco(
idendereco INT PRIMARY KEY AUTO_INCREMENT,
rua VARCHAR(30) NOT NULL,
bairro VARCHAR(30) NOT NULL,
cidade VARCHAR(30) NOT NULL,
estado VARCHAR(2) NOT NULL,
id_cliente INT UNIQUE,
FOREIGN KEY (id_cliente) REFERENCES cliente (idcliente)
);

INSERT INTO endereco (rua, bairro, cidade, estado, id_cliente)
VALUES ('Rua Antonio SA','Centro','B. Horizonte','MG',4),
('Rua Capitao Hermes','Centro','Rio de Janeiro','RJ',1),
('Rua Pres Vargas','Jardins', 'Sao Paulo','SP',3),
('Rua Alfandega', 'Estacio', 'Rio de Janeiro', 'RJ',2),
('Rua do Ouvidor','Flamengo', 'Rio de Janeiro','RJ',6),
('Rua Uruguaiana','Centro','Vitoria','ES',5);

CREATE TABLE telefone(
idtelefone INT PRIMARY KEY AUTO_INCREMENT,
tipo ENUM('Res', 'Com', 'Cel') NOT NULL,
numero VARCHAR(10) NOT NULL,
id_cliente INT,
FOREIGN KEY (id_cliente) REFERENCES cliente (idcliente)
);

INSERT INTO telefone (tipo, numero, id_cliente)
VALUES ('Cel','78458743',5),
('Res','56576876',5),
('Cel','87666898',1),
('Com','54768899',2),
('Res','78989765',1),
('Cel','99766676',3),
('Cel','78458743',3),
('Com', '66687899',1),
('Res','89986668',5),
('Cel','88687909',2);

SELECT c.nome, c.sexo, e.bairro, e.cidade FROM cliente c
JOIN endereco e
ON c.idcliente = e.id_cliente
WHERE c.sexo = 'F'
ORDER BY c.nome;

SELECT c.nome, c.sexo, e.bairro, e.cidade, t.tipo, t.numero FROM cliente c
JOIN endereco e
JOIN telefone t
ON c.idcliente = e.id_cliente AND c.idcliente = t.id_cliente
ORDER BY c.nome;

SELECT c.nome, c.sexo, e.cidade, t.numero  FROM cliente c
JOIN endereco e
JOIN telefone t
ON c.idcliente = e.id_cliente AND c.idcliente = t.id_cliente
WHERE c.sexo = 'M'
ORDER BY c.nome;

SELECT c.idcliente, c.email, e.bairro, e.cidade, t.numero  FROM cliente c
JOIN endereco e
JOIN telefone t
ON c.idcliente = e.id_cliente AND c.idcliente = t.id_cliente
WHERE e.cidade = 'Rio de Janeiro'
ORDER BY t.numero;	

DESC cliente;

DESC telefone;

DESC endereco;

CREATE VIEW v_relatorio AS
SELECT c.nome, c.sexo, c.email, t.tipo, t.numero, e.bairro, e.cidade, e.estado FROM cliente c
JOIN telefone t
JOIN endereco e
ON c.idcliente = t.id_cliente AND c.idcliente = e.id_cliente;

SELECT * FROM v_relatorio;

SELECT nome, numero, estado FROM v_relatorio;

DELETE FROM v_relatorio
WHERE nome = 'Jorge';

INSERT INTO v_relatorio (nome, sexo, email, tipo, numero, bairro, cidade, estado)
VALUES ('Cida', 'F', 'cida@bol.com', '77994457', 'Centro', 'Vitoria', 'ES');

UPDATE v_relatorio
SET nome = 'Jose'
WHERE nome = 'Jorge';

SELECT * FROM v_relatorio
WHERE sexo = 'F'
ORDER BY nome;

ALTER TABLE cliente
ADD COLUMN data_ult_compra DATE;

UPDATE cliente SET data_ult_compra = '2024/08/01'
WHERE idcliente = 1;

UPDATE cliente SET data_ult_compra = '2024/08/02'
WHERE idcliente = 2;

UPDATE cliente SET data_ult_compra = '2024/08/03'
WHERE idcliente = 3;

UPDATE cliente SET data_ult_compra = '2024/08/04'
WHERE idcliente = 4;

UPDATE cliente SET data_ult_compra = '2024/08/05'
WHERE idcliente = 5;

UPDATE cliente SET data_ult_compra = '2024/08/06'
WHERE idcliente = 6;

SELECT * FROM cliente;

ALTER TABLE cliente
ADD COLUMN valor_compra DOUBLE;

UPDATE cliente SET valor_compra = 1000
WHERE idcliente = 1;

UPDATE cliente SET valor_compra = 2000
WHERE idcliente = 2;

UPDATE cliente SET valor_compra = 3000
WHERE idcliente = 3;

UPDATE cliente SET valor_compra = 4000
WHERE idcliente = 4;

UPDATE cliente SET valor_compra = 5000
WHERE idcliente = 5;

UPDATE cliente SET valor_compra = 6000
WHERE idcliente = 6;

ALTER VIEW v_relatorio AS
SELECT c.data_ult_compra, c.nome, c.sexo, c.email, t.tipo, t.numero, e.bairro, e.cidade, e.estado, c.valor_compra FROM cliente c
JOIN telefone t
JOIN endereco e
ON c.idcliente = t.id_cliente AND c.idcliente = e.id_cliente;

CREATE VIEW v_compraacima3000 AS
SELECT * FROM CLIENTE
WHERE valor_compra > 3000;

SELECT * FROM v_compraacima3000;

CREATE VIEW valor_total AS
SELECT SUM(valor_compra) FROM cliente;

SELECT * FROM valor_total;

CREATE VIEW menor_valor AS
SELECT MIN(valor_compra) FROM cliente;

SELECT * FROM menor_valor;

CREATE VIEW media_valor AS
SELECT AVG(valor_compra) FROM cliente;

SELECT * FROM media_valor;

CREATE VIEW maior_valor AS
SELECT MAX(valor_compra) FROM cliente;

SELECT * FROM maior_valor;

CREATE VIEW maior_valor_nome AS
SELECT nome, valor_compra FROM cliente
WHERE valor_compra = (SELECT MAX(valor_compra) FROM cliente);

SELECT * FROM maior_valor_nome;