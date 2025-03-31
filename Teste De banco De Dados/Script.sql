CREATE DATABASE TESTE;
USE TESTE;

-- Script 1: Criando a tabela para armazenar os dados das operadoras ativas
CREATE TABLE operadoras_ativas (
    id SERIAL PRIMARY KEY,
    data DATE,
    registro_ans VARCHAR(20),
    cd_conta_contabil VARCHAR(50),
    descricao TEXT,
    vl_saldo_inicial DECIMAL(18,2),
    vl_saldo_final DECIMAL(18,2)
);

-- Script 2: Criando a tabela para armazenar os dados cadastrais das operadoras
CREATE TABLE demonstracoes_contabeis (
    id SERIAL PRIMARY KEY,
    registro_ans VARCHAR(20),
    cnpj VARCHAR(18),
    razao_social VARCHAR(255),
    nome_fantasia VARCHAR(255),
    modalidade VARCHAR(100),
    logradouro VARCHAR(255),
    numero VARCHAR(20),
    complemento VARCHAR(255),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    uf CHAR(2),
    cep VARCHAR(20),
    ddd VARCHAR(5),
    telefone VARCHAR(20),
    fax VARCHAR(20),
    endereco_eletronico VARCHAR(255),
    representante VARCHAR(255),
    cargo_representante VARCHAR(100),
    regiao_de_comercializacao VARCHAR(255),
    data_registro_ans DATE
);

SET GLOBAL local_infile = 1;
SET SESSION wait_timeout = 28800;  
SET SESSION interactive_timeout = 28800; 
SET SESSION net_read_timeout = 900; 
SET SESSION net_write_timeout = 900; 

-- Script 3: Importando os dados das operadoras ativas
LOAD DATA LOCAL INFILE 'C:/Users/guilh/Desktop/GitHub - Projetos/IntuitiveCare - Teste/Teste De banco De Dados/DemonstracoesContabeis/1T2023.csv'
INTO TABLE operadoras_ativas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, registro_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final);

LOAD DATA LOCAL INFILE 'C:/Users/guilh/Desktop/GitHub - Projetos/IntuitiveCare - Teste/Teste De banco De Dados/DemonstracoesContabeis/2T2023.csv'
INTO TABLE operadoras_ativas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, registro_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final);

LOAD DATA LOCAL INFILE 'C:/Users/guilh/Desktop/GitHub - Projetos/IntuitiveCare - Teste/Teste De banco De Dados/DemonstracoesContabeis/3T2023.csv'
INTO TABLE operadoras_ativas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, registro_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final);

LOAD DATA LOCAL INFILE 'C:/Users/guilh/Desktop/GitHub - Projetos/IntuitiveCare - Teste/Teste De banco De Dados/DemonstracoesContabeis/4T2023.csv'
INTO TABLE operadoras_ativas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, registro_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final);

LOAD DATA LOCAL INFILE 'C:/Users/guilh/Desktop/GitHub - Projetos/IntuitiveCare - Teste/Teste De banco De Dados/DemonstracoesContabeis/1T2024.csv'
INTO TABLE operadoras_ativas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, registro_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final);

LOAD DATA LOCAL INFILE 'C:/Users/guilh/Desktop/GitHub - Projetos/IntuitiveCare - Teste/Teste De banco De Dados/DemonstracoesContabeis/2T2024.csv'
INTO TABLE operadoras_ativas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, registro_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final);

LOAD DATA LOCAL INFILE 'C:/Users/guilh/Desktop/GitHub - Projetos/IntuitiveCare - Teste/Teste De banco De Dados/DemonstracoesContabeis/3T2024.csv'
INTO TABLE operadoras_ativas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, registro_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final);

LOAD DATA LOCAL INFILE 'C:/Users/guilh/Desktop/GitHub - Projetos/IntuitiveCare - Teste/Teste De banco De Dados/DemonstracoesContabeis/4T2024.csv'
INTO TABLE operadoras_ativas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, registro_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final);

-- Script 4: Importando os dados cadastrais das operadoras (ajuste o caminho do arquivo)
LOAD DATA LOCAL INFILE 'C:/Users/guilh/Desktop/GitHub - Projetos/IntuitiveCare - Teste/Teste De banco De Dados/OperadorasDePlanoDeSaudeAtivas/Relatorio_cadop.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(registro_ans, cnpj, razao_social, nome_fantasia, modalidade, logradouro, numero, complemento, bairro, cidade, uf, cep, ddd, telefone, fax, endereco_eletronico, representante, cargo_representante, regiao_de_comercializacao, data_registro_ans);


-- Script 5: Consulta analítica - Top 10 operadoras com maiores despesas nos últimos 3 meses
SELECT d.nome_fantasia, d.registro_ans, SUM(o.vl_saldo_final - o.vl_saldo_inicial) AS total_despesas
FROM operadoras_ativas o
JOIN demonstracoes_contabeis d ON o.registro_ans = d.registro_ans
WHERE o.data >= DATE_SUB("2024-12-31", INTERVAL 3 MONTH)
GROUP BY d.registro_ans, d.nome_fantasia
ORDER BY total_despesas DESC
LIMIT 10;

-- Script 6: Consulta analítica - Top 10 operadoras com maiores despesas no último ano
SELECT d.nome_fantasia, d.registro_ans, SUM(o.vl_saldo_final - o.vl_saldo_inicial) AS total_despesas
FROM operadoras_ativas o
JOIN demonstracoes_contabeis d ON o.registro_ans = d.registro_ans
WHERE o.data >= DATE_SUB("2024-12-31", INTERVAL 1 YEAR)
GROUP BY d.registro_ans, d.nome_fantasia
ORDER BY total_despesas DESC
LIMIT 10;
