import mysql.connector
from openpyxl import Workbook

# Conexão com o banco de dados
def get_db_connection():
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Joca1313!",  # Altere para sua senha
        database="pousada"     # Nome do banco de dados
    )
    return connection

# Função genérica para executar consultas
def executar_consulta(query):
    try:
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)
        cursor.execute(query)
        resultados = cursor.fetchall()
        cursor.close()
        connection.close()
        return resultados
    except mysql.connector.Error as err:
        print(f"Erro ao executar consulta: {err}")
        return []

# Função para salvar em Excel
def salvar_em_excel(nome_arquivo, titulo_planilha, resultados):
    wb = Workbook()
    ws = wb.active
    ws.title = titulo_planilha

    # Adiciona cabeçalhos
    headers = list(resultados[0].keys())
    ws.append(headers)

    # Adiciona os dados
    for linha in resultados:
        ws.append(list(linha.values()))

    # Salva o arquivo
    wb.save(nome_arquivo)
    print(f"Relatório Excel salvo como {nome_arquivo}")

# Consultas SQL
def reservas_confirmadas():
    query = """
    SELECT r.*, h.nome AS nome_hospede
    FROM Reserva r
    INNER JOIN Hospede h ON r.ID_Hospede = h.ID_Hospede
    WHERE r.Status = 'Confirmada';
    """
    return executar_consulta(query)

def quartos_nao_reservados():
    query = """
    SELECT *
    FROM Quarto q
    WHERE q.ID_Quarto NOT IN (
        SELECT DISTINCT rq.ID_Quarto
        FROM Reserva_Quarto rq
    );
    """
    return executar_consulta(query)

# Consulta 1: Todas as reservas com os respectivos dados do pagamento
def todas_as_informacoes_de_reserva():
    query = """
    SELECT 
        r.ID_Reserva, 
        h.nome AS nome_hospede, 
        p.Valor AS valor_pagamento, 
        p.Data_Pagamento
    FROM Reserva r
    INNER JOIN Pagamento p ON r.ID_Reserva = p.ID_Reserva
    INNER JOIN Hospede h ON r.ID_Hospede = h.ID_Hospede;
    """
    return executar_consulta(query)

# Consulta 2: Valor total de pagamento para cada reserva
def valor_total_por_reserva():
    query = """
    SELECT 
        p.ID_Pagamento, 
        h.nome AS nome_hospede, 
        r.Data_Inicio, 
        r.Data_Fim, 
        p.Valor AS valor_pagamento
    FROM Pagamento p
    INNER JOIN Reserva r ON p.ID_Reserva = r.ID_Reserva
    INNER JOIN Hospede h ON r.ID_Hospede = h.ID_Hospede;
    """
    return executar_consulta(query)

if __name__ == "__main__":
    # Consulta 1: Reservas confirmadas
    reservas = reservas_confirmadas()
    if reservas:
        salvar_em_excel("reservas_confirmadas.xlsx", "Reservas Confirmadas", reservas)

    # Consulta 2: Quartos não reservados
    quartos = quartos_nao_reservados()
    if quartos:
        salvar_em_excel("quartos_nao_reservados.xlsx", "Quartos Não Reservados", quartos)

    # Consulta 3: Todas as reservas com os respectivos dados do pagamento
    informacoes_reserva = todas_as_informacoes_de_reserva()
    if informacoes_reserva:
        salvar_em_excel("todas_as_informacoes_de_reserva.xlsx", "Informações de Reserva", informacoes_reserva)

    # Consulta 4: Valor total de pagamento para cada reserva
    valor_total = valor_total_por_reserva()
    if valor_total:
        salvar_em_excel("valor_total_por_reserva.xlsx", "Valor Total por Reserva", valor_total)
