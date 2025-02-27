CREATE DATABASE joins;

USE joins;

CREATE TABLE autor(
id_autor INT AUTO_INCREMENT PRIMARY KEY,
nome_autor VARCHAR(20)
);

CREATE TABLE livro(
id_livro INT AUTO_INCREMENT PRIMARY KEY,
nome_livro VARCHAR(30),
id_autor INT,
FOREIGN KEY (id_autor) 	REFERENCES autor(id_autor)
);

INSERT INTO autor (nome_autor)
VALUES ('Luana Farias'),
('Ronaldo'),
('Marcos'),
('Alessandra'),
('Fabiano');

INSERT INTO livro (nome_livro, id_autor)
VALUES ('CSS 5', 5),
('HTML', 1),
('C++', 3),
('Python', NULL),
('PHP', 2);

SELECT * FROM autor;

SELECT * FROM livro;

SELECT a.nome_autor, l.nome_livro FROM autor a
JOIN livro l
ON a.id_autor = l.id_autor
ORDER BY a.id_autor;

SELECT a.nome_autor, l.nome_livro FROM autor a
LEFT JOIN livro l
ON a.id_autor = l.id_autor OR l.id_autor = NULL
ORDER BY a.id_autor;

SELECT l.nome_livro, a.nome_autor FROM livro l
LEFT JOIN autor a
ON l.id_autor = a.id_autor OR a.id_autor = NULL
ORDER BY l.id_livro;

SELECT nome_autor, nome_livro FROM autor
LEFT JOIN livro
ON autor.id_autor = livro.id_autor
UNION
SELECT nome_autor, nome_livro FROM autor
RIGHT JOIN livro
ON autor.id_autor = livro.id_autor;