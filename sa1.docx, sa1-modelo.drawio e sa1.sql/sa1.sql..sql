/* SA1 - Banco da indústria de embalagens */
DROP DATABASE IF EXISTS embalagens;
CREATE DATABASE embalagens;
USE embalagens;

-- ============================================================
-- TABELAS SEM CHAVE ESTRANGEIRA (TABELAS INDEPENDENTES)
-- ============================================================

-- Tabela de Categorias
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
) COMMENT 'Armazena as categorias das embalagens produzidas';

-- Tabela de Clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(150) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(200)
) COMMENT 'Armazena os clientes compradores de embalagens';

-- Tabela de Fornecedores
CREATE TABLE fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_fantasia VARCHAR(150) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100)
) COMMENT 'Armazena os fornecedores de insumos e matérias-primas';

-- Tabela de Matérias-Primas
CREATE TABLE materias_primas (
    id_materia_prima INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    unidade_medida VARCHAR(20) NOT NULL,
    estoque_atual DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    estoque_minimo DECIMAL(10,2) NOT NULL DEFAULT 0.00
) COMMENT 'Armazena matérias-primas como papelão, resina, tinta e cola';

-- Tabela de Máquinas
CREATE TABLE maquinas (
    id_maquina INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'Ativa'
) COMMENT 'Armazena os equipamentos da linha de produção de embalagens';


-- ============================================================
-- TABELAS COM CHAVE ESTRANGEIRA (TABELAS DEPENDENTES)
-- ============================================================

-- Tabela de Produtos
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    codigo_sku VARCHAR(50) NOT NULL UNIQUE,
    nome VARCHAR(150) NOT NULL,
    dimensoes VARCHAR(50) COMMENT 'Ex: 30x20x10 cm',
    preco_unitario DECIMAL(10,2) NOT NULL,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_produtos_categorias FOREIGN KEY (id_categoria) 
        REFERENCES categorias(id_categoria) 
        ON DELETE RESTRICT ON UPDATE CASCADE
) COMMENT 'Armazena os produtos e embalagens finalizados da indústria';

-- Tabela de Composição do Produto (Ficha Técnica / BOM)
CREATE TABLE composicao_produto (
    id_produto INT NOT NULL,
    id_materia_prima INT NOT NULL,
    quantidade_necessaria DECIMAL(10,4) NOT NULL,
    PRIMARY KEY (id_produto, id_materia_prima),
    CONSTRAINT fk_comp_produto FOREIGN KEY (id_produto) 
        REFERENCES produtos(id_produto) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_comp_materia FOREIGN KEY (id_materia_prima) 
        REFERENCES materias_primas(id_materia_prima) 
        ON DELETE RESTRICT ON UPDATE CASCADE
) COMMENT 'Associa produtos às matérias-primas necessárias para fabricação';

-- Tabela de Pedidos
CREATE TABLE pedidos (
    id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30) NOT NULL DEFAULT 'Pendente',
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_pedidos_clientes FOREIGN KEY (id_cliente) 
        REFERENCES clientes(id_cliente) 
        ON DELETE RESTRICT ON UPDATE CASCADE
) COMMENT 'Armazena os pedidos de venda efetuados pelos clientes';

-- Tabela de Itens do Pedido
CREATE TABLE itens_pedido (
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    CONSTRAINT fk_itens_pedido FOREIGN KEY (id_pedido) 
        REFERENCES pedidos(id_pedido) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_itens_produto FOREIGN KEY (id_produto) 
        REFERENCES produtos(id_produto) 
        ON DELETE RESTRICT ON UPDATE CASCADE
) COMMENT 'Armazena a relação detalhada de produtos de cada pedido';

-- Tabela de Ordens de Produção
CREATE TABLE ordens_producao (
    id_ordem INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    id_maquina INT NOT NULL,
    quantidade_planejada INT NOT NULL,
    data_inicio DATETIME,
    data_fim DATETIME,
    status VARCHAR(30) NOT NULL DEFAULT 'Planejada',
    CONSTRAINT fk_ordem_pedido FOREIGN KEY (id_pedido) 
        REFERENCES pedidos(id_pedido) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_ordem_produto FOREIGN KEY (id_produto) 
        REFERENCES produtos(id_produto) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_ordem_maquina FOREIGN KEY (id_maquina) 
        REFERENCES maquinas(id_maquina) 
        ON DELETE RESTRICT ON UPDATE CASCADE
) COMMENT 'Registra as ordens de fabricação na linha de produção';