<style>
  h1 {
    color: #3b6fab; 
    padding-bottom: 8px;
    font-weight: 800;
  }
  h2 {
    color: #3b6fab;
    padding-bottom: 6px;
    font-weight: 600;
  }
  h3 {
      color: #3b6fab;
      padding-bottom: 4px;
      font-weight: 500;
  }
  h4 {
      color: #3b6fab; 
      font-weight: 400;
  }
  
</style>

# Projeto final - Programação Funcional

Este é o projeto final da cadeira de Programação Funcional, focado no desenvolvimento de uma aplicação de finanças pessoais.

## 1. Equipe

| Nome           | Matrícula |
| :------------- | :-------- |
| Daniel Alves   | `1821950` |
| José Maurício  | `2310394` |

## 2. Links

* Vídeo Explicativo  
[https://1drv.ms/v/c/8270184d143370e5/EfcwdYk6lEdCofb818QoKzIBbQWTvgtRupRrb6QG1f4k0g?e=jEmGkD](https://1drv.ms/v/c/8270184d143370e5/EfcwdYk6lEdCofb818QoKzIBbQWTvgtRupRrb6QG1f4k0g?e=jEmGkD)

* Onedrive
[https://1drv.ms/f/c/8270184d143370e5/EqjyOfz6vElMu9I9gIBfBDoBNX5AO2GCgvSGkyLC3xmcTQ?e=y1ZmbA](https://1drv.ms/f/c/8270184d143370e5/EqjyOfz6vElMu9I9gIBfBDoBNX5AO2GCgvSGkyLC3xmcTQ?e=y1ZmbA)


* GitHub **Frontend**  
  [https://github.com/MauricioCE/prog_func_trab_final_frontend](https://github.com/MauricioCE/prog_func_trab_final_frontend)

* GitHub **Backend**  
  [https://github.com/MauricioCE/prog_func_trab_final_backend](https://github.com/MauricioCE/prog_func_trab_final_backend)

## 3. Funcionalidades Desenvolvidas

O projeto é dividido em três partes principais: o **Frontend**, **Backend** e **Banco de Dados**.

De formal geral, implementamos todos os requisitos do trabalho. Abaixo seguem o detalhamento das implementações.

### a. Frontend

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

### b. Backend

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

### c. Banco de Dados

Utilizamos o **PostgreSQL** como sistema gerenciador de banco de dados. As tabelas criadas foram:

#### Tabelas

- **users**:
  - Armazena os dados dos usuários cadastrados no sistema.
- **transactions**
  - Registra as transações realizadas pelos usuários.
  - Cada transação pertence a um usuário.
- **tags**
  - Contém as categorias (tags) definidas pelos usuários.
- **transactions_tags**
  - Tabela de associação para a relação N:N entre `transactions` e `tags`.
