create database if not exists Pousada;

use Pousada;


create table hospede (
    id_hospede int primary key auto_increment,
    nome varchar(100) not null,
    telefone varchar(15),
    endereco varchar(150)
);

create table reserva (
    id_reserva int primary key auto_increment,
    id_hospede int,
    data_inicio date not null,
    data_fim date not null,
    status varchar(50),
    constraint fk_hospede foreign key (id_hospede) references hospede(id_hospede)
);



create table quarto (
    id_quarto int primary key auto_increment,
    tipo varchar(50) not null,
    preco decimal(10, 2) not null
);

create table reserva_quarto (
    id_reserva_quarto int primary key auto_increment,
    id_reserva int,
    id_quarto int,
    constraint fk_reserva foreign key (id_reserva) references reserva(id_reserva),
    constraint fk_quarto foreign key (id_quarto) references quarto(id_quarto)
);

create table pagamento (
    id_pagamento int primary key auto_increment,
    id_reserva int unique,
    valor decimal(10, 2) not null,
    data_pagamento date not null,
    constraint fk_reserva_pagamento foreign key (id_reserva) references reserva(id_reserva)
);


---INSERINDO OS DADOS=


INSERT INTO Hospede (Nome, Telefone, Endereco) VALUES 
('João Oliveira', '61987654321', 'Rua das Flores, 123'),
('Pedro Calil', '61912345678', 'Avenida Brasil, 456'),
('Camila Ventura', '61923456789', 'Rua Sete de Setembro, 789'),
('Matheus Ventura', '61934567890', 'Rua das Acácias, 101'),
('Maria luisa', '61945678901', 'Avenida Paulista, 202');

INSERT INTO Quarto (Tipo, Preco) VALUES 
('Standard', 150.00),
('executivo', 300.00),
('presidencial', 500.00);

INSERT INTO Reserva (ID_Hospede, Data_Inicio, Data_Fim, Status) VALUES 
(1, '2024-11-15', '2024-11-20', 'Confirmada'),
(2, '2024-11-16', '2024-11-22', 'Confirmada'),
(3, '2024-11-18', '2024-11-25', 'Pendente'),
(4, '2024-11-20', '2024-11-27', 'Cancelada'),
(5, '2024-11-22', '2024-11-28', 'Confirmada');


INSERT INTO Reserva_Quarto (ID_Reserva, ID_Quarto) VALUES  
(1, 1), 
(1, 2), 
(2, 3);


INSERT INTO Pagamento (ID_Reserva, Valor, Data_Pagamento) VALUES 
(1, 750.00, '2024-11-14'),
(2, 900.00, '2024-11-15'),
(3, 1500.00, '2024-11-17'),
(4, 600.00, '2024-11-19'),
(5, 1050.00, '2024-11-21');



--- principais consultas em SQL



-- 1. Todas as reservas confirmadas, listando também o hóspede, a data de início e a data de fim da reserva.


SELECT r.*, h.nome AS nome_hospede
FROM Reserva r
INNER JOIN Hospede h ON r.ID_Hospede = h.ID_Hospede
WHERE r.Status = 'Confirmada';


-- 2. Todas as reservas e os quartos associados, listando a data de início, data de fim, o tipo de quarto e o preço.


SELECT r.ID_Reserva, r.Data_Inicio, r.Data_Fim, q.Tipo, q.Preco
FROM Reserva r
INNER JOIN Reserva_Quarto rq ON r.ID_Reserva = rq.ID_Reserva
INNER JOIN Quarto q ON rq.ID_Quarto = q.ID_Quarto;



-- 3. Todas as reservas canceladas ou pendentes, listando o hóspede e a data de início e fim da reserva.


SELECT r.*, h.nome AS nome_hospede
FROM Reserva r
INNER JOIN Hospede h ON r.ID_Hospede = h.ID_Hospede
WHERE r.Status IN ('Cancelada', 'Pendente');

-- 4. Valor total de pagamento para cada reserva, listando também o hóspede e as datas da reserva.


SELECT p.ID_Pagamento, h.nome AS nome_hospede, r.Data_Inicio, r.Data_Fim, p.Valor AS valor_pagamento
FROM Pagamento p
INNER JOIN Reserva r ON p.ID_Reserva = r.ID_Reserva
INNER JOIN Hospede h ON r.ID_Hospede = h.ID_Hospede;

-- 5. Listagem de todas as reservas com mais de um quarto reservado.


SELECT r.ID_Reserva, h.nome AS nome_hospede, COUNT(rq.ID_Quarto) AS qtd_quartos
FROM Reserva r
INNER JOIN Reserva_Quarto rq ON r.ID_Reserva = rq.ID_Reserva
INNER JOIN Hospede h ON r.ID_Hospede = h.ID_Hospede
GROUP BY r.ID_Reserva
HAVING COUNT(rq.ID_Quarto) > 1;


-- 7. Quartos que ainda não foram reservados.
SELECT *
FROM Quarto q
WHERE q.ID_Quarto NOT IN (
    SELECT DISTINCT rq.ID_Quarto
    FROM Reserva_Quarto rq
);

-- 8. Todas as reservas com os respectivos dados do pagamento, incluindo valor e data do pagamento.
SELECT r.ID_Reserva, h.nome AS nome_hospede, p.Valor AS valor_pagamento, p.Data_Pagamento
FROM Reserva r
INNER JOIN Pagamento p ON r.ID_Reserva = p.ID_Reserva
INNER JOIN Hospede h ON r.ID_Hospede = h.ID_Hospede;



















