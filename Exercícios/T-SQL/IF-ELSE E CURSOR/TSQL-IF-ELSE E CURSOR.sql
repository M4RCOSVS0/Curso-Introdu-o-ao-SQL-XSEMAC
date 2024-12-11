CREATE DATABASE EXERCICIO_TSQL
USE EXERCICIO_TSQL


-- EXERCÍCIO 1
-- Enunciado:
-- Temos uma tabela chamada Compras, que armazena o ID do cliente e o valor total de suas compras.
-- Você deve criar um script que verifique o valor total da compra de um cliente específico e aplique a seguinte lógica:
-- - Se o valor total for maior que 1000, o desconto é de 20%.
-- - Se o valor total for maior que 500, o desconto é de 10%.
-- - Caso contrário, não há desconto.
-- O script deve exibir o ID do cliente, o valor do desconto aplicado e o valor final da compra.

-- Criação da tabela Compras
CREATE TABLE Compras (
    ID_Cliente INT PRIMARY KEY,
    Valor_Total DECIMAL(10, 2)
);

-- Inserção de dados na tabela Compras
INSERT INTO Compras (ID_Cliente, Valor_Total)
VALUES
(1, 300.00),
(2, 750.00),
(3, 1500.00);


-- EXERCÍCIO 2:
-- Enunciado:
-- Você deve criar um script que usa um cursor para percorrer uma tabela de produtos.
-- O script deve:
-- 1. Calcular o total dos preços de todos os produtos usando um cursor.
-- 2. Exibir cada produto enquanto percorre a tabela.
-- 3. Exibir o total final de preços.

-- Criamos a tabela Produtos para o exercício
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,
    NomeProduto VARCHAR(50),
    Preco DECIMAL(10, 2)
);

-- Inserimos alguns dados de exemplo na tabela Produtos
INSERT INTO Produtos (ProdutoID, NomeProduto, Preco)
VALUES
(1, 'Celular', 1500.00),
(2, 'Notebook', 3500.00),
(3, 'Tablet', 1200.00);