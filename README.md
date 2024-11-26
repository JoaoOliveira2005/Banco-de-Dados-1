# Trabalho 01 – TP1 - POUSADA BANCO DE DADOS


# 1. Ramo de Atuação e Serviços

## Ramo de Atuação
O negócio é uma pousada situada na **Chapada dos Veadeiros**, especializada em hospedagem para turistas que buscam descanso e contato com a natureza.

## Serviços e Produtos Comercializados
A pousada oferece:

- **Acomodação** para estadias curtas e longas.
- **Café da manhã** com produtos regionais.
- **Piscina** e área de lazer.
- **Serviço de limpeza de quartos**.

## Principais Atores

- **Proprietários**: Administram e tomam decisões estratégicas para o negócio.
- **Funcionários**: Compreendem equipe de recepção, limpeza e manutenção, cuidando do bem-estar dos hóspedes.
- **Fornecedores Locais**: Fornecem alimentos e produtos regionais, apoiando o comércio local.
- **Clientes**: Principalmente turistas atraídos pelas belezas naturais da Chapada dos Veadeiros.

## Principais Produtos e Dados Essenciais
Os produtos principais são **pacotes de hospedagem** com café da manhã incluso, além de acesso à área de lazer com piscina.

## Fluxos de Processos Cotidianos

1. **Reserva e Check-in**: Reservas são realizadas online ou por telefone. No check-in, a equipe recepciona os hóspedes e fornece informações sobre a pousada.
2. **Hospedagem e Serviços**: A equipe oferece café da manhã, limpeza dos quartos e suporte geral para assegurar uma experiência agradável.
3. **Checkout e Avaliação**: Os hóspedes realizam o checkout e são incentivados a deixar feedback sobre a estadia.

## Regras e Restrições

- **Política de Reservas**: Reservas devem ser realizadas com antecedência e possuem políticas de cancelamento específicas.
- **Política de Animais**: Animais de estimação são permitidos mediante pagamento de uma taxa e com comunicação prévia.
- **Horário de Silêncio**: É mantido um horário de silêncio para garantir o descanso de todos os hóspedes.

A pousada oferece uma estadia tranquila e confortável, proporcionando uma experiência relaxante em meio à natureza da Chapada dos Veadeiros.


---
# 2. Modelo Conceitual para a Pousada

### Entidades e Atributos

- **Hóspede**
  - `ID_Hóspede` (chave primária)
  - `Nome`
  - `Telefone`
  - `Endereço`

- **Reserva**
  - `ID_Reserva` (chave primária)
  - `Data_Início`
  - `Data_Fim`
  - `Status`

- **Quarto**
  - `ID_Quarto` (chave primária)
  - `Tipo`
  - `Preço`

- **Pagamento**
  - `ID_Pagamento` (chave primária)
  - `Valor`
  - `Data_Pagamento`

### Relacionamentos e Cardinalidades

- **Hóspede - Reserva**: Um Hóspede pode fazer várias Reservas (1:N), e cada Reserva está associada a um único Hóspede.

- **Reserva - Quarto**: Uma Reserva pode incluir um ou mais Quartos (N:M), e cada Quarto pode ser reservado em várias Reservas.

- **Reserva - Pagamento**: Cada Reserva possui um único Pagamento (1:1), e cada Pagamento está associado a uma única Reserva.

### Diagrama Entidade-Relacionamento:

</p>
<br>
<img align='center' src='Diagrama Conceitual.PNG'/>
<br>
<p>

---

# 3. Modelo Lógico para a Pousada:

## Modelo Lógico do Banco de Dados da Pousada

## Estrutura das Tabelas

### 1. Tabela Hóspede
Contém informações dos hóspedes da pousada.

| Coluna      | Tipo         | Descrição                              |
|-------------|--------------|----------------------------------------|
| `id_hospede`| `INT`        | Identificador único do hóspede; chave primária. |
| `nome`      | `VARCHAR(100)` | Nome completo do hóspede.             |
| `telefone`  | `VARCHAR(15)`  | Telefone de contato do hóspede.       |
| `endereco`  | `VARCHAR(150)` | Endereço residencial do hóspede.      |

### 2. Tabela Reserva
Registra as reservas realizadas pelos hóspedes.

| Coluna       | Tipo     | Descrição                              |
|--------------|----------|----------------------------------------|
| `id_reserva` | `INT`    | Identificador único da reserva; chave primária. |
| `id_hospede` | `INT`    | Chave estrangeira para `Hóspede(id_hospede)`. |
| `data_inicio`| `DATE`   | Data de início da reserva.            |
| `data_fim`   | `DATE`   | Data de término da reserva.           |
| `status`     | `ENUM`   | Estado da reserva: valores permitidos são 'Pendente', 'Confirmada', 'Cancelada'. |

### 3. Tabela Quarto
Armazena informações sobre os quartos disponíveis na pousada.

| Coluna      | Tipo          | Descrição                            |
|-------------|---------------|--------------------------------------|
| `id_quarto` | `INT`         | Identificador único do quarto; chave primária. |
| `tipo`      | `VARCHAR(50)` | Tipo do quarto (e.g., suíte, standard). |
| `preco`     | `DECIMAL(10,2)`| Preço da diária do quarto.          |

