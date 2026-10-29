
/* Prática 13 – Lanchonete – perguntas ao banco */
USE lanchonete;

-- pergunta 1: nome e preco de tabela dos produtos, com o preco chamado preco_rs
SELECT nome, preco_tabela AS preco_rs 
FROM produto;

-- pergunta 2: em quais unidades ja houve pedido? cada codigo uma vez so
SELECT DISTINCT unidade_codigo 
FROM pedido;

-- pergunta 3: quais produtos custam de 12 a 15 reais?
SELECT * 
FROM produto 
WHERE preco_tabela BETWEEN 12.00 AND 15.00;

-- pergunta 4: quais produtos tem Acai no comeco do nome?
SELECT * 
FROM produto 
WHERE nome LIKE 'Açaí%';

-- pergunta 5: quais pedidos foram retirados no balcao (sem entregador)?
SELECT * 
FROM pedido 
WHERE entregador_codigo IS NULL;

-- pergunta 6: quais pedidos sao das unidades 1 e 3?
SELECT * 
FROM pedido 
WHERE unidade_codigo IN (1, 3);

-- pergunta 7: quais sao os 3 produtos disponiveis mais caros?
SELECT * 
FROM produto 
WHERE disponivel = TRUE 
ORDER BY preco_tabela DESC 
LIMIT 3;

-- pergunta 8: os pedidos, do mais recente para o mais antigo
SELECT * 
FROM pedido 
ORDER BY data_hora DESC;

-- extra: os itens com quantidade 2 ou mais, do maior preco cobrado para o menor
SELECT * 
FROM item_pedido 
WHERE quantidade >= 2 
ORDER BY preco_cobrado DESC;

SELECT nome, preco_tabela AS preco_rs
FROM produto;
SELECT DISTINCT unidade_codigo
FROM pedido;

SELECT *
FROM produto
WHERE preco_tabela BETWEEN 12.00 AND 15.00;

SELECT *
FROM produto
WHERE nome LIKE 'Açaí%';