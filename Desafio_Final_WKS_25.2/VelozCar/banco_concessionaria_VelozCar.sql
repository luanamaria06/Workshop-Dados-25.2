CREATE SCHEMA concessionaria_VelozCar;

USE concessionaria_VelozCar;

CREATE TABLE cliente (
Id_cliente INT NOT NULL,
Nome VARCHAR(100) NOT NULL,
CPF CHAR(14) UNIQUE NOT NULL,
Email VARCHAR(250),
Telefone VARCHAR(20),
Endereco VARCHAR(250),
Data_cadastro DATE,
PRIMARY KEY (Id_cliente)
);

CREATE TABLE funcionario (
Id_funcionario INT NOT NULL,
Nome_func VARCHAR(100) NOT NULL,
CPF_func CHAR(14) UNIQUE NOT NULL,
Email_func VARCHAR(250),
Telefone_func VARCHAR(20),
Data_contratacao DATE,
Cargo VARCHAR(100),
PRIMARY KEY (Id_funcionario)
);

CREATE TABLE veiculos (
Id_veiculo INT NOT NULL,
Placa VARCHAR(20) UNIQUE NOT NULL,
Modelo VARCHAR(45),
Cor VARCHAR(45),
Data_fabriacao DATE,
Valor_diaria DECIMAL(10,2),
Status_veiculo VARCHAR(45),
PRIMARY KEY (Id_veiculo)
);

CREATE TABLE manutencao (
Id_manutencao INT NOT NULL,
Veiculo_id INT,
Data_servico DATE,
Custo_servico DECIMAL(10,2),
Responsavel VARCHAR(50),
Desc_servico VARCHAR(250),
PRIMARY KEY (Id_manutencao),
FOREIGN KEY (Veiculo_id) REFERENCES veiculos (Id_veiculo)
);

CREATE TABLE aluguel (
Id_aluguel INT NOT NULL,
Cliente_id INT,
Funcionario_id INT,
Veiculo_id INT,
Status_aluguel VARCHAR(45),
Valor_total DECIMAL(10,2),
Data_inicio DATE,
Data_fim DATE,
PRIMARY KEY (Id_aluguel),
FOREIGN KEY (Cliente_id) REFERENCES cliente (Id_cliente),
FOREIGN KEY (Veiculo_id) REFERENCES veiculos (Id_veiculo),
FOREIGN KEY (Funcionario_id) REFERENCES funcionario (Id_funcionario)
);

CREATE TABLE pagamento (
Id_pagamento INT NOT NULL,
Aluguel_id INT,
Valor_pagamento DECIMAL(10,2),
Data_pagamento DATE,
Metodo_pagamento VARCHAR(45),
Status_pagamento VARCHAR(45),
PRIMARY KEY (Id_pagamento),
FOREIGN KEY (Aluguel_id) REFERENCES aluguel (Id_aluguel)
);

INSERT INTO cliente VALUES
(1, 'Ana Silva', '123.456.789-00', 'ana.silva@email.com', '(83) 99999-0001', 'Rua das Flores, 10', '2024-01-05'),
(2, 'Bruno Souza', '987.654.321-11', 'bruno.souza@email.com', '(83) 99999-0002', 'Av. Central, 123', '2024-02-10'),
(3, 'Carla Lima', '111.222.333-44', 'carla.lima@email.com', '(83) 99999-0003', 'Rua do Sol, 45', '2024-03-15'),
(4, 'Diego Martins', '555.666.777-88', 'diego.martins@email.com', '(83) 99999-0004', 'Rua Nova, 22', '2024-04-20'),
(5, 'Elisa Rocha', '999.888.777-66', 'elisa.rocha@email.com', '(83) 99999-0005', 'Av. Brasil, 333', '2024-05-25'),
(6, 'Fábio Costa', '444.555.666-77', 'fabio.costa@email.com', '(83) 99999-0006', 'Rua Primavera, 50', '2024-06-10'),
(7, 'Gabriela Pinto', '222.333.444-55', 'gabriela.pinto@email.com', '(83) 99999-0007', 'Rua das Laranjeiras, 88', '2024-07-05'),
(8, 'Henrique Alves', '777.888.999-00', 'henrique.alves@email.com', '(83) 99999-0008', 'Av. Horizonte, 101', '2024-08-12'),
(9, 'Isabela Freitas', '333.444.555-66', 'isabela.freitas@email.com', '(83) 99999-0009', 'Rua Vitória, 77', '2024-09-08'),
(10, 'João Mendes', '666.777.888-11', 'joao.mendes@email.com', '(83) 99999-0010', 'Rua das Acácias, 99', '2024-10-01');