### 4. Tabela Reserva_Quarto (Tabela Associativa)
Relaciona as reservas com os quartos.

| Coluna           | Tipo | Descrição                                |
|------------------|------|------------------------------------------|
| `id_reserva_quarto` | `INT` | Identificador único; chave primária. |
| `id_reserva`    | `INT` | Chave estrangeira para `Reserva(id_reserva)`. |
| `id_quarto`     | `INT` | Chave estrangeira para `Quarto(id_quarto)`. |

### 5. Tabela Pagamento
Armazena informações dos pagamentos realizados para as reservas.

| Coluna            | Tipo         | Descrição                              |
|-------------------|--------------|----------------------------------------|
| `id_pagamento`    | `INT`        | Identificador único do pagamento; chave primária. |
| `id_reserva`      | `INT`        | Chave estrangeira para `Reserva(id_reserva)`, relacionamento 1:1. |
| `valor`           | `DECIMAL(10,2)` | Valor do pagamento efetuado.         |
| `data_pagamento`  | `DATE`       | Data em que o pagamento foi realizado. |


Diagrama de Engenharia de Informação:


</p>
<br>
<img align='center' src='Diagrama (2).PNG'/>
<br>
<p>


---

# 4. Modelo Físico

Abaixo estão as definições de tabelas, tipos de dados, tamanhos, domínios, chaves primárias, chaves estrangeiras e restrições necessárias:

### Tabela Hóspede
- `ID_Hospede`: Inteiro, chave primária, autoincremento.
- `Nome`: VARCHAR(100), obrigatório.
- `Telefone`: VARCHAR(15).
- `Endereco`: VARCHAR(150).

### Tabela Reserva
- `ID_Reserva`: Inteiro, chave primária, autoincremento.
- `ID_Hospede`: Inteiro, chave estrangeira que referencia `Hóspede`.
- `Data_Inicio`: DATE, obrigatório.
- `Data_Fim`: DATE, obrigatório.
- `Status`: ENUM('Pendente', 'Confirmada', 'Cancelada').

### Tabela Quarto
- `ID_Quarto`: Inteiro, chave primária, autoincremento.
- `Tipo`: VARCHAR(50), obrigatório.
- `Preço`: DECIMAL(10,2), obrigatório.

### Tabela Reserva_Quarto
Tabela intermediária para o relacionamento N:M entre `Reserva` e `Quarto`.
- `ID_Reserva_Quarto`: Inteiro, chave primária, autoincremento.
- `ID_Reserva`: Inteiro, chave estrangeira que referencia `Reserva`.
- `ID_Quarto`: Inteiro, chave estrangeira que referencia `Quarto`.

### Tabela Pagamento
- `ID_Pagamento`: Inteiro, chave primária, autoincremento.
- `ID_Reserva`: Inteiro, chave estrangeira única para garantir o relacionamento 1:1 com `Reserva`.
- `Valor`: DECIMAL(10,2), obrigatório.
- `Data_Pagamento`: DATE, obrigatório.

---

# 5) Normalização

Baseado na análise das três formas normais (1FN, 2FN e 3FN), o modelo de dados está normalizado.


## Tabelas Normalizadas:

### Tabela Hóspede
- `ID_Hóspede` (INT, chave primária, autoincremento)
- `Nome` (VARCHAR)
- `Telefone` (VARCHAR)
- `Endereço` (VARCHAR)

### Tabela Reserva
- `ID_Reserva` (INT, chave primária, autoincremento)
- `ID_Hóspede` (INT, chave estrangeira que referencia `Hóspede`)
- `Data_Inicio` (DATE, obrigatório)
- `Data_Fim` (DATE, obrigatório)
- `Status` (VARCHAR)

### Tabela Quarto
- `ID_Quarto` (INT, chave primária, autoincremento)
- `Tipo` (VARCHAR)
- `Preço` (DECIMAL(10,2), obrigatório)

### Tabela Reserva_Quarto
Tabela de junção para a relação N:M entre `Reserva` e `Quarto`.
- `ID_Reserva_Quarto` (INT, chave primária, autoincremento)
- `ID_Reserva` (INT, chave estrangeira que referencia `Reserva`)
- `ID_Quarto` (INT, chave estrangeira que referencia `Quarto`)

### Tabela Pagamento
- `ID_Pagamento` (INT, chave primária, autoincremento)
- `ID_Reserva` (INT, chave estrangeira única para garantir relação 1:1 com `Reserva`)
- `Valor` (DECIMAL(10,2), obrigatório)
- `Data_Pagamento` (DATE, obrigatório)

</p>
<br>
<img align='center' src='diagrama novo2.PNG'/>
<br>
<p>

---

# 6)

## Scripts em SQL DDL para criação do banco de dados e respectivas tabelas estão em DataBasePousada.sql

---

# 7)

## Scripts em SQL DML para inserção de dados fictícios estão em DataBasePousada.sql

---

# 8)
## Elaboração das principais consultas em SQL estão em DataBasePousada.sql

---

# FIM





