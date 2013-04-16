-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 09, 2013 at 04:08 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `uLinked`
--

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `notificationID` int(11) NOT NULL AUTO_INCREMENT,
  `usersID` int(30) NOT NULL,
  `postID` int(30) NOT NULL,
  `type` varchar(8) NOT NULL,
  PRIMARY KEY (`notificationID`),
  KEY `fk_notifications_userID_to_users_usersID` (`usersID`),
  KEY `fk_notifications_postID_to_users_post_postID` (`postID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=82 ;

--
-- Dumping data for table `notifications`
--


-- --------------------------------------------------------

--
-- Table structure for table `number_of_notification`
--

CREATE TABLE IF NOT EXISTS `number_of_notification` (
  `usersID` int(11) NOT NULL,
  KEY `fk_NumOfNotif_usersID_to_users_usersID` (`usersID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `number_of_notification`
--


-- --------------------------------------------------------

--
-- Table structure for table `post_comment`
--

CREATE TABLE IF NOT EXISTS `post_comment` (
  `post_commentID` int(11) NOT NULL AUTO_INCREMENT,
  `postID` int(30) NOT NULL,
  `usersID` int(30) NOT NULL,
  `comment` text NOT NULL,
  `comment_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`post_commentID`),
  KEY `fk_post_comment_postID` (`postID`),
  KEY `fk_post_comment_usersID` (`usersID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `post_comment`
--


-- --------------------------------------------------------

--
-- Table structure for table `post_status`
--

CREATE TABLE IF NOT EXISTS `post_status` (
  `post_statusID` int(11) NOT NULL AUTO_INCREMENT,
  `postID` int(30) NOT NULL,
  `usersID` int(30) NOT NULL,
  `status` varchar(7) NOT NULL,
  PRIMARY KEY (`post_statusID`),
  KEY `fk_postID_post_status` (`postID`),
  KEY `fk_usersID_post_status` (`usersID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `post_status`
--


-- --------------------------------------------------------

--
-- Table structure for table `profile_pics`
--

CREATE TABLE IF NOT EXISTS `profile_pics` (
  `profile_picID` int(11) NOT NULL AUTO_INCREMENT,
  `usersID` int(30) NOT NULL,
  `pic_label` text NOT NULL,
  PRIMARY KEY (`profile_picID`),
  KEY `fk_usersID_pic` (`usersID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `profile_pics`
--


-- --------------------------------------------------------

--
-- Table structure for table `public_chat_msg`
--

CREATE TABLE IF NOT EXISTS `public_chat_msg` (
  `pcmID` int(11) NOT NULL AUTO_INCREMENT,
  `usersID` int(30) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`pcmID`),
  KEY `fk_pcm_usersID` (`usersID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `public_chat_msg`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `usersID` int(11) NOT NULL AUTO_INCREMENT,
  `email_add` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`usersID`),
  UNIQUE KEY `email_add` (`email_add`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--


-- --------------------------------------------------------

--
-- Table structure for table `users_info`
--

CREATE TABLE IF NOT EXISTS `users_info` (
  `users_info_ID` int(11) NOT NULL AUTO_INCREMENT,
  `usersID` int(20) DEFAULT NULL,
  `Fname` varchar(50) DEFAULT NULL,
  `Lname` varchar(50) DEFAULT NULL,
  `Nname` varchar(50) DEFAULT NULL,
  `Gender` varchar(7) DEFAULT NULL,
  `Birthdate` date DEFAULT NULL,
  `Age` int(20) NOT NULL,
  PRIMARY KEY (`users_info_ID`),
  KEY `fk_UsersID` (`usersID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users_info`
--


-- --------------------------------------------------------

--
-- Table structure for table `users_post`
--

CREATE TABLE IF NOT EXISTS `users_post` (
  `postID` int(11) NOT NULL AUTO_INCREMENT,
  `usersID` int(30) NOT NULL,
  `users_post` text NOT NULL,
  `date_posted` date NOT NULL,
  PRIMARY KEY (`postID`),
  KEY `fk_usersID_post` (`usersID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users_post`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_postID_to_users_post_postID` FOREIGN KEY (`postID`) REFERENCES `users_post` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_notifications_userID_to_users_usersID` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `number_of_notification`
--
ALTER TABLE `number_of_notification`
  ADD CONSTRAINT `fk_NumOfNotif_usersID_to_users_usersID` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_comment`
--
ALTER TABLE `post_comment`
  ADD CONSTRAINT `fk_post_comment` FOREIGN KEY (`postID`) REFERENCES `users_post` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_post_comment_usersID` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_status`
--
ALTER TABLE `post_status`
  ADD CONSTRAINT `fk_postID_post_status` FOREIGN KEY (`postID`) REFERENCES `users_post` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usersID_post_status` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile_pics`
--
ALTER TABLE `profile_pics`
  ADD CONSTRAINT `fk_usersID_pic` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `public_chat_msg`
--
ALTER TABLE `public_chat_msg`
  ADD CONSTRAINT `fk_pcm_usersID` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_info`
--
ALTER TABLE `users_info`
  ADD CONSTRAINT `fk_UsersID` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_post`
--
ALTER TABLE `users_post`
  ADD CONSTRAINT `fk_usersID_post` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`) ON DELETE CASCADE ON UPDATE CASCADE;
