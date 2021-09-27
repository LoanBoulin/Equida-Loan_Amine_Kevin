-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 22 sep. 2021 à 12:08
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `equida`
--

-- --------------------------------------------------------

--
-- Structure de la table `acheteur`
--

CREATE TABLE `acheteur` (
  `CLI_ID` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `acheteur`
--

INSERT INTO `acheteur` (`CLI_ID`) VALUES
(1),
(3),
(6),
(7);

-- --------------------------------------------------------

--
-- Structure de la table `ach_cat`
--

CREATE TABLE `ach_cat` (
  `CLI_ID` int(2) NOT NULL,
  `CAT_CODE` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ach_cat`
--

INSERT INTO `ach_cat` (`CLI_ID`, `CAT_CODE`) VALUES
(1, 'ELVG'),
(3, 'ETE'),
(6, 'AUT'),
(6, 'ETE'),
(6, 'XFEV'),
(7, 'ETE');

-- --------------------------------------------------------

--
-- Structure de la table `categvente`
--

CREATE TABLE `categvente` (
  `CAT_CODE` char(6) NOT NULL,
  `CAT_LIBELLE` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categvente`
--

INSERT INTO `categvente` (`CAT_CODE`, `CAT_LIBELLE`) VALUES
('AUT', 'Vente d\'automne'),
('ELVG', 'Vente d\'élevage'),
('ETE', 'Vente d\'été'),
('XFEV', 'Vente mixte de février');

-- --------------------------------------------------------

--
-- Structure de la table `cheval`
--

CREATE TABLE `cheval` (
  `CHE_ID` int(2) NOT NULL,
  `TYP_ID` int(2) NOT NULL,
  `CHE_NOM` char(32) DEFAULT NULL,
  `CHE_SEXE` char(1) DEFAULT NULL,
  `CHE_SIRE` char(32) DEFAULT NULL,
  `CHE_DATENAISSANCE` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cheval`
--

INSERT INTO `cheval` (`CHE_ID`, `TYP_ID`, `CHE_NOM`, `CHE_SEXE`, `CHE_SIRE`, `CHE_DATENAISSANCE`) VALUES
(23, 4, 'Starlight', 'F', '53 525 354 I', '16-04-2015'),
(321, 1, 'Jack', 'M', '89 432 642 A', '13-07-2012'),
(742, 6, 'Dior', 'F', '54 325 346 G', '20-02-2015'),
(865, 3, 'Mambo', 'M', '65 352 604 F', '15-09-2016'),
(943, 4, 'Suzanna', 'F', '75 655 983 J', '22-01-2011'),
(954, 2, 'Pepito', 'M', '85 425 092 N', '03-06-2005');

-- --------------------------------------------------------

--
-- Structure de la table `che_ref`
--

CREATE TABLE `che_ref` (
  `CHE_ID` int(2) NOT NULL,
  `CHE_ID_1` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `CLI_ID` int(2) NOT NULL,
  `CODE` char(3) NOT NULL,
  `CLI_TITRE` char(32) DEFAULT NULL,
  `CLI_NOM` char(32) DEFAULT NULL,
  `CLI_PRENOM` char(32) DEFAULT NULL,
  `CLI_RUE` char(50) DEFAULT NULL,
  `CLI_COPOS` char(32) DEFAULT NULL,
  `CLI_VILLE` char(50) DEFAULT NULL,
  `CLI_ADRESSEMESSAGERIE` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`CLI_ID`, `CODE`, `CLI_TITRE`, `CLI_NOM`, `CLI_PRENOM`, `CLI_RUE`, `CLI_COPOS`, `CLI_VILLE`, `CLI_ADRESSEMESSAGERIE`) VALUES
(1, 'FRA', 'M', 'Deltour', 'Charles', '4 rue du Pont', '14680', 'Bretteville Sur Laize', 'cdeltour@hotmail.com'),
(2, 'ENG', 'F', 'Fime', 'Nadia', '5 rue du Montparnasse', '14220', 'Boulon', ''),
(3, 'FRA', 'M', 'Ertau', 'Frank', '4 Avenue du président Wilson', '14190', 'Urville', 'frank.ertau@laposte.net'),
(4, 'FRA', 'M', 'Maneur', 'David', '6 rue Charles Péguy', '14220', 'Mutrécy', ''),
(5, 'FRA', 'F', 'Berezovski', 'Sylvie', '18 rue du Château', '14680', 'Barbery', ''),
(6, 'FRA', 'F', 'Finley', 'Pascale', '25 rue de Tolbiac', '14680', 'Caillouet', 'pascfinley@yahoo.fr'),
(7, 'ENG', 'M', 'Vofur', 'Hector', '18 rue Deparcieux', '14190', 'Cauvicourt', 'hvofur@free.fr'),
(8, 'FRA', 'M', 'Derzou', 'Fred', '230 avenue de la libert', '14220', 'Espins', 'ouzala@aol.com'),
(9, 'FRA', 'F', 'Serty', 'Julie', '23 rue du Calvaire', '14220', 'Fresney le Vieux', ''),
(10, 'FRA', 'M', 'Vofur', 'Victor', '18 rue Deparcieux', '14680', 'Bretteville Sur Laize', 'victor.vofur@laposte.net');

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `COM_ID` int(2) NOT NULL,
  `CLI_ID` int(2) NOT NULL,
  `COM_LOGIN` char(32) DEFAULT NULL,
  `COM_MDP` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `com_rol`
--

CREATE TABLE `com_rol` (
  `COM_ID` int(2) NOT NULL,
  `ROL_CODE` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `courriel`
--

CREATE TABLE `courriel` (
  `COU_ID` int(2) NOT NULL,
  `VEN_ID` int(2) NOT NULL,
  `COU_DATE` char(50) DEFAULT NULL,
  `COU_OBJET` char(250) DEFAULT NULL,
  `COU_CORPS` char(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `courriel`
--

INSERT INTO `courriel` (`COU_ID`, `VEN_ID`, `COU_DATE`, `COU_OBJET`, `COU_CORPS`) VALUES
(1, 210717, '05-05-2020', 'Nouvelle vente d\'été', 'Du nouveau sur la vente d\'été'),
(2, 90217, '06-05-2021', 'Nouvelle vente', 'Voila une nouvelle vente.');

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

CREATE TABLE `course` (
  `COU_ID` int(2) NOT NULL,
  `COU_NOM` char(32) DEFAULT NULL,
  `COU_LIEU` char(50) DEFAULT NULL,
  `COU_DATE` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `cou_pie`
--

CREATE TABLE `cou_pie` (
  `COU_ID` int(2) NOT NULL,
  `PIE_ID` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cou_pie`
--

INSERT INTO `cou_pie` (`COU_ID`, `PIE_ID`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `enchere`
--

CREATE TABLE `enchere` (
  `ENC_NUMERO` int(2) NOT NULL,
  `LOT_ID` int(2) NOT NULL,
  `VEN_ID` int(2) NOT NULL,
  `CLI_ID` int(2) NOT NULL,
  `ENC_MONTANT` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `jockey`
--

CREATE TABLE `jockey` (
  `JOC_ID` int(2) NOT NULL,
  `JOC_NOM` char(32) DEFAULT NULL,
  `JOC_PRENOM` char(32) DEFAULT NULL,
  `JOC_DATENAISSANCE` char(32) DEFAULT NULL,
  `JOC_POIDS` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

CREATE TABLE `lieu` (
  `LIE_ID` int(2) NOT NULL,
  `LIE_VILLE` char(50) DEFAULT NULL,
  `LIE_NBBOXES` int(5) DEFAULT NULL,
  `LIE_COMMENTAIRES` char(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`LIE_ID`, `LIE_VILLE`, `LIE_NBBOXES`, `LIE_COMMENTAIRES`) VALUES
(1, 'Caen', 100, 'Petit lieu'),
(2, 'Paris', 500, 'Très Grand lieu');

-- --------------------------------------------------------

--
-- Structure de la table `lot`
--

CREATE TABLE `lot` (
  `VEN_ID` int(2) NOT NULL,
  `LOT_ID` int(2) NOT NULL,
  `CHE_ID` int(2) NOT NULL,
  `LOT_PRIXDEPART` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `lot`
--

INSERT INTO `lot` (`VEN_ID`, `LOT_ID`, `CHE_ID`, `LOT_PRIXDEPART`) VALUES
(90217, 1, 742, 7500),
(90217, 2, 321, 10999),
(90217, 3, 23, 6999),
(90217, 4, 865, 14000),
(90217, 5, 943, 8700),
(90217, 6, 954, 9900);

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE `participer` (
  `CHE_ID` int(2) NOT NULL,
  `COU_ID` int(2) NOT NULL,
  `PLACE` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `CODE` char(3) NOT NULL,
  `NOM` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`CODE`, `NOM`) VALUES
('ENG', 'Angleterre'),
('FRA', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `PER_CODE` int(2) NOT NULL,
  `PER_NOM` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `piecejointe`
--

CREATE TABLE `piecejointe` (
  `PIE_ID` int(2) NOT NULL,
  `PIE_CHEMIN` char(32) DEFAULT NULL,
  `PIE_DESCRIPTION` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `piecejointe`
--

INSERT INTO `piecejointe` (`PIE_ID`, `PIE_CHEMIN`, `PIE_DESCRIPTION`) VALUES
(1, 'chemin/photo.jpg', 'Photo numéro 1\r\n'),
(2, 'chemin/photo2.jpg', 'Photo numéro 2\r\n');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `ROL_CODE` int(2) NOT NULL,
  `ROL_NOM` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `rol_per`
--

CREATE TABLE `rol_per` (
  `ROL_CODE` int(2) NOT NULL,
  `PER_CODE` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `typecheval`
--

CREATE TABLE `typecheval` (
  `TYP_ID` int(2) NOT NULL,
  `TYP_LIBELLE` char(100) DEFAULT NULL,
  `TYP_DESCRIPTION` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `typecheval`
--

INSERT INTO `typecheval` (`TYP_ID`, `TYP_LIBELLE`, `TYP_DESCRIPTION`) VALUES
(1, 'Yearlings', 'Yearling est un anglicisme désignant un cheval pur-sang anglais, descendant du pur sang arabe.'),
(2, 'Pur-sang anglais', 'Le Pur-sang Anglais est la plus connue des races de chevaux à sang chaud. C\'est l\'une des races les'),
(3, 'Inédits', 'Les inédits sont les chevaux qui n\'ont jamais participé à une vente.'),
(4, 'Pur-sang arabes', 'Le pur-sang arable est un cheval de selle qui ne passe pas inaperçu et on parle souvent de lui comme'),
(5, 'Etalons', 'Un étalon est un cheval mâle accepté pour se reproduire, généralement voué à la reproduction.'),
(6, 'Poulinières', 'Une poulinière est une jument destinée à la reproduction.');

-- --------------------------------------------------------

--
-- Structure de la table `typ_ven`
--

CREATE TABLE `typ_ven` (
  `VEN_ID` int(2) NOT NULL,
  `TYP_ID` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `vendeur`
--

CREATE TABLE `vendeur` (
  `CLI_ID` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE `vente` (
  `VEN_ID` int(2) NOT NULL,
  `CAT_CODE` char(6) NOT NULL,
  `LIE_ID` int(2) NOT NULL,
  `VEN_NOM` char(32) DEFAULT NULL,
  `VEN_DATEDEBUTVENTE` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`VEN_ID`, `CAT_CODE`, `LIE_ID`, `VEN_NOM`, `VEN_DATEDEBUTVENTE`) VALUES
(30917, 'ELVG', 1, 'Garibaldi Princess', '2017-03-09'),
(90217, 'XFEV', 1, 'Mixing braina', '2017-09-02'),
(210717, 'ETE', 1, 'Rapsberry Sailing', '2017-07-17'),
(210817, 'ETE', 2, 'Jelly Bay', '2017-08-17'),
(250217, 'XFEV', 2, 'Djezair Star', '2017-02-25');

-- --------------------------------------------------------

--
-- Structure de la table `ven_che`
--

CREATE TABLE `ven_che` (
  `CLI_ID` int(2) NOT NULL,
  `CHE_ID` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD PRIMARY KEY (`CLI_ID`);

--
-- Index pour la table `ach_cat`
--
ALTER TABLE `ach_cat`
  ADD PRIMARY KEY (`CLI_ID`,`CAT_CODE`),
  ADD KEY `I_FK_ACH_CAT_ACHETEUR` (`CLI_ID`),
  ADD KEY `I_FK_ACH_CAT_CATEGVENTE` (`CAT_CODE`);

--
-- Index pour la table `categvente`
--
ALTER TABLE `categvente`
  ADD PRIMARY KEY (`CAT_CODE`);

--
-- Index pour la table `cheval`
--
ALTER TABLE `cheval`
  ADD PRIMARY KEY (`CHE_ID`),
  ADD KEY `I_FK_CHEVAL_TYPECHEVAL` (`TYP_ID`);

--
-- Index pour la table `che_ref`
--
ALTER TABLE `che_ref`
  ADD PRIMARY KEY (`CHE_ID`,`CHE_ID_1`),
  ADD KEY `I_FK_CHE_REF_CHEVAL` (`CHE_ID`),
  ADD KEY `I_FK_CHE_REF_CHEVAL1` (`CHE_ID_1`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`CLI_ID`),
  ADD KEY `I_FK_CLIENT_PAYS` (`CODE`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`COM_ID`),
  ADD UNIQUE KEY `I_FK_COMPTE_CLIENT` (`CLI_ID`);

--
-- Index pour la table `com_rol`
--
ALTER TABLE `com_rol`
  ADD PRIMARY KEY (`COM_ID`,`ROL_CODE`),
  ADD KEY `I_FK_COM_ROL_COMPTE` (`COM_ID`),
  ADD KEY `I_FK_COM_ROL_ROLE` (`ROL_CODE`);

--
-- Index pour la table `courriel`
--
ALTER TABLE `courriel`
  ADD PRIMARY KEY (`COU_ID`),
  ADD KEY `I_FK_COURRIEL_VENTE` (`VEN_ID`);

--
-- Index pour la table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`COU_ID`);

--
-- Index pour la table `cou_pie`
--
ALTER TABLE `cou_pie`
  ADD PRIMARY KEY (`COU_ID`,`PIE_ID`),
  ADD KEY `I_FK_COU_PIE_COURRIEL` (`COU_ID`),
  ADD KEY `I_FK_COU_PIE_PIECEJOINTE` (`PIE_ID`);

--
-- Index pour la table `enchere`
--
ALTER TABLE `enchere`
  ADD PRIMARY KEY (`ENC_NUMERO`),
  ADD KEY `I_FK_ENCHERE_LOT` (`VEN_ID`,`LOT_ID`),
  ADD KEY `I_FK_ENCHERE_ACHETEUR` (`CLI_ID`);

--
-- Index pour la table `jockey`
--
ALTER TABLE `jockey`
  ADD PRIMARY KEY (`JOC_ID`);

--
-- Index pour la table `lieu`
--
ALTER TABLE `lieu`
  ADD PRIMARY KEY (`LIE_ID`);

--
-- Index pour la table `lot`
--
ALTER TABLE `lot`
  ADD PRIMARY KEY (`VEN_ID`,`LOT_ID`),
  ADD KEY `I_FK_LOT_VENTE` (`VEN_ID`),
  ADD KEY `I_FK_LOT_CHEVAL` (`CHE_ID`);

--
-- Index pour la table `participer`
--
ALTER TABLE `participer`
  ADD PRIMARY KEY (`CHE_ID`,`COU_ID`),
  ADD KEY `I_FK_PARTICIPER_CHEVAL` (`CHE_ID`),
  ADD KEY `I_FK_PARTICIPER_COURSE` (`COU_ID`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`CODE`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`PER_CODE`);

--
-- Index pour la table `piecejointe`
--
ALTER TABLE `piecejointe`
  ADD PRIMARY KEY (`PIE_ID`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ROL_CODE`);

--
-- Index pour la table `rol_per`
--
ALTER TABLE `rol_per`
  ADD PRIMARY KEY (`ROL_CODE`,`PER_CODE`),
  ADD KEY `I_FK_ROL_PER_ROLE` (`ROL_CODE`),
  ADD KEY `I_FK_ROL_PER_PERMISSIONS` (`PER_CODE`);

--
-- Index pour la table `typecheval`
--
ALTER TABLE `typecheval`
  ADD PRIMARY KEY (`TYP_ID`);

--
-- Index pour la table `typ_ven`
--
ALTER TABLE `typ_ven`
  ADD PRIMARY KEY (`VEN_ID`,`TYP_ID`),
  ADD KEY `I_FK_TYP_VEN_VENTE` (`VEN_ID`),
  ADD KEY `I_FK_TYP_VEN_TYPECHEVAL` (`TYP_ID`);

--
-- Index pour la table `vendeur`
--
ALTER TABLE `vendeur`
  ADD PRIMARY KEY (`CLI_ID`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`VEN_ID`),
  ADD KEY `I_FK_VENTE_CATEGVENTE` (`CAT_CODE`),
  ADD KEY `I_FK_VENTE_LIEU` (`LIE_ID`);

--
-- Index pour la table `ven_che`
--
ALTER TABLE `ven_che`
  ADD PRIMARY KEY (`CLI_ID`,`CHE_ID`),
  ADD KEY `I_FK_VEN_CHE_VENDEUR` (`CLI_ID`),
  ADD KEY `I_FK_VEN_CHE_CHEVAL` (`CHE_ID`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD CONSTRAINT `FK_ACHETEUR_CLIENT` FOREIGN KEY (`CLI_ID`) REFERENCES `client` (`CLI_ID`);

--
-- Contraintes pour la table `ach_cat`
--
ALTER TABLE `ach_cat`
  ADD CONSTRAINT `FK_ACH_CAT_ACHETEUR` FOREIGN KEY (`CLI_ID`) REFERENCES `acheteur` (`CLI_ID`),
  ADD CONSTRAINT `FK_ACH_CAT_CATEGVENTE` FOREIGN KEY (`CAT_CODE`) REFERENCES `categvente` (`CAT_CODE`);

--
-- Contraintes pour la table `cheval`
--
ALTER TABLE `cheval`
  ADD CONSTRAINT `FK_CHEVAL_TYPECHEVAL` FOREIGN KEY (`TYP_ID`) REFERENCES `typecheval` (`TYP_ID`);

--
-- Contraintes pour la table `che_ref`
--
ALTER TABLE `che_ref`
  ADD CONSTRAINT `FK_CHE_REF_CHEVAL` FOREIGN KEY (`CHE_ID`) REFERENCES `cheval` (`CHE_ID`),
  ADD CONSTRAINT `FK_CHE_REF_CHEVAL1` FOREIGN KEY (`CHE_ID_1`) REFERENCES `cheval` (`CHE_ID`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_CLIENT_PAYS` FOREIGN KEY (`CODE`) REFERENCES `pays` (`CODE`);

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `FK_COMPTE_CLIENT` FOREIGN KEY (`CLI_ID`) REFERENCES `client` (`CLI_ID`);

--
-- Contraintes pour la table `com_rol`
--
ALTER TABLE `com_rol`
  ADD CONSTRAINT `FK_COM_ROL_COMPTE` FOREIGN KEY (`COM_ID`) REFERENCES `compte` (`COM_ID`),
  ADD CONSTRAINT `FK_COM_ROL_ROLE` FOREIGN KEY (`ROL_CODE`) REFERENCES `role` (`ROL_CODE`);

--
-- Contraintes pour la table `courriel`
--
ALTER TABLE `courriel`
  ADD CONSTRAINT `FK_COURRIEL_VENTE` FOREIGN KEY (`VEN_ID`) REFERENCES `vente` (`VEN_ID`);

--
-- Contraintes pour la table `cou_pie`
--
ALTER TABLE `cou_pie`
  ADD CONSTRAINT `FK_COU_PIE_COURRIEL` FOREIGN KEY (`COU_ID`) REFERENCES `courriel` (`COU_ID`),
  ADD CONSTRAINT `FK_COU_PIE_PIECEJOINTE` FOREIGN KEY (`PIE_ID`) REFERENCES `piecejointe` (`PIE_ID`);

--
-- Contraintes pour la table `enchere`
--
ALTER TABLE `enchere`
  ADD CONSTRAINT `FK_ENCHERE_ACHETEUR` FOREIGN KEY (`CLI_ID`) REFERENCES `acheteur` (`CLI_ID`),
  ADD CONSTRAINT `FK_ENCHERE_LOT` FOREIGN KEY (`VEN_ID`,`LOT_ID`) REFERENCES `lot` (`VEN_ID`, `LOT_ID`);

--
-- Contraintes pour la table `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `FK_LOT_CHEVAL` FOREIGN KEY (`CHE_ID`) REFERENCES `cheval` (`CHE_ID`),
  ADD CONSTRAINT `FK_LOT_VENTE` FOREIGN KEY (`VEN_ID`) REFERENCES `vente` (`VEN_ID`);

--
-- Contraintes pour la table `participer`
--
ALTER TABLE `participer`
  ADD CONSTRAINT `FK_PARTICIPER_CHEVAL` FOREIGN KEY (`CHE_ID`) REFERENCES `cheval` (`CHE_ID`),
  ADD CONSTRAINT `FK_PARTICIPER_COURSE` FOREIGN KEY (`COU_ID`) REFERENCES `course` (`COU_ID`);

--
-- Contraintes pour la table `rol_per`
--
ALTER TABLE `rol_per`
  ADD CONSTRAINT `FK_ROL_PER_PERMISSIONS` FOREIGN KEY (`PER_CODE`) REFERENCES `permissions` (`PER_CODE`),
  ADD CONSTRAINT `FK_ROL_PER_ROLE` FOREIGN KEY (`ROL_CODE`) REFERENCES `role` (`ROL_CODE`);

--
-- Contraintes pour la table `typ_ven`
--
ALTER TABLE `typ_ven`
  ADD CONSTRAINT `FK_TYP_VEN_TYPECHEVAL` FOREIGN KEY (`TYP_ID`) REFERENCES `typecheval` (`TYP_ID`),
  ADD CONSTRAINT `FK_TYP_VEN_VENTE` FOREIGN KEY (`VEN_ID`) REFERENCES `vente` (`VEN_ID`);

--
-- Contraintes pour la table `vendeur`
--
ALTER TABLE `vendeur`
  ADD CONSTRAINT `FK_VENDEUR_CLIENT` FOREIGN KEY (`CLI_ID`) REFERENCES `client` (`CLI_ID`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `FK_VENTE_CATEGVENTE` FOREIGN KEY (`CAT_CODE`) REFERENCES `categvente` (`CAT_CODE`),
  ADD CONSTRAINT `FK_VENTE_LIEU` FOREIGN KEY (`LIE_ID`) REFERENCES `lieu` (`LIE_ID`);

--
-- Contraintes pour la table `ven_che`
--
ALTER TABLE `ven_che`
  ADD CONSTRAINT `FK_VEN_CHE_CHEVAL` FOREIGN KEY (`CHE_ID`) REFERENCES `cheval` (`CHE_ID`),
  ADD CONSTRAINT `FK_VEN_CHE_VENDEUR` FOREIGN KEY (`CLI_ID`) REFERENCES `vendeur` (`CLI_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
