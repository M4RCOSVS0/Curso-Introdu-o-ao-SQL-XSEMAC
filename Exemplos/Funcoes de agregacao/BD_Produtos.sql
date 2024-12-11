CREATE DATABASE DB_PRODUCT

USE DB_PRODUCT

-- Criando a tabela Vendas
CREATE TABLE Vendas (
    id_venda INT PRIMARY KEY,
    produto VARCHAR(50) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL
);

-- Inserindo os dados na tabela Vendas
INSERT INTO Vendas (id_venda, produto, valor) VALUES
(1, 'mouse', 100),
(2, 'teclado', 200),
(3, 'headset', 150),
(4, 'mouse', 80),
(5, 'mouse', 95),
(6, 'teclado', 60);

--FUNCÕES DE AGREGAÇÃO
SELECT
    SUM(valor) AS total_vendas
FROM
    Vendas;

--FUNÇOES DE AGREGAÇÃO COM GROUP BY
SELECT
    produto,
    SUM(valor) AS total_vendas
FROM
    Vendas
Group By
    produto;

--FUNÇÕES DE AGREGAÇÃO COM HAVING
SELECT
    produto,
    count(produto) AS quantidade_vendas
FROM
    vendas
Group By
    produto
HAVING
    COUNT(produto) > 1


