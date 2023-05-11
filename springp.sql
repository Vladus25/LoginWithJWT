-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 11, 2023 alle 15:20
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `springp`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `ingredienti`
--

CREATE TABLE `ingredienti` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ingredienti`
--

INSERT INTO `ingredienti` (`id`, `nome`) VALUES
(6, 'Caffè'),
(7, 'Farina'),
(22, 'fdgfdgd'),
(13, 'Funghi'),
(2, 'Guanciale'),
(19, 'Ingrediente'),
(17, 'Ingrediente 1'),
(18, 'Ingrediente 2'),
(20, 'Larzo'),
(11, 'Lattuga'),
(21, 'Marzo2'),
(5, 'Mascarpone'),
(8, 'Mozzarella'),
(14, 'Parmigiano'),
(10, 'Pollo'),
(9, 'Pomodoro'),
(12, 'Riso'),
(4, 'Savoiardi'),
(1, 'Spaghetti'),
(3, 'Uova');

-- --------------------------------------------------------

--
-- Struttura della tabella `persona`
--

CREATE TABLE `persona` (
  `codice_persona` int(11) NOT NULL,
  `cod_fisc` varchar(255) DEFAULT NULL,
  `cognome` varchar(255) DEFAULT NULL,
  `data_nascita` datetime DEFAULT NULL,
  `genere` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `professione` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `persona`
--

INSERT INTO `persona` (`codice_persona`, `cod_fisc`, `cognome`, `data_nascita`, `genere`, `nome`, `professione`) VALUES
(1, 'aaliberti', 'Aliberti', '1990-05-29 00:00:00', 'M', 'Aurelio', 'Ingegnere informatico'),
(3, 'adebattisti', 'Debattisti', '1993-03-06 00:00:00', 'M', 'Andrea', 'Ingegnere elettronico'),
(4, 'bpennacchio', 'Pennacchio', '1992-08-20 00:00:00', 'M', 'Bruno', 'Help desk'),
(5, 'fmicillo', 'Micillo', '1993-04-07 00:00:00', 'M', 'Fabio', 'Salesforce'),
(6, 'giandod', 'D\'angiola', '1988-11-04 00:00:00', 'M', 'Gian Domenico', 'Sap'),
(7, 'ppetroni', 'Petroni', '1991-03-18 00:00:00', 'M', 'Paolo', 'Help desk'),
(8, 'sdangelo', 'D\'Angelo', '1993-11-27 00:00:00', 'M', 'Salvatore', 'Sap'),
(9, 'afiorentino', 'Fiorentino', '2000-10-11 00:00:00', 'M', 'Andrea', 'Sap'),
(11, 'acadeas', 'Verdi', '2003-06-03 00:00:00', 'F', 'Maria', 'idk');

-- --------------------------------------------------------

--
-- Struttura della tabella `ricette`
--

CREATE TABLE `ricette` (
  `id` int(11) NOT NULL,
  `calorie` int(11) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `difficolta` varchar(20) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `tempo` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ricette`
--

INSERT INTO `ricette` (`id`, `calorie`, `categoria`, `difficolta`, `nome`, `tempo`) VALUES
(1, 400, 'Primi piatti', 'Media', 'Spaghetti alla carbonara', '20 minuti'),
(2, 300, 'Dolci', 'Facile', 'Tiramisù', '30 minuti'),
(3, 600, 'Pizze', 'Media', 'Pizza Margherita', '40 minuti'),
(4, 200, 'Insalate', 'Facile', 'Insalata di pollo', '15 minuti'),
(5, 450, 'Primi piatti', 'Media', 'Risotto ai funghi', '25 minuti'),
(6, 500, 'primo piatto', 'media', 'Nome Ricetta', '60 minuti'),
(7, 400, 'primo', 'media', 'PiattoProva', '50 minuti'),
(8, 400, 'primo', 'media', 'PiattoProva2', '50 minuti'),
(9, 343, 'fgfg', 'media', 'fgdfg', 'dfgdfg'),
(10, 500, 'adsa', 'facile', 'qwer', '20m'),
(11, 300, '454353', 'facile', 'trt', 'retrt'),
(12, 300, '454353', 'facile', 'trttyyyy', 'retrt'),
(13, 8, 'dfgfdg', 'facile', 'rtertreter', 'reer');

-- --------------------------------------------------------

--
-- Struttura della tabella `ricette_ingredienti`
--

CREATE TABLE `ricette_ingredienti` (
  `ricetta_id` int(11) NOT NULL,
  `ingrediente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ricette_ingredienti`
--

INSERT INTO `ricette_ingredienti` (`ricetta_id`, `ingrediente_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 13),
(5, 14),
(6, 17),
(6, 18),
(7, 17),
(7, 18),
(8, 18),
(8, 19),
(9, 2),
(9, 20),
(10, 20),
(10, 21),
(11, 7),
(12, 6),
(12, 7),
(13, 10),
(13, 22);

-- --------------------------------------------------------

--
-- Struttura della tabella `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ROLE_USER'),
(2, 'ROLE_MODERATOR'),
(3, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `username`) VALUES
(1, 'harmfulcati@gmail.com', '$2a$10$9TPB57qKLlHmLzY9rKfaKOXWLSdPtMkSUS2anUiyXxjRdRJyUPOKG', 'vlad');

-- --------------------------------------------------------

--
-- Struttura della tabella `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `ingredienti`
--
ALTER TABLE `ingredienti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKip8tqx7dd0sjsqb3e6v6gj6uj` (`nome`);

--
-- Indici per le tabelle `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`codice_persona`);

--
-- Indici per le tabelle `ricette`
--
ALTER TABLE `ricette`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ricette_ingredienti`
--
ALTER TABLE `ricette_ingredienti`
  ADD PRIMARY KEY (`ricetta_id`,`ingrediente_id`),
  ADD KEY `FK2ud9ld1k2tr7ev5r9aogq9j5i` (`ingrediente_id`);

--
-- Indici per le tabelle `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  ADD UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`);

--
-- Indici per le tabelle `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `ingredienti`
--
ALTER TABLE `ingredienti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT per la tabella `persona`
--
ALTER TABLE `persona`
  MODIFY `codice_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `ricette`
--
ALTER TABLE `ricette`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `ricette_ingredienti`
--
ALTER TABLE `ricette_ingredienti`
  ADD CONSTRAINT `FK2ud9ld1k2tr7ev5r9aogq9j5i` FOREIGN KEY (`ingrediente_id`) REFERENCES `ingredienti` (`id`),
  ADD CONSTRAINT `FK5i988ly6x2b3o1hbp2av9el5a` FOREIGN KEY (`ricetta_id`) REFERENCES `ricette` (`id`);

--
-- Limiti per la tabella `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
