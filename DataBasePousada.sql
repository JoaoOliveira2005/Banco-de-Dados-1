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




















