create database ecommerce;


CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY,
    Razao_social VARCHAR(100),
    CNPJ VARCHAR(14)
);

CREATE TABLE Produto (
    idProduto INT PRIMARY KEY,
    Categoria ENUM('Eletrônicos', 'Vestuário', 'Brinquedos','Belaza'), -- Ajuste conforme necessário
    Descricao VARCHAR(100),
    Valor VARCHAR(45)
);
 

CREATE TABLE Produto_Fornecedor (
    Fornecedor_idFornecedor INT,
    Produto_idProduto INT,
    PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
    FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY,
    Local VARCHAR(45)
);

CREATE TABLE Produto_Estoque (
    Produto_idProduto INT,
    Estoque_idEstoque INT,
    Quantidade INT,
    PRIMARY KEY (Produto_idProduto, Estoque_idEstoque),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque)
);

CREATE TABLE Vendedor (
    idVendedor INT PRIMARY KEY,
    Razao_social VARCHAR(255),
    Local VARCHAR(45)
);

CREATE TABLE Produto_Vendedor (
    Vendedor_idVendedor INT,
    Produto_idProduto INT,
    Quantidade INT,
    PRIMARY KEY (Vendedor_idVendedor, Produto_idProduto),
    FOREIGN KEY (Vendedor_idVendedor) REFERENCES Vendedor(idVendedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    Fnome VARCHAR(45),
    Lnome VARCHAR(20),
    Telefone VARCHAR(45),
    CPF_CNPJ VARCHAR(14)
);
-- Alterações na tabela cliente, para que o cliente possa ser PF ou PJ
ALTER TABLE Cliente ADD COLUMN Tipo ENUM('PF', 'PJ') NOT NULL DEFAULT 'PF';
ALTER TABLE Cliente ADD COLUMN CPF VARCHAR(14) UNIQUE NULL;
ALTER TABLE Cliente ADD COLUMN CNPJ VARCHAR(18) UNIQUE NULL;

ALTER TABLE Cliente DROP COLUMN CPF_CNPJ;

UPDATE Cliente 
SET CPF = LPAD(FLOOR(RAND() * 10000000000), 11, '0')  -- Gerando CPF aleatório
WHERE Tipo = 'PF' AND CPF IS NULL;

-- Criando restrição 
ALTER TABLE Cliente ADD CONSTRAINT chk_cliente_cpf_cnpj
CHECK (
    (Tipo = 'PF' AND CPF IS NOT NULL AND CNPJ IS NULL) OR
    (Tipo = 'PJ' AND CNPJ IS NOT NULL AND CPF IS NULL)
);


select * from cliente;
 desc cliente;
SELECT idCliente, Fnome, Tipo, CPF, CNPJ FROM Cliente;

UPDATE Cliente 
SET Tipo = 'PJ', CPF = NULL, CNPJ = '22345678000110'
WHERE idCliente = 4;

CREATE TABLE Endereco (
    idEndereco INT PRIMARY KEY,
    Logradouro VARCHAR(45),
    Numero INT,
    Complemento VARCHAR(45),
    Bairro VARCHAR(45),
    Cidade VARCHAR(45),
    Estado VARCHAR(45),
    Frete VARCHAR(45),
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY,
    Status_pedido ENUM('Pendente', 'Aprovado', 'Enviado', 'Entregue', 'Cancelado'),
    Descricao VARCHAR(255),
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Produto_Pedido (
    Produto_idProduto INT,
    Pedido_idPedido INT,
    Quantidade INT,
    PRIMARY KEY (Produto_idProduto, Pedido_idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY,
    Forma_Pagamento ENUM('Cartao', 'Boleto', 'Pix', 'Transferencia'),
    Data_pagamento DATE,
    Pedido_idPedido INT,
    Pedido_Cliente_idCliente INT,
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Pedido_Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY,
    Status_Entrega ENUM('Preparando', 'Em trânsito', 'Entregue'),
    Codigo_rastreio INT,
    Saida_entrega DATE,
    Previsao_entrega DATE,
    Pedido_idPedido INT,
    Pedido_Cliente_idCliente INT,
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Pedido_Cliente_idCliente) REFERENCES Cliente(idCliente)
);