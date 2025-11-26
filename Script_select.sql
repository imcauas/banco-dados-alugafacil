use alugafácil;

SELECT data_pagamento, metodo_pagamento, valor_total
FROM pagamento
WHERE metodo_pagamento IN ('Pix', 'Dinheiro')
ORDER BY data_pagamento DESC;

SELECT SUM(valor_total) as Faturamento_Total
FROM pagamento
WHERE status_pagamento = 'Aprovado';

SELECT 
    cli.nome AS Cliente,
    v.modelo AS Carro,
    pg.valor_total AS Valor_Pago,
    pg.metodo_pagamento
FROM pagamento AS pg
JOIN contrato AS con ON pg.contrato_id = con.id
JOIN cliente AS cli ON con.cliente_id = cli.id
JOIN veiculo AS v ON con.veiculo_id = v.id;

SELECT valor_total, metodo_pagamento, status_pagamento
FROM pagamento
ORDER BY valor_total DESC
LIMIT 1;

SELECT 
    cli.nome AS Cliente,
    v.modelo AS Veiculo,
    con.km_saida,
    dev.km_chegada,
    (dev.km_chegada - con.km_saida) AS Km_Rodados, -- Faz a conta de quantos KM andou
    dev.observacoes_devolucao
FROM devolucao AS dev
JOIN contrato AS con ON dev.contrato_id = con.id
JOIN cliente AS cli ON con.cliente_id = cli.id
JOIN veiculo AS v ON con.veiculo_id = v.id;
