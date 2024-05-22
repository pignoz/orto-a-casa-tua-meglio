-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 21, 2024 alle 23:47
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orto_a_casa_tua`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `clienti`
--

CREATE TABLE `clienti` (
  `email` varchar(40) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `contadino`
--

CREATE TABLE `contadino` (
  `IDc` int(10) NOT NULL,
  `nomecontadino` varchar(40) NOT NULL,
  `indirizzo` varchar(40) NOT NULL,
  `contatto` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `prezzi`
--

CREATE TABLE `prezzi` (
  `dataaggiorn` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `price`
--

CREATE TABLE `price` (
  `IDp` int(10) NOT NULL,
  `ID` int(10) NOT NULL,
  `IDc` int(10) NOT NULL,
  `prezzo` int(10) NOT NULL,
  `dataaggiorn` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotti`
--

CREATE TABLE `prodotti` (
  `ID` int(11) NOT NULL,
  `nomeprodotto` varchar(30) NOT NULL,
  `descrizione` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`email`);

--
-- Indici per le tabelle `contadino`
--
ALTER TABLE `contadino`
  ADD PRIMARY KEY (`IDc`);

--
-- Indici per le tabelle `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`IDp`,`IDc`),
  ADD KEY `IDc` (`IDc`);

--
-- Indici per le tabelle `prodotti`
--
ALTER TABLE `prodotti`
  ADD PRIMARY KEY (`ID`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`IDc`) REFERENCES `contadino` (`IDc`);

--
-- Limiti per la tabella `prodotti`
--
ALTER TABLE `prodotti`
  ADD CONSTRAINT `prodotti_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `price` (`IDp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
