-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 18 août 2024 à 18:14
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `amsdbrest2024`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `provider_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `article_seq`
--

CREATE TABLE `article_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `article_seq`
--

INSERT INTO `article_seq` (`next_val`) VALUES
(151);

-- --------------------------------------------------------

--
-- Structure de la table `provider`
--

CREATE TABLE `provider` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `provider`
--

INSERT INTO `provider` (`id`, `address`, `email`, `name`, `logo`) VALUES
(602, 'Koré du SUD', 'samsung@gmail.com', 'Samsung', NULL),
(652, 'Paris', 'orange.paris@hotmail.fr', 'Orange Phone', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `provider_seq`
--

CREATE TABLE `provider_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `provider_seq`
--

INSERT INTO `provider_seq` (`next_val`) VALUES
(751);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` enum('SUPER_ADMIN','ADMIN','USER') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'USER'),
(2, 'ADMIN'),
(6, 'SUPER_ADMIN');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `username`) VALUES
(1, 'amine.mezghich@gmail.com', '$2a$10$0pQ/tMkITl.Mk8YzQnvMf.ec1IsIHe8fycaqJGPQncTfRmrUYZ122', 'amine'),
(2, 'amine.mezghich@ensi-uma.tn', '$2a$10$WTFqkdde8qJdWdjKDzkOHul7Ks.bdeyuIepZRt1H4yeFW4S74LDWS', 'mezghich'),
(8, 'hakim@gmail.com', '$2a$10$RVlg2uSo2B3i.npmtBmkIO2Nr.2BG8dg1tKhk114Q/qiAA3SXzBxq', 'hakim'),
(9, 'ma.mezghich@smart-it-partner.com', '$2a$10$wAizdMmoBUJ48ErxUJxlb.PR4UwAku9rLIZVt3Roc39/2/lwgci5y', 'mohamedmezghich'),
(10, 'ib@smart-it-partner.com', '$2a$10$OaFAcTG3Jn.U6lSrkz2rmeGvQB51e/Q2BU4K28Bz.Curze9yPD0JW', 'Ibtissem'),
(11, 'ib2@smart-it-partner.com', '$2a$10$Ctsgemfys1FjqAUy56i1y.ziME7LgntE1V7hG76sjirnX0VbhLBNG', 'Ibtissem2'),
(12, 'fatima@gmail.com', '$2a$10$yeBIsE6g1fLjNF2HiHsJU.Bz97ZYrAJM1T1W2NvQmci2YYd1UXgQi', 'fatima'),
(13, 'ali@gmail.com', '$2a$10$0kBqdSyud6fxHch/3jbVCejdPXGLQoS5PcuKMgeMYGa7p3Q294xje', 'ali'),
(14, 'amine.mezghich2@gmail.com', '$2a$10$wMWyTTtE3dnDPGPbaah86u8y.CMFLVlKy5COIIBXIjYxqA5Lgc2Su', 'mezghich2020');

-- --------------------------------------------------------

--
-- Structure de la table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 2),
(1, 6),
(2, 1),
(8, 2),
(8, 6),
(9, 1),
(10, 1),
(11, 2),
(11, 6),
(12, 1),
(13, 2),
(14, 6);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmnpkd1byk5tf93jmt5vay3c2y` (`provider_id`);

--
-- Index pour la table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  ADD UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`);

--
-- Index pour la table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKt7e7djp752sqn6w22i6ocqy6q` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FKmnpkd1byk5tf93jmt5vay3c2y` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FKj345gk1bovqvfame88rcx7yyx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKt7e7djp752sqn6w22i6ocqy6q` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
