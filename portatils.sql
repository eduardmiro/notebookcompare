-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Temps de generació: 26-05-2013 a les 16:53:31
-- Versió del servidor: 5.5.29
-- Versió de PHP: 5.4.6-1ubuntu1.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de dades: `portatils`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Bolcant dades de la taula `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add site', 6, 'add_site'),
(17, 'Can change site', 6, 'change_site'),
(18, 'Can delete site', 6, 'delete_site'),
(19, 'Can add brand', 7, 'add_brand'),
(20, 'Can change brand', 7, 'change_brand'),
(21, 'Can delete brand', 7, 'delete_brand'),
(22, 'Can add component', 8, 'add_component'),
(23, 'Can change component', 8, 'change_component'),
(24, 'Can delete component', 8, 'delete_component'),
(25, 'Can add specification', 9, 'add_specification'),
(26, 'Can change specification', 9, 'change_specification'),
(27, 'Can delete specification', 9, 'delete_specification'),
(28, 'Can add model', 10, 'add_model'),
(29, 'Can change model', 10, 'change_model'),
(30, 'Can delete model', 10, 'delete_model'),
(31, 'Can add review', 11, 'add_review'),
(32, 'Can change review', 11, 'change_review'),
(33, 'Can delete review', 11, 'delete_review'),
(34, 'Can add log entry', 12, 'add_logentry'),
(35, 'Can change log entry', 12, 'change_logentry'),
(36, 'Can delete log entry', 12, 'delete_logentry');

-- --------------------------------------------------------

--
-- Estructura de la taula `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Bolcant dades de la taula `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'root', '', '', 'eduard@imolle.com', 'pbkdf2_sha256$10000$F21S2tG2M9d8$8TFPWxYlD3h/+ux44WaweykBumfvPFCPx9Bh3PIHAtw=', 1, 1, 1, '2013-05-26 14:11:02', '2013-05-26 13:52:10'),
(2, 'pepe', '', '', '', 'pbkdf2_sha256$10000$7NdQmFMt8sw9$nOnJbZuT9wbsFZysDG0wfYxcygM+PuYW8/DEIA5Jxjw=', 0, 1, 0, '2013-05-26 14:52:39', '2013-05-26 14:52:25');

-- --------------------------------------------------------

--
-- Estructura de la taula `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Bolcant dades de la taula `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'content type', 'contenttypes', 'contenttype'),
(5, 'session', 'sessions', 'session'),
(6, 'site', 'sites', 'site'),
(7, 'brand', 'notebookapp', 'brand'),
(8, 'component', 'notebookapp', 'component'),
(9, 'specification', 'notebookapp', 'specification'),
(10, 'model', 'notebookapp', 'model'),
(11, 'review', 'notebookapp', 'review'),
(12, 'log entry', 'admin', 'logentry');

-- --------------------------------------------------------

--
-- Estructura de la taula `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcant dades de la taula `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('b1198e41ac5693fb99419b5876734ba3', 'ZWUxMDA2NzY3MjZmZDA4YjA3NjlkY2I2N2M1Y2QwNDYxYzg2Nzc4MjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==\n', '2013-06-09 14:52:39');

-- --------------------------------------------------------

--
-- Estructura de la taula `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Estructura de la taula `notebookapp_brand`
--

CREATE TABLE IF NOT EXISTS `notebookapp_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `country` varchar(30) NOT NULL,
  `web` varchar(100) NOT NULL,
  `pictureurl` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notebookapp_brand_fbfc09f1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `notebookapp_brand`
--

INSERT INTO `notebookapp_brand` (`id`, `name`, `country`, `web`, `pictureurl`, `user_id`) VALUES
(1, 'Asus', 'Taiwan', 'www.asus.com', 'http://i.pcworld.fr/1242747-asus-logo.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `notebookapp_component`
--

CREATE TABLE IF NOT EXISTS `notebookapp_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notebookapp_component_fbfc09f1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `notebookapp_component`
--

INSERT INTO `notebookapp_component` (`id`, `name`, `user_id`) VALUES
(1, 'CPU', 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `notebookapp_model`
--

CREATE TABLE IF NOT EXISTS `notebookapp_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `price` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pictureurl` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notebookapp_model_74876276` (`brand_id`),
  KEY `notebookapp_model_fbfc09f1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `notebookapp_model`
--

INSERT INTO `notebookapp_model` (`id`, `name`, `date`, `price`, `brand_id`, `user_id`, `pictureurl`) VALUES
(1, 'z930-345', '2013-05-26 14:24:21', 800, 1, 1, 'http://www.notebookcheck.net/uploads/tx_nbc2/Z930.jpg');

-- --------------------------------------------------------

--
-- Estructura de la taula `notebookapp_model_specification`
--

CREATE TABLE IF NOT EXISTS `notebookapp_model_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL,
  `specification_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `model_id` (`model_id`,`specification_id`),
  KEY `notebookapp_model_specification_aff30766` (`model_id`),
  KEY `notebookapp_model_specification_58a66d96` (`specification_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Bolcant dades de la taula `notebookapp_model_specification`
--

INSERT INTO `notebookapp_model_specification` (`id`, `model_id`, `specification_id`) VALUES
(2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `notebookapp_review`
--

CREATE TABLE IF NOT EXISTS `notebookapp_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` smallint(5) unsigned NOT NULL,
  `comment` longtext,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `model_id` int(11) NOT NULL,
  `price_found` varchar(8) DEFAULT NULL,
  `shop_name` varchar(30) DEFAULT NULL,
  `shop_url` varchar(100) DEFAULT NULL,
  `shop_city` varchar(100) DEFAULT NULL,
  `shop_state` varchar(100) DEFAULT NULL,
  `shop_country` varchar(100) DEFAULT NULL,
  `shop_zip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notebookapp_review_fbfc09f1` (`user_id`),
  KEY `notebookapp_review_aff30766` (`model_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `notebookapp_review`
--

INSERT INTO `notebookapp_review` (`id`, `rating`, `comment`, `user_id`, `date`, `model_id`, `price_found`, `shop_name`, `shop_url`, `shop_city`, `shop_state`, `shop_country`, `shop_zip`) VALUES
(1, 3, 'Fantastic notebook!', 1, '2013-05-26', 1, '699', 'iMolle', 'www.imolle.com', 'Mollerussa', 'Catalonia', 'Spain', '25230');

-- --------------------------------------------------------

--
-- Estructura de la taula `notebookapp_specification`
--

CREATE TABLE IF NOT EXISTS `notebookapp_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `component_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notebookapp_specification_10fa268c` (`component_id`),
  KEY `notebookapp_specification_fbfc09f1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `notebookapp_specification`
--

INSERT INTO `notebookapp_specification` (`id`, `name`, `component_id`, `user_id`) VALUES
(1, 'intel core i5', 1, 1);

--
-- Restriccions per taules bolcades
--

--
-- Restriccions per la taula `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Restriccions per la taula `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Restriccions per la taula `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Restriccions per la taula `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Restriccions per la taula `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Restriccions per la taula `notebookapp_brand`
--
ALTER TABLE `notebookapp_brand`
  ADD CONSTRAINT `user_id_refs_id_1a499a75` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Restriccions per la taula `notebookapp_component`
--
ALTER TABLE `notebookapp_component`
  ADD CONSTRAINT `user_id_refs_id_4e1c6579` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Restriccions per la taula `notebookapp_model`
--
ALTER TABLE `notebookapp_model`
  ADD CONSTRAINT `user_id_refs_id_8b3aa76f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `brand_id_refs_id_c6ee7ec9` FOREIGN KEY (`brand_id`) REFERENCES `notebookapp_brand` (`id`);

--
-- Restriccions per la taula `notebookapp_model_specification`
--
ALTER TABLE `notebookapp_model_specification`
  ADD CONSTRAINT `model_id_refs_id_38c611bb` FOREIGN KEY (`model_id`) REFERENCES `notebookapp_model` (`id`),
  ADD CONSTRAINT `specification_id_refs_id_1fdf3efb` FOREIGN KEY (`specification_id`) REFERENCES `notebookapp_specification` (`id`);

--
-- Restriccions per la taula `notebookapp_review`
--
ALTER TABLE `notebookapp_review`
  ADD CONSTRAINT `user_id_refs_id_9fea152b` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `model_id_refs_id_c1d819d9` FOREIGN KEY (`model_id`) REFERENCES `notebookapp_model` (`id`);

--
-- Restriccions per la taula `notebookapp_specification`
--
ALTER TABLE `notebookapp_specification`
  ADD CONSTRAINT `user_id_refs_id_557359af` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `component_id_refs_id_e959739b` FOREIGN KEY (`component_id`) REFERENCES `notebookapp_component` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
