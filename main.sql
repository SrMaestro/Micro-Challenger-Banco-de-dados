-- 1. CRIAR TABELA DE CATEGORIAS
CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- 2. CRIAR TABELA DE GASTOS (COM RELACIONAMENTO)
CREATE TABLE gastos (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor NUMERIC(10, 2) NOT NULL CHECK (valor > 0),
    data_gasto DATE NOT NULL,
    categoria_id INTEGER NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- 3. INSERIR DADOS DE TESTE 
INSERT INTO categorias (nome) VALUES ('Alimentação'), ('Transporte'), ('Lazer'), ('Educação');

INSERT INTO gastos (descricao, valor, data_gasto, categoria_id) VALUES 
('Supermercado Mensal', 350.00, '2026-06-01', 1),
('Corrida de Aplicativo', 25.50, '2026-06-03', 2),
('Cinema e Pipoca', 60.00, '2026-06-06', 3),
('Livro de SQL', 89.90, '2026-06-10', 4),
('Lanche na Faculdade', 15.00, '2026-06-12', 1),
('Combustível', 120.00, '2026-06-15', 2);



--  EXEMPLO DE CONSULTAS

-- CONSULTAS A Ver todos os gastos de "Alimentação" (id = 1)
SELECT descricao, valor, data_gasto 
FROM gastos 
WHERE categoria_id = 1;


-- Consulta B: Filtrar gastos caros (maiores que R$ 50,00)

SELECT * FROM gastos 
WHERE valor > 50.00;





-- COMANDOS UTEIS

-- mostrar tabelas

SELECT * FROM nome_da_sua_tabela;

