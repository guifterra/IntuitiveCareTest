USE TESTE;

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