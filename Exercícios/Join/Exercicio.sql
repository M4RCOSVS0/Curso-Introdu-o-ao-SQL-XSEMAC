CREATE DATABASE DB_TRABALHO

USE DB_TRABALHO

-- Criando a tabela Departamentos
CREATE TABLE Departamentos (
    id_departamento INT PRIMARY KEY,
    departamento VARCHAR(100) NOT NULL
);

-- Criando a tabela Funcionarios
CREATE TABLE Funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_departamento INT NULL,
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);

-- Inserindo dados na tabela Departamentos
INSERT INTO Departamentos (id_departamento, departamento) VALUES
(1, 'RH'),
(2, 'TI'),
(3, 'Marketing'),
(4, 'Vendas');

-- Inserindo dados na tabela Funcionarios
INSERT INTO Funcionarios (id_funcionario, nome, id_departamento) VALUES
(1, 'João', 1),
(2, 'Maria', 2),
(3, 'Carlos', NULL),
(4, 'Ana', NULL);

--Exercícios - Junções
-- 1-Faça uma consulta que mostre o nome dos funcionários e o nome do departamento a que pertencem, usando INNER JOIN.

-- 2-Faça uma consulta que mostre todos os funcionários e os departamentos a que pertencem, incluindo os funcionários sem departamento, usando LEFT JOIN.

-- 3-Faça uma consulta que mostre todos os departamentos e os funcionários que pertencem a eles, incluindo departamentos sem funcionários, usando RIGHT JOIN.

-- 4-Faça uma consulta que mostre todos os funcionários e todos os departamentos, mesmo que não exista correspondência entre eles, usando FULL OUTER JOIN.