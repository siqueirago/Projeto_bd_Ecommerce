-- Inserindo dados na tabela Fornecedor
INSERT INTO Fornecedor (idFornecedor, Razao_social, CNPJ) VALUES
	(1, 'Fornecedor A', '12345678000101'),
	(2, 'Fornecedor B', '22345678000102'),
	(3, 'Fornecedor C', '32345678000103'),
	(4, 'Fornecedor D', '42345678000104');

-- Inserindo dados na tabela Produto
use ecommerce;
INSERT INTO Produto (idProduto, Categoria, Descricao, Valor, data_cadastro)
VALUES
    (1, 'Eletrônicos','Notebook Dell', 3500.00, '2025-01-22'),
    (2, 'Eletrônicos','Smartphone Samsung', 2500.00, '2025-01-22'),
    (3, 'Eletrônicos','TV LG 50 Polegadas', 4000.00, '2025-01-22'),
    (4, 'Brinquedos','Boneca', 100.00, '2025-01-22'),
    (5, 'Vestuário','Blusa de Moletom', 120.00, '2025-01-22'),
    (6, 'Vestuário','Boné', 100.00, '2025-01-22'),
    (7, 'Vestuário','Tênis Puma', 150.00, '2025-01-22'),
    (8, 'Brinquedos','Patinete', 400.00, '2025-01-22'),
    (9, 'Brinquedos','Quebra-Cabeça', 50.00, '2025-01-22'),
    (10, 'Brinquedos','Massinha de Modelar', 30.00, '2025-01-22'),
    (11, 'Brinquedos','Jogo Educativo', 90.00, '2025-01-22'),
    (12, 'Beleza','Sabonete', 20.00, '2025-01-22'),
    (13, 'Beleza','Protetor Solar', 50.00, '2025-01-22'),
    (14, 'Beleza','Maquiagem', 90.00, '2025-01-22'),
    (15, 'Beleza','Shampoo', 30.50, '2025-01-22'),
    (16, 'Beleza','Perfume', 200.00, '2025-01-22'),
    (17, 'Beleza','Creme Hidratante', 50.00, '2025-01-22'),
    (18, 'Brinquedos','Carrinho de Controle Remoto', 300.00, '2025-01-22'),
    (19, 'Eletrônicos','Drone', 4500.00, '2025-01-22'),
    (20, 'Eletrônicos','Ventilador', 400.00, '2025-01-22');

select * from estoque;
desc produto;

-- Inserindo dados na tabela Produto_Fornecedor
INSERT INTO Produto_Fornecedor (Fornecedor_idFornecedor, Produto_idProduto) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
    (1, 4),
    (1, 5),
	(2, 6),
	(2, 7),
    (2, 8),
    (2, 9),
	(2, 10),
	(3, 11),
    (3, 12),
    (3, 13),
	(3, 14),
	(3, 15),
    (4, 16),
    (4, 17),
	(4, 18),
	(4, 19),
    (4, 20);
    
-- Inserindo dados na tabela Estoque
INSERT INTO Estoque (idEstoque, Localizacao) VALUES
	(1, 'Centro de Distribuição SP'),
	(2, 'Centro de Distribuição RJ'),
	(3, 'Centro de Distribuição CE');


-- Inserindo dados na tabela Produto_Estoque
INSERT INTO Produto_Estoque (Produto_idProduto, Estoque_idEstoque, Quantidade) VALUES
	(1, 1, 50),
	(2, 2, 30),
	(3, 3, 20),
	(4, 1, 80),
	(5, 2, 100),
	(6, 3, 20),
	(7, 1, 10),
	(8, 2, 30),
	(9, 3, 20),
	(10, 1, 80),
	(11, 2, 300),
	(12, 3, 20),
	(13, 1, 50),
	(14, 2, 30),
	(15, 3, 20),
	(16, 1, 80),
	(17, 2, 60),
	(18, 3, 20),
	(19, 1, 90),
	(20, 2, 120);

-- Inserindo dados na tabela Vendedor

select * from vendedor;
INSERT INTO Vendedor (idVendedor, Razao_social, Local) VALUES
	(1, 'Loja Online X', 'São Paulo'),
	(2, 'Tech Store', 'Rio de Janeiro'),
	(3, 'Tend Tudo', 'Ceará');

-- Inserindo dados na tabela Produto_Vendedor
INSERT INTO Produto_Vendedor (Vendedor_idVendedor, Produto_idProduto, Quantidade) VALUES
	(1, 1, 20),
	(2, 2, 15),
	(3, 10, 10),
	(1, 15, 20),
	(2, 20, 15),
	(3, 8, 10);

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (idCliente, Fnome, Lnome, Telefone, Tipo, CPF, CNPJ) VALUES
       (5, 'Antonio', 'Gomes', '88999999910','PJ', null ,'1230000000001'),
	   (6, 'Pedro', 'Lima', '85988888812', 'PJ', null, '2230000000002' );

-- Inserindo dados na tabela Endereco
INSERT INTO Endereco (idEndereco, Logradouro, Numero, Complemento, Bairro, Cidade, Estado, Frete, Cliente_idCliente) VALUES
	(1, 'Rua das Flores', 123, 'Apto 101', 'Centro', 'São Paulo', 'SP', '15.00', 1),
	(2, 'Av. Brasil', 500, 'Bloco B', 'Copacabana', 'Rio de Janeiro', 'RJ', '20.00', 2),
	(3, 'Rua da Palha', 125, 'Casa 200', 'Centro', 'Canindé', 'CE', '15.00', 3),
	(4, 'Av. Brasil', 510, 'Bloco C', 'Copacabana', 'Rio de Janeiro', 'RJ', '20.00', 4);

select * from endereco;

desc endereco;
-- Inserindo dados na tabela Pedido
INSERT INTO Pedido (idPedido, Status_pedido, Descricao, Cliente_idCliente) VALUES
	(1, 'Pendente', 'Compra de Notebook', 1),
	(2, 'Aprovado', 'Compra de Sabonete', 2),
	(3, 'Entregue', 'Compra de Boné', 1),
	(4, 'Aprovado', 'Compra de Perfume', 2);
    
-- Inserindo dados na tabela Produto_Pedido
INSERT INTO Produto_Pedido (Produto_idProduto, Pedido_idPedido, Quantidade) VALUES
 	(1, 2, 2),
	(2, 1, 2),
 	(10, 4, 3),
 	(15, 3, 5);

    
    select * from produto_pedido;
    desc pagamento;
-- Inserindo dados na tabela Pagamento
INSERT INTO Pagamento (idPagamento, Forma_Pagamento, Data_pagamento, Pedido_idPedido, Pedido_Cliente_idCliente) VALUES
	(1, 'Cartao', '2025-01-28', 1, 1),
	(2, 'Pix', '2025-01-28', 2, 2),
	(3, 'Boleto', '2025-01-28', 3, 1),
	(4, 'Transferencia', '2025-01-28', 4, 2);

-- Inserindo dados na tabela Entrega
INSERT INTO Entrega (idEntrega, Status_Entrega, Codigo_rastreio, Saida_entrega, Previsao_entrega, Pedido_idPedido, Pedido_Cliente_idCliente) VALUES
	(1, 'Preparando', 987654321, '2025-01-29', '2025-02-05', 1, 1),
	(2, 'Em trânsito', 123456789, '2025-01-28', '2025-02-03', 2, 2),
    (3, 'Preparando', 887654328, '2025-01-29', '2025-02-05', 3, 1),
	(4, 'Entregue', 223456799, '2025-01-20', '2025-01-27', 4, 2);


