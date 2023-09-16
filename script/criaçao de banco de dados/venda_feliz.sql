-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16/09/2023 às 21:06
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `venda feliz`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_avaliacao_produto`
--

CREATE TABLE `tb_avaliacao_produto` (
  `IdAvaliacao` int(10) UNSIGNED NOT NULL,
  `Usuario` varchar(45) DEFAULT NULL,
  `Descricao` varchar(90) DEFAULT NULL,
  `Nota` char(1) DEFAULT NULL,
  `Imagens_do_produto` varchar(255) DEFAULT NULL,
  `Data_de_avaliacao` datetime DEFAULT NULL,
  `Recomendaria_o_produto` char(1) DEFAULT NULL,
  `Palavras_chaves_Tags` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_caixa`
--

CREATE TABLE `tb_caixa` (
  `idTb_caixa` int(10) UNSIGNED NOT NULL,
  `Tb_Forma_Pagamento_IdPagamento` int(10) UNSIGNED NOT NULL,
  `Tb_Entrega_Rastreamento` int(10) UNSIGNED NOT NULL,
  `Tb_Pedidos_Compras_Id_Pedidos` int(10) UNSIGNED NOT NULL,
  `Tb_Notafiscal_idTb_notafiscal` int(10) UNSIGNED NOT NULL,
  `Valor_total_do_caixa` float DEFAULT NULL,
  `Data_de_abertura` datetime DEFAULT NULL,
  `Data_de_fechamento` datetime DEFAULT NULL,
  `Saldo_inicial` float DEFAULT NULL,
  `Saldo_final` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `CPF` varchar(11) NOT NULL,
  `Tb_Secao_idSecao` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Sobrenome` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Numero_telefonico` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `Cidade` varchar(45) DEFAULT NULL,
  `Bairro` varchar(45) DEFAULT NULL,
  `Rua_e_numero` varchar(45) DEFAULT NULL,
  `Genero` varchar(45) DEFAULT NULL,
  `Usuario` varchar(45) DEFAULT NULL,
  `Data_de_nascimento` date DEFAULT NULL,
  `Data_de_cadastro` datetime DEFAULT NULL,
  `Status_da_conta` varchar(45) DEFAULT NULL,
  `Preferencia_de_comunicacao` varchar(45) DEFAULT NULL,
  `Pontos_de_fidelidade` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_consolida_negocio`
--

CREATE TABLE `tb_consolida_negocio` (
  `IdConsolidacao` int(10) UNSIGNED NOT NULL,
  `Tb_Marketing_idMarketing` int(10) UNSIGNED NOT NULL,
  `Tb_Entrega_Reversa_Protocolo` int(10) UNSIGNED NOT NULL,
  `Tb_Avaliacao_Produto_IdAvaliacao` int(10) UNSIGNED NOT NULL,
  `Tb_Pedidos_Compras_Id_Pedidos` int(10) UNSIGNED NOT NULL,
  `Data_de_consolidacao` datetime DEFAULT NULL,
  `Descricao_de_consolidacao` varchar(45) DEFAULT NULL,
  `Dados_adicionais` varchar(45) DEFAULT NULL,
  `Total_do_pedido` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_contrato`
--

CREATE TABLE `tb_contrato` (
  `Protocolo` int(10) UNSIGNED NOT NULL,
  `Data_de_inicio` datetime DEFAULT NULL,
  `Data_de_termino` datetime DEFAULT NULL,
  `Valor_de_contrato` decimal(10,0) DEFAULT NULL,
  `Tipo_de_contrato` varchar(45) DEFAULT NULL,
  `Status_do_contrato` varchar(45) DEFAULT NULL,
  `Data_de_renovacao` datetime DEFAULT NULL,
  `Documentos_adicionais` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_entrega`
--

CREATE TABLE `tb_entrega` (
  `Rastreamento` int(10) UNSIGNED NOT NULL,
  `Tb_Transportadora_CNPJ_2` varchar(14) NOT NULL,
  `Data_estimada` date DEFAULT NULL,
  `Status_da_entrega` varchar(45) DEFAULT NULL,
  `Data_real_da_entrega` datetime DEFAULT NULL,
  `Assinatura_do_recebedor` varchar(45) DEFAULT NULL,
  `Instrucoes_de_entrega` varchar(60) DEFAULT NULL,
  `Custo_de_entrega` decimal(10,0) DEFAULT NULL,
  `Nota_fiscal` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_entrega_reversa`
--

CREATE TABLE `tb_entrega_reversa` (
  `Protocolo` int(10) UNSIGNED NOT NULL,
  `Usuario` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `Cidade` varchar(45) DEFAULT NULL,
  `Bairro` varchar(45) DEFAULT NULL,
  `Rua_e_numero` varchar(45) DEFAULT NULL,
  `Numero_de_contato` varchar(12) DEFAULT NULL,
  `Email_para_contato` varchar(45) DEFAULT NULL,
  `Produtos_devolvidos` varchar(45) DEFAULT NULL,
  `Motivo_da_devolucao` varchar(50) DEFAULT NULL,
  `Imagens_produto` varchar(255) DEFAULT NULL,
  `Data_de_regristro` datetime DEFAULT NULL,
  `Data_de_devolucao` datetime DEFAULT NULL,
  `Status_da_devolucao` varchar(45) DEFAULT NULL,
  `Instrucoes_de_devolucao` varchar(45) DEFAULT NULL,
  `Assinatura_do_cliente` varchar(45) DEFAULT NULL,
  `Custo_de_devolucao` decimal(10,0) DEFAULT NULL,
  `Reposicao_pela_devolucao` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_estoque`
--

CREATE TABLE `tb_estoque` (
  `idEstoque` int(10) UNSIGNED NOT NULL,
  `Tb_Produto_idProduto` int(10) UNSIGNED NOT NULL,
  `Quantidade` varchar(45) DEFAULT NULL,
  `Data_de_validade` datetime DEFAULT NULL,
  `Lote` varchar(20) DEFAULT NULL,
  `Ultima_atualizacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_forma_pagamento`
--

CREATE TABLE `tb_forma_pagamento` (
  `IdPagamento` int(10) UNSIGNED NOT NULL,
  `Meio_selecionado` varchar(45) DEFAULT NULL,
  `Valor_total` decimal(10,0) DEFAULT NULL,
  `Valor_desconto` decimal(10,0) DEFAULT NULL,
  `Valor_do_Item` decimal(10,0) DEFAULT NULL,
  `Data_de_pagamento` datetime DEFAULT NULL,
  `Qt_parcelas` varchar(2) DEFAULT NULL,
  `Valor_da_parcelas` decimal(10,0) DEFAULT NULL,
  `Status_de_pagemento` varchar(45) DEFAULT NULL,
  `Tipo_de_moeda` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_fornecedor`
--

CREATE TABLE `tb_fornecedor` (
  `CNPJ` varchar(14) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Numero_telefonico` varchar(12) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `Cidade` varchar(45) DEFAULT NULL,
  `Rua_e_numero` varchar(45) DEFAULT NULL,
  `Ramo` varchar(45) DEFAULT NULL,
  `Inicio_de_parceria` datetime DEFAULT NULL,
  `Termino_de_parceria` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_itens`
--

CREATE TABLE `tb_itens` (
  `Tb_Fornecedor_CNPJ` varchar(14) NOT NULL,
  `Tb_Produto_idProduto` int(10) UNSIGNED NOT NULL,
  `Duracao_de_garantia` varchar(45) DEFAULT NULL,
  `Qt_no_estoque` varchar(45) DEFAULT NULL,
  `Preco_de_compra` decimal(10,0) DEFAULT NULL,
  `Data_de_inclusao` datetime DEFAULT NULL,
  `Informacoes_adicionais` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_itensnocarrinho`
--

CREATE TABLE `tb_itensnocarrinho` (
  `Tb_Cliente_CPF` varchar(11) NOT NULL,
  `Tb_Pedidos_Compras_Id_Pedidos` int(10) UNSIGNED NOT NULL,
  `Data_de_adicao` varchar(45) DEFAULT NULL,
  `Qt_de_itens` varchar(45) DEFAULT NULL,
  `Desconto_ou_promocoes` char(1) DEFAULT NULL,
  `Informacoes_adicionais` varchar(45) DEFAULT NULL,
  `Tempo_gasto_no_carrinho` datetime DEFAULT NULL,
  `Abandono` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_marketing`
--

CREATE TABLE `tb_marketing` (
  `idMarketing` int(10) UNSIGNED NOT NULL,
  `Valor_gasto` decimal(10,0) DEFAULT NULL,
  `Qt_de_anuncio` decimal(10,0) DEFAULT NULL,
  `Mes_de_referencia` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_notafiscal`
--

CREATE TABLE `tb_notafiscal` (
  `idTb_notafiscal` int(10) UNSIGNED NOT NULL,
  `Dia_realizado` datetime DEFAULT NULL,
  `Valor_total` decimal(10,0) DEFAULT NULL,
  `Mes_de_referencia` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_pedidos_compras`
--

CREATE TABLE `tb_pedidos_compras` (
  `Id_Pedidos` int(10) UNSIGNED NOT NULL,
  `Tb_Contrato_Protocolo` int(10) UNSIGNED NOT NULL,
  `Tb_Produto_idProduto` int(10) UNSIGNED NOT NULL,
  `Data_de_pedido` datetime DEFAULT NULL,
  `Quantidade` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_produto`
--

CREATE TABLE `tb_produto` (
  `idProduto` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Descricao` varchar(45) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `Altura` float DEFAULT NULL,
  `Largura` float DEFAULT NULL,
  `Profundidade` float DEFAULT NULL,
  `Peso` float DEFAULT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Data_de_fabricacao` datetime DEFAULT NULL,
  `Garantia` char(1) DEFAULT NULL,
  `Estado_do_produto` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_secao`
--

CREATE TABLE `tb_secao` (
  `idSecao` int(10) UNSIGNED NOT NULL,
  `Inicio_de_navegacao` datetime DEFAULT NULL,
  `Termino_de_navegacao` datetime DEFAULT NULL,
  `Dispositivo` varchar(45) DEFAULT NULL,
  `Acao_do_cliente` varchar(45) DEFAULT NULL,
  `Referencia` varchar(45) DEFAULT NULL,
  `Qt_paginas_visitadas` varchar(4) DEFAULT NULL,
  `Taxa_de_rejeicao` decimal(10,0) DEFAULT NULL,
  `Referencia_de_produtos` char(1) DEFAULT NULL,
  `Tempo_de_inatividade` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_transportadora`
--

CREATE TABLE `tb_transportadora` (
  `CNPJ_2` varchar(14) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `Cidade` varchar(45) DEFAULT NULL,
  `Bairro` varchar(45) DEFAULT NULL,
  `Rua_e_numero` varchar(45) DEFAULT NULL,
  `Capacidade_de_entregas` varchar(4) DEFAULT NULL,
  `Historico_de_entregas` varchar(5) DEFAULT NULL,
  `Data_de_inicio` datetime DEFAULT NULL,
  `Data_de_termino` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_avaliacao_produto`
--
ALTER TABLE `tb_avaliacao_produto`
  ADD PRIMARY KEY (`IdAvaliacao`);

--
-- Índices de tabela `tb_caixa`
--
ALTER TABLE `tb_caixa`
  ADD PRIMARY KEY (`idTb_caixa`),
  ADD KEY `Tb_caixa_FKIndex1` (`Tb_Pedidos_Compras_Id_Pedidos`),
  ADD KEY `Tb_caixa_FKIndex2` (`Tb_Forma_Pagamento_IdPagamento`),
  ADD KEY `Tb_caixa_FKIndex3` (`Tb_Notafiscal_idTb_notafiscal`),
  ADD KEY `Tb_caixa_FKIndex4` (`Tb_Entrega_Rastreamento`);

--
-- Índices de tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`CPF`),
  ADD KEY `Tb_Cliente_FKIndex1` (`Tb_Secao_idSecao`);

--
-- Índices de tabela `tb_consolida_negocio`
--
ALTER TABLE `tb_consolida_negocio`
  ADD PRIMARY KEY (`IdConsolidacao`),
  ADD KEY `Tb_consolida_negocio_FKIndex1` (`Tb_Pedidos_Compras_Id_Pedidos`),
  ADD KEY `Tb_consolida_negocio_FKIndex3` (`Tb_Entrega_Reversa_Protocolo`),
  ADD KEY `Tb_consolida_negocio_FKIndex4` (`Tb_Avaliacao_Produto_IdAvaliacao`),
  ADD KEY `Tb_Consolida_Negocio_FKIndex5` (`Tb_Marketing_idMarketing`);

--
-- Índices de tabela `tb_contrato`
--
ALTER TABLE `tb_contrato`
  ADD PRIMARY KEY (`Protocolo`);

--
-- Índices de tabela `tb_entrega`
--
ALTER TABLE `tb_entrega`
  ADD PRIMARY KEY (`Rastreamento`),
  ADD KEY `Tb_entrega_FKIndex1` (`Tb_Transportadora_CNPJ_2`);

--
-- Índices de tabela `tb_entrega_reversa`
--
ALTER TABLE `tb_entrega_reversa`
  ADD PRIMARY KEY (`Protocolo`);

--
-- Índices de tabela `tb_estoque`
--
ALTER TABLE `tb_estoque`
  ADD PRIMARY KEY (`idEstoque`),
  ADD KEY `Tb_estoque_FKIndex1` (`Tb_Produto_idProduto`);

--
-- Índices de tabela `tb_forma_pagamento`
--
ALTER TABLE `tb_forma_pagamento`
  ADD PRIMARY KEY (`IdPagamento`);

--
-- Índices de tabela `tb_fornecedor`
--
ALTER TABLE `tb_fornecedor`
  ADD PRIMARY KEY (`CNPJ`);

--
-- Índices de tabela `tb_itens`
--
ALTER TABLE `tb_itens`
  ADD PRIMARY KEY (`Tb_Fornecedor_CNPJ`,`Tb_Produto_idProduto`),
  ADD KEY `Tb_fornecedor_has_Tb_produto_FKIndex1` (`Tb_Fornecedor_CNPJ`),
  ADD KEY `Tb_fornecedor_has_Tb_produto_FKIndex3` (`Tb_Produto_idProduto`);

--
-- Índices de tabela `tb_itensnocarrinho`
--
ALTER TABLE `tb_itensnocarrinho`
  ADD PRIMARY KEY (`Tb_Cliente_CPF`,`Tb_Pedidos_Compras_Id_Pedidos`),
  ADD KEY `Tb_cliente_has_Tb_pedidos_compras_FKIndex1` (`Tb_Cliente_CPF`);

--
-- Índices de tabela `tb_marketing`
--
ALTER TABLE `tb_marketing`
  ADD PRIMARY KEY (`idMarketing`);

--
-- Índices de tabela `tb_notafiscal`
--
ALTER TABLE `tb_notafiscal`
  ADD PRIMARY KEY (`idTb_notafiscal`);

--
-- Índices de tabela `tb_pedidos_compras`
--
ALTER TABLE `tb_pedidos_compras`
  ADD PRIMARY KEY (`Id_Pedidos`),
  ADD KEY `Tb_pedidos_compras_FKIndex1` (`Tb_Produto_idProduto`),
  ADD KEY `Tb_pedidos_compras_FKIndex2` (`Tb_Contrato_Protocolo`);

--
-- Índices de tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD PRIMARY KEY (`idProduto`);

--
-- Índices de tabela `tb_secao`
--
ALTER TABLE `tb_secao`
  ADD PRIMARY KEY (`idSecao`);

--
-- Índices de tabela `tb_transportadora`
--
ALTER TABLE `tb_transportadora`
  ADD PRIMARY KEY (`CNPJ_2`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_avaliacao_produto`
--
ALTER TABLE `tb_avaliacao_produto`
  MODIFY `IdAvaliacao` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_caixa`
--
ALTER TABLE `tb_caixa`
  MODIFY `idTb_caixa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_consolida_negocio`
--
ALTER TABLE `tb_consolida_negocio`
  MODIFY `IdConsolidacao` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_contrato`
--
ALTER TABLE `tb_contrato`
  MODIFY `Protocolo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_entrega`
--
ALTER TABLE `tb_entrega`
  MODIFY `Rastreamento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_entrega_reversa`
--
ALTER TABLE `tb_entrega_reversa`
  MODIFY `Protocolo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_estoque`
--
ALTER TABLE `tb_estoque`
  MODIFY `idEstoque` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_forma_pagamento`
--
ALTER TABLE `tb_forma_pagamento`
  MODIFY `IdPagamento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_marketing`
--
ALTER TABLE `tb_marketing`
  MODIFY `idMarketing` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_notafiscal`
--
ALTER TABLE `tb_notafiscal`
  MODIFY `idTb_notafiscal` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_pedidos_compras`
--
ALTER TABLE `tb_pedidos_compras`
  MODIFY `Id_Pedidos` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  MODIFY `idProduto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_secao`
--
ALTER TABLE `tb_secao`
  MODIFY `idSecao` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
