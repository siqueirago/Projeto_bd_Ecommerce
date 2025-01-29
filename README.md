# 📦 Projeto Banco de Dados - E-commerce
## 📌 Descrição

Este projeto consiste na modelagem e implementação de um banco de dados relacional para um sistema de e-commerce. Foram criadas tabelas para clientes (PF e PJ), produtos, fornecedores, pedidos e outras entidades essenciais para a gestão do sistema.

## 🔹 Tecnologias Utilizadas
* MySQL como sistema gerenciador de banco de dados (SGBD)
* SQL para criação e manipulação das tabelas e dados

## 📖 Passos Realizados

### 1️⃣ Criação das Tabelas

* Foram criadas tabelas seguindo um modelo relacional, incluindo:
* Cliente (permitindo PF e PJ com regras de integridade)
* Produto (com categorias como Eletrônicos, Vestuário, Brinquedos e Beleza)
* Fornecedor (vinculado aos produtos que fornece)
* Estoque ( Produto em estoque)
* Pedido e Produto_Pedido (para registrar as compras)
* Produto por vendedor
* Endereço
* Pagamento
* Entrega

### 2️⃣ Inserção de Dados
**Foram inseridos:**

* 20 produtos, divididos em 4 categorias
* 4 fornecedores, cada um fornecendo produtos de uma categoria
* Clientes, diferenciando PF e PJ

### 3️⃣ Correção da Estrutura da Tabela Cliente

Para permitir que um cliente seja PF ou PJ, mas não ambos, foi realizada a seguinte modificação:
1. Adição da coluna Tipo (ENUM('PF', 'PJ'))
2. Criação das colunas separadas CPF e CNPJ
3. Atualização dos registros existentes
4. Adição de restrição CHECK garantindo que:
   * PF tenha apenas CPF preenchido
   * PJ tenha apenas CNPJ preenchido
### 4️⃣ Consultas Realizadas

**Foram criadas consultas SQL para:**
* Listar todos os produtos e seus fornecedores
* Buscar pedidos de um cliente específico
* Exibir clientes PJ
* Validar a estrutura do banco

## 🎯 Melhorias Futuras
* Implementar triggers para evitar erros de inserção
* Criar stored procedures para operações frequentes
* Adicionar índices para melhorar a performance

### 🛠 Desenvolvido por: Julio Siqueira
