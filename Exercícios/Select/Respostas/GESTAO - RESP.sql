-- A) TODAS AS COLUNAS DE TODAS EMPRESAS CADASTRADAS.
SELECT * 
FROM TB_EMPRESA

-- B) OS ESTADOS DOS REGISTROS ÚNICOS DAS EMPRESAS CADASTRADAS.
SELECT DISTINCT ESTADO 
FROM TB_EMPRESA

-- C) OS NOMES E DT_INICIO DE TODOS OS PROJETOS EM ANDAMENTO.
SELECT NOME, DT_INICIO
FROM TB_PROJETO
WHERE STATUS = 'A'

-- D) TODAS AS COLUNAS DAS EMPRESAS QUE ESTÃO LOCALIZADAS NO ESTADO DE SE E NA CIDADE DE ITABAIANA,
-- OU POSSUEM ALGUM TELEFONE INICIADO EM '79'.
SELECT * 
FROM TB_EMPRESA
WHERE (ESTADO = 'SE' AND CIDADE = 'ITABAIANA') 
   OR (PRIMEIRO_TELEFONE LIKE '79%' OR SEGUNDO_TELEFONE LIKE '79%')

-- E) OS NOMES E DT_INICIO DE TODOS OS PROJETOS QUE INICIARAM EM ('2024-01-01', '2024-04-01', '2024-08-01').
SELECT NOME, DT_INICIO
FROM TB_PROJETO
WHERE DT_INICIO IN ('2024-01-01', '2024-04-01', '2024-08-01')

-- F) OS NOMES E O CUSTO ESTIMADO DE TODOS OS PROJETOS QUE TIVERAM UM CUSTO_ESTIMADO ENTRE 70.000 E 100.000 INCLUSIVE.
SELECT NOME, CUSTO_ESTIMADO
FROM TB_PROJETO
WHERE CUSTO_ESTIMADO BETWEEN 70000 AND 100000

-- G) TODOS NOMES DE TODOS OS FUNCIONÁRIOS DE TODAS AS EMPRESAS QUE INICIAM COM A LETRA 'F'.
SELECT NOME
FROM TB_FUNCIONARIO
WHERE NOME LIKE 'F%'

-- H) TODOS NOMES E SALÁRIO DE TODOS OS FUNCIONÁRIOS DE TODAS AS EMPRESAS COM STATUS ATIVO E ORDENADOS POR SALÁRIO EM 
-- ORDEM DECRESCENTE.
SELECT NOME, SALARIO
FROM TB_FUNCIONARIO
WHERE STATUS = 'A'
ORDER BY SALARIO DESC

-- I) TODOS OS NOMES, CARGOS E EMAIL DOS PRIMEIROS FUNCIONÁRIOS CONTRATADOS POR QUALQUER EMPRESA NO ANO DE 2024.
SELECT TOP 3 NOME, CARGO, EMAIL
FROM TB_FUNCIONARIO
WHERE DT_ADMISSAO >= '2024-01-01' AND DT_ADMISSAO <= '2024-12-31'
