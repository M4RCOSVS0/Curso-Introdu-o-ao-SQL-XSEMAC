create database exercicio_restricao;
use exercicio_restricao;

-- EXERCÍCIO 1
-- Enunciado:
-- Você tem uma tabela chamada `Funcionarios` com as seguintes colunas e características:
-- - ID (número único para cada funcionário);
-- - Nome (nome do funcionário);
-- - Salario (salário do funcionário);
-- - DepartamentoID (identificador do departamento ao qual o funcionário pertence).
-- Crie a tabela aplicando as seguintes restrições de integridade:
-- 1. O ID deve ser a chave primária;
-- 2. O Nome deve ser único;
-- 3. O Salario deve ser maior que 1000 (use uma restrição CHECK);
-- 4. O DepartamentoID deve referenciar a tabela Departamentos já existente.

-- Primeiro, criamos a tabela Departamentos
CREATE TABLE Departamentos (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

-- Inserimos os dados na tabela Departamentos
INSERT INTO Departamentos (ID, Nome)
VALUES
(1, 'Recursos Humanos'),
(2, 'TI'),
(3, 'Marketing');

-- Agora criamos a tabela Funcionarios com as restrições solicitadas
CREATE TABLE Funcionarios (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50) UNIQUE,
    Salario DECIMAL(10, 2) CHECK (Salario > 1000),
    DepartamentoID INT,
    CONSTRAINT FK_Departamento FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(ID)
);

-- EXERCÍCIO 2
-- Enunciado:
-- Considere um sistema de vendas que possui a tabela Produtos com as seguintes colunas:
-- - ProdutoID (identificador único do produto);
-- - NomeProduto (nome do produto);
-- - Preco (preço do produto);
-- - CategoriaID (identificador da categoria do produto).
-- Sua tarefa é:
-- 1. Criar a tabela Produtos com as seguintes restrições:
--    - ProdutoID como chave primária;
--    - NomeProduto não pode se repetir;
--    - Preco deve ser maior que 0;
--    - CategoriaID deve referenciar a tabela Categorias já existente.
-- 2. Criar a tabela Categorias com CategoriaID como chave primária e NomeCategoria como um valor único.

-- Criamos a tabela Categorias
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY,
    NomeCategoria VARCHAR(50) UNIQUE
);

-- Inserimos os dados na tabela Categorias
INSERT INTO Categorias (CategoriaID, NomeCategoria)
VALUES
(1, 'Eletrônicos'),
(2, 'Roupas'),
(3, 'Livros');

-- Criamos a tabela Produtos com as restrições solicitadas
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,
    NomeProduto VARCHAR(50) UNIQUE,
    Preco DECIMAL(10, 2) CHECK (Preco > 0),
    CategoriaID INT,
    CONSTRAINT FK_Categoria FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);
