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

-- Solução esperada:
DECLARE @ID_Cliente INT = 2; -- Cliente selecionado
DECLARE @ValorTotal DECIMAL(10, 2); -- Variável para armazenar o valor total da compra
DECLARE @Desconto DECIMAL(10, 2) = 0; -- Variável para armazenar o desconto
DECLARE @ValorFinal DECIMAL(10, 2); -- Variável para o valor final da compra

-- Recupera o valor total da compra do cliente
SELECT @ValorTotal = Valor_Total FROM Compras WHERE ID_Cliente = @ID_Cliente;

-- Verifica o valor total e aplica o desconto correspondente
IF @ValorTotal > 1000
BEGIN
    SET @Desconto = @ValorTotal * 0.20;
    PRINT 'Desconto aplicado: 20%';
END
ELSE IF @ValorTotal > 500
BEGIN
    SET @Desconto = @ValorTotal * 0.10;
    PRINT 'Desconto aplicado: 10%';
END
ELSE
BEGIN
    PRINT 'Nenhum desconto aplicado.';
END

-- Calcula o valor final
SET @ValorFinal = @ValorTotal - @Desconto;

-- Exibe os resultados
PRINT 'ID do cliente: ' + CAST(@ID_Cliente AS VARCHAR);
PRINT 'Valor total da compra: ' + CAST(@ValorTotal AS VARCHAR);
PRINT 'Desconto: ' + CAST(@Desconto AS VARCHAR);
PRINT 'Valor final da compra: ' + CAST(@ValorFinal AS VARCHAR);




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

-- Solução esperada:
DECLARE @NomeProduto VARCHAR(50);
DECLARE @Preco DECIMAL(10, 2);
DECLARE @Total DECIMAL(10, 2) = 0;

-- Declarando o cursor
DECLARE ProdutoCursor CURSOR FOR
SELECT NomeProduto, Preco FROM Produtos;

-- Abrindo o cursor
OPEN ProdutoCursor;

-- Lendo o primeiro registro
FETCH NEXT FROM ProdutoCursor INTO @NomeProduto, @Preco;

-- Percorrendo a tabela com o cursor
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Exibindo o produto atual
    PRINT 'Produto: ' + @NomeProduto + ' | Preço: ' + CAST(@Preco AS VARCHAR);

    -- Somando o preço ao total
    SET @Total = @Total + @Preco;

    -- Lendo o próximo registro
    FETCH NEXT FROM ProdutoCursor INTO @NomeProduto, @Preco;
END

-- Fechando e desalocando o cursor
CLOSE ProdutoCursor;
DEALLOCATE ProdutoCursor;

-- Exibindo o total final
PRINT 'O total dos preços dos produtos é: ' + CAST(@Total AS VARCHAR);


--teste