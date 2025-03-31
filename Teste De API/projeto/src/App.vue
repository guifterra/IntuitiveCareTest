<template>
  <div class="container">
    <h1>Busca de Operadoras - Guilherme Terra</h1>
    <input v-model="termo" placeholder="Digite o nome da operadora" @input="buscarOperadoras" />

    <table v-if="operadoras.length > 0" class="operadoras-table">
      <thead>
        <tr>
          <th>Nome da Operadora</th>
          <th>Cidade</th>
          <th>UF</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(operadora, index) in operadoras" :key="index">
          <td>{{ operadora.Nome_Fantasia || 'Nome não disponível' }}</td>
          <td>{{ operadora.Cidade || 'Cidade não disponível' }}</td>
          <td>{{ operadora.UF || 'UF não disponível' }}</td>
        </tr>
      </tbody>
    </table>

    <p v-else>Nenhuma operadora encontrada.</p>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      termo: "Odonto", // Inicializando com "Odonto"
      operadoras: []
    };
  },
  methods: {
    async buscarOperadoras() {
      if (this.termo.length > 2) {
        try {
          const response = await axios.get(`http://127.0.0.1:5000/buscar?termo=${this.termo}`);
          console.log("Tipo de resposta:", typeof response.data);
          console.log("Resposta completa:", response.data);

          if (typeof response.data === 'string') {
            // Remover possíveis caracteres inválidos (exemplo: NaN, etc.) ou outras falhas de formatação
            let cleanedData = response.data.replace(/NaN/g, '"NaN"'); 
            console.log("Dados limpos:", cleanedData);

            try {
              const parsedData = JSON.parse(cleanedData);
              
              // Verificar se o parsing foi bem-sucedido e é um array
              if (Array.isArray(parsedData)) {
                this.operadoras = parsedData;
              } else {
                console.error("A resposta não é um array após o parse.");
                this.operadoras = [];
              }
            } catch (error) {
              console.error("Erro ao tentar converter a string em JSON:", error);
              this.operadoras = [];
            }
          } else {
            console.error("A resposta não é uma string.");
            this.operadoras = [];
          }
        } catch (error) {
          console.error("Erro ao buscar operadoras", error);
          this.operadoras = [];
        }
      } else {
        this.operadoras = [];
      }
    }
  },
  created() {
    this.buscarOperadoras();
  }
};
</script>

<style>
.container {
  max-width: 800px;
  margin: auto;
  text-align: center;
  padding: 20px;
}

input {
  width: 100%;
  padding: 12px;
  margin-bottom: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
  text-align: left;
}

th, td {
  padding: 10px;
  border: 1px solid #ddd;
}

th {
  background-color: #f4f4f4;
  font-weight: bold;
}

tr:nth-child(even) {
  background-color: #f9f9f9;
}

tr:hover {
  background-color: #f1f1f1;
}

p {
  font-size: 16px;
  color: #666;
}
</style>
