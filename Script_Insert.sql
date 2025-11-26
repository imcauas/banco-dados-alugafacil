use alugafácil;

INSERT INTO cliente (nome, sobrenome, cnh, telefone, email, rua, numero, cep, estado, municipio, pais) VALUES 
('João', 'Silva', '12345678900', '11999990000', 'joao@email.com', 'Rua A', '10', '01001000', 'SP', 'São Paulo', 'Brasil'),
('Maria', 'Oliveira', '98765432100', '21988887777', 'maria@email.com', 'Av Brasil', '500', '20040002', 'RJ', 'Rio de Janeiro', 'Brasil'),
('Carlos', 'Santos', '11122233344', '31977776666', 'carlos@email.com', 'Rua das Flores', '12B', '30000123', 'MG', 'Belo Horizonte', 'Brasil');


INSERT INTO marca (id, nome_marca, origem) VALUES 
(1, 'Volkswagen', 'Alemanha'),
(2, 'Toyota', 'Japão'),
(3, 'Chevrolet', 'EUA');

INSERT INTO veiculo (marca_id, transmissao, modelo, combustivel, placa, chassi, cor, ano_fabricacao) VALUES 
(1, 'Manual', 'Gol', 'Flex', 'ABC-1234', '9BWZZZ...', 'Branco', 2020),
(1, 'Automatico', 'Onix', 'Flex', 'XYZ-9876', '8C3VVV...', 'Prata', 2022),
(2, 'Automatico', 'Corolla', 'Gasolina', 'JKL-5555', '7TYUUU...', 'Preto', 2023);