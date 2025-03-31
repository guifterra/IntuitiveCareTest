from flask import Flask, request, jsonify
import pandas as pd
from flask_cors import CORS

app = Flask(__name__)

# Habilitar CORS para todas as rotas
CORS(app)  

# Carregar dados do CSV
def carregar_dados():
    try:
        df = pd.read_csv("Relatorio_cadop.csv", delimiter=";")
        return df
    except Exception as e:
        print("Erro ao carregar CSV:", e)
        return pd.DataFrame()

df_operadoras = carregar_dados()

@app.route("/buscar", methods=["GET"])
def buscar_operadora():
    termo = request.args.get("termo", "").lower()
    if termo and not df_operadoras.empty:
        resultados = df_operadoras[df_operadoras["Nome_Fantasia"].str.lower().str.contains(termo, na=False)]
        return jsonify(resultados.to_dict(orient="records"))
    return jsonify([])

if __name__ == "__main__":
    app.run(debug=True)
