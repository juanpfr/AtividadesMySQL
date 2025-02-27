SELECT * FROM categorias;

SELECT * FROM produtos;

SELECT id_categoria FROM categorias;

SELECT id_categoria FROM produtos;

SELECT id_categoria FROM categorias
WHERE EXISTS (SELECT id_categoria FROM produtos
WHERE categorias.id_categoria = produtos.id_categoria);

SELECT id_categoria FROM categorias
WHERE NOT EXISTS (SELECT id_categoria FROM produtos
WHERE categorias.id_categoria = produtos.id_categoria);

SELECT * FROM categorias WHERE id_categoria = 7;