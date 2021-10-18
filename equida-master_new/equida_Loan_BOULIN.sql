-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 18 oct. 2021 à 11:57
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

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

DROP TABLE IF EXISTS `acheteur`;
CREATE TABLE IF NOT EXISTS `acheteur` (
  `CLI_ID` int(2) NOT NULL,
  `CLI_FORMATION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CLI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `acheteur`
--

INSERT INTO `acheteur` (`CLI_ID`, `CLI_FORMATION`) VALUES
(1, NULL),
(3, NULL),
(6, NULL),
(7, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ach_cat`
--

DROP TABLE IF EXISTS `ach_cat`;
CREATE TABLE IF NOT EXISTS `ach_cat` (
  `CLI_ID` int(2) NOT NULL,
  `CAT_CODE` char(6) NOT NULL,
  PRIMARY KEY (`CLI_ID`,`CAT_CODE`),
  KEY `I_FK_ACH_CAT_ACHETEUR` (`CLI_ID`),
  KEY `I_FK_ACH_CAT_CATEGVENTE` (`CAT_CODE`)
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

DROP TABLE IF EXISTS `categvente`;
CREATE TABLE IF NOT EXISTS `categvente` (
  `CAT_CODE` char(6) NOT NULL,
  `CAT_LIBELLE` char(32) DEFAULT NULL,
  PRIMARY KEY (`CAT_CODE`)
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

DROP TABLE IF EXISTS `cheval`;
CREATE TABLE IF NOT EXISTS `cheval` (
  `CHE_ID` int(2) NOT NULL AUTO_INCREMENT,
  `TYP_ID` int(2) NOT NULL,
  `CHE_NOM` char(32) DEFAULT NULL,
  `CHE_SEXE` char(1) DEFAULT NULL,
  `CHE_SIRE` char(32) DEFAULT NULL,
  `CHE_DATENAISSANCE` char(32) DEFAULT NULL,
  `CHE_NOMIMAGE` varchar(200) DEFAULT NULL,
  `CHE_IDPERE` int(11) DEFAULT NULL,
  `CHE_IDMERE` int(11) DEFAULT NULL,
  PRIMARY KEY (`CHE_ID`),
  KEY `I_FK_CHEVAL_TYPECHEVAL` (`TYP_ID`),
  KEY `FK_CHEVAL_IDPERE` (`CHE_IDPERE`),
  KEY `FK_CHEVAL_IDMERE` (`CHE_IDMERE`)
) ENGINE=InnoDB AUTO_INCREMENT=958 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cheval`
--

INSERT INTO `cheval` (`CHE_ID`, `TYP_ID`, `CHE_NOM`, `CHE_SEXE`, `CHE_SIRE`, `CHE_DATENAISSANCE`, `CHE_NOMIMAGE`, `CHE_IDPERE`, `CHE_IDMERE`) VALUES
(23, 4, 'Starlight', 'F', '53 525 354 I', '16-04-2015', 'starlight.jpg', NULL, NULL),
(321, 1, 'Jack', 'M', '89 432 642 A', '13-07-2012', NULL, 954, 943),
(742, 6, 'Dior', 'F', '54 325 346 G', '20-02-2015', 'dior.jpg', NULL, 943),
(865, 3, 'Mambo', 'M', '65 352 604 F', '15-09-2016', NULL, 954, NULL),
(943, 4, 'Suzanna', 'F', '75 655 983 J', '22-01-2011', NULL, NULL, NULL),
(954, 2, 'Pepito', 'M', '85 425 092 N', '03-06-2005', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `CLI_ID` int(2) NOT NULL AUTO_INCREMENT,
  `CODE` char(3) NOT NULL,
  `CLI_TITRE` char(32) DEFAULT NULL,
  `CLI_NOM` char(32) DEFAULT NULL,
  `CLI_PRENOM` char(32) DEFAULT NULL,
  `CLI_RUE` char(50) DEFAULT NULL,
  `CLI_COPOS` char(32) DEFAULT NULL,
  `CLI_VILLE` char(50) DEFAULT NULL,
  `CLI_ADRESSEMESSAGERIE` char(50) DEFAULT NULL,
  PRIMARY KEY (`CLI_ID`),
  KEY `I_FK_CLIENT_PAYS` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `compte`;
CREATE TABLE IF NOT EXISTS `compte` (
  `COM_ID` int(2) NOT NULL AUTO_INCREMENT,
  `CLI_ID` int(2) DEFAULT NULL,
  `ROL_ID` int(11) DEFAULT NULL,
  `COM_LOGIN` char(32) DEFAULT NULL,
  `COM_MDP` char(32) DEFAULT NULL,
  PRIMARY KEY (`COM_ID`),
  UNIQUE KEY `I_FK_COMPTE_CLIENT` (`CLI_ID`),
  KEY `FK_COMPTE_ROLE` (`ROL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`COM_ID`, `CLI_ID`, `ROL_ID`, `COM_LOGIN`, `COM_MDP`) VALUES
(28, 1, NULL, 'cdeltour', 'cheval'),
(29, NULL, 1, 'joris', 'mpjojo');

-- --------------------------------------------------------

--
-- Structure de la table `courriel`
--

DROP TABLE IF EXISTS `courriel`;
CREATE TABLE IF NOT EXISTS `courriel` (
  `COU_ID` int(2) NOT NULL AUTO_INCREMENT,
  `VEN_ID` int(2) NOT NULL,
  `COU_DATE` char(50) DEFAULT NULL,
  `COU_OBJET` char(250) DEFAULT NULL,
  `COU_CORPS` char(250) DEFAULT NULL,
  PRIMARY KEY (`COU_ID`),
  KEY `I_FK_COURRIEL_VENTE` (`VEN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `COU_ID` int(2) NOT NULL AUTO_INCREMENT,
  `COU_NOM` char(32) DEFAULT NULL,
  `COU_LIEU` char(50) DEFAULT NULL,
  `COU_DATE` char(32) DEFAULT NULL,
  PRIMARY KEY (`COU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `course`
--

INSERT INTO `course` (`COU_ID`, `COU_NOM`, `COU_LIEU`, `COU_DATE`) VALUES
(1, 'Course du grand Lac', 'Toulouse', '22-10-2021'),
(2, 'Horse Brazil Race', 'Châteauroux', '22-12-2021'),
(3, 'Golder Hour Race', 'Paris', '01-01-2022'),
(4, 'La dernière des courses', ' Créteil', '05-02-2022'),
(5, 'Le ploton de l\'or', 'Saint Sebastien', '03-11-2022'),
(6, 'Le tour de Monaco', 'Monaco', '15-06-2022'),
(7, 'La course des millénaires', 'Louvigny', '25-07-2021');

-- --------------------------------------------------------

--
-- Structure de la table `cou_pie`
--

DROP TABLE IF EXISTS `cou_pie`;
CREATE TABLE IF NOT EXISTS `cou_pie` (
  `COU_ID` int(2) NOT NULL,
  `PIE_ID` int(2) NOT NULL,
  PRIMARY KEY (`COU_ID`,`PIE_ID`),
  KEY `I_FK_COU_PIE_COURRIEL` (`COU_ID`),
  KEY `I_FK_COU_PIE_PIECEJOINTE` (`PIE_ID`)
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

DROP TABLE IF EXISTS `enchere`;
CREATE TABLE IF NOT EXISTS `enchere` (
  `ENC_NUMERO` int(2) NOT NULL AUTO_INCREMENT,
  `LOT_ID` int(2) NOT NULL,
  `CLI_ID` int(2) NOT NULL,
  `ENC_MONTANT` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ENC_NUMERO`),
  KEY `I_FK_ENCHERE_LOT` (`LOT_ID`),
  KEY `I_FK_ENCHERE_ACHETEUR` (`CLI_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `enchere`
--

INSERT INTO `enchere` (`ENC_NUMERO`, `LOT_ID`, `CLI_ID`, `ENC_MONTANT`) VALUES
(1, 1, 1, '2459.00'),
(2, 1, 3, '2789.00'),
(3, 1, 1, '5000.00'),
(4, 1, 1, '7500.00'),
(5, 1, 1, '6500.00');

-- --------------------------------------------------------

--
-- Structure de la table `jockey`
--

DROP TABLE IF EXISTS `jockey`;
CREATE TABLE IF NOT EXISTS `jockey` (
  `JOC_ID` int(2) NOT NULL AUTO_INCREMENT,
  `JOC_NOM` char(32) DEFAULT NULL,
  `JOC_PRENOM` char(32) DEFAULT NULL,
  `JOC_DATENAISSANCE` char(32) DEFAULT NULL,
  `JOC_POIDS` int(2) DEFAULT NULL,
  PRIMARY KEY (`JOC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
CREATE TABLE IF NOT EXISTS `lieu` (
  `LIE_ID` int(2) NOT NULL AUTO_INCREMENT,
  `LIE_VILLE` char(50) DEFAULT NULL,
  `LIE_NBBOXES` int(5) DEFAULT NULL,
  `LIE_COMMENTAIRES` char(250) DEFAULT NULL,
  PRIMARY KEY (`LIE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `lot`;
CREATE TABLE IF NOT EXISTS `lot` (
  `LOT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `VEN_ID` int(2) NOT NULL,
  `CHE_ID` int(2) NOT NULL,
  `LOT_PRIXDEPART` int(6) DEFAULT NULL,
  PRIMARY KEY (`VEN_ID`,`LOT_ID`),
  UNIQUE KEY `LOT_ID` (`LOT_ID`),
  KEY `I_FK_LOT_VENTE` (`VEN_ID`),
  KEY `I_FK_LOT_CHEVAL` (`CHE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `lot`
--

INSERT INTO `lot` (`LOT_ID`, `VEN_ID`, `CHE_ID`, `LOT_PRIXDEPART`) VALUES
(1, 90217, 742, 7500),
(2, 90217, 321, 10999),
(3, 90217, 23, 6999),
(4, 90217, 865, 14000),
(5, 90217, 943, 8700),
(6, 90217, 954, 9900);

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

DROP TABLE IF EXISTS `participer`;
CREATE TABLE IF NOT EXISTS `participer` (
  `CHE_ID` int(2) NOT NULL,
  `COU_ID` int(2) NOT NULL,
  `PLACE` int(2) DEFAULT NULL,
  PRIMARY KEY (`CHE_ID`,`COU_ID`),
  KEY `I_FK_PARTICIPER_CHEVAL` (`CHE_ID`),
  KEY `I_FK_PARTICIPER_COURSE` (`COU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `CODE` char(3) NOT NULL,
  `NOM` char(50) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`CODE`, `NOM`) VALUES
('ENG', 'Angleterre'),
('FRA', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `piecejointe`
--

DROP TABLE IF EXISTS `piecejointe`;
CREATE TABLE IF NOT EXISTS `piecejointe` (
  `PIE_ID` int(2) NOT NULL AUTO_INCREMENT,
  `PIE_CHEMIN` char(32) DEFAULT NULL,
  `PIE_DESCRIPTION` char(100) DEFAULT NULL,
  PRIMARY KEY (`PIE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `ROL_CODE` int(2) NOT NULL AUTO_INCREMENT,
  `ROL_NOM` char(32) DEFAULT NULL,
  PRIMARY KEY (`ROL_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`ROL_CODE`, `ROL_NOM`) VALUES
(1, 'Salarie'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `typecheval`
--

DROP TABLE IF EXISTS `typecheval`;
CREATE TABLE IF NOT EXISTS `typecheval` (
  `TYP_ID` int(2) NOT NULL AUTO_INCREMENT,
  `TYP_LIBELLE` char(100) DEFAULT NULL,
  `TYP_DESCRIPTION` char(100) DEFAULT NULL,
  PRIMARY KEY (`TYP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `typecheval`
--

INSERT INTO `typecheval` (`TYP_ID`, `TYP_LIBELLE`, `TYP_DESCRIPTION`) VALUES
(1, 'Yearlings', 'Yearling est un anglicisme désignant un cheval pur-sang anglais, descendant du pur sang arabe.'),
(2, 'Pur-sang anglais', 'Le Pur-sang Anglais est la plus connue des races de chevaux à sang chaud. C\'est l\'une des races les'),
(3, 'Inédit', 'Les inédits sont les chevaux qui n\'ont jamais participé à une vente.'),
(4, 'Pur-sang arabe', 'Le pur-sang arable est un cheval de selle qui ne passe pas inaperçu et on parle souvent de lui comme'),
(5, 'Etalon', 'Un étalon est un cheval mâle accepté pour se reproduire, généralement voué à la reproduction.'),
(6, 'Poulinière', 'Une poulinière est une jument destinée à la reproduction.');

-- --------------------------------------------------------

--
-- Structure de la table `typ_ven`
--

DROP TABLE IF EXISTS `typ_ven`;
CREATE TABLE IF NOT EXISTS `typ_ven` (
  `VEN_ID` int(2) NOT NULL,
  `TYP_ID` int(2) NOT NULL,
  PRIMARY KEY (`VEN_ID`,`TYP_ID`),
  KEY `I_FK_TYP_VEN_VENTE` (`VEN_ID`),
  KEY `I_FK_TYP_VEN_TYPECHEVAL` (`TYP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `vendeur`
--

DROP TABLE IF EXISTS `vendeur`;
CREATE TABLE IF NOT EXISTS `vendeur` (
  `CLI_ID` int(2) NOT NULL,
  `CLI_CA` int(20) NOT NULL,
  PRIMARY KEY (`CLI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

DROP TABLE IF EXISTS `vente`;
CREATE TABLE IF NOT EXISTS `vente` (
  `VEN_ID` int(2) NOT NULL,
  `CAT_CODE` char(6) NOT NULL,
  `LIE_ID` int(2) NOT NULL,
  `VEN_NOM` char(32) DEFAULT NULL,
  `VEN_DATEDEBUTVENTE` char(50) DEFAULT NULL,
  PRIMARY KEY (`VEN_ID`),
  KEY `I_FK_VENTE_CATEGVENTE` (`CAT_CODE`),
  KEY `I_FK_VENTE_LIEU` (`LIE_ID`)
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

DROP TABLE IF EXISTS `ven_che`;
CREATE TABLE IF NOT EXISTS `ven_che` (
  `CLI_ID` int(2) NOT NULL,
  `CHE_ID` int(2) NOT NULL,
  PRIMARY KEY (`CLI_ID`,`CHE_ID`),
  KEY `I_FK_VEN_CHE_VENDEUR` (`CLI_ID`),
  KEY `I_FK_VEN_CHE_CHEVAL` (`CHE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD CONSTRAINT `FK_CHEVAL_IDMERE` FOREIGN KEY (`CHE_IDMERE`) REFERENCES `cheval` (`CHE_ID`),
  ADD CONSTRAINT `FK_CHEVAL_IDPERE` FOREIGN KEY (`CHE_IDPERE`) REFERENCES `cheval` (`CHE_ID`),
  ADD CONSTRAINT `FK_CHEVAL_TYPECHEVAL` FOREIGN KEY (`TYP_ID`) REFERENCES `typecheval` (`TYP_ID`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_CLIENT_PAYS` FOREIGN KEY (`CODE`) REFERENCES `pays` (`CODE`);

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `FK_COMPTE_CLIENT` FOREIGN KEY (`CLI_ID`) REFERENCES `client` (`CLI_ID`),
  ADD CONSTRAINT `FK_COMPTE_ROLE` FOREIGN KEY (`ROL_ID`) REFERENCES `role` (`ROL_CODE`);

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
  ADD CONSTRAINT `FK_ENCHERE_LOT` FOREIGN KEY (`LOT_ID`) REFERENCES `lot` (`LOT_ID`);

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
