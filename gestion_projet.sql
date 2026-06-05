-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 05 juin 2026 à 18:54
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `projets`
--

DROP TABLE IF EXISTS `projets`;
CREATE TABLE IF NOT EXISTS `projets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_echeance` date DEFAULT NULL,
  `proprietaire_id` int DEFAULT NULL,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proprietaire_id` (`proprietaire_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `projets`
--

INSERT INTO `projets` (`id`, `nom`, `description`, `date_creation`, `date_echeance`, `proprietaire_id`, `dateDebut`, `dateFin`, `statut`) VALUES
(1, 'E-RINDRA', 'creation de plateforme de gestion de projet ', '2026-03-07 20:13:30', '2026-03-09', 1, NULL, NULL, NULL),
(2, 'E-lodge', 'Application de gestion d\'hotelerie développé avec Laravem', '2026-03-08 08:08:07', '2026-03-10', 2, NULL, NULL, NULL),
(3, 'E-lodge', 'Plateforme de gestion de hotellerie', '2026-03-10 06:27:58', '2026-03-13', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `sous_taches`
--

DROP TABLE IF EXISTS `sous_taches`;
CREATE TABLE IF NOT EXISTS `sous_taches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `est_terminee` tinyint(1) DEFAULT '0',
  `tache_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tache_id` (`tache_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `sous_taches`
--

INSERT INTO `sous_taches` (`id`, `titre`, `est_terminee`, `tache_id`) VALUES
(1, 'Design figma', 0, 3),
(2, 'Html statique', 0, 3),
(3, 'design-figma', 0, 4),
(4, 'html statique + css', 0, 4),
(5, 'Vidéo', 0, 11),
(6, 'PPT', 0, 11),
(7, 'Test complet du projet', 0, 11),
(8, 'DEVELOPPEMENT', 0, 10);

-- --------------------------------------------------------

--
-- Structure de la table `taches`
--

DROP TABLE IF EXISTS `taches`;
CREATE TABLE IF NOT EXISTS `taches` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `priorite` varchar(255) DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_echeance` date DEFAULT NULL,
  `projet_id` bigint DEFAULT NULL,
  `assignee_id` int DEFAULT NULL,
  `dateEcheance` date DEFAULT NULL,
  `utilisateur_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assignee_id` (`assignee_id`),
  KEY `FKr6bwr1pa82wf1c4c800txf4py` (`utilisateur_id`),
  KEY `FKivu36sj7hvl7sr6sbe2mxsnqh` (`projet_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `taches`
--

INSERT INTO `taches` (`id`, `titre`, `description`, `priorite`, `statut`, `date_creation`, `date_echeance`, `projet_id`, `assignee_id`, `dateEcheance`, `utilisateur_id`) VALUES
(1, 'Authentification', 'Créer la page d\'authentification', 'MOYENNE', 'A_FAIRE', '2026-03-07 20:14:31', '2026-03-08', 1, 1, NULL, NULL),
(2, 'Conception BDD', 'Concevoir la base de donné', 'MOYENNE', 'A_FAIRE', '2026-03-08 08:09:02', '2026-03-09', 2, 2, NULL, NULL),
(5, 'Back-end', 'Backend du projet principale', 'MOYENNE', 'TERMINE', '2026-03-10 06:22:26', '2026-03-09', 1, 2, NULL, NULL),
(6, 'Test ', 'Test du projet déjà terminé', 'URGENTE', 'EN_COURS', '2026-03-10 06:22:59', '2026-03-11', 1, 3, NULL, NULL),
(7, 'Front-end', 'Design-front de l\'application ', 'HAUTE', 'EN_ATTENTE', '2026-03-10 06:23:37', '2026-03-10', 1, 1, NULL, NULL),
(8, 'Conception base de donné', 'Créatino du schéma de la base de donné', 'URGENTE', 'TERMINE', '2026-03-10 06:28:40', '2026-03-09', 3, 1, NULL, NULL),
(9, 'Front-end & design ', 'Création de l\'interface', 'BASSE', 'EN_ATTENTE', '2026-03-10 06:29:10', '2026-03-10', 3, 2, NULL, NULL),
(10, 'Back-end', 'Développement du code ', 'MOYENNE', 'EN_COURS', '2026-03-10 06:29:38', NULL, 3, 1, NULL, NULL),
(11, 'Video & ppt & test', 'test du projet et préparation de préentation', 'HAUTE', 'EN_ATTENTE', '2026-03-10 06:30:18', '2026-03-12', 3, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `prenom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `email`, `mot_de_passe`, `date_creation`, `prenom`) VALUES
(1, 'antratia', 'antratia@gmail.com', 'antratia007', '2026-03-07 20:12:29', ''),
(2, 'MIAINA', 'miaina@gmail.com', 'miaina007', '2026-03-08 08:07:13', ''),
(3, 'Misty', 'misty@gmail.com', '$2a$12$63QRILVTGuu.BP2KbwMgkOJfKo6pb.JlU6J2bRp2ZR1HjdTu2WNs6', '2026-03-10 04:56:15', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
