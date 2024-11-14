# Banco-de-Dados-1

Trabalho 01 – TP1

1)
Ramo de Atuação:
 O negócio é uma pousada situada na Chapada dos Veadeiros, especializada em hospedagem para turistas que buscam descanso e contato com a natureza.

Serviços e Produtos Comercializados:
 A pousada oferece: 
	- Acomodação para estadias curtas e longas.
	- Café da manhã com produtos regionais.
 	-Piscina e área de lazer.
	-Serviço de limpeza de quartos.

Principais Atores:
Proprietários:  Administram e tomam decisões estratégicas para o negócio.	
Funcionários:  Compreendem equipe de recepção, limpeza e manutenção, cuidando do bem-estar dos hóspedes.
Fornecedores Locais:  Fornecem alimentos e produtos regionais, apoiando o comércio local.
Clientes:  Principalmente turistas atraídos pelas belezas naturais da Chapada dos Veadeiros.
Principais Produtos e Dados Essenciais:  Os produtos principais são pacotes de hospedagem com café da manhã incluso, além de acesso à área de lazer com piscina.

Fluxos de Processos Cotidianos:
Reserva e Check-in: Reservas são realizadas online ou por telefone. No check-in, a equipe recepciona os hóspedes e fornece informações sobre a pousada.
Hospedagem e Serviços: A equipe oferece café da manhã, limpeza dos quartos e suporte geral para assegurar uma experiência agradável.
Checkout e Avaliação: Os hóspedes realizam o checkout e são incentivados a deixar feedback sobre a estadia.


Regras e Restrições:

Política de Reservas: Reservas devem ser realizadas com antecedência e possuem políticas de cancelamento específicas.
Política de Animais: Animais de estimação são permitidos mediante pagamento de uma taxa e com comunicação prévia.
Horário de Silêncio: É mantido um horário de silêncio para garantir o descanso de todos os hóspedes.

A pousada oferece uma estadia tranquila e confortável, proporcionando uma experiência relaxante em meio à natureza da Chapada dos Veadeiros.


___________________________________________________________

2)
Modelo Conceitual para a Pousada:
Entidades e Atributos:

Hóspede:
ID_Hóspede (chave primária)
Nome
Telefone
Endereço

Reserva:
ID_Reserva (chave primária)
Data_Início
Data_Fim
Status

Quarto:
ID_Quarto (chave primária)
tipo
Preço

Pagamento:
ID_Pagamento (chave primária)
Valor
Data_Pagamento

Relacionamentos e Cardinalidades:

Hóspede - Reserva:
Um Hóspede pode fazer várias Reservas (1), e cada Reserva está associada a um único Hóspede.

Reserva - Quarto:
Uma Reserva pode incluir um ou mais Quartos (N), e cada Quarto pode ser reservado em várias Reservas.

Reserva - Pagamento:
Cada Reserva tem um único Pagamento (1:1), e cada Pagamento está associado a uma única Reserva.


Diagrama Entidade-Relacionamento para a Pousada:
 
Hóspede - Reserva: (um hóspede faz uma ou mais reservas, e cada reserva pertence a um hóspede). 
(1 hóspede para várias reservas).

Reserva - Quarto: Relacionamento Inclui (uma reserva pode incluir um ou mais quartos, e cada quarto pode ser incluído em várias reservas). No losango, escreva "Inclui" com cardinalidade N
.
Reserva - Pagamento: Relacionamento Possui (cada reserva possui um pagamento, e cada pagamento pertence a uma única reserva). No losango, escreva "Possui" e adicione a cardinalidade 1:1.

___________________________________________________________

3)
Modelo Lógico para a pousada:
Diagrama de Engenharia de Informação:

 


___________________________________________________________

4)  
 Modelo Físico, especificando necessariamente os tipos de dados, tamanhos, domínios, chaves primárias, chavesestrangeiras e qualquer restrição necessária;

⦁	1. Tabela Hóspede:
⦁	 ID_Hospede: Inteiro, chave primária, autoincremento.
⦁	 Nome: Texto com no máximo 100 caracteres, obrigatório.
⦁	  Telefone: Texto com no máximo 15 caracteres (ajuste para o formato local).
⦁	  Endereco: Texto com no máximo 150 caracteres

2. Tabela Reserva:
⦁	 ID_Reserva: Inteiro, chave primária, autoincremento.
⦁	 ID_Hospede: Inteiro, chave estrangeira que referencia a tabela Hospede.
⦁	Data_Inicio: Tipo data, obrigatório.
⦁	 Data_Fim: Tipo data, obrigatório.
⦁	 Status: Enumeração com valores permitidos ('Pendente', 'Confirmada', 'Cancelada').


3. Tabela Quarto:
⦁	ID_Quarto: Inteiro, chave primária, autoincremento.
⦁	Tipo: Texto com no máximo 50 caracteres, obrigatório.
⦁	Preço: Decimal com precisão de duas casas decimais, obrigatório.

4. Tabela Reserva_Quarto (Tabela intermediária para o relacionamento N):
⦁	ID_Reserva_Quarto: Inteiro, chave primária, autoincremento.
⦁	ID_Reserva: Inteiro, chave estrangeira que referencia a tabela Reserva.
⦁	ID_Quarto: Inteiro, chave estrangeira que referencia a tabela Quarto.

5. Tabela Pagamento:
⦁	ID_Pagamento: Inteiro, chave primária, autoincremento.
⦁	ID_Reserva: Inteiro, chave estrangeira que referencia a tabela Reserva, deve ser único para garantir o relacionamento 1:1.
⦁	Valor: Decimal com precisão de duas casas decimais, obrigatório.
⦁	Data_Pagamento: Tipo data, obrigatório.

5.
Baseado na análise das três formas normais (1FN, 2FN e 3FN), o modelo de dados parece estar adequadamente normalizado.

Tabelas Normalizadas:

1) Tabela Hóspede.
⦁	ID_Hóspede (INT, chave primária, autoincremento)
⦁	Nome (VARCHAR)
⦁	Telefone (VARCHAR)
⦁	Endereço (VARCHAR)

2) Tabela Reserva.
⦁	ID_Reserva (INT, chave primária, autoincremento)
⦁	ID_Hóspede (INT, chave estrangeira que referencia Hóspede)
⦁	Data_Inicio (DATE, obrigatório)
⦁	Data_Fim (DATE, obrigatório)
⦁	Status (VARCHAR)

3) Tabela Quarto.
⦁	ID_Quarto (INT, chave primária, autoincremento)
⦁	Tipo (VARCHAR)
⦁	Preço (DECIMAL(10,2), obrigatório)

4) Tabela Reserva_Quarto (tabela de junção para relação N
entre Reserva e Quarto).
⦁	ID_Reserva_Quarto (INT, chave primária, autoincremento)
⦁	ID_Reserva (INT, chave estrangeira que referencia Reserva)
⦁	ID_Quarto (INT, chave estrangeira que referencia Quarto)

5) Tabela Pagamento.
⦁	ID_Pagamento (INT, chave primária, autoincremento)
⦁	ID_Reserva (INT, chave estrangeira que referencia Reserva, deve ser único para garantir relação 1:1)
⦁	Valor (DECIMAL(10,2), obrigatório)
⦁	Data_Pagamento (DATE, obrigatório)
