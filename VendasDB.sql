-- ============================================================
-- 1. ESTRUTURA DO BANCO DE DADOS
-- ============================================================

CREATE TABLE categorias (
    categoria_id INT PRIMARY KEY,
    nome_categoria VARCHAR(50)
);

CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cidade VARCHAR(50),
    pais VARCHAR(50),
    data_cadastro DATE
);

CREATE TABLE produtos (
    produto_id INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    categoria_id INT,
    preco_unitario DECIMAL(10, 2),
    estoque INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);

CREATE TABLE vendas (
    venda_id INT PRIMARY KEY,
    cliente_id INT,
    data_venda DATE,
    valor_total DECIMAL(10, 2),
    metodo_pagamento VARCHAR(30),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE itens_venda (
    item_id INT PRIMARY KEY,
    venda_id INT,
    produto_id INT,
    quantidade INT,
    preco_aplicado DECIMAL(10, 2),
    FOREIGN KEY (venda_id) REFERENCES vendas(venda_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

-- ============================================================
-- 2. INSERÇÃO DE DADOS FICTÍCIOS
-- ============================================================

-- Categorias
INSERT INTO categorias (categoria_id, nome_categoria) VALUES
(1, 'Eletrônicos'),
(2, 'Informática'),
(3, 'Móveis & Escritório'),
(4, 'Acessórios'),
(5, 'Eletrodomésticos');

-- Clientes
INSERT INTO clientes (cliente_id, nome, email, cidade, pais, data_cadastro) VALUES
(1, 'Ana Silva', 'ana.silva@email.com', 'São Paulo', 'Brasil', '2025-01-15'),
(2, 'Carlos Eduardo', 'carlos.edu@email.com', 'Rio de Janeiro', 'Brasil', '2025-02-10'),
(3, 'Beatriz Souza', 'beatriz.s@email.com', 'Florianópolis', 'Brasil', '2025-03-01'),
(4, 'John Smith', 'john.smith@email.com', 'Auckland', 'Nova Zelândia', '2025-04-12'),
(5, 'Mariana Lima', 'mariana.lima@email.com', 'Curitiba', 'Brasil', '2025-05-20'),
(6, 'Diego Fernandes', 'diego.f@email.com', 'Porto Alegre', 'Brasil', '2025-06-11'),
(7, 'Sarah Connor', 'sarah.c@email.com', 'Tauranga', 'Nova Zelândia', '2025-07-04'),
(8, 'Lucas Mendes', 'lucas.m@email.com', 'Belo Horizonte', 'Brasil', '2025-08-19'),
(9, 'Camila Rocha', 'camila.r@email.com', 'Salvador', 'Brasil', '2025-09-02'),
(10, 'Gabriel Costa', 'gabriel.c@email.com', 'São Paulo', 'Brasil', '2025-10-15');

-- Produtos
INSERT INTO produtos (produto_id, nome_produto, categoria_id, preco_unitario, estoque) VALUES
(101, 'Mouse Sem Fio Ergoclean', 4, 120.00, 50),
(102, 'Teclado Mecânico RGB', 2, 350.00, 30),
(103, 'Monitor Ultrawide 29"', 2, 1250.00, 15),
(104, 'Cadeira Ergonomica Mesh', 3, 890.00, 20),
(105, 'Mesa Stand Desk Elétrica', 3, 2100.00, 8),
(106, 'Fone de Ouvido Bluetooth', 4, 280.00, 45),
(107, 'Cafeteira Espresso Automática', 5, 650.00, 12),
(108, 'Webcam HD 1080p', 2, 220.00, 25),
(109, 'Carregador Rápido USB-C', 4, 95.00, 100),
(110, 'Aspirador de Pó Robô', 5, 1400.00, 10);

-- Vendas
INSERT INTO vendas (venda_id, cliente_id, data_venda, valor_total, metodo_pagamento) VALUES
(1001, 1, '2026-01-10', 470.00, 'Cartão de Crédito'),
(1002, 3, '2026-01-14', 1250.00, 'Pix'),
(1003, 2, '2026-02-01', 2990.00, 'Cartão de Crédito'),
(1004, 4, '2026-02-15', 350.00, 'Cartão de Débito'),
(1005, 5, '2026-03-02', 280.00, 'Pix'),
(1006, 1, '2026-03-20', 890.00, 'Cartão de Crédito'),
(1007, 7, '2026-04-05', 650.00, 'Pix'),
(1008, 6, '2026-04-18', 220.00, 'Boleto'),
(1009, 8, '2026-05-11', 2100.00, 'Cartão de Crédito'),
(1010, 10, '2026-06-01', 1400.00, 'Pix');

-- Itens da Venda
INSERT INTO itens_venda (item_id, venda_id, produto_id, quantidade, preco_aplicado) VALUES
(1, 1001, 101, 1, 120.00),
(2, 1001, 102, 1, 350.00),
(3, 1002, 103, 1, 1250.00),
(4, 1003, 104, 1, 890.00),
(5, 1003, 105, 1, 2100.00),
(6, 1004, 102, 1, 350.00),
(7, 1005, 106, 1, 280.00),
(8, 1006, 104, 1, 890.00),
(9, 1007, 107, 1, 650.00),
(10, 1008, 108, 1, 220.00),
(11, 1009, 105, 1, 2100.00),
(12, 1010, 110, 1, 1400.00);