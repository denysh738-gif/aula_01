USE lanchonete;

-- pergunta 1: o número de cada pedido e o nome do cliente.
SELECT p.numero, c.nome 
FROM pedido p
INNER JOIN cliente c ON p.cliente_codigo = c.codigo;

-- pergunta 2: os pedidos da unidade Ponta Verde (mostre o nome da unidade).
SELECT p.numero, u.nome AS unidade
FROM pedido p
INNER JOIN unidade u ON p.unidade_codigo = u.codigo
WHERE u.nome = 'Ponta Verde';

-- pergunta 3: os itens do pedido 4: data, nome do produto e quantidade.
SELECT p.data_hora, pr.nome AS produto, ip.quantidade
FROM item_pedido ip
INNER JOIN pedido p ON ip.pedido_numero = p.numero
INNER JOIN produto pr ON ip.produto_codigo = pr.codigo
WHERE ip.pedido_numero = 4;

-- pergunta 4: unidades vendidas de cada produto, com o nome, da mais vendida.
SELECT pr.nome, SUM(ip.quantidade) AS total_vendido
FROM item_pedido ip
INNER JOIN produto pr ON ip.produto_codigo = pr.codigo
GROUP BY pr.codigo, pr.nome
ORDER BY total_vendido DESC;

-- pergunta 5: quais produtos nunca foram vendidos?
SELECT pr.codigo, pr.nome
FROM produto pr
LEFT JOIN item_pedido ip ON pr.codigo = ip.produto_codigo
WHERE ip.produto_codigo IS NULL;

-- pergunta 6: quais clientes não fizeram nenhum pedido?
SELECT c.codigo, c.nome
FROM cliente c
LEFT JOIN pedido p ON c.codigo = p.cliente_codigo
WHERE p.numero IS NULL;

-- pergunta 7: quais produtos têm preço de tabela acima da média?
SELECT nome, preco
FROM produto
WHERE preco > (SELECT AVG(preco) FROM produto);

-- pergunta 8: qual a média de pedidos por unidade?
SELECT ROUND(AVG(t.total_pedidos), 2) AS media_pedidos_por_unidade
FROM (
    SELECT unidade_codigo, COUNT(*) AS total_pedidos
    FROM pedido
    GROUP BY unidade_codigo
) AS t;
