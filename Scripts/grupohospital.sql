-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 27-Out-2025 às 15:56
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `grupohospital`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `Analise`
--

CREATE TABLE `Analise` (
  `IdAnalise` int(11) NOT NULL,
  `Tipo` varchar(100) NOT NULL,
  `Data` date NOT NULL,
  `Resultado` varchar(100) NOT NULL,
  `IdLab` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Doente`
--

CREATE TABLE `Doente` (
  `IdDoente` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Morada` varchar(100) NOT NULL,
  `Telefone` int(9) NOT NULL,
  `Doenca` varchar(100) NOT NULL,
  `IdAnalise` int(11) NOT NULL,
  `IdEmp` int(11) DEFAULT NULL,
  `Idade` int(11) NOT NULL,
  `SocioSocial` varchar(1) NOT NULL,
  `IdInst` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Empregado`
--

CREATE TABLE `Empregado` (
  `IdEmp` int(11) NOT NULL,
  `IdHosp` int(11) NOT NULL,
  `Categoria` varchar(100) NOT NULL,
  `Vencimento` double NOT NULL,
  `SocioSocial` varchar(1) NOT NULL,
  `IdInst` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Enfermaria`
--

CREATE TABLE `Enfermaria` (
  `IdEnfermaria` int(11) NOT NULL,
  `Sigla` varchar(100) NOT NULL,
  `Camas` int(11) NOT NULL,
  `Funcao` varchar(100) NOT NULL,
  `IdHosp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Enfermeiro`
--

CREATE TABLE `Enfermeiro` (
  `IdEnfermeiro` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Morada` varchar(100) NOT NULL,
  `Telefone` int(9) NOT NULL,
  `IdEnfermaria` int(11) NOT NULL,
  `IdEmp` int(11) NOT NULL,
  `Idade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Hospital`
--

CREATE TABLE `Hospital` (
  `IdHosp` int(11) NOT NULL,
  `NomeHosp` varchar(100) NOT NULL,
  `Localidade` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Instituicao`
--

CREATE TABLE `Instituicao` (
  `IdInst` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Morada` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Laboratorio`
--

CREATE TABLE `Laboratorio` (
  `IdLab` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Medico`
--

CREATE TABLE `Medico` (
  `IdMedico` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Morada` varchar(100) NOT NULL,
  `Telefone` int(9) NOT NULL,
  `Especialidade` varchar(100) NOT NULL,
  `Miope` varchar(3) NOT NULL,
  `IdEmp` int(11) NOT NULL,
  `Idade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `Analise`
--
ALTER TABLE `Analise`
  ADD PRIMARY KEY (`IdAnalise`);

--
-- Índices para tabela `Doente`
--
ALTER TABLE `Doente`
  ADD PRIMARY KEY (`IdDoente`);

--
-- Índices para tabela `Empregado`
--
ALTER TABLE `Empregado`
  ADD PRIMARY KEY (`IdEmp`);

--
-- Índices para tabela `Enfermaria`
--
ALTER TABLE `Enfermaria`
  ADD PRIMARY KEY (`IdEnfermaria`);

--
-- Índices para tabela `Enfermeiro`
--
ALTER TABLE `Enfermeiro`
  ADD PRIMARY KEY (`IdEnfermeiro`);

--
-- Índices para tabela `Hospital`
--
ALTER TABLE `Hospital`
  ADD PRIMARY KEY (`IdHosp`);

--
-- Índices para tabela `Instituicao`
--
ALTER TABLE `Instituicao`
  ADD PRIMARY KEY (`IdInst`);

--
-- Índices para tabela `Laboratorio`
--
ALTER TABLE `Laboratorio`
  ADD PRIMARY KEY (`IdLab`);

--
-- Índices para tabela `Medico`
--
ALTER TABLE `Medico`
  ADD PRIMARY KEY (`IdMedico`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Analise`
--
ALTER TABLE `Analise`
  MODIFY `IdAnalise` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Doente`
--
ALTER TABLE `Doente`
  MODIFY `IdDoente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Empregado`
--
ALTER TABLE `Empregado`
  MODIFY `IdEmp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Enfermaria`
--
ALTER TABLE `Enfermaria`
  MODIFY `IdEnfermaria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Enfermeiro`
--
ALTER TABLE `Enfermeiro`
  MODIFY `IdEnfermeiro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Hospital`
--
ALTER TABLE `Hospital`
  MODIFY `IdHosp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Instituicao`
--
ALTER TABLE `Instituicao`
  MODIFY `IdInst` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Laboratorio`
--
ALTER TABLE `Laboratorio`
  MODIFY `IdLab` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Medico`
--
ALTER TABLE `Medico`
  MODIFY `IdMedico` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
