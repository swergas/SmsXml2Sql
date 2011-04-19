-- phpMyAdmin SQL Dump
-- version 3.1.2deb1ubuntu0.2
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Lun 12 Juillet 2010 à 17:12
-- Version du serveur: 5.0.75
-- Version de PHP: 5.2.6-3ubuntu4.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `testouille`
--

-- --------------------------------------------------------

--
-- Structure de la table `sms`
--

CREATE TABLE IF NOT EXISTS `sms` (
  `id` int(9) NOT NULL auto_increment,
  `a_protocol` int(6) default NULL,
  `a_address` varchar(50) NOT NULL default '',
  `a_date` bigint(15) NOT NULL default '0',
  `a_type` int(6) default NULL,
  `a_subject` varchar(200) default NULL,
  `a_body` text,
  `a_toa` int(6) default NULL,
  `a_sc_toa` int(6) default NULL,
  `a_service_center` varchar(50) default NULL,
  `a_read` int(6) default NULL,
  `a_status` int(6) default NULL,
  `a_locked` int(6) default NULL,
  `a_contact_name` varchar(50) default NULL,
  PRIMARY KEY  (`a_address`,`a_date`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1271 ;
