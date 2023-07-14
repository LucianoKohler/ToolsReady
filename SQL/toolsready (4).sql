-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Jul-2023 às 15:49
-- Versão do servidor: 8.0.21
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `toolsready`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao_produto`
--

CREATE TABLE `avaliacao_produto` (
  `id_avaliacao` int NOT NULL,
  `fk_produto` int NOT NULL,
  `fk_cliente` int NOT NULL,
  `avaliacao` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `avaliacao_produto`
--

INSERT INTO `avaliacao_produto` (`id_avaliacao`, `fk_produto`, `fk_cliente`, `avaliacao`) VALUES
(1, 1, 4, 4),
(2, 2, 6, 5),
(3, 6, 7, 3),
(4, 5, 14, 2),
(5, 3, 15, 1),
(6, 10, 17, 3),
(7, 7, 7, 5),
(8, 8, 6, 5),
(9, 6, 6, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho_pedido`
--

CREATE TABLE `carrinho_pedido` (
  `id_itens_pedido` int NOT NULL,
  `fk_produto_carrinho` int NOT NULL,
  `fk_pedido` int NOT NULL,
  `fk_cliente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartao`
--

CREATE TABLE `cartao` (
  `id_cartao` int NOT NULL,
  `numero` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_expiracao` date NOT NULL,
  `nome_cartao` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cartao`
--

INSERT INTO `cartao` (`id_cartao`, `numero`, `data_expiracao`, `nome_cartao`) VALUES
(22, '1470333104769919', '2029-04-30', 'Nolan de Fagundes'),
(23, '5488299891427922', '2030-04-24', 'Guilherme Sauro'),
(24, '5537568113368309', '2030-08-12', 'Lincon Mendez'),
(25, '5136146081662196', '2030-06-17', 'Lencio Bento'),
(26, '5502930696281252', '2025-12-23', 'Kleber Kohler'),
(27, '5154489022006165', '2027-09-23', 'Taldo João'),
(28, '5598544140821723', '2028-01-30', 'Paulo Manchester'),
(29, '5564291551293204', '2025-05-21', 'Neymar Junior'),
(30, '5516275905874149', '2028-02-29', 'Matheus de Noronha'),
(31, '5543166009194301', '2025-08-25', 'Leôncio Campos Kauã');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `tipo_pessoa` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CPF_CNPJ` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nascimento_fundacao` date NOT NULL,
  `nome` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `numero_telefone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `senha` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `inf_tributarias` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `razao_social` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `inscricao_estadual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `responsavel_compra` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fk_cartao` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `tipo_pessoa`, `CPF_CNPJ`, `nascimento_fundacao`, `nome`, `numero_telefone`, `email`, `senha`, `inf_tributarias`, `razao_social`, `inscricao_estadual`, `responsavel_compra`, `fk_cartao`) VALUES
(4, 'fisica', '878.052.250-52', '1999-04-23', 'Nolan de Fagundes', '(67) 2861-0782', 'nolandefagundes@gmail.com', 'urehi@#D2', NULL, NULL, NULL, NULL, 30),
(5, 'juridica', '14.059.866/0001-82', '1975-04-23', 'Relâmpagos Mark', '(84) 2685-3386', 'relmpagosmark@gmail.com', 'pedromeia9', 'C-ICMS', 'Relampagos Mark Ltda', '177.767.561', 'Gabriel de Nargalhas', 24),
(6, 'fisica', '521.313.850-05', '1986-06-23', 'Guilherme Sauro', '(96) 2904-6432', 'guilhermesauro@gmail.com', '34Kimbin', NULL, NULL, NULL, NULL, 29),
(7, 'fisica', '919.310.940-71', '1988-06-21', 'Lincon Mendez', '(67) 2315-4012', 'linconmendez@gmail.com', 'senha123', NULL, NULL, NULL, NULL, 23),
(8, 'juridica', '03.159.095/0001-89', '1989-03-03', 'Kick Jangas', '(61) 3475-0947', 'kickjangas@gmail.com', '8Jom@', 'C-ICMS', 'Kick Jangas Corp.', '775.722.910', 'Tim Bimbim', 27),
(9, 'juridica', '03.159.095/0001-89', '1986-06-09', 'Jordas Metais', '(94) 3772-1288', 'jordasmetais@gmail.com', 'lipos54&', 'N-ICMS', 'Jordas Metais Ltda.', '391/6174365', 'Istevie Magal', 25),
(14, 'fisica', '746.105.180-66', '2000-09-26', 'Lencio Bento', '(38) 3323-8352', 'lenciobento@gmail.com', 'KlimnE$8', NULL, NULL, NULL, NULL, 31),
(15, 'fisica', '612.249.220-50', '2001-04-24', 'Kleber Kohler', '(93) 3774-8364', 'kleberkohler@gmail.com', 'senha987', NULL, NULL, NULL, NULL, 22),
(16, 'juridica', '68.694.592/0001-22', '1999-02-24', 'Bem ti vendo', '(83) 3376-1976', 'bemtivendo@gmail.com', 'Bemtevi2', 'C-ICMS', 'Bem ti vendo Ltda.', '28523398-0', 'Jorel Irmão', 25),
(17, 'fisica', '572.782.560-11', '1994-11-03', 'Taldo João', '(96) 3458-1386', 'taldojoão@gmail.com', 'Rafa37!', NULL, NULL, NULL, NULL, 28);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupom`
--

CREATE TABLE `cupom` (
  `id_cupom` int NOT NULL,
  `codigo_promocional` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desconto` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cupom`
--

INSERT INTO `cupom` (`id_cupom`, `codigo_promocional`, `desconto`) VALUES
(1, 'junhododinossauro', '0.15'),
(2, 'ch0r4bl4z3', '0.05'),
(3, 'bostil123', '0.10'),
(4, 'tankavel', '0.50'),
(5, '100k', '0.35'),
(6, '50k', '0.30'),
(7, 'meiadejunho6', '0.99'),
(8, 's3rrotastico', '0.60'),
(9, '1nvernoced0', '0.65'),
(10, 'alanz0kalivre', '0.70');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_cliente`
--

CREATE TABLE `endereco_cliente` (
  `id_endereco` int NOT NULL,
  `rua` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bairro` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cidade` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `numero` int NOT NULL,
  `CEP` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fk_cliente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `endereco_cliente`
--

INSERT INTO `endereco_cliente` (`id_endereco`, `rua`, `bairro`, `cidade`, `numero`, `CEP`, `estado`, `fk_cliente`) VALUES
(1, 'Goularte grandhert', 'Pirabeiraba', 'Jocaraba', 45, '89670-040', 'Ceara', 4),
(2, 'Limboter Keryuhrer', 'Liverpool', 'Lages', 672, '892940-091', 'Roraima', 5),
(3, 'Mocadim', 'Lomagar Tenente', 'Florianopolis', 74, '89200-854', 'Minas Gerais', 6),
(4, 'Marcilio Diaz', 'Jaçanã', 'Morro dos Tempos', 12, '90100-867', 'Acre', 7),
(5, 'Tenente Antonio Caio', 'Tenente Antonio Joao', 'Joinville', 9, '82644-081', 'Amazonas', 8),
(6, 'Gabriel de Araucario', 'Bempalim', 'Xaxim', 75, '16340-036', 'Rio de Janeiro', 9),
(7, 'Jimbolim General', 'Melacado', 'São Vincente', 92, '34980-619', 'Espiríto Santo', 14),
(8, 'Leodrindourado Fernandez', 'Jardim Paraíso', 'Joinville', 23, '83385-916', 'Santa Catarina', 15),
(9, 'Imbatuba dos Moraes', 'Longneck', 'Garuva', 735, '92759-927', 'Rio Grande do Sul', 16),
(10, 'Jair Mouros', 'Cristo Maior', 'Pinha', 32, '39850-024', 'Paraná', 17);

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `id_forma_pagamento` int NOT NULL,
  `forma_de_pagamento` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`id_forma_pagamento`, `forma_de_pagamento`) VALUES
(1, 'cartao'),
(2, 'boleto'),
(3, 'pix');

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico_compra`
--

CREATE TABLE `historico_compra` (
  `id_historico` int NOT NULL,
  `fk_produto` int NOT NULL,
  `fk_pedido` int NOT NULL,
  `qtd` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagem_produto`
--

CREATE TABLE `imagem_produto` (
  `id_imagem` int NOT NULL,
  `link_imagem` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fk_produto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `imagem_produto`
--

INSERT INTO `imagem_produto` (`id_imagem`, `link_imagem`, `fk_produto`) VALUES
(21, 'https://img.lojadomecanico.com.br/256/31/284/98302/1673465470780.JPG', 1),
(22, 'https://img.lojadomecanico.com.br/IMAGENS/2/121/19899/Chave-de-Fenda-Ponta-Cruzada-Phillips-em-tramontinapro-441350301.JPG', 2),
(23, 'https://io.convertiez.com.br/m/mabore/shop/products/images/2969/medium/serrote-profissional-ref-2480024-nicholson_10319.png', 3),
(24, 'https://a-static.mlcdn.com.br/450x450/5-ripas-regua-madeira-pinus-aparelhada-64-cm-x-1-cm-x-2-matarazzo-decor/matarazzodecor/552e1802487211ec9f314201ac185039/6c3fe2e6d8480aea722bffff2d5985be.jpeg', 4),
(25, 'https://static.ferramentaskennedy.com.br/storage/original/furadeira-de-impacto-1-2-700w-2-vvr-dw505-dewalt-127-volts_1_1565275077.jpg', 5),
(26, 'https://ferramentasgerais.vteximg.com.br/arquivos/ids/618350/Macaco-hidraulico-tipo-garrafa-4-toneladas-2-estagios-EF4F---BOVENAU---EF-4F---BOVENAU.jpg?v=638077136573270000', 6),
(27, 'https://img.lojadomecanico.com.br/IMAGENS/2/253/125953/1601553687233.JPG', 7),
(28, 'https://img.lojadomecanico.com.br/IMAGENS/11/440/69892/Armario-para-Ferramentas-com-Prateleira-marcon-am-41.JPG', 8),
(29, 'https://static3.tcdn.com.br/img/img_prod/602916/chave_inglesa_ajustavel_06_polegadas_fertak_23155431_1_2fc12022d99c068fd2eac372f8118f10.jpeg', 9),
(30, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfSaxXZXnR-7GMdEsuAYtJQXp_5gDxJrQToZhG0viqv9Nwr6GKhAH9RhSIbUSXrJAQVpw&usqp=CAU', 10),
(31, 'https://images.tcdn.com.br/img/img_prod/632258/multimetro_digital_profissional_com_capacimetro_dt9205a_1535_1_9fddb451903a3b00b5041667c77307ce.jpg', 11),
(32, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4X-5DNmzySpD5bxsT1VA9htW_bMNR82kdzg&usqp=CAU', 12),
(33, 'https://images.tcdn.com.br/img/img_prod/1100542/kit_brocas_bits_soquetes_com_74_pecas_p_90336_makita_5219_1_1a86837ddbd7cd943e0b9151ac4ba6e1.jpg', 13),
(34, 'https://http2.mlstatic.com/D_NQ_NP_683579-MLB69576264152_052023-O.webp', 14),
(35, 'https://img.lojadomecanico.com.br/IMAGENS/21/222/118769/Esmerilhadeira-Angular-115mm-412-Pol-720-makita-ga4530k1.JPG', 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL,
  `fk_cupom` int DEFAULT NULL,
  `fk_cliente` int NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `preco_final` decimal(10,2) NOT NULL,
  `fk_forma_pagamento` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pergunta_resposta`
--

CREATE TABLE `pergunta_resposta` (
  `id_pergunta_resposta` int NOT NULL,
  `fk_cliente` int NOT NULL,
  `fk_produto` int NOT NULL,
  `data` date NOT NULL,
  `pergunta` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resposta` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int NOT NULL,
  `nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `qtd_estoque` int NOT NULL,
  `descricao` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `inf_tecnicas` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome`, `qtd_estoque`, `descricao`, `preco`, `inf_tecnicas`) VALUES
(1, 'Betoneira', 678, 'Lorem Ipsum is simply dummy text of the printing and typesettin', '3956.54', '{\"cor\": \"Amarelo\", \"nome\": \"Betoneira\", \"marca\": \"menegotti\", \"modelo\": \"Prime-400\", \"consumo\": \"Mediano\", \"voltagem\": \"220V\", \"capacidade\": \"400L\"}'),
(2, 'Chave-de-fenda', 43556, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised ', '87.00', '{\"cor\": \"Preto e vermelho\", \"nome\": \"Chave-de-fenda\", \"marca\": \"Samisungui\", \"modelo\": \"Lifiter Schifon\", \"tamanho\": \"14cm\", \"material\": \"Silicone e aço\"}'),
(3, 'Serrote', 1395, 'literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil)', '157.45', '{\"nome\": \"Serrote\", \"marca\": \"Semor\", \"modelo\": \"Fion\", \"tamanho\": \"600mm\", \"material\": \"Madeira e aço-temperado\"}'),
(4, 'Madeira', 9579, 'middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a di', '50.53', '{\"nome\": \"Madeira\", \"tipo\": \"Pinus\", \"tamanho\": \"6x13x30\", \"quantidade\": \"10uni\"}'),
(5, 'Furadeira', 3567, 'comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory ', '456.45', '{\"cor\": \"Rosa\", \"nome\": \"Furadeira\", \"marca\": \"Bosch\", \"modelo\": \"Lisbou\", \"movido\": \"Bateria biovolt\", \"tamanho\": \"38pol\", \"voltagem\": \"32V\"}'),
(6, 'Macaco hidraulico', 6744, 'duced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by ', '135.67', '{\"cor\": \"Vermelho\", \"nome\": \"macaco-hidralico\", \"tipo\": \"Sanfona\", \"marca\": \"Nicher\", \"modelo\": \"chinfer\", \"capacidade\": \"600kg\", \"mobilidade\": \"Passeio-de-carro\"}'),
(7, 'Martelo', 9236, 'nd to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate L', '176.00', '{\"name\": \"martelo\", \"peso\": \"500G\", \"marca\": \"maxzir\", \"modelo\": \"Iron-tacker\", \"material\": \"Fibra de vidro e aço inoxidável\", \"tamanho-cabo\": \"30cm\", \"tamanho-cabeça\": \"20mm\"}'),
(8, 'Estante', 3568, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolo', '365.23', '{\"nome\": \"Estante\", \"peso\": \"10kg\", \"marca\": \"Smiger\", \"modelo\": \"Presto\", \"tamanho\": \"100cm x 50cm x 40cm\", \"material\": \"Liga de aço inoxidável\", \"capacidade\": \"500kg\"}'),
(9, 'Chave-inglesa', 5327, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit ', '164.34', '{\"cor\": \"Preto\", \"nome\": \"chave-inglesa\", \"tipo\": \"Ajustável\", \"marca\": \"Sparta\", \"modelo\": \"Kince-L\", \"tamanho\": \"18pol\", \"material\": \"Aço carbono\"}'),
(10, 'Caixa-de-ferramenta', 3475, 'um quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commo', '493.34', '{\"cor\": \"cinza\", \"Peso\": \"1.65kg\", \"nome\": \"Caixa-de-ferramentas\", \"marca\": \"kornji\", \"modelo\": \"master-completo\", \"tamanho\": \"grande\", \"material\": \"plástico e aço\", \"numero-de-pecas\": \"60uni\"}'),
(11, 'Multimetro_digital', 5625, 'Instrumento destinado a usuários hobbistas\r\n• Destaca-se pelo seu custo/benefício e teste de continuidade\r\n• Display: 3 ½ Dígitos (2000 Contagens)\r\n• Indicação de Sobre faixa: Mostra apenas o dígito mais significativo (1)\r\n• Mudança de Faixa: Manual\r\n• Indicador de Bateria Fraca: símbolo de bateria é mostrado no display\r\n• Ambiente de Operação: 0°C a 40°C, RH < 75%\r\n• Ambiente de Armazenamento: -10°C a 50°C, RH < 85%\r\n• Altitude: até 2000m\r\n• Uso Interno\r\n• Linha Hobby\r\n• Alimentação: 1 x 9V (6LF22, NEDA1604A)\r\n• Dimensões: 128(A) x 66(L) x 27(P)mm', '72.00', '{\r\n        \"cor\":\"Amarelo\",\r\n        \"marca\":\"jingchong\",\r\n        \"modelo\":\"Bomfager\",\r\n        \"tensaoDC\":\"Faixa: 200mV, 2000mV, 20V, 200V, 600V  - Precisão: 200mV ± (0.5%+5D) 2000mV ~ 600V ± (0.8%+5D) - Resolução: 100µV, 1mV, 10mV, 100mV, 1V - Impedância de Entrada: 1MW - Proteção de Sobrecarga: 600V DC / AC RMS\",\r\n        \"correnteDC\":\"Faixa: 200µA, 2000µA, 20mA, 200mA, 10A - Precisão: 200µA ~ 20mA ± (1.0%+5D); 200mA ± (1.2%+5D); 10A ± (2.0%+5D) - Resolução: 0.1µA, 1µA, 10µA, 100µA, 10mA - Proteção de Sobrecarga: Fusível de 0.25A/250V para entrada mA, sem Fusível para Entrada 10A (10A máximo por 10 segundos)\",\r\n        \"tensaoAC\":\"Faixa: 200V, 600V - Precisão: 200V ~ 600V ± (1.2%+10D)- Resolução: 100mV, 1V- Impedância de Entrada: 500kW- Resposta em Freqüência: 40Hz a 400Hz- Proteção de Sobrecarga: 600V DC / AC RMS\",\r\n        \"resistência\":\"Faixas: 200W, 2000W, 20kW, 200kW, 2000kW - Precisão: 200W ± (1.0%+5D); 2000 ~ 200kW ± (0.8%+5D); 2000kW ± (1.2%+5D) - Resolução: 0.1W, 1W, 10W, 100W, 1kW - Tensão de Circuito Aberto: <3.2V DC (máximo) - Proteção de Sobrecarga: 250V DC / AC RMS\",\r\n        \"testedetransistor\":\"Faixa: 1 a 1000 - Tipo: NPN / PNP - Corrente de Base: Aprox. 10µA DC - Tensão Vce: 2.8V DC\",\r\n        \"testedediodo\":\"Faixa: Diodo - Corrente de Teste: 1mA - Tensão de Teste: 2.8V DC (máximo) - Proteção de Sobrecarga: 250V DC / AC RMS\",\r\n        \"aplicacao\":\"Multímetro de baixo custo e dimensões reduzidas com diversos recursos para aplicações em ambientes monofásicos, bancadas, hobby - Faz medições de tensão DC e AC, corrente DC, resistência, teste de diodo e transistor\",\r\n        \"acessorios\":\"Manual de Instruções - Pontas de prova (par) - Bateria (instalada)\"\r\n    }'),
(12, 'Compressor de Ar 20L 6,4Pés 2HP 116PSI', 923, 'O Compressor de Ar CP8022 possui motor elétrico com 2,0 HP de potência, um reservatório de ar de 20 litros, que alcança pressão de operação máxima de 116 lbf/pol². Este compressor possui alças e rodas que facilitam sua mobilidade para onde for necessário, possibilitando trabalhos em áreas externas e conta com pés de borracha para melhor absorção de vibração. Ele é ideal para calibrar pneus, pintar pequenas áreas, trabalhos artesanais, inflar bolas, piscinas e boias.', '894.00', '{\r\n        \"cor\":\"Amarelo e preto\",\r\n        \"marca\":\"Tekma\",\r\n        \"modelo\":\"porcharroo\",\r\n        \"especificacao\":\"Potência do motor de 2,0 HP - Pressão máxima de 116 lbf/pol² - Deslocamento Teórico de 6,4 pés³/min - Tensão 220V \"\r\n    }'),
(13, 'Bosch Kit De Pontas E Brocas X-Line 33 Pçs', 8364, 'O Kit de Pontas e Brocas X-Line Bosch é completo e ideal para quem busca praticidade para executar diferentes tipos de trabalho pois inclui uma variedade de pontas e brocas que auxiliam em aplicações de parafusamento, perfuração e fixação.\r\n\r\nO Kit pode ser utilizado em reparos, instalações e montagens, pequenos trabalhos em obras, serralherias e marcenarias. Acompanha uma maleta robusta que facilita a armazenagem, transporte e acesso de todo o conteúdo de forma bastante organizada.', '100.00', '{\r\n        \"cor\":\"Grafite e azul\",\r\n        \"modelo\":\"Gaterix\",\r\n        \"marca\":\"Bocchi\",\r\n        \"material\":\"metal\",\r\n        \"numerodepecas\":33,\r\n        \"componentesincluidos\":\"7 Brocas para Metal Ø2/3/3/3,2/4/4,2/5mm, 5 Brocas para Concreto Ø4/5/6/7/8mm, 6 Brocas para Madeira Ø3/4/5/6/7/8mm, 10 Pontas 25mm: PH1, PH2, PH3, PZ1, PZ2, S4, S6, S7, T20,T25, 1 suporte universal magnético, 3 chaves de caixa para parafusos sextavados Ø7/8/10mm, 1 escareador, 1 maleta plástica para armazenamento.\",\r\n        \"dimensoes\":\"17cm x 14,8cm x 4,9 x 530g\"\r\n    }'),
(14, 'Kit_75_Conexoes_canos_PVC', 7462, 'KIT COM 75 CONEXOES 25 UNIDADES LUVA SOLDAVEL 3/4 (25MM25 UNIDADES COTOVELO 90 GRAUS 3/4 (25MM) 25 UNIDADES TEE SOLDAVEL 3/4 (25MM)\r\n', '83.00', '{\r\n        \"cor\":\"marrom\",\r\n        \"marca\":\"plastiver\",\r\n        \"material\":\"PVC\",\r\n        \"formatodevenda\":\"kit\",\r\n        \"unidades\":75,\r\n        \"diametro\":\"26mm\",\r\n        \"formato\":\"redondo\",\r\n        \"galvanizado\":\"nao\"\r\n    }'),
(15, 'Esmerilhadeira Angular 4.1/2\"', 3625, 'A Esmerilhadeira Angular da Bosch, é uma ferramenta leve, compacta e muito potente, conta com motor de 710W, com alto desempenho. Possui um sistema de resfriamento de motor com dupla entrada e fluxo de ar, perfeita para uso contínuo da peça, perfeita para realizar desbastes e cortes de materiais com maior precisão e qualidade, com menos esforço e mais agilidade. Possui sistema de escova de carbono no seu motor, aumentando a sua vida útil e com baixo custo de manutenção. Sua estrutura foi pensada para melhor pega na empunhadura, gerando menos estresse muscular e maior produtividade.\r\nEspecificações:\r\n\r\nNovo designer mais robusto e resistente;\r\nMáquina de alto desempenho, ergonômica e leve;\r\nEntradas de ar duplas para melhor fluxo de ar, gerando maior resfriamento da peça;\r\nSuas escovas de carvão garantem melhor desempenho;\r\nAlta taxa de remoção e potência máxima com excelente capacidade de sobrecarga;\r\nCorte, desbaste, lixamento, acabamento e remoção de material em metais.\r\n\r\nAcompanha:\r\n\r\n- 1 Chave de aperto;\r\n- 1 Flange de apoio;\r\n- 1 Porca de aperto;\r\n- 1 Capa protetora;\r\n- 1 punho auxiliar;\r\n- 1 manual.', '484.00', '{\r\n        \"cor\":\"azul e preto\",\r\n        \"marca\":\"bocchi\",\r\n        \"modelo\":\"jesonell 3000\",\r\n        \"potencia\":\"750V\",\r\n        \"peso\":\"1.7kg\",\r\n        \"diametrodisco\":\"115mm-4.5pol\",\r\n        \"circuferencia grip\":\"190mm\",\r\n        \"niveldepotenciasonora\":\"97dB(A)\",\r\n        \"Nível de Pressão Sonora\":\"86dB(A)\",\r\n        \"Incerteza\":\"K=3dB\",\r\n        \"Rotação\":\"12.500rpm\",\r\n        \"Eixo\":\"M14\",\r\n        \"Dimensão\":\"28 cmx12 cmx11 cm\",\r\n        \"Voltagem\":\"220V\"\r\n    }');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_carrinho`
--

CREATE TABLE `produto_carrinho` (
  `id_produto_carrinho` int NOT NULL,
  `fk_produto` int NOT NULL,
  `fk_cliente` int NOT NULL,
  `qtd_produto` int NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Acionadores `produto_carrinho`
--
DELIMITER $$
CREATE TRIGGER `pedido_carrinho` AFTER INSERT ON `produto_carrinho` FOR EACH ROW BEGIN
        SET @cliente = NEW.fk_cliente;

        SET @produtocarrinho = NEW.id_produto_carrinho;
        
        SET @qtd = (SELECT qtd_produto FROM produto_carrinho WHERE id_produto_carrinho = @produtocarrinho);
        
        SET @precototal = (SELECT preco*qtd_produto FROM produto_carrinho WHERE id_produto_carrinho = @produtocarrinho);

        SET @pedido = (SELECT fk_pedido FROM carrinho_pedido WHERE fk_cliente = @cliente);

        IF @pedido THEN

            UPDATE pedido SET preco_final = preco_final + @precototal WHERE fk_cliente = @cliente;

        ELSE

            INSERT INTO pedido (fk_cliente, fk_forma_pagamento, status, preco_final)

            VALUES (@cliente, 1, 'carrinho', @precototal);

            INSERT INTO carrinho_pedido (fk_produto_carrinho, fk_pedido, fk_cliente)

            VALUES (@produtocarrinho,(SELECT MAX(id_pedido) FROM pedido), @cliente);

        END IF;

    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_favorito`
--

CREATE TABLE `produto_favorito` (
  `id_produto_favorito` int NOT NULL,
  `fk_produto` int NOT NULL,
  `fk_cliente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produto_favorito`
--

INSERT INTO `produto_favorito` (`id_produto_favorito`, `fk_produto`, `fk_cliente`) VALUES
(1, 1, 4),
(2, 2, 6),
(3, 3, 7),
(4, 4, 5),
(5, 5, 14),
(6, 6, 15),
(7, 7, 17),
(8, 8, 8),
(9, 9, 9),
(10, 10, 16);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `avaliacao_produto`
--
ALTER TABLE `avaliacao_produto`
  ADD PRIMARY KEY (`id_avaliacao`),
  ADD KEY `fk_cliente` (`fk_cliente`),
  ADD KEY `fk_produto` (`fk_produto`);

--
-- Índices para tabela `carrinho_pedido`
--
ALTER TABLE `carrinho_pedido`
  ADD PRIMARY KEY (`id_itens_pedido`),
  ADD KEY `fk_pedido` (`fk_pedido`),
  ADD KEY `fk_produto_carrinho` (`fk_produto_carrinho`),
  ADD KEY `fk_cliente` (`fk_cliente`);

--
-- Índices para tabela `cartao`
--
ALTER TABLE `cartao`
  ADD PRIMARY KEY (`id_cartao`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `fk_cartao` (`fk_cartao`);

--
-- Índices para tabela `cupom`
--
ALTER TABLE `cupom`
  ADD PRIMARY KEY (`id_cupom`);

--
-- Índices para tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `fk_cliente` (`fk_cliente`);

--
-- Índices para tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`id_forma_pagamento`);

--
-- Índices para tabela `historico_compra`
--
ALTER TABLE `historico_compra`
  ADD PRIMARY KEY (`id_historico`),
  ADD KEY `fk_produto` (`fk_produto`),
  ADD KEY `fk_pedido` (`fk_pedido`);

--
-- Índices para tabela `imagem_produto`
--
ALTER TABLE `imagem_produto`
  ADD PRIMARY KEY (`id_imagem`),
  ADD KEY `fk_produto` (`fk_produto`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_cliente` (`fk_cliente`),
  ADD KEY `fk_cupom` (`fk_cupom`),
  ADD KEY `fk_forma_pagamento` (`fk_forma_pagamento`);

--
-- Índices para tabela `pergunta_resposta`
--
ALTER TABLE `pergunta_resposta`
  ADD PRIMARY KEY (`id_pergunta_resposta`),
  ADD KEY `fk_cliente` (`fk_cliente`),
  ADD KEY `fk_produto` (`fk_produto`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices para tabela `produto_carrinho`
--
ALTER TABLE `produto_carrinho`
  ADD PRIMARY KEY (`id_produto_carrinho`),
  ADD KEY `fk_cliente` (`fk_cliente`),
  ADD KEY `fk_produto` (`fk_produto`);

--
-- Índices para tabela `produto_favorito`
--
ALTER TABLE `produto_favorito`
  ADD PRIMARY KEY (`id_produto_favorito`),
  ADD KEY `fk_cliente` (`fk_cliente`),
  ADD KEY `fk_produto` (`fk_produto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacao_produto`
--
ALTER TABLE `avaliacao_produto`
  MODIFY `id_avaliacao` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `carrinho_pedido`
--
ALTER TABLE `carrinho_pedido`
  MODIFY `id_itens_pedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de tabela `cartao`
--
ALTER TABLE `cartao`
  MODIFY `id_cartao` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `cupom`
--
ALTER TABLE `cupom`
  MODIFY `id_cupom` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  MODIFY `id_endereco` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id_forma_pagamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `historico_compra`
--
ALTER TABLE `historico_compra`
  MODIFY `id_historico` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `imagem_produto`
--
ALTER TABLE `imagem_produto`
  MODIFY `id_imagem` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de tabela `pergunta_resposta`
--
ALTER TABLE `pergunta_resposta`
  MODIFY `id_pergunta_resposta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `produto_carrinho`
--
ALTER TABLE `produto_carrinho`
  MODIFY `id_produto_carrinho` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT de tabela `produto_favorito`
--
ALTER TABLE `produto_favorito`
  MODIFY `id_produto_favorito` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `avaliacao_produto`
--
ALTER TABLE `avaliacao_produto`
  ADD CONSTRAINT `avaliacao_produto_ibfk_1` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `avaliacao_produto_ibfk_2` FOREIGN KEY (`fk_produto`) REFERENCES `produto` (`id_produto`);

--
-- Limitadores para a tabela `carrinho_pedido`
--
ALTER TABLE `carrinho_pedido`
  ADD CONSTRAINT `carrinho_pedido_ibfk_2` FOREIGN KEY (`fk_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `carrinho_pedido_ibfk_3` FOREIGN KEY (`fk_produto_carrinho`) REFERENCES `produto_carrinho` (`id_produto_carrinho`),
  ADD CONSTRAINT `carrinho_pedido_ibfk_4` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`fk_cartao`) REFERENCES `cartao` (`id_cartao`);

--
-- Limitadores para a tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  ADD CONSTRAINT `endereco_cliente_ibfk_1` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Limitadores para a tabela `historico_compra`
--
ALTER TABLE `historico_compra`
  ADD CONSTRAINT `historico_compra_ibfk_2` FOREIGN KEY (`fk_produto`) REFERENCES `produto` (`id_produto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `historico_compra_ibfk_3` FOREIGN KEY (`fk_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `imagem_produto`
--
ALTER TABLE `imagem_produto`
  ADD CONSTRAINT `imagem_produto_ibfk_1` FOREIGN KEY (`fk_produto`) REFERENCES `produto` (`id_produto`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`fk_cupom`) REFERENCES `cupom` (`id_cupom`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`fk_forma_pagamento`) REFERENCES `forma_pagamento` (`id_forma_pagamento`);

--
-- Limitadores para a tabela `pergunta_resposta`
--
ALTER TABLE `pergunta_resposta`
  ADD CONSTRAINT `pergunta_resposta_ibfk_1` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `pergunta_resposta_ibfk_2` FOREIGN KEY (`fk_produto`) REFERENCES `produto` (`id_produto`);

--
-- Limitadores para a tabela `produto_carrinho`
--
ALTER TABLE `produto_carrinho`
  ADD CONSTRAINT `produto_carrinho_ibfk_1` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `produto_carrinho_ibfk_2` FOREIGN KEY (`fk_produto`) REFERENCES `produto` (`id_produto`);

--
-- Limitadores para a tabela `produto_favorito`
--
ALTER TABLE `produto_favorito`
  ADD CONSTRAINT `produto_favorito_ibfk_1` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `produto_favorito_ibfk_2` FOREIGN KEY (`fk_produto`) REFERENCES `produto` (`id_produto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
