<style>
  h1 {
    color: #58A6FF; /* Azul claro para o título principal */
    border-bottom: 2px solid #30363D; /* Adiciona uma linha sutil abaixo do título */
    padding-bottom: 8px;
  }
  h2 {
    color: #8AB9FF; /* Azul mais clarinho para os subtítulos */
    border-bottom: 1px solid #30363D;
    padding-bottom: 6px;
  }
  h3 {
      color: #79C0FF;
      border-bottom: 1px solid #30363D;
      padding-bottom: 4px;
  }
  h4 {
      color: #C9D1D9;
  }
  body {
      background-color: #0D1117;
      color: #C9D1D9;
  }
  table {
      border-collapse: collapse;
      width: 100%;
      margin-top: 1em;
      margin-bottom: 1em;
  }
  th, td {
      border: 1px solid #30363D;
      padding: 8px 12px;
      text-align: left;
  }
  th {
      background-color: #161B22;
  }
  code {
      background-color: rgba(138, 185, 255, 0.15);
      padding: 0.2em 0.4em;
      border-radius: 6px;
      font-family: monospace;
  }
</style>

# Projeto final - Programação Funcional

Este é o projeto final da cadeira de Programação Funcional, focado no desenvolvimento de uma aplicação de finanças pessoais.

## Equipe

| Nome           | Matrícula |
| :------------- | :-------- |
| Daniel Alves   | `1821950` |
| José Maurício  | `2310394` |

## Links

### Vídeo Explicativo  
[www.teste.com.br](http://www.teste.com.br)

### GitHub

- **Frontend**  
  [https://github.com/MauricioCE/prog_func_trab_final_frontend](https://github.com/MauricioCE/prog_func_trab_final_frontend)

- **Backend**  
  [https://github.com/MauricioCE/prog_func_trab_final_backend](https://github.com/MauricioCE/prog_func_trab_final_backend)

<h2>Funcionalidades Desenvolvidas</h2>

O projeto é dividido em três partes principais: o **Frontend**, **Backend** e **Banco de Dados**.

De formal geral, implementamos todos os requisitos do trabalho. Abaixo seguem o detalhamento das implementações.

### Frontend

- **Autenticação**:
  - Tela de Login de usuário.
  - Tela de Registro de novo usuário.
- **Dashboard**:
  - **Gerenciamento de Transações**:
    - Criação de novas transações (receitas ou despesas).
    - Edição de transações existentes.
    - Exclusão de transações.
  - **Gerenciamento de Tags**:
    - Criação de novas tags para categorização.
    - Exclusão de tags existentes.
- **Rota Inválida**:
  - Uma tela de "Não Encontrado" (404) é exibida para qualquer rota não definida na aplicação.

### Backend

#### API Users

| Método HTTP     | Endpoint          | Descrição                                  |
| :-------------- | :---------------- | :----------------------------------------- |
| `GET`           | `/api/users`      | Lista todos os usuários.                   |
| `GET`           | `/api/users/:id`  | Busca um usuário específico pelo ID.       |
| `POST`          | `/api/users`      | Cria um novo usuário.                      |
| `PUT` / `PATCH` | `/api/users/:id`  | Atualiza os dados de um usuário existente. |
| `DELETE`        | `/api/users/:id`  | Exclui um usuário.                         |

---

#### Criptografia

Para a criptografia da senha do usuário foi utilizada a biblioteca pbkdf2_elixir, que é feita totalmente em elixir, o que descarta a necessidade da utilização de bibliotecas que utilizam c/c++ por debaixo dos panos.

---

#### API Transactions

| Método HTTP | Endpoint                  | Descrição                               |
| :---------- | :------------------------ | :-------------------------------------- |
| `GET`       | `/api/transactions`       | Lista todas as transações.              |
| `GET`       | `/api/transactions/:id`   | Busca uma transação específica pelo ID. |
| `POST`      | `/api/transactions`       | Cria uma nova transação.                |
| `PUT` / `PATCH` | `/api/transactions/:id` | Atualiza uma transação existente.       |
| `DELETE`    | `/api/transactions/:id`   | Exclui uma transação.                   |                                               |

---

#### API Tags

| Método HTTP | Endpoint        | Descrição                          |
| :---------- | :-------------- | :--------------------------------- |
| `GET`       | `/api/tags`     | Lista todas as tags.               |
| `GET`       | `/api/tags/:id` | Busca uma tag específica pelo seu ID. |
| `POST`      | `/api/tags`     | Cria uma nova tag.                 |
| `PUT` / `PATCH` | `/api/tags/:id` | Atualiza uma tag existente.        |
| `DELETE`    | `/api/tags/:id` | Exclui uma tag.                    |

---

### Banco de Dados

Utilizamos o **PostgreSQL** como sistema gerenciador de banco de dados. As tabelas criadas foram:

#### Tabelas

- **`users`**
  - Armazena os dados dos usuários cadastrados no sistema.

- **`transactions`**
  - Registra as transações realizadas pelos usuários.
  - Cada transação pertence a um usuário.

- **`tags`**
  - Contém as categorias (tags) definidas pelos usuários.

- **`transactions_tags`**
  - Tabela de associação para a relação N:N entre `transactions` e `tags`.


