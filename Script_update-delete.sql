use alugafácil;

UPDATE contrato 
SET valor_multa_atraso = valor_diaria * 1.10
WHERE id > 0;

UPDATE cliente 
SET rua = 'Rua dos Girassois', cep = '05005000', numero = '202'
WHERE id = 1;

UPDATE contrato 
SET observacoes = 'Confirmar horário de retirada via WhatsApp com o cliente.' 
WHERE id = 9;

UPDATE contrato 
SET observacoes = 'Cliente solicitou cadeirinha de bebê inclusa no valor.' 
WHERE id = 7;

DELETE FROM veiculo 
WHERE ano_fabricacao <= 2015;

DELETE FROM contrato 
WHERE status = 'Agendado' AND valor_diaria < 100.00;

DELETE FROM cliente 
WHERE estado = 'MG';