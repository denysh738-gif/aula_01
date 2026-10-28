USE lanchonete;

-- ============================================================
-- PARTE 2. Incluir o pedido 1
-- ============================================================

-- 5. Inserir o pedido 1
INSERT INTO pedido (codigo, data_hora, codigo_cliente, codigo_unidade, codigo_entregador) VALUES
(1, '2026-10-03 19:10:00', 1, 1, 1);

-- 6. Inserir os dois itens do pedido 1 (Açaí 500ml e Tapioca de queijo)
INSERT INTO item_pedido (codigo_pedido, codigo_produto, quantidade, preco_praticado) VALUES
(1, 2, 1, 18.00),
(1, 3, 1, 12.00);


-- ============================================================
-- PARTE 3. Corrigir e apagar
-- ============================================================

-- 8. Atualizar o endereço da unidade 1
UPDATE unidade 
SET endereco = 'Av. A, 100' 
WHERE codigo = 1;

-- 9. Apagar o produto Teste (código 4)
DELETE FROM produto 
WHERE codigo = 4;

-- 11 e 12. Tentativa de exclusão do cliente 1 (comentada após erro de FK)
-- DELETE FROM cliente WHERE codigo = 1;


-- ============================================================
-- PARTE 4. Desfazer com transação
-- ============================================================

-- 13. Iniciar a transação e dobrar o preço do produto 1 (Açaí 300 ml)
START TRANSACTION;

UPDATE produto 
SET preco_tabela = preco_tabela * 2 
WHERE codigo = 1;

-- 14. Verificar o preço após o UPDATE
SELECT nome, preco_tabela FROM produto WHERE codigo = 1;

-- Desfazer as alterações da transação
ROLLBACK;

-- Verificar o preço após o ROLLBACK (retorna ao valor original)
SELECT nome, preco_tabela FROM produto WHERE codigo = 1;