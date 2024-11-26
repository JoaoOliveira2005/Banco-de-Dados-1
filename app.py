import mysql.connector
from flask import Flask, request, render_template

app = Flask(__name__)

# Conexão com o banco de dados
def get_db_connection():
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Joca1313!", 
        database="pousada"     
    )
    return connection

@app.route('/')
def index():
    return render_template('index.html')  

@app.route('/hospede', methods=['GET', 'POST'])
def hospede():
    if request.method == 'POST':
        nome = request.form['nome']
        telefone = request.form['telefone']
        endereco = request.form['endereco']

        try:
            connection = get_db_connection()
            cursor = connection.cursor()
            cursor.execute('INSERT INTO Hospede (nome, telefone, endereco) VALUES (%s, %s, %s)', 
                           (nome, telefone, endereco))
            connection.commit()
            cursor.close()
            connection.close()
            return render_template('sucesso.html', mensagem="Hóspede cadastrado com sucesso!")
        except mysql.connector.Error as err:
            return f"Erro ao conectar ao banco de dados: {err}"

    return render_template('hospede.html')

@app.route('/reserva', methods=['GET', 'POST'])
def reserva():
    if request.method == 'POST':
        id_hospede = request.form['id_hospede']
        data_inicio = request.form['data_inicio']
        data_fim = request.form['data_fim']
        status = request.form['status']

        try:
            connection = get_db_connection()
            cursor = connection.cursor()
            cursor.execute('INSERT INTO Reserva (ID_Hospede, Data_Inicio, Data_Fim, Status) VALUES (%s, %s, %s, %s)', 
                           (id_hospede, data_inicio, data_fim, status))
            connection.commit()
            cursor.close()
            connection.close()
            return render_template('sucesso.html', mensagem="Reserva cadastrada com sucesso!")
        except mysql.connector.Error as err:
            return f"Erro ao conectar ao banco de dados: {err}"

    return render_template('reserva.html')


@app.route('/quarto', methods=['GET', 'POST'])
def quarto():
    if request.method == 'POST':
        tipo = request.form['tipo']
        preco = request.form['preco']

        try:
            connection = get_db_connection()
            cursor = connection.cursor()
            cursor.execute('INSERT INTO Quarto (tipo, preco) VALUES (%s, %s)', 
                           (tipo, preco))
            connection.commit()
            cursor.close()
            connection.close()
            return render_template('sucesso.html', mensagem="Quarto cadastrado com sucesso!")
        except mysql.connector.Error as err:
            return f"Erro ao conectar ao banco de dados: {err}"

    return render_template('quarto.html')


@app.route('/pagamento', methods=['GET', 'POST'])
def pagamento():
    if request.method == 'POST':
        id_reserva = request.form['id_reserva']
        valor = request.form['valor']
        data_pagamento = request.form['data_pagamento']

        try:
            connection = get_db_connection()
            cursor = connection.cursor()
            cursor.execute('INSERT INTO Pagamento (ID_Reserva, Valor, Data_Pagamento) VALUES (%s, %s, %s)', 
                           (id_reserva, valor, data_pagamento))
            connection.commit()
            cursor.close()
            connection.close()
            return render_template('sucesso.html', mensagem="Pagamento cadastrado com sucesso!")
        except mysql.connector.Error as err:
            return f"Erro ao conectar ao banco de dados: {err}"

    return render_template('pagamento.html')



if __name__ == '__main__':
    app.run(debug=True)  # Isso é o que você tem atualmente

