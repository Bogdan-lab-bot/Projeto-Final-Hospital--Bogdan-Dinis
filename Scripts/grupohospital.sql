-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 30-Out-2025 às 16:16
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
CREATE DATABASE IF NOT EXISTS `grupohospital` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `grupohospital`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Analise`
--

DROP TABLE IF EXISTS `Analise`;
CREATE TABLE IF NOT EXISTS `Analise` (
  `IdAnalise` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(100) NOT NULL,
  `Data` date NOT NULL,
  `Resultado` varchar(100) NOT NULL,
  `IdLab` int(11) NOT NULL,
  PRIMARY KEY (`IdAnalise`),
  KEY `Analise_Laboratorio_FK` (`IdLab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Doente`
--

DROP TABLE IF EXISTS `Doente`;
CREATE TABLE IF NOT EXISTS `Doente` (
  `IdDoente` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Morada` varchar(100) NOT NULL,
  `Telefone` int(9) NOT NULL,
  `Doenca` varchar(100) NOT NULL,
  `IdAnalise` int(11) NOT NULL,
  `IdEmp` int(11) DEFAULT NULL,
  `Idade` int(11) NOT NULL,
  `SocioSocial` varchar(1) NOT NULL,
  `IdInst` int(11) DEFAULT NULL,
  `IdHosp` int(11) NOT NULL,
  PRIMARY KEY (`IdDoente`),
  KEY `Doente_Analise_FK` (`IdAnalise`),
  KEY `Doente_Empregado_FK` (`IdEmp`),
  KEY `Doente_Instituicao_FK` (`IdInst`),
  KEY `Doente_Hospital_FK` (`IdHosp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Empregado`
--

DROP TABLE IF EXISTS `Empregado`;
CREATE TABLE IF NOT EXISTS `Empregado` (
  `IdEmp` int(11) NOT NULL AUTO_INCREMENT,
  `IdHosp` int(11) NOT NULL,
  `Categoria` varchar(100) NOT NULL,
  `Vencimento` double NOT NULL,
  `SocioSocial` varchar(1) NOT NULL,
  `IdInst` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdEmp`),
  KEY `Empregado_Hospital_FK` (`IdHosp`),
  KEY `Empregado_Instituicao_FK` (`IdInst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Enfermaria`
--

DROP TABLE IF EXISTS `Enfermaria`;
CREATE TABLE IF NOT EXISTS `Enfermaria` (
  `IdEnfermaria` int(11) NOT NULL AUTO_INCREMENT,
  `Sigla` varchar(100) NOT NULL,
  `Camas` int(11) NOT NULL,
  `Funcao` varchar(100) NOT NULL,
  `IdHosp` int(11) NOT NULL,
  PRIMARY KEY (`IdEnfermaria`),
  KEY `Enfermaria_Hospital_FK` (`IdHosp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Enfermeiro`
--

DROP TABLE IF EXISTS `Enfermeiro`;
CREATE TABLE IF NOT EXISTS `Enfermeiro` (
  `IdEnfermeiro` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Morada` varchar(100) NOT NULL,
  `Telefone` int(9) NOT NULL,
  `IdEnfermaria` int(11) NOT NULL,
  `IdEmp` int(11) NOT NULL,
  `Idade` int(11) NOT NULL,
  PRIMARY KEY (`IdEnfermeiro`),
  KEY `Enfermeiro_Enfermaria_FK` (`IdEnfermaria`),
  KEY `Enfermeiro_Empregado_FK` (`IdEmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Hospital`
--

DROP TABLE IF EXISTS `Hospital`;
CREATE TABLE IF NOT EXISTS `Hospital` (
  `IdHosp` int(11) NOT NULL AUTO_INCREMENT,
  `NomeHosp` varchar(100) NOT NULL,
  `Localidade` varchar(100) NOT NULL,
  PRIMARY KEY (`IdHosp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Instituicao`
--

DROP TABLE IF EXISTS `Instituicao`;
CREATE TABLE IF NOT EXISTS `Instituicao` (
  `IdInst` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Morada` varchar(100) NOT NULL,
  PRIMARY KEY (`IdInst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Laboratorio`
--

DROP TABLE IF EXISTS `Laboratorio`;
CREATE TABLE IF NOT EXISTS `Laboratorio` (
  `IdLab` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  PRIMARY KEY (`IdLab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Medico`
--

DROP TABLE IF EXISTS `Medico`;
CREATE TABLE IF NOT EXISTS `Medico` (
  `IdMedico` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Morada` varchar(100) NOT NULL,
  `Telefone` int(9) NOT NULL,
  `Especialidade` varchar(100) NOT NULL,
  `Miope` varchar(3) NOT NULL,
  `IdEmp` int(11) NOT NULL,
  `Idade` int(11) NOT NULL,
  `IdHosp` int(11) NOT NULL,
  PRIMARY KEY (`IdMedico`),
  KEY `Medico_Empregado_FK` (`IdEmp`),
  KEY `Medico_Hospital_FK` (`IdHosp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `Analise`
--
ALTER TABLE `Analise`
  ADD CONSTRAINT `Analise_Laboratorio_FK` FOREIGN KEY (`IdLab`) REFERENCES `Laboratorio` (`IdLab`);

--
-- Limitadores para a tabela `Doente`
--
ALTER TABLE `Doente`
  ADD CONSTRAINT `Doente_Analise_FK` FOREIGN KEY (`IdAnalise`) REFERENCES `Analise` (`IdAnalise`),
  ADD CONSTRAINT `Doente_Empregado_FK` FOREIGN KEY (`IdEmp`) REFERENCES `Empregado` (`IdEmp`),
  ADD CONSTRAINT `Doente_Hospital_FK` FOREIGN KEY (`IdHosp`) REFERENCES `Hospital` (`IdHosp`),
  ADD CONSTRAINT `Doente_Instituicao_FK` FOREIGN KEY (`IdInst`) REFERENCES `Instituicao` (`IdInst`);

--
-- Limitadores para a tabela `Empregado`
--
ALTER TABLE `Empregado`
  ADD CONSTRAINT `Empregado_Hospital_FK` FOREIGN KEY (`IdHosp`) REFERENCES `Hospital` (`IdHosp`),
  ADD CONSTRAINT `Empregado_Instituicao_FK` FOREIGN KEY (`IdInst`) REFERENCES `Instituicao` (`IdInst`);

--
-- Limitadores para a tabela `Enfermaria`
--
ALTER TABLE `Enfermaria`
  ADD CONSTRAINT `Enfermaria_Hospital_FK` FOREIGN KEY (`IdHosp`) REFERENCES `Hospital` (`IdHosp`);

--
-- Limitadores para a tabela `Enfermeiro`
--
ALTER TABLE `Enfermeiro`
  ADD CONSTRAINT `Enfermeiro_Empregado_FK` FOREIGN KEY (`IdEmp`) REFERENCES `Empregado` (`IdEmp`),
  ADD CONSTRAINT `Enfermeiro_Enfermaria_FK` FOREIGN KEY (`IdEnfermaria`) REFERENCES `Enfermaria` (`IdEnfermaria`);

--
-- Limitadores para a tabela `Medico`
--
ALTER TABLE `Medico`
  ADD CONSTRAINT `Medico_Empregado_FK` FOREIGN KEY (`IdEmp`) REFERENCES `Empregado` (`IdEmp`),
  ADD CONSTRAINT `Medico_Hospital_FK` FOREIGN KEY (`IdHosp`) REFERENCES `Hospital` (`IdHosp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
