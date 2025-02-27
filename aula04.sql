USE cadastro;

SELECT * FROM alunos;

SELECT * FROM cursos;

SELECT nome FROM alunos
WHERE sexo = 'F';

SELECT * FROM alunos
WHERE nascimento BETWEEN '2000-01-01' AND '2015-12-31';

SELECT nome FROM alunos
WHERE sexo = 'M' AND profissao = 'Programador';

SELECT * FROM alunos
WHERE sexo = 'F' AND nacionalidade = 'Brasil' AND nome LIKE 'J%';

SELECT nome, nacionalidade FROM alunos
WHERE sexo = 'M' AND nome LIKE '%Silva%' AND nacionalidade = 'Brasil' AND peso < 80;

SELECT MAX(altura) FROM alunos
WHERE sexo = 'M' AND nacionalidade = 'Portugal';

SELECT AVG(peso) FROM alunos;

SELECT * FROM alunos
WHERE sexo = 'M' AND nacionalidade NOT LIKE 'Brasil' AND nascimento BETWEEN '1990-01-01' AND '2000-12-31'
ORDER BY nome DESC;

SELECT MIN(peso) FROM alunos
WHERE sexo = 'F' AND nacionalidade NOT LIKE 'Brasil' AND nascimento BETWEEN '1990-01-01' AND '2000-12-31';

SELECT COUNT(peso) FROM alunos
WHERE altura > 1.90 AND sexo = 'F';

SELECT carga FROM cursos
GROUP BY carga;

SELECT carga, COUNT(nome) FROM cursos
GROUP BY carga;

SELECT DISTINCT totaulas FROM cursos
ORDER BY totaulas;

SELECT totaulas, COUNT(*) FROM cursos
GROUP BY totaulas
ORDER BY totaulas;

USE cadastro;

SELECT * FROM cursos;

SELECT carga, totaulas FROM cursos
WHERE totaulas = 30
GROUP BY carga;

SELECT carga, COUNT(nome) FROM cursos
WHERE totaulas = 30
GROUP BY carga;

SELECT ano, COUNT(nome) FROM cursos
GROUP BY ano;

SELECT ano, COUNT(nome) FROM cursos
GROUP BY ano
ORDER BY COUNT(*) DESC;

SELECT ano, COUNT(nome) FROM cursos
GROUP BY ano
HAVING COUNT(ano) >= 5
ORDER BY COUNT(*) DESC;

SELECT ano, COUNT(nome) FROM cursos
WHERE totaulas > 30
GROUP BY ano
HAVING COUNT(ano) > 2013
ORDER BY COUNT(*);

SELECT * FROM cursos;

SELECT carga, COUNT(*) FROM cursos
WHERE ano > 2015
GROUP BY carga
HAVING carga > (SELECT AVG(carga) FROM cursos);

SELECT AVG(carga) FROM cursos;

CREATE DATABASE livraria;

CREATE TABLE livros(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_livro VARCHAR(30),
nome_autor VARCHAR(30),
sexo_autor ENUM('M', 'F'),
numero_paginas INT,
nome_editora VARCHAR(30),
valor_livro DOUBLE(5,2),
uf_editora CHAR(2),
ano_publicacao INT
);

INSERT INTO livros (nome_livro, nome_autor,sexo_autor, 
numero_paginas, nome_editora, valor_livro,
uf_editora, ano_publicacao)
VALUES ('Cavaleiro Real', 'Ana Claudia', 'F', 465, 'Atlas',
49.9,  'RJ', 2009),
('SQL para leigos', 'João Nunes', 'M', 450, 'Addison', 98,
'SP', 2018),
('Receitas Caseiras', 'Celia Tavares', 'F', 210, 'Atlas', 45,
'RJ', 2008),
('Pessoas Efetivas', 'Eduardo Santos', 'M', 390, 'Beta', 78.99,
'RJ', 2018),
('Habitos Saudáveis', 'Eduardo Santos', 'M', 630, 'Beta', 150.98,
'RJ', 2019),
('A Casa Marrom', 'Hermes Macedo', 'M', 250, 'Bubba', 60,
'MG', 2016),
('Estacio Querido', 'Geraldo Francisco', 'M', 310, 'Insignia', 100,
'ES', 2015),
('Pra sempre amigas', 'Leda Silva', 'F', 510, 'Insignia', 78.98,
'ES', 2011),
('Copas Inesqueciveis', 'Marco Alcantara', 'M', 200, 'Larson', 130.98,
'RS', 2018),
('O poder da mente', 'Clara Mafra', 'F', 120, 'Continental', 56.58,
'SP', 2017);


SELECT * FROM livros;

SELECT nome_livro, nome_editora FROM livros;

SELECT nome_livro, uf_editora FROM livros
WHERE sexo_autor = 'M';

SELECT nome_livro, numero_paginas FROM livros
WHERE sexo_autor = 'F';

SELECT nome_livro, uf_editora FROM livros
WHERE sexo_autor = 'M';

SELECT valor_livro FROM livros
WHERE uf_editora = 'SP';

SELECT nome_autor, nome_livro, sexo_autor, uf_editora FROM livros
WHERE sexo_autor = 'M' AND (uf_editora = 'SP' or uf_editora = 'RJ')