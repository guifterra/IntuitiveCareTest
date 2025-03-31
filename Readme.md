# 📌 IntuitiveCare - Teste

Bem-vindo ao repositório do **IntuitiveCare - Teste**! Aqui você encontrará diferentes testes técnicos relacionados a **Web Scraping, Transformação de Dados, Banco de Dados e API**.

## 📄 Autor
👤 **Guilherme Fabiano Terra da Silva**  
📧 guilhermeterra391@gmail.com

---

## 🕵️‍♂️ Teste de Web Scraping

### 🚀 Como executar
1. Clique no **Executar**, que ele rodará o Java automaticamente.
2. Caso prefira executar pelo terminal, siga os passos abaixo:
   - Abra o **CMD** na pasta do projeto.
   - Insira o comando:
     ```sh
     java -cp "bin/jsoup-1.19.1.jar;bin/MeuPrograma.jar" WebScraper
     ```

---

## 🔄 Teste de Transformação de Dados

### 🛠️ Passos para executar
1. Instale o **Maven** (caso ainda não tenha instalado).
2. Acesse a pasta do projeto pelo **CMD**:
   ```sh
   cd "Teste de Transformação de Dados"
   ```
3. Instale as dependências executando:
   ```sh
   mvn clean install
   ```
4. Execute o projeto:
   ```sh
   mvn exec:java
   ```
   - Isso gerará um **CSV** e um **ZIP** na raiz do projeto.

---

## 🗄️ Teste de Banco de Dados

### 🔧 Configuração
1. Navegue até a pasta **Teste de Banco de Dados**.
2. Extraia os arquivos **.rar**.
3. Abra os scripts no **MySQL WorkBench**.
4. Execute os scripts na seguinte ordem:
   - `01-CriaTabelas.sql`
   - `02-ImportaConteudo.sql`
   - `03-QueryAnalitica.sql`
5. **Atualize o Path** do carregamento dos CSVs.
6. Execute os scripts em sequência.

📝 **Observação**: O arquivo `Script.sql` contém a junção dos três scripts acima.

---

## 🌐 Teste de API

### ⚙️ Configuração
1. Instale o **Python** e o **Node.js** (caso ainda não tenha instalado).
2. Acesse a pasta do projeto pelo **CMD**:
   ```sh
   cd "Teste de API"
   ```
3. Acesse a pasta do servidor:
   ```sh
   cd servidor
   ```
4. Inicie o servidor executando:
   ```sh
   python server.py
   ```
   - O servidor rodará em: **http://127.0.0.1:5000**

5. Acesse a pasta do frontend:
   ```sh
   cd projeto
   ```
6. Instale as dependências:
   ```sh
   npm i
   ```
7. Inicie o projeto Vue:
   ```sh
   npm run serve
   ```
   - O frontend estará disponível em: **http://localhost:8080/**

### ❗ Possíveis erros
Se houver problemas de **CORS** ou requisições, tente os seguintes comandos:
- No projeto frontend:
  ```sh
  npm install axios
  ```
- No servidor backend:
  ```sh
  pip install flask-cors
  ```

