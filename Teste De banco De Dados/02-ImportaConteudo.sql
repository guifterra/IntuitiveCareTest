USE TESTE;
SET GLOBAL local_infile = 1;

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
