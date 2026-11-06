USE lanchonete;

-- pergunta 1: quantos pedidos a lanchonete tem?
SELECT COUNT(*) AS total_pedidos 
FROM pedido;

-- pergunta 2: quantas unidades de produto foram vendidas? (item_pedido)
SELECT SUM(quantidade) AS total_unidades_vendidas 
FROM item_pedido;

-- pergunta 3: qual o preço médio cobrado e o maior preço cobrado?
SELECT ROUND(AVG(preco_cobrado), 2) AS preco_medio_cobrado, 
       MAX(preco_cobrado) AS maior_preco_cobrado 
FROM item_pedido;

-- pergunta 4: quantos pedidos cada unidade recebeu?
SELECT unidade_codigo, COUNT(*) AS total_pedidos 
FROM pedido 
GROUP BY unidade_codigo 
ORDER BY total_pedidos DESC;

-- pergunta 5: quantas unidades de cada produto foram vendidas, da mais vendida?
SELECT produto_codigo, SUM(quantidade) AS total_vendido 
FROM item_pedido 
GROUP BY produto_codigo 
ORDER BY total_vendido DESC;

-- pergunta 6: quais produtos venderam 3 unidades ou mais?
SELECT produto_codigo, SUM(quantidade) AS total_vendido 
FROM item_pedido 
GROUP BY produto_codigo 
HAVING SUM(quantidade) >= 3 
ORDER BY total_vendido DESC;

-- pergunta 7: quantos pedidos houve em cada dia (dd/mm)?
SELECT DATE_FORMAT(data_hora, '%d/%m') AS dia, 
       COUNT(*) AS total_pedidos 
FROM pedido 
GROUP BY DATE_FORMAT(data_hora, '%d/%m') 
ORDER BY MIN(data_hora);

-- pergunta 8: a etiqueta do cardápio: NOME EM MAIÚSCULAS – R$ preço (só os disponíveis).
SELECT CONCAT(UPPER(nome), ' - R$ ', preco) AS etiqueta_cardapio 
FROM produto 
WHERE disponivel = 'S';