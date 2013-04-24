-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 10, 2013 at 11:18 AM
-- Server version: 5.5.29
-- PHP Version: 5.4.6-1ubuntu1.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `portatils`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
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
-- Table structure for table `auth_permission`
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
-- Dumping data for table `auth_permission`
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
(19, 'Can add country', 7, 'add_country'),
(20, 'Can change country', 7, 'change_country'),
(21, 'Can delete country', 7, 'delete_country'),
(22, 'Can add brand', 8, 'add_brand'),
(23, 'Can change brand', 8, 'change_brand'),
(24, 'Can delete brand', 8, 'delete_brand'),
(25, 'Can add component', 9, 'add_component'),
(26, 'Can change component', 9, 'change_component'),
(27, 'Can delete component', 9, 'delete_component'),
(28, 'Can add specification', 10, 'add_specification'),
(29, 'Can change specification', 10, 'change_specification'),
(30, 'Can delete specification', 10, 'delete_specification'),
(31, 'Can add model', 11, 'add_model'),
(32, 'Can change model', 11, 'change_model'),
(33, 'Can delete model', 11, 'delete_model'),
(34, 'Can add log entry', 12, 'add_logentry'),
(35, 'Can change log entry', 12, 'change_logentry'),
(36, 'Can delete log entry', 12, 'delete_logentry');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
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
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'root', '', '', 'root@root.com', 'pbkdf2_sha256$10000$9B5yg1opRbbM$5Na26VaGydLchCOtmVSN08Jm/IN0icS4KoQxGUfZl7I=', 1, 1, 1, '2013-04-03 10:17:38', '2013-04-03 10:06:37'),
(2, 'pepe', 'Pepito', 'grillo', '', 'pbkdf2_sha256$10000$wdhn0mfRg0jK$JwGW7SwBVNjuew0R4ISK56s2PmnZ9Xe53LBEEyNOGaw=', 0, 1, 0, '2013-04-08 09:36:26', '2013-04-05 09:46:35');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
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
-- Table structure for table `auth_user_user_permissions`
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
-- Table structure for table `django_admin_log`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2013-04-03 10:35:08', 1, 7, '1', 'Taiwan', 1, ''),
(2, '2013-04-03 10:35:13', 1, 7, '2', 'Spain', 1, ''),
(3, '2013-04-03 10:35:52', 1, 8, '1', 'ASUS', 1, ''),
(4, '2013-04-03 10:36:06', 1, 9, '1', 'CPU', 1, ''),
(5, '2013-04-03 10:36:12', 1, 9, '2', 'HDD', 1, ''),
(6, '2013-04-03 10:36:15', 1, 9, '3', 'ODD', 1, ''),
(7, '2013-04-03 10:36:18', 1, 9, '4', 'RAM', 1, ''),
(8, '2013-04-03 10:36:24', 1, 9, '5', 'GFX', 1, ''),
(9, '2013-04-03 10:36:32', 1, 9, '6', 'SCREEN', 1, ''),
(10, '2013-04-03 10:38:35', 1, 10, '5', 'iNTEL CORE i5', 1, ''),
(11, '2013-04-03 10:38:43', 1, 10, '6', 'iNTEL CORE i3', 1, ''),
(12, '2013-04-03 10:38:49', 1, 10, '7', '1TB', 1, ''),
(13, '2013-04-03 10:38:54', 1, 10, '8', '2TB', 1, ''),
(14, '2013-04-03 10:39:00', 1, 10, '9', '500GB', 1, ''),
(15, '2013-04-03 19:44:49', 1, 7, '3', 'Japan', 1, ''),
(16, '2013-04-03 19:44:58', 1, 8, '2', 'Toshiba', 1, ''),
(17, '2013-04-03 19:45:20', 1, 7, '4', 'United States of America', 1, ''),
(18, '2013-04-03 19:45:36', 1, 8, '3', 'eMachines', 1, ''),
(19, '2013-04-03 19:45:57', 1, 8, '4', 'Dell', 1, ''),
(20, '2013-04-03 19:46:16', 1, 8, '5', 'Sony', 1, ''),
(21, '2013-04-03 19:46:50', 1, 7, '5', 'China', 1, ''),
(22, '2013-04-03 19:46:59', 1, 8, '6', 'Lenovo', 1, ''),
(23, '2013-04-03 22:11:16', 1, 10, '10', 'HDD - 128GB - SSD', 1, ''),
(24, '2013-04-03 22:11:29', 1, 11, '1', 'z930-145', 1, ''),
(25, '2013-04-03 22:11:42', 1, 10, '11', 'HDD - 128GB', 1, ''),
(26, '2013-04-03 22:12:14', 1, 10, '11', 'HDD - 128GB', 3, ''),
(27, '2013-04-03 22:12:35', 1, 10, '12', 'SCREEN - 13.3''''', 1, ''),
(28, '2013-04-03 22:12:50', 1, 10, '13', 'ODD - NO', 1, ''),
(29, '2013-04-03 22:12:56', 1, 10, '14', 'ODD - DVD-RW', 1, ''),
(30, '2013-04-03 22:13:03', 1, 10, '15', 'RAM - 4GB DDR3', 1, ''),
(31, '2013-04-03 22:13:18', 1, 10, '16', 'GFX - INTEL 4000 ', 1, ''),
(32, '2013-04-03 22:13:50', 1, 11, '1', 'z930-145', 2, 'Changed specification.'),
(33, '2013-04-03 22:18:33', 1, 11, '2', 'K55ZV', 1, ''),
(34, '2013-04-04 08:23:36', 1, 11, '3', 'Z830', 1, ''),
(35, '2013-04-04 12:45:09', 1, 10, '12', 'SCREEN - 13.3', 2, 'Changed name.'),
(36, '2013-04-04 13:07:55', 1, 8, '3', 'eMachines', 2, 'Changed pictureurl.'),
(37, '2013-04-05 09:46:35', 1, 3, '2', 'pepe', 1, ''),
(38, '2013-04-05 09:46:50', 1, 3, '2', 'pepe', 2, 'Changed password, first_name and last_name.');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
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
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'content type', 'contenttypes', 'contenttype'),
(5, 'session', 'sessions', 'session'),
(6, 'site', 'sites', 'site'),
(7, 'country', 'notebookapp', 'country'),
(8, 'brand', 'notebookapp', 'brand'),
(9, 'component', 'notebookapp', 'component'),
(10, 'specification', 'notebookapp', 'specification'),
(11, 'model', 'notebookapp', 'model'),
(12, 'log entry', 'admin', 'logentry');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1332f813d9e36b6a393b491a590b1b84', 'YTRlMTA4MmM2Yzc3Y2I4N2FjYTAzMWY1YWY1ODI0NDg0MzY3ZDU5MjqAAn1xAS4=\n', '2013-04-19 21:15:21'),
('3ecdfbfbb985b93e113a5d8194d1b9bd', 'M2UwMWFlMDY5MzM3ODIwMWE4MTc2YjY0MjhmYTQzY2NhNzY1ODEzMzqAAn1xAShVCnRlc3Rjb29r\naWVxAlUGd29ya2VkcQNVDV9hdXRoX3VzZXJfaWSKAQJVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGph\nbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmR1Lg==\n', '2013-04-22 09:36:56');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `notebookapp_brand`
--

CREATE TABLE IF NOT EXISTS `notebookapp_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `country_id` int(11) NOT NULL,
  `web` longtext NOT NULL,
  `pictureurl` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notebookapp_brand_534dd89` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `notebookapp_brand`
--

INSERT INTO `notebookapp_brand` (`id`, `name`, `country_id`, `web`, `pictureurl`) VALUES
(1, 'ASUS', 1, 'http://WWW.ASUS.COM', 'http://www.areandroid.com/wp-content/uploads/2013/03/logo-asus.jpg'),
(2, 'Toshiba', 3, 'http://www.toshiba.es', 'http://t3.gstatic.com/images?q=tbn:ANd9GcRdike2C21mnRRJxiYdLcZvW2UNYzt6x7asJz3FMB9K-KnqrvPV'),
(3, 'eMachines', 4, 'http://www.acer.es', 'http://www.piezasportatil.com/public/images/emachine_logo.png'),
(4, 'Dell', 4, 'http://dell.es', ''),
(5, 'Sony', 3, 'http://sony.es', ''),
(6, 'Lenovo', 5, 'http://lenovo.es', '');

-- --------------------------------------------------------

--
-- Table structure for table `notebookapp_component`
--

CREATE TABLE IF NOT EXISTS `notebookapp_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `notebookapp_component`
--

INSERT INTO `notebookapp_component` (`id`, `name`) VALUES
(1, 'CPU'),
(2, 'HDD'),
(3, 'ODD'),
(4, 'RAM'),
(5, 'GFX'),
(6, 'SCREEN');

-- --------------------------------------------------------

--
-- Table structure for table `notebookapp_country`
--

CREATE TABLE IF NOT EXISTS `notebookapp_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `notebookapp_country`
--

INSERT INTO `notebookapp_country` (`id`, `name`) VALUES
(1, 'Taiwan'),
(2, 'Spain'),
(3, 'Japan'),
(4, 'United States of America'),
(5, 'China');

-- --------------------------------------------------------

--
-- Table structure for table `notebookapp_model`
--

CREATE TABLE IF NOT EXISTS `notebookapp_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `date` datetime NOT NULL,
  `price` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `useradd_id` int(11) NOT NULL,
  `pictureurl` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notebookapp_model_74876276` (`brand_id`),
  KEY `notebookapp_model_4f931a65` (`useradd_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `notebookapp_model`
--

INSERT INTO `notebookapp_model` (`id`, `name`, `date`, `price`, `brand_id`, `useradd_id`, `pictureurl`) VALUES
(1, 'z930', '2013-04-03 22:10:50', 900, 2, 1, 'http://www.ubergizmo.com/wp-content/uploads/2012/06/Toshiba-Portege-Z930.jpg'),
(2, 'K55ZV-195', '2013-04-03 22:18:31', 500, 1, 1, 'http://www.notebookcheck.net/uploads/pics/asus_k55_3_aperto.jpg'),
(3, 'Z830', '2010-04-04 08:22:25', 700, 2, 1, 'http://www.ubergizmo.com/wp-content/uploads/2011/09/toshiba-portege-z830-201.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `notebookapp_model_specification`
--

CREATE TABLE IF NOT EXISTS `notebookapp_model_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL,
  `specification_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `model_id` (`model_id`,`specification_id`),
  KEY `notebookapp_model_specification_aff30766` (`model_id`),
  KEY `notebookapp_model_specification_58a66d96` (`specification_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `notebookapp_model_specification`
--

INSERT INTO `notebookapp_model_specification` (`id`, `model_id`, `specification_id`) VALUES
(3, 1, 5),
(4, 1, 10),
(5, 1, 12),
(6, 1, 13),
(7, 1, 15),
(8, 1, 16),
(9, 2, 6),
(10, 2, 14),
(11, 3, 6),
(12, 3, 9),
(13, 3, 12),
(14, 3, 13),
(15, 3, 15),
(16, 3, 16);

-- --------------------------------------------------------

--
-- Table structure for table `notebookapp_specification`
--

CREATE TABLE IF NOT EXISTS `notebookapp_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `component_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notebookapp_specification_10fa268c` (`component_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `notebookapp_specification`
--

INSERT INTO `notebookapp_specification` (`id`, `name`, `component_id`) VALUES
(5, 'iNTEL CORE i5', 1),
(6, 'iNTEL CORE i3', 1),
(7, '1TB', 2),
(8, '2TB', 2),
(9, '500GB', 2),
(10, '128GB - SSD', 2),
(12, '13.3', 6),
(13, 'NO', 3),
(14, 'DVD-RW', 3),
(15, '4GB DDR3', 4),
(16, 'INTEL 4000 ', 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `notebookapp_brand`
--
ALTER TABLE `notebookapp_brand`
  ADD CONSTRAINT `country_id_refs_id_198c7860` FOREIGN KEY (`country_id`) REFERENCES `notebookapp_country` (`id`);

--
-- Constraints for table `notebookapp_model`
--
ALTER TABLE `notebookapp_model`
  ADD CONSTRAINT `brand_id_refs_id_c6ee7ec9` FOREIGN KEY (`brand_id`) REFERENCES `notebookapp_brand` (`id`),
  ADD CONSTRAINT `useradd_id_refs_id_8b3aa76f` FOREIGN KEY (`useradd_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `notebookapp_model_specification`
--
ALTER TABLE `notebookapp_model_specification`
  ADD CONSTRAINT `model_id_refs_id_38c611bb` FOREIGN KEY (`model_id`) REFERENCES `notebookapp_model` (`id`),
  ADD CONSTRAINT `specification_id_refs_id_1fdf3efb` FOREIGN KEY (`specification_id`) REFERENCES `notebookapp_specification` (`id`);

--
-- Constraints for table `notebookapp_specification`
--
ALTER TABLE `notebookapp_specification`
  ADD CONSTRAINT `component_id_refs_id_e959739b` FOREIGN KEY (`component_id`) REFERENCES `notebookapp_component` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
