# 💰 Projeto Saúde Financeira — MicroChallenge Banco de Dados

<p align="center">
  <img src="https://img.shields.io/badge/Database-PostgreSQL-blue?style=for-the-badge&logo=postgresql" alt="PostgreSQL">
  <img src="https://img.shields.io/badge/Language-SQL-orange?style=for-the-badge" alt="SQL">
  <img src="https://img.shields.io/badge/Challenge-Iniciante-green?style=for-the-badge" alt="Iniciante">
</p>

---

## 📌 Sobre o Desafio
Este repositório contém a solução desenvolvida para o **Mentor Driven Challenge** focado em **Saúde Financeira**. O objetivo principal é responder à pergunta essencial: *“Precisa ser um especialista para controlar os gastos financeiros?”*, criando uma estrutura prática capaz de registrar, organizar e analisar gastos pessoais de forma eficiente ao longo do tempo.

- **Duração:** 2 semanas
- **Metodologia:** Aprendizado Baseado em Desafios (CBL)
- **SGBD Utilizado:** PostgreSQL

---

## 🧠 Board: Guiding Questions
Para direcionar a nossa investigação e modelagem, definimos as seguintes perguntas-guia:

1. **Como categorizar os gastos de forma simples?**
   * *Resposta:* Dividindo em grupos essenciais (Alimentação, Transporte, Lazer, Educação) para identificar para onde o dinheiro está indo.
2. **Qual a melhor forma de garantir a consistência dos dados?**
   * *Resposta:* Utilizando chaves estrangeiras (`FOREIGN KEY`) para que nenhum gasto seja registrado sem uma categoria válida e travas de segurança (`CHECK`) para evitar valores negativos.
3. **Como analisar a evolução dos gastos ao longo do tempo?**
   * *Resposta:* Filtrando os registros por datas específicas (`DATE`) e criando índices para otimizar as consultas.

---

## 🗄️ Modelagem do Banco de Dados
Optamos por criar uma estrutura relacional simples e eficiente com **duas tabelas conectadas** para garantir a organização ideal dos dados.

### 📐 Estrutura das Tabelas

#### 1. Tabela `categorias`
Responsável por agrupar os tipos de despesas.
* `id` (SERIAL, Primary Key): Identificador único da categoria.
* `nome` (VARCHAR): Nome do grupo de gasto (ex: Alimentação).

#### 2. Tabela `gastos`
Guarda o histórico do dia a dia.
* `id` (SERIAL, Primary Key): Identificador único do gasto.
* `descricao` (VARCHAR): Detalhe do que foi comprado.
* `valor` (NUMERIC): Valor monetário da transação.
* `data_gasto` (DATE): Data em que o gasto ocorreu.
* `categoria_id` (INTEGER, Foreign Key): Vinculo com a tabela de categorias.

---

## 🚀 Scripts SQL

### Criação do Esquema e Inserção de Dados
```sql
-- 1. Criação das tabelas
CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE gastos (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor NUMERIC(10, 2) NOT NULL CHECK (valor > 0),
    data_gasto DATE NOT NULL,
    categoria_id INTEGER NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- 2. Alimentando o banco com dados de teste
INSERT INTO categorias (nome) VALUES ('Alimentação'), ('Transporte'), ('Lazer'), ('Educação');

INSERT INTO gastos (descricao, valor, data_gasto, categoria_id) VALUES 
('Supermercado Mensal', 350.00, '2026-06-01', 1),
('Corrida de Aplicativo', 25.50, '2026-06-03', 2),
('Cinema e Pipoca', 60.00, '2026-06-06', 3),
('Livro de SQL', 89.90, '2026-06-10', 4),
('Lanche na Faculdade', 15.00, '2026-06-12', 1);