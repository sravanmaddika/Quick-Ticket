/*
SQLyog Community Edition- MySQL GUI v6.07
Host - 5.5.52-log : Database - moviedb
*********************************************************************
Server version : 5.5.52-log
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `moviedb`;

USE `moviedb`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `email` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `mobile` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `movie_list` */

DROP TABLE IF EXISTS `movie_list`;

CREATE TABLE `movie_list` (
  `movie_name` varchar(30) NOT NULL DEFAULT '',
  `th_name` varchar(30) NOT NULL DEFAULT '',
  `location` varchar(30) NOT NULL DEFAULT '',
  `release_date` date DEFAULT NULL,
  `genre` varchar(30) DEFAULT NULL,
  `description` text,
  `movielogo` longblob,
  PRIMARY KEY (`movie_name`,`th_name`,`location`),
  KEY `th_name` (`th_name`,`location`),
  CONSTRAINT `movie_list_ibfk_1` FOREIGN KEY (`th_name`, `location`) REFERENCES `theatre_list` (`th_name`, `location`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `ticketnumber` varchar(200) NOT NULL,
  `cardnumber` varchar(200) DEFAULT NULL,
  `cvv` int(11) DEFAULT NULL,
  `totalamount` float DEFAULT NULL,
  `cardholdername` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ticketnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `shows` */

DROP TABLE IF EXISTS `shows`;

CREATE TABLE `shows` (
  `sh_date` date NOT NULL DEFAULT '0000-00-00',
  `sh_time` time NOT NULL DEFAULT '00:00:00',
  `movie_name` varchar(30) NOT NULL DEFAULT '',
  `th_name` varchar(30) NOT NULL DEFAULT '',
  `location` varchar(30) NOT NULL DEFAULT '',
  `screen_no` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sh_date`,`sh_time`,`movie_name`,`th_name`,`location`,`screen_no`),
  KEY `movie_name` (`movie_name`),
  KEY `th_name` (`th_name`,`location`),
  CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`movie_name`) REFERENCES `movie_list` (`movie_name`),
  CONSTRAINT `shows_ibfk_2` FOREIGN KEY (`th_name`, `location`) REFERENCES `theatre_list` (`th_name`, `location`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `theatre_list` */

DROP TABLE IF EXISTS `theatre_list`;

CREATE TABLE `theatre_list` (
  `th_name` varchar(30) NOT NULL DEFAULT '',
  `location` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`th_name`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tickets` */

DROP TABLE IF EXISTS `tickets`;

CREATE TABLE `tickets` (
  `th_name` varchar(30) NOT NULL DEFAULT '',
  `location` varchar(30) NOT NULL DEFAULT '',
  `sh_date` date NOT NULL DEFAULT '0000-00-00',
  `sh_time` time NOT NULL DEFAULT '00:00:00',
  `screen_no` int(11) NOT NULL DEFAULT '0',
  `seat_no` int(11) NOT NULL DEFAULT '0',
  `price` int(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `ticketid` varchar(200) NOT NULL,
  PRIMARY KEY (`th_name`,`location`,`sh_date`,`sh_time`,`screen_no`,`seat_no`,`ticketid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
