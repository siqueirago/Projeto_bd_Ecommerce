
-- Selecionar todos os produtos com seus fornecedores

SELECT p.idProduto, p.Descricao, p.Categoria, p.Valor, f.Razao_social 
FROM Produto p
JOIN Produto_Fornecedor pf ON p.idProduto = pf.Produto_idProduto
JOIN Fornecedor f ON pf.Fornecedor_idFornecedor = f.idFornecedor;

-- Listando todos os produtos e suas categorias
SELECT Descricao, Categoria FROM Produto;

-- Buscando todos os clientes do tipo PJ :
SELECT * FROM Cliente WHERE Tipo = 'PJ';

-- Buscando produtos da categoria Eletrônicos :
SELECT * FROM Produto WHERE Categoria = 'Eletrônicos';

-- Gerando um nome completo do cliente (caso tenha Fnomee Lnomeseparados):
SELECT idCliente, CONCAT(Fnome, ' ', Lnome) AS NomeCompleto FROM Cliente;

-- Quantos produtos cada fornecedor fornece?
SELECT f.Razao_social, COUNT(pf.Produto_idProduto) AS Quantidade_Produtos
FROM Fornecedor f
JOIN Produto_Fornecedor pf ON f.idFornecedor = pf.Fornecedor_idFornecedor
GROUP BY f.Razao_social;

-- Quais produtos têm um valor acima de R$ 500,00?

SELECT * FROM Produto
WHERE Valor > 500.00;

-- Listar os clientes que fizeram pedidos e os produtos que compraram, valor de cada pedido e contribuição
SELECT 
    CONCAT(c.Fnome, ' ', c.Lnome) AS Cliente, 
    p.idPedido, 
    pr.Descricao, 
    pr.Categoria, 
    pp.Quantidade, 
    pr.Valor AS ValorUnitario,
    (pp.Quantidade * pr.Valor) AS ValorItem,
    SUM(pp.Quantidade * pr.Valor) OVER (PARTITION BY p.idPedido) AS Contribuicao
FROM Cliente c
JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
JOIN Produto_Pedido pp ON p.idPedido = pp.Pedido_idPedido
JOIN Produto pr ON pp.Produto_idProduto = pr.idProduto
ORDER BY p.idPedido, Cliente;