INSERT INTO funcionario VALUES
(1, 'Lucas Ferreira', '111.222.333-99', 'lucas.ferreira@email.com', '(83) 98888-0001', '2023-01-10', 'Atendente'),
(2, 'Mariana Oliveira', '444.555.666-88', 'mariana.oliveira@email.com', '(83) 98888-0002', '2023-02-15', 'Gerente'),
(3, 'Pedro Santos', '777.888.999-77', 'pedro.santos@email.com', '(83) 98888-0003', '2023-03-20', 'Atendente'),
(4, 'Fernanda Gomes', '222.333.444-66', 'fernanda.gomes@email.com', '(83) 98888-0004', '2023-04-25', 'Atendente'),
(5, 'Ricardo Lima', '555.666.777-55', 'ricardo.lima@email.com', '(83) 98888-0005', '2023-05-30', 'Mecânico'),
(6, 'Juliana Pereira', '888.999.000-44', 'juliana.pereira@email.com', '(83) 98888-0006', '2023-06-05', 'Atendente'),
(7, 'Tiago Rocha', '333.444.555-33', 'tiago.rocha@email.com', '(83) 98888-0007', '2023-07-10', 'Gerente'),
(8, 'Patrícia Cardoso', '666.777.888-22', 'patricia.cardoso@email.com', '(83) 98888-0008', '2023-08-15', 'Atendente'),
(9, 'André Nunes', '999.000.111-11', 'andre.nunes@email.com', '(83) 98888-0009', '2023-09-20', 'Mecânico'),
(10, 'Vanessa Costa', '123.321.456-12', 'vanessa.costa@email.com', '(83) 98888-0010', '2023-10-25', 'Atendente');

INSERT INTO veiculos VALUES
(1, 'ABC-1234', 'Fiat Uno', 'Vermelho', '2020-03-10', 120.00, 'Disponível'),   
(2, 'DEF-5678', 'Honda Civic', 'Prata', '2019-06-15', 200.00, 'Alugado'),
(3, 'GHI-9012', 'Ford Ka', 'Preto', '2021-01-20', 150.00, 'Disponível'),
(4, 'JKL-3456', 'Toyota Corolla', 'Branco', '2018-11-05', 220.00, 'Manutenção'),
(5, 'MNO-7890', 'Chevrolet Onix', 'Azul', '2022-07-12', 180.00, 'Disponível'),
(6, 'PQR-2345', 'Renault Sandero', 'Cinza', '2020-09-18', 140.00, 'Alugado'),
(7, 'STU-6789', 'Volkswagen Gol', 'Vermelho', '2017-12-22', 130.00, 'Manutenção'),
(8, 'VWX-0123', 'Hyundai HB20', 'Prata', '2021-05-30', 160.00, 'Disponível'),
(9, 'YZA-4567', 'Nissan Versa', 'Preto', '2019-08-25', 170.00, 'Alugado'),
(10, 'BCD-8901', 'Kia Picanto', 'Branco', '2022-02-14', 150.00, 'Disponível');

INSERT INTO manutencao VALUES
(1, 1, '2024-05-10', 300.00, 'Ricardo Lima', 'Troca de óleo e filtro'),
(2, 2, '2024-06-15', 500.00, 'Ricardo Lima', 'Revisão completa do motor'),
(3, 3, '2024-07-20', 250.00, 'Ricardo Lima', 'Troca de pastilhas de freio'),
(4, 4, '2024-08-05', 400.00, 'Ricardo Lima', 'Alinhamento e balanceamento'),
(5, 5, '2024-09-12', 350.00, 'Ricardo Lima', 'Troca de bateria'),
(6, 6, '2024-10-18', 200.00, 'Ricardo Lima', 'Revisão de suspensão'),
(7, 7, '2024-11-22', 150.00, 'Ricardo Lima', 'Troca de pneus'),
(8, 8, '2024-12-30', 450.00, 'Ricardo Lima', 'Revisão de freios'),
(9, 9, '2025-01-15', 300.00, 'Ricardo Lima', 'Troca de óleo e filtros'),
(10, 10, '2025-02-05', 250.00, 'Ricardo Lima', 'Verificação do sistema elétrico');

