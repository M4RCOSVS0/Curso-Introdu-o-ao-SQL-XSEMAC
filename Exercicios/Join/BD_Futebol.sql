CREATE DATABASE DB_FUT;

USE DB_FUT;


CREATE TABLE TB_JOGADORES (
    ID_JOGADOR INT IDENTITY(1,1) PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    POSICAO VARCHAR(50) NOT NULL,
    APELIDO VARCHAR(50) NULL
);

CREATE TABLE TB_EQUIPES (
    ID_EQUIPE INT PRIMARY KEY,
    NOME_EQUIPE VARCHAR(100) NOT NULL
);

CREATE TABLE TB_JOGADORES_EQUIPE (
    ID_JOGADOR INT,
    ID_EQUIPE INT,
    PRIMARY KEY (ID_JOGADOR, ID_EQUIPE),
    FOREIGN KEY (ID_JOGADOR) REFERENCES TB_JOGADORES(ID_JOGADOR),
    FOREIGN KEY (ID_EQUIPE) REFERENCES TB_EQUIPES(ID_EQUIPE)
);

INSERT INTO TB_JOGADORES (NOME,APELIDO,POSICAO) VALUES
('IGOR ', 'INDIANO','ATACANTE'),
('GUILHERME', NULL,'MEIO-CAMPO'),
('JONATHA', 'J0ng4b','ZAGUEIRO'),
('MARCOS','CEBOLA','GOLEIRO'),
('ANDRÉ', 'MISTER' ,'TÉCNICO'),
('AÉLIO',NULL, 'AUXILIAR'),
('RAPHAEL',NULL, 'PRESIDENTE');

INSERT INTO TB_EQUIPES (ID_EQUIPE, NOME_EQUIPE) VALUES
(1, 'FUMAÇA FC'),
(2, 'REAL INVASÃO FC'),
(3, 'DENDENZEIRO FC'),
(4,'ATLÉTICO DA RUA DA LAMA'),
(5,'GRÊMIO DA TERRA DURA');

INSERT INTO TB_JOGADORES_EQUIPE (ID_JOGADOR, ID_EQUIPE)
VALUES
(1, 4),
(2, 2),
(3, 3),
(4, 4),
(5, 2),
(7, 1);