INSERT INTO aluguel VALUES
(1, 1, 1, 2, 'Ativo', 600.00, '2025-09-01', '2025-09-03'), 
(2, 2, 2, 3, 'Finalizado', 450.00, '2025-08-20', '2025-08-22'),
(3, 3, 3, 5, ' Atrasado', 540.00, '2025-09-05', '2025-09-08'),
(4, 4, 4, 6, 'Finalizado', 280.00, '2025-07-15', '2025-07-17'),
(5, 5, 5, 1, ' Atrasado', 360.00, '2025-09-10', '2025-09-12'),
(6, 6, 6, 4, 'Ativo', 660.00, '2025-06-05', '2025-06-08'),
(7, 7, 7, 7, 'Ativo', 390.00, '2025-09-07', '2025-09-09'),
(8, 8, 8, 8, 'Finalizado', 480.00, '2025-05-10', '2025-05-12'),
(9, 9, 9, 9, ' Atrasado', 510.00, '2025-09-03', '2025-09-06'),
(10, 10, 10, 10, 'Ativo', 450.00, '2025-04-20', '2025-04-22');

INSERT INTO pagamento VALUES
(1, 1, 600.00, '2025-09-01', 'Cartão', 'Concluído'), 
(2, 2, 450.00, '2025-08-20', 'Boleto', 'Cancelado'),
(3, 3, 540.00, '2025-09-05', 'Pix', 'Pendente'),
(4, 4, 280.00, '2025-07-15', 'Cartão', 'Concluído'),
(5, 5, 360.00, '2025-09-10', 'Pix', 'Pendente'),
(6, 6, 660.00, '2025-06-05', 'Boleto', 'Cancelado'),
(7, 7, 390.00, '2025-09-07', 'Cartão', 'Pendente'),
(8, 8, 480.00, '2025-05-10', 'Pix', 'Cancelado'),
(9, 9, 510.00, '2025-09-03', 'Boleto', 'Pendente'),
(10, 10, 450.00, '2025-04-20', 'Cartão', 'Concluído');

SELECT * FROM cliente;

SELECT * FROM funcionario;

SELECT * FROM veiculos;

SELECT * FROM manutencao;

SELECT * FROM aluguel;

SELECT * FROM pagamento;

UPDATE aluguel SET Status_aluguel = 'Finalizado' WHERE Id_aluguel = 7;

UPDATE pagamento SET Status_pagamento = 'Pendente' WHERE Id_pagamento = 8;

SELECT COUNT(*) as Quantidade_de_clientes
FROM cliente;

SELECT MAX(Id_funcionario) 
FROM funcionario;

SELECT AVG(Valor_pagamento) as Média_dos_valores
FROM pagamento;

SELECT SUM(Valor_total) as Soma_caixa
FROM aluguel;

SELECT MIN(Id_manutencao)
FROM manutencao;

SELECT Cor, COUNT(*) as quant_veiculos_cor
FROM veiculos
GROUP BY Cor;

SELECT 
    a.Id_aluguel,
    c.Nome AS Cliente,
    a.Data_inicio,
    a.Data_fim,
    a.Status_aluguel,
    p.Status_pagamento
FROM aluguel a
JOIN cliente c ON a.Cliente_id = c.Id_cliente
JOIN pagamento p ON a.Id_aluguel = p.Aluguel_id
WHERE a.Status_aluguel LIKE '%Atrasado%';

SELECT 
    v.Modelo,
    v.Placa,
    COUNT(m.Id_manutencao) AS Total_servicos,
    SUM(m.Custo_servico) AS Custo_total
FROM veiculos v
LEFT JOIN manutencao m ON v.Id_veiculo = m.Veiculo_id
GROUP BY v.Modelo, v.Placa
ORDER BY Custo_total DESC;
