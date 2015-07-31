-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 31, 2015 at 01:53 PM
-- Server version: 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `moodle`
--

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`),
  KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table saves information about an instance of mod_assign' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext,
  `commentformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assicomm_ass_ix` (`assignment`),
  KEY `mdl_assicomm_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Text feedback for submitted assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass2_ix` (`assignment`),
  KEY `mdl_assifile_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores info about the number of files submitted by a student' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou2_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext,
  `data2` longtext,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use2_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass2_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about submitted assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass_ix` (`assignment`),
  KEY `mdl_assifile_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about file submissions for assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_onlinetext`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assionli_ass_ix` (`assignment`),
  KEY `mdl_assionli_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about onlinetext submission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  KEY `mdl_assigrad_use_ix` (`userid`),
  KEY `mdl_assigrad_att_ix` (`attemptnumber`),
  KEY `mdl_assigrad_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading information about a single assignment submission.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_plugin_config`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) NOT NULL DEFAULT '',
  `subtype` varchar(28) NOT NULL DEFAULT '',
  `name` varchar(28) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  KEY `mdl_assiplugconf_nam_ix` (`name`),
  KEY `mdl_assiplugconf_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Config data for an instance of a plugin in an assignment.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_att_ix` (`attemptnumber`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about student interactions with' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  KEY `mdl_assiuserflag_use_ix` (`userid`),
  KEY `mdl_assiuserflag_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of flags that can be set for a single user in a single ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_mapping`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  KEY `mdl_assiusermapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Map an assignment specific id number to a user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_controllers`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `operation` varchar(20) NOT NULL DEFAULT 'backup',
  `type` varchar(10) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store the backup_controllers as they are used' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) NOT NULL DEFAULT '0',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store every course backup status' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_files_template`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_files_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `filearea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `info` longtext,
  `newcontextid` bigint(10) DEFAULT NULL,
  `newitemid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_backfiletemp_bacconcomf_ix` (`backupid`,`contextid`,`component`,`filearea`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store files along the backup process. Note this table isn' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_ids_template`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_ids_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `itemname` varchar(160) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `newitemid` bigint(10) NOT NULL DEFAULT '0',
  `parentitemid` bigint(10) DEFAULT NULL,
  `info` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backidstemp_baciteite_uix` (`backupid`,`itemname`,`itemid`),
  KEY `mdl_backidstemp_bacitepar_ix` (`backupid`,`itemname`,`parentitemid`),
  KEY `mdl_backidstemp_bacitenew_ix` (`backupid`,`itemname`,`newitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store all sort of ids along the backup process. Note this' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_logs`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_logs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store all the logs from backup and restore operations (by' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge`
--

CREATE TABLE IF NOT EXISTS `mdl_badge` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `image` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) NOT NULL DEFAULT '',
  `issuerurl` varchar(255) NOT NULL DEFAULT '',
  `issuercontact` varchar(255) DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext NOT NULL,
  `messagesubject` longtext NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badg_typ_ix` (`type`),
  KEY `mdl_badg_cou_ix` (`courseid`),
  KEY `mdl_badg_use_ix` (`usermodified`),
  KEY `mdl_badg_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines badge' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_backpack`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_backpack` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `backpackurl` varchar(255) NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgback_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines settings for connecting external backpack' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  KEY `mdl_badgcrit_bad_ix` (`badgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines criteria for issuing badges' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_met`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_met` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritmet_cri_ix` (`critid`),
  KEY `mdl_badgcritmet_use_ix` (`userid`),
  KEY `mdl_badgcritmet_iss_ix` (`issuedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines criteria that were met for an issued badge' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_param`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_param` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritpara_cri_ix` (`critid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines parameters for badges criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_external`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgexte_bac_ix` (`backpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Setting for external badges display' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_issued`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_issued` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  KEY `mdl_badgissu_bad_ix` (`badgeid`),
  KEY `mdl_badgissu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines issued badges' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_manual_award`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_manual_award` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Track manual award criteria for badges' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block`
--

CREATE TABLE IF NOT EXISTS `mdl_block` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='contains all installed blocks' AUTO_INCREMENT=40 ;

--
-- Dumping data for table `mdl_block`
--

INSERT INTO `mdl_block` (`id`, `name`, `version`, `cron`, `lastcron`, `visible`) VALUES
(1, 'activity_modules', 2013050100, 0, 0, 1),
(2, 'admin_bookmarks', 2013050100, 0, 0, 1),
(3, 'badges', 2013050101, 0, 0, 1),
(4, 'blog_menu', 2013050100, 0, 0, 1),
(5, 'blog_recent', 2013050100, 0, 0, 1),
(6, 'blog_tags', 2013050100, 0, 0, 1),
(7, 'calendar_month', 2013050100, 0, 0, 1),
(8, 'calendar_upcoming', 2013050100, 0, 0, 1),
(9, 'comments', 2013050100, 0, 0, 1),
(10, 'community', 2013050100, 0, 0, 1),
(11, 'completionstatus', 2013050100, 0, 0, 1),
(12, 'course_list', 2013050100, 0, 0, 1),
(13, 'course_overview', 2013050101, 0, 0, 1),
(14, 'course_summary', 2013050100, 0, 0, 1),
(15, 'feedback', 2013050100, 0, 0, 0),
(16, 'glossary_random', 2013050100, 0, 0, 1),
(17, 'html', 2013050100, 0, 0, 1),
(18, 'login', 2013050100, 0, 0, 1),
(19, 'mentees', 2013050100, 0, 0, 1),
(20, 'messages', 2013050100, 0, 0, 1),
(21, 'mnet_hosts', 2013050100, 0, 0, 1),
(22, 'myprofile', 2013050100, 0, 0, 1),
(23, 'navigation', 2013050100, 0, 0, 1),
(24, 'news_items', 2013050100, 0, 0, 1),
(25, 'online_users', 2013050100, 0, 0, 1),
(26, 'participants', 2013050100, 0, 0, 1),
(27, 'private_files', 2013050100, 0, 0, 1),
(28, 'quiz_results', 2013050100, 0, 0, 1),
(29, 'recent_activity', 2013050100, 0, 0, 1),
(30, 'rss_client', 2013050100, 300, 0, 1),
(31, 'search_forums', 2013050100, 0, 0, 1),
(32, 'section_links', 2013050100, 0, 0, 1),
(33, 'selfcompletion', 2013050100, 0, 0, 1),
(34, 'settings', 2013050100, 0, 0, 1),
(35, 'site_main_menu', 2013050100, 0, 0, 1),
(36, 'social_activities', 2013050100, 0, 0, 1),
(37, 'tag_flickr', 2013050100, 0, 0, 1),
(38, 'tag_youtube', 2013050100, 0, 0, 1),
(39, 'tags', 2013050100, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_community`
--

CREATE TABLE IF NOT EXISTS `mdl_block_community` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) NOT NULL DEFAULT '',
  `coursedescription` longtext,
  `courseurl` varchar(255) NOT NULL DEFAULT '',
  `imageurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Community block' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_block_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) DEFAULT NULL,
  `defaultregion` varchar(16) NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores block instances. The type of block this is' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `mdl_block_instances`
--

INSERT INTO `mdl_block_instances` (`id`, `blockname`, `parentcontextid`, `showinsubcontexts`, `pagetypepattern`, `subpagepattern`, `defaultregion`, `defaultweight`, `configdata`) VALUES
(1, 'site_main_menu', 2, 0, 'site-index', NULL, 'side-pre', 0, ''),
(2, 'course_summary', 2, 0, 'site-index', NULL, 'side-post', 0, ''),
(3, 'calendar_month', 2, 0, 'site-index', NULL, 'side-post', 1, ''),
(4, 'navigation', 1, 1, '*', NULL, 'side-pre', 0, ''),
(5, 'settings', 1, 1, '*', NULL, 'side-pre', 1, ''),
(6, 'admin_bookmarks', 1, 0, 'admin-*', NULL, 'side-pre', 0, ''),
(7, 'private_files', 1, 0, 'my-index', '2', 'side-post', 0, ''),
(8, 'online_users', 1, 0, 'my-index', '2', 'side-post', 1, ''),
(9, 'course_overview', 1, 0, 'my-index', '2', 'content', 0, ''),
(10, 'search_forums', 15, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(11, 'news_items', 15, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(12, 'calendar_upcoming', 15, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(13, 'recent_activity', 15, 0, 'course-view-*', NULL, 'side-post', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_positions`
--

CREATE TABLE IF NOT EXISTS `mdl_block_positions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) NOT NULL DEFAULT '',
  `subpage` varchar(16) NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the position of a sticky block_instance on a another ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_rss_client`
--

CREATE TABLE IF NOT EXISTS `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext NOT NULL,
  `preferredtitle` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Remote news feed information. Contains the news feed id, the' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_association`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_association` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Associations of blog entries with courses and module instanc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_external`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `url` longtext NOT NULL,
  `filtertags` varchar(255) DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='External blog links used for RSS copying of blog entries to ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book`
--

CREATE TABLE IF NOT EXISTS `mdl_book` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book_chapters`
--

CREATE TABLE IF NOT EXISTS `mdl_book_chapters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book_chapters' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_filters`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_filters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `rawtext` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping information about cached data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  `expiry` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Cache of time-sensitive flags' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_cache_flags`
--

INSERT INTO `mdl_cache_flags` (`id`, `flagtype`, `name`, `timemodified`, `value`, `expiry`) VALUES
(1, 'userpreferenceschanged', '2', 1438375528, '1', 1438382728),
(2, 'accesslib/dirtycontexts', '/1/3/15', 1438375563, '1', 1438382763);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_text`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_text` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `formattedtext` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachtext_md5_ix` (`md5key`),
  KEY `mdl_cachtext_tim_ix` (`timemodified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='For storing temporary copies of processed texts' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mdl_cache_text`
--

INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(1, '4351d00a1a0428201e17b7a595a0c95a', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1438375362),
(2, '7088784e04c075cc90016a72cf938cb2', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1438375383),
(3, '8d6d3d12a562c2bbec012713441740de', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1438375854),
(4, '095c8653214c00bf83ca89c7eb23e6eb', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1438375446),
(5, 'aea93396646cd03d24184af38ff8c3a2', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1438375564);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `captype` varchar(50) NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines all capabilities' AUTO_INCREMENT=500 ;

--
-- Dumping data for table `mdl_capabilities`
--

INSERT INTO `mdl_capabilities` (`id`, `name`, `captype`, `contextlevel`, `component`, `riskbitmask`) VALUES
(1, 'moodle/site:config', 'write', 10, 'moodle', 62),
(2, 'moodle/site:readallmessages', 'read', 10, 'moodle', 8),
(3, 'moodle/site:sendmessage', 'write', 10, 'moodle', 16),
(4, 'moodle/site:approvecourse', 'write', 10, 'moodle', 4),
(5, 'moodle/backup:backupcourse', 'write', 50, 'moodle', 28),
(6, 'moodle/backup:backupsection', 'write', 50, 'moodle', 28),
(7, 'moodle/backup:backupactivity', 'write', 70, 'moodle', 28),
(8, 'moodle/backup:backuptargethub', 'write', 50, 'moodle', 28),
(9, 'moodle/backup:backuptargetimport', 'write', 50, 'moodle', 28),
(10, 'moodle/backup:downloadfile', 'write', 50, 'moodle', 28),
(11, 'moodle/backup:configure', 'write', 50, 'moodle', 28),
(12, 'moodle/backup:userinfo', 'read', 50, 'moodle', 8),
(13, 'moodle/backup:anonymise', 'read', 50, 'moodle', 8),
(14, 'moodle/restore:restorecourse', 'write', 50, 'moodle', 28),
(15, 'moodle/restore:restoresection', 'write', 50, 'moodle', 28),
(16, 'moodle/restore:restoreactivity', 'write', 50, 'moodle', 28),
(17, 'moodle/restore:viewautomatedfilearea', 'write', 50, 'moodle', 28),
(18, 'moodle/restore:restoretargethub', 'write', 50, 'moodle', 28),
(19, 'moodle/restore:restoretargetimport', 'write', 50, 'moodle', 28),
(20, 'moodle/restore:uploadfile', 'write', 50, 'moodle', 28),
(21, 'moodle/restore:configure', 'write', 50, 'moodle', 28),
(22, 'moodle/restore:rolldates', 'write', 50, 'moodle', 0),
(23, 'moodle/restore:userinfo', 'write', 50, 'moodle', 30),
(24, 'moodle/restore:createuser', 'write', 10, 'moodle', 24),
(25, 'moodle/site:manageblocks', 'write', 80, 'moodle', 20),
(26, 'moodle/site:accessallgroups', 'read', 50, 'moodle', 0),
(27, 'moodle/site:viewfullnames', 'read', 50, 'moodle', 0),
(28, 'moodle/site:viewuseridentity', 'read', 50, 'moodle', 0),
(29, 'moodle/site:viewreports', 'read', 50, 'moodle', 8),
(30, 'moodle/site:trustcontent', 'write', 50, 'moodle', 4),
(31, 'moodle/site:uploadusers', 'write', 10, 'moodle', 24),
(32, 'moodle/filter:manage', 'write', 50, 'moodle', 0),
(33, 'moodle/user:create', 'write', 10, 'moodle', 24),
(34, 'moodle/user:delete', 'write', 10, 'moodle', 8),
(35, 'moodle/user:update', 'write', 10, 'moodle', 24),
(36, 'moodle/user:viewdetails', 'read', 50, 'moodle', 0),
(37, 'moodle/user:viewalldetails', 'read', 30, 'moodle', 8),
(38, 'moodle/user:viewhiddendetails', 'read', 50, 'moodle', 8),
(39, 'moodle/user:loginas', 'write', 50, 'moodle', 30),
(40, 'moodle/user:managesyspages', 'write', 10, 'moodle', 0),
(41, 'moodle/user:manageblocks', 'write', 30, 'moodle', 0),
(42, 'moodle/user:manageownblocks', 'write', 10, 'moodle', 0),
(43, 'moodle/user:manageownfiles', 'write', 10, 'moodle', 0),
(44, 'moodle/user:ignoreuserquota', 'write', 10, 'moodle', 0),
(45, 'moodle/my:configsyspages', 'write', 10, 'moodle', 0),
(46, 'moodle/role:assign', 'write', 50, 'moodle', 28),
(47, 'moodle/role:review', 'read', 50, 'moodle', 8),
(48, 'moodle/role:override', 'write', 50, 'moodle', 28),
(49, 'moodle/role:safeoverride', 'write', 50, 'moodle', 16),
(50, 'moodle/role:manage', 'write', 10, 'moodle', 28),
(51, 'moodle/role:switchroles', 'read', 50, 'moodle', 12),
(52, 'moodle/category:manage', 'write', 40, 'moodle', 4),
(53, 'moodle/category:viewhiddencategories', 'read', 40, 'moodle', 0),
(54, 'moodle/cohort:manage', 'write', 40, 'moodle', 0),
(55, 'moodle/cohort:assign', 'write', 40, 'moodle', 0),
(56, 'moodle/cohort:view', 'read', 50, 'moodle', 0),
(57, 'moodle/course:create', 'write', 40, 'moodle', 4),
(58, 'moodle/course:request', 'write', 10, 'moodle', 0),
(59, 'moodle/course:delete', 'write', 50, 'moodle', 32),
(60, 'moodle/course:update', 'write', 50, 'moodle', 4),
(61, 'moodle/course:view', 'read', 50, 'moodle', 0),
(62, 'moodle/course:enrolreview', 'read', 50, 'moodle', 8),
(63, 'moodle/course:enrolconfig', 'write', 50, 'moodle', 8),
(64, 'moodle/course:bulkmessaging', 'write', 50, 'moodle', 16),
(65, 'moodle/course:viewhiddenuserfields', 'read', 50, 'moodle', 8),
(66, 'moodle/course:viewhiddencourses', 'read', 50, 'moodle', 0),
(67, 'moodle/course:visibility', 'write', 50, 'moodle', 0),
(68, 'moodle/course:managefiles', 'write', 50, 'moodle', 4),
(69, 'moodle/course:ignorefilesizelimits', 'write', 50, 'moodle', 0),
(70, 'moodle/course:manageactivities', 'write', 70, 'moodle', 4),
(71, 'moodle/course:activityvisibility', 'write', 70, 'moodle', 0),
(72, 'moodle/course:viewhiddenactivities', 'write', 70, 'moodle', 0),
(73, 'moodle/course:viewparticipants', 'read', 50, 'moodle', 0),
(74, 'moodle/course:changefullname', 'write', 50, 'moodle', 4),
(75, 'moodle/course:changeshortname', 'write', 50, 'moodle', 4),
(76, 'moodle/course:changeidnumber', 'write', 50, 'moodle', 4),
(77, 'moodle/course:changecategory', 'write', 50, 'moodle', 4),
(78, 'moodle/course:changesummary', 'write', 50, 'moodle', 4),
(79, 'moodle/site:viewparticipants', 'read', 10, 'moodle', 0),
(80, 'moodle/course:isincompletionreports', 'read', 50, 'moodle', 0),
(81, 'moodle/course:viewscales', 'read', 50, 'moodle', 0),
(82, 'moodle/course:managescales', 'write', 50, 'moodle', 0),
(83, 'moodle/course:managegroups', 'write', 50, 'moodle', 0),
(84, 'moodle/course:reset', 'write', 50, 'moodle', 32),
(85, 'moodle/course:viewsuspendedusers', 'read', 10, 'moodle', 0),
(86, 'moodle/blog:view', 'read', 10, 'moodle', 0),
(87, 'moodle/blog:search', 'read', 10, 'moodle', 0),
(88, 'moodle/blog:viewdrafts', 'read', 10, 'moodle', 8),
(89, 'moodle/blog:create', 'write', 10, 'moodle', 16),
(90, 'moodle/blog:manageentries', 'write', 10, 'moodle', 16),
(91, 'moodle/blog:manageexternal', 'write', 10, 'moodle', 16),
(92, 'moodle/blog:associatecourse', 'write', 50, 'moodle', 0),
(93, 'moodle/blog:associatemodule', 'write', 70, 'moodle', 0),
(94, 'moodle/calendar:manageownentries', 'write', 50, 'moodle', 16),
(95, 'moodle/calendar:managegroupentries', 'write', 50, 'moodle', 16),
(96, 'moodle/calendar:manageentries', 'write', 50, 'moodle', 16),
(97, 'moodle/user:editprofile', 'write', 30, 'moodle', 24),
(98, 'moodle/user:editownprofile', 'write', 10, 'moodle', 16),
(99, 'moodle/user:changeownpassword', 'write', 10, 'moodle', 0),
(100, 'moodle/user:readuserposts', 'read', 30, 'moodle', 0),
(101, 'moodle/user:readuserblogs', 'read', 30, 'moodle', 0),
(102, 'moodle/user:viewuseractivitiesreport', 'read', 30, 'moodle', 8),
(103, 'moodle/user:editmessageprofile', 'write', 30, 'moodle', 16),
(104, 'moodle/user:editownmessageprofile', 'write', 10, 'moodle', 0),
(105, 'moodle/question:managecategory', 'write', 50, 'moodle', 20),
(106, 'moodle/question:add', 'write', 50, 'moodle', 20),
(107, 'moodle/question:editmine', 'write', 50, 'moodle', 20),
(108, 'moodle/question:editall', 'write', 50, 'moodle', 20),
(109, 'moodle/question:viewmine', 'read', 50, 'moodle', 0),
(110, 'moodle/question:viewall', 'read', 50, 'moodle', 0),
(111, 'moodle/question:usemine', 'read', 50, 'moodle', 0),
(112, 'moodle/question:useall', 'read', 50, 'moodle', 0),
(113, 'moodle/question:movemine', 'write', 50, 'moodle', 0),
(114, 'moodle/question:moveall', 'write', 50, 'moodle', 0),
(115, 'moodle/question:config', 'write', 10, 'moodle', 2),
(116, 'moodle/question:flag', 'write', 50, 'moodle', 0),
(117, 'moodle/site:doclinks', 'read', 10, 'moodle', 0),
(118, 'moodle/course:sectionvisibility', 'write', 50, 'moodle', 0),
(119, 'moodle/course:useremail', 'write', 50, 'moodle', 0),
(120, 'moodle/course:viewhiddensections', 'write', 50, 'moodle', 0),
(121, 'moodle/course:setcurrentsection', 'write', 50, 'moodle', 0),
(122, 'moodle/course:movesections', 'write', 50, 'moodle', 0),
(123, 'moodle/site:mnetlogintoremote', 'read', 10, 'moodle', 0),
(124, 'moodle/grade:viewall', 'read', 50, 'moodle', 8),
(125, 'moodle/grade:view', 'read', 50, 'moodle', 0),
(126, 'moodle/grade:viewhidden', 'read', 50, 'moodle', 8),
(127, 'moodle/grade:import', 'write', 50, 'moodle', 12),
(128, 'moodle/grade:export', 'read', 50, 'moodle', 8),
(129, 'moodle/grade:manage', 'write', 50, 'moodle', 12),
(130, 'moodle/grade:edit', 'write', 50, 'moodle', 12),
(131, 'moodle/grade:managegradingforms', 'write', 50, 'moodle', 12),
(132, 'moodle/grade:sharegradingforms', 'write', 10, 'moodle', 4),
(133, 'moodle/grade:managesharedforms', 'write', 10, 'moodle', 4),
(134, 'moodle/grade:manageoutcomes', 'write', 50, 'moodle', 0),
(135, 'moodle/grade:manageletters', 'write', 50, 'moodle', 0),
(136, 'moodle/grade:hide', 'write', 50, 'moodle', 0),
(137, 'moodle/grade:lock', 'write', 50, 'moodle', 0),
(138, 'moodle/grade:unlock', 'write', 50, 'moodle', 0),
(139, 'moodle/my:manageblocks', 'write', 10, 'moodle', 0),
(140, 'moodle/notes:view', 'read', 50, 'moodle', 0),
(141, 'moodle/notes:manage', 'write', 50, 'moodle', 16),
(142, 'moodle/tag:manage', 'write', 10, 'moodle', 16),
(143, 'moodle/tag:create', 'write', 10, 'moodle', 16),
(144, 'moodle/tag:edit', 'write', 10, 'moodle', 16),
(145, 'moodle/tag:flag', 'write', 10, 'moodle', 16),
(146, 'moodle/tag:editblocks', 'write', 10, 'moodle', 0),
(147, 'moodle/block:view', 'read', 80, 'moodle', 0),
(148, 'moodle/block:edit', 'write', 80, 'moodle', 20),
(149, 'moodle/portfolio:export', 'read', 10, 'moodle', 0),
(150, 'moodle/comment:view', 'read', 50, 'moodle', 0),
(151, 'moodle/comment:post', 'write', 50, 'moodle', 24),
(152, 'moodle/comment:delete', 'write', 50, 'moodle', 32),
(153, 'moodle/webservice:createtoken', 'write', 10, 'moodle', 62),
(154, 'moodle/webservice:createmobiletoken', 'write', 10, 'moodle', 24),
(155, 'moodle/rating:view', 'read', 50, 'moodle', 0),
(156, 'moodle/rating:viewany', 'read', 50, 'moodle', 8),
(157, 'moodle/rating:viewall', 'read', 50, 'moodle', 8),
(158, 'moodle/rating:rate', 'write', 50, 'moodle', 0),
(159, 'moodle/course:publish', 'write', 10, 'moodle', 24),
(160, 'moodle/course:markcomplete', 'write', 50, 'moodle', 0),
(161, 'moodle/community:add', 'write', 10, 'moodle', 0),
(162, 'moodle/community:download', 'write', 10, 'moodle', 0),
(163, 'moodle/badges:manageglobalsettings', 'write', 10, 'moodle', 34),
(164, 'moodle/badges:viewbadges', 'read', 50, 'moodle', 0),
(165, 'moodle/badges:manageownbadges', 'write', 30, 'moodle', 0),
(166, 'moodle/badges:viewotherbadges', 'read', 30, 'moodle', 0),
(167, 'moodle/badges:earnbadge', 'write', 50, 'moodle', 0),
(168, 'moodle/badges:createbadge', 'write', 50, 'moodle', 16),
(169, 'moodle/badges:deletebadge', 'write', 50, 'moodle', 32),
(170, 'moodle/badges:configuredetails', 'write', 50, 'moodle', 16),
(171, 'moodle/badges:configurecriteria', 'write', 50, 'moodle', 0),
(172, 'moodle/badges:configuremessages', 'write', 50, 'moodle', 16),
(173, 'moodle/badges:awardbadge', 'write', 50, 'moodle', 16),
(174, 'moodle/badges:viewawarded', 'read', 50, 'moodle', 8),
(175, 'mod/assign:view', 'read', 70, 'mod_assign', 0),
(176, 'mod/assign:submit', 'write', 70, 'mod_assign', 0),
(177, 'mod/assign:grade', 'write', 70, 'mod_assign', 4),
(178, 'mod/assign:exportownsubmission', 'read', 70, 'mod_assign', 0),
(179, 'mod/assign:addinstance', 'write', 50, 'mod_assign', 4),
(180, 'mod/assign:grantextension', 'write', 70, 'mod_assign', 0),
(181, 'mod/assign:revealidentities', 'write', 70, 'mod_assign', 0),
(182, 'mod/assignment:view', 'read', 70, 'mod_assignment', 0),
(183, 'mod/assignment:addinstance', 'write', 50, 'mod_assignment', 4),
(184, 'mod/assignment:submit', 'write', 70, 'mod_assignment', 0),
(185, 'mod/assignment:grade', 'write', 70, 'mod_assignment', 4),
(186, 'mod/assignment:exportownsubmission', 'read', 70, 'mod_assignment', 0),
(187, 'mod/book:addinstance', 'write', 50, 'mod_book', 4),
(188, 'mod/book:read', 'read', 70, 'mod_book', 0),
(189, 'mod/book:viewhiddenchapters', 'read', 70, 'mod_book', 0),
(190, 'mod/book:edit', 'write', 70, 'mod_book', 4),
(191, 'mod/chat:addinstance', 'write', 50, 'mod_chat', 4),
(192, 'mod/chat:chat', 'write', 70, 'mod_chat', 16),
(193, 'mod/chat:readlog', 'read', 70, 'mod_chat', 0),
(194, 'mod/chat:deletelog', 'write', 70, 'mod_chat', 0),
(195, 'mod/chat:exportparticipatedsession', 'read', 70, 'mod_chat', 8),
(196, 'mod/chat:exportsession', 'read', 70, 'mod_chat', 8),
(197, 'mod/choice:addinstance', 'write', 50, 'mod_choice', 4),
(198, 'mod/choice:choose', 'write', 70, 'mod_choice', 0),
(199, 'mod/choice:readresponses', 'read', 70, 'mod_choice', 0),
(200, 'mod/choice:deleteresponses', 'write', 70, 'mod_choice', 0),
(201, 'mod/choice:downloadresponses', 'read', 70, 'mod_choice', 0),
(202, 'mod/data:addinstance', 'write', 50, 'mod_data', 4),
(203, 'mod/data:viewentry', 'read', 70, 'mod_data', 0),
(204, 'mod/data:writeentry', 'write', 70, 'mod_data', 16),
(205, 'mod/data:comment', 'write', 70, 'mod_data', 16),
(206, 'mod/data:rate', 'write', 70, 'mod_data', 0),
(207, 'mod/data:viewrating', 'read', 70, 'mod_data', 0),
(208, 'mod/data:viewanyrating', 'read', 70, 'mod_data', 8),
(209, 'mod/data:viewallratings', 'read', 70, 'mod_data', 8),
(210, 'mod/data:approve', 'write', 70, 'mod_data', 16),
(211, 'mod/data:manageentries', 'write', 70, 'mod_data', 16),
(212, 'mod/data:managecomments', 'write', 70, 'mod_data', 16),
(213, 'mod/data:managetemplates', 'write', 70, 'mod_data', 20),
(214, 'mod/data:viewalluserpresets', 'read', 70, 'mod_data', 0),
(215, 'mod/data:manageuserpresets', 'write', 70, 'mod_data', 20),
(216, 'mod/data:exportentry', 'read', 70, 'mod_data', 8),
(217, 'mod/data:exportownentry', 'read', 70, 'mod_data', 0),
(218, 'mod/data:exportallentries', 'read', 70, 'mod_data', 8),
(219, 'mod/data:exportuserinfo', 'read', 70, 'mod_data', 8),
(220, 'mod/feedback:addinstance', 'write', 50, 'mod_feedback', 4),
(221, 'mod/feedback:view', 'read', 70, 'mod_feedback', 0),
(222, 'mod/feedback:complete', 'write', 70, 'mod_feedback', 16),
(223, 'mod/feedback:viewanalysepage', 'read', 70, 'mod_feedback', 8),
(224, 'mod/feedback:deletesubmissions', 'write', 70, 'mod_feedback', 0),
(225, 'mod/feedback:mapcourse', 'write', 70, 'mod_feedback', 0),
(226, 'mod/feedback:edititems', 'write', 70, 'mod_feedback', 20),
(227, 'mod/feedback:createprivatetemplate', 'write', 70, 'mod_feedback', 16),
(228, 'mod/feedback:createpublictemplate', 'write', 70, 'mod_feedback', 16),
(229, 'mod/feedback:deletetemplate', 'write', 70, 'mod_feedback', 0),
(230, 'mod/feedback:viewreports', 'read', 70, 'mod_feedback', 8),
(231, 'mod/feedback:receivemail', 'read', 70, 'mod_feedback', 8),
(232, 'mod/folder:addinstance', 'write', 50, 'mod_folder', 4),
(233, 'mod/folder:view', 'read', 70, 'mod_folder', 0),
(234, 'mod/folder:managefiles', 'write', 70, 'mod_folder', 16),
(235, 'mod/forum:addinstance', 'write', 50, 'mod_forum', 4),
(236, 'mod/forum:viewdiscussion', 'read', 70, 'mod_forum', 0),
(237, 'mod/forum:viewhiddentimedposts', 'read', 70, 'mod_forum', 0),
(238, 'mod/forum:startdiscussion', 'write', 70, 'mod_forum', 16),
(239, 'mod/forum:replypost', 'write', 70, 'mod_forum', 16),
(240, 'mod/forum:addnews', 'write', 70, 'mod_forum', 16),
(241, 'mod/forum:replynews', 'write', 70, 'mod_forum', 16),
(242, 'mod/forum:viewrating', 'read', 70, 'mod_forum', 0),
(243, 'mod/forum:viewanyrating', 'read', 70, 'mod_forum', 8),
(244, 'mod/forum:viewallratings', 'read', 70, 'mod_forum', 8),
(245, 'mod/forum:rate', 'write', 70, 'mod_forum', 0),
(246, 'mod/forum:createattachment', 'write', 70, 'mod_forum', 16),
(247, 'mod/forum:deleteownpost', 'read', 70, 'mod_forum', 0),
(248, 'mod/forum:deleteanypost', 'read', 70, 'mod_forum', 0),
(249, 'mod/forum:splitdiscussions', 'read', 70, 'mod_forum', 0),
(250, 'mod/forum:movediscussions', 'read', 70, 'mod_forum', 0),
(251, 'mod/forum:editanypost', 'write', 70, 'mod_forum', 16),
(252, 'mod/forum:viewqandawithoutposting', 'read', 70, 'mod_forum', 0),
(253, 'mod/forum:viewsubscribers', 'read', 70, 'mod_forum', 0),
(254, 'mod/forum:managesubscriptions', 'read', 70, 'mod_forum', 16),
(255, 'mod/forum:postwithoutthrottling', 'write', 70, 'mod_forum', 16),
(256, 'mod/forum:exportdiscussion', 'read', 70, 'mod_forum', 8),
(257, 'mod/forum:exportpost', 'read', 70, 'mod_forum', 8),
(258, 'mod/forum:exportownpost', 'read', 70, 'mod_forum', 8),
(259, 'mod/forum:addquestion', 'write', 70, 'mod_forum', 16),
(260, 'mod/forum:allowforcesubscribe', 'read', 70, 'mod_forum', 0),
(261, 'mod/glossary:addinstance', 'write', 50, 'mod_glossary', 4),
(262, 'mod/glossary:view', 'read', 70, 'mod_glossary', 0),
(263, 'mod/glossary:write', 'write', 70, 'mod_glossary', 16),
(264, 'mod/glossary:manageentries', 'write', 70, 'mod_glossary', 16),
(265, 'mod/glossary:managecategories', 'write', 70, 'mod_glossary', 16),
(266, 'mod/glossary:comment', 'write', 70, 'mod_glossary', 16),
(267, 'mod/glossary:managecomments', 'write', 70, 'mod_glossary', 16),
(268, 'mod/glossary:import', 'write', 70, 'mod_glossary', 16),
(269, 'mod/glossary:export', 'read', 70, 'mod_glossary', 0),
(270, 'mod/glossary:approve', 'write', 70, 'mod_glossary', 16),
(271, 'mod/glossary:rate', 'write', 70, 'mod_glossary', 0),
(272, 'mod/glossary:viewrating', 'read', 70, 'mod_glossary', 0),
(273, 'mod/glossary:viewanyrating', 'read', 70, 'mod_glossary', 8),
(274, 'mod/glossary:viewallratings', 'read', 70, 'mod_glossary', 8),
(275, 'mod/glossary:exportentry', 'read', 70, 'mod_glossary', 8),
(276, 'mod/glossary:exportownentry', 'read', 70, 'mod_glossary', 0),
(277, 'mod/imscp:view', 'read', 70, 'mod_imscp', 0),
(278, 'mod/imscp:addinstance', 'write', 50, 'mod_imscp', 4),
(279, 'mod/label:addinstance', 'write', 50, 'mod_label', 4),
(280, 'mod/lesson:addinstance', 'write', 50, 'mod_lesson', 4),
(281, 'mod/lesson:edit', 'write', 70, 'mod_lesson', 4),
(282, 'mod/lesson:manage', 'write', 70, 'mod_lesson', 0),
(283, 'mod/lti:view', 'read', 70, 'mod_lti', 0),
(284, 'mod/lti:addinstance', 'write', 50, 'mod_lti', 4),
(285, 'mod/lti:grade', 'write', 70, 'mod_lti', 8),
(286, 'mod/lti:manage', 'write', 70, 'mod_lti', 8),
(287, 'mod/lti:addcoursetool', 'write', 50, 'mod_lti', 0),
(288, 'mod/lti:requesttooladd', 'write', 50, 'mod_lti', 0),
(289, 'mod/page:view', 'read', 70, 'mod_page', 0),
(290, 'mod/page:addinstance', 'write', 50, 'mod_page', 4),
(291, 'mod/quiz:view', 'read', 70, 'mod_quiz', 0),
(292, 'mod/quiz:addinstance', 'write', 50, 'mod_quiz', 4),
(293, 'mod/quiz:attempt', 'write', 70, 'mod_quiz', 16),
(294, 'mod/quiz:reviewmyattempts', 'read', 70, 'mod_quiz', 0),
(295, 'mod/quiz:manage', 'write', 70, 'mod_quiz', 16),
(296, 'mod/quiz:manageoverrides', 'write', 70, 'mod_quiz', 0),
(297, 'mod/quiz:preview', 'write', 70, 'mod_quiz', 0),
(298, 'mod/quiz:grade', 'write', 70, 'mod_quiz', 16),
(299, 'mod/quiz:regrade', 'write', 70, 'mod_quiz', 16),
(300, 'mod/quiz:viewreports', 'read', 70, 'mod_quiz', 8),
(301, 'mod/quiz:deleteattempts', 'write', 70, 'mod_quiz', 32),
(302, 'mod/quiz:ignoretimelimits', 'read', 70, 'mod_quiz', 0),
(303, 'mod/quiz:emailconfirmsubmission', 'read', 70, 'mod_quiz', 0),
(304, 'mod/quiz:emailnotifysubmission', 'read', 70, 'mod_quiz', 0),
(305, 'mod/quiz:emailwarnoverdue', 'read', 70, 'mod_quiz', 0),
(306, 'mod/resource:view', 'read', 70, 'mod_resource', 0),
(307, 'mod/resource:addinstance', 'write', 50, 'mod_resource', 4),
(308, 'mod/scorm:addinstance', 'write', 50, 'mod_scorm', 4),
(309, 'mod/scorm:viewreport', 'read', 70, 'mod_scorm', 0),
(310, 'mod/scorm:skipview', 'write', 70, 'mod_scorm', 0),
(311, 'mod/scorm:savetrack', 'write', 70, 'mod_scorm', 0),
(312, 'mod/scorm:viewscores', 'read', 70, 'mod_scorm', 0),
(313, 'mod/scorm:deleteresponses', 'read', 70, 'mod_scorm', 0),
(314, 'mod/scorm:deleteownresponses', 'write', 70, 'mod_scorm', 0),
(315, 'mod/survey:addinstance', 'write', 50, 'mod_survey', 4),
(316, 'mod/survey:participate', 'read', 70, 'mod_survey', 0),
(317, 'mod/survey:readresponses', 'read', 70, 'mod_survey', 0),
(318, 'mod/survey:download', 'read', 70, 'mod_survey', 0),
(319, 'mod/url:view', 'read', 70, 'mod_url', 0),
(320, 'mod/url:addinstance', 'write', 50, 'mod_url', 4),
(321, 'mod/wiki:addinstance', 'write', 50, 'mod_wiki', 4),
(322, 'mod/wiki:viewpage', 'read', 70, 'mod_wiki', 0),
(323, 'mod/wiki:editpage', 'write', 70, 'mod_wiki', 16),
(324, 'mod/wiki:createpage', 'write', 70, 'mod_wiki', 16),
(325, 'mod/wiki:viewcomment', 'read', 70, 'mod_wiki', 0),
(326, 'mod/wiki:editcomment', 'write', 70, 'mod_wiki', 16),
(327, 'mod/wiki:managecomment', 'write', 70, 'mod_wiki', 0),
(328, 'mod/wiki:managefiles', 'write', 70, 'mod_wiki', 0),
(329, 'mod/wiki:overridelock', 'write', 70, 'mod_wiki', 0),
(330, 'mod/wiki:managewiki', 'write', 70, 'mod_wiki', 0),
(331, 'mod/workshop:view', 'read', 70, 'mod_workshop', 0),
(332, 'mod/workshop:addinstance', 'write', 50, 'mod_workshop', 4),
(333, 'mod/workshop:switchphase', 'write', 70, 'mod_workshop', 0),
(334, 'mod/workshop:editdimensions', 'write', 70, 'mod_workshop', 4),
(335, 'mod/workshop:submit', 'write', 70, 'mod_workshop', 0),
(336, 'mod/workshop:peerassess', 'write', 70, 'mod_workshop', 0),
(337, 'mod/workshop:manageexamples', 'write', 70, 'mod_workshop', 0),
(338, 'mod/workshop:allocate', 'write', 70, 'mod_workshop', 0),
(339, 'mod/workshop:publishsubmissions', 'write', 70, 'mod_workshop', 0),
(340, 'mod/workshop:viewauthornames', 'read', 70, 'mod_workshop', 0),
(341, 'mod/workshop:viewreviewernames', 'read', 70, 'mod_workshop', 0),
(342, 'mod/workshop:viewallsubmissions', 'read', 70, 'mod_workshop', 0),
(343, 'mod/workshop:viewpublishedsubmissions', 'read', 70, 'mod_workshop', 0),
(344, 'mod/workshop:viewauthorpublished', 'read', 70, 'mod_workshop', 0),
(345, 'mod/workshop:viewallassessments', 'read', 70, 'mod_workshop', 0),
(346, 'mod/workshop:overridegrades', 'write', 70, 'mod_workshop', 0),
(347, 'mod/workshop:ignoredeadlines', 'write', 70, 'mod_workshop', 0),
(348, 'enrol/authorize:config', 'write', 50, 'enrol_authorize', 0),
(349, 'enrol/authorize:manage', 'write', 50, 'enrol_authorize', 0),
(350, 'enrol/authorize:unenrol', 'write', 50, 'enrol_authorize', 0),
(351, 'enrol/authorize:unenrolself', 'write', 50, 'enrol_authorize', 0),
(352, 'enrol/authorize:managepayments', 'write', 10, 'enrol_authorize', 8),
(353, 'enrol/authorize:uploadcsv', 'write', 10, 'enrol_authorize', 4),
(354, 'enrol/category:synchronised', 'write', 10, 'enrol_category', 0),
(355, 'enrol/cohort:config', 'write', 50, 'enrol_cohort', 0),
(356, 'enrol/cohort:unenrol', 'write', 50, 'enrol_cohort', 0),
(357, 'enrol/database:unenrol', 'write', 50, 'enrol_database', 0),
(358, 'enrol/flatfile:manage', 'write', 50, 'enrol_flatfile', 0),
(359, 'enrol/flatfile:unenrol', 'write', 50, 'enrol_flatfile', 0),
(360, 'enrol/guest:config', 'write', 50, 'enrol_guest', 0),
(361, 'enrol/ldap:manage', 'write', 50, 'enrol_ldap', 0),
(362, 'enrol/manual:config', 'write', 50, 'enrol_manual', 0),
(363, 'enrol/manual:enrol', 'write', 50, 'enrol_manual', 0),
(364, 'enrol/manual:manage', 'write', 50, 'enrol_manual', 0),
(365, 'enrol/manual:unenrol', 'write', 50, 'enrol_manual', 0),
(366, 'enrol/manual:unenrolself', 'write', 50, 'enrol_manual', 0),
(367, 'enrol/meta:config', 'write', 50, 'enrol_meta', 0),
(368, 'enrol/meta:selectaslinked', 'read', 50, 'enrol_meta', 0),
(369, 'enrol/meta:unenrol', 'write', 50, 'enrol_meta', 0),
(370, 'enrol/paypal:config', 'write', 50, 'enrol_paypal', 0),
(371, 'enrol/paypal:manage', 'write', 50, 'enrol_paypal', 0),
(372, 'enrol/paypal:unenrol', 'write', 50, 'enrol_paypal', 0),
(373, 'enrol/paypal:unenrolself', 'write', 50, 'enrol_paypal', 0),
(374, 'enrol/self:config', 'write', 50, 'enrol_self', 0),
(375, 'enrol/self:manage', 'write', 50, 'enrol_self', 0),
(376, 'enrol/self:unenrolself', 'write', 50, 'enrol_self', 0),
(377, 'enrol/self:unenrol', 'write', 50, 'enrol_self', 0),
(378, 'block/activity_modules:addinstance', 'write', 80, 'block_activity_modules', 20),
(379, 'block/admin_bookmarks:myaddinstance', 'write', 10, 'block_admin_bookmarks', 0),
(380, 'block/admin_bookmarks:addinstance', 'write', 80, 'block_admin_bookmarks', 20),
(381, 'block/badges:addinstance', 'read', 80, 'block_badges', 0),
(382, 'block/badges:myaddinstance', 'read', 10, 'block_badges', 8),
(383, 'block/blog_menu:addinstance', 'write', 80, 'block_blog_menu', 20),
(384, 'block/blog_recent:addinstance', 'write', 80, 'block_blog_recent', 20),
(385, 'block/blog_tags:addinstance', 'write', 80, 'block_blog_tags', 20),
(386, 'block/calendar_month:myaddinstance', 'write', 10, 'block_calendar_month', 0),
(387, 'block/calendar_month:addinstance', 'write', 80, 'block_calendar_month', 20),
(388, 'block/calendar_upcoming:myaddinstance', 'write', 10, 'block_calendar_upcoming', 0),
(389, 'block/calendar_upcoming:addinstance', 'write', 80, 'block_calendar_upcoming', 20),
(390, 'block/comments:myaddinstance', 'write', 10, 'block_comments', 0),
(391, 'block/comments:addinstance', 'write', 80, 'block_comments', 20),
(392, 'block/community:myaddinstance', 'write', 10, 'block_community', 0),
(393, 'block/community:addinstance', 'write', 80, 'block_community', 20),
(394, 'block/completionstatus:addinstance', 'write', 80, 'block_completionstatus', 20),
(395, 'block/course_list:myaddinstance', 'write', 10, 'block_course_list', 0),
(396, 'block/course_list:addinstance', 'write', 80, 'block_course_list', 20),
(397, 'block/course_overview:myaddinstance', 'write', 10, 'block_course_overview', 0),
(398, 'block/course_overview:addinstance', 'write', 80, 'block_course_overview', 20),
(399, 'block/course_summary:addinstance', 'write', 80, 'block_course_summary', 20),
(400, 'block/feedback:addinstance', 'write', 80, 'block_feedback', 20),
(401, 'block/glossary_random:myaddinstance', 'write', 10, 'block_glossary_random', 0),
(402, 'block/glossary_random:addinstance', 'write', 80, 'block_glossary_random', 20),
(403, 'block/html:myaddinstance', 'write', 10, 'block_html', 0),
(404, 'block/html:addinstance', 'write', 80, 'block_html', 20),
(405, 'block/login:addinstance', 'write', 80, 'block_login', 20),
(406, 'block/mentees:myaddinstance', 'write', 10, 'block_mentees', 0),
(407, 'block/mentees:addinstance', 'write', 80, 'block_mentees', 20),
(408, 'block/messages:myaddinstance', 'write', 10, 'block_messages', 0),
(409, 'block/messages:addinstance', 'write', 80, 'block_messages', 20),
(410, 'block/mnet_hosts:myaddinstance', 'write', 10, 'block_mnet_hosts', 0),
(411, 'block/mnet_hosts:addinstance', 'write', 80, 'block_mnet_hosts', 20),
(412, 'block/myprofile:myaddinstance', 'write', 10, 'block_myprofile', 0),
(413, 'block/myprofile:addinstance', 'write', 80, 'block_myprofile', 20),
(414, 'block/navigation:myaddinstance', 'write', 10, 'block_navigation', 0),
(415, 'block/navigation:addinstance', 'write', 80, 'block_navigation', 20),
(416, 'block/news_items:myaddinstance', 'write', 10, 'block_news_items', 0),
(417, 'block/news_items:addinstance', 'write', 80, 'block_news_items', 20),
(418, 'block/online_users:myaddinstance', 'write', 10, 'block_online_users', 0),
(419, 'block/online_users:addinstance', 'write', 80, 'block_online_users', 20),
(420, 'block/online_users:viewlist', 'read', 80, 'block_online_users', 0),
(421, 'block/participants:addinstance', 'write', 80, 'block_participants', 20),
(422, 'block/private_files:myaddinstance', 'write', 10, 'block_private_files', 0),
(423, 'block/private_files:addinstance', 'write', 80, 'block_private_files', 20),
(424, 'block/quiz_results:addinstance', 'write', 80, 'block_quiz_results', 20),
(425, 'block/recent_activity:addinstance', 'write', 80, 'block_recent_activity', 20),
(426, 'block/rss_client:myaddinstance', 'write', 10, 'block_rss_client', 0),
(427, 'block/rss_client:addinstance', 'write', 80, 'block_rss_client', 20),
(428, 'block/rss_client:manageownfeeds', 'write', 80, 'block_rss_client', 0),
(429, 'block/rss_client:manageanyfeeds', 'write', 80, 'block_rss_client', 16),
(430, 'block/search_forums:addinstance', 'write', 80, 'block_search_forums', 20),
(431, 'block/section_links:addinstance', 'write', 80, 'block_section_links', 20),
(432, 'block/selfcompletion:addinstance', 'write', 80, 'block_selfcompletion', 20),
(433, 'block/settings:myaddinstance', 'write', 10, 'block_settings', 0),
(434, 'block/settings:addinstance', 'write', 80, 'block_settings', 20),
(435, 'block/site_main_menu:addinstance', 'write', 80, 'block_site_main_menu', 20),
(436, 'block/social_activities:addinstance', 'write', 80, 'block_social_activities', 20),
(437, 'block/tag_flickr:addinstance', 'write', 80, 'block_tag_flickr', 20),
(438, 'block/tag_youtube:addinstance', 'write', 80, 'block_tag_youtube', 20),
(439, 'block/tags:myaddinstance', 'write', 10, 'block_tags', 0),
(440, 'block/tags:addinstance', 'write', 80, 'block_tags', 20),
(441, 'report/completion:view', 'read', 50, 'report_completion', 8),
(442, 'report/courseoverview:view', 'read', 10, 'report_courseoverview', 8),
(443, 'report/log:view', 'read', 50, 'report_log', 8),
(444, 'report/log:viewtoday', 'read', 50, 'report_log', 8),
(445, 'report/loglive:view', 'read', 50, 'report_loglive', 8),
(446, 'report/outline:view', 'read', 50, 'report_outline', 8),
(447, 'report/participation:view', 'read', 50, 'report_participation', 8),
(448, 'report/performance:view', 'read', 10, 'report_performance', 2),
(449, 'report/progress:view', 'read', 50, 'report_progress', 8),
(450, 'report/questioninstances:view', 'read', 10, 'report_questioninstances', 0),
(451, 'report/security:view', 'read', 10, 'report_security', 2),
(452, 'report/stats:view', 'read', 50, 'report_stats', 8),
(453, 'gradeexport/ods:view', 'read', 50, 'gradeexport_ods', 8),
(454, 'gradeexport/ods:publish', 'read', 50, 'gradeexport_ods', 8),
(455, 'gradeexport/txt:view', 'read', 50, 'gradeexport_txt', 8),
(456, 'gradeexport/txt:publish', 'read', 50, 'gradeexport_txt', 8),
(457, 'gradeexport/xls:view', 'read', 50, 'gradeexport_xls', 8),
(458, 'gradeexport/xls:publish', 'read', 50, 'gradeexport_xls', 8),
(459, 'gradeexport/xml:view', 'read', 50, 'gradeexport_xml', 8),
(460, 'gradeexport/xml:publish', 'read', 50, 'gradeexport_xml', 8),
(461, 'gradeimport/csv:view', 'write', 50, 'gradeimport_csv', 0),
(462, 'gradeimport/xml:view', 'write', 50, 'gradeimport_xml', 0),
(463, 'gradeimport/xml:publish', 'write', 50, 'gradeimport_xml', 0),
(464, 'gradereport/grader:view', 'read', 50, 'gradereport_grader', 8),
(465, 'gradereport/outcomes:view', 'read', 50, 'gradereport_outcomes', 8),
(466, 'gradereport/overview:view', 'read', 50, 'gradereport_overview', 8),
(467, 'gradereport/user:view', 'read', 50, 'gradereport_user', 8),
(468, 'webservice/amf:use', 'read', 50, 'webservice_amf', 62),
(469, 'webservice/rest:use', 'read', 50, 'webservice_rest', 62),
(470, 'webservice/soap:use', 'read', 50, 'webservice_soap', 62),
(471, 'webservice/xmlrpc:use', 'read', 50, 'webservice_xmlrpc', 62),
(472, 'repository/alfresco:view', 'read', 70, 'repository_alfresco', 0),
(473, 'repository/boxnet:view', 'read', 70, 'repository_boxnet', 0),
(474, 'repository/coursefiles:view', 'read', 70, 'repository_coursefiles', 0),
(475, 'repository/dropbox:view', 'read', 70, 'repository_dropbox', 0),
(476, 'repository/equella:view', 'read', 70, 'repository_equella', 0),
(477, 'repository/filesystem:view', 'read', 70, 'repository_filesystem', 0),
(478, 'repository/flickr:view', 'read', 70, 'repository_flickr', 0),
(479, 'repository/flickr_public:view', 'read', 70, 'repository_flickr_public', 0),
(480, 'repository/googledocs:view', 'read', 70, 'repository_googledocs', 0),
(481, 'repository/local:view', 'read', 70, 'repository_local', 0),
(482, 'repository/merlot:view', 'read', 70, 'repository_merlot', 0),
(483, 'repository/picasa:view', 'read', 70, 'repository_picasa', 0),
(484, 'repository/recent:view', 'read', 70, 'repository_recent', 0),
(485, 'repository/s3:view', 'read', 70, 'repository_s3', 0),
(486, 'repository/upload:view', 'read', 70, 'repository_upload', 0),
(487, 'repository/url:view', 'read', 70, 'repository_url', 0),
(488, 'repository/user:view', 'read', 70, 'repository_user', 0),
(489, 'repository/webdav:view', 'read', 70, 'repository_webdav', 0),
(490, 'repository/wikimedia:view', 'read', 70, 'repository_wikimedia', 0),
(491, 'repository/youtube:view', 'read', 70, 'repository_youtube', 0),
(492, 'tool/customlang:view', 'read', 10, 'tool_customlang', 2),
(493, 'tool/customlang:edit', 'write', 10, 'tool_customlang', 6),
(494, 'booktool/exportimscp:export', 'read', 70, 'booktool_exportimscp', 0),
(495, 'booktool/importhtml:import', 'write', 70, 'booktool_importhtml', 4),
(496, 'booktool/print:print', 'read', 70, 'booktool_print', 0),
(497, 'quiz/grading:viewstudentnames', 'read', 70, 'quiz_grading', 0),
(498, 'quiz/grading:viewidnumber', 'read', 70, 'quiz_grading', 0),
(499, 'quiz/statistics:view', 'read', 70, 'quiz_statistics', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat`
--

CREATE TABLE IF NOT EXISTS `mdl_chat` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each of these is a chat room' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all the actual chat messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages_current`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores current session' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_users`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) NOT NULL DEFAULT '',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of which users are in which chat rooms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice`
--

CREATE TABLE IF NOT EXISTS `mdl_choice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available choices are stored here' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='choices performed by users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='available options to choice' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents one cohort (aka site-wide group).' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort_members`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a cohort.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `commentarea` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle comments module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config`
--

CREATE TABLE IF NOT EXISTS `mdl_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Moodle configuration variables' AUTO_INCREMENT=431 ;

--
-- Dumping data for table `mdl_config`
--

INSERT INTO `mdl_config` (`id`, `name`, `value`) VALUES
(2, 'rolesactive', '1'),
(3, 'auth', 'email'),
(4, 'auth_pop3mailbox', 'INBOX'),
(5, 'enrol_plugins_enabled', 'manual,guest,self,cohort'),
(6, 'theme', 'standard'),
(7, 'filter_multilang_converted', '1'),
(8, 'siteidentifier', '42Ug9ClnIhuLBa8faroHWodNHHmdyvRYlocalhost'),
(9, 'backup_version', '2008111700'),
(10, 'backup_release', '2.0 dev'),
(11, 'mnet_dispatcher_mode', 'off'),
(12, 'sessiontimeout', '7200'),
(13, 'stringfilters', ''),
(14, 'filterall', '0'),
(15, 'texteditors', 'tinymce,textarea'),
(16, 'mnet_localhost_id', '1'),
(17, 'mnet_all_hosts_id', '2'),
(18, 'siteguest', '1'),
(19, 'siteadmins', '2'),
(20, 'themerev', '1438375169'),
(21, 'jsrev', '1438375169'),
(22, 'gdversion', '2'),
(23, 'licenses', 'unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),
(24, 'version', '2013051408'),
(25, 'enableoutcomes', '0'),
(26, 'usecomments', '1'),
(27, 'usetags', '1'),
(28, 'enablenotes', '1'),
(29, 'enableportfolios', '0'),
(30, 'enablewebservices', '0'),
(31, 'messaging', '1'),
(32, 'messaginghidereadnotifications', '0'),
(33, 'messagingdeletereadnotificationsdelay', '604800'),
(34, 'messagingallowemailoverride', '0'),
(35, 'enablestats', '0'),
(36, 'enablerssfeeds', '0'),
(37, 'enableblogs', '1'),
(38, 'enablecompletion', '0'),
(39, 'enableavailability', '0'),
(40, 'enableplagiarism', '0'),
(41, 'enablebadges', '1'),
(42, 'autologinguests', '0'),
(43, 'hiddenuserfields', ''),
(44, 'showuseridentity', 'email'),
(45, 'maxusersperpage', '100'),
(46, 'enablegravatar', '0'),
(47, 'gravatardefaulturl', 'mm'),
(48, 'enablecourserequests', '0'),
(49, 'defaultrequestcategory', '1'),
(50, 'requestcategoryselection', '0'),
(51, 'courserequestnotify', ''),
(52, 'grade_profilereport', 'user'),
(53, 'grade_aggregationposition', '1'),
(54, 'grade_includescalesinaggregation', '1'),
(55, 'grade_hiddenasdate', '0'),
(56, 'gradepublishing', '0'),
(57, 'grade_export_displaytype', '1'),
(58, 'grade_export_decimalpoints', '2'),
(59, 'grade_navmethod', '0'),
(60, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email'),
(61, 'grade_export_customprofilefields', ''),
(62, 'recovergradesdefault', '0'),
(63, 'gradeexport', ''),
(64, 'unlimitedgrades', '0'),
(65, 'grade_hideforcedsettings', '1'),
(66, 'grade_aggregation', '11'),
(67, 'grade_aggregation_flag', '0'),
(68, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13'),
(69, 'grade_aggregateonlygraded', '1'),
(70, 'grade_aggregateonlygraded_flag', '2'),
(71, 'grade_aggregateoutcomes', '0'),
(72, 'grade_aggregateoutcomes_flag', '2'),
(73, 'grade_aggregatesubcats', '0'),
(74, 'grade_aggregatesubcats_flag', '2'),
(75, 'grade_keephigh', '0'),
(76, 'grade_keephigh_flag', '3'),
(77, 'grade_droplow', '0'),
(78, 'grade_droplow_flag', '2'),
(79, 'grade_displaytype', '1'),
(80, 'grade_decimalpoints', '2'),
(81, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),
(82, 'grade_report_studentsperpage', '100'),
(83, 'grade_report_showonlyactiveenrol', '1'),
(84, 'grade_report_quickgrading', '1'),
(85, 'grade_report_showquickfeedback', '0'),
(86, 'grade_report_fixedstudents', '0'),
(87, 'grade_report_meanselection', '1'),
(88, 'grade_report_enableajax', '0'),
(89, 'grade_report_showcalculations', '0'),
(90, 'grade_report_showeyecons', '0'),
(91, 'grade_report_showaverages', '1'),
(92, 'grade_report_showlocks', '0'),
(93, 'grade_report_showranges', '0'),
(94, 'grade_report_showanalysisicon', '1'),
(95, 'grade_report_showuserimage', '1'),
(96, 'grade_report_showactivityicons', '1'),
(97, 'grade_report_shownumberofgrades', '0'),
(98, 'grade_report_averagesdisplaytype', 'inherit'),
(99, 'grade_report_rangesdisplaytype', 'inherit'),
(100, 'grade_report_averagesdecimalpoints', 'inherit'),
(101, 'grade_report_rangesdecimalpoints', 'inherit'),
(102, 'grade_report_overview_showrank', '0'),
(103, 'grade_report_overview_showtotalsifcontainhidden', '0'),
(104, 'grade_report_user_showrank', '0'),
(105, 'grade_report_user_showpercentage', '1'),
(106, 'grade_report_user_showgrade', '1'),
(107, 'grade_report_user_showfeedback', '1'),
(108, 'grade_report_user_showrange', '1'),
(109, 'grade_report_user_showweight', '0'),
(110, 'grade_report_user_showaverage', '0'),
(111, 'grade_report_user_showlettergrade', '0'),
(112, 'grade_report_user_rangedecimals', '0'),
(113, 'grade_report_user_showhiddenitems', '1'),
(114, 'grade_report_user_showtotalsifcontainhidden', '0'),
(115, 'badges_defaultissuername', ''),
(116, 'badges_defaultissuercontact', ''),
(117, 'badges_badgesalt', 'badges1438373708'),
(118, 'badges_allowexternalbackpack', '1'),
(119, 'badges_allowcoursebadges', '1'),
(120, 'timezone', '99'),
(121, 'forcetimezone', '99'),
(122, 'country', '0'),
(123, 'defaultcity', ''),
(124, 'geoipfile', '/var/moodledata/geoip/GeoLiteCity.dat'),
(125, 'googlemapkey3', ''),
(126, 'allcountrycodes', ''),
(127, 'autolang', '1'),
(128, 'lang', 'en'),
(129, 'langmenu', '1'),
(130, 'langlist', ''),
(131, 'langrev', '1438375169'),
(132, 'langcache', '1'),
(133, 'langstringcache', '1'),
(134, 'locale', ''),
(135, 'latinexcelexport', '0'),
(136, 'block_course_list_adminview', 'all'),
(137, 'block_course_list_hideallcourseslink', '0'),
(138, 'block_html_allowcssclasses', '0'),
(139, 'block_online_users_timetosee', '5'),
(140, 'block_rss_client_num_entries', '5'),
(141, 'block_rss_client_timeout', '30'),
(142, 'block_tags_showcoursetags', '0'),
(144, 'authpreventaccountcreation', '0'),
(145, 'loginpageautofocus', '0'),
(146, 'guestloginbutton', '1'),
(147, 'alternateloginurl', ''),
(148, 'forgottenpasswordurl', ''),
(149, 'auth_instructions', ''),
(150, 'allowemailaddresses', ''),
(151, 'denyemailaddresses', ''),
(152, 'verifychangedemail', '1'),
(153, 'recaptchapublickey', ''),
(154, 'recaptchaprivatekey', ''),
(155, 'sitedefaultlicense', 'allrightsreserved'),
(156, 'cachetext', '60'),
(157, 'filteruploadedfiles', '0'),
(158, 'filtermatchoneperpage', '0'),
(159, 'filtermatchonepertext', '0'),
(160, 'filter_multilang_force_old', '0'),
(161, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),
(162, 'filter_tex_latexbackground', '#FFFFFF'),
(163, 'filter_tex_density', '120'),
(164, 'filter_tex_pathlatex', '/usr/bin/latex'),
(165, 'filter_tex_pathdvips', '/usr/bin/dvips'),
(166, 'filter_tex_pathconvert', '/usr/bin/convert'),
(167, 'filter_tex_convertformat', 'gif'),
(168, 'filter_censor_badwords', ''),
(169, 'portfolio_moderate_filesize_threshold', '1048576'),
(170, 'portfolio_high_filesize_threshold', '5242880'),
(171, 'portfolio_moderate_db_threshold', '20'),
(172, 'portfolio_high_db_threshold', '50'),
(173, 'repositorycacheexpire', '120'),
(174, 'repositoryallowexternallinks', '1'),
(175, 'legacyfilesinnewcourses', '0'),
(176, 'mobilecssurl', ''),
(177, 'enablewsdocumentation', '0'),
(178, 'allowbeforeblock', '0'),
(179, 'allowedip', ''),
(180, 'blockedip', ''),
(181, 'protectusernames', '1'),
(182, 'forcelogin', '0'),
(183, 'forceloginforprofiles', '1'),
(184, 'forceloginforprofileimage', '0'),
(185, 'opentogoogle', '0'),
(186, 'maxbytes', '0'),
(187, 'userquota', '104857600'),
(188, 'allowobjectembed', '0'),
(189, 'enabletrusttext', '0'),
(190, 'maxeditingtime', '1800'),
(191, 'fullnamedisplay', 'language'),
(192, 'extendedusernamechars', '0'),
(193, 'sitepolicy', ''),
(194, 'sitepolicyguest', ''),
(195, 'keeptagnamecase', '1'),
(196, 'profilesforenrolledusersonly', '1'),
(197, 'cronclionly', '0'),
(198, 'cronremotepassword', ''),
(199, 'lockoutthreshold', '0'),
(200, 'lockoutwindow', '1800'),
(201, 'lockoutduration', '1800'),
(202, 'passwordpolicy', '1'),
(203, 'minpasswordlength', '8'),
(204, 'minpassworddigits', '1'),
(205, 'minpasswordlower', '1'),
(206, 'minpasswordupper', '1'),
(207, 'minpasswordnonalphanum', '1'),
(208, 'maxconsecutiveidentchars', '0'),
(209, 'groupenrolmentkeypolicy', '1'),
(210, 'disableuserimages', '0'),
(211, 'emailchangeconfirmation', '1'),
(212, 'rememberusername', '2'),
(213, 'strictformsrequired', '0'),
(214, 'loginhttps', '0'),
(215, 'cookiesecure', '0'),
(216, 'cookiehttponly', '0'),
(217, 'allowframembedding', '0'),
(218, 'loginpasswordautocomplete', '0'),
(219, 'displayloginfailures', ''),
(220, 'notifyloginfailures', ''),
(221, 'notifyloginthreshold', '10'),
(222, 'runclamonupload', '0'),
(223, 'pathtoclam', ''),
(224, 'quarantinedir', ''),
(225, 'clamfailureonupload', 'donothing'),
(226, 'themelist', ''),
(227, 'themedesignermode', '0'),
(228, 'allowuserthemes', '0'),
(229, 'allowcoursethemes', '0'),
(230, 'allowcategorythemes', '0'),
(231, 'allowthemechangeonurl', '0'),
(232, 'allowuserblockhiding', '1'),
(233, 'allowblockstodock', '1'),
(234, 'custommenuitems', ''),
(235, 'enabledevicedetection', '1'),
(236, 'devicedetectregex', '[]'),
(237, 'calendar_adminseesall', '0'),
(238, 'calendar_site_timeformat', '0'),
(239, 'calendar_startwday', '0'),
(240, 'calendar_weekend', '65'),
(241, 'calendar_lookahead', '21'),
(242, 'calendar_maxevents', '10'),
(243, 'enablecalendarexport', '1'),
(244, 'calendar_customexport', '1'),
(245, 'calendar_exportlookahead', '365'),
(246, 'calendar_exportlookback', '5'),
(247, 'calendar_exportsalt', 'O3gJ5NKOhixeRPUx3Jr3m0cyIIR21OAnBEd92UUotQgs6i7sswEXtbJU9TqY'),
(248, 'calendar_showicalsource', '1'),
(249, 'useblogassociations', '1'),
(250, 'bloglevel', '4'),
(251, 'useexternalblogs', '1'),
(252, 'externalblogcrontime', '86400'),
(253, 'maxexternalblogsperuser', '1'),
(254, 'blogusecomments', '1'),
(255, 'blogshowcommentscount', '1'),
(256, 'defaulthomepage', '0'),
(257, 'allowguestmymoodle', '1'),
(258, 'navshowfullcoursenames', '0'),
(259, 'navshowcategories', '1'),
(260, 'navshowmycoursecategories', '0'),
(261, 'navshowallcourses', '0'),
(262, 'navsortmycoursessort', 'sortorder'),
(263, 'navcourselimit', '20'),
(264, 'usesitenameforsitepages', '0'),
(265, 'linkadmincategories', '0'),
(266, 'navshowfrontpagemods', '1'),
(267, 'navadduserpostslinks', '1'),
(268, 'formatstringstriptags', '1'),
(269, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]'),
(270, 'core_media_enable_youtube', '1'),
(271, 'core_media_enable_vimeo', '0'),
(272, 'core_media_enable_mp3', '1'),
(273, 'core_media_enable_flv', '1'),
(274, 'core_media_enable_swf', '1'),
(275, 'core_media_enable_html5audio', '1'),
(276, 'core_media_enable_html5video', '1'),
(277, 'core_media_enable_qt', '1'),
(278, 'core_media_enable_wmp', '1'),
(279, 'core_media_enable_rm', '1'),
(280, 'docroot', 'http://docs.moodle.org'),
(281, 'doctonewwindow', '0'),
(282, 'courselistshortnames', '0'),
(283, 'coursesperpage', '20'),
(284, 'courseswithsummarieslimit', '10'),
(285, 'courseoverviewfileslimit', '1'),
(286, 'courseoverviewfilesext', '.jpg,.gif,.png'),
(287, 'enableajax', '1'),
(288, 'useexternalyui', '0'),
(289, 'yuicomboloading', '1'),
(290, 'cachejs', '1'),
(291, 'modchooserdefault', '1'),
(292, 'additionalhtmlhead', ''),
(293, 'additionalhtmltopofbody', ''),
(294, 'additionalhtmlfooter', ''),
(295, 'pathtodu', ''),
(296, 'aspellpath', ''),
(297, 'pathtodot', ''),
(298, 'supportpage', ''),
(299, 'dbsessions', '1'),
(300, 'sessioncookie', ''),
(301, 'sessioncookiepath', ''),
(302, 'sessioncookiedomain', ''),
(303, 'statsfirstrun', 'none'),
(304, 'statsmaxruntime', '0'),
(305, 'statsruntimedays', '31'),
(306, 'statsruntimestarthour', '0'),
(307, 'statsruntimestartminute', '0'),
(308, 'statsuserthreshold', '0'),
(309, 'slasharguments', '1'),
(310, 'getremoteaddrconf', '0'),
(311, 'proxyhost', ''),
(312, 'proxyport', '0'),
(313, 'proxytype', 'HTTP'),
(314, 'proxyuser', ''),
(315, 'proxypassword', ''),
(316, 'proxybypass', 'localhost, 127.0.0.1'),
(317, 'maintenance_enabled', '0'),
(318, 'maintenance_message', ''),
(319, 'deleteunconfirmed', '168'),
(320, 'deleteincompleteusers', '0'),
(321, 'logguests', '1'),
(322, 'loglifetime', '0'),
(323, 'disablegradehistory', '0'),
(324, 'gradehistorylifetime', '0'),
(325, 'extramemorylimit', '512M'),
(326, 'curlcache', '120'),
(327, 'curltimeoutkbitrate', '56'),
(328, 'updateautocheck', '1'),
(329, 'updateautodeploy', '0'),
(330, 'updateminmaturity', '200'),
(331, 'updatenotifybuilds', '0'),
(332, 'enablesafebrowserintegration', '0'),
(333, 'enablegroupmembersonly', '0'),
(334, 'dndallowtextandlinks', '0'),
(335, 'enablecssoptimiser', '0'),
(336, 'debug', '0'),
(337, 'debugdisplay', '0'),
(338, 'debugsmtp', '0'),
(339, 'perfdebug', '7'),
(340, 'debugstringids', '0'),
(341, 'debugvalidators', '0'),
(342, 'debugpageinfo', '0'),
(343, 'profilingenabled', '0'),
(344, 'profilingincluded', ''),
(345, 'profilingexcluded', ''),
(346, 'profilingautofrec', '0'),
(347, 'profilingallowme', '0'),
(348, 'profilingallowall', '0'),
(349, 'profilinglifetime', '1440'),
(350, 'profilingimportprefix', '(I)'),
(351, 'release', '2.5.8 (Build: 20140908)'),
(352, 'branch', '25'),
(354, 'notloggedinroleid', '6'),
(355, 'guestroleid', '6'),
(356, 'defaultuserroleid', '7'),
(357, 'creatornewroleid', '3'),
(358, 'restorernewroleid', '3'),
(359, 'gradebookroles', '5'),
(360, 'assignment_maxbytes', '1048576'),
(361, 'assignment_itemstocount', '1'),
(362, 'assignment_showrecentsubmissions', '1'),
(363, 'chat_method', 'ajax'),
(364, 'chat_refresh_userlist', '10'),
(365, 'chat_old_ping', '35'),
(366, 'chat_refresh_room', '5'),
(367, 'chat_normal_updatemode', 'jsupdate'),
(368, 'chat_serverhost', 'localhost'),
(369, 'chat_serverip', '127.0.0.1'),
(370, 'chat_serverport', '9111'),
(371, 'chat_servermax', '100'),
(372, 'data_enablerssfeeds', '0'),
(373, 'feedback_allowfullanonymous', '0'),
(374, 'forum_displaymode', '3'),
(375, 'forum_replytouser', '1'),
(376, 'forum_shortpost', '300'),
(377, 'forum_longpost', '600'),
(378, 'forum_manydiscussions', '100'),
(379, 'forum_maxbytes', '512000'),
(380, 'forum_maxattachments', '9'),
(381, 'forum_trackreadposts', '1'),
(382, 'forum_oldpostdays', '14'),
(383, 'forum_usermarksread', '0'),
(384, 'forum_cleanreadtime', '2'),
(385, 'digestmailtime', '17'),
(386, 'forum_enablerssfeeds', '0'),
(387, 'forum_enabletimedposts', '0'),
(388, 'glossary_entbypage', '10'),
(389, 'glossary_dupentries', '0'),
(390, 'glossary_allowcomments', '0'),
(391, 'glossary_linkbydefault', '1'),
(392, 'glossary_defaultapproval', '1'),
(393, 'glossary_enablerssfeeds', '0'),
(394, 'glossary_linkentries', '0'),
(395, 'glossary_casesensitive', '0'),
(396, 'glossary_fullmatch', '0'),
(397, 'lesson_slideshowwidth', '640'),
(398, 'lesson_slideshowheight', '480'),
(399, 'lesson_slideshowbgcolor', '#FFFFFF'),
(400, 'lesson_mediawidth', '640'),
(401, 'lesson_mediaheight', '480'),
(402, 'lesson_mediaclose', '0'),
(403, 'lesson_maxhighscores', '10'),
(404, 'lesson_maxanswers', '4'),
(405, 'lesson_defaultnextpage', '0'),
(406, 'smtphosts', ''),
(407, 'smtpsecure', ''),
(408, 'smtpuser', ''),
(409, 'smtppass', ''),
(410, 'smtpmaxbulk', '1'),
(411, 'noreplyaddress', 'noreply@localhost'),
(412, 'sitemailcharset', '0'),
(413, 'allowusermailcharset', '0'),
(414, 'mailnewline', 'LF'),
(415, 'jabberhost', ''),
(416, 'jabberserver', ''),
(417, 'jabberusername', ''),
(418, 'jabberpassword', ''),
(419, 'jabberport', '5222'),
(420, 'profileroles', '5,4,3'),
(421, 'coursecontact', '3'),
(422, 'frontpage', '6'),
(423, 'frontpageloggedin', '6'),
(424, 'maxcategorydepth', '2'),
(425, 'frontpagecourselimit', '200'),
(426, 'commentsperpage', '15'),
(427, 'defaultfrontpageroleid', '8'),
(428, 'supportname', 'Admin User'),
(429, 'supportemail', 'abhinay212@gmail.com'),
(430, 'registerauth', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_log`
--

CREATE TABLE IF NOT EXISTS `mdl_config_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  `oldvalue` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Changes done in server configuration through admin UI' AUTO_INCREMENT=827 ;

--
-- Dumping data for table `mdl_config_log`
--

INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1, 0, 1438373783, NULL, 'enableoutcomes', '0', NULL),
(2, 0, 1438373783, NULL, 'usecomments', '1', NULL),
(3, 0, 1438373783, NULL, 'usetags', '1', NULL),
(4, 0, 1438373783, NULL, 'enablenotes', '1', NULL),
(5, 0, 1438373783, NULL, 'enableportfolios', '0', NULL),
(6, 0, 1438373783, NULL, 'enablewebservices', '0', NULL),
(7, 0, 1438373783, NULL, 'messaging', '1', NULL),
(8, 0, 1438373783, NULL, 'messaginghidereadnotifications', '0', NULL),
(9, 0, 1438373783, NULL, 'messagingdeletereadnotificationsdelay', '604800', NULL),
(10, 0, 1438373783, NULL, 'messagingallowemailoverride', '0', NULL),
(11, 0, 1438373783, NULL, 'enablestats', '0', NULL),
(12, 0, 1438373783, NULL, 'enablerssfeeds', '0', NULL),
(13, 0, 1438373783, NULL, 'enableblogs', '1', NULL),
(14, 0, 1438373783, NULL, 'enablecompletion', '0', NULL),
(15, 0, 1438373784, NULL, 'enableavailability', '0', NULL),
(16, 0, 1438373784, NULL, 'enableplagiarism', '0', NULL),
(17, 0, 1438373784, NULL, 'enablebadges', '1', NULL),
(18, 0, 1438373784, NULL, 'autologinguests', '0', NULL),
(19, 0, 1438373784, NULL, 'hiddenuserfields', '', NULL),
(20, 0, 1438373784, NULL, 'showuseridentity', 'email', NULL),
(21, 0, 1438373784, NULL, 'maxusersperpage', '100', NULL),
(22, 0, 1438373784, NULL, 'enablegravatar', '0', NULL),
(23, 0, 1438373784, NULL, 'gravatardefaulturl', 'mm', NULL),
(24, 0, 1438373784, 'moodlecourse', 'visible', '1', NULL),
(25, 0, 1438373784, 'moodlecourse', 'format', 'weeks', NULL),
(26, 0, 1438373784, 'moodlecourse', 'maxsections', '52', NULL),
(27, 0, 1438373784, 'moodlecourse', 'numsections', '10', NULL),
(28, 0, 1438373784, 'moodlecourse', 'hiddensections', '0', NULL),
(29, 0, 1438373784, 'moodlecourse', 'coursedisplay', '0', NULL),
(30, 0, 1438373784, 'moodlecourse', 'lang', '', NULL),
(31, 0, 1438373784, 'moodlecourse', 'newsitems', '5', NULL),
(32, 0, 1438373784, 'moodlecourse', 'showgrades', '1', NULL),
(33, 0, 1438373784, 'moodlecourse', 'showreports', '0', NULL),
(34, 0, 1438373784, 'moodlecourse', 'maxbytes', '0', NULL),
(35, 0, 1438373784, 'moodlecourse', 'enablecompletion', '0', NULL),
(36, 0, 1438373784, 'moodlecourse', 'groupmode', '0', NULL),
(37, 0, 1438373784, 'moodlecourse', 'groupmodeforce', '0', NULL),
(38, 0, 1438373784, NULL, 'enablecourserequests', '0', NULL),
(39, 0, 1438373784, NULL, 'defaultrequestcategory', '1', NULL),
(40, 0, 1438373784, NULL, 'requestcategoryselection', '0', NULL),
(41, 0, 1438373784, NULL, 'courserequestnotify', '', NULL),
(42, 0, 1438373784, 'backup', 'loglifetime', '30', NULL),
(43, 0, 1438373784, 'backup', 'backup_general_users', '1', NULL),
(44, 0, 1438373784, 'backup', 'backup_general_users_locked', '0', NULL),
(45, 0, 1438373784, 'backup', 'backup_general_anonymize', '0', NULL),
(46, 0, 1438373784, 'backup', 'backup_general_anonymize_locked', '0', NULL),
(47, 0, 1438373784, 'backup', 'backup_general_role_assignments', '1', NULL),
(48, 0, 1438373784, 'backup', 'backup_general_role_assignments_locked', '0', NULL),
(49, 0, 1438373784, 'backup', 'backup_general_activities', '1', NULL),
(50, 0, 1438373784, 'backup', 'backup_general_activities_locked', '0', NULL),
(51, 0, 1438373785, 'backup', 'backup_general_blocks', '1', NULL),
(52, 0, 1438373785, 'backup', 'backup_general_blocks_locked', '0', NULL),
(53, 0, 1438373785, 'backup', 'backup_general_filters', '1', NULL),
(54, 0, 1438373785, 'backup', 'backup_general_filters_locked', '0', NULL),
(55, 0, 1438373785, 'backup', 'backup_general_comments', '1', NULL),
(56, 0, 1438373785, 'backup', 'backup_general_comments_locked', '0', NULL),
(57, 0, 1438373785, 'backup', 'backup_general_badges', '1', NULL),
(58, 0, 1438373785, 'backup', 'backup_general_badges_locked', '0', NULL),
(59, 0, 1438373785, 'backup', 'backup_general_userscompletion', '1', NULL),
(60, 0, 1438373785, 'backup', 'backup_general_userscompletion_locked', '0', NULL),
(61, 0, 1438373785, 'backup', 'backup_general_logs', '0', NULL),
(62, 0, 1438373785, 'backup', 'backup_general_logs_locked', '0', NULL),
(63, 0, 1438373785, 'backup', 'backup_general_histories', '0', NULL),
(64, 0, 1438373785, 'backup', 'backup_general_histories_locked', '0', NULL),
(65, 0, 1438373785, 'backup', 'import_general_maxresults', '10', NULL),
(66, 0, 1438373785, 'backup', 'backup_auto_active', '0', NULL),
(67, 0, 1438373785, 'backup', 'backup_auto_weekdays', '0000000', NULL),
(68, 0, 1438373785, 'backup', 'backup_auto_hour', '0', NULL),
(69, 0, 1438373785, 'backup', 'backup_auto_minute', '0', NULL),
(70, 0, 1438373785, 'backup', 'backup_auto_storage', '0', NULL),
(71, 0, 1438373785, 'backup', 'backup_auto_destination', '', NULL),
(72, 0, 1438373785, 'backup', 'backup_auto_keep', '1', NULL),
(73, 0, 1438373785, 'backup', 'backup_shortname', '0', NULL),
(74, 0, 1438373785, 'backup', 'backup_auto_skip_hidden', '1', NULL),
(75, 0, 1438373785, 'backup', 'backup_auto_skip_modif_days', '30', NULL),
(76, 0, 1438373785, 'backup', 'backup_auto_skip_modif_prev', '0', NULL),
(77, 0, 1438373785, 'backup', 'backup_auto_users', '1', NULL),
(78, 0, 1438373785, 'backup', 'backup_auto_role_assignments', '1', NULL),
(79, 0, 1438373785, 'backup', 'backup_auto_activities', '1', NULL),
(80, 0, 1438373785, 'backup', 'backup_auto_blocks', '1', NULL),
(81, 0, 1438373785, 'backup', 'backup_auto_filters', '1', NULL),
(82, 0, 1438373785, 'backup', 'backup_auto_comments', '1', NULL),
(83, 0, 1438373785, 'backup', 'backup_auto_badges', '1', NULL),
(84, 0, 1438373785, 'backup', 'backup_auto_userscompletion', '1', NULL),
(85, 0, 1438373785, 'backup', 'backup_auto_logs', '0', NULL),
(86, 0, 1438373785, 'backup', 'backup_auto_histories', '0', NULL),
(87, 0, 1438373786, NULL, 'grade_profilereport', 'user', NULL),
(88, 0, 1438373786, NULL, 'grade_aggregationposition', '1', NULL),
(89, 0, 1438373786, NULL, 'grade_includescalesinaggregation', '1', NULL),
(90, 0, 1438373786, NULL, 'grade_hiddenasdate', '0', NULL),
(91, 0, 1438373786, NULL, 'gradepublishing', '0', NULL),
(92, 0, 1438373786, NULL, 'grade_export_displaytype', '1', NULL),
(93, 0, 1438373787, NULL, 'grade_export_decimalpoints', '2', NULL),
(94, 0, 1438373787, NULL, 'grade_navmethod', '0', NULL),
(95, 0, 1438373787, NULL, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email', NULL),
(96, 0, 1438373787, NULL, 'grade_export_customprofilefields', '', NULL),
(97, 0, 1438373787, NULL, 'recovergradesdefault', '0', NULL),
(98, 0, 1438373787, NULL, 'gradeexport', '', NULL),
(99, 0, 1438373787, NULL, 'unlimitedgrades', '0', NULL),
(100, 0, 1438373787, NULL, 'grade_hideforcedsettings', '1', NULL),
(101, 0, 1438373787, NULL, 'grade_aggregation', '11', NULL),
(102, 0, 1438373787, NULL, 'grade_aggregation_flag', '0', NULL),
(103, 0, 1438373787, NULL, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13', NULL),
(104, 0, 1438373788, NULL, 'grade_aggregateonlygraded', '1', NULL),
(105, 0, 1438373788, NULL, 'grade_aggregateonlygraded_flag', '2', NULL),
(106, 0, 1438373788, NULL, 'grade_aggregateoutcomes', '0', NULL),
(107, 0, 1438373788, NULL, 'grade_aggregateoutcomes_flag', '2', NULL),
(108, 0, 1438373788, NULL, 'grade_aggregatesubcats', '0', NULL),
(109, 0, 1438373788, NULL, 'grade_aggregatesubcats_flag', '2', NULL),
(110, 0, 1438373788, NULL, 'grade_keephigh', '0', NULL),
(111, 0, 1438373788, NULL, 'grade_keephigh_flag', '3', NULL),
(112, 0, 1438373788, NULL, 'grade_droplow', '0', NULL),
(113, 0, 1438373788, NULL, 'grade_droplow_flag', '2', NULL),
(114, 0, 1438373788, NULL, 'grade_displaytype', '1', NULL),
(115, 0, 1438373788, NULL, 'grade_decimalpoints', '2', NULL),
(116, 0, 1438373788, NULL, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime', NULL),
(117, 0, 1438373788, NULL, 'grade_report_studentsperpage', '100', NULL),
(118, 0, 1438373788, NULL, 'grade_report_showonlyactiveenrol', '1', NULL),
(119, 0, 1438373788, NULL, 'grade_report_quickgrading', '1', NULL),
(120, 0, 1438373788, NULL, 'grade_report_showquickfeedback', '0', NULL),
(121, 0, 1438373788, NULL, 'grade_report_fixedstudents', '0', NULL),
(122, 0, 1438373788, NULL, 'grade_report_meanselection', '1', NULL),
(123, 0, 1438373788, NULL, 'grade_report_enableajax', '0', NULL),
(124, 0, 1438373788, NULL, 'grade_report_showcalculations', '0', NULL),
(125, 0, 1438373788, NULL, 'grade_report_showeyecons', '0', NULL),
(126, 0, 1438373788, NULL, 'grade_report_showaverages', '1', NULL),
(127, 0, 1438373788, NULL, 'grade_report_showlocks', '0', NULL),
(128, 0, 1438373788, NULL, 'grade_report_showranges', '0', NULL),
(129, 0, 1438373788, NULL, 'grade_report_showanalysisicon', '1', NULL),
(130, 0, 1438373788, NULL, 'grade_report_showuserimage', '1', NULL),
(131, 0, 1438373788, NULL, 'grade_report_showactivityicons', '1', NULL),
(132, 0, 1438373788, NULL, 'grade_report_shownumberofgrades', '0', NULL),
(133, 0, 1438373788, NULL, 'grade_report_averagesdisplaytype', 'inherit', NULL),
(134, 0, 1438373788, NULL, 'grade_report_rangesdisplaytype', 'inherit', NULL),
(135, 0, 1438373788, NULL, 'grade_report_averagesdecimalpoints', 'inherit', NULL),
(136, 0, 1438373788, NULL, 'grade_report_rangesdecimalpoints', 'inherit', NULL),
(137, 0, 1438373788, NULL, 'grade_report_overview_showrank', '0', NULL),
(138, 0, 1438373788, NULL, 'grade_report_overview_showtotalsifcontainhidden', '0', NULL),
(139, 0, 1438373788, NULL, 'grade_report_user_showrank', '0', NULL),
(140, 0, 1438373788, NULL, 'grade_report_user_showpercentage', '1', NULL),
(141, 0, 1438373788, NULL, 'grade_report_user_showgrade', '1', NULL),
(142, 0, 1438373788, NULL, 'grade_report_user_showfeedback', '1', NULL),
(143, 0, 1438373788, NULL, 'grade_report_user_showrange', '1', NULL),
(144, 0, 1438373788, NULL, 'grade_report_user_showweight', '0', NULL),
(145, 0, 1438373788, NULL, 'grade_report_user_showaverage', '0', NULL),
(146, 0, 1438373788, NULL, 'grade_report_user_showlettergrade', '0', NULL),
(147, 0, 1438373788, NULL, 'grade_report_user_rangedecimals', '0', NULL),
(148, 0, 1438373788, NULL, 'grade_report_user_showhiddenitems', '1', NULL),
(149, 0, 1438373788, NULL, 'grade_report_user_showtotalsifcontainhidden', '0', NULL),
(150, 0, 1438373788, NULL, 'badges_defaultissuername', '', NULL),
(151, 0, 1438373788, NULL, 'badges_defaultissuercontact', '', NULL),
(152, 0, 1438373788, NULL, 'badges_badgesalt', 'badges1438373708', NULL),
(153, 0, 1438373788, NULL, 'badges_allowexternalbackpack', '1', NULL),
(154, 0, 1438373788, NULL, 'badges_allowcoursebadges', '1', NULL),
(155, 0, 1438373788, NULL, 'timezone', '99', NULL),
(156, 0, 1438373788, NULL, 'forcetimezone', '99', NULL),
(157, 0, 1438373789, NULL, 'country', '0', NULL),
(158, 0, 1438373789, NULL, 'defaultcity', '', NULL),
(159, 0, 1438373789, NULL, 'geoipfile', '/var/moodledata/geoip/GeoLiteCity.dat', NULL),
(160, 0, 1438373789, NULL, 'googlemapkey3', '', NULL),
(161, 0, 1438373789, NULL, 'allcountrycodes', '', NULL),
(162, 0, 1438373789, NULL, 'autolang', '1', NULL),
(163, 0, 1438373789, NULL, 'lang', 'en', NULL),
(164, 0, 1438373789, NULL, 'langmenu', '1', NULL),
(165, 0, 1438373789, NULL, 'langlist', '', NULL),
(166, 0, 1438373789, NULL, 'langcache', '1', NULL),
(167, 0, 1438373789, NULL, 'langstringcache', '1', NULL),
(168, 0, 1438373789, NULL, 'locale', '', NULL),
(169, 0, 1438373789, NULL, 'latinexcelexport', '0', NULL),
(170, 0, 1438373789, NULL, 'block_course_list_adminview', 'all', NULL),
(171, 0, 1438373789, NULL, 'block_course_list_hideallcourseslink', '0', NULL),
(172, 0, 1438373789, 'block_course_overview', 'defaultmaxcourses', '10', NULL),
(173, 0, 1438373789, 'block_course_overview', 'forcedefaultmaxcourses', '0', NULL),
(174, 0, 1438373789, 'block_course_overview', 'showchildren', '0', NULL),
(175, 0, 1438373789, 'block_course_overview', 'showwelcomearea', '0', NULL),
(176, 0, 1438373789, NULL, 'block_html_allowcssclasses', '0', NULL),
(177, 0, 1438373789, NULL, 'block_online_users_timetosee', '5', NULL),
(178, 0, 1438373789, NULL, 'block_rss_client_num_entries', '5', NULL),
(179, 0, 1438373789, NULL, 'block_rss_client_timeout', '30', NULL),
(180, 0, 1438373789, 'block_section_links', 'numsections1', '22', NULL),
(181, 0, 1438373789, 'block_section_links', 'incby1', '2', NULL),
(182, 0, 1438373789, 'block_section_links', 'numsections2', '40', NULL),
(183, 0, 1438373789, 'block_section_links', 'incby2', '5', NULL),
(184, 0, 1438373789, NULL, 'block_tags_showcoursetags', '0', NULL),
(185, 0, 1438373790, NULL, 'registerauth', '', NULL),
(186, 0, 1438373790, NULL, 'authpreventaccountcreation', '0', NULL),
(187, 0, 1438373790, NULL, 'loginpageautofocus', '0', NULL),
(188, 0, 1438373790, NULL, 'guestloginbutton', '1', NULL),
(189, 0, 1438373790, NULL, 'alternateloginurl', '', NULL),
(190, 0, 1438373790, NULL, 'forgottenpasswordurl', '', NULL),
(191, 0, 1438373790, NULL, 'auth_instructions', '', NULL),
(192, 0, 1438373790, NULL, 'allowemailaddresses', '', NULL),
(193, 0, 1438373790, NULL, 'denyemailaddresses', '', NULL),
(194, 0, 1438373790, NULL, 'verifychangedemail', '1', NULL),
(195, 0, 1438373790, NULL, 'recaptchapublickey', '', NULL),
(196, 0, 1438373790, NULL, 'recaptchaprivatekey', '', NULL),
(197, 0, 1438373790, 'enrol_database', 'dbtype', '', NULL),
(198, 0, 1438373790, 'enrol_database', 'dbhost', 'localhost', NULL),
(199, 0, 1438373790, 'enrol_database', 'dbuser', '', NULL),
(200, 0, 1438373790, 'enrol_database', 'dbpass', '', NULL),
(201, 0, 1438373790, 'enrol_database', 'dbname', '', NULL),
(202, 0, 1438373790, 'enrol_database', 'dbencoding', 'utf-8', NULL),
(203, 0, 1438373790, 'enrol_database', 'dbsetupsql', '', NULL),
(204, 0, 1438373790, 'enrol_database', 'dbsybasequoting', '0', NULL),
(205, 0, 1438373790, 'enrol_database', 'debugdb', '0', NULL),
(206, 0, 1438373790, 'enrol_database', 'localcoursefield', 'idnumber', NULL),
(207, 0, 1438373790, 'enrol_database', 'localuserfield', 'idnumber', NULL),
(208, 0, 1438373790, 'enrol_database', 'localrolefield', 'shortname', NULL),
(209, 0, 1438373790, 'enrol_database', 'localcategoryfield', 'id', NULL),
(210, 0, 1438373790, 'enrol_database', 'remoteenroltable', '', NULL),
(211, 0, 1438373790, 'enrol_database', 'remotecoursefield', '', NULL),
(212, 0, 1438373790, 'enrol_database', 'remoteuserfield', '', NULL),
(213, 0, 1438373790, 'enrol_database', 'remoterolefield', '', NULL),
(214, 0, 1438373790, 'enrol_database', 'ignorehiddencourses', '0', NULL),
(215, 0, 1438373790, 'enrol_database', 'unenrolaction', '0', NULL),
(216, 0, 1438373790, 'enrol_database', 'newcoursetable', '', NULL),
(217, 0, 1438373790, 'enrol_database', 'newcoursefullname', 'fullname', NULL),
(218, 0, 1438373790, 'enrol_database', 'newcourseshortname', 'shortname', NULL),
(219, 0, 1438373790, 'enrol_database', 'newcourseidnumber', 'idnumber', NULL),
(220, 0, 1438373790, 'enrol_database', 'newcoursecategory', '', NULL),
(221, 0, 1438373790, 'enrol_database', 'templatecourse', '', NULL),
(222, 0, 1438373790, 'enrol_flatfile', 'location', '', NULL),
(223, 0, 1438373790, 'enrol_flatfile', 'encoding', 'UTF-8', NULL),
(224, 0, 1438373790, 'enrol_flatfile', 'mailstudents', '0', NULL),
(225, 0, 1438373790, 'enrol_flatfile', 'mailteachers', '0', NULL),
(226, 0, 1438373790, 'enrol_flatfile', 'mailadmins', '0', NULL),
(227, 0, 1438373790, 'enrol_flatfile', 'unenrolaction', '3', NULL),
(228, 0, 1438373790, 'enrol_flatfile', 'expiredaction', '3', NULL),
(229, 0, 1438373791, 'enrol_guest', 'requirepassword', '0', NULL),
(230, 0, 1438373791, 'enrol_guest', 'usepasswordpolicy', '0', NULL),
(231, 0, 1438373791, 'enrol_guest', 'showhint', '0', NULL),
(232, 0, 1438373791, 'enrol_guest', 'defaultenrol', '1', NULL),
(233, 0, 1438373791, 'enrol_guest', 'status', '1', NULL),
(234, 0, 1438373791, 'enrol_guest', 'status_adv', '0', NULL),
(235, 0, 1438373791, 'enrol_imsenterprise', 'imsfilelocation', '', NULL),
(236, 0, 1438373791, 'enrol_imsenterprise', 'logtolocation', '', NULL),
(237, 0, 1438373791, 'enrol_imsenterprise', 'mailadmins', '0', NULL),
(238, 0, 1438373791, 'enrol_imsenterprise', 'createnewusers', '0', NULL),
(239, 0, 1438373791, 'enrol_imsenterprise', 'imsdeleteusers', '0', NULL),
(240, 0, 1438373791, 'enrol_imsenterprise', 'fixcaseusernames', '0', NULL),
(241, 0, 1438373791, 'enrol_imsenterprise', 'fixcasepersonalnames', '0', NULL),
(242, 0, 1438373791, 'enrol_imsenterprise', 'imssourcedidfallback', '0', NULL),
(243, 0, 1438373791, 'enrol_imsenterprise', 'truncatecoursecodes', '0', NULL),
(244, 0, 1438373791, 'enrol_imsenterprise', 'createnewcourses', '0', NULL),
(245, 0, 1438373791, 'enrol_imsenterprise', 'createnewcategories', '0', NULL),
(246, 0, 1438373791, 'enrol_imsenterprise', 'imsunenrol', '0', NULL),
(247, 0, 1438373791, 'enrol_imsenterprise', 'imsrestricttarget', '', NULL),
(248, 0, 1438373791, 'enrol_imsenterprise', 'imscapitafix', '0', NULL),
(249, 0, 1438373791, 'enrol_manual', 'expiredaction', '1', NULL),
(250, 0, 1438373791, 'enrol_manual', 'expirynotifyhour', '6', NULL),
(251, 0, 1438373791, 'enrol_manual', 'defaultenrol', '1', NULL),
(252, 0, 1438373791, 'enrol_manual', 'status', '0', NULL),
(253, 0, 1438373791, 'enrol_manual', 'enrolperiod', '0', NULL),
(254, 0, 1438373791, 'enrol_manual', 'expirynotify', '0', NULL),
(255, 0, 1438373791, 'enrol_manual', 'expirythreshold', '86400', NULL),
(256, 0, 1438373791, 'enrol_paypal', 'paypalbusiness', '', NULL),
(257, 0, 1438373791, 'enrol_paypal', 'mailstudents', '0', NULL),
(258, 0, 1438373791, 'enrol_paypal', 'mailteachers', '0', NULL),
(259, 0, 1438373791, 'enrol_paypal', 'mailadmins', '0', NULL),
(260, 0, 1438373791, 'enrol_paypal', 'expiredaction', '3', NULL),
(261, 0, 1438373791, 'enrol_paypal', 'status', '1', NULL),
(262, 0, 1438373791, 'enrol_paypal', 'cost', '0', NULL),
(263, 0, 1438373791, 'enrol_paypal', 'currency', 'USD', NULL),
(264, 0, 1438373791, 'enrol_paypal', 'enrolperiod', '0', NULL),
(265, 0, 1438373791, 'enrol_self', 'requirepassword', '0', NULL),
(266, 0, 1438373791, 'enrol_self', 'usepasswordpolicy', '0', NULL),
(267, 0, 1438373791, 'enrol_self', 'showhint', '0', NULL),
(268, 0, 1438373791, 'enrol_self', 'expiredaction', '1', NULL),
(269, 0, 1438373791, 'enrol_self', 'expirynotifyhour', '6', NULL),
(270, 0, 1438373791, 'enrol_self', 'defaultenrol', '1', NULL),
(271, 0, 1438373791, 'enrol_self', 'status', '1', NULL),
(272, 0, 1438373791, 'enrol_self', 'newenrols', '1', NULL),
(273, 0, 1438373792, 'enrol_self', 'groupkey', '0', NULL),
(274, 0, 1438373792, 'enrol_self', 'enrolperiod', '0', NULL),
(275, 0, 1438373792, 'enrol_self', 'expirynotify', '0', NULL),
(276, 0, 1438373792, 'enrol_self', 'expirythreshold', '86400', NULL),
(277, 0, 1438373792, 'enrol_self', 'longtimenosee', '0', NULL),
(278, 0, 1438373792, 'enrol_self', 'maxenrolled', '0', NULL),
(279, 0, 1438373792, 'enrol_self', 'sendcoursewelcomemessage', '1', NULL),
(280, 0, 1438373792, 'editor_tinymce', 'customtoolbar', 'fontselect,fontsizeselect,formatselect,|,undo,redo,|,search,replace,|,fullscreen\n\nbold,italic,underline,strikethrough,sub,sup,|,justifyleft,justifycenter,justifyright,|,cleanup,removeformat,pastetext,pasteword,|,forecolor,backcolor,|,ltr,rtl\n\nbullist,numlist,outdent,indent,|,link,unlink,|,image,nonbreaking,charmap,table,|,code', NULL),
(281, 0, 1438373792, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings', NULL),
(282, 0, 1438373792, 'editor_tinymce', 'customconfig', '', NULL),
(283, 0, 1438373792, 'tinymce_dragmath', 'requiretex', '1', NULL),
(284, 0, 1438373792, 'tinymce_moodleemoticon', 'requireemoticon', '1', NULL),
(285, 0, 1438373792, 'tinymce_spellchecker', 'spellengine', '', NULL),
(286, 0, 1438373792, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv', NULL),
(287, 0, 1438373792, NULL, 'sitedefaultlicense', 'allrightsreserved', NULL),
(288, 0, 1438373792, NULL, 'cachetext', '60', NULL),
(289, 0, 1438373792, NULL, 'filteruploadedfiles', '0', NULL),
(290, 0, 1438373792, NULL, 'filtermatchoneperpage', '0', NULL),
(291, 0, 1438373792, NULL, 'filtermatchonepertext', '0', NULL),
(292, 0, 1438373792, 'filter_urltolink', 'formats', '0', NULL),
(293, 0, 1438373792, 'filter_urltolink', 'embedimages', '1', NULL),
(294, 0, 1438373792, 'filter_emoticon', 'formats', '1,4,0', NULL),
(295, 0, 1438373792, NULL, 'filter_multilang_force_old', '0', NULL),
(296, 0, 1438373792, NULL, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n', NULL),
(297, 0, 1438373796, NULL, 'filter_tex_latexbackground', '#FFFFFF', NULL),
(298, 0, 1438373796, NULL, 'filter_tex_density', '120', NULL),
(299, 0, 1438373796, NULL, 'filter_tex_pathlatex', '/usr/bin/latex', NULL),
(300, 0, 1438373796, NULL, 'filter_tex_pathdvips', '/usr/bin/dvips', NULL),
(301, 0, 1438373796, NULL, 'filter_tex_pathconvert', '/usr/bin/convert', NULL),
(302, 0, 1438373796, NULL, 'filter_tex_convertformat', 'gif', NULL),
(303, 0, 1438373796, NULL, 'filter_censor_badwords', '', NULL),
(304, 0, 1438373796, NULL, 'portfolio_moderate_filesize_threshold', '1048576', NULL),
(305, 0, 1438373796, NULL, 'portfolio_high_filesize_threshold', '5242880', NULL),
(306, 0, 1438373796, NULL, 'portfolio_moderate_db_threshold', '20', NULL),
(307, 0, 1438373796, NULL, 'portfolio_high_db_threshold', '50', NULL),
(308, 0, 1438373796, NULL, 'repositorycacheexpire', '120', NULL),
(309, 0, 1438373796, NULL, 'repositoryallowexternallinks', '1', NULL),
(310, 0, 1438373796, NULL, 'legacyfilesinnewcourses', '0', NULL),
(311, 0, 1438373796, NULL, 'mobilecssurl', '', NULL),
(312, 0, 1438373796, NULL, 'enablewsdocumentation', '0', NULL),
(313, 0, 1438373799, 'question_preview', 'behaviour', 'deferredfeedback', NULL),
(314, 0, 1438373799, 'question_preview', 'correctness', '1', NULL),
(315, 0, 1438373799, 'question_preview', 'marks', '1', NULL),
(316, 0, 1438373799, 'question_preview', 'markdp', '2', NULL),
(317, 0, 1438373799, 'question_preview', 'feedback', '1', NULL),
(318, 0, 1438373799, 'question_preview', 'generalfeedback', '1', NULL),
(319, 0, 1438373799, 'question_preview', 'rightanswer', '1', NULL),
(320, 0, 1438373799, 'question_preview', 'history', '0', NULL),
(321, 0, 1438373799, 'cachestore_memcache', 'testservers', '', NULL),
(322, 0, 1438373799, 'cachestore_memcached', 'testservers', '', NULL),
(323, 0, 1438373799, 'cachestore_mongodb', 'testserver', '', NULL),
(324, 0, 1438373799, NULL, 'allowbeforeblock', '0', NULL),
(325, 0, 1438373799, NULL, 'allowedip', '', NULL),
(326, 0, 1438373799, NULL, 'blockedip', '', NULL),
(327, 0, 1438373799, NULL, 'protectusernames', '1', NULL),
(328, 0, 1438373799, NULL, 'forcelogin', '0', NULL),
(329, 0, 1438373799, NULL, 'forceloginforprofiles', '1', NULL),
(330, 0, 1438373799, NULL, 'forceloginforprofileimage', '0', NULL),
(331, 0, 1438373799, NULL, 'opentogoogle', '0', NULL),
(332, 0, 1438373799, NULL, 'maxbytes', '0', NULL),
(333, 0, 1438373799, NULL, 'userquota', '104857600', NULL),
(334, 0, 1438373799, NULL, 'allowobjectembed', '0', NULL),
(335, 0, 1438373799, NULL, 'enabletrusttext', '0', NULL),
(336, 0, 1438373799, NULL, 'maxeditingtime', '1800', NULL),
(337, 0, 1438373799, NULL, 'fullnamedisplay', 'language', NULL),
(338, 0, 1438373799, NULL, 'extendedusernamechars', '0', NULL),
(339, 0, 1438373799, NULL, 'sitepolicy', '', NULL),
(340, 0, 1438373799, NULL, 'sitepolicyguest', '', NULL),
(341, 0, 1438373799, NULL, 'keeptagnamecase', '1', NULL),
(342, 0, 1438373799, NULL, 'profilesforenrolledusersonly', '1', NULL),
(343, 0, 1438373799, NULL, 'cronclionly', '0', NULL),
(344, 0, 1438373799, NULL, 'cronremotepassword', '', NULL),
(345, 0, 1438373799, NULL, 'lockoutthreshold', '0', NULL),
(346, 0, 1438373799, NULL, 'lockoutwindow', '1800', NULL),
(347, 0, 1438373799, NULL, 'lockoutduration', '1800', NULL),
(348, 0, 1438373799, NULL, 'passwordpolicy', '1', NULL),
(349, 0, 1438373799, NULL, 'minpasswordlength', '8', NULL),
(350, 0, 1438373799, NULL, 'minpassworddigits', '1', NULL),
(351, 0, 1438373799, NULL, 'minpasswordlower', '1', NULL),
(352, 0, 1438373799, NULL, 'minpasswordupper', '1', NULL),
(353, 0, 1438373799, NULL, 'minpasswordnonalphanum', '1', NULL),
(354, 0, 1438373799, NULL, 'maxconsecutiveidentchars', '0', NULL),
(355, 0, 1438373799, NULL, 'groupenrolmentkeypolicy', '1', NULL),
(356, 0, 1438373799, NULL, 'disableuserimages', '0', NULL),
(357, 0, 1438373799, NULL, 'emailchangeconfirmation', '1', NULL),
(358, 0, 1438373799, NULL, 'rememberusername', '2', NULL),
(359, 0, 1438373799, NULL, 'strictformsrequired', '0', NULL),
(360, 0, 1438373799, NULL, 'loginhttps', '0', NULL),
(361, 0, 1438373800, NULL, 'cookiesecure', '0', NULL),
(362, 0, 1438373800, NULL, 'cookiehttponly', '0', NULL),
(363, 0, 1438373800, NULL, 'allowframembedding', '0', NULL),
(364, 0, 1438373800, NULL, 'loginpasswordautocomplete', '0', NULL),
(365, 0, 1438373800, NULL, 'displayloginfailures', '', NULL),
(366, 0, 1438373800, NULL, 'notifyloginfailures', '', NULL),
(367, 0, 1438373800, NULL, 'notifyloginthreshold', '10', NULL),
(368, 0, 1438373800, NULL, 'runclamonupload', '0', NULL),
(369, 0, 1438373800, NULL, 'pathtoclam', '', NULL),
(370, 0, 1438373800, NULL, 'quarantinedir', '', NULL),
(371, 0, 1438373800, NULL, 'clamfailureonupload', 'donothing', NULL),
(372, 0, 1438373800, NULL, 'themelist', '', NULL),
(373, 0, 1438373800, NULL, 'themedesignermode', '0', NULL),
(374, 0, 1438373800, NULL, 'allowuserthemes', '0', NULL),
(375, 0, 1438373800, NULL, 'allowcoursethemes', '0', NULL),
(376, 0, 1438373800, NULL, 'allowcategorythemes', '0', NULL),
(377, 0, 1438373800, NULL, 'allowthemechangeonurl', '0', NULL),
(378, 0, 1438373800, NULL, 'allowuserblockhiding', '1', NULL),
(379, 0, 1438373800, NULL, 'allowblockstodock', '1', NULL),
(380, 0, 1438373800, NULL, 'custommenuitems', '', NULL),
(381, 0, 1438373800, NULL, 'enabledevicedetection', '1', NULL),
(382, 0, 1438373800, NULL, 'devicedetectregex', '[]', NULL),
(383, 0, 1438373800, 'theme_afterburner', 'logo', '', NULL),
(384, 0, 1438373800, 'theme_afterburner', 'footnote', '', NULL),
(385, 0, 1438373800, 'theme_afterburner', 'customcss', '', NULL),
(386, 0, 1438373800, 'theme_anomaly', 'tagline', '', NULL),
(387, 0, 1438373800, 'theme_anomaly', 'customcss', '', NULL),
(388, 0, 1438373800, 'theme_arialist', 'logo', '', NULL),
(389, 0, 1438373800, 'theme_arialist', 'tagline', '', NULL),
(390, 0, 1438373800, 'theme_arialist', 'linkcolor', '#f25f0f', NULL),
(391, 0, 1438373800, 'theme_arialist', 'regionwidth', '250', NULL),
(392, 0, 1438373801, 'theme_arialist', 'customcss', '', NULL),
(393, 0, 1438373801, 'theme_brick', 'logo', '', NULL),
(394, 0, 1438373801, 'theme_brick', 'linkcolor', '#06365b', NULL),
(395, 0, 1438373801, 'theme_brick', 'linkhover', '#5487ad', NULL),
(396, 0, 1438373801, 'theme_brick', 'maincolor', '#8e2800', NULL),
(397, 0, 1438373801, 'theme_brick', 'maincolorlink', '#fff0a5', NULL),
(398, 0, 1438373801, 'theme_brick', 'headingcolor', '#5c3500', NULL),
(399, 0, 1438373801, 'theme_clean', 'invert', '0', NULL),
(400, 0, 1438373801, 'theme_clean', 'logo', '', NULL),
(401, 0, 1438373801, 'theme_clean', 'customcss', '', NULL),
(402, 0, 1438373801, 'theme_clean', 'footnote', '', NULL),
(403, 0, 1438373801, 'theme_formal_white', 'fontsizereference', '13', NULL),
(404, 0, 1438373801, 'theme_formal_white', 'noframe', '0', NULL),
(405, 0, 1438373801, 'theme_formal_white', 'framemargin', '15', NULL),
(406, 0, 1438373801, 'theme_formal_white', 'headercontent', '1', NULL),
(407, 0, 1438373801, 'theme_formal_white', 'customlogourl', '', NULL),
(408, 0, 1438373801, 'theme_formal_white', 'frontpagelogourl', '', NULL),
(409, 0, 1438373801, 'theme_formal_white', 'headerbgc', '#E3DFD4', NULL),
(410, 0, 1438373801, 'theme_formal_white', 'creditstomoodleorg', '2', NULL),
(411, 0, 1438373801, 'theme_formal_white', 'blockcolumnwidth', '200', NULL),
(412, 0, 1438373801, 'theme_formal_white', 'blockpadding', '8', NULL),
(413, 0, 1438373801, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6', NULL),
(414, 0, 1438373801, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4', NULL),
(415, 0, 1438373801, 'theme_formal_white', 'rblockcolumnbgc', '', NULL),
(416, 0, 1438373801, 'theme_formal_white', 'footnote', '', NULL),
(417, 0, 1438373801, 'theme_formal_white', 'customcss', '', NULL),
(418, 0, 1438373801, 'theme_fusion', 'linkcolor', '#2d83d5', NULL),
(419, 0, 1438373801, 'theme_fusion', 'tagline', '', NULL),
(420, 0, 1438373801, 'theme_fusion', 'footertext', '', NULL),
(421, 0, 1438373801, 'theme_fusion', 'customcss', '', NULL),
(422, 0, 1438373801, 'theme_magazine', 'background', '', NULL),
(423, 0, 1438373801, 'theme_magazine', 'logo', '', NULL),
(424, 0, 1438373801, 'theme_magazine', 'linkcolor', '#32529a', NULL),
(425, 0, 1438373801, 'theme_magazine', 'linkhover', '#4e2300', NULL),
(426, 0, 1438373801, 'theme_magazine', 'maincolor', '#002f2f', NULL),
(427, 0, 1438373801, 'theme_magazine', 'maincoloraccent', '#092323', NULL),
(428, 0, 1438373801, 'theme_magazine', 'headingcolor', '#4e0000', NULL),
(429, 0, 1438373801, 'theme_magazine', 'blockcolor', '#002f2f', NULL),
(430, 0, 1438373801, 'theme_magazine', 'forumback', '#e6e2af', NULL),
(431, 0, 1438373802, 'theme_mymobile', 'colourswatch', 'light', NULL),
(432, 0, 1438373802, 'theme_mymobile', 'showmobileintro', '', NULL),
(433, 0, 1438373802, 'theme_mymobile', 'showsitetopic', 'topicshow', NULL),
(434, 0, 1438373802, 'theme_mymobile', 'showfullsizeimages', 'ithumb', NULL),
(435, 0, 1438373802, 'theme_mymobile', 'usetableview', 'tabshow', NULL),
(436, 0, 1438373802, 'theme_mymobile', 'customcss', '', NULL),
(437, 0, 1438373802, 'theme_nimble', 'tagline', '', NULL),
(438, 0, 1438373802, 'theme_nimble', 'footerline', '', NULL),
(439, 0, 1438373802, 'theme_nimble', 'backgroundcolor', '#454545', NULL),
(440, 0, 1438373802, 'theme_nimble', 'linkcolor', '#2a65b1', NULL),
(441, 0, 1438373802, 'theme_nimble', 'linkhover', '#222222', NULL),
(442, 0, 1438373802, 'theme_nonzero', 'regionprewidth', '200', NULL),
(443, 0, 1438373802, 'theme_nonzero', 'regionpostwidth', '200', NULL),
(444, 0, 1438373802, 'theme_nonzero', 'customcss', '', NULL),
(445, 0, 1438373802, 'theme_overlay', 'linkcolor', '#428ab5', NULL),
(446, 0, 1438373802, 'theme_overlay', 'headercolor', '#2a4c7b', NULL),
(447, 0, 1438373802, 'theme_overlay', 'footertext', '', NULL),
(448, 0, 1438373802, 'theme_overlay', 'customcss', '', NULL),
(449, 0, 1438373802, 'theme_sky_high', 'logo', '', NULL),
(450, 0, 1438373802, 'theme_sky_high', 'regionwidth', '240', NULL),
(451, 0, 1438373802, 'theme_sky_high', 'footnote', '', NULL),
(452, 0, 1438373802, 'theme_sky_high', 'customcss', '', NULL),
(453, 0, 1438373802, 'theme_splash', 'logo', '', NULL),
(454, 0, 1438373802, 'theme_splash', 'tagline', 'Virtual learning center', NULL),
(455, 0, 1438373802, 'theme_splash', 'hide_tagline', '0', NULL),
(456, 0, 1438373802, 'theme_splash', 'footnote', '', NULL),
(457, 0, 1438373802, 'theme_splash', 'customcss', '', NULL),
(458, 0, 1438373802, NULL, 'calendar_adminseesall', '0', NULL),
(459, 0, 1438373802, NULL, 'calendar_site_timeformat', '0', NULL),
(460, 0, 1438373802, NULL, 'calendar_startwday', '0', NULL),
(461, 0, 1438373802, NULL, 'calendar_weekend', '65', NULL),
(462, 0, 1438373802, NULL, 'calendar_lookahead', '21', NULL),
(463, 0, 1438373802, NULL, 'calendar_maxevents', '10', NULL),
(464, 0, 1438373802, NULL, 'enablecalendarexport', '1', NULL),
(465, 0, 1438373802, NULL, 'calendar_customexport', '1', NULL),
(466, 0, 1438373802, NULL, 'calendar_exportlookahead', '365', NULL),
(467, 0, 1438373802, NULL, 'calendar_exportlookback', '5', NULL),
(468, 0, 1438373802, NULL, 'calendar_exportsalt', 'O3gJ5NKOhixeRPUx3Jr3m0cyIIR21OAnBEd92UUotQgs6i7sswEXtbJU9TqY', NULL),
(469, 0, 1438373802, NULL, 'calendar_showicalsource', '1', NULL),
(470, 0, 1438373802, NULL, 'useblogassociations', '1', NULL),
(471, 0, 1438373802, NULL, 'bloglevel', '4', NULL),
(472, 0, 1438373802, NULL, 'useexternalblogs', '1', NULL),
(473, 0, 1438373802, NULL, 'externalblogcrontime', '86400', NULL),
(474, 0, 1438373802, NULL, 'maxexternalblogsperuser', '1', NULL),
(475, 0, 1438373802, NULL, 'blogusecomments', '1', NULL),
(476, 0, 1438373802, NULL, 'blogshowcommentscount', '1', NULL),
(477, 0, 1438373802, NULL, 'defaulthomepage', '0', NULL),
(478, 0, 1438373802, NULL, 'allowguestmymoodle', '1', NULL),
(479, 0, 1438373802, NULL, 'navshowfullcoursenames', '0', NULL),
(480, 0, 1438373802, NULL, 'navshowcategories', '1', NULL),
(481, 0, 1438373802, NULL, 'navshowmycoursecategories', '0', NULL),
(482, 0, 1438373802, NULL, 'navshowallcourses', '0', NULL),
(483, 0, 1438373802, NULL, 'navsortmycoursessort', 'sortorder', NULL),
(484, 0, 1438373802, NULL, 'navcourselimit', '20', NULL),
(485, 0, 1438373802, NULL, 'usesitenameforsitepages', '0', NULL),
(486, 0, 1438373802, NULL, 'linkadmincategories', '0', NULL),
(487, 0, 1438373802, NULL, 'navshowfrontpagemods', '1', NULL),
(488, 0, 1438373802, NULL, 'navadduserpostslinks', '1', NULL),
(489, 0, 1438373803, NULL, 'formatstringstriptags', '1', NULL),
(490, 0, 1438373803, NULL, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]', NULL),
(491, 0, 1438373803, NULL, 'core_media_enable_youtube', '1', NULL),
(492, 0, 1438373803, NULL, 'core_media_enable_vimeo', '0', NULL),
(493, 0, 1438373803, NULL, 'core_media_enable_mp3', '1', NULL),
(494, 0, 1438373803, NULL, 'core_media_enable_flv', '1', NULL),
(495, 0, 1438373803, NULL, 'core_media_enable_swf', '1', NULL),
(496, 0, 1438373803, NULL, 'core_media_enable_html5audio', '1', NULL),
(497, 0, 1438373803, NULL, 'core_media_enable_html5video', '1', NULL),
(498, 0, 1438373803, NULL, 'core_media_enable_qt', '1', NULL),
(499, 0, 1438373803, NULL, 'core_media_enable_wmp', '1', NULL),
(500, 0, 1438373803, NULL, 'core_media_enable_rm', '1', NULL),
(501, 0, 1438373803, NULL, 'docroot', 'http://docs.moodle.org', NULL),
(502, 0, 1438373803, NULL, 'doctonewwindow', '0', NULL),
(503, 0, 1438373803, NULL, 'courselistshortnames', '0', NULL),
(504, 0, 1438373803, NULL, 'coursesperpage', '20', NULL),
(505, 0, 1438373803, NULL, 'courseswithsummarieslimit', '10', NULL),
(506, 0, 1438373803, NULL, 'courseoverviewfileslimit', '1', NULL),
(507, 0, 1438373803, NULL, 'courseoverviewfilesext', '.jpg,.gif,.png', NULL),
(508, 0, 1438373803, NULL, 'enableajax', '1', NULL),
(509, 0, 1438373803, NULL, 'useexternalyui', '0', NULL),
(510, 0, 1438373803, NULL, 'yuicomboloading', '1', NULL),
(511, 0, 1438373803, NULL, 'cachejs', '1', NULL),
(512, 0, 1438373803, NULL, 'modchooserdefault', '1', NULL),
(513, 0, 1438373803, NULL, 'additionalhtmlhead', '', NULL),
(514, 0, 1438373803, NULL, 'additionalhtmltopofbody', '', NULL),
(515, 0, 1438373803, NULL, 'additionalhtmlfooter', '', NULL),
(516, 0, 1438373803, NULL, 'pathtodu', '', NULL),
(517, 0, 1438373803, NULL, 'aspellpath', '', NULL),
(518, 0, 1438373803, NULL, 'pathtodot', '', NULL),
(519, 0, 1438373803, NULL, 'supportpage', '', NULL),
(520, 0, 1438373803, NULL, 'dbsessions', '1', NULL),
(521, 0, 1438373803, NULL, 'sessioncookie', '', NULL),
(522, 0, 1438373803, NULL, 'sessioncookiepath', '', NULL),
(523, 0, 1438373803, NULL, 'sessioncookiedomain', '', NULL),
(524, 0, 1438373803, NULL, 'statsfirstrun', 'none', NULL),
(525, 0, 1438373803, NULL, 'statsmaxruntime', '0', NULL),
(526, 0, 1438373803, NULL, 'statsruntimedays', '31', NULL),
(527, 0, 1438373803, NULL, 'statsruntimestarthour', '0', NULL),
(528, 0, 1438373803, NULL, 'statsruntimestartminute', '0', NULL),
(529, 0, 1438373803, NULL, 'statsuserthreshold', '0', NULL),
(530, 0, 1438373803, NULL, 'slasharguments', '1', NULL),
(531, 0, 1438373803, NULL, 'getremoteaddrconf', '0', NULL),
(532, 0, 1438373803, NULL, 'proxyhost', '', NULL),
(533, 0, 1438373803, NULL, 'proxyport', '0', NULL),
(534, 0, 1438373804, NULL, 'proxytype', 'HTTP', NULL),
(535, 0, 1438373804, NULL, 'proxyuser', '', NULL),
(536, 0, 1438373804, NULL, 'proxypassword', '', NULL),
(537, 0, 1438373804, NULL, 'proxybypass', 'localhost, 127.0.0.1', NULL),
(538, 0, 1438373804, NULL, 'maintenance_enabled', '0', NULL),
(539, 0, 1438373804, NULL, 'maintenance_message', '', NULL),
(540, 0, 1438373804, NULL, 'deleteunconfirmed', '168', NULL),
(541, 0, 1438373804, NULL, 'deleteincompleteusers', '0', NULL),
(542, 0, 1438373804, NULL, 'logguests', '1', NULL),
(543, 0, 1438373804, NULL, 'loglifetime', '0', NULL),
(544, 0, 1438373804, NULL, 'disablegradehistory', '0', NULL),
(545, 0, 1438373804, NULL, 'gradehistorylifetime', '0', NULL),
(546, 0, 1438373804, NULL, 'extramemorylimit', '512M', NULL),
(547, 0, 1438373804, NULL, 'curlcache', '120', NULL),
(548, 0, 1438373804, NULL, 'curltimeoutkbitrate', '56', NULL),
(549, 0, 1438373804, NULL, 'updateautocheck', '1', NULL),
(550, 0, 1438373804, NULL, 'updateautodeploy', '0', NULL),
(551, 0, 1438373804, NULL, 'updateminmaturity', '200', NULL),
(552, 0, 1438373804, NULL, 'updatenotifybuilds', '0', NULL),
(553, 0, 1438373804, NULL, 'enablesafebrowserintegration', '0', NULL),
(554, 0, 1438373804, NULL, 'enablegroupmembersonly', '0', NULL),
(555, 0, 1438373804, NULL, 'dndallowtextandlinks', '0', NULL),
(556, 0, 1438373804, NULL, 'enablecssoptimiser', '0', NULL),
(557, 0, 1438373804, NULL, 'debug', '0', NULL),
(558, 0, 1438373804, NULL, 'debugdisplay', '0', NULL),
(559, 0, 1438373804, NULL, 'debugsmtp', '0', NULL),
(560, 0, 1438373804, NULL, 'perfdebug', '7', NULL),
(561, 0, 1438373804, NULL, 'debugstringids', '0', NULL),
(562, 0, 1438373804, NULL, 'debugvalidators', '0', NULL),
(563, 0, 1438373804, NULL, 'debugpageinfo', '0', NULL),
(564, 0, 1438373804, NULL, 'profilingenabled', '0', NULL),
(565, 0, 1438373804, NULL, 'profilingincluded', '', NULL),
(566, 0, 1438373804, NULL, 'profilingexcluded', '', NULL),
(567, 0, 1438373804, NULL, 'profilingautofrec', '0', NULL),
(568, 0, 1438373804, NULL, 'profilingallowme', '0', NULL),
(569, 0, 1438373804, NULL, 'profilingallowall', '0', NULL),
(570, 0, 1438373804, NULL, 'profilinglifetime', '1440', NULL),
(571, 0, 1438373804, NULL, 'profilingimportprefix', '(I)', NULL),
(572, 2, 1438375369, NULL, 'notloggedinroleid', '6', NULL),
(573, 2, 1438375369, NULL, 'guestroleid', '6', NULL),
(574, 2, 1438375369, NULL, 'defaultuserroleid', '7', NULL),
(575, 2, 1438375369, NULL, 'creatornewroleid', '3', NULL),
(576, 2, 1438375369, NULL, 'restorernewroleid', '3', NULL),
(577, 2, 1438375369, NULL, 'gradebookroles', '5', NULL),
(578, 2, 1438375369, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments', NULL),
(579, 2, 1438375369, 'assign', 'showrecentsubmissions', '0', NULL),
(580, 2, 1438375369, 'assign', 'submissionreceipts', '1', NULL),
(581, 2, 1438375369, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.', NULL),
(582, 2, 1438375369, 'assign', 'requiresubmissionstatement', '0', NULL),
(583, 2, 1438375369, NULL, 'assignment_maxbytes', '1048576', NULL),
(584, 2, 1438375369, NULL, 'assignment_itemstocount', '1', NULL),
(585, 2, 1438375369, NULL, 'assignment_showrecentsubmissions', '1', NULL),
(586, 2, 1438375369, 'book', 'requiremodintro', '1', NULL),
(587, 2, 1438375369, 'book', 'numberingoptions', '0,1,2,3', NULL),
(588, 2, 1438375369, 'book', 'numbering', '1', NULL),
(589, 2, 1438375369, NULL, 'chat_method', 'ajax', NULL),
(590, 2, 1438375369, NULL, 'chat_refresh_userlist', '10', NULL),
(591, 2, 1438375369, NULL, 'chat_old_ping', '35', NULL),
(592, 2, 1438375369, NULL, 'chat_refresh_room', '5', NULL),
(593, 2, 1438375369, NULL, 'chat_normal_updatemode', 'jsupdate', NULL),
(594, 2, 1438375369, NULL, 'chat_serverhost', 'localhost', NULL),
(595, 2, 1438375369, NULL, 'chat_serverip', '127.0.0.1', NULL),
(596, 2, 1438375369, NULL, 'chat_serverport', '9111', NULL),
(597, 2, 1438375369, NULL, 'chat_servermax', '100', NULL),
(598, 2, 1438375369, NULL, 'data_enablerssfeeds', '0', NULL),
(599, 2, 1438375369, NULL, 'feedback_allowfullanonymous', '0', NULL),
(600, 2, 1438375369, 'folder', 'requiremodintro', '1', NULL),
(601, 2, 1438375369, 'folder', 'showexpanded', '1', NULL),
(602, 2, 1438375369, NULL, 'forum_displaymode', '3', NULL),
(603, 2, 1438375369, NULL, 'forum_replytouser', '1', NULL),
(604, 2, 1438375369, NULL, 'forum_shortpost', '300', NULL),
(605, 2, 1438375369, NULL, 'forum_longpost', '600', NULL),
(606, 2, 1438375369, NULL, 'forum_manydiscussions', '100', NULL),
(607, 2, 1438375369, NULL, 'forum_maxbytes', '512000', NULL),
(608, 2, 1438375369, NULL, 'forum_maxattachments', '9', NULL),
(609, 2, 1438375369, NULL, 'forum_trackreadposts', '1', NULL),
(610, 2, 1438375369, NULL, 'forum_oldpostdays', '14', NULL),
(611, 2, 1438375370, NULL, 'forum_usermarksread', '0', NULL),
(612, 2, 1438375370, NULL, 'forum_cleanreadtime', '2', NULL),
(613, 2, 1438375370, NULL, 'digestmailtime', '17', NULL),
(614, 2, 1438375370, NULL, 'forum_enablerssfeeds', '0', NULL),
(615, 2, 1438375370, NULL, 'forum_enabletimedposts', '0', NULL),
(616, 2, 1438375370, NULL, 'glossary_entbypage', '10', NULL),
(617, 2, 1438375370, NULL, 'glossary_dupentries', '0', NULL),
(618, 2, 1438375370, NULL, 'glossary_allowcomments', '0', NULL),
(619, 2, 1438375370, NULL, 'glossary_linkbydefault', '1', NULL),
(620, 2, 1438375370, NULL, 'glossary_defaultapproval', '1', NULL),
(621, 2, 1438375370, NULL, 'glossary_enablerssfeeds', '0', NULL),
(622, 2, 1438375370, NULL, 'glossary_linkentries', '0', NULL),
(623, 2, 1438375370, NULL, 'glossary_casesensitive', '0', NULL),
(624, 2, 1438375370, NULL, 'glossary_fullmatch', '0', NULL),
(625, 2, 1438375370, 'imscp', 'requiremodintro', '1', NULL),
(626, 2, 1438375370, 'imscp', 'keepold', '1', NULL),
(627, 2, 1438375370, 'imscp', 'keepold_adv', '0', NULL),
(628, 2, 1438375370, 'label', 'dndmedia', '1', NULL),
(629, 2, 1438375370, 'label', 'dndresizewidth', '400', NULL),
(630, 2, 1438375370, 'label', 'dndresizeheight', '400', NULL),
(631, 2, 1438375370, NULL, 'lesson_slideshowwidth', '640', NULL),
(632, 2, 1438375370, NULL, 'lesson_slideshowheight', '480', NULL),
(633, 2, 1438375370, NULL, 'lesson_slideshowbgcolor', '#FFFFFF', NULL),
(634, 2, 1438375370, NULL, 'lesson_mediawidth', '640', NULL),
(635, 2, 1438375370, NULL, 'lesson_mediaheight', '480', NULL),
(636, 2, 1438375370, NULL, 'lesson_mediaclose', '0', NULL),
(637, 2, 1438375370, NULL, 'lesson_maxhighscores', '10', NULL),
(638, 2, 1438375370, NULL, 'lesson_maxanswers', '4', NULL),
(639, 2, 1438375370, NULL, 'lesson_defaultnextpage', '0', NULL),
(640, 2, 1438375370, 'page', 'requiremodintro', '1', NULL),
(641, 2, 1438375370, 'page', 'displayoptions', '5', NULL),
(642, 2, 1438375370, 'page', 'printheading', '1', NULL),
(643, 2, 1438375370, 'page', 'printintro', '0', NULL),
(644, 2, 1438375370, 'page', 'display', '5', NULL),
(645, 2, 1438375370, 'page', 'popupwidth', '620', NULL),
(646, 2, 1438375370, 'page', 'popupheight', '450', NULL),
(647, 2, 1438375370, 'quiz', 'timelimit', '0', NULL),
(648, 2, 1438375370, 'quiz', 'timelimit_adv', '0', NULL),
(649, 2, 1438375371, 'quiz', 'overduehandling', 'autoabandon', NULL),
(650, 2, 1438375371, 'quiz', 'overduehandling_adv', '0', NULL),
(651, 2, 1438375371, 'quiz', 'graceperiod', '86400', NULL),
(652, 2, 1438375371, 'quiz', 'graceperiod_adv', '0', NULL),
(653, 2, 1438375371, 'quiz', 'graceperiodmin', '60', NULL),
(654, 2, 1438375371, 'quiz', 'attempts', '0', NULL),
(655, 2, 1438375371, 'quiz', 'attempts_adv', '0', NULL),
(656, 2, 1438375371, 'quiz', 'grademethod', '1', NULL),
(657, 2, 1438375371, 'quiz', 'grademethod_adv', '0', NULL),
(658, 2, 1438375371, 'quiz', 'maximumgrade', '10', NULL),
(659, 2, 1438375371, 'quiz', 'shufflequestions', '0', NULL),
(660, 2, 1438375371, 'quiz', 'shufflequestions_adv', '0', NULL),
(661, 2, 1438375371, 'quiz', 'questionsperpage', '1', NULL),
(662, 2, 1438375371, 'quiz', 'questionsperpage_adv', '0', NULL),
(663, 2, 1438375371, 'quiz', 'navmethod', 'free', NULL),
(664, 2, 1438375371, 'quiz', 'navmethod_adv', '1', NULL),
(665, 2, 1438375371, 'quiz', 'shuffleanswers', '1', NULL),
(666, 2, 1438375371, 'quiz', 'shuffleanswers_adv', '0', NULL),
(667, 2, 1438375371, 'quiz', 'preferredbehaviour', 'deferredfeedback', NULL),
(668, 2, 1438375371, 'quiz', 'attemptonlast', '0', NULL),
(669, 2, 1438375371, 'quiz', 'attemptonlast_adv', '1', NULL),
(670, 2, 1438375371, 'quiz', 'reviewattempt', '69904', NULL),
(671, 2, 1438375371, 'quiz', 'reviewcorrectness', '69904', NULL),
(672, 2, 1438375371, 'quiz', 'reviewmarks', '69904', NULL),
(673, 2, 1438375371, 'quiz', 'reviewspecificfeedback', '69904', NULL),
(674, 2, 1438375371, 'quiz', 'reviewgeneralfeedback', '69904', NULL),
(675, 2, 1438375372, 'quiz', 'reviewrightanswer', '69904', NULL),
(676, 2, 1438375372, 'quiz', 'reviewoverallfeedback', '4368', NULL),
(677, 2, 1438375372, 'quiz', 'showuserpicture', '0', NULL),
(678, 2, 1438375372, 'quiz', 'showuserpicture_adv', '0', NULL),
(679, 2, 1438375372, 'quiz', 'decimalpoints', '2', NULL),
(680, 2, 1438375372, 'quiz', 'decimalpoints_adv', '0', NULL),
(681, 2, 1438375372, 'quiz', 'questiondecimalpoints', '-1', NULL),
(682, 2, 1438375372, 'quiz', 'questiondecimalpoints_adv', '1', NULL),
(683, 2, 1438375372, 'quiz', 'showblocks', '0', NULL),
(684, 2, 1438375372, 'quiz', 'showblocks_adv', '1', NULL),
(685, 2, 1438375372, 'quiz', 'password', '', NULL),
(686, 2, 1438375372, 'quiz', 'password_adv', '1', NULL),
(687, 2, 1438375372, 'quiz', 'subnet', '', NULL),
(688, 2, 1438375372, 'quiz', 'subnet_adv', '1', NULL),
(689, 2, 1438375372, 'quiz', 'delay1', '0', NULL),
(690, 2, 1438375372, 'quiz', 'delay1_adv', '1', NULL),
(691, 2, 1438375372, 'quiz', 'delay2', '0', NULL),
(692, 2, 1438375372, 'quiz', 'delay2_adv', '1', NULL),
(693, 2, 1438375372, 'quiz', 'browsersecurity', '-', NULL),
(694, 2, 1438375372, 'quiz', 'browsersecurity_adv', '1', NULL),
(695, 2, 1438375372, 'quiz', 'autosaveperiod', '0', NULL),
(696, 2, 1438375372, 'resource', 'framesize', '130', NULL),
(697, 2, 1438375372, 'resource', 'requiremodintro', '1', NULL),
(698, 2, 1438375372, 'resource', 'displayoptions', '0,1,4,5,6', NULL),
(699, 2, 1438375372, 'resource', 'printheading', '0', NULL),
(700, 2, 1438375372, 'resource', 'printintro', '1', NULL),
(701, 2, 1438375372, 'resource', 'display', '0', NULL),
(702, 2, 1438375372, 'resource', 'showsize', '0', NULL),
(703, 2, 1438375372, 'resource', 'showtype', '0', NULL),
(704, 2, 1438375372, 'resource', 'popupwidth', '620', NULL),
(705, 2, 1438375372, 'resource', 'popupheight', '450', NULL),
(706, 2, 1438375372, 'resource', 'filterfiles', '0', NULL),
(707, 2, 1438375372, 'scorm', 'displaycoursestructure', '0', NULL),
(708, 2, 1438375372, 'scorm', 'displaycoursestructure_adv', '0', NULL),
(709, 2, 1438375372, 'scorm', 'popup', '0', NULL),
(710, 2, 1438375372, 'scorm', 'popup_adv', '0', NULL),
(711, 2, 1438375372, 'scorm', 'framewidth', '100', NULL),
(712, 2, 1438375372, 'scorm', 'framewidth_adv', '1', NULL),
(713, 2, 1438375372, 'scorm', 'frameheight', '500', NULL),
(714, 2, 1438375372, 'scorm', 'frameheight_adv', '1', NULL),
(715, 2, 1438375372, 'scorm', 'winoptgrp_adv', '1', NULL),
(716, 2, 1438375372, 'scorm', 'resizable', '0', NULL),
(717, 2, 1438375372, 'scorm', 'scrollbars', '0', NULL),
(718, 2, 1438375372, 'scorm', 'directories', '0', NULL),
(719, 2, 1438375372, 'scorm', 'location', '0', NULL),
(720, 2, 1438375372, 'scorm', 'menubar', '0', NULL),
(721, 2, 1438375372, 'scorm', 'toolbar', '0', NULL),
(722, 2, 1438375372, 'scorm', 'status', '0', NULL),
(723, 2, 1438375372, 'scorm', 'skipview', '0', NULL),
(724, 2, 1438375372, 'scorm', 'skipview_adv', '1', NULL),
(725, 2, 1438375372, 'scorm', 'hidebrowse', '0', NULL),
(726, 2, 1438375372, 'scorm', 'hidebrowse_adv', '1', NULL),
(727, 2, 1438375372, 'scorm', 'hidetoc', '0', NULL),
(728, 2, 1438375372, 'scorm', 'hidetoc_adv', '1', NULL);
INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(729, 2, 1438375372, 'scorm', 'hidenav', '0', NULL),
(730, 2, 1438375372, 'scorm', 'hidenav_adv', '0', NULL),
(731, 2, 1438375372, 'scorm', 'displayattemptstatus', '1', NULL),
(732, 2, 1438375372, 'scorm', 'displayattemptstatus_adv', '0', NULL),
(733, 2, 1438375372, 'scorm', 'grademethod', '1', NULL),
(734, 2, 1438375372, 'scorm', 'maxgrade', '100', NULL),
(735, 2, 1438375372, 'scorm', 'maxattempt', '0', NULL),
(736, 2, 1438375372, 'scorm', 'whatgrade', '0', NULL),
(737, 2, 1438375372, 'scorm', 'forcecompleted', '0', NULL),
(738, 2, 1438375372, 'scorm', 'forcenewattempt', '0', NULL),
(739, 2, 1438375372, 'scorm', 'lastattemptlock', '0', NULL),
(740, 2, 1438375372, 'scorm', 'auto', '0', NULL),
(741, 2, 1438375373, 'scorm', 'updatefreq', '0', NULL),
(742, 2, 1438375373, 'scorm', 'allowtypeexternal', '0', NULL),
(743, 2, 1438375373, 'scorm', 'allowtypelocalsync', '0', NULL),
(744, 2, 1438375373, 'scorm', 'allowtypeimsrepository', '0', NULL),
(745, 2, 1438375373, 'scorm', 'allowtypeexternalaicc', '0', NULL),
(746, 2, 1438375373, 'scorm', 'allowaicchacp', '0', NULL),
(747, 2, 1438375373, 'scorm', 'aicchacptimeout', '30', NULL),
(748, 2, 1438375373, 'scorm', 'aicchacpkeepsessiondata', '1', NULL),
(749, 2, 1438375373, 'scorm', 'forcejavascript', '1', NULL),
(750, 2, 1438375373, 'scorm', 'allowapidebug', '0', NULL),
(751, 2, 1438375373, 'scorm', 'apidebugmask', '.*', NULL),
(752, 2, 1438375373, 'url', 'framesize', '130', NULL),
(753, 2, 1438375373, 'url', 'requiremodintro', '1', NULL),
(754, 2, 1438375373, 'url', 'secretphrase', '', NULL),
(755, 2, 1438375373, 'url', 'rolesinparams', '0', NULL),
(756, 2, 1438375373, 'url', 'displayoptions', '0,1,5,6', NULL),
(757, 2, 1438375373, 'url', 'printheading', '0', NULL),
(758, 2, 1438375373, 'url', 'printintro', '1', NULL),
(759, 2, 1438375373, 'url', 'display', '0', NULL),
(760, 2, 1438375373, 'url', 'popupwidth', '620', NULL),
(761, 2, 1438375373, 'url', 'popupheight', '450', NULL),
(762, 2, 1438375373, 'workshop', 'grade', '80', NULL),
(763, 2, 1438375373, 'workshop', 'gradinggrade', '20', NULL),
(764, 2, 1438375373, 'workshop', 'gradedecimals', '0', NULL),
(765, 2, 1438375373, 'workshop', 'maxbytes', '0', NULL),
(766, 2, 1438375373, 'workshop', 'strategy', 'accumulative', NULL),
(767, 2, 1438375373, 'workshop', 'examplesmode', '0', NULL),
(768, 2, 1438375373, 'workshopallocation_random', 'numofreviews', '5', NULL),
(769, 2, 1438375373, 'workshopform_numerrors', 'grade0', 'No', NULL),
(770, 2, 1438375373, 'workshopform_numerrors', 'grade1', 'Yes', NULL),
(771, 2, 1438375373, 'workshopeval_best', 'comparison', '5', NULL),
(772, 2, 1438375373, 'assignsubmission_file', 'default', '1', NULL),
(773, 2, 1438375373, 'assignsubmission_file', 'maxbytes', '1048576', NULL),
(774, 2, 1438375373, 'assignsubmission_onlinetext', 'default', '0', NULL),
(775, 2, 1438375373, 'assignsubmission_comments', 'default', '0', NULL),
(776, 2, 1438375373, 'assignfeedback_comments', 'default', '1', NULL),
(777, 2, 1438375373, 'assignfeedback_file', 'default', '0', NULL),
(778, 2, 1438375373, 'assignfeedback_offline', 'default', '0', NULL),
(779, 2, 1438375373, NULL, 'smtphosts', '', NULL),
(780, 2, 1438375373, NULL, 'smtpsecure', '', NULL),
(781, 2, 1438375373, NULL, 'smtpuser', '', NULL),
(782, 2, 1438375373, NULL, 'smtppass', '', NULL),
(783, 2, 1438375373, NULL, 'smtpmaxbulk', '1', NULL),
(784, 2, 1438375373, NULL, 'noreplyaddress', 'noreply@localhost', NULL),
(785, 2, 1438375373, NULL, 'sitemailcharset', '0', NULL),
(786, 2, 1438375373, NULL, 'allowusermailcharset', '0', NULL),
(787, 2, 1438375373, NULL, 'mailnewline', 'LF', NULL),
(788, 2, 1438375373, NULL, 'jabberhost', '', NULL),
(789, 2, 1438375373, NULL, 'jabberserver', '', NULL),
(790, 2, 1438375373, NULL, 'jabberusername', '', NULL),
(791, 2, 1438375374, NULL, 'jabberpassword', '', NULL),
(792, 2, 1438375374, NULL, 'jabberport', '5222', NULL),
(793, 2, 1438375374, 'enrol_cohort', 'roleid', '5', NULL),
(794, 2, 1438375374, 'enrol_cohort', 'unenrolaction', '0', NULL),
(795, 2, 1438375374, 'enrol_database', 'defaultrole', '5', NULL),
(796, 2, 1438375374, 'enrol_database', 'defaultcategory', '1', NULL),
(797, 2, 1438375374, 'enrol_imsenterprise', 'imsrolemap01', '5', NULL),
(798, 2, 1438375374, 'enrol_imsenterprise', 'imsrolemap02', '3', NULL),
(799, 2, 1438375374, 'enrol_imsenterprise', 'imsrolemap03', '3', NULL),
(800, 2, 1438375374, 'enrol_imsenterprise', 'imsrolemap04', '5', NULL),
(801, 2, 1438375374, 'enrol_imsenterprise', 'imsrolemap05', '0', NULL),
(802, 2, 1438375374, 'enrol_imsenterprise', 'imsrolemap06', '4', NULL),
(803, 2, 1438375374, 'enrol_imsenterprise', 'imsrolemap07', '0', NULL),
(804, 2, 1438375374, 'enrol_imsenterprise', 'imsrolemap08', '4', NULL),
(805, 2, 1438375374, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode', NULL),
(806, 2, 1438375374, 'enrol_imsenterprise', 'imscoursemapfullname', 'short', NULL),
(807, 2, 1438375374, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore', NULL),
(808, 2, 1438375374, 'enrol_manual', 'roleid', '5', NULL),
(809, 2, 1438375374, 'enrol_meta', 'nosyncroleids', '', NULL),
(810, 2, 1438375374, 'enrol_meta', 'syncall', '1', NULL),
(811, 2, 1438375374, 'enrol_meta', 'unenrolaction', '3', NULL),
(812, 2, 1438375374, 'enrol_mnet', 'roleid', '5', NULL),
(813, 2, 1438375374, 'enrol_mnet', 'roleid_adv', '1', NULL),
(814, 2, 1438375374, 'enrol_paypal', 'roleid', '5', NULL),
(815, 2, 1438375374, 'enrol_self', 'roleid', '5', NULL),
(816, 2, 1438375374, NULL, 'profileroles', '5,4,3', NULL),
(817, 2, 1438375374, NULL, 'coursecontact', '3', NULL),
(818, 2, 1438375374, NULL, 'frontpage', '6', NULL),
(819, 2, 1438375374, NULL, 'frontpageloggedin', '6', NULL),
(820, 2, 1438375374, NULL, 'maxcategorydepth', '2', NULL),
(821, 2, 1438375374, NULL, 'frontpagecourselimit', '200', NULL),
(822, 2, 1438375374, NULL, 'commentsperpage', '15', NULL),
(823, 2, 1438375374, NULL, 'defaultfrontpageroleid', '8', NULL),
(824, 2, 1438375374, NULL, 'supportname', 'Admin User', NULL),
(825, 2, 1438375374, NULL, 'supportemail', 'abhinay212@gmail.com', NULL),
(826, 2, 1438375417, NULL, 'registerauth', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_plugins`
--

CREATE TABLE IF NOT EXISTS `mdl_config_plugins` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) NOT NULL DEFAULT 'core',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Moodle modules and plugins configuration variables' AUTO_INCREMENT=889 ;

--
-- Dumping data for table `mdl_config_plugins`
--

INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1, 'moodlecourse', 'visible', '1'),
(2, 'moodlecourse', 'format', 'weeks'),
(3, 'moodlecourse', 'maxsections', '52'),
(4, 'moodlecourse', 'numsections', '10'),
(5, 'moodlecourse', 'hiddensections', '0'),
(6, 'moodlecourse', 'coursedisplay', '0'),
(7, 'moodlecourse', 'lang', ''),
(8, 'moodlecourse', 'newsitems', '5'),
(9, 'moodlecourse', 'showgrades', '1'),
(10, 'moodlecourse', 'showreports', '0'),
(11, 'moodlecourse', 'maxbytes', '0'),
(12, 'moodlecourse', 'enablecompletion', '0'),
(13, 'moodlecourse', 'groupmode', '0'),
(14, 'moodlecourse', 'groupmodeforce', '0'),
(15, 'backup', 'loglifetime', '30'),
(16, 'backup', 'backup_general_users', '1'),
(17, 'backup', 'backup_general_users_locked', '0'),
(18, 'backup', 'backup_general_anonymize', '0'),
(19, 'backup', 'backup_general_anonymize_locked', '0'),
(20, 'backup', 'backup_general_role_assignments', '1'),
(21, 'backup', 'backup_general_role_assignments_locked', '0'),
(22, 'backup', 'backup_general_activities', '1'),
(23, 'backup', 'backup_general_activities_locked', '0'),
(24, 'backup', 'backup_general_blocks', '1'),
(25, 'backup', 'backup_general_blocks_locked', '0'),
(26, 'backup', 'backup_general_filters', '1'),
(27, 'backup', 'backup_general_filters_locked', '0'),
(28, 'backup', 'backup_general_comments', '1'),
(29, 'backup', 'backup_general_comments_locked', '0'),
(30, 'backup', 'backup_general_badges', '1'),
(31, 'backup', 'backup_general_badges_locked', '0'),
(32, 'backup', 'backup_general_userscompletion', '1'),
(33, 'backup', 'backup_general_userscompletion_locked', '0'),
(34, 'backup', 'backup_general_logs', '0'),
(35, 'backup', 'backup_general_logs_locked', '0'),
(36, 'backup', 'backup_general_histories', '0'),
(37, 'backup', 'backup_general_histories_locked', '0'),
(38, 'backup', 'import_general_maxresults', '10'),
(39, 'backup', 'backup_auto_active', '0'),
(40, 'backup', 'backup_auto_weekdays', '0000000'),
(41, 'backup', 'backup_auto_hour', '0'),
(42, 'backup', 'backup_auto_minute', '0'),
(43, 'backup', 'backup_auto_storage', '0'),
(44, 'backup', 'backup_auto_destination', ''),
(45, 'backup', 'backup_auto_keep', '1'),
(46, 'backup', 'backup_shortname', '0'),
(47, 'backup', 'backup_auto_skip_hidden', '1'),
(48, 'backup', 'backup_auto_skip_modif_days', '30'),
(49, 'backup', 'backup_auto_skip_modif_prev', '0'),
(50, 'backup', 'backup_auto_users', '1'),
(51, 'backup', 'backup_auto_role_assignments', '1'),
(52, 'backup', 'backup_auto_activities', '1'),
(53, 'backup', 'backup_auto_blocks', '1'),
(54, 'backup', 'backup_auto_filters', '1'),
(55, 'backup', 'backup_auto_comments', '1'),
(56, 'backup', 'backup_auto_badges', '1'),
(57, 'backup', 'backup_auto_userscompletion', '1'),
(58, 'backup', 'backup_auto_logs', '0'),
(59, 'backup', 'backup_auto_histories', '0'),
(60, 'block_course_overview', 'defaultmaxcourses', '10'),
(61, 'block_course_overview', 'forcedefaultmaxcourses', '0'),
(62, 'block_course_overview', 'showchildren', '0'),
(63, 'block_course_overview', 'showwelcomearea', '0'),
(64, 'block_section_links', 'numsections1', '22'),
(65, 'block_section_links', 'incby1', '2'),
(66, 'block_section_links', 'numsections2', '40'),
(67, 'block_section_links', 'incby2', '5'),
(68, 'enrol_database', 'dbtype', ''),
(69, 'enrol_database', 'dbhost', 'localhost'),
(70, 'enrol_database', 'dbuser', ''),
(71, 'enrol_database', 'dbpass', ''),
(72, 'enrol_database', 'dbname', ''),
(73, 'enrol_database', 'dbencoding', 'utf-8'),
(74, 'enrol_database', 'dbsetupsql', ''),
(75, 'enrol_database', 'dbsybasequoting', '0'),
(76, 'enrol_database', 'debugdb', '0'),
(77, 'enrol_database', 'localcoursefield', 'idnumber'),
(78, 'enrol_database', 'localuserfield', 'idnumber'),
(79, 'enrol_database', 'localrolefield', 'shortname'),
(80, 'enrol_database', 'localcategoryfield', 'id'),
(81, 'enrol_database', 'remoteenroltable', ''),
(82, 'enrol_database', 'remotecoursefield', ''),
(83, 'enrol_database', 'remoteuserfield', ''),
(84, 'enrol_database', 'remoterolefield', ''),
(85, 'enrol_database', 'ignorehiddencourses', '0'),
(86, 'enrol_database', 'unenrolaction', '0'),
(87, 'enrol_database', 'newcoursetable', ''),
(88, 'enrol_database', 'newcoursefullname', 'fullname'),
(89, 'enrol_database', 'newcourseshortname', 'shortname'),
(90, 'enrol_database', 'newcourseidnumber', 'idnumber'),
(91, 'enrol_database', 'newcoursecategory', ''),
(92, 'enrol_database', 'templatecourse', ''),
(93, 'enrol_flatfile', 'location', ''),
(94, 'enrol_flatfile', 'encoding', 'UTF-8'),
(95, 'enrol_flatfile', 'mailstudents', '0'),
(96, 'enrol_flatfile', 'mailteachers', '0'),
(97, 'enrol_flatfile', 'mailadmins', '0'),
(98, 'enrol_flatfile', 'unenrolaction', '3'),
(99, 'enrol_flatfile', 'expiredaction', '3'),
(100, 'enrol_guest', 'requirepassword', '0'),
(101, 'enrol_guest', 'usepasswordpolicy', '0'),
(102, 'enrol_guest', 'showhint', '0'),
(103, 'enrol_guest', 'defaultenrol', '1'),
(104, 'enrol_guest', 'status', '1'),
(105, 'enrol_guest', 'status_adv', '0'),
(106, 'enrol_imsenterprise', 'imsfilelocation', ''),
(107, 'enrol_imsenterprise', 'logtolocation', ''),
(108, 'enrol_imsenterprise', 'mailadmins', '0'),
(109, 'enrol_imsenterprise', 'createnewusers', '0'),
(110, 'enrol_imsenterprise', 'imsdeleteusers', '0'),
(111, 'enrol_imsenterprise', 'fixcaseusernames', '0'),
(112, 'enrol_imsenterprise', 'fixcasepersonalnames', '0'),
(113, 'enrol_imsenterprise', 'imssourcedidfallback', '0'),
(114, 'enrol_imsenterprise', 'truncatecoursecodes', '0'),
(115, 'enrol_imsenterprise', 'createnewcourses', '0'),
(116, 'enrol_imsenterprise', 'createnewcategories', '0'),
(117, 'enrol_imsenterprise', 'imsunenrol', '0'),
(118, 'enrol_imsenterprise', 'imsrestricttarget', ''),
(119, 'enrol_imsenterprise', 'imscapitafix', '0'),
(120, 'enrol_manual', 'expiredaction', '1'),
(121, 'enrol_manual', 'expirynotifyhour', '6'),
(122, 'enrol_manual', 'defaultenrol', '1'),
(123, 'enrol_manual', 'status', '0'),
(124, 'enrol_manual', 'enrolperiod', '0'),
(125, 'enrol_manual', 'expirynotify', '0'),
(126, 'enrol_manual', 'expirythreshold', '86400'),
(127, 'enrol_paypal', 'paypalbusiness', ''),
(128, 'enrol_paypal', 'mailstudents', '0'),
(129, 'enrol_paypal', 'mailteachers', '0'),
(130, 'enrol_paypal', 'mailadmins', '0'),
(131, 'enrol_paypal', 'expiredaction', '3'),
(132, 'enrol_paypal', 'status', '1'),
(133, 'enrol_paypal', 'cost', '0'),
(134, 'enrol_paypal', 'currency', 'USD'),
(135, 'enrol_paypal', 'enrolperiod', '0'),
(136, 'enrol_self', 'requirepassword', '0'),
(137, 'enrol_self', 'usepasswordpolicy', '0'),
(138, 'enrol_self', 'showhint', '0'),
(139, 'enrol_self', 'expiredaction', '1'),
(140, 'enrol_self', 'expirynotifyhour', '6'),
(141, 'enrol_self', 'defaultenrol', '1'),
(142, 'enrol_self', 'status', '1'),
(143, 'enrol_self', 'newenrols', '1'),
(144, 'enrol_self', 'groupkey', '0'),
(145, 'enrol_self', 'enrolperiod', '0'),
(146, 'enrol_self', 'expirynotify', '0'),
(147, 'enrol_self', 'expirythreshold', '86400'),
(148, 'enrol_self', 'longtimenosee', '0'),
(149, 'enrol_self', 'maxenrolled', '0'),
(150, 'enrol_self', 'sendcoursewelcomemessage', '1'),
(151, 'editor_tinymce', 'customtoolbar', 'fontselect,fontsizeselect,formatselect,|,undo,redo,|,search,replace,|,fullscreen\n\nbold,italic,underline,strikethrough,sub,sup,|,justifyleft,justifycenter,justifyright,|,cleanup,removeformat,pastetext,pasteword,|,forecolor,backcolor,|,ltr,rtl\n\nbullist,numlist,outdent,indent,|,link,unlink,|,image,nonbreaking,charmap,table,|,code'),
(152, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),
(153, 'editor_tinymce', 'customconfig', ''),
(154, 'tinymce_dragmath', 'requiretex', '1'),
(155, 'tinymce_moodleemoticon', 'requireemoticon', '1'),
(156, 'tinymce_spellchecker', 'spellengine', ''),
(157, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),
(158, 'filter_urltolink', 'formats', '0'),
(159, 'filter_urltolink', 'embedimages', '1'),
(160, 'filter_emoticon', 'formats', '1,4,0'),
(161, 'question_preview', 'behaviour', 'deferredfeedback'),
(162, 'question_preview', 'correctness', '1'),
(163, 'question_preview', 'marks', '1'),
(164, 'question_preview', 'markdp', '2'),
(165, 'question_preview', 'feedback', '1'),
(166, 'question_preview', 'generalfeedback', '1'),
(167, 'question_preview', 'rightanswer', '1'),
(168, 'question_preview', 'history', '0'),
(169, 'cachestore_memcache', 'testservers', ''),
(170, 'cachestore_memcached', 'testservers', ''),
(171, 'cachestore_mongodb', 'testserver', ''),
(172, 'theme_afterburner', 'logo', ''),
(173, 'theme_afterburner', 'footnote', ''),
(174, 'theme_afterburner', 'customcss', ''),
(175, 'theme_anomaly', 'tagline', ''),
(176, 'theme_anomaly', 'customcss', ''),
(177, 'theme_arialist', 'logo', ''),
(178, 'theme_arialist', 'tagline', ''),
(179, 'theme_arialist', 'linkcolor', '#f25f0f'),
(180, 'theme_arialist', 'regionwidth', '250'),
(181, 'theme_arialist', 'customcss', ''),
(182, 'theme_brick', 'logo', ''),
(183, 'theme_brick', 'linkcolor', '#06365b'),
(184, 'theme_brick', 'linkhover', '#5487ad'),
(185, 'theme_brick', 'maincolor', '#8e2800'),
(186, 'theme_brick', 'maincolorlink', '#fff0a5'),
(187, 'theme_brick', 'headingcolor', '#5c3500'),
(188, 'theme_clean', 'invert', '0'),
(189, 'theme_clean', 'logo', ''),
(190, 'theme_clean', 'customcss', ''),
(191, 'theme_clean', 'footnote', ''),
(192, 'theme_formal_white', 'fontsizereference', '13'),
(193, 'theme_formal_white', 'noframe', '0'),
(194, 'theme_formal_white', 'framemargin', '15'),
(195, 'theme_formal_white', 'headercontent', '1'),
(196, 'theme_formal_white', 'customlogourl', ''),
(197, 'theme_formal_white', 'frontpagelogourl', ''),
(198, 'theme_formal_white', 'headerbgc', '#E3DFD4'),
(199, 'theme_formal_white', 'creditstomoodleorg', '2'),
(200, 'theme_formal_white', 'blockcolumnwidth', '200'),
(201, 'theme_formal_white', 'blockpadding', '8'),
(202, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6'),
(203, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4'),
(204, 'theme_formal_white', 'rblockcolumnbgc', ''),
(205, 'theme_formal_white', 'footnote', ''),
(206, 'theme_formal_white', 'customcss', ''),
(207, 'theme_fusion', 'linkcolor', '#2d83d5'),
(208, 'theme_fusion', 'tagline', ''),
(209, 'theme_fusion', 'footertext', ''),
(210, 'theme_fusion', 'customcss', ''),
(211, 'theme_magazine', 'background', ''),
(212, 'theme_magazine', 'logo', ''),
(213, 'theme_magazine', 'linkcolor', '#32529a'),
(214, 'theme_magazine', 'linkhover', '#4e2300'),
(215, 'theme_magazine', 'maincolor', '#002f2f'),
(216, 'theme_magazine', 'maincoloraccent', '#092323'),
(217, 'theme_magazine', 'headingcolor', '#4e0000'),
(218, 'theme_magazine', 'blockcolor', '#002f2f'),
(219, 'theme_magazine', 'forumback', '#e6e2af'),
(220, 'theme_mymobile', 'colourswatch', 'light'),
(221, 'theme_mymobile', 'showmobileintro', ''),
(222, 'theme_mymobile', 'showsitetopic', 'topicshow'),
(223, 'theme_mymobile', 'showfullsizeimages', 'ithumb'),
(224, 'theme_mymobile', 'usetableview', 'tabshow'),
(225, 'theme_mymobile', 'customcss', ''),
(226, 'theme_nimble', 'tagline', ''),
(227, 'theme_nimble', 'footerline', ''),
(228, 'theme_nimble', 'backgroundcolor', '#454545'),
(229, 'theme_nimble', 'linkcolor', '#2a65b1'),
(230, 'theme_nimble', 'linkhover', '#222222'),
(231, 'theme_nonzero', 'regionprewidth', '200'),
(232, 'theme_nonzero', 'regionpostwidth', '200'),
(233, 'theme_nonzero', 'customcss', ''),
(234, 'theme_overlay', 'linkcolor', '#428ab5'),
(235, 'theme_overlay', 'headercolor', '#2a4c7b'),
(236, 'theme_overlay', 'footertext', ''),
(237, 'theme_overlay', 'customcss', ''),
(238, 'theme_sky_high', 'logo', ''),
(239, 'theme_sky_high', 'regionwidth', '240'),
(240, 'theme_sky_high', 'footnote', ''),
(241, 'theme_sky_high', 'customcss', ''),
(242, 'theme_splash', 'logo', ''),
(243, 'theme_splash', 'tagline', 'Virtual learning center'),
(244, 'theme_splash', 'hide_tagline', '0'),
(245, 'theme_splash', 'footnote', ''),
(246, 'theme_splash', 'customcss', ''),
(247, 'qtype_calculated', 'version', '2013050100'),
(248, 'qtype_calculatedmulti', 'version', '2013050100'),
(249, 'qtype_calculatedsimple', 'version', '2013050100'),
(250, 'qtype_description', 'version', '2013050100'),
(251, 'qtype_essay', 'version', '2013050100'),
(252, 'qtype_match', 'version', '2013050100'),
(253, 'qtype_missingtype', 'version', '2013050100'),
(254, 'qtype_multianswer', 'version', '2013050100'),
(255, 'qtype_multichoice', 'version', '2013050100'),
(256, 'qtype_numerical', 'version', '2013050100'),
(257, 'qtype_random', 'version', '2013050100'),
(258, 'qtype_randomsamatch', 'version', '2013050103'),
(259, 'qtype_shortanswer', 'version', '2013050100'),
(260, 'qtype_truefalse', 'version', '2013050100'),
(269, 'auth_cas', 'version', '2013052100'),
(271, 'auth_db', 'version', '2013050100'),
(273, 'auth_email', 'version', '2013050100'),
(274, 'auth_fc', 'version', '2013050100'),
(276, 'auth_imap', 'version', '2013050100'),
(278, 'auth_ldap', 'version', '2013052100'),
(280, 'auth_manual', 'version', '2013050100'),
(281, 'auth_mnet', 'version', '2013050100'),
(283, 'auth_nntp', 'version', '2013050100'),
(285, 'auth_nologin', 'version', '2013050100'),
(286, 'auth_none', 'version', '2013050100'),
(287, 'auth_pam', 'version', '2013050100'),
(289, 'auth_pop3', 'version', '2013050100'),
(291, 'auth_radius', 'version', '2013050100'),
(293, 'auth_shibboleth', 'version', '2013050100'),
(295, 'auth_webservice', 'version', '2013050100'),
(296, 'enrol_authorize', 'version', '2013050100'),
(297, 'enrol_category', 'version', '2013050100'),
(299, 'enrol_cohort', 'version', '2013050100'),
(300, 'enrol_database', 'version', '2013050100'),
(302, 'enrol_flatfile', 'version', '2013050100'),
(304, 'enrol_flatfile', 'map_1', 'manager'),
(305, 'enrol_flatfile', 'map_2', 'coursecreator'),
(306, 'enrol_flatfile', 'map_3', 'editingteacher'),
(307, 'enrol_flatfile', 'map_4', 'teacher'),
(308, 'enrol_flatfile', 'map_5', 'student'),
(309, 'enrol_flatfile', 'map_6', 'guest'),
(310, 'enrol_flatfile', 'map_7', 'user'),
(311, 'enrol_flatfile', 'map_8', 'frontpage'),
(312, 'enrol_guest', 'version', '2013050100'),
(313, 'enrol_imsenterprise', 'version', '2013050100'),
(315, 'enrol_ldap', 'version', '2013050100'),
(317, 'enrol_manual', 'version', '2013050100'),
(319, 'enrol_meta', 'version', '2013050100'),
(321, 'enrol_mnet', 'version', '2013050100'),
(322, 'enrol_paypal', 'version', '2013050100'),
(323, 'enrol_self', 'version', '2013050101'),
(325, 'message_email', 'version', '2013050100'),
(327, 'message', 'email_provider_enrol_authorize_authorize_enrolment_permitted', 'permitted'),
(328, 'message', 'message_provider_enrol_authorize_authorize_enrolment_loggedin', 'email'),
(329, 'message', 'message_provider_enrol_authorize_authorize_enrolment_loggedoff', 'email'),
(330, 'message', 'email_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(331, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedin', 'email'),
(332, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedoff', 'email'),
(333, 'message', 'email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(334, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin', 'email'),
(335, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff', 'email'),
(336, 'message', 'email_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(337, 'message', 'message_provider_enrol_manual_expiry_notification_loggedin', 'email'),
(338, 'message', 'message_provider_enrol_manual_expiry_notification_loggedoff', 'email'),
(339, 'message', 'email_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(340, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedin', 'email'),
(341, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedoff', 'email'),
(342, 'message', 'email_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(343, 'message', 'message_provider_enrol_self_expiry_notification_loggedin', 'email'),
(344, 'message', 'message_provider_enrol_self_expiry_notification_loggedoff', 'email'),
(345, 'message', 'email_provider_mod_assign_assign_notification_permitted', 'permitted'),
(346, 'message', 'message_provider_mod_assign_assign_notification_loggedin', 'email'),
(347, 'message', 'message_provider_mod_assign_assign_notification_loggedoff', 'email'),
(348, 'message', 'email_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(349, 'message', 'message_provider_mod_assignment_assignment_updates_loggedin', 'email'),
(350, 'message', 'message_provider_mod_assignment_assignment_updates_loggedoff', 'email'),
(351, 'message', 'email_provider_mod_feedback_submission_permitted', 'permitted'),
(352, 'message', 'message_provider_mod_feedback_submission_loggedin', 'email'),
(353, 'message', 'message_provider_mod_feedback_submission_loggedoff', 'email'),
(354, 'message', 'email_provider_mod_feedback_message_permitted', 'permitted'),
(355, 'message', 'message_provider_mod_feedback_message_loggedin', 'email'),
(356, 'message', 'message_provider_mod_feedback_message_loggedoff', 'email'),
(357, 'message', 'email_provider_mod_forum_posts_permitted', 'permitted'),
(358, 'message', 'message_provider_mod_forum_posts_loggedin', 'email'),
(359, 'message', 'message_provider_mod_forum_posts_loggedoff', 'email'),
(360, 'message', 'email_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(361, 'message', 'message_provider_mod_lesson_graded_essay_loggedin', 'email'),
(362, 'message', 'message_provider_mod_lesson_graded_essay_loggedoff', 'email'),
(363, 'message', 'email_provider_mod_quiz_submission_permitted', 'permitted'),
(364, 'message', 'message_provider_mod_quiz_submission_loggedin', 'email'),
(365, 'message', 'message_provider_mod_quiz_submission_loggedoff', 'email'),
(366, 'message', 'email_provider_mod_quiz_confirmation_permitted', 'permitted'),
(367, 'message', 'message_provider_mod_quiz_confirmation_loggedin', 'email'),
(368, 'message', 'message_provider_mod_quiz_confirmation_loggedoff', 'email'),
(369, 'message', 'email_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(370, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedin', 'email'),
(371, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedoff', 'email'),
(372, 'message', 'email_provider_moodle_notices_permitted', 'permitted'),
(373, 'message', 'message_provider_moodle_notices_loggedin', 'email'),
(374, 'message', 'message_provider_moodle_notices_loggedoff', 'email'),
(375, 'message', 'email_provider_moodle_errors_permitted', 'permitted'),
(376, 'message', 'message_provider_moodle_errors_loggedin', 'email'),
(377, 'message', 'message_provider_moodle_errors_loggedoff', 'email'),
(378, 'message', 'email_provider_moodle_availableupdate_permitted', 'permitted'),
(379, 'message', 'message_provider_moodle_availableupdate_loggedin', 'email'),
(380, 'message', 'message_provider_moodle_availableupdate_loggedoff', 'email'),
(381, 'message', 'email_provider_moodle_instantmessage_permitted', 'permitted'),
(382, 'message', 'message_provider_moodle_instantmessage_loggedoff', 'popup,email'),
(383, 'message', 'email_provider_moodle_backup_permitted', 'permitted'),
(384, 'message', 'message_provider_moodle_backup_loggedin', 'email'),
(385, 'message', 'message_provider_moodle_backup_loggedoff', 'email'),
(386, 'message', 'email_provider_moodle_courserequested_permitted', 'permitted'),
(387, 'message', 'message_provider_moodle_courserequested_loggedin', 'email'),
(388, 'message', 'message_provider_moodle_courserequested_loggedoff', 'email'),
(389, 'message', 'email_provider_moodle_courserequestapproved_permitted', 'permitted'),
(390, 'message', 'message_provider_moodle_courserequestapproved_loggedin', 'email'),
(391, 'message', 'message_provider_moodle_courserequestapproved_loggedoff', 'email'),
(392, 'message', 'email_provider_moodle_courserequestrejected_permitted', 'permitted'),
(393, 'message', 'message_provider_moodle_courserequestrejected_loggedin', 'email'),
(394, 'message', 'message_provider_moodle_courserequestrejected_loggedoff', 'email'),
(395, 'message_jabber', 'version', '2013050100'),
(397, 'message', 'jabber_provider_enrol_authorize_authorize_enrolment_permitted', 'permitted'),
(398, 'message', 'jabber_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(399, 'message', 'jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(400, 'message', 'jabber_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(401, 'message', 'jabber_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(402, 'message', 'jabber_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(403, 'message', 'jabber_provider_mod_assign_assign_notification_permitted', 'permitted'),
(404, 'message', 'jabber_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(405, 'message', 'jabber_provider_mod_feedback_submission_permitted', 'permitted'),
(406, 'message', 'jabber_provider_mod_feedback_message_permitted', 'permitted'),
(407, 'message', 'jabber_provider_mod_forum_posts_permitted', 'permitted'),
(408, 'message', 'jabber_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(409, 'message', 'jabber_provider_mod_quiz_submission_permitted', 'permitted'),
(410, 'message', 'jabber_provider_mod_quiz_confirmation_permitted', 'permitted'),
(411, 'message', 'jabber_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(412, 'message', 'jabber_provider_moodle_notices_permitted', 'permitted'),
(413, 'message', 'jabber_provider_moodle_errors_permitted', 'permitted'),
(414, 'message', 'jabber_provider_moodle_availableupdate_permitted', 'permitted'),
(415, 'message', 'jabber_provider_moodle_instantmessage_permitted', 'permitted'),
(416, 'message', 'jabber_provider_moodle_backup_permitted', 'permitted'),
(417, 'message', 'jabber_provider_moodle_courserequested_permitted', 'permitted'),
(418, 'message', 'jabber_provider_moodle_courserequestapproved_permitted', 'permitted'),
(419, 'message', 'jabber_provider_moodle_courserequestrejected_permitted', 'permitted'),
(420, 'message_popup', 'version', '2013050100'),
(422, 'message', 'popup_provider_enrol_authorize_authorize_enrolment_permitted', 'permitted'),
(423, 'message', 'popup_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(424, 'message', 'popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(425, 'message', 'popup_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(426, 'message', 'popup_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(427, 'message', 'popup_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(428, 'message', 'popup_provider_mod_assign_assign_notification_permitted', 'permitted'),
(429, 'message', 'popup_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(430, 'message', 'popup_provider_mod_feedback_submission_permitted', 'permitted'),
(431, 'message', 'popup_provider_mod_feedback_message_permitted', 'permitted'),
(432, 'message', 'popup_provider_mod_forum_posts_permitted', 'permitted'),
(433, 'message', 'popup_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(434, 'message', 'popup_provider_mod_quiz_submission_permitted', 'permitted'),
(435, 'message', 'popup_provider_mod_quiz_confirmation_permitted', 'permitted'),
(436, 'message', 'popup_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(437, 'message', 'popup_provider_moodle_notices_permitted', 'permitted'),
(438, 'message', 'popup_provider_moodle_errors_permitted', 'permitted'),
(439, 'message', 'popup_provider_moodle_availableupdate_permitted', 'permitted'),
(440, 'message', 'popup_provider_moodle_instantmessage_permitted', 'permitted'),
(441, 'message', 'message_provider_moodle_instantmessage_loggedin', 'popup'),
(442, 'message', 'popup_provider_moodle_backup_permitted', 'permitted'),
(443, 'message', 'popup_provider_moodle_courserequested_permitted', 'permitted'),
(444, 'message', 'popup_provider_moodle_courserequestapproved_permitted', 'permitted'),
(445, 'message', 'popup_provider_moodle_courserequestrejected_permitted', 'permitted'),
(447, 'filter_activitynames', 'version', '2013050100'),
(449, 'filter_algebra', 'version', '2013050100'),
(450, 'filter_censor', 'version', '2013050100'),
(451, 'filter_data', 'version', '2013050100'),
(453, 'filter_emailprotect', 'version', '2013050100'),
(454, 'filter_emoticon', 'version', '2013050100'),
(455, 'filter_glossary', 'version', '2013050100'),
(457, 'filter_mediaplugin', 'version', '2013050100'),
(459, 'filter_multilang', 'version', '2013050100'),
(460, 'filter_tex', 'version', '2013050100'),
(462, 'filter_tidy', 'version', '2013050100'),
(463, 'filter_urltolink', 'version', '2013050100'),
(464, 'editor_textarea', 'version', '2013050100'),
(465, 'editor_tinymce', 'version', '2013050102'),
(466, 'format_scorm', 'version', '2013050100'),
(467, 'format_social', 'version', '2013050100'),
(468, 'format_topics', 'version', '2013050100'),
(469, 'format_weeks', 'version', '2013050100'),
(470, 'profilefield_checkbox', 'version', '2013050100'),
(471, 'profilefield_datetime', 'version', '2013050100'),
(472, 'profilefield_menu', 'version', '2013050100'),
(473, 'profilefield_text', 'version', '2013050100'),
(474, 'profilefield_textarea', 'version', '2013050100'),
(475, 'report_backups', 'version', '2013050100'),
(476, 'report_completion', 'version', '2013050100'),
(478, 'report_configlog', 'version', '2013050100'),
(479, 'report_courseoverview', 'version', '2013050100'),
(480, 'report_log', 'version', '2013050100'),
(482, 'report_loglive', 'version', '2013050100'),
(483, 'report_outline', 'version', '2013050100'),
(485, 'report_participation', 'version', '2013050100'),
(487, 'report_performance', 'version', '2013050100'),
(488, 'report_progress', 'version', '2013050100'),
(490, 'report_questioninstances', 'version', '2013050100'),
(491, 'report_security', 'version', '2013050100'),
(492, 'report_stats', 'version', '2013050100'),
(494, 'gradeexport_ods', 'version', '2013050100'),
(495, 'gradeexport_txt', 'version', '2013050100'),
(496, 'gradeexport_xls', 'version', '2013050100'),
(497, 'gradeexport_xml', 'version', '2013050100'),
(498, 'gradeimport_csv', 'version', '2013050100'),
(499, 'gradeimport_xml', 'version', '2013050100'),
(500, 'gradereport_grader', 'version', '2013050100'),
(501, 'gradereport_outcomes', 'version', '2013050100'),
(502, 'gradereport_overview', 'version', '2013050100'),
(503, 'gradereport_user', 'version', '2013050100'),
(504, 'gradingform_guide', 'version', '2013051401.05'),
(505, 'gradingform_rubric', 'version', '2013051401.05'),
(506, 'mnetservice_enrol', 'version', '2013050100'),
(507, 'webservice_amf', 'version', '2013050100'),
(508, 'webservice_rest', 'version', '2013050100'),
(509, 'webservice_soap', 'version', '2013050100'),
(510, 'webservice_xmlrpc', 'version', '2013050100'),
(511, 'repository_alfresco', 'version', '2014022500'),
(512, 'repository_boxnet', 'version', '2013050103'),
(513, 'repository_coursefiles', 'version', '2013050100'),
(514, 'repository_dropbox', 'version', '2013050100'),
(515, 'repository_equella', 'version', '2013050100'),
(516, 'repository_filesystem', 'version', '2013050100'),
(517, 'repository_flickr', 'version', '2013050100'),
(518, 'repository_flickr_public', 'version', '2013050100'),
(519, 'repository_googledocs', 'version', '2013050100'),
(520, 'repository_local', 'version', '2013050100'),
(522, 'local', 'enablecourseinstances', '0'),
(523, 'local', 'enableuserinstances', '0'),
(524, 'repository_merlot', 'version', '2013050100'),
(525, 'repository_picasa', 'version', '2013050100'),
(526, 'repository_recent', 'version', '2013050100'),
(528, 'recent', 'enablecourseinstances', '0'),
(529, 'recent', 'enableuserinstances', '0'),
(530, 'repository_s3', 'version', '2013050100'),
(531, 'repository_upload', 'version', '2013050100'),
(533, 'upload', 'enablecourseinstances', '0'),
(534, 'upload', 'enableuserinstances', '0'),
(535, 'repository_url', 'version', '2013050100'),
(537, 'url', 'enablecourseinstances', '0'),
(538, 'url', 'enableuserinstances', '0'),
(539, 'repository_user', 'version', '2013050100'),
(541, 'user', 'enablecourseinstances', '0'),
(542, 'user', 'enableuserinstances', '0'),
(543, 'repository_webdav', 'version', '2013050100'),
(544, 'repository_wikimedia', 'version', '2013050100'),
(546, 'wikimedia', 'enablecourseinstances', '0'),
(547, 'wikimedia', 'enableuserinstances', '0'),
(548, 'repository_youtube', 'version', '2013050100'),
(550, 'youtube', 'enablecourseinstances', '0'),
(551, 'youtube', 'enableuserinstances', '0'),
(552, 'portfolio_boxnet', 'version', '2013050102'),
(553, 'portfolio_download', 'version', '2013050100'),
(554, 'portfolio_flickr', 'version', '2013050100'),
(555, 'portfolio_googledocs', 'version', '2013050100'),
(556, 'portfolio_mahara', 'version', '2013050100'),
(557, 'portfolio_picasa', 'version', '2013050100'),
(558, 'qbehaviour_adaptive', 'version', '2013050100'),
(559, 'qbehaviour_adaptivenopenalty', 'version', '2013050100'),
(560, 'qbehaviour_deferredcbm', 'version', '2013050100'),
(561, 'qbehaviour_deferredfeedback', 'version', '2013050100'),
(562, 'qbehaviour_immediatecbm', 'version', '2013050100'),
(563, 'qbehaviour_immediatefeedback', 'version', '2013050100'),
(564, 'qbehaviour_informationitem', 'version', '2013050100'),
(565, 'qbehaviour_interactive', 'version', '2013050100'),
(566, 'qbehaviour_interactivecountback', 'version', '2013050100'),
(567, 'qbehaviour_manualgraded', 'version', '2013050800'),
(569, 'question', 'disabledbehaviours', 'manualgraded'),
(570, 'qbehaviour_missing', 'version', '2013050100'),
(571, 'qformat_aiken', 'version', '2013050100'),
(572, 'qformat_blackboard_six', 'version', '2013050100'),
(573, 'qformat_examview', 'version', '2013050100'),
(574, 'qformat_gift', 'version', '2013050100'),
(575, 'qformat_learnwise', 'version', '2013050100'),
(576, 'qformat_missingword', 'version', '2013050100'),
(577, 'qformat_multianswer', 'version', '2013050100'),
(578, 'qformat_webct', 'version', '2013050101'),
(579, 'qformat_xhtml', 'version', '2013050100'),
(580, 'qformat_xml', 'version', '2013050100'),
(581, 'tool_assignmentupgrade', 'version', '2013050100'),
(582, 'tool_behat', 'version', '2013050102'),
(583, 'tool_capability', 'version', '2013050100'),
(584, 'tool_customlang', 'version', '2013050100'),
(586, 'tool_dbtransfer', 'version', '2013050100'),
(587, 'tool_generator', 'version', '2013051402.04'),
(588, 'tool_health', 'version', '2013050100'),
(589, 'tool_innodb', 'version', '2013050100'),
(590, 'tool_installaddon', 'version', '2013050100'),
(591, 'tool_langimport', 'version', '2013050100'),
(592, 'tool_multilangupgrade', 'version', '2013050100'),
(593, 'tool_phpunit', 'version', '2013050100'),
(594, 'tool_profiling', 'version', '2013050200'),
(595, 'tool_qeupgradehelper', 'version', '2013050100'),
(597, 'tool_replace', 'version', '2013050100'),
(598, 'tool_spamcleaner', 'version', '2013050100'),
(599, 'tool_timezoneimport', 'version', '2013050100'),
(600, 'tool_unsuproles', 'version', '2013050100'),
(602, 'tool_uploaduser', 'version', '2013050100'),
(603, 'tool_xmldb', 'version', '2013050100'),
(604, 'cachestore_file', 'version', '2013050100'),
(605, 'cachestore_memcache', 'version', '2013050700'),
(606, 'cachestore_memcached', 'version', '2013050100'),
(607, 'cachestore_mongodb', 'version', '2013050100'),
(608, 'cachestore_session', 'version', '2013050100'),
(609, 'cachestore_static', 'version', '2013050100'),
(610, 'theme_afterburner', 'version', '2013050100'),
(611, 'theme_anomaly', 'version', '2013050100'),
(612, 'theme_arialist', 'version', '2013050100'),
(613, 'theme_base', 'version', '2013050100'),
(614, 'theme_binarius', 'version', '2013050100'),
(615, 'theme_bootstrapbase', 'version', '2013050100'),
(616, 'theme_boxxie', 'version', '2013050100'),
(617, 'theme_brick', 'version', '2013050100'),
(618, 'theme_canvas', 'version', '2013050100'),
(619, 'theme_clean', 'version', '2013050100'),
(620, 'theme_formal_white', 'version', '2013050100'),
(622, 'theme_formfactor', 'version', '2013050100'),
(623, 'theme_fusion', 'version', '2013050100'),
(624, 'theme_leatherbound', 'version', '2013050100'),
(625, 'theme_magazine', 'version', '2013050100'),
(626, 'theme_mymobile', 'version', '2013050100'),
(627, 'theme_nimble', 'version', '2013050100'),
(628, 'theme_nonzero', 'version', '2013050100'),
(629, 'theme_overlay', 'version', '2013050100'),
(630, 'theme_serenity', 'version', '2013050100'),
(631, 'theme_sky_high', 'version', '2013050100'),
(632, 'theme_splash', 'version', '2013050100'),
(633, 'theme_standard', 'version', '2013050100'),
(634, 'theme_standardold', 'version', '2013050100'),
(635, 'assignsubmission_comments', 'version', '2013050100'),
(637, 'assignsubmission_file', 'sortorder', '1'),
(638, 'assignsubmission_comments', 'sortorder', '2'),
(639, 'assignsubmission_onlinetext', 'sortorder', '0'),
(640, 'assignsubmission_file', 'version', '2013050100'),
(641, 'assignsubmission_onlinetext', 'version', '2013050100'),
(643, 'assignfeedback_comments', 'version', '2013050100'),
(645, 'assignfeedback_comments', 'sortorder', '0'),
(646, 'assignfeedback_file', 'sortorder', '2'),
(647, 'assignfeedback_offline', 'sortorder', '1'),
(648, 'assignfeedback_file', 'version', '2013050100'),
(650, 'assignfeedback_offline', 'version', '2013050100'),
(651, 'assignment_offline', 'version', '2013050100'),
(652, 'assignment_online', 'version', '2013050100'),
(653, 'assignment_upload', 'version', '2013050100'),
(654, 'assignment_uploadsingle', 'version', '2013050100'),
(655, 'booktool_exportimscp', 'version', '2013050100'),
(656, 'booktool_importhtml', 'version', '2013050100'),
(657, 'booktool_print', 'version', '2013050100'),
(658, 'datafield_checkbox', 'version', '2013050100'),
(659, 'datafield_date', 'version', '2013050100'),
(660, 'datafield_file', 'version', '2013050100'),
(661, 'datafield_latlong', 'version', '2013050100'),
(662, 'datafield_menu', 'version', '2013050100'),
(663, 'datafield_multimenu', 'version', '2013050100'),
(664, 'datafield_number', 'version', '2013050100'),
(665, 'datafield_picture', 'version', '2013050100'),
(666, 'datafield_radiobutton', 'version', '2013050100'),
(667, 'datafield_text', 'version', '2013050100'),
(668, 'datafield_textarea', 'version', '2013050100'),
(669, 'datafield_url', 'version', '2013050100'),
(670, 'datapreset_imagegallery', 'version', '2013050100'),
(671, 'quiz_grading', 'version', '2013050100'),
(673, 'quiz_overview', 'version', '2013050100'),
(675, 'quiz_responses', 'version', '2013050100'),
(677, 'quiz_statistics', 'version', '2013050100'),
(679, 'quizaccess_delaybetweenattempts', 'version', '2013050100'),
(680, 'quizaccess_ipaddress', 'version', '2013050100'),
(681, 'quizaccess_numattempts', 'version', '2013050100'),
(682, 'quizaccess_openclosedate', 'version', '2013050100'),
(683, 'quizaccess_password', 'version', '2013050100'),
(684, 'quizaccess_safebrowser', 'version', '2013050100'),
(685, 'quizaccess_securewindow', 'version', '2013050100'),
(686, 'quizaccess_timelimit', 'version', '2013050100'),
(687, 'scormreport_basic', 'version', '2013050100'),
(688, 'scormreport_graphs', 'version', '2013050100'),
(689, 'scormreport_interactions', 'version', '2013050100'),
(690, 'workshopform_accumulative', 'version', '2013050100'),
(692, 'workshopform_comments', 'version', '2013050100'),
(694, 'workshopform_numerrors', 'version', '2013050100'),
(696, 'workshopform_rubric', 'version', '2013050100'),
(698, 'workshopallocation_manual', 'version', '2013050100'),
(699, 'workshopallocation_random', 'version', '2013050100'),
(700, 'workshopallocation_scheduled', 'version', '2013050100'),
(701, 'workshopeval_best', 'version', '2013050100'),
(702, 'tinymce_ctrlhelp', 'version', '2013050100'),
(703, 'tinymce_dragmath', 'version', '2013050100'),
(704, 'tinymce_moodleemoticon', 'version', '2013050100'),
(705, 'tinymce_moodleimage', 'version', '2013050100'),
(706, 'tinymce_moodlemedia', 'version', '2013050100'),
(707, 'tinymce_moodlenolink', 'version', '2013050100'),
(708, 'tinymce_spellchecker', 'version', '2013050100'),
(710, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments'),
(711, 'assign', 'showrecentsubmissions', '0'),
(712, 'assign', 'submissionreceipts', '1'),
(713, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.'),
(714, 'assign', 'requiresubmissionstatement', '0'),
(715, 'book', 'requiremodintro', '1'),
(716, 'book', 'numberingoptions', '0,1,2,3'),
(717, 'book', 'numbering', '1'),
(718, 'folder', 'requiremodintro', '1'),
(719, 'folder', 'showexpanded', '1'),
(720, 'imscp', 'requiremodintro', '1'),
(721, 'imscp', 'keepold', '1'),
(722, 'imscp', 'keepold_adv', '0'),
(723, 'label', 'dndmedia', '1'),
(724, 'label', 'dndresizewidth', '400'),
(725, 'label', 'dndresizeheight', '400'),
(726, 'page', 'requiremodintro', '1'),
(727, 'page', 'displayoptions', '5'),
(728, 'page', 'printheading', '1'),
(729, 'page', 'printintro', '0'),
(730, 'page', 'display', '5'),
(731, 'page', 'popupwidth', '620'),
(732, 'page', 'popupheight', '450'),
(733, 'quiz', 'timelimit', '0'),
(734, 'quiz', 'timelimit_adv', '0'),
(735, 'quiz', 'overduehandling', 'autoabandon'),
(736, 'quiz', 'overduehandling_adv', '0'),
(737, 'quiz', 'graceperiod', '86400'),
(738, 'quiz', 'graceperiod_adv', '0'),
(739, 'quiz', 'graceperiodmin', '60'),
(740, 'quiz', 'attempts', '0'),
(741, 'quiz', 'attempts_adv', '0'),
(742, 'quiz', 'grademethod', '1'),
(743, 'quiz', 'grademethod_adv', '0'),
(744, 'quiz', 'maximumgrade', '10'),
(745, 'quiz', 'shufflequestions', '0'),
(746, 'quiz', 'shufflequestions_adv', '0'),
(747, 'quiz', 'questionsperpage', '1'),
(748, 'quiz', 'questionsperpage_adv', '0'),
(749, 'quiz', 'navmethod', 'free'),
(750, 'quiz', 'navmethod_adv', '1'),
(751, 'quiz', 'shuffleanswers', '1'),
(752, 'quiz', 'shuffleanswers_adv', '0'),
(753, 'quiz', 'preferredbehaviour', 'deferredfeedback'),
(754, 'quiz', 'attemptonlast', '0'),
(755, 'quiz', 'attemptonlast_adv', '1'),
(756, 'quiz', 'reviewattempt', '69904'),
(757, 'quiz', 'reviewcorrectness', '69904'),
(758, 'quiz', 'reviewmarks', '69904'),
(759, 'quiz', 'reviewspecificfeedback', '69904'),
(760, 'quiz', 'reviewgeneralfeedback', '69904'),
(761, 'quiz', 'reviewrightanswer', '69904'),
(762, 'quiz', 'reviewoverallfeedback', '4368'),
(763, 'quiz', 'showuserpicture', '0'),
(764, 'quiz', 'showuserpicture_adv', '0'),
(765, 'quiz', 'decimalpoints', '2'),
(766, 'quiz', 'decimalpoints_adv', '0'),
(767, 'quiz', 'questiondecimalpoints', '-1'),
(768, 'quiz', 'questiondecimalpoints_adv', '1'),
(769, 'quiz', 'showblocks', '0'),
(770, 'quiz', 'showblocks_adv', '1'),
(771, 'quiz', 'password', ''),
(772, 'quiz', 'password_adv', '1'),
(773, 'quiz', 'subnet', ''),
(774, 'quiz', 'subnet_adv', '1'),
(775, 'quiz', 'delay1', '0'),
(776, 'quiz', 'delay1_adv', '1'),
(777, 'quiz', 'delay2', '0'),
(778, 'quiz', 'delay2_adv', '1'),
(779, 'quiz', 'browsersecurity', '-'),
(780, 'quiz', 'browsersecurity_adv', '1'),
(781, 'quiz', 'autosaveperiod', '0'),
(782, 'resource', 'framesize', '130'),
(783, 'resource', 'requiremodintro', '1'),
(784, 'resource', 'displayoptions', '0,1,4,5,6'),
(785, 'resource', 'printheading', '0'),
(786, 'resource', 'printintro', '1'),
(787, 'resource', 'display', '0'),
(788, 'resource', 'showsize', '0'),
(789, 'resource', 'showtype', '0'),
(790, 'resource', 'popupwidth', '620'),
(791, 'resource', 'popupheight', '450'),
(792, 'resource', 'filterfiles', '0'),
(793, 'scorm', 'displaycoursestructure', '0'),
(794, 'scorm', 'displaycoursestructure_adv', '0'),
(795, 'scorm', 'popup', '0'),
(796, 'scorm', 'popup_adv', '0'),
(797, 'scorm', 'framewidth', '100'),
(798, 'scorm', 'framewidth_adv', '1'),
(799, 'scorm', 'frameheight', '500'),
(800, 'scorm', 'frameheight_adv', '1'),
(801, 'scorm', 'winoptgrp_adv', '1'),
(802, 'scorm', 'resizable', '0'),
(803, 'scorm', 'scrollbars', '0'),
(804, 'scorm', 'directories', '0'),
(805, 'scorm', 'location', '0'),
(806, 'scorm', 'menubar', '0'),
(807, 'scorm', 'toolbar', '0'),
(808, 'scorm', 'status', '0'),
(809, 'scorm', 'skipview', '0'),
(810, 'scorm', 'skipview_adv', '1'),
(811, 'scorm', 'hidebrowse', '0'),
(812, 'scorm', 'hidebrowse_adv', '1'),
(813, 'scorm', 'hidetoc', '0'),
(814, 'scorm', 'hidetoc_adv', '1'),
(815, 'scorm', 'hidenav', '0'),
(816, 'scorm', 'hidenav_adv', '0'),
(817, 'scorm', 'displayattemptstatus', '1'),
(818, 'scorm', 'displayattemptstatus_adv', '0'),
(819, 'scorm', 'grademethod', '1'),
(820, 'scorm', 'maxgrade', '100'),
(821, 'scorm', 'maxattempt', '0'),
(822, 'scorm', 'whatgrade', '0'),
(823, 'scorm', 'forcecompleted', '0'),
(824, 'scorm', 'forcenewattempt', '0'),
(825, 'scorm', 'lastattemptlock', '0'),
(826, 'scorm', 'auto', '0'),
(827, 'scorm', 'updatefreq', '0'),
(828, 'scorm', 'allowtypeexternal', '0'),
(829, 'scorm', 'allowtypelocalsync', '0'),
(830, 'scorm', 'allowtypeimsrepository', '0'),
(831, 'scorm', 'allowtypeexternalaicc', '0'),
(832, 'scorm', 'allowaicchacp', '0'),
(833, 'scorm', 'aicchacptimeout', '30'),
(834, 'scorm', 'aicchacpkeepsessiondata', '1'),
(835, 'scorm', 'forcejavascript', '1'),
(836, 'scorm', 'allowapidebug', '0'),
(837, 'scorm', 'apidebugmask', '.*'),
(838, 'url', 'framesize', '130'),
(839, 'url', 'requiremodintro', '1'),
(840, 'url', 'secretphrase', ''),
(841, 'url', 'rolesinparams', '0'),
(842, 'url', 'displayoptions', '0,1,5,6'),
(843, 'url', 'printheading', '0'),
(844, 'url', 'printintro', '1'),
(845, 'url', 'display', '0'),
(846, 'url', 'popupwidth', '620'),
(847, 'url', 'popupheight', '450'),
(848, 'workshop', 'grade', '80'),
(849, 'workshop', 'gradinggrade', '20'),
(850, 'workshop', 'gradedecimals', '0'),
(851, 'workshop', 'maxbytes', '0'),
(852, 'workshop', 'strategy', 'accumulative'),
(853, 'workshop', 'examplesmode', '0'),
(854, 'workshopallocation_random', 'numofreviews', '5'),
(855, 'workshopform_numerrors', 'grade0', 'No'),
(856, 'workshopform_numerrors', 'grade1', 'Yes'),
(857, 'workshopeval_best', 'comparison', '5'),
(858, 'assignsubmission_file', 'default', '1'),
(859, 'assignsubmission_file', 'maxbytes', '1048576'),
(860, 'assignsubmission_onlinetext', 'default', '0'),
(861, 'assignsubmission_comments', 'default', '0'),
(862, 'assignfeedback_comments', 'default', '1'),
(863, 'assignfeedback_file', 'default', '0'),
(864, 'assignfeedback_offline', 'default', '0'),
(865, 'enrol_cohort', 'roleid', '5'),
(866, 'enrol_cohort', 'unenrolaction', '0'),
(867, 'enrol_database', 'defaultrole', '5'),
(868, 'enrol_database', 'defaultcategory', '1'),
(869, 'enrol_imsenterprise', 'imsrolemap01', '5'),
(870, 'enrol_imsenterprise', 'imsrolemap02', '3'),
(871, 'enrol_imsenterprise', 'imsrolemap03', '3'),
(872, 'enrol_imsenterprise', 'imsrolemap04', '5'),
(873, 'enrol_imsenterprise', 'imsrolemap05', '0'),
(874, 'enrol_imsenterprise', 'imsrolemap06', '4'),
(875, 'enrol_imsenterprise', 'imsrolemap07', '0'),
(876, 'enrol_imsenterprise', 'imsrolemap08', '4'),
(877, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode'),
(878, 'enrol_imsenterprise', 'imscoursemapfullname', 'short'),
(879, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore'),
(880, 'enrol_manual', 'roleid', '5'),
(881, 'enrol_meta', 'nosyncroleids', ''),
(882, 'enrol_meta', 'syncall', '1'),
(883, 'enrol_meta', 'unenrolaction', '3'),
(884, 'enrol_mnet', 'roleid', '5'),
(885, 'enrol_mnet', 'roleid_adv', '1'),
(886, 'enrol_paypal', 'roleid', '5'),
(887, 'enrol_self', 'roleid', '5'),
(888, 'enrol_ldap', 'objectclass', '(objectClass=*)');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context`
--

CREATE TABLE IF NOT EXISTS `mdl_context` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='one of these must be set' AUTO_INCREMENT=20 ;

--
-- Dumping data for table `mdl_context`
--

INSERT INTO `mdl_context` (`id`, `contextlevel`, `instanceid`, `path`, `depth`) VALUES
(1, 10, 0, '/1', 1),
(2, 50, 1, '/1/2', 2),
(3, 40, 1, '/1/3', 2),
(4, 30, 1, '/1/4', 2),
(5, 30, 2, '/1/5', 2),
(6, 80, 1, '/1/2/6', 3),
(7, 80, 2, '/1/2/7', 3),
(8, 80, 3, '/1/2/8', 3),
(9, 80, 4, '/1/9', 2),
(10, 80, 5, '/1/10', 2),
(11, 80, 6, '/1/11', 2),
(12, 80, 7, '/1/12', 2),
(13, 80, 8, '/1/13', 2),
(14, 80, 9, '/1/14', 2),
(15, 50, 2, '/1/3/15', 3),
(16, 80, 10, '/1/3/15/16', 4),
(17, 80, 11, '/1/3/15/17', 4),
(18, 80, 12, '/1/3/15/18', 4),
(19, 80, 13, '/1/3/15/19', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context_temp`
--

CREATE TABLE IF NOT EXISTS `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by build_context_path() in upgrade and cron to keep con';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course`
--

CREATE TABLE IF NOT EXISTS `mdl_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `sectioncache` longtext,
  `modinfo` longtext,
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Central course table' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_course`
--

INSERT INTO `mdl_course` (`id`, `category`, `sortorder`, `fullname`, `shortname`, `idnumber`, `summary`, `summaryformat`, `format`, `showgrades`, `sectioncache`, `modinfo`, `newsitems`, `startdate`, `marker`, `maxbytes`, `legacyfiles`, `showreports`, `visible`, `visibleold`, `groupmode`, `groupmodeforce`, `defaultgroupingid`, `lang`, `theme`, `timecreated`, `timemodified`, `requested`, `enablecompletion`, `completionnotify`) VALUES
(1, 0, 1, 'avni', 'avni', '', '', 0, 'site', 1, 'a:0:{}', 'a:0:{}', 3, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', 1438373708, 1438375417, 0, 0, 0),
(2, 1, 10001, 'cloud computing', 'cloud', '', '', 1, 'weeks', 1, 'a:1:{i:0;O:8:"stdClass":2:{s:2:"id";s:1:"1";s:4:"name";N;}}', 'a:0:{}', 5, 1438453800, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', 1438375562, 1438375562, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_course_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `theme` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Course categories' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_course_categories`
--

INSERT INTO `mdl_course_categories` (`id`, `name`, `idnumber`, `description`, `descriptionformat`, `parent`, `sortorder`, `coursecount`, `visible`, `visibleold`, `timemodified`, `depth`, `path`, `theme`) VALUES
(1, 'Miscellaneous', NULL, NULL, 0, 0, 10000, 1, 1, 1, 1438373709, 1, '/1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completions`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion records' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion aggregation methods for criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion user records' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_format_options`
--

CREATE TABLE IF NOT EXISTS `mdl_course_format_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  KEY `mdl_courformopti_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores format-specific options for the course or course sect' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_course_format_options`
--

INSERT INTO `mdl_course_format_options` (`id`, `courseid`, `format`, `sectionid`, `name`, `value`) VALUES
(1, 1, 'site', 0, 'numsections', '1'),
(2, 2, 'weeks', 0, 'numsections', '10'),
(3, 2, 'weeks', 0, 'hiddensections', '0'),
(4, 2, 'weeks', 0, 'coursedisplay', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupmembersonly` smallint(4) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='course_modules table retrofitted from MySQL' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_availability`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_availability` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavai_cou_ix` (`coursemoduleid`),
  KEY `mdl_courmoduavai_sou_ix` (`sourcecmid`),
  KEY `mdl_courmoduavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table stores conditions that affect whether a module/activit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_avail_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_avail_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userfield` varchar(50) DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavaifiel_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user field conditions that affect whether an activity' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_completion`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the completion state (completed or not completed, etc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_published`
--

CREATE TABLE IF NOT EXISTS `mdl_course_published` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about how and when an local courses were publish' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_request`
--

CREATE TABLE IF NOT EXISTS `mdl_course_request` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='course requests' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='to define the sections for each course' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_course_sections`
--

INSERT INTO `mdl_course_sections` (`id`, `course`, `section`, `name`, `summary`, `summaryformat`, `sequence`, `visible`, `availablefrom`, `availableuntil`, `showavailability`, `groupingid`) VALUES
(1, 2, 0, NULL, '', 1, '', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections_availability`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections_availability` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursesectionid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coursectavai_cou_ix` (`coursesectionid`),
  KEY `mdl_coursectavai_sou_ix` (`sourcecmid`),
  KEY `mdl_coursectavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Completion or grade conditions that affect if a section is c' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections_avail_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections_avail_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursesectionid` bigint(10) NOT NULL,
  `userfield` varchar(50) DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_coursectavaifiel_cou_ix` (`coursesectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user field conditions that affect whether an activity' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data`
--

CREATE TABLE IF NOT EXISTS `mdl_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext,
  `listtemplate` longtext,
  `listtemplateheader` longtext,
  `listtemplatefooter` longtext,
  `addtemplate` longtext,
  `rsstemplate` longtext,
  `rsstitletemplate` longtext,
  `csstemplate` longtext,
  `jstemplate` longtext,
  `asearchtemplate` longtext,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all database activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_content`
--

CREATE TABLE IF NOT EXISTS `mdl_data_content` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext,
  `content1` longtext,
  `content2` longtext,
  `content3` longtext,
  `content4` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the content introduced in each record/fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_data_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  `param6` longtext,
  `param7` longtext,
  `param8` longtext,
  `param9` longtext,
  `param10` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every field available' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_records`
--

CREATE TABLE IF NOT EXISTS `mdl_data_records` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every record introduced' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  `cost` varchar(20) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) DEFAULT NULL,
  `customchar2` varchar(255) DEFAULT NULL,
  `customchar3` varchar(1333) DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext,
  `customtext2` longtext,
  `customtext3` longtext,
  `customtext4` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Instances of enrolment plugins used in courses, fields marke' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_enrol`
--

INSERT INTO `mdl_enrol` (`id`, `enrol`, `status`, `courseid`, `sortorder`, `name`, `enrolperiod`, `enrolstartdate`, `enrolenddate`, `expirynotify`, `expirythreshold`, `notifyall`, `password`, `cost`, `currency`, `roleid`, `customint1`, `customint2`, `customint3`, `customint4`, `customint5`, `customint6`, `customint7`, `customint8`, `customchar1`, `customchar2`, `customchar3`, `customdec1`, `customdec2`, `customtext1`, `customtext2`, `customtext3`, `customtext4`, `timecreated`, `timemodified`) VALUES
(1, 'manual', 0, 2, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1438375563, 1438375563),
(2, 'guest', 1, 2, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1438375563, 1438375563),
(3, 'self', 1, 2, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1438375563, 1438375563);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_authorize`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_authorize` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `paymentmethod` varchar(6) NOT NULL DEFAULT 'cc',
  `refundinfo` smallint(4) NOT NULL DEFAULT '0',
  `ccname` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `transid` bigint(20) NOT NULL DEFAULT '0',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `settletime` bigint(10) NOT NULL DEFAULT '0',
  `amount` varchar(10) NOT NULL DEFAULT '',
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  PRIMARY KEY (`id`),
  KEY `mdl_enroauth_cou_ix` (`courseid`),
  KEY `mdl_enroauth_use_ix` (`userid`),
  KEY `mdl_enroauth_sta_ix` (`status`),
  KEY `mdl_enroauth_tra_ix` (`transid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds all known information about authorize.net transactions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_authorize_refunds`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_authorize_refunds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `orderid` bigint(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `amount` varchar(10) NOT NULL DEFAULT '',
  `transid` bigint(20) DEFAULT '0',
  `settletime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroauthrefu_tra_ix` (`transid`),
  KEY `mdl_enroauthrefu_ord_ix` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Authorize.net refunds' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_flatfile`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(30) NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='enrol_flatfile table retrofitted from MySQL' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_paypal`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) NOT NULL DEFAULT '',
  `receiver_email` varchar(255) NOT NULL DEFAULT '',
  `receiver_id` varchar(255) NOT NULL DEFAULT '',
  `item_name` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) NOT NULL DEFAULT '',
  `tax` varchar(255) NOT NULL DEFAULT '',
  `option_name1` varchar(255) NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) NOT NULL DEFAULT '',
  `option_name2` varchar(255) NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) NOT NULL DEFAULT '',
  `payment_status` varchar(255) NOT NULL DEFAULT '',
  `pending_reason` varchar(255) NOT NULL DEFAULT '',
  `reason_code` varchar(30) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) NOT NULL DEFAULT '',
  `payment_type` varchar(30) NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds all known information about PayPal transactions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event`
--

CREATE TABLE IF NOT EXISTS `mdl_event` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `description` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For everything with a time associated to it' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) NOT NULL DEFAULT '',
  `component` varchar(166) NOT NULL DEFAULT '',
  `handlerfile` varchar(255) NOT NULL DEFAULT '',
  `handlerfunction` longtext,
  `schedule` varchar(255) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table is for storing which components requests what typ' AUTO_INCREMENT=26 ;

--
-- Dumping data for table `mdl_events_handlers`
--

INSERT INTO `mdl_events_handlers` (`id`, `eventname`, `component`, `handlerfile`, `handlerfunction`, `schedule`, `status`, `internal`) VALUES
(1, 'portfolio_send', 'moodle', '/lib/portfoliolib.php', 's:22:"portfolio_handle_event";', 'cron', 0, 0),
(2, 'course_completed', 'moodle', '/lib/badgeslib.php', 's:42:"badges_award_handle_course_criteria_review";', 'instant', 0, 1),
(3, 'activity_completion_changed', 'moodle', '/lib/badgeslib.php', 's:44:"badges_award_handle_activity_criteria_review";', 'instant', 0, 1),
(4, 'user_updated', 'moodle', '/lib/badgeslib.php', 's:43:"badges_award_handle_profile_criteria_review";', 'instant', 0, 1),
(5, 'user_logout', 'mod_chat', '/mod/chat/lib.php', 's:16:"chat_user_logout";', 'instant', 0, 1),
(6, 'role_assigned', 'mod_forum', '/mod/forum/lib.php', 's:24:"forum_user_role_assigned";', 'instant', 0, 1),
(7, 'user_unenrolled', 'mod_forum', '/mod/forum/lib.php', 's:21:"forum_user_unenrolled";', 'instant', 0, 1),
(8, 'quiz_attempt_submitted', 'mod_quiz', '/mod/quiz/locallib.php', 's:30:"quiz_attempt_submitted_handler";', 'cron', 0, 1),
(9, 'quiz_attempt_overdue', 'mod_quiz', '/mod/quiz/locallib.php', 's:28:"quiz_attempt_overdue_handler";', 'cron', 0, 1),
(10, 'groups_member_added', 'mod_quiz', '/mod/quiz/locallib.php', 's:32:"quiz_groups_member_added_handler";', 'instant', 0, 1),
(11, 'groups_member_removed', 'mod_quiz', '/mod/quiz/locallib.php', 's:34:"quiz_groups_member_removed_handler";', 'instant', 0, 1),
(12, 'groups_members_removed', 'mod_quiz', '/mod/quiz/locallib.php', 's:35:"quiz_groups_members_removed_handler";', 'instant', 0, 1),
(13, 'groups_group_deleted', 'mod_quiz', '/mod/quiz/locallib.php', 's:33:"quiz_groups_group_deleted_handler";', 'instant', 0, 1),
(14, 'role_assigned', 'enrol_category', '/enrol/category/locallib.php', 'a:2:{i:0;s:22:"enrol_category_handler";i:1;s:13:"role_assigned";}', 'instant', 0, 1),
(15, 'role_unassigned', 'enrol_category', '/enrol/category/locallib.php', 'a:2:{i:0;s:22:"enrol_category_handler";i:1;s:15:"role_unassigned";}', 'instant', 0, 1),
(16, 'cohort_member_added', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:12:"member_added";}', 'instant', 0, 1),
(17, 'cohort_member_removed', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:14:"member_removed";}', 'instant', 0, 1),
(18, 'cohort_deleted', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:7:"deleted";}', 'instant', 0, 1),
(19, 'role_assigned', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:13:"role_assigned";}', 'instant', 0, 1),
(20, 'role_unassigned', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:15:"role_unassigned";}', 'instant', 0, 1),
(21, 'user_enrolled', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:13:"user_enrolled";}', 'instant', 0, 1),
(22, 'user_unenrolled', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:15:"user_unenrolled";}', 'instant', 0, 1),
(23, 'user_enrol_modified', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:19:"user_enrol_modified";}', 'instant', 0, 1),
(24, 'course_deleted', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:14:"course_deleted";}', 'instant', 0, 1),
(25, 'workshop_viewed', 'workshopallocation_scheduled', '/mod/workshop/allocation/scheduled/lib.php', 's:44:"workshopallocation_scheduled_workshop_viewed";', 'instant', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventdata` longtext NOT NULL,
  `stackdump` longtext,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is for storing queued events. It stores only one ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is the list of queued handlers for processing. The even' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks subscriptions to remote calendars.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `classname` varchar(100) NOT NULL DEFAULT '',
  `methodname` varchar(100) NOT NULL DEFAULT '',
  `classpath` varchar(255) DEFAULT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `capabilities` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='list of all external functions' AUTO_INCREMENT=98 ;

--
-- Dumping data for table `mdl_external_functions`
--

INSERT INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`) VALUES
(1, 'core_cohort_create_cohorts', 'core_cohort_external', 'create_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(2, 'core_cohort_delete_cohorts', 'core_cohort_external', 'delete_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(3, 'core_cohort_get_cohorts', 'core_cohort_external', 'get_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(4, 'core_cohort_update_cohorts', 'core_cohort_external', 'update_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(5, 'core_cohort_add_cohort_members', 'core_cohort_external', 'add_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(6, 'core_cohort_delete_cohort_members', 'core_cohort_external', 'delete_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(7, 'core_cohort_get_cohort_members', 'core_cohort_external', 'get_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(8, 'moodle_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(9, 'core_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(10, 'moodle_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(11, 'core_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(12, 'moodle_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(13, 'core_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(14, 'moodle_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(15, 'core_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(16, 'moodle_group_get_groupmembers', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(17, 'core_group_get_group_members', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(18, 'moodle_group_add_groupmembers', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(19, 'core_group_add_group_members', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(20, 'moodle_group_delete_groupmembers', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(21, 'core_group_delete_group_members', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(22, 'core_group_create_groupings', 'core_group_external', 'create_groupings', 'group/externallib.php', 'moodle', ''),
(23, 'core_group_update_groupings', 'core_group_external', 'update_groupings', 'group/externallib.php', 'moodle', ''),
(24, 'core_group_get_groupings', 'core_group_external', 'get_groupings', 'group/externallib.php', 'moodle', ''),
(25, 'core_group_get_course_groupings', 'core_group_external', 'get_course_groupings', 'group/externallib.php', 'moodle', ''),
(26, 'core_group_delete_groupings', 'core_group_external', 'delete_groupings', 'group/externallib.php', 'moodle', ''),
(27, 'core_group_assign_grouping', 'core_group_external', 'assign_grouping', 'group/externallib.php', 'moodle', ''),
(28, 'core_group_unassign_grouping', 'core_group_external', 'unassign_grouping', 'group/externallib.php', 'moodle', ''),
(29, 'moodle_file_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(30, 'core_files_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(31, 'moodle_file_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(32, 'core_files_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(33, 'moodle_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(34, 'core_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(35, 'core_user_get_users', 'core_user_external', 'get_users', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(36, 'moodle_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(37, 'core_user_get_users_by_field', 'core_user_external', 'get_users_by_field', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(38, 'core_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(39, 'moodle_user_get_users_by_courseid', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(40, 'moodle_user_get_course_participants_by_id', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(41, 'core_user_get_course_user_profiles', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(42, 'moodle_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(43, 'core_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(44, 'moodle_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(45, 'core_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(46, 'core_enrol_get_enrolled_users_with_capability', 'core_enrol_external', 'get_enrolled_users_with_capability', 'enrol/externallib.php', 'moodle', ''),
(47, 'moodle_enrol_get_enrolled_users', 'moodle_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),
(48, 'core_enrol_get_enrolled_users', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(49, 'moodle_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(50, 'core_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(51, 'moodle_role_assign', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(52, 'core_role_assign_roles', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(53, 'moodle_role_unassign', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(54, 'core_role_unassign_roles', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(55, 'core_course_get_contents', 'core_course_external', 'get_course_contents', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:viewhiddencourses'),
(56, 'moodle_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(57, 'core_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(58, 'moodle_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(59, 'core_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(60, 'core_course_delete_courses', 'core_course_external', 'delete_courses', 'course/externallib.php', 'moodle', 'moodle/course:delete'),
(61, 'core_course_delete_modules', 'core_course_external', 'delete_modules', 'course/externallib.php', 'moodle', 'moodle/course:manageactivities'),
(62, 'core_course_duplicate_course', 'core_course_external', 'duplicate_course', 'course/externallib.php', 'moodle', 'moodle/backup:backupcourse,moodle/restore:restorecourse,moodle/course:create'),
(63, 'core_course_update_courses', 'core_course_external', 'update_courses', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:changecategory,moodle/course:changefullname,moodle/course:changeshortname,moodle/course:changeidnumber,moodle/course:changesummary,moodle/course:visibility'),
(64, 'core_course_get_categories', 'core_course_external', 'get_categories', 'course/externallib.php', 'moodle', 'moodle/category:viewhiddencategories'),
(65, 'core_course_create_categories', 'core_course_external', 'create_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(66, 'core_course_update_categories', 'core_course_external', 'update_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(67, 'core_course_delete_categories', 'core_course_external', 'delete_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(68, 'core_course_import_course', 'core_course_external', 'import_course', 'course/externallib.php', 'moodle', 'moodle/backup:backuptargetimport, moodle/restore:restoretargetimport'),
(69, 'moodle_message_send_instantmessages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(70, 'core_message_send_instant_messages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(71, 'core_message_create_contacts', 'core_message_external', 'create_contacts', 'message/externallib.php', 'moodle', ''),
(72, 'core_message_delete_contacts', 'core_message_external', 'delete_contacts', 'message/externallib.php', 'moodle', ''),
(73, 'core_message_block_contacts', 'core_message_external', 'block_contacts', 'message/externallib.php', 'moodle', ''),
(74, 'core_message_unblock_contacts', 'core_message_external', 'unblock_contacts', 'message/externallib.php', 'moodle', ''),
(75, 'core_message_get_contacts', 'core_message_external', 'get_contacts', 'message/externallib.php', 'moodle', ''),
(76, 'core_message_search_contacts', 'core_message_external', 'search_contacts', 'message/externallib.php', 'moodle', ''),
(77, 'moodle_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(78, 'core_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(79, 'core_notes_delete_notes', 'core_notes_external', 'delete_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(80, 'core_notes_get_notes', 'core_notes_external', 'get_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view'),
(81, 'core_notes_update_notes', 'core_notes_external', 'update_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(82, 'core_grade_get_definitions', 'core_grade_external', 'get_definitions', 'grade/externallib.php', 'moodle', ''),
(83, 'moodle_webservice_get_siteinfo', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(84, 'core_webservice_get_site_info', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(85, 'core_get_string', 'core_external', 'get_string', 'lib/external/externallib.php', 'moodle', ''),
(86, 'core_get_strings', 'core_external', 'get_strings', 'lib/external/externallib.php', 'moodle', ''),
(87, 'core_get_component_strings', 'core_external', 'get_component_strings', 'lib/external/externallib.php', 'moodle', ''),
(88, 'core_calendar_delete_calendar_events', 'core_calendar_external', 'delete_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(89, 'core_calendar_get_calendar_events', 'core_calendar_external', 'get_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(90, 'core_calendar_create_calendar_events', 'core_calendar_external', 'create_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(91, 'mod_assign_get_grades', 'mod_assign_external', 'get_grades', 'mod/assign/externallib.php', 'mod_assign', ''),
(92, 'mod_assign_get_assignments', 'mod_assign_external', 'get_assignments', 'mod/assign/externallib.php', 'mod_assign', ''),
(93, 'mod_assign_get_submissions', 'mod_assign_external', 'get_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(94, 'mod_forum_get_forums_by_courses', 'mod_forum_external', 'get_forums_by_courses', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion'),
(95, 'mod_forum_get_forum_discussions', 'mod_forum_external', 'get_forum_discussions', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),
(96, 'moodle_enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(97, 'enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='built in and custom external services' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_external_services`
--

INSERT INTO `mdl_external_services` (`id`, `name`, `enabled`, `requiredcapability`, `restrictedusers`, `component`, `timecreated`, `timemodified`, `shortname`, `downloadfiles`) VALUES
(1, 'Moodle mobile web service', 0, NULL, 0, 'moodle', 1438373723, NULL, 'moodle_mobile_app', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='lists functions available in each service group' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_external_services_functions`
--

INSERT INTO `mdl_external_services_functions` (`id`, `externalserviceid`, `functionname`) VALUES
(1, 1, 'moodle_enrol_get_users_courses'),
(2, 1, 'moodle_enrol_get_enrolled_users'),
(3, 1, 'moodle_user_get_users_by_id'),
(4, 1, 'moodle_webservice_get_siteinfo'),
(5, 1, 'moodle_notes_create_notes'),
(6, 1, 'moodle_user_get_course_participants_by_id'),
(7, 1, 'moodle_user_get_users_by_courseid'),
(8, 1, 'moodle_message_send_instantmessages'),
(9, 1, 'core_course_get_contents'),
(10, 1, 'core_get_component_strings'),
(11, 1, 'core_calendar_get_calendar_events');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_users`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='users allowed to use services with restricted users flag' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_tokens`
--

CREATE TABLE IF NOT EXISTS `mdl_external_tokens` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) NOT NULL DEFAULT '',
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Security tokens for accessing of external services' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) NOT NULL DEFAULT '',
  `page_after_submit` longtext NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all feedbacks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completed`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completedtmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_item`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_item` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `presentation` longtext NOT NULL,
  `typ` varchar(255) NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) NOT NULL DEFAULT '',
  `options` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback_items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback sitecourse map' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_template`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='templates of feedbackstructures' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_tracking`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_tracking` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtrac_use_ix` (`userid`),
  KEY `mdl_feedtrac_fee_ix` (`feedback`),
  KEY `mdl_feedtrac_com_ix` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback trackingdata' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_value`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_value` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completeds' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_valuetmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completedstmp' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files`
--

CREATE TABLE IF NOT EXISTS `mdl_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `filearea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext,
  `author` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL,
  `referencelastsync` bigint(10) DEFAULT NULL,
  `referencelifetime` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`),
  KEY `mdl_file_ref_ix` (`referencefileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='description of files, content is stored in sha1 file pool' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files_reference`
--

CREATE TABLE IF NOT EXISTS `mdl_files_reference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `lifetime` bigint(10) DEFAULT NULL,
  `reference` longtext,
  `referencehash` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filerefe_repref_uix` (`repositoryid`,`referencehash`),
  KEY `mdl_filerefe_rep_ix` (`repositoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store files references' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_active`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_active` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores information about which filters are active in which c' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_filter_active`
--

INSERT INTO `mdl_filter_active` (`id`, `filter`, `contextid`, `active`, `sortorder`) VALUES
(1, 'activitynames', 1, 1, 1),
(2, 'mediaplugin', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_config`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores per-context configuration settings for filters which ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_folder`
--

CREATE TABLE IF NOT EXISTS `mdl_folder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one folder resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum`
--

CREATE TABLE IF NOT EXISTS `mdl_forum` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT 'general',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Forums contain and structure discussion' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_discussions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Forums are composed of discussions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_posts`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_posts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='All posts are stored in this table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping track of posts that will be mailed in digest for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_read`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_usepos_ix` (`userid`,`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users read posts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of who is subscribed to what forum' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_track_prefs`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users untracked forums' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossaries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_alias`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='entries alias' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all categories for glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) NOT NULL DEFAULT '',
  `definition` longtext NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='categories of each glossary entry' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_formats`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `popupformatname` varchar(50) NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `defaultmode` varchar(50) NOT NULL DEFAULT '',
  `defaulthook` varchar(50) NOT NULL DEFAULT '',
  `sortkey` varchar(50) NOT NULL DEFAULT '',
  `sortorder` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Setting of the display formats' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_glossary_formats`
--

INSERT INTO `mdl_glossary_formats` (`id`, `name`, `popupformatname`, `visible`, `showgroup`, `defaultmode`, `defaulthook`, `sortkey`, `sortorder`) VALUES
(1, 'continuous', 'continuous', 1, 1, '', '', '', ''),
(2, 'dictionary', 'dictionary', 1, 1, '', '', '', ''),
(3, 'encyclopedia', 'encyclopedia', 1, 1, '', '', '', ''),
(4, 'entrylist', 'entrylist', 1, 1, '', '', '', ''),
(5, 'faq', 'faq', 1, 1, '', '', '', ''),
(6, 'fullwithauthor', 'fullwithauthor', 1, 1, '', '', '', ''),
(7, 'fullwithoutauthor', 'fullwithoutauthor', 1, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about categories, used for grou' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History of grade_categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='grade_grades  This table keeps individual grades for each us' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_tim_ix` (`timemodified`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_newitem`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='temporary table for storing new grade_item names from grade ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_values`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary table for importing grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about gradeable items (ie colum' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History of grade_items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_letters`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_letters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Repository for grade letters, for courses and other moodle e' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table describes the outcomes used in the system. An out' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores what outcomes are used in what courses.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='gradebook settings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcomm_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='frequently used comments used in marking guide' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the criteria grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  KEY `mdl_gradguidfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the guide is filled by a particular r' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the rubric grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the rubric is filled by a particular ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the columns of the rubric grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_areas`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_areas` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `areaname` varchar(100) NOT NULL DEFAULT '',
  `activemethod` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Identifies gradable areas where advanced grading can happen.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the basic information about an advanced grading for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading form instance is an assessment record for one gradab' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn2_ix` (`idnumber`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A grouping is a collection of groups. WAS: groups_groupings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a grouping to a group (note, groups can be in multiple ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(254) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn_ix` (`idnumber`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents a group.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups_members`
--

CREATE TABLE IF NOT EXISTS `mdl_groups_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a group.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_imscp`
--

CREATE TABLE IF NOT EXISTS `mdl_imscp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one imscp resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_label`
--

CREATE TABLE IF NOT EXISTS `mdl_label` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines labels' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timed` smallint(3) NOT NULL DEFAULT '0',
  `maxtime` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `highscores` smallint(3) NOT NULL DEFAULT '0',
  `maxhighscores` bigint(10) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_answers' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext,
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_attempts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_branch`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='branches for each lesson/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_high_scores`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_high_scores` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `nickname` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_lesshighscor_use_ix` (`userid`),
  KEY `mdl_lesshighscor_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='high scores for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `contents` longtext NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_timer`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lesson timer for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_license`
--

CREATE TABLE IF NOT EXISTS `mdl_license` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) DEFAULT NULL,
  `fullname` longtext,
  `source` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='store licenses used by moodle' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_license`
--

INSERT INTO `mdl_license` (`id`, `shortname`, `fullname`, `source`, `enabled`, `version`) VALUES
(1, 'unknown', 'Unknown license', '', 1, 2010033100),
(2, 'allrightsreserved', 'All rights reserved', 'http://en.wikipedia.org/wiki/All_rights_reserved', 1, 2010033100),
(3, 'public', 'Public Domain', 'http://creativecommons.org/licenses/publicdomain/', 1, 2010033100),
(4, 'cc', 'Creative Commons', 'http://creativecommons.org/licenses/by/3.0/', 1, 2010033100),
(5, 'cc-nd', 'Creative Commons - NoDerivs', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(6, 'cc-nc-nd', 'Creative Commons - No Commercial NoDerivs', 'http://creativecommons.org/licenses/by-nc-nd/3.0/', 1, 2010033100),
(7, 'cc-nc', 'Creative Commons - No Commercial', 'http://creativecommons.org/licenses/by-nc/3.0/', 1, 2013051500),
(8, 'cc-nc-sa', 'Creative Commons - No Commercial ShareAlike', 'http://creativecommons.org/licenses/by-nc-sa/3.0/', 1, 2010033100),
(9, 'cc-sa', 'Creative Commons - ShareAlike', 'http://creativecommons.org/licenses/by-sa/3.0/', 1, 2010033100);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log`
--

CREATE TABLE IF NOT EXISTS `mdl_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Every action is logged as far as possible' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_log`
--

INSERT INTO `mdl_log` (`id`, `time`, `userid`, `ip`, `course`, `module`, `cmid`, `action`, `url`, `info`) VALUES
(1, 1438375361, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2&course=1', ''),
(2, 1438375419, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(3, 1438375563, 2, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=2', 'cloud computing (ID 2)'),
(4, 1438375578, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(5, 1438375853, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(6, 1438375860, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(7, 1438375885, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_display`
--

CREATE TABLE IF NOT EXISTS `mdl_log_display` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(40) NOT NULL DEFAULT '',
  `mtable` varchar(30) NOT NULL DEFAULT '',
  `field` varchar(200) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='For a particular module/action, specifies a moodle table/fie' AUTO_INCREMENT=185 ;

--
-- Dumping data for table `mdl_log_display`
--

INSERT INTO `mdl_log_display` (`id`, `module`, `action`, `mtable`, `field`, `component`) VALUES
(1, 'course', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(2, 'course', 'view', 'course', 'fullname', 'moodle'),
(3, 'course', 'view section', 'course_sections', 'name', 'moodle'),
(4, 'course', 'update', 'course', 'fullname', 'moodle'),
(5, 'course', 'hide', 'course', 'fullname', 'moodle'),
(6, 'course', 'show', 'course', 'fullname', 'moodle'),
(7, 'course', 'move', 'course', 'fullname', 'moodle'),
(8, 'course', 'enrol', 'course', 'fullname', 'moodle'),
(9, 'course', 'unenrol', 'course', 'fullname', 'moodle'),
(10, 'course', 'report log', 'course', 'fullname', 'moodle'),
(11, 'course', 'report live', 'course', 'fullname', 'moodle'),
(12, 'course', 'report outline', 'course', 'fullname', 'moodle'),
(13, 'course', 'report participation', 'course', 'fullname', 'moodle'),
(14, 'course', 'report stats', 'course', 'fullname', 'moodle'),
(15, 'category', 'add', 'course_categories', 'name', 'moodle'),
(16, 'category', 'hide', 'course_categories', 'name', 'moodle'),
(17, 'category', 'move', 'course_categories', 'name', 'moodle'),
(18, 'category', 'show', 'course_categories', 'name', 'moodle'),
(19, 'category', 'update', 'course_categories', 'name', 'moodle'),
(20, 'message', 'write', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(21, 'message', 'read', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(22, 'message', 'add contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(23, 'message', 'remove contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(24, 'message', 'block contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(25, 'message', 'unblock contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(26, 'group', 'view', 'groups', 'name', 'moodle'),
(27, 'tag', 'update', 'tag', 'name', 'moodle'),
(28, 'tag', 'flag', 'tag', 'name', 'moodle'),
(29, 'user', 'view', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(30, 'assign', 'add', 'assign', 'name', 'mod_assign'),
(31, 'assign', 'delete mod', 'assign', 'name', 'mod_assign'),
(32, 'assign', 'download all submissions', 'assign', 'name', 'mod_assign'),
(33, 'assign', 'grade submission', 'assign', 'name', 'mod_assign'),
(34, 'assign', 'lock submission', 'assign', 'name', 'mod_assign'),
(35, 'assign', 'reveal identities', 'assign', 'name', 'mod_assign'),
(36, 'assign', 'revert submission to draft', 'assign', 'name', 'mod_assign'),
(37, 'assign', 'submission statement accepted', 'assign', 'name', 'mod_assign'),
(38, 'assign', 'submit', 'assign', 'name', 'mod_assign'),
(39, 'assign', 'submit for grading', 'assign', 'name', 'mod_assign'),
(40, 'assign', 'unlock submission', 'assign', 'name', 'mod_assign'),
(41, 'assign', 'update', 'assign', 'name', 'mod_assign'),
(42, 'assign', 'upload', 'assign', 'name', 'mod_assign'),
(43, 'assign', 'view', 'assign', 'name', 'mod_assign'),
(44, 'assign', 'view all', 'course', 'fullname', 'mod_assign'),
(45, 'assign', 'view confirm submit assignment form', 'assign', 'name', 'mod_assign'),
(46, 'assign', 'view grading form', 'assign', 'name', 'mod_assign'),
(47, 'assign', 'view submission', 'assign', 'name', 'mod_assign'),
(48, 'assign', 'view submission grading table', 'assign', 'name', 'mod_assign'),
(49, 'assign', 'view submit assignment form', 'assign', 'name', 'mod_assign'),
(50, 'assign', 'view feedback', 'assign', 'name', 'mod_assign'),
(51, 'assignment', 'view', 'assignment', 'name', 'mod_assignment'),
(52, 'assignment', 'add', 'assignment', 'name', 'mod_assignment'),
(53, 'assignment', 'update', 'assignment', 'name', 'mod_assignment'),
(54, 'assignment', 'view submission', 'assignment', 'name', 'mod_assignment'),
(55, 'assignment', 'upload', 'assignment', 'name', 'mod_assignment'),
(56, 'book', 'add', 'book', 'name', 'mod_book'),
(57, 'book', 'update', 'book', 'name', 'mod_book'),
(58, 'book', 'view', 'book', 'name', 'mod_book'),
(59, 'book', 'add chapter', 'book_chapters', 'title', 'mod_book'),
(60, 'book', 'update chapter', 'book_chapters', 'title', 'mod_book'),
(61, 'book', 'view chapter', 'book_chapters', 'title', 'mod_book'),
(62, 'chat', 'view', 'chat', 'name', 'mod_chat'),
(63, 'chat', 'add', 'chat', 'name', 'mod_chat'),
(64, 'chat', 'update', 'chat', 'name', 'mod_chat'),
(65, 'chat', 'report', 'chat', 'name', 'mod_chat'),
(66, 'chat', 'talk', 'chat', 'name', 'mod_chat'),
(67, 'choice', 'view', 'choice', 'name', 'mod_choice'),
(68, 'choice', 'update', 'choice', 'name', 'mod_choice'),
(69, 'choice', 'add', 'choice', 'name', 'mod_choice'),
(70, 'choice', 'report', 'choice', 'name', 'mod_choice'),
(71, 'choice', 'choose', 'choice', 'name', 'mod_choice'),
(72, 'choice', 'choose again', 'choice', 'name', 'mod_choice'),
(73, 'data', 'view', 'data', 'name', 'mod_data'),
(74, 'data', 'add', 'data', 'name', 'mod_data'),
(75, 'data', 'update', 'data', 'name', 'mod_data'),
(76, 'data', 'record delete', 'data', 'name', 'mod_data'),
(77, 'data', 'fields add', 'data_fields', 'name', 'mod_data'),
(78, 'data', 'fields update', 'data_fields', 'name', 'mod_data'),
(79, 'data', 'templates saved', 'data', 'name', 'mod_data'),
(80, 'data', 'templates def', 'data', 'name', 'mod_data'),
(81, 'feedback', 'startcomplete', 'feedback', 'name', 'mod_feedback'),
(82, 'feedback', 'submit', 'feedback', 'name', 'mod_feedback'),
(83, 'feedback', 'delete', 'feedback', 'name', 'mod_feedback'),
(84, 'feedback', 'view', 'feedback', 'name', 'mod_feedback'),
(85, 'feedback', 'view all', 'course', 'shortname', 'mod_feedback'),
(86, 'folder', 'view', 'folder', 'name', 'mod_folder'),
(87, 'folder', 'view all', 'folder', 'name', 'mod_folder'),
(88, 'folder', 'update', 'folder', 'name', 'mod_folder'),
(89, 'folder', 'add', 'folder', 'name', 'mod_folder'),
(90, 'forum', 'add', 'forum', 'name', 'mod_forum'),
(91, 'forum', 'update', 'forum', 'name', 'mod_forum'),
(92, 'forum', 'add discussion', 'forum_discussions', 'name', 'mod_forum'),
(93, 'forum', 'add post', 'forum_posts', 'subject', 'mod_forum'),
(94, 'forum', 'update post', 'forum_posts', 'subject', 'mod_forum'),
(95, 'forum', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'mod_forum'),
(96, 'forum', 'move discussion', 'forum_discussions', 'name', 'mod_forum'),
(97, 'forum', 'view subscribers', 'forum', 'name', 'mod_forum'),
(98, 'forum', 'view discussion', 'forum_discussions', 'name', 'mod_forum'),
(99, 'forum', 'view forum', 'forum', 'name', 'mod_forum'),
(100, 'forum', 'subscribe', 'forum', 'name', 'mod_forum'),
(101, 'forum', 'unsubscribe', 'forum', 'name', 'mod_forum'),
(102, 'glossary', 'add', 'glossary', 'name', 'mod_glossary'),
(103, 'glossary', 'update', 'glossary', 'name', 'mod_glossary'),
(104, 'glossary', 'view', 'glossary', 'name', 'mod_glossary'),
(105, 'glossary', 'view all', 'glossary', 'name', 'mod_glossary'),
(106, 'glossary', 'add entry', 'glossary', 'name', 'mod_glossary'),
(107, 'glossary', 'update entry', 'glossary', 'name', 'mod_glossary'),
(108, 'glossary', 'add category', 'glossary', 'name', 'mod_glossary'),
(109, 'glossary', 'update category', 'glossary', 'name', 'mod_glossary'),
(110, 'glossary', 'delete category', 'glossary', 'name', 'mod_glossary'),
(111, 'glossary', 'approve entry', 'glossary', 'name', 'mod_glossary'),
(112, 'glossary', 'view entry', 'glossary_entries', 'concept', 'mod_glossary'),
(113, 'imscp', 'view', 'imscp', 'name', 'mod_imscp'),
(114, 'imscp', 'view all', 'imscp', 'name', 'mod_imscp'),
(115, 'imscp', 'update', 'imscp', 'name', 'mod_imscp'),
(116, 'imscp', 'add', 'imscp', 'name', 'mod_imscp'),
(117, 'label', 'add', 'label', 'name', 'mod_label'),
(118, 'label', 'update', 'label', 'name', 'mod_label'),
(119, 'lesson', 'start', 'lesson', 'name', 'mod_lesson'),
(120, 'lesson', 'end', 'lesson', 'name', 'mod_lesson'),
(121, 'lesson', 'view', 'lesson_pages', 'title', 'mod_lesson'),
(122, 'lti', 'view', 'lti', 'name', 'mod_lti'),
(123, 'lti', 'launch', 'lti', 'name', 'mod_lti'),
(124, 'lti', 'view all', 'lti', 'name', 'mod_lti'),
(125, 'page', 'view', 'page', 'name', 'mod_page'),
(126, 'page', 'view all', 'page', 'name', 'mod_page'),
(127, 'page', 'update', 'page', 'name', 'mod_page'),
(128, 'page', 'add', 'page', 'name', 'mod_page'),
(129, 'quiz', 'add', 'quiz', 'name', 'mod_quiz'),
(130, 'quiz', 'update', 'quiz', 'name', 'mod_quiz'),
(131, 'quiz', 'view', 'quiz', 'name', 'mod_quiz'),
(132, 'quiz', 'report', 'quiz', 'name', 'mod_quiz'),
(133, 'quiz', 'attempt', 'quiz', 'name', 'mod_quiz'),
(134, 'quiz', 'submit', 'quiz', 'name', 'mod_quiz'),
(135, 'quiz', 'review', 'quiz', 'name', 'mod_quiz'),
(136, 'quiz', 'editquestions', 'quiz', 'name', 'mod_quiz'),
(137, 'quiz', 'preview', 'quiz', 'name', 'mod_quiz'),
(138, 'quiz', 'start attempt', 'quiz', 'name', 'mod_quiz'),
(139, 'quiz', 'close attempt', 'quiz', 'name', 'mod_quiz'),
(140, 'quiz', 'continue attempt', 'quiz', 'name', 'mod_quiz'),
(141, 'quiz', 'edit override', 'quiz', 'name', 'mod_quiz'),
(142, 'quiz', 'delete override', 'quiz', 'name', 'mod_quiz'),
(143, 'quiz', 'view summary', 'quiz', 'name', 'mod_quiz'),
(144, 'resource', 'view', 'resource', 'name', 'mod_resource'),
(145, 'resource', 'view all', 'resource', 'name', 'mod_resource'),
(146, 'resource', 'update', 'resource', 'name', 'mod_resource'),
(147, 'resource', 'add', 'resource', 'name', 'mod_resource'),
(148, 'scorm', 'view', 'scorm', 'name', 'mod_scorm'),
(149, 'scorm', 'review', 'scorm', 'name', 'mod_scorm'),
(150, 'scorm', 'update', 'scorm', 'name', 'mod_scorm'),
(151, 'scorm', 'add', 'scorm', 'name', 'mod_scorm'),
(152, 'survey', 'add', 'survey', 'name', 'mod_survey'),
(153, 'survey', 'update', 'survey', 'name', 'mod_survey'),
(154, 'survey', 'download', 'survey', 'name', 'mod_survey'),
(155, 'survey', 'view form', 'survey', 'name', 'mod_survey'),
(156, 'survey', 'view graph', 'survey', 'name', 'mod_survey'),
(157, 'survey', 'view report', 'survey', 'name', 'mod_survey'),
(158, 'survey', 'submit', 'survey', 'name', 'mod_survey'),
(159, 'url', 'view', 'url', 'name', 'mod_url'),
(160, 'url', 'view all', 'url', 'name', 'mod_url'),
(161, 'url', 'update', 'url', 'name', 'mod_url'),
(162, 'url', 'add', 'url', 'name', 'mod_url'),
(163, 'workshop', 'add', 'workshop', 'name', 'mod_workshop'),
(164, 'workshop', 'update', 'workshop', 'name', 'mod_workshop'),
(165, 'workshop', 'view', 'workshop', 'name', 'mod_workshop'),
(166, 'workshop', 'view all', 'workshop', 'name', 'mod_workshop'),
(167, 'workshop', 'add submission', 'workshop_submissions', 'title', 'mod_workshop'),
(168, 'workshop', 'update submission', 'workshop_submissions', 'title', 'mod_workshop'),
(169, 'workshop', 'view submission', 'workshop_submissions', 'title', 'mod_workshop'),
(170, 'workshop', 'add assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(171, 'workshop', 'update assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(172, 'workshop', 'add example', 'workshop_submissions', 'title', 'mod_workshop'),
(173, 'workshop', 'update example', 'workshop_submissions', 'title', 'mod_workshop'),
(174, 'workshop', 'view example', 'workshop_submissions', 'title', 'mod_workshop'),
(175, 'workshop', 'add reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(176, 'workshop', 'update reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(177, 'workshop', 'add example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(178, 'workshop', 'update example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(179, 'workshop', 'update aggregate grades', 'workshop', 'name', 'mod_workshop'),
(180, 'workshop', 'update clear aggregated grades', 'workshop', 'name', 'mod_workshop'),
(181, 'workshop', 'update clear assessments', 'workshop', 'name', 'mod_workshop'),
(182, 'book', 'exportimscp', 'book', 'name', 'booktool_exportimscp'),
(183, 'book', 'print', 'book', 'name', 'booktool_print'),
(184, 'book', 'print chapter', 'book_chapters', 'title', 'booktool_print');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_queries`
--

CREATE TABLE IF NOT EXISTS `mdl_log_queries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext NOT NULL,
  `sqlparams` longtext,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext,
  `backtrace` longtext,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Logged database queries.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti`
--

CREATE TABLE IF NOT EXISTS `mdl_lti` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext NOT NULL,
  `securetoolurl` longtext,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) DEFAULT NULL,
  `icon` longtext,
  `secureicon` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains Basic LTI activities instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of individual submissions for LTI activities.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext NOT NULL,
  `tooldomain` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI pre-configured activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types_config`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI types configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message`
--

CREATE TABLE IF NOT EXISTS `mdl_message` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridfrom`),
  KEY `mdl_mess_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all unread messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_contacts`
--

CREATE TABLE IF NOT EXISTS `mdl_message_contacts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains lists of relationships between users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_processors`
--

CREATE TABLE IF NOT EXISTS `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List of message output plugins' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_message_processors`
--

INSERT INTO `mdl_message_processors` (`id`, `name`, `enabled`) VALUES
(1, 'email', 1),
(2, 'jabber', 1),
(3, 'popup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_providers`
--

CREATE TABLE IF NOT EXISTS `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `component` varchar(200) NOT NULL DEFAULT '',
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores the message providers (modules and core sy' AUTO_INCREMENT=24 ;

--
-- Dumping data for table `mdl_message_providers`
--

INSERT INTO `mdl_message_providers` (`id`, `name`, `component`, `capability`) VALUES
(1, 'notices', 'moodle', 'moodle/site:config'),
(2, 'errors', 'moodle', 'moodle/site:config'),
(3, 'availableupdate', 'moodle', 'moodle/site:config'),
(4, 'instantmessage', 'moodle', NULL),
(5, 'backup', 'moodle', 'moodle/site:config'),
(6, 'courserequested', 'moodle', 'moodle/site:approvecourse'),
(7, 'courserequestapproved', 'moodle', 'moodle/course:request'),
(8, 'courserequestrejected', 'moodle', 'moodle/course:request'),
(9, 'assign_notification', 'mod_assign', NULL),
(10, 'assignment_updates', 'mod_assignment', NULL),
(11, 'submission', 'mod_feedback', NULL),
(12, 'message', 'mod_feedback', NULL),
(13, 'posts', 'mod_forum', NULL),
(14, 'graded_essay', 'mod_lesson', NULL),
(15, 'submission', 'mod_quiz', 'mod/quiz:emailnotifysubmission'),
(16, 'confirmation', 'mod_quiz', 'mod/quiz:emailconfirmsubmission'),
(17, 'attempt_overdue', 'mod_quiz', 'mod/quiz:emailwarnoverdue'),
(18, 'authorize_enrolment', 'enrol_authorize', NULL),
(19, 'flatfile_enrolment', 'enrol_flatfile', NULL),
(20, 'imsenterprise_enrolment', 'enrol_imsenterprise', NULL),
(21, 'expiry_notification', 'enrol_manual', NULL),
(22, 'paypal_enrolment', 'enrol_paypal', NULL),
(23, 'expiry_notification', 'enrol_self', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_read`
--

CREATE TABLE IF NOT EXISTS `mdl_message_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridfrom`),
  KEY `mdl_messread_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all messages that have been read' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_working`
--

CREATE TABLE IF NOT EXISTS `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messwork_unr_ix` (`unreadmessageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lists all the messages and processors that need to be proces' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information fetched via XML-RPC about courses on ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information about enrolments of our local users i' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_application`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_application` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `display_name` varchar(50) NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Information about applications on remote hosts' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_mnet_application`
--

INSERT INTO `mdl_mnet_application` (`id`, `name`, `display_name`, `xmlrpc_server_url`, `sso_land_url`, `sso_jump_url`) VALUES
(1, 'moodle', 'Moodle', '/mnet/xmlrpc/server.php', '/auth/mnet/land.php', '/auth/mnet/jump.php'),
(2, 'mahara', 'Mahara', '/api/xmlrpc/server.php', '/auth/xmlrpc/land.php', '/auth/xmlrpc/jump.php');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `public_key` longtext NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Information about the local and remote hosts for RPC' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_mnet_host`
--

INSERT INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`) VALUES
(1, 0, 'http://localhost', '127.0.0.1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1),
(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host2service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about the services for a given host' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_log`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) NOT NULL DEFAULT '',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table describes functions that might be called remotely' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

INSERT INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

INSERT INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15),
(16, 4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext NOT NULL,
  `profile` longtext NOT NULL,
  `filename` varchar(100) NOT NULL DEFAULT '',
  `classname` varchar(150) DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Functions or methods that we may publish or subscribe to' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_mnet_rpc`
--

INSERT INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:37:"The unique ID provided by remotehost.";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:44:"$userdata Array of user info for remote host";}}', 'auth.php', 'auth_plugin_mnet', 0),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:39:"A plaintext report of what has happened";}}', 'auth.php', 'auth_plugin_mnet', 0),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user''s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:3:"int";s:11:"description";s:18:"The id of the user";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:84:"false if user not found, empty array if no picture exists, array with data otherwise";}}', 'auth.php', 'auth_plugin_mnet', 0),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:14:"The theme info";}}', 'auth.php', 'auth_plugin_mnet', 0),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:12:"The username";}i:1;a:3:{s:4:"name";s:7:"courses";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:15:"True on success";}}', 'auth.php', 'auth_plugin_mnet', 0),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for ''All hosts'', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:11:"empty array";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"userdata";s:4:"type";s:5:"array";s:11:"description";s:14:"user details {";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"our local course id";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:69:"true if the enrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can''t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:18:"of the remote user";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:71:"true if the unenrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:16:"ID of our course";}i:1;a:3:{s:4:"name";s:5:"roles";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:56:"the token recieved previously during send_content_intent";}}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'lib.php', 'portfolio_plugin_mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(40) NOT NULL DEFAULT '',
  `apiversion` varchar(10) NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='A service is a group of functions' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_mnet_service`
--

INSERT INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
(1, 'sso_idp', '', '1', 1),
(2, 'sso_sp', '', '1', 1),
(3, 'mnet_enrol', '', '1', 1),
(4, 'pf', '', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

INSERT INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_session`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `token` varchar(40) NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users by host permitted (or not) to login from a remote prov' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='modules available in the site' AUTO_INCREMENT=23 ;

--
-- Dumping data for table `mdl_modules`
--

INSERT INTO `mdl_modules` (`id`, `name`, `version`, `cron`, `lastcron`, `search`, `visible`) VALUES
(1, 'assign', 2013050101, 60, 0, '', 1),
(2, 'assignment', 2013050100, 60, 0, '', 0),
(3, 'book', 2013050100, 0, 0, '', 1),
(4, 'chat', 2013050100, 300, 0, '', 1),
(5, 'choice', 2013050100, 0, 0, '', 1),
(6, 'data', 2013050100, 0, 0, '', 1),
(7, 'feedback', 2013050100, 0, 0, '', 0),
(8, 'folder', 2013050100, 0, 0, '', 1),
(9, 'forum', 2013050101, 60, 0, '', 1),
(10, 'glossary', 2013050100, 0, 0, '', 1),
(11, 'imscp', 2013050100, 0, 0, '', 1),
(12, 'label', 2013050100, 0, 0, '', 1),
(13, 'lesson', 2013050100, 0, 0, '', 1),
(14, 'lti', 2013050100, 0, 0, '', 1),
(15, 'page', 2013050100, 0, 0, '', 1),
(16, 'quiz', 2013050101, 60, 0, '', 1),
(17, 'resource', 2013050100, 0, 0, '', 1),
(18, 'scorm', 2013050105, 300, 0, '', 1),
(19, 'survey', 2013050100, 0, 0, '', 1),
(20, 'url', 2013050100, 0, 0, '', 1),
(21, 'wiki', 2013050100, 0, 0, '', 1),
(22, 'workshop', 2013050100, 60, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_my_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_my_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Extra user pages for the My Moodle system' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_my_pages`
--

INSERT INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
(1, NULL, '__default', 0, 0),
(2, NULL, '__default', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_page`
--

CREATE TABLE IF NOT EXISTS `mdl_page` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one page and its config data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='base table (not including config data) for instances of port' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='config for portfolio plugin instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_user`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user data for portfolio instances.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_log`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) NOT NULL DEFAULT '',
  `caller_file` varchar(255) NOT NULL DEFAULT '',
  `caller_component` varchar(255) DEFAULT NULL,
  `caller_sha1` varchar(255) NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) NOT NULL DEFAULT '',
  `continueurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='log of portfolio transfers (used to later check for duplicat' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='maps mahara tokens to transfer ids' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_tempdata`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `data` longtext,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores temporary data for portfolio exports. the id of this ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_post`
--

CREATE TABLE IF NOT EXISTS `mdl_post` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) NOT NULL DEFAULT '',
  `summary` longtext,
  `content` longtext,
  `uniquehash` varchar(255) NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) DEFAULT NULL,
  `publishstate` varchar(20) NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic post table to hold data blog entries etc in differen' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_profiling`
--

CREATE TABLE IF NOT EXISTS `mdl_profiling` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the results of all the profiling runs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_essay_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) NOT NULL DEFAULT 'editor',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Extra options for essay questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_match_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines the question-type specific options for matching ques' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_subquestions`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_match_subquestions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypmatcsubq_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The subquestions that make up a matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_randomsamatch_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_randomsamatch_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  `subcats` tinyint(2) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtyprandopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about a random short-answer matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_shortanswer_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_shortanswer_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypshoropti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for short answer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question`
--

CREATE TABLE IF NOT EXISTS `mdl_question` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The questions themselves' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_question_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Answers, with a fractional grade (0-1) and feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext,
  `rightanswer` longtext,
  `responsesummary` longtext,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each row here corresponds to an attempt at one question, as ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_steps`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores one step in in a question attempt. As well as the dat' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_step_data`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each question_attempt_step has an associative array of the d' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_question_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Categories are for grouping questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_datasets`
--

CREATE TABLE IF NOT EXISTS `mdl_question_datasets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Many-many relation between questions and dataset definitions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Organises and stores properties for dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_items`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Individual dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_hints`
--

CREATE TABLE IF NOT EXISTS `mdl_question_hints` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the the part of the question definition that gives di' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_multianswer`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multianswer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_multichoice`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multichoice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `answers` varchar(255) NOT NULL DEFAULT '',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que2_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multiple choice questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for numerical questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type numerical This table is also u' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_units`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Optional unit options for numerical questions. This table is' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptid` bigint(10) NOT NULL DEFAULT '0',
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `newest` bigint(10) NOT NULL DEFAULT '0',
  `newgraded` bigint(10) NOT NULL DEFAULT '0',
  `sumpenalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `manualcomment` longtext NOT NULL,
  `manualcommentformat` tinyint(2) NOT NULL DEFAULT '0',
  `flagged` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quessess_attque_uix` (`attemptid`,`questionid`),
  KEY `mdl_quessess_att_ix` (`attemptid`),
  KEY `mdl_quessess_que_ix` (`questionid`),
  KEY `mdl_quessess_new_ix` (`newest`),
  KEY `mdl_quessess_new2_ix` (`newgraded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gives ids of the newest open and newest graded states' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_states`
--

CREATE TABLE IF NOT EXISTS `mdl_question_states` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attempt` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `seq_number` mediumint(6) NOT NULL DEFAULT '0',
  `answer` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  `event` smallint(4) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `raw_grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesstat_att_ix` (`attempt`),
  KEY `mdl_quesstat_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user responses to an attempt, and percentage grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_truefalse`
--

CREATE TABLE IF NOT EXISTS `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for True-False questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_usages`
--

CREATE TABLE IF NOT EXISTS `mdl_question_usages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table''s main purpose it to assign a unique id to each a' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) NOT NULL DEFAULT 'free',
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `questions` longtext NOT NULL,
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The settings for each quiz.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  `needsupgradetonewqe` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  KEY `mdl_quizatte_qui_ix` (`quiz`),
  KEY `mdl_quizatte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores users attempts at quizzes.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Feedback given to students based on which grade band their o' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the overall grade for each user on the quiz, based on' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overrides`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overrides to quiz settings on a per-user and per-group b' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table records which question attempts need regrading an' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_question_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizquesinst_qui_ix` (`quiz`),
  KEY `mdl_quizquesinst_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the maximum possible grade (weight) for each question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_question_response_stats`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_response_stats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `subqid` varchar(100) NOT NULL DEFAULT '',
  `aid` varchar(100) DEFAULT NULL,
  `response` longtext,
  `rcount` bigint(10) DEFAULT NULL,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quiz question responses.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_question_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default comment for the table, please edit me' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_reports`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Lists all the installed quiz reports and their display order' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_quiz_reports`
--

INSERT INTO `mdl_quiz_reports` (`id`, `name`, `displayorder`, `capability`) VALUES
(1, 'grading', 6000, 'mod/quiz:grade'),
(2, 'overview', 10000, NULL),
(3, 'responses', 9000, NULL),
(4, 'statistics', 8000, 'quiz/statistics:view');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL,
  `groupid` bigint(10) NOT NULL,
  `allattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table to cache results from analysis done in statistics repo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_rating`
--

CREATE TABLE IF NOT EXISTS `mdl_rating` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `ratingarea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle ratings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_registration_hubs`
--

CREATE TABLE IF NOT EXISTS `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `hubname` varchar(255) NOT NULL DEFAULT '',
  `huburl` varchar(255) NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='hub where the site is registered on with their associated to' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository`
--

CREATE TABLE IF NOT EXISTS `mdl_repository` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_repository`
--

INSERT INTO `mdl_repository` (`id`, `type`, `visible`, `sortorder`) VALUES
(1, 'local', 1, 1),
(2, 'recent', 1, 2),
(3, 'upload', 1, 3),
(4, 'url', 1, 4),
(5, 'user', 1, 5),
(6, 'wikimedia', 1, 6),
(7, 'youtube', 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_repository_instances`
--

INSERT INTO `mdl_repository_instances` (`id`, `name`, `typeid`, `userid`, `contextid`, `username`, `password`, `timecreated`, `timemodified`, `readonly`) VALUES
(1, '', 1, 0, 1, NULL, NULL, 1438374422, 1438374422, 0),
(2, '', 2, 0, 1, NULL, NULL, 1438374435, 1438374435, 0),
(3, '', 3, 0, 1, NULL, NULL, 1438374444, 1438374444, 0),
(4, '', 4, 0, 1, NULL, NULL, 1438374449, 1438374449, 0),
(5, '', 5, 0, 1, NULL, NULL, 1438374453, 1438374453, 0),
(6, '', 6, 0, 1, NULL, NULL, 1438374462, 1438374462, 0),
(7, '', 7, 0, 1, NULL, NULL, 1438374467, 1438374467, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The config for intances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource`
--

CREATE TABLE IF NOT EXISTS `mdl_resource` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one resource and its config data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource_old`
--

CREATE TABLE IF NOT EXISTS `mdl_resource_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext NOT NULL,
  `popup` longtext NOT NULL,
  `options` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='backup of all old resource instances from 1.9' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role`
--

CREATE TABLE IF NOT EXISTS `mdl_role` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='moodle roles' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_role`
--

INSERT INTO `mdl_role` (`id`, `name`, `shortname`, `description`, `sortorder`, `archetype`) VALUES
(1, '', 'manager', '', 1, 'manager'),
(2, '', 'coursecreator', '', 2, 'coursecreator'),
(3, '', 'editingteacher', '', 3, 'editingteacher'),
(4, '', 'teacher', '', 4, 'teacher'),
(5, '', 'student', '', 5, 'student'),
(6, '', 'guest', '', 6, 'guest'),
(7, '', 'user', '', 7, 'user'),
(8, '', 'frontpage', '', 8, 'frontpage');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines what role can assign what role' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_role_allow_assign`
--

INSERT INTO `mdl_role_allow_assign` (`id`, `roleid`, `allowassign`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 3, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_override`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines what role can override what role' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_role_allow_override`
--

INSERT INTO `mdl_role_allow_override` (`id`, `roleid`, `allowoverride`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 3, 4),
(10, 3, 5),
(11, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_switch`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores which which other roles a user is allowed ' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_role_allow_switch`
--

INSERT INTO `mdl_role_allow_switch` (`id`, `roleid`, `allowswitch`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 3, 4),
(6, 3, 5),
(7, 3, 6),
(8, 4, 5),
(9, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_assignments`
--

CREATE TABLE IF NOT EXISTS `mdl_role_assignments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='assigning roles in different context' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='permission has to be signed, overriding a capability for a p' AUTO_INCREMENT=1115 ;

--
-- Dumping data for table `mdl_role_capabilities`
--

INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(1, 1, 1, 'moodle/site:readallmessages', 1, 1438373711, 0),
(2, 1, 3, 'moodle/site:readallmessages', 1, 1438373711, 0),
(3, 1, 1, 'moodle/site:sendmessage', 1, 1438373711, 0),
(4, 1, 7, 'moodle/site:sendmessage', 1, 1438373711, 0),
(5, 1, 1, 'moodle/site:approvecourse', 1, 1438373711, 0),
(6, 1, 3, 'moodle/backup:backupcourse', 1, 1438373711, 0),
(7, 1, 1, 'moodle/backup:backupcourse', 1, 1438373711, 0),
(8, 1, 3, 'moodle/backup:backupsection', 1, 1438373711, 0),
(9, 1, 1, 'moodle/backup:backupsection', 1, 1438373711, 0),
(10, 1, 3, 'moodle/backup:backupactivity', 1, 1438373711, 0),
(11, 1, 1, 'moodle/backup:backupactivity', 1, 1438373711, 0),
(12, 1, 3, 'moodle/backup:backuptargethub', 1, 1438373711, 0),
(13, 1, 1, 'moodle/backup:backuptargethub', 1, 1438373711, 0),
(14, 1, 3, 'moodle/backup:backuptargetimport', 1, 1438373711, 0),
(15, 1, 1, 'moodle/backup:backuptargetimport', 1, 1438373711, 0),
(16, 1, 3, 'moodle/backup:downloadfile', 1, 1438373711, 0),
(17, 1, 1, 'moodle/backup:downloadfile', 1, 1438373712, 0),
(18, 1, 3, 'moodle/backup:configure', 1, 1438373712, 0),
(19, 1, 1, 'moodle/backup:configure', 1, 1438373712, 0),
(20, 1, 1, 'moodle/backup:userinfo', 1, 1438373712, 0),
(21, 1, 1, 'moodle/backup:anonymise', 1, 1438373712, 0),
(22, 1, 3, 'moodle/restore:restorecourse', 1, 1438373712, 0),
(23, 1, 1, 'moodle/restore:restorecourse', 1, 1438373712, 0),
(24, 1, 3, 'moodle/restore:restoresection', 1, 1438373712, 0),
(25, 1, 1, 'moodle/restore:restoresection', 1, 1438373712, 0),
(26, 1, 3, 'moodle/restore:restoreactivity', 1, 1438373712, 0),
(27, 1, 1, 'moodle/restore:restoreactivity', 1, 1438373712, 0),
(28, 1, 3, 'moodle/restore:restoretargethub', 1, 1438373712, 0),
(29, 1, 1, 'moodle/restore:restoretargethub', 1, 1438373712, 0),
(30, 1, 3, 'moodle/restore:restoretargetimport', 1, 1438373712, 0),
(31, 1, 1, 'moodle/restore:restoretargetimport', 1, 1438373712, 0),
(32, 1, 3, 'moodle/restore:uploadfile', 1, 1438373712, 0),
(33, 1, 1, 'moodle/restore:uploadfile', 1, 1438373712, 0),
(34, 1, 3, 'moodle/restore:configure', 1, 1438373712, 0),
(35, 1, 1, 'moodle/restore:configure', 1, 1438373712, 0),
(36, 1, 2, 'moodle/restore:rolldates', 1, 1438373712, 0),
(37, 1, 1, 'moodle/restore:rolldates', 1, 1438373712, 0),
(38, 1, 1, 'moodle/restore:userinfo', 1, 1438373712, 0),
(39, 1, 1, 'moodle/restore:createuser', 1, 1438373712, 0),
(40, 1, 3, 'moodle/site:manageblocks', 1, 1438373712, 0),
(41, 1, 1, 'moodle/site:manageblocks', 1, 1438373712, 0),
(42, 1, 4, 'moodle/site:accessallgroups', 1, 1438373712, 0),
(43, 1, 3, 'moodle/site:accessallgroups', 1, 1438373712, 0),
(44, 1, 1, 'moodle/site:accessallgroups', 1, 1438373712, 0),
(45, 1, 4, 'moodle/site:viewfullnames', 1, 1438373712, 0),
(46, 1, 3, 'moodle/site:viewfullnames', 1, 1438373712, 0),
(47, 1, 1, 'moodle/site:viewfullnames', 1, 1438373712, 0),
(48, 1, 4, 'moodle/site:viewuseridentity', 1, 1438373712, 0),
(49, 1, 3, 'moodle/site:viewuseridentity', 1, 1438373712, 0),
(50, 1, 1, 'moodle/site:viewuseridentity', 1, 1438373712, 0),
(51, 1, 4, 'moodle/site:viewreports', 1, 1438373712, 0),
(52, 1, 3, 'moodle/site:viewreports', 1, 1438373712, 0),
(53, 1, 1, 'moodle/site:viewreports', 1, 1438373712, 0),
(54, 1, 3, 'moodle/site:trustcontent', 1, 1438373712, 0),
(55, 1, 1, 'moodle/site:trustcontent', 1, 1438373712, 0),
(56, 1, 1, 'moodle/site:uploadusers', 1, 1438373712, 0),
(57, 1, 3, 'moodle/filter:manage', 1, 1438373712, 0),
(58, 1, 1, 'moodle/filter:manage', 1, 1438373712, 0),
(59, 1, 1, 'moodle/user:create', 1, 1438373713, 0),
(60, 1, 1, 'moodle/user:delete', 1, 1438373713, 0),
(61, 1, 1, 'moodle/user:update', 1, 1438373713, 0),
(62, 1, 6, 'moodle/user:viewdetails', 1, 1438373713, 0),
(63, 1, 5, 'moodle/user:viewdetails', 1, 1438373713, 0),
(64, 1, 4, 'moodle/user:viewdetails', 1, 1438373713, 0),
(65, 1, 3, 'moodle/user:viewdetails', 1, 1438373713, 0),
(66, 1, 1, 'moodle/user:viewdetails', 1, 1438373713, 0),
(67, 1, 1, 'moodle/user:viewalldetails', 1, 1438373713, 0),
(68, 1, 4, 'moodle/user:viewhiddendetails', 1, 1438373713, 0),
(69, 1, 3, 'moodle/user:viewhiddendetails', 1, 1438373713, 0),
(70, 1, 1, 'moodle/user:viewhiddendetails', 1, 1438373713, 0),
(71, 1, 1, 'moodle/user:loginas', 1, 1438373713, 0),
(72, 1, 1, 'moodle/user:managesyspages', 1, 1438373713, 0),
(73, 1, 7, 'moodle/user:manageownblocks', 1, 1438373713, 0),
(74, 1, 7, 'moodle/user:manageownfiles', 1, 1438373713, 0),
(75, 1, 1, 'moodle/my:configsyspages', 1, 1438373713, 0),
(76, 1, 3, 'moodle/role:assign', 1, 1438373713, 0),
(77, 1, 1, 'moodle/role:assign', 1, 1438373713, 0),
(78, 1, 4, 'moodle/role:review', 1, 1438373713, 0),
(79, 1, 3, 'moodle/role:review', 1, 1438373713, 0),
(80, 1, 1, 'moodle/role:review', 1, 1438373713, 0),
(81, 1, 1, 'moodle/role:override', 1, 1438373713, 0),
(82, 1, 3, 'moodle/role:safeoverride', 1, 1438373713, 0),
(83, 1, 1, 'moodle/role:manage', 1, 1438373713, 0),
(84, 1, 3, 'moodle/role:switchroles', 1, 1438373713, 0),
(85, 1, 1, 'moodle/role:switchroles', 1, 1438373713, 0),
(86, 1, 1, 'moodle/category:manage', 1, 1438373713, 0),
(87, 1, 2, 'moodle/category:viewhiddencategories', 1, 1438373713, 0),
(88, 1, 1, 'moodle/category:viewhiddencategories', 1, 1438373713, 0),
(89, 1, 1, 'moodle/cohort:manage', 1, 1438373713, 0),
(90, 1, 1, 'moodle/cohort:assign', 1, 1438373713, 0),
(91, 1, 3, 'moodle/cohort:view', 1, 1438373713, 0),
(92, 1, 1, 'moodle/cohort:view', 1, 1438373713, 0),
(93, 1, 2, 'moodle/course:create', 1, 1438373713, 0),
(94, 1, 1, 'moodle/course:create', 1, 1438373713, 0),
(95, 1, 7, 'moodle/course:request', 1, 1438373713, 0),
(96, 1, 1, 'moodle/course:delete', 1, 1438373713, 0),
(97, 1, 3, 'moodle/course:update', 1, 1438373713, 0),
(98, 1, 1, 'moodle/course:update', 1, 1438373713, 0),
(99, 1, 1, 'moodle/course:view', 1, 1438373713, 0),
(100, 1, 3, 'moodle/course:enrolreview', 1, 1438373713, 0),
(101, 1, 1, 'moodle/course:enrolreview', 1, 1438373713, 0),
(102, 1, 3, 'moodle/course:enrolconfig', 1, 1438373713, 0),
(103, 1, 1, 'moodle/course:enrolconfig', 1, 1438373713, 0),
(104, 1, 4, 'moodle/course:bulkmessaging', 1, 1438373713, 0),
(105, 1, 3, 'moodle/course:bulkmessaging', 1, 1438373713, 0),
(106, 1, 1, 'moodle/course:bulkmessaging', 1, 1438373713, 0),
(107, 1, 4, 'moodle/course:viewhiddenuserfields', 1, 1438373713, 0),
(108, 1, 3, 'moodle/course:viewhiddenuserfields', 1, 1438373713, 0),
(109, 1, 1, 'moodle/course:viewhiddenuserfields', 1, 1438373713, 0),
(110, 1, 2, 'moodle/course:viewhiddencourses', 1, 1438373714, 0),
(111, 1, 4, 'moodle/course:viewhiddencourses', 1, 1438373714, 0),
(112, 1, 3, 'moodle/course:viewhiddencourses', 1, 1438373714, 0),
(113, 1, 1, 'moodle/course:viewhiddencourses', 1, 1438373714, 0),
(114, 1, 3, 'moodle/course:visibility', 1, 1438373714, 0),
(115, 1, 1, 'moodle/course:visibility', 1, 1438373714, 0),
(116, 1, 3, 'moodle/course:managefiles', 1, 1438373714, 0),
(117, 1, 1, 'moodle/course:managefiles', 1, 1438373714, 0),
(118, 1, 3, 'moodle/course:manageactivities', 1, 1438373714, 0),
(119, 1, 1, 'moodle/course:manageactivities', 1, 1438373714, 0),
(120, 1, 3, 'moodle/course:activityvisibility', 1, 1438373714, 0),
(121, 1, 1, 'moodle/course:activityvisibility', 1, 1438373714, 0),
(122, 1, 4, 'moodle/course:viewhiddenactivities', 1, 1438373714, 0),
(123, 1, 3, 'moodle/course:viewhiddenactivities', 1, 1438373714, 0),
(124, 1, 1, 'moodle/course:viewhiddenactivities', 1, 1438373714, 0),
(125, 1, 5, 'moodle/course:viewparticipants', 1, 1438373714, 0),
(126, 1, 4, 'moodle/course:viewparticipants', 1, 1438373714, 0),
(127, 1, 3, 'moodle/course:viewparticipants', 1, 1438373714, 0),
(128, 1, 1, 'moodle/course:viewparticipants', 1, 1438373714, 0),
(129, 1, 3, 'moodle/course:changefullname', 1, 1438373714, 0),
(130, 1, 1, 'moodle/course:changefullname', 1, 1438373714, 0),
(131, 1, 3, 'moodle/course:changeshortname', 1, 1438373714, 0),
(132, 1, 1, 'moodle/course:changeshortname', 1, 1438373714, 0),
(133, 1, 3, 'moodle/course:changeidnumber', 1, 1438373714, 0),
(134, 1, 1, 'moodle/course:changeidnumber', 1, 1438373714, 0),
(135, 1, 3, 'moodle/course:changecategory', 1, 1438373714, 0),
(136, 1, 1, 'moodle/course:changecategory', 1, 1438373714, 0),
(137, 1, 3, 'moodle/course:changesummary', 1, 1438373714, 0),
(138, 1, 1, 'moodle/course:changesummary', 1, 1438373714, 0),
(139, 1, 1, 'moodle/site:viewparticipants', 1, 1438373714, 0),
(140, 1, 5, 'moodle/course:isincompletionreports', 1, 1438373715, 0),
(141, 1, 5, 'moodle/course:viewscales', 1, 1438373715, 0),
(142, 1, 4, 'moodle/course:viewscales', 1, 1438373715, 0),
(143, 1, 3, 'moodle/course:viewscales', 1, 1438373715, 0),
(144, 1, 1, 'moodle/course:viewscales', 1, 1438373715, 0),
(145, 1, 3, 'moodle/course:managescales', 1, 1438373715, 0),
(146, 1, 1, 'moodle/course:managescales', 1, 1438373715, 0),
(147, 1, 3, 'moodle/course:managegroups', 1, 1438373715, 0),
(148, 1, 1, 'moodle/course:managegroups', 1, 1438373715, 0),
(149, 1, 3, 'moodle/course:reset', 1, 1438373715, 0),
(150, 1, 1, 'moodle/course:reset', 1, 1438373715, 0),
(151, 1, 3, 'moodle/course:viewsuspendedusers', 1, 1438373715, 0),
(152, 1, 1, 'moodle/course:viewsuspendedusers', 1, 1438373715, 0),
(153, 1, 6, 'moodle/blog:view', 1, 1438373715, 0),
(154, 1, 7, 'moodle/blog:view', 1, 1438373715, 0),
(155, 1, 5, 'moodle/blog:view', 1, 1438373715, 0),
(156, 1, 4, 'moodle/blog:view', 1, 1438373715, 0),
(157, 1, 3, 'moodle/blog:view', 1, 1438373715, 0),
(158, 1, 1, 'moodle/blog:view', 1, 1438373715, 0),
(159, 1, 6, 'moodle/blog:search', 1, 1438373715, 0),
(160, 1, 7, 'moodle/blog:search', 1, 1438373715, 0),
(161, 1, 5, 'moodle/blog:search', 1, 1438373715, 0),
(162, 1, 4, 'moodle/blog:search', 1, 1438373715, 0),
(163, 1, 3, 'moodle/blog:search', 1, 1438373715, 0),
(164, 1, 1, 'moodle/blog:search', 1, 1438373715, 0),
(165, 1, 1, 'moodle/blog:viewdrafts', 1, 1438373715, 0),
(166, 1, 7, 'moodle/blog:create', 1, 1438373715, 0),
(167, 1, 1, 'moodle/blog:create', 1, 1438373715, 0),
(168, 1, 4, 'moodle/blog:manageentries', 1, 1438373715, 0),
(169, 1, 3, 'moodle/blog:manageentries', 1, 1438373715, 0),
(170, 1, 1, 'moodle/blog:manageentries', 1, 1438373715, 0),
(171, 1, 5, 'moodle/blog:manageexternal', 1, 1438373715, 0),
(172, 1, 7, 'moodle/blog:manageexternal', 1, 1438373715, 0),
(173, 1, 4, 'moodle/blog:manageexternal', 1, 1438373715, 0),
(174, 1, 3, 'moodle/blog:manageexternal', 1, 1438373715, 0),
(175, 1, 1, 'moodle/blog:manageexternal', 1, 1438373715, 0),
(176, 1, 7, 'moodle/calendar:manageownentries', 1, 1438373715, 0),
(177, 1, 1, 'moodle/calendar:manageownentries', 1, 1438373715, 0),
(178, 1, 4, 'moodle/calendar:managegroupentries', 1, 1438373715, 0),
(179, 1, 3, 'moodle/calendar:managegroupentries', 1, 1438373715, 0),
(180, 1, 1, 'moodle/calendar:managegroupentries', 1, 1438373715, 0),
(181, 1, 4, 'moodle/calendar:manageentries', 1, 1438373715, 0),
(182, 1, 3, 'moodle/calendar:manageentries', 1, 1438373715, 0),
(183, 1, 1, 'moodle/calendar:manageentries', 1, 1438373715, 0),
(184, 1, 1, 'moodle/user:editprofile', 1, 1438373715, 0),
(185, 1, 6, 'moodle/user:editownprofile', -1000, 1438373715, 0),
(186, 1, 7, 'moodle/user:editownprofile', 1, 1438373715, 0),
(187, 1, 1, 'moodle/user:editownprofile', 1, 1438373715, 0),
(188, 1, 6, 'moodle/user:changeownpassword', -1000, 1438373715, 0),
(189, 1, 7, 'moodle/user:changeownpassword', 1, 1438373715, 0),
(190, 1, 1, 'moodle/user:changeownpassword', 1, 1438373715, 0),
(191, 1, 5, 'moodle/user:readuserposts', 1, 1438373716, 0),
(192, 1, 4, 'moodle/user:readuserposts', 1, 1438373716, 0),
(193, 1, 3, 'moodle/user:readuserposts', 1, 1438373716, 0),
(194, 1, 1, 'moodle/user:readuserposts', 1, 1438373716, 0),
(195, 1, 5, 'moodle/user:readuserblogs', 1, 1438373716, 0),
(196, 1, 4, 'moodle/user:readuserblogs', 1, 1438373716, 0),
(197, 1, 3, 'moodle/user:readuserblogs', 1, 1438373716, 0),
(198, 1, 1, 'moodle/user:readuserblogs', 1, 1438373716, 0),
(199, 1, 1, 'moodle/user:editmessageprofile', 1, 1438373716, 0),
(200, 1, 6, 'moodle/user:editownmessageprofile', -1000, 1438373716, 0),
(201, 1, 7, 'moodle/user:editownmessageprofile', 1, 1438373716, 0),
(202, 1, 1, 'moodle/user:editownmessageprofile', 1, 1438373716, 0),
(203, 1, 3, 'moodle/question:managecategory', 1, 1438373716, 0),
(204, 1, 1, 'moodle/question:managecategory', 1, 1438373716, 0),
(205, 1, 3, 'moodle/question:add', 1, 1438373716, 0),
(206, 1, 1, 'moodle/question:add', 1, 1438373716, 0),
(207, 1, 3, 'moodle/question:editmine', 1, 1438373716, 0),
(208, 1, 1, 'moodle/question:editmine', 1, 1438373716, 0),
(209, 1, 3, 'moodle/question:editall', 1, 1438373716, 0),
(210, 1, 1, 'moodle/question:editall', 1, 1438373716, 0),
(211, 1, 3, 'moodle/question:viewmine', 1, 1438373716, 0),
(212, 1, 1, 'moodle/question:viewmine', 1, 1438373716, 0),
(213, 1, 3, 'moodle/question:viewall', 1, 1438373716, 0),
(214, 1, 1, 'moodle/question:viewall', 1, 1438373716, 0),
(215, 1, 3, 'moodle/question:usemine', 1, 1438373716, 0),
(216, 1, 1, 'moodle/question:usemine', 1, 1438373716, 0),
(217, 1, 3, 'moodle/question:useall', 1, 1438373716, 0),
(218, 1, 1, 'moodle/question:useall', 1, 1438373716, 0),
(219, 1, 3, 'moodle/question:movemine', 1, 1438373716, 0),
(220, 1, 1, 'moodle/question:movemine', 1, 1438373717, 0),
(221, 1, 3, 'moodle/question:moveall', 1, 1438373717, 0),
(222, 1, 1, 'moodle/question:moveall', 1, 1438373717, 0),
(223, 1, 1, 'moodle/question:config', 1, 1438373717, 0),
(224, 1, 5, 'moodle/question:flag', 1, 1438373717, 0),
(225, 1, 4, 'moodle/question:flag', 1, 1438373717, 0),
(226, 1, 3, 'moodle/question:flag', 1, 1438373717, 0),
(227, 1, 1, 'moodle/question:flag', 1, 1438373717, 0),
(228, 1, 4, 'moodle/site:doclinks', 1, 1438373717, 0),
(229, 1, 3, 'moodle/site:doclinks', 1, 1438373717, 0),
(230, 1, 1, 'moodle/site:doclinks', 1, 1438373717, 0),
(231, 1, 3, 'moodle/course:sectionvisibility', 1, 1438373717, 0),
(232, 1, 1, 'moodle/course:sectionvisibility', 1, 1438373717, 0),
(233, 1, 3, 'moodle/course:useremail', 1, 1438373717, 0),
(234, 1, 1, 'moodle/course:useremail', 1, 1438373717, 0),
(235, 1, 3, 'moodle/course:viewhiddensections', 1, 1438373717, 0),
(236, 1, 1, 'moodle/course:viewhiddensections', 1, 1438373717, 0),
(237, 1, 3, 'moodle/course:setcurrentsection', 1, 1438373717, 0),
(238, 1, 1, 'moodle/course:setcurrentsection', 1, 1438373717, 0),
(239, 1, 3, 'moodle/course:movesections', 1, 1438373717, 0),
(240, 1, 1, 'moodle/course:movesections', 1, 1438373717, 0),
(241, 1, 4, 'moodle/grade:viewall', 1, 1438373717, 0),
(242, 1, 3, 'moodle/grade:viewall', 1, 1438373717, 0),
(243, 1, 1, 'moodle/grade:viewall', 1, 1438373717, 0),
(244, 1, 5, 'moodle/grade:view', 1, 1438373717, 0),
(245, 1, 4, 'moodle/grade:viewhidden', 1, 1438373717, 0),
(246, 1, 3, 'moodle/grade:viewhidden', 1, 1438373717, 0),
(247, 1, 1, 'moodle/grade:viewhidden', 1, 1438373717, 0),
(248, 1, 3, 'moodle/grade:import', 1, 1438373717, 0),
(249, 1, 1, 'moodle/grade:import', 1, 1438373717, 0),
(250, 1, 4, 'moodle/grade:export', 1, 1438373717, 0),
(251, 1, 3, 'moodle/grade:export', 1, 1438373717, 0),
(252, 1, 1, 'moodle/grade:export', 1, 1438373717, 0),
(253, 1, 3, 'moodle/grade:manage', 1, 1438373717, 0),
(254, 1, 1, 'moodle/grade:manage', 1, 1438373717, 0),
(255, 1, 3, 'moodle/grade:edit', 1, 1438373717, 0),
(256, 1, 1, 'moodle/grade:edit', 1, 1438373717, 0),
(257, 1, 3, 'moodle/grade:managegradingforms', 1, 1438373717, 0),
(258, 1, 1, 'moodle/grade:managegradingforms', 1, 1438373717, 0),
(259, 1, 1, 'moodle/grade:sharegradingforms', 1, 1438373717, 0),
(260, 1, 1, 'moodle/grade:managesharedforms', 1, 1438373717, 0),
(261, 1, 3, 'moodle/grade:manageoutcomes', 1, 1438373717, 0),
(262, 1, 1, 'moodle/grade:manageoutcomes', 1, 1438373717, 0),
(263, 1, 3, 'moodle/grade:manageletters', 1, 1438373717, 0),
(264, 1, 1, 'moodle/grade:manageletters', 1, 1438373717, 0),
(265, 1, 3, 'moodle/grade:hide', 1, 1438373717, 0),
(266, 1, 1, 'moodle/grade:hide', 1, 1438373717, 0),
(267, 1, 3, 'moodle/grade:lock', 1, 1438373717, 0),
(268, 1, 1, 'moodle/grade:lock', 1, 1438373717, 0),
(269, 1, 3, 'moodle/grade:unlock', 1, 1438373717, 0),
(270, 1, 1, 'moodle/grade:unlock', 1, 1438373717, 0),
(271, 1, 7, 'moodle/my:manageblocks', 1, 1438373717, 0),
(272, 1, 4, 'moodle/notes:view', 1, 1438373717, 0),
(273, 1, 3, 'moodle/notes:view', 1, 1438373717, 0),
(274, 1, 1, 'moodle/notes:view', 1, 1438373717, 0),
(275, 1, 4, 'moodle/notes:manage', 1, 1438373718, 0),
(276, 1, 3, 'moodle/notes:manage', 1, 1438373718, 0),
(277, 1, 1, 'moodle/notes:manage', 1, 1438373718, 0),
(278, 1, 4, 'moodle/tag:manage', 1, 1438373718, 0),
(279, 1, 3, 'moodle/tag:manage', 1, 1438373718, 0),
(280, 1, 1, 'moodle/tag:manage', 1, 1438373718, 0),
(281, 1, 1, 'moodle/tag:create', 1, 1438373718, 0),
(282, 1, 7, 'moodle/tag:create', 1, 1438373718, 0),
(283, 1, 1, 'moodle/tag:edit', 1, 1438373718, 0),
(284, 1, 7, 'moodle/tag:edit', 1, 1438373718, 0),
(285, 1, 1, 'moodle/tag:flag', 1, 1438373718, 0),
(286, 1, 7, 'moodle/tag:flag', 1, 1438373718, 0),
(287, 1, 4, 'moodle/tag:editblocks', 1, 1438373718, 0),
(288, 1, 3, 'moodle/tag:editblocks', 1, 1438373718, 0),
(289, 1, 1, 'moodle/tag:editblocks', 1, 1438373718, 0),
(290, 1, 6, 'moodle/block:view', 1, 1438373718, 0),
(291, 1, 7, 'moodle/block:view', 1, 1438373718, 0),
(292, 1, 5, 'moodle/block:view', 1, 1438373718, 0),
(293, 1, 4, 'moodle/block:view', 1, 1438373718, 0),
(294, 1, 3, 'moodle/block:view', 1, 1438373718, 0),
(295, 1, 3, 'moodle/block:edit', 1, 1438373718, 0),
(296, 1, 1, 'moodle/block:edit', 1, 1438373718, 0),
(297, 1, 7, 'moodle/portfolio:export', 1, 1438373718, 0),
(298, 1, 5, 'moodle/portfolio:export', 1, 1438373718, 0),
(299, 1, 4, 'moodle/portfolio:export', 1, 1438373718, 0),
(300, 1, 3, 'moodle/portfolio:export', 1, 1438373719, 0),
(301, 1, 8, 'moodle/comment:view', 1, 1438373719, 0),
(302, 1, 6, 'moodle/comment:view', 1, 1438373719, 0),
(303, 1, 7, 'moodle/comment:view', 1, 1438373719, 0),
(304, 1, 5, 'moodle/comment:view', 1, 1438373719, 0),
(305, 1, 4, 'moodle/comment:view', 1, 1438373719, 0),
(306, 1, 3, 'moodle/comment:view', 1, 1438373719, 0),
(307, 1, 1, 'moodle/comment:view', 1, 1438373719, 0),
(308, 1, 7, 'moodle/comment:post', 1, 1438373719, 0),
(309, 1, 5, 'moodle/comment:post', 1, 1438373719, 0),
(310, 1, 4, 'moodle/comment:post', 1, 1438373719, 0),
(311, 1, 3, 'moodle/comment:post', 1, 1438373719, 0),
(312, 1, 1, 'moodle/comment:post', 1, 1438373719, 0),
(313, 1, 3, 'moodle/comment:delete', 1, 1438373719, 0),
(314, 1, 1, 'moodle/comment:delete', 1, 1438373719, 0),
(315, 1, 1, 'moodle/webservice:createtoken', 1, 1438373719, 0),
(316, 1, 7, 'moodle/webservice:createmobiletoken', 1, 1438373719, 0),
(317, 1, 7, 'moodle/rating:view', 1, 1438373719, 0),
(318, 1, 5, 'moodle/rating:view', 1, 1438373719, 0),
(319, 1, 4, 'moodle/rating:view', 1, 1438373720, 0),
(320, 1, 3, 'moodle/rating:view', 1, 1438373720, 0),
(321, 1, 1, 'moodle/rating:view', 1, 1438373720, 0),
(322, 1, 7, 'moodle/rating:viewany', 1, 1438373720, 0),
(323, 1, 5, 'moodle/rating:viewany', 1, 1438373720, 0),
(324, 1, 4, 'moodle/rating:viewany', 1, 1438373720, 0),
(325, 1, 3, 'moodle/rating:viewany', 1, 1438373720, 0),
(326, 1, 1, 'moodle/rating:viewany', 1, 1438373720, 0),
(327, 1, 7, 'moodle/rating:viewall', 1, 1438373720, 0),
(328, 1, 5, 'moodle/rating:viewall', 1, 1438373720, 0),
(329, 1, 4, 'moodle/rating:viewall', 1, 1438373720, 0),
(330, 1, 3, 'moodle/rating:viewall', 1, 1438373720, 0),
(331, 1, 1, 'moodle/rating:viewall', 1, 1438373720, 0),
(332, 1, 7, 'moodle/rating:rate', 1, 1438373720, 0),
(333, 1, 5, 'moodle/rating:rate', 1, 1438373720, 0),
(334, 1, 4, 'moodle/rating:rate', 1, 1438373720, 0),
(335, 1, 3, 'moodle/rating:rate', 1, 1438373720, 0),
(336, 1, 1, 'moodle/rating:rate', 1, 1438373720, 0),
(337, 1, 1, 'moodle/course:publish', 1, 1438373720, 0),
(338, 1, 4, 'moodle/course:markcomplete', 1, 1438373720, 0),
(339, 1, 3, 'moodle/course:markcomplete', 1, 1438373721, 0),
(340, 1, 1, 'moodle/course:markcomplete', 1, 1438373721, 0),
(341, 1, 1, 'moodle/community:add', 1, 1438373721, 0),
(342, 1, 4, 'moodle/community:add', 1, 1438373721, 0),
(343, 1, 3, 'moodle/community:add', 1, 1438373721, 0),
(344, 1, 1, 'moodle/community:download', 1, 1438373721, 0),
(345, 1, 3, 'moodle/community:download', 1, 1438373721, 0),
(346, 1, 1, 'moodle/badges:manageglobalsettings', 1, 1438373721, 0),
(347, 1, 7, 'moodle/badges:viewbadges', 1, 1438373721, 0),
(348, 1, 7, 'moodle/badges:manageownbadges', 1, 1438373721, 0),
(349, 1, 7, 'moodle/badges:viewotherbadges', 1, 1438373721, 0),
(350, 1, 7, 'moodle/badges:earnbadge', 1, 1438373721, 0),
(351, 1, 1, 'moodle/badges:createbadge', 1, 1438373721, 0),
(352, 1, 3, 'moodle/badges:createbadge', 1, 1438373721, 0),
(353, 1, 1, 'moodle/badges:deletebadge', 1, 1438373721, 0),
(354, 1, 3, 'moodle/badges:deletebadge', 1, 1438373721, 0),
(355, 1, 1, 'moodle/badges:configuredetails', 1, 1438373721, 0),
(356, 1, 3, 'moodle/badges:configuredetails', 1, 1438373721, 0),
(357, 1, 1, 'moodle/badges:configurecriteria', 1, 1438373721, 0),
(358, 1, 3, 'moodle/badges:configurecriteria', 1, 1438373721, 0),
(359, 1, 1, 'moodle/badges:configuremessages', 1, 1438373721, 0),
(360, 1, 3, 'moodle/badges:configuremessages', 1, 1438373721, 0),
(361, 1, 1, 'moodle/badges:awardbadge', 1, 1438373721, 0),
(362, 1, 4, 'moodle/badges:awardbadge', 1, 1438373721, 0),
(363, 1, 3, 'moodle/badges:awardbadge', 1, 1438373721, 0),
(364, 1, 1, 'moodle/badges:viewawarded', 1, 1438373721, 0),
(365, 1, 4, 'moodle/badges:viewawarded', 1, 1438373721, 0),
(366, 1, 3, 'moodle/badges:viewawarded', 1, 1438373721, 0),
(367, 1, 6, 'mod/assign:view', 1, 1438373845, 0),
(368, 1, 5, 'mod/assign:view', 1, 1438373845, 0),
(369, 1, 4, 'mod/assign:view', 1, 1438373845, 0),
(370, 1, 3, 'mod/assign:view', 1, 1438373845, 0),
(371, 1, 1, 'mod/assign:view', 1, 1438373845, 0),
(372, 1, 5, 'mod/assign:submit', 1, 1438373845, 0),
(373, 1, 4, 'mod/assign:grade', 1, 1438373845, 0),
(374, 1, 3, 'mod/assign:grade', 1, 1438373845, 0),
(375, 1, 1, 'mod/assign:grade', 1, 1438373845, 0),
(376, 1, 4, 'mod/assign:exportownsubmission', 1, 1438373845, 0),
(377, 1, 3, 'mod/assign:exportownsubmission', 1, 1438373845, 0),
(378, 1, 1, 'mod/assign:exportownsubmission', 1, 1438373845, 0),
(379, 1, 5, 'mod/assign:exportownsubmission', 1, 1438373845, 0),
(380, 1, 3, 'mod/assign:addinstance', 1, 1438373845, 0),
(381, 1, 1, 'mod/assign:addinstance', 1, 1438373845, 0),
(382, 1, 4, 'mod/assign:grantextension', 1, 1438373845, 0),
(383, 1, 3, 'mod/assign:grantextension', 1, 1438373845, 0),
(384, 1, 1, 'mod/assign:grantextension', 1, 1438373845, 0),
(385, 1, 3, 'mod/assign:revealidentities', 1, 1438373846, 0),
(386, 1, 1, 'mod/assign:revealidentities', 1, 1438373846, 0),
(387, 1, 6, 'mod/assignment:view', 1, 1438373848, 0),
(388, 1, 5, 'mod/assignment:view', 1, 1438373848, 0),
(389, 1, 4, 'mod/assignment:view', 1, 1438373848, 0),
(390, 1, 3, 'mod/assignment:view', 1, 1438373848, 0),
(391, 1, 1, 'mod/assignment:view', 1, 1438373848, 0),
(392, 1, 3, 'mod/assignment:addinstance', 1, 1438373848, 0),
(393, 1, 1, 'mod/assignment:addinstance', 1, 1438373848, 0),
(394, 1, 5, 'mod/assignment:submit', 1, 1438373848, 0),
(395, 1, 4, 'mod/assignment:grade', 1, 1438373848, 0),
(396, 1, 3, 'mod/assignment:grade', 1, 1438373848, 0),
(397, 1, 1, 'mod/assignment:grade', 1, 1438373848, 0),
(398, 1, 4, 'mod/assignment:exportownsubmission', 1, 1438373848, 0),
(399, 1, 3, 'mod/assignment:exportownsubmission', 1, 1438373848, 0),
(400, 1, 1, 'mod/assignment:exportownsubmission', 1, 1438373848, 0),
(401, 1, 5, 'mod/assignment:exportownsubmission', 1, 1438373848, 0),
(402, 1, 3, 'mod/book:addinstance', 1, 1438373851, 0),
(403, 1, 1, 'mod/book:addinstance', 1, 1438373851, 0),
(404, 1, 6, 'mod/book:read', 1, 1438373851, 0),
(405, 1, 8, 'mod/book:read', 1, 1438373851, 0),
(406, 1, 5, 'mod/book:read', 1, 1438373851, 0),
(407, 1, 4, 'mod/book:read', 1, 1438373851, 0),
(408, 1, 3, 'mod/book:read', 1, 1438373851, 0),
(409, 1, 1, 'mod/book:read', 1, 1438373851, 0),
(410, 1, 4, 'mod/book:viewhiddenchapters', 1, 1438373851, 0),
(411, 1, 3, 'mod/book:viewhiddenchapters', 1, 1438373851, 0),
(412, 1, 1, 'mod/book:viewhiddenchapters', 1, 1438373851, 0),
(413, 1, 3, 'mod/book:edit', 1, 1438373851, 0),
(414, 1, 1, 'mod/book:edit', 1, 1438373851, 0),
(415, 1, 3, 'mod/chat:addinstance', 1, 1438373854, 0),
(416, 1, 1, 'mod/chat:addinstance', 1, 1438373854, 0),
(417, 1, 5, 'mod/chat:chat', 1, 1438373854, 0),
(418, 1, 4, 'mod/chat:chat', 1, 1438373854, 0),
(419, 1, 3, 'mod/chat:chat', 1, 1438373854, 0),
(420, 1, 1, 'mod/chat:chat', 1, 1438373854, 0),
(421, 1, 5, 'mod/chat:readlog', 1, 1438373854, 0),
(422, 1, 4, 'mod/chat:readlog', 1, 1438373854, 0),
(423, 1, 3, 'mod/chat:readlog', 1, 1438373854, 0),
(424, 1, 1, 'mod/chat:readlog', 1, 1438373854, 0),
(425, 1, 4, 'mod/chat:deletelog', 1, 1438373854, 0),
(426, 1, 3, 'mod/chat:deletelog', 1, 1438373854, 0),
(427, 1, 1, 'mod/chat:deletelog', 1, 1438373854, 0),
(428, 1, 4, 'mod/chat:exportparticipatedsession', 1, 1438373854, 0),
(429, 1, 3, 'mod/chat:exportparticipatedsession', 1, 1438373854, 0),
(430, 1, 1, 'mod/chat:exportparticipatedsession', 1, 1438373855, 0),
(431, 1, 4, 'mod/chat:exportsession', 1, 1438373855, 0),
(432, 1, 3, 'mod/chat:exportsession', 1, 1438373855, 0),
(433, 1, 1, 'mod/chat:exportsession', 1, 1438373855, 0),
(434, 1, 3, 'mod/choice:addinstance', 1, 1438373857, 0),
(435, 1, 1, 'mod/choice:addinstance', 1, 1438373857, 0),
(436, 1, 5, 'mod/choice:choose', 1, 1438373857, 0),
(437, 1, 4, 'mod/choice:choose', 1, 1438373857, 0),
(438, 1, 3, 'mod/choice:choose', 1, 1438373857, 0),
(439, 1, 4, 'mod/choice:readresponses', 1, 1438373857, 0),
(440, 1, 3, 'mod/choice:readresponses', 1, 1438373857, 0),
(441, 1, 1, 'mod/choice:readresponses', 1, 1438373857, 0),
(442, 1, 4, 'mod/choice:deleteresponses', 1, 1438373857, 0),
(443, 1, 3, 'mod/choice:deleteresponses', 1, 1438373857, 0),
(444, 1, 1, 'mod/choice:deleteresponses', 1, 1438373857, 0),
(445, 1, 4, 'mod/choice:downloadresponses', 1, 1438373857, 0),
(446, 1, 3, 'mod/choice:downloadresponses', 1, 1438373857, 0),
(447, 1, 1, 'mod/choice:downloadresponses', 1, 1438373857, 0),
(448, 1, 3, 'mod/data:addinstance', 1, 1438373861, 0),
(449, 1, 1, 'mod/data:addinstance', 1, 1438373861, 0),
(450, 1, 8, 'mod/data:viewentry', 1, 1438373861, 0),
(451, 1, 6, 'mod/data:viewentry', 1, 1438373861, 0),
(452, 1, 5, 'mod/data:viewentry', 1, 1438373861, 0),
(453, 1, 4, 'mod/data:viewentry', 1, 1438373861, 0),
(454, 1, 3, 'mod/data:viewentry', 1, 1438373861, 0),
(455, 1, 1, 'mod/data:viewentry', 1, 1438373861, 0),
(456, 1, 5, 'mod/data:writeentry', 1, 1438373861, 0),
(457, 1, 4, 'mod/data:writeentry', 1, 1438373861, 0),
(458, 1, 3, 'mod/data:writeentry', 1, 1438373861, 0),
(459, 1, 1, 'mod/data:writeentry', 1, 1438373861, 0),
(460, 1, 5, 'mod/data:comment', 1, 1438373861, 0),
(461, 1, 4, 'mod/data:comment', 1, 1438373861, 0),
(462, 1, 3, 'mod/data:comment', 1, 1438373861, 0),
(463, 1, 1, 'mod/data:comment', 1, 1438373861, 0),
(464, 1, 4, 'mod/data:rate', 1, 1438373861, 0),
(465, 1, 3, 'mod/data:rate', 1, 1438373861, 0),
(466, 1, 1, 'mod/data:rate', 1, 1438373861, 0),
(467, 1, 4, 'mod/data:viewrating', 1, 1438373861, 0),
(468, 1, 3, 'mod/data:viewrating', 1, 1438373861, 0),
(469, 1, 1, 'mod/data:viewrating', 1, 1438373861, 0),
(470, 1, 4, 'mod/data:viewanyrating', 1, 1438373861, 0),
(471, 1, 3, 'mod/data:viewanyrating', 1, 1438373861, 0),
(472, 1, 1, 'mod/data:viewanyrating', 1, 1438373861, 0),
(473, 1, 4, 'mod/data:viewallratings', 1, 1438373861, 0),
(474, 1, 3, 'mod/data:viewallratings', 1, 1438373861, 0),
(475, 1, 1, 'mod/data:viewallratings', 1, 1438373861, 0),
(476, 1, 4, 'mod/data:approve', 1, 1438373861, 0),
(477, 1, 3, 'mod/data:approve', 1, 1438373861, 0),
(478, 1, 1, 'mod/data:approve', 1, 1438373861, 0),
(479, 1, 4, 'mod/data:manageentries', 1, 1438373861, 0),
(480, 1, 3, 'mod/data:manageentries', 1, 1438373861, 0),
(481, 1, 1, 'mod/data:manageentries', 1, 1438373861, 0),
(482, 1, 4, 'mod/data:managecomments', 1, 1438373861, 0),
(483, 1, 3, 'mod/data:managecomments', 1, 1438373861, 0),
(484, 1, 1, 'mod/data:managecomments', 1, 1438373861, 0),
(485, 1, 3, 'mod/data:managetemplates', 1, 1438373861, 0),
(486, 1, 1, 'mod/data:managetemplates', 1, 1438373861, 0),
(487, 1, 4, 'mod/data:viewalluserpresets', 1, 1438373861, 0),
(488, 1, 3, 'mod/data:viewalluserpresets', 1, 1438373861, 0),
(489, 1, 1, 'mod/data:viewalluserpresets', 1, 1438373861, 0),
(490, 1, 1, 'mod/data:manageuserpresets', 1, 1438373861, 0),
(491, 1, 1, 'mod/data:exportentry', 1, 1438373861, 0),
(492, 1, 4, 'mod/data:exportentry', 1, 1438373861, 0),
(493, 1, 3, 'mod/data:exportentry', 1, 1438373861, 0),
(494, 1, 1, 'mod/data:exportownentry', 1, 1438373861, 0),
(495, 1, 4, 'mod/data:exportownentry', 1, 1438373861, 0),
(496, 1, 3, 'mod/data:exportownentry', 1, 1438373861, 0),
(497, 1, 5, 'mod/data:exportownentry', 1, 1438373861, 0),
(498, 1, 1, 'mod/data:exportallentries', 1, 1438373861, 0),
(499, 1, 4, 'mod/data:exportallentries', 1, 1438373861, 0),
(500, 1, 3, 'mod/data:exportallentries', 1, 1438373861, 0),
(501, 1, 1, 'mod/data:exportuserinfo', 1, 1438373861, 0),
(502, 1, 4, 'mod/data:exportuserinfo', 1, 1438373861, 0),
(503, 1, 3, 'mod/data:exportuserinfo', 1, 1438373861, 0),
(504, 1, 3, 'mod/feedback:addinstance', 1, 1438373865, 0),
(505, 1, 1, 'mod/feedback:addinstance', 1, 1438373865, 0),
(506, 1, 6, 'mod/feedback:view', 1, 1438373865, 0),
(507, 1, 5, 'mod/feedback:view', 1, 1438373865, 0),
(508, 1, 4, 'mod/feedback:view', 1, 1438373865, 0),
(509, 1, 3, 'mod/feedback:view', 1, 1438373865, 0),
(510, 1, 1, 'mod/feedback:view', 1, 1438373865, 0),
(511, 1, 5, 'mod/feedback:complete', 1, 1438373865, 0),
(512, 1, 5, 'mod/feedback:viewanalysepage', 1, 1438373865, 0),
(513, 1, 3, 'mod/feedback:viewanalysepage', 1, 1438373865, 0),
(514, 1, 1, 'mod/feedback:viewanalysepage', 1, 1438373865, 0),
(515, 1, 3, 'mod/feedback:deletesubmissions', 1, 1438373865, 0),
(516, 1, 1, 'mod/feedback:deletesubmissions', 1, 1438373865, 0),
(517, 1, 1, 'mod/feedback:mapcourse', 1, 1438373865, 0),
(518, 1, 3, 'mod/feedback:edititems', 1, 1438373865, 0),
(519, 1, 1, 'mod/feedback:edititems', 1, 1438373865, 0),
(520, 1, 3, 'mod/feedback:createprivatetemplate', 1, 1438373865, 0),
(521, 1, 1, 'mod/feedback:createprivatetemplate', 1, 1438373865, 0),
(522, 1, 3, 'mod/feedback:createpublictemplate', 1, 1438373865, 0),
(523, 1, 1, 'mod/feedback:createpublictemplate', 1, 1438373865, 0),
(524, 1, 3, 'mod/feedback:deletetemplate', 1, 1438373865, 0),
(525, 1, 1, 'mod/feedback:deletetemplate', 1, 1438373865, 0),
(526, 1, 4, 'mod/feedback:viewreports', 1, 1438373865, 0),
(527, 1, 3, 'mod/feedback:viewreports', 1, 1438373865, 0),
(528, 1, 1, 'mod/feedback:viewreports', 1, 1438373865, 0),
(529, 1, 4, 'mod/feedback:receivemail', 1, 1438373865, 0),
(530, 1, 3, 'mod/feedback:receivemail', 1, 1438373865, 0),
(531, 1, 3, 'mod/folder:addinstance', 1, 1438373868, 0),
(532, 1, 1, 'mod/folder:addinstance', 1, 1438373868, 0),
(533, 1, 6, 'mod/folder:view', 1, 1438373868, 0),
(534, 1, 7, 'mod/folder:view', 1, 1438373868, 0),
(535, 1, 3, 'mod/folder:managefiles', 1, 1438373868, 0),
(536, 1, 3, 'mod/forum:addinstance', 1, 1438373872, 0),
(537, 1, 1, 'mod/forum:addinstance', 1, 1438373872, 0),
(538, 1, 8, 'mod/forum:viewdiscussion', 1, 1438373872, 0),
(539, 1, 6, 'mod/forum:viewdiscussion', 1, 1438373872, 0),
(540, 1, 5, 'mod/forum:viewdiscussion', 1, 1438373872, 0),
(541, 1, 4, 'mod/forum:viewdiscussion', 1, 1438373872, 0),
(542, 1, 3, 'mod/forum:viewdiscussion', 1, 1438373872, 0),
(543, 1, 1, 'mod/forum:viewdiscussion', 1, 1438373872, 0),
(544, 1, 4, 'mod/forum:viewhiddentimedposts', 1, 1438373872, 0),
(545, 1, 3, 'mod/forum:viewhiddentimedposts', 1, 1438373872, 0),
(546, 1, 1, 'mod/forum:viewhiddentimedposts', 1, 1438373872, 0),
(547, 1, 5, 'mod/forum:startdiscussion', 1, 1438373872, 0),
(548, 1, 4, 'mod/forum:startdiscussion', 1, 1438373872, 0),
(549, 1, 3, 'mod/forum:startdiscussion', 1, 1438373872, 0),
(550, 1, 1, 'mod/forum:startdiscussion', 1, 1438373872, 0),
(551, 1, 5, 'mod/forum:replypost', 1, 1438373872, 0),
(552, 1, 4, 'mod/forum:replypost', 1, 1438373872, 0),
(553, 1, 3, 'mod/forum:replypost', 1, 1438373872, 0),
(554, 1, 1, 'mod/forum:replypost', 1, 1438373872, 0),
(555, 1, 4, 'mod/forum:addnews', 1, 1438373872, 0),
(556, 1, 3, 'mod/forum:addnews', 1, 1438373872, 0),
(557, 1, 1, 'mod/forum:addnews', 1, 1438373872, 0),
(558, 1, 4, 'mod/forum:replynews', 1, 1438373872, 0),
(559, 1, 3, 'mod/forum:replynews', 1, 1438373872, 0),
(560, 1, 1, 'mod/forum:replynews', 1, 1438373872, 0),
(561, 1, 5, 'mod/forum:viewrating', 1, 1438373872, 0),
(562, 1, 4, 'mod/forum:viewrating', 1, 1438373872, 0),
(563, 1, 3, 'mod/forum:viewrating', 1, 1438373872, 0),
(564, 1, 1, 'mod/forum:viewrating', 1, 1438373872, 0),
(565, 1, 4, 'mod/forum:viewanyrating', 1, 1438373872, 0),
(566, 1, 3, 'mod/forum:viewanyrating', 1, 1438373872, 0),
(567, 1, 1, 'mod/forum:viewanyrating', 1, 1438373872, 0),
(568, 1, 4, 'mod/forum:viewallratings', 1, 1438373872, 0),
(569, 1, 3, 'mod/forum:viewallratings', 1, 1438373872, 0),
(570, 1, 1, 'mod/forum:viewallratings', 1, 1438373872, 0),
(571, 1, 4, 'mod/forum:rate', 1, 1438373872, 0),
(572, 1, 3, 'mod/forum:rate', 1, 1438373872, 0),
(573, 1, 1, 'mod/forum:rate', 1, 1438373872, 0),
(574, 1, 5, 'mod/forum:createattachment', 1, 1438373872, 0),
(575, 1, 4, 'mod/forum:createattachment', 1, 1438373872, 0),
(576, 1, 3, 'mod/forum:createattachment', 1, 1438373872, 0),
(577, 1, 1, 'mod/forum:createattachment', 1, 1438373872, 0),
(578, 1, 5, 'mod/forum:deleteownpost', 1, 1438373872, 0),
(579, 1, 4, 'mod/forum:deleteownpost', 1, 1438373872, 0),
(580, 1, 3, 'mod/forum:deleteownpost', 1, 1438373872, 0),
(581, 1, 1, 'mod/forum:deleteownpost', 1, 1438373872, 0),
(582, 1, 4, 'mod/forum:deleteanypost', 1, 1438373873, 0),
(583, 1, 3, 'mod/forum:deleteanypost', 1, 1438373873, 0),
(584, 1, 1, 'mod/forum:deleteanypost', 1, 1438373873, 0),
(585, 1, 4, 'mod/forum:splitdiscussions', 1, 1438373873, 0),
(586, 1, 3, 'mod/forum:splitdiscussions', 1, 1438373873, 0),
(587, 1, 1, 'mod/forum:splitdiscussions', 1, 1438373873, 0),
(588, 1, 4, 'mod/forum:movediscussions', 1, 1438373873, 0),
(589, 1, 3, 'mod/forum:movediscussions', 1, 1438373873, 0),
(590, 1, 1, 'mod/forum:movediscussions', 1, 1438373873, 0),
(591, 1, 4, 'mod/forum:editanypost', 1, 1438373873, 0),
(592, 1, 3, 'mod/forum:editanypost', 1, 1438373873, 0),
(593, 1, 1, 'mod/forum:editanypost', 1, 1438373873, 0),
(594, 1, 4, 'mod/forum:viewqandawithoutposting', 1, 1438373873, 0),
(595, 1, 3, 'mod/forum:viewqandawithoutposting', 1, 1438373873, 0),
(596, 1, 1, 'mod/forum:viewqandawithoutposting', 1, 1438373873, 0),
(597, 1, 4, 'mod/forum:viewsubscribers', 1, 1438373873, 0),
(598, 1, 3, 'mod/forum:viewsubscribers', 1, 1438373873, 0),
(599, 1, 1, 'mod/forum:viewsubscribers', 1, 1438373873, 0),
(600, 1, 4, 'mod/forum:managesubscriptions', 1, 1438373873, 0),
(601, 1, 3, 'mod/forum:managesubscriptions', 1, 1438373873, 0),
(602, 1, 1, 'mod/forum:managesubscriptions', 1, 1438373873, 0),
(603, 1, 4, 'mod/forum:postwithoutthrottling', 1, 1438373873, 0),
(604, 1, 3, 'mod/forum:postwithoutthrottling', 1, 1438373873, 0),
(605, 1, 1, 'mod/forum:postwithoutthrottling', 1, 1438373873, 0),
(606, 1, 4, 'mod/forum:exportdiscussion', 1, 1438373873, 0),
(607, 1, 3, 'mod/forum:exportdiscussion', 1, 1438373873, 0),
(608, 1, 1, 'mod/forum:exportdiscussion', 1, 1438373873, 0),
(609, 1, 4, 'mod/forum:exportpost', 1, 1438373873, 0),
(610, 1, 3, 'mod/forum:exportpost', 1, 1438373873, 0),
(611, 1, 1, 'mod/forum:exportpost', 1, 1438373873, 0),
(612, 1, 4, 'mod/forum:exportownpost', 1, 1438373873, 0),
(613, 1, 3, 'mod/forum:exportownpost', 1, 1438373873, 0),
(614, 1, 1, 'mod/forum:exportownpost', 1, 1438373873, 0),
(615, 1, 5, 'mod/forum:exportownpost', 1, 1438373873, 0),
(616, 1, 4, 'mod/forum:addquestion', 1, 1438373873, 0),
(617, 1, 3, 'mod/forum:addquestion', 1, 1438373873, 0),
(618, 1, 1, 'mod/forum:addquestion', 1, 1438373873, 0),
(619, 1, 5, 'mod/forum:allowforcesubscribe', 1, 1438373873, 0),
(620, 1, 4, 'mod/forum:allowforcesubscribe', 1, 1438373873, 0),
(621, 1, 3, 'mod/forum:allowforcesubscribe', 1, 1438373873, 0),
(622, 1, 8, 'mod/forum:allowforcesubscribe', 1, 1438373873, 0),
(623, 1, 3, 'mod/glossary:addinstance', 1, 1438373877, 0),
(624, 1, 1, 'mod/glossary:addinstance', 1, 1438373877, 0),
(625, 1, 8, 'mod/glossary:view', 1, 1438373877, 0),
(626, 1, 6, 'mod/glossary:view', 1, 1438373877, 0),
(627, 1, 5, 'mod/glossary:view', 1, 1438373877, 0),
(628, 1, 4, 'mod/glossary:view', 1, 1438373877, 0),
(629, 1, 3, 'mod/glossary:view', 1, 1438373877, 0),
(630, 1, 1, 'mod/glossary:view', 1, 1438373877, 0),
(631, 1, 5, 'mod/glossary:write', 1, 1438373877, 0),
(632, 1, 4, 'mod/glossary:write', 1, 1438373877, 0),
(633, 1, 3, 'mod/glossary:write', 1, 1438373877, 0),
(634, 1, 1, 'mod/glossary:write', 1, 1438373877, 0),
(635, 1, 4, 'mod/glossary:manageentries', 1, 1438373877, 0),
(636, 1, 3, 'mod/glossary:manageentries', 1, 1438373877, 0),
(637, 1, 1, 'mod/glossary:manageentries', 1, 1438373877, 0),
(638, 1, 4, 'mod/glossary:managecategories', 1, 1438373877, 0),
(639, 1, 3, 'mod/glossary:managecategories', 1, 1438373877, 0),
(640, 1, 1, 'mod/glossary:managecategories', 1, 1438373877, 0),
(641, 1, 5, 'mod/glossary:comment', 1, 1438373877, 0),
(642, 1, 4, 'mod/glossary:comment', 1, 1438373877, 0),
(643, 1, 3, 'mod/glossary:comment', 1, 1438373877, 0),
(644, 1, 1, 'mod/glossary:comment', 1, 1438373877, 0),
(645, 1, 4, 'mod/glossary:managecomments', 1, 1438373877, 0),
(646, 1, 3, 'mod/glossary:managecomments', 1, 1438373877, 0),
(647, 1, 1, 'mod/glossary:managecomments', 1, 1438373877, 0),
(648, 1, 4, 'mod/glossary:import', 1, 1438373877, 0),
(649, 1, 3, 'mod/glossary:import', 1, 1438373877, 0),
(650, 1, 1, 'mod/glossary:import', 1, 1438373877, 0),
(651, 1, 4, 'mod/glossary:export', 1, 1438373878, 0),
(652, 1, 3, 'mod/glossary:export', 1, 1438373878, 0),
(653, 1, 1, 'mod/glossary:export', 1, 1438373878, 0),
(654, 1, 4, 'mod/glossary:approve', 1, 1438373878, 0),
(655, 1, 3, 'mod/glossary:approve', 1, 1438373878, 0),
(656, 1, 1, 'mod/glossary:approve', 1, 1438373878, 0),
(657, 1, 4, 'mod/glossary:rate', 1, 1438373878, 0),
(658, 1, 3, 'mod/glossary:rate', 1, 1438373878, 0),
(659, 1, 1, 'mod/glossary:rate', 1, 1438373878, 0),
(660, 1, 4, 'mod/glossary:viewrating', 1, 1438373878, 0),
(661, 1, 3, 'mod/glossary:viewrating', 1, 1438373878, 0),
(662, 1, 1, 'mod/glossary:viewrating', 1, 1438373878, 0),
(663, 1, 4, 'mod/glossary:viewanyrating', 1, 1438373878, 0),
(664, 1, 3, 'mod/glossary:viewanyrating', 1, 1438373878, 0),
(665, 1, 1, 'mod/glossary:viewanyrating', 1, 1438373878, 0),
(666, 1, 4, 'mod/glossary:viewallratings', 1, 1438373878, 0),
(667, 1, 3, 'mod/glossary:viewallratings', 1, 1438373878, 0),
(668, 1, 1, 'mod/glossary:viewallratings', 1, 1438373878, 0),
(669, 1, 4, 'mod/glossary:exportentry', 1, 1438373878, 0),
(670, 1, 3, 'mod/glossary:exportentry', 1, 1438373878, 0),
(671, 1, 1, 'mod/glossary:exportentry', 1, 1438373878, 0),
(672, 1, 4, 'mod/glossary:exportownentry', 1, 1438373878, 0),
(673, 1, 3, 'mod/glossary:exportownentry', 1, 1438373878, 0),
(674, 1, 1, 'mod/glossary:exportownentry', 1, 1438373878, 0),
(675, 1, 5, 'mod/glossary:exportownentry', 1, 1438373878, 0),
(676, 1, 6, 'mod/imscp:view', 1, 1438373881, 0),
(677, 1, 7, 'mod/imscp:view', 1, 1438373881, 0),
(678, 1, 3, 'mod/imscp:addinstance', 1, 1438373881, 0),
(679, 1, 1, 'mod/imscp:addinstance', 1, 1438373881, 0),
(680, 1, 3, 'mod/label:addinstance', 1, 1438373883, 0),
(681, 1, 1, 'mod/label:addinstance', 1, 1438373883, 0),
(682, 1, 3, 'mod/lesson:addinstance', 1, 1438373887, 0),
(683, 1, 1, 'mod/lesson:addinstance', 1, 1438373887, 0),
(684, 1, 3, 'mod/lesson:edit', 1, 1438373887, 0),
(685, 1, 1, 'mod/lesson:edit', 1, 1438373887, 0),
(686, 1, 4, 'mod/lesson:manage', 1, 1438373887, 0),
(687, 1, 3, 'mod/lesson:manage', 1, 1438373887, 0),
(688, 1, 1, 'mod/lesson:manage', 1, 1438373887, 0),
(689, 1, 5, 'mod/lti:view', 1, 1438373889, 0),
(690, 1, 4, 'mod/lti:view', 1, 1438373889, 0),
(691, 1, 3, 'mod/lti:view', 1, 1438373889, 0),
(692, 1, 1, 'mod/lti:view', 1, 1438373889, 0),
(693, 1, 3, 'mod/lti:addinstance', 1, 1438373889, 0),
(694, 1, 1, 'mod/lti:addinstance', 1, 1438373889, 0),
(695, 1, 4, 'mod/lti:grade', 1, 1438373889, 0),
(696, 1, 3, 'mod/lti:grade', 1, 1438373889, 0),
(697, 1, 1, 'mod/lti:grade', 1, 1438373889, 0),
(698, 1, 4, 'mod/lti:manage', 1, 1438373889, 0),
(699, 1, 3, 'mod/lti:manage', 1, 1438373889, 0),
(700, 1, 1, 'mod/lti:manage', 1, 1438373889, 0),
(701, 1, 3, 'mod/lti:addcoursetool', 1, 1438373889, 0),
(702, 1, 1, 'mod/lti:addcoursetool', 1, 1438373889, 0),
(703, 1, 3, 'mod/lti:requesttooladd', 1, 1438373889, 0),
(704, 1, 1, 'mod/lti:requesttooladd', 1, 1438373889, 0),
(705, 1, 6, 'mod/page:view', 1, 1438373891, 0),
(706, 1, 7, 'mod/page:view', 1, 1438373891, 0),
(707, 1, 3, 'mod/page:addinstance', 1, 1438373891, 0),
(708, 1, 1, 'mod/page:addinstance', 1, 1438373891, 0),
(709, 1, 6, 'mod/quiz:view', 1, 1438373894, 0),
(710, 1, 5, 'mod/quiz:view', 1, 1438373894, 0),
(711, 1, 4, 'mod/quiz:view', 1, 1438373894, 0),
(712, 1, 3, 'mod/quiz:view', 1, 1438373894, 0),
(713, 1, 1, 'mod/quiz:view', 1, 1438373894, 0),
(714, 1, 3, 'mod/quiz:addinstance', 1, 1438373894, 0),
(715, 1, 1, 'mod/quiz:addinstance', 1, 1438373894, 0),
(716, 1, 5, 'mod/quiz:attempt', 1, 1438373894, 0),
(717, 1, 5, 'mod/quiz:reviewmyattempts', 1, 1438373894, 0),
(718, 1, 3, 'mod/quiz:manage', 1, 1438373894, 0),
(719, 1, 1, 'mod/quiz:manage', 1, 1438373894, 0),
(720, 1, 3, 'mod/quiz:manageoverrides', 1, 1438373894, 0),
(721, 1, 1, 'mod/quiz:manageoverrides', 1, 1438373894, 0),
(722, 1, 4, 'mod/quiz:preview', 1, 1438373894, 0),
(723, 1, 3, 'mod/quiz:preview', 1, 1438373894, 0),
(724, 1, 1, 'mod/quiz:preview', 1, 1438373894, 0),
(725, 1, 4, 'mod/quiz:grade', 1, 1438373894, 0),
(726, 1, 3, 'mod/quiz:grade', 1, 1438373894, 0),
(727, 1, 1, 'mod/quiz:grade', 1, 1438373894, 0),
(728, 1, 4, 'mod/quiz:regrade', 1, 1438373894, 0),
(729, 1, 3, 'mod/quiz:regrade', 1, 1438373894, 0),
(730, 1, 1, 'mod/quiz:regrade', 1, 1438373894, 0),
(731, 1, 4, 'mod/quiz:viewreports', 1, 1438373894, 0),
(732, 1, 3, 'mod/quiz:viewreports', 1, 1438373894, 0),
(733, 1, 1, 'mod/quiz:viewreports', 1, 1438373894, 0),
(734, 1, 3, 'mod/quiz:deleteattempts', 1, 1438373894, 0),
(735, 1, 1, 'mod/quiz:deleteattempts', 1, 1438373894, 0),
(736, 1, 6, 'mod/resource:view', 1, 1438373897, 0),
(737, 1, 7, 'mod/resource:view', 1, 1438373897, 0),
(738, 1, 3, 'mod/resource:addinstance', 1, 1438373897, 0),
(739, 1, 1, 'mod/resource:addinstance', 1, 1438373897, 0),
(740, 1, 3, 'mod/scorm:addinstance', 1, 1438373901, 0),
(741, 1, 1, 'mod/scorm:addinstance', 1, 1438373901, 0),
(742, 1, 4, 'mod/scorm:viewreport', 1, 1438373901, 0),
(743, 1, 3, 'mod/scorm:viewreport', 1, 1438373901, 0),
(744, 1, 1, 'mod/scorm:viewreport', 1, 1438373901, 0),
(745, 1, 5, 'mod/scorm:skipview', 1, 1438373901, 0),
(746, 1, 5, 'mod/scorm:savetrack', 1, 1438373901, 0),
(747, 1, 4, 'mod/scorm:savetrack', 1, 1438373901, 0),
(748, 1, 3, 'mod/scorm:savetrack', 1, 1438373901, 0),
(749, 1, 1, 'mod/scorm:savetrack', 1, 1438373901, 0),
(750, 1, 5, 'mod/scorm:viewscores', 1, 1438373901, 0),
(751, 1, 4, 'mod/scorm:viewscores', 1, 1438373901, 0),
(752, 1, 3, 'mod/scorm:viewscores', 1, 1438373901, 0),
(753, 1, 1, 'mod/scorm:viewscores', 1, 1438373901, 0),
(754, 1, 4, 'mod/scorm:deleteresponses', 1, 1438373901, 0),
(755, 1, 3, 'mod/scorm:deleteresponses', 1, 1438373901, 0),
(756, 1, 1, 'mod/scorm:deleteresponses', 1, 1438373901, 0),
(757, 1, 3, 'mod/survey:addinstance', 1, 1438373905, 0),
(758, 1, 1, 'mod/survey:addinstance', 1, 1438373905, 0),
(759, 1, 5, 'mod/survey:participate', 1, 1438373905, 0),
(760, 1, 4, 'mod/survey:participate', 1, 1438373905, 0),
(761, 1, 3, 'mod/survey:participate', 1, 1438373905, 0),
(762, 1, 1, 'mod/survey:participate', 1, 1438373905, 0),
(763, 1, 4, 'mod/survey:readresponses', 1, 1438373905, 0),
(764, 1, 3, 'mod/survey:readresponses', 1, 1438373905, 0),
(765, 1, 1, 'mod/survey:readresponses', 1, 1438373905, 0),
(766, 1, 4, 'mod/survey:download', 1, 1438373905, 0),
(767, 1, 3, 'mod/survey:download', 1, 1438373905, 0),
(768, 1, 1, 'mod/survey:download', 1, 1438373905, 0),
(769, 1, 6, 'mod/url:view', 1, 1438373908, 0),
(770, 1, 7, 'mod/url:view', 1, 1438373908, 0),
(771, 1, 3, 'mod/url:addinstance', 1, 1438373908, 0),
(772, 1, 1, 'mod/url:addinstance', 1, 1438373908, 0),
(773, 1, 3, 'mod/wiki:addinstance', 1, 1438373911, 0),
(774, 1, 1, 'mod/wiki:addinstance', 1, 1438373911, 0),
(775, 1, 6, 'mod/wiki:viewpage', 1, 1438373911, 0),
(776, 1, 5, 'mod/wiki:viewpage', 1, 1438373911, 0),
(777, 1, 4, 'mod/wiki:viewpage', 1, 1438373911, 0),
(778, 1, 3, 'mod/wiki:viewpage', 1, 1438373911, 0),
(779, 1, 1, 'mod/wiki:viewpage', 1, 1438373911, 0),
(780, 1, 5, 'mod/wiki:editpage', 1, 1438373911, 0),
(781, 1, 4, 'mod/wiki:editpage', 1, 1438373911, 0),
(782, 1, 3, 'mod/wiki:editpage', 1, 1438373911, 0),
(783, 1, 1, 'mod/wiki:editpage', 1, 1438373911, 0),
(784, 1, 5, 'mod/wiki:createpage', 1, 1438373911, 0),
(785, 1, 4, 'mod/wiki:createpage', 1, 1438373911, 0),
(786, 1, 3, 'mod/wiki:createpage', 1, 1438373911, 0),
(787, 1, 1, 'mod/wiki:createpage', 1, 1438373911, 0),
(788, 1, 5, 'mod/wiki:viewcomment', 1, 1438373911, 0),
(789, 1, 4, 'mod/wiki:viewcomment', 1, 1438373911, 0),
(790, 1, 3, 'mod/wiki:viewcomment', 1, 1438373911, 0),
(791, 1, 1, 'mod/wiki:viewcomment', 1, 1438373911, 0),
(792, 1, 5, 'mod/wiki:editcomment', 1, 1438373911, 0),
(793, 1, 4, 'mod/wiki:editcomment', 1, 1438373911, 0),
(794, 1, 3, 'mod/wiki:editcomment', 1, 1438373911, 0),
(795, 1, 1, 'mod/wiki:editcomment', 1, 1438373911, 0),
(796, 1, 4, 'mod/wiki:managecomment', 1, 1438373911, 0),
(797, 1, 3, 'mod/wiki:managecomment', 1, 1438373911, 0),
(798, 1, 1, 'mod/wiki:managecomment', 1, 1438373911, 0),
(799, 1, 4, 'mod/wiki:managefiles', 1, 1438373912, 0),
(800, 1, 3, 'mod/wiki:managefiles', 1, 1438373912, 0),
(801, 1, 1, 'mod/wiki:managefiles', 1, 1438373912, 0),
(802, 1, 4, 'mod/wiki:overridelock', 1, 1438373912, 0),
(803, 1, 3, 'mod/wiki:overridelock', 1, 1438373912, 0),
(804, 1, 1, 'mod/wiki:overridelock', 1, 1438373912, 0),
(805, 1, 4, 'mod/wiki:managewiki', 1, 1438373912, 0),
(806, 1, 3, 'mod/wiki:managewiki', 1, 1438373912, 0),
(807, 1, 1, 'mod/wiki:managewiki', 1, 1438373912, 0),
(808, 1, 6, 'mod/workshop:view', 1, 1438373917, 0),
(809, 1, 5, 'mod/workshop:view', 1, 1438373917, 0),
(810, 1, 4, 'mod/workshop:view', 1, 1438373917, 0),
(811, 1, 3, 'mod/workshop:view', 1, 1438373917, 0),
(812, 1, 1, 'mod/workshop:view', 1, 1438373917, 0),
(813, 1, 3, 'mod/workshop:addinstance', 1, 1438373917, 0),
(814, 1, 1, 'mod/workshop:addinstance', 1, 1438373917, 0),
(815, 1, 4, 'mod/workshop:switchphase', 1, 1438373917, 0),
(816, 1, 3, 'mod/workshop:switchphase', 1, 1438373917, 0),
(817, 1, 1, 'mod/workshop:switchphase', 1, 1438373917, 0),
(818, 1, 3, 'mod/workshop:editdimensions', 1, 1438373917, 0),
(819, 1, 1, 'mod/workshop:editdimensions', 1, 1438373917, 0),
(820, 1, 5, 'mod/workshop:submit', 1, 1438373917, 0),
(821, 1, 5, 'mod/workshop:peerassess', 1, 1438373917, 0),
(822, 1, 4, 'mod/workshop:manageexamples', 1, 1438373917, 0),
(823, 1, 3, 'mod/workshop:manageexamples', 1, 1438373917, 0),
(824, 1, 1, 'mod/workshop:manageexamples', 1, 1438373917, 0),
(825, 1, 4, 'mod/workshop:allocate', 1, 1438373917, 0),
(826, 1, 3, 'mod/workshop:allocate', 1, 1438373917, 0),
(827, 1, 1, 'mod/workshop:allocate', 1, 1438373917, 0),
(828, 1, 4, 'mod/workshop:publishsubmissions', 1, 1438373917, 0),
(829, 1, 3, 'mod/workshop:publishsubmissions', 1, 1438373917, 0),
(830, 1, 1, 'mod/workshop:publishsubmissions', 1, 1438373917, 0),
(831, 1, 5, 'mod/workshop:viewauthornames', 1, 1438373917, 0),
(832, 1, 4, 'mod/workshop:viewauthornames', 1, 1438373917, 0),
(833, 1, 3, 'mod/workshop:viewauthornames', 1, 1438373917, 0),
(834, 1, 1, 'mod/workshop:viewauthornames', 1, 1438373917, 0),
(835, 1, 4, 'mod/workshop:viewreviewernames', 1, 1438373917, 0),
(836, 1, 3, 'mod/workshop:viewreviewernames', 1, 1438373917, 0),
(837, 1, 1, 'mod/workshop:viewreviewernames', 1, 1438373917, 0),
(838, 1, 4, 'mod/workshop:viewallsubmissions', 1, 1438373917, 0),
(839, 1, 3, 'mod/workshop:viewallsubmissions', 1, 1438373917, 0),
(840, 1, 1, 'mod/workshop:viewallsubmissions', 1, 1438373917, 0),
(841, 1, 5, 'mod/workshop:viewpublishedsubmissions', 1, 1438373917, 0),
(842, 1, 4, 'mod/workshop:viewpublishedsubmissions', 1, 1438373917, 0),
(843, 1, 3, 'mod/workshop:viewpublishedsubmissions', 1, 1438373917, 0),
(844, 1, 1, 'mod/workshop:viewpublishedsubmissions', 1, 1438373917, 0),
(845, 1, 5, 'mod/workshop:viewauthorpublished', 1, 1438373917, 0),
(846, 1, 4, 'mod/workshop:viewauthorpublished', 1, 1438373917, 0),
(847, 1, 3, 'mod/workshop:viewauthorpublished', 1, 1438373917, 0),
(848, 1, 1, 'mod/workshop:viewauthorpublished', 1, 1438373917, 0),
(849, 1, 4, 'mod/workshop:viewallassessments', 1, 1438373917, 0),
(850, 1, 3, 'mod/workshop:viewallassessments', 1, 1438373917, 0),
(851, 1, 1, 'mod/workshop:viewallassessments', 1, 1438373917, 0),
(852, 1, 4, 'mod/workshop:overridegrades', 1, 1438373917, 0),
(853, 1, 3, 'mod/workshop:overridegrades', 1, 1438373917, 0),
(854, 1, 1, 'mod/workshop:overridegrades', 1, 1438373917, 0),
(855, 1, 4, 'mod/workshop:ignoredeadlines', 1, 1438373917, 0),
(856, 1, 3, 'mod/workshop:ignoredeadlines', 1, 1438373917, 0),
(857, 1, 1, 'mod/workshop:ignoredeadlines', 1, 1438373917, 0),
(858, 1, 1, 'enrol/authorize:config', 1, 1438373967, 0),
(859, 1, 1, 'enrol/authorize:manage', 1, 1438373967, 0),
(860, 1, 3, 'enrol/authorize:manage', 1, 1438373967, 0),
(861, 1, 1, 'enrol/authorize:unenrol', 1, 1438373967, 0),
(862, 1, 1, 'enrol/authorize:managepayments', 1, 1438373967, 0),
(863, 1, 1, 'enrol/authorize:uploadcsv', 1, 1438373967, 0),
(864, 1, 3, 'enrol/cohort:config', 1, 1438373973, 0),
(865, 1, 1, 'enrol/cohort:config', 1, 1438373973, 0),
(866, 1, 1, 'enrol/cohort:unenrol', 1, 1438373973, 0),
(867, 1, 1, 'enrol/database:unenrol', 1, 1438373976, 0),
(868, 1, 1, 'enrol/guest:config', 1, 1438373982, 0),
(869, 1, 3, 'enrol/guest:config', 1, 1438373982, 0),
(870, 1, 1, 'enrol/ldap:manage', 1, 1438373988, 0),
(871, 1, 1, 'enrol/manual:config', 1, 1438373991, 0),
(872, 1, 1, 'enrol/manual:enrol', 1, 1438373991, 0),
(873, 1, 3, 'enrol/manual:enrol', 1, 1438373991, 0),
(874, 1, 1, 'enrol/manual:manage', 1, 1438373991, 0),
(875, 1, 3, 'enrol/manual:manage', 1, 1438373991, 0),
(876, 1, 1, 'enrol/manual:unenrol', 1, 1438373991, 0),
(877, 1, 3, 'enrol/manual:unenrol', 1, 1438373991, 0),
(878, 1, 1, 'enrol/meta:config', 1, 1438373994, 0),
(879, 1, 3, 'enrol/meta:config', 1, 1438373994, 0),
(880, 1, 1, 'enrol/meta:selectaslinked', 1, 1438373994, 0),
(881, 1, 1, 'enrol/meta:unenrol', 1, 1438373994, 0),
(882, 1, 1, 'enrol/paypal:config', 1, 1438374004, 0),
(883, 1, 1, 'enrol/paypal:manage', 1, 1438374004, 0),
(884, 1, 3, 'enrol/paypal:manage', 1, 1438374004, 0),
(885, 1, 1, 'enrol/paypal:unenrol', 1, 1438374004, 0),
(886, 1, 3, 'enrol/self:config', 1, 1438374007, 0),
(887, 1, 1, 'enrol/self:config', 1, 1438374007, 0),
(888, 1, 3, 'enrol/self:manage', 1, 1438374007, 0),
(889, 1, 1, 'enrol/self:manage', 1, 1438374007, 0),
(890, 1, 5, 'enrol/self:unenrolself', 1, 1438374007, 0),
(891, 1, 3, 'enrol/self:unenrol', 1, 1438374007, 0),
(892, 1, 1, 'enrol/self:unenrol', 1, 1438374007, 0),
(893, 1, 3, 'block/activity_modules:addinstance', 1, 1438374034, 0),
(894, 1, 1, 'block/activity_modules:addinstance', 1, 1438374034, 0),
(895, 1, 7, 'block/admin_bookmarks:myaddinstance', 1, 1438374037, 0),
(896, 1, 3, 'block/admin_bookmarks:addinstance', 1, 1438374037, 0),
(897, 1, 1, 'block/admin_bookmarks:addinstance', 1, 1438374037, 0);
INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(898, 1, 3, 'block/badges:addinstance', 1, 1438374041, 0),
(899, 1, 1, 'block/badges:addinstance', 1, 1438374041, 0),
(900, 1, 7, 'block/badges:myaddinstance', 1, 1438374041, 0),
(901, 1, 3, 'block/blog_menu:addinstance', 1, 1438374044, 0),
(902, 1, 1, 'block/blog_menu:addinstance', 1, 1438374044, 0),
(903, 1, 3, 'block/blog_recent:addinstance', 1, 1438374047, 0),
(904, 1, 1, 'block/blog_recent:addinstance', 1, 1438374047, 0),
(905, 1, 3, 'block/blog_tags:addinstance', 1, 1438374050, 0),
(906, 1, 1, 'block/blog_tags:addinstance', 1, 1438374050, 0),
(907, 1, 7, 'block/calendar_month:myaddinstance', 1, 1438374053, 0),
(908, 1, 3, 'block/calendar_month:addinstance', 1, 1438374053, 0),
(909, 1, 1, 'block/calendar_month:addinstance', 1, 1438374053, 0),
(910, 1, 7, 'block/calendar_upcoming:myaddinstance', 1, 1438374056, 0),
(911, 1, 3, 'block/calendar_upcoming:addinstance', 1, 1438374056, 0),
(912, 1, 1, 'block/calendar_upcoming:addinstance', 1, 1438374056, 0),
(913, 1, 7, 'block/comments:myaddinstance', 1, 1438374059, 0),
(914, 1, 3, 'block/comments:addinstance', 1, 1438374059, 0),
(915, 1, 1, 'block/comments:addinstance', 1, 1438374059, 0),
(916, 1, 7, 'block/community:myaddinstance', 1, 1438374062, 0),
(917, 1, 3, 'block/community:addinstance', 1, 1438374062, 0),
(918, 1, 1, 'block/community:addinstance', 1, 1438374062, 0),
(919, 1, 3, 'block/completionstatus:addinstance', 1, 1438374065, 0),
(920, 1, 1, 'block/completionstatus:addinstance', 1, 1438374065, 0),
(921, 1, 7, 'block/course_list:myaddinstance', 1, 1438374068, 0),
(922, 1, 3, 'block/course_list:addinstance', 1, 1438374068, 0),
(923, 1, 1, 'block/course_list:addinstance', 1, 1438374068, 0),
(924, 1, 7, 'block/course_overview:myaddinstance', 1, 1438374076, 0),
(925, 1, 3, 'block/course_overview:addinstance', 1, 1438374076, 0),
(926, 1, 1, 'block/course_overview:addinstance', 1, 1438374076, 0),
(927, 1, 3, 'block/course_summary:addinstance', 1, 1438374080, 0),
(928, 1, 1, 'block/course_summary:addinstance', 1, 1438374080, 0),
(929, 1, 3, 'block/feedback:addinstance', 1, 1438374086, 0),
(930, 1, 1, 'block/feedback:addinstance', 1, 1438374086, 0),
(931, 1, 7, 'block/glossary_random:myaddinstance', 1, 1438374090, 0),
(932, 1, 3, 'block/glossary_random:addinstance', 1, 1438374090, 0),
(933, 1, 1, 'block/glossary_random:addinstance', 1, 1438374090, 0),
(934, 1, 7, 'block/html:myaddinstance', 1, 1438374094, 0),
(935, 1, 3, 'block/html:addinstance', 1, 1438374094, 0),
(936, 1, 1, 'block/html:addinstance', 1, 1438374094, 0),
(937, 1, 3, 'block/login:addinstance', 1, 1438374098, 0),
(938, 1, 1, 'block/login:addinstance', 1, 1438374098, 0),
(939, 1, 7, 'block/mentees:myaddinstance', 1, 1438374108, 0),
(940, 1, 3, 'block/mentees:addinstance', 1, 1438374108, 0),
(941, 1, 1, 'block/mentees:addinstance', 1, 1438374108, 0),
(942, 1, 7, 'block/messages:myaddinstance', 1, 1438374113, 0),
(943, 1, 3, 'block/messages:addinstance', 1, 1438374113, 0),
(944, 1, 1, 'block/messages:addinstance', 1, 1438374113, 0),
(945, 1, 7, 'block/mnet_hosts:myaddinstance', 1, 1438374116, 0),
(946, 1, 3, 'block/mnet_hosts:addinstance', 1, 1438374116, 0),
(947, 1, 1, 'block/mnet_hosts:addinstance', 1, 1438374116, 0),
(948, 1, 7, 'block/myprofile:myaddinstance', 1, 1438374120, 0),
(949, 1, 3, 'block/myprofile:addinstance', 1, 1438374120, 0),
(950, 1, 1, 'block/myprofile:addinstance', 1, 1438374120, 0),
(951, 1, 7, 'block/navigation:myaddinstance', 1, 1438374123, 0),
(952, 1, 3, 'block/navigation:addinstance', 1, 1438374123, 0),
(953, 1, 1, 'block/navigation:addinstance', 1, 1438374123, 0),
(954, 1, 7, 'block/news_items:myaddinstance', 1, 1438374126, 0),
(955, 1, 3, 'block/news_items:addinstance', 1, 1438374126, 0),
(956, 1, 1, 'block/news_items:addinstance', 1, 1438374126, 0),
(957, 1, 7, 'block/online_users:myaddinstance', 1, 1438374129, 0),
(958, 1, 3, 'block/online_users:addinstance', 1, 1438374129, 0),
(959, 1, 1, 'block/online_users:addinstance', 1, 1438374129, 0),
(960, 1, 7, 'block/online_users:viewlist', 1, 1438374129, 0),
(961, 1, 6, 'block/online_users:viewlist', 1, 1438374129, 0),
(962, 1, 5, 'block/online_users:viewlist', 1, 1438374129, 0),
(963, 1, 4, 'block/online_users:viewlist', 1, 1438374129, 0),
(964, 1, 3, 'block/online_users:viewlist', 1, 1438374129, 0),
(965, 1, 1, 'block/online_users:viewlist', 1, 1438374129, 0),
(966, 1, 3, 'block/participants:addinstance', 1, 1438374132, 0),
(967, 1, 1, 'block/participants:addinstance', 1, 1438374132, 0),
(968, 1, 7, 'block/private_files:myaddinstance', 1, 1438374135, 0),
(969, 1, 3, 'block/private_files:addinstance', 1, 1438374135, 0),
(970, 1, 1, 'block/private_files:addinstance', 1, 1438374135, 0),
(971, 1, 3, 'block/quiz_results:addinstance', 1, 1438374138, 0),
(972, 1, 1, 'block/quiz_results:addinstance', 1, 1438374138, 0),
(973, 1, 3, 'block/recent_activity:addinstance', 1, 1438374142, 0),
(974, 1, 1, 'block/recent_activity:addinstance', 1, 1438374142, 0),
(975, 1, 7, 'block/rss_client:myaddinstance', 1, 1438374145, 0),
(976, 1, 3, 'block/rss_client:addinstance', 1, 1438374145, 0),
(977, 1, 1, 'block/rss_client:addinstance', 1, 1438374145, 0),
(978, 1, 4, 'block/rss_client:manageownfeeds', 1, 1438374145, 0),
(979, 1, 3, 'block/rss_client:manageownfeeds', 1, 1438374145, 0),
(980, 1, 1, 'block/rss_client:manageownfeeds', 1, 1438374145, 0),
(981, 1, 1, 'block/rss_client:manageanyfeeds', 1, 1438374145, 0),
(982, 1, 3, 'block/search_forums:addinstance', 1, 1438374148, 0),
(983, 1, 1, 'block/search_forums:addinstance', 1, 1438374148, 0),
(984, 1, 3, 'block/section_links:addinstance', 1, 1438374151, 0),
(985, 1, 1, 'block/section_links:addinstance', 1, 1438374151, 0),
(986, 1, 3, 'block/selfcompletion:addinstance', 1, 1438374154, 0),
(987, 1, 1, 'block/selfcompletion:addinstance', 1, 1438374154, 0),
(988, 1, 7, 'block/settings:myaddinstance', 1, 1438374157, 0),
(989, 1, 3, 'block/settings:addinstance', 1, 1438374157, 0),
(990, 1, 1, 'block/settings:addinstance', 1, 1438374157, 0),
(991, 1, 3, 'block/site_main_menu:addinstance', 1, 1438374161, 0),
(992, 1, 1, 'block/site_main_menu:addinstance', 1, 1438374161, 0),
(993, 1, 3, 'block/social_activities:addinstance', 1, 1438374165, 0),
(994, 1, 1, 'block/social_activities:addinstance', 1, 1438374165, 0),
(995, 1, 3, 'block/tag_flickr:addinstance', 1, 1438374169, 0),
(996, 1, 1, 'block/tag_flickr:addinstance', 1, 1438374169, 0),
(997, 1, 3, 'block/tag_youtube:addinstance', 1, 1438374172, 0),
(998, 1, 1, 'block/tag_youtube:addinstance', 1, 1438374172, 0),
(999, 1, 7, 'block/tags:myaddinstance', 1, 1438374175, 0),
(1000, 1, 3, 'block/tags:addinstance', 1, 1438374175, 0),
(1001, 1, 1, 'block/tags:addinstance', 1, 1438374175, 0),
(1002, 1, 4, 'report/completion:view', 1, 1438374267, 0),
(1003, 1, 3, 'report/completion:view', 1, 1438374267, 0),
(1004, 1, 1, 'report/completion:view', 1, 1438374267, 0),
(1005, 1, 4, 'report/courseoverview:view', 1, 1438374274, 0),
(1006, 1, 3, 'report/courseoverview:view', 1, 1438374274, 0),
(1007, 1, 1, 'report/courseoverview:view', 1, 1438374274, 0),
(1008, 1, 4, 'report/log:view', 1, 1438374278, 0),
(1009, 1, 3, 'report/log:view', 1, 1438374278, 0),
(1010, 1, 1, 'report/log:view', 1, 1438374278, 0),
(1011, 1, 4, 'report/log:viewtoday', 1, 1438374278, 0),
(1012, 1, 3, 'report/log:viewtoday', 1, 1438374278, 0),
(1013, 1, 1, 'report/log:viewtoday', 1, 1438374278, 0),
(1014, 1, 4, 'report/loglive:view', 1, 1438374282, 0),
(1015, 1, 3, 'report/loglive:view', 1, 1438374282, 0),
(1016, 1, 1, 'report/loglive:view', 1, 1438374282, 0),
(1017, 1, 4, 'report/outline:view', 1, 1438374286, 0),
(1018, 1, 3, 'report/outline:view', 1, 1438374286, 0),
(1019, 1, 1, 'report/outline:view', 1, 1438374286, 0),
(1020, 1, 4, 'report/participation:view', 1, 1438374289, 0),
(1021, 1, 3, 'report/participation:view', 1, 1438374289, 0),
(1022, 1, 1, 'report/participation:view', 1, 1438374289, 0),
(1023, 1, 1, 'report/performance:view', 1, 1438374293, 0),
(1024, 1, 4, 'report/progress:view', 1, 1438374298, 0),
(1025, 1, 3, 'report/progress:view', 1, 1438374298, 0),
(1026, 1, 1, 'report/progress:view', 1, 1438374298, 0),
(1027, 1, 1, 'report/security:view', 1, 1438374305, 0),
(1028, 1, 4, 'report/stats:view', 1, 1438374309, 0),
(1029, 1, 3, 'report/stats:view', 1, 1438374309, 0),
(1030, 1, 1, 'report/stats:view', 1, 1438374309, 0),
(1031, 1, 4, 'gradeexport/ods:view', 1, 1438374314, 0),
(1032, 1, 3, 'gradeexport/ods:view', 1, 1438374314, 0),
(1033, 1, 1, 'gradeexport/ods:view', 1, 1438374314, 0),
(1034, 1, 1, 'gradeexport/ods:publish', 1, 1438374314, 0),
(1035, 1, 4, 'gradeexport/txt:view', 1, 1438374318, 0),
(1036, 1, 3, 'gradeexport/txt:view', 1, 1438374318, 0),
(1037, 1, 1, 'gradeexport/txt:view', 1, 1438374318, 0),
(1038, 1, 1, 'gradeexport/txt:publish', 1, 1438374318, 0),
(1039, 1, 4, 'gradeexport/xls:view', 1, 1438374322, 0),
(1040, 1, 3, 'gradeexport/xls:view', 1, 1438374322, 0),
(1041, 1, 1, 'gradeexport/xls:view', 1, 1438374322, 0),
(1042, 1, 1, 'gradeexport/xls:publish', 1, 1438374322, 0),
(1043, 1, 4, 'gradeexport/xml:view', 1, 1438374326, 0),
(1044, 1, 3, 'gradeexport/xml:view', 1, 1438374326, 0),
(1045, 1, 1, 'gradeexport/xml:view', 1, 1438374326, 0),
(1046, 1, 1, 'gradeexport/xml:publish', 1, 1438374326, 0),
(1047, 1, 3, 'gradeimport/csv:view', 1, 1438374330, 0),
(1048, 1, 1, 'gradeimport/csv:view', 1, 1438374330, 0),
(1049, 1, 3, 'gradeimport/xml:view', 1, 1438374334, 0),
(1050, 1, 1, 'gradeimport/xml:view', 1, 1438374334, 0),
(1051, 1, 1, 'gradeimport/xml:publish', 1, 1438374334, 0),
(1052, 1, 4, 'gradereport/grader:view', 1, 1438374338, 0),
(1053, 1, 3, 'gradereport/grader:view', 1, 1438374338, 0),
(1054, 1, 1, 'gradereport/grader:view', 1, 1438374338, 0),
(1055, 1, 4, 'gradereport/outcomes:view', 1, 1438374342, 0),
(1056, 1, 3, 'gradereport/outcomes:view', 1, 1438374342, 0),
(1057, 1, 1, 'gradereport/outcomes:view', 1, 1438374342, 0),
(1058, 1, 5, 'gradereport/overview:view', 1, 1438374346, 0),
(1059, 1, 1, 'gradereport/overview:view', 1, 1438374346, 0),
(1060, 1, 5, 'gradereport/user:view', 1, 1438374349, 0),
(1061, 1, 4, 'gradereport/user:view', 1, 1438374349, 0),
(1062, 1, 3, 'gradereport/user:view', 1, 1438374349, 0),
(1063, 1, 1, 'gradereport/user:view', 1, 1438374349, 0),
(1064, 1, 7, 'repository/alfresco:view', 1, 1438374384, 0),
(1065, 1, 7, 'repository/boxnet:view', 1, 1438374388, 0),
(1066, 1, 2, 'repository/coursefiles:view', 1, 1438374392, 0),
(1067, 1, 4, 'repository/coursefiles:view', 1, 1438374392, 0),
(1068, 1, 3, 'repository/coursefiles:view', 1, 1438374392, 0),
(1069, 1, 1, 'repository/coursefiles:view', 1, 1438374392, 0),
(1070, 1, 7, 'repository/dropbox:view', 1, 1438374396, 0),
(1071, 1, 7, 'repository/equella:view', 1, 1438374401, 0),
(1072, 1, 2, 'repository/filesystem:view', 1, 1438374405, 0),
(1073, 1, 4, 'repository/filesystem:view', 1, 1438374405, 0),
(1074, 1, 3, 'repository/filesystem:view', 1, 1438374405, 0),
(1075, 1, 1, 'repository/filesystem:view', 1, 1438374405, 0),
(1076, 1, 7, 'repository/flickr:view', 1, 1438374409, 0),
(1077, 1, 7, 'repository/flickr_public:view', 1, 1438374413, 0),
(1078, 1, 7, 'repository/googledocs:view', 1, 1438374418, 0),
(1079, 1, 2, 'repository/local:view', 1, 1438374422, 0),
(1080, 1, 4, 'repository/local:view', 1, 1438374422, 0),
(1081, 1, 3, 'repository/local:view', 1, 1438374422, 0),
(1082, 1, 1, 'repository/local:view', 1, 1438374422, 0),
(1083, 1, 7, 'repository/merlot:view', 1, 1438374427, 0),
(1084, 1, 7, 'repository/picasa:view', 1, 1438374431, 0),
(1085, 1, 7, 'repository/recent:view', 1, 1438374436, 0),
(1086, 1, 7, 'repository/s3:view', 1, 1438374440, 0),
(1087, 1, 7, 'repository/upload:view', 1, 1438374445, 0),
(1088, 1, 7, 'repository/url:view', 1, 1438374449, 0),
(1089, 1, 7, 'repository/user:view', 1, 1438374453, 0),
(1090, 1, 2, 'repository/webdav:view', 1, 1438374458, 0),
(1091, 1, 4, 'repository/webdav:view', 1, 1438374458, 0),
(1092, 1, 3, 'repository/webdav:view', 1, 1438374458, 0),
(1093, 1, 1, 'repository/webdav:view', 1, 1438374458, 0),
(1094, 1, 7, 'repository/wikimedia:view', 1, 1438374463, 0),
(1095, 1, 7, 'repository/youtube:view', 1, 1438374468, 0),
(1096, 1, 1, 'tool/customlang:view', 1, 1438374606, 0),
(1097, 1, 1, 'tool/customlang:edit', 1, 1438374606, 0),
(1098, 1, 3, 'booktool/importhtml:import', 1, 1438374912, 0),
(1099, 1, 1, 'booktool/importhtml:import', 1, 1438374912, 0),
(1100, 1, 6, 'booktool/print:print', 1, 1438374918, 0),
(1101, 1, 8, 'booktool/print:print', 1, 1438374918, 0),
(1102, 1, 5, 'booktool/print:print', 1, 1438374918, 0),
(1103, 1, 4, 'booktool/print:print', 1, 1438374918, 0),
(1104, 1, 3, 'booktool/print:print', 1, 1438374918, 0),
(1105, 1, 1, 'booktool/print:print', 1, 1438374918, 0),
(1106, 1, 4, 'quiz/grading:viewstudentnames', 1, 1438374996, 0),
(1107, 1, 3, 'quiz/grading:viewstudentnames', 1, 1438374996, 0),
(1108, 1, 1, 'quiz/grading:viewstudentnames', 1, 1438374996, 0),
(1109, 1, 4, 'quiz/grading:viewidnumber', 1, 1438374996, 0),
(1110, 1, 3, 'quiz/grading:viewidnumber', 1, 1438374996, 0),
(1111, 1, 1, 'quiz/grading:viewidnumber', 1, 1438374996, 0),
(1112, 1, 4, 'quiz/statistics:view', 1, 1438375018, 0),
(1113, 1, 3, 'quiz/statistics:view', 1, 1438375018, 0),
(1114, 1, 1, 'quiz/statistics:view', 1, 1438375018, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_context_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Lists which roles can be assigned at which context levels. T' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_role_context_levels`
--

INSERT INTO `mdl_role_context_levels` (`id`, `roleid`, `contextlevel`) VALUES
(1, 1, 10),
(4, 2, 10),
(2, 1, 40),
(5, 2, 40),
(3, 1, 50),
(6, 3, 50),
(8, 4, 50),
(10, 5, 50),
(7, 3, 70),
(9, 4, 70),
(11, 5, 70);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_names`
--

CREATE TABLE IF NOT EXISTS `mdl_role_names` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='role names in native strings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_sortorder`
--

CREATE TABLE IF NOT EXISTS `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sort order of course managers in a course' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale`
--

CREATE TABLE IF NOT EXISTS `mdl_scale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines grading scales' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale_history`
--

CREATE TABLE IF NOT EXISTS `mdl_scale_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scormtype` varchar(50) NOT NULL DEFAULT 'local',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '1',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '1',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) DEFAULT NULL,
  `md5hash` varchar(32) NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `hidenav` tinyint(1) NOT NULL DEFAULT '0',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each table is one SCORM module and its configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_aicc_session`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) DEFAULT NULL,
  `scormstatus` varchar(255) DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) DEFAULT NULL,
  `sessiontime` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by AICC HACP to store session information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) NOT NULL DEFAULT '',
  `organization` varchar(255) NOT NULL DEFAULT '',
  `parent` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `launch` longtext NOT NULL,
  `scormtype` varchar(5) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each SCO part of the SCORM module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_data`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains variable data get from packages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_track`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to track SCOes' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective mapinfo description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_objective`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `action` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule condition' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule conditions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) DEFAULT NULL,
  `lastip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Database based session storage - now recommended' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_sessions`
--

INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(2, 0, 'po38ln58cvhq1vpokhn5mirtj2', 2, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo2OntzOjE4OiJjYWNoZXN0b3JlX3Nlc3Npb24iO2E6MTp7czozMDoiZGVmYXVsdF9zZXNzaW9uLWNvcmUvY291cnNlY2F0IjthOjQ6e3M6MTc6Il9fbGFzdGFjY2Vzc19fdTJfIjthOjI6e2k6MDtpOjE0MzgzNzU4ODk7aToxO2k6MTQzODM3NTg4OTt9czo0NDoidTJfXzNiMjg3YTY5MDg2YzAzYjYxNjljOWZiNzNkODQ4NWY5MTQwOWI2NjciO2E6Mjp7aTowO2k6MTQzODM3NTg4OTtpOjE7aToxNDM4Mzc1ODg5O31zOjQ0OiJ1Ml9fYjVhZTAwMzE0YzQ0NThjZWExY2U5MjA2OTI4NDJkYmFkY2ZiMGVjYiI7YToyOntpOjA7YToxOntpOjA7aToyO31pOjE7aToxNDM4Mzc1NTgyO31zOjQ0OiJ1Ml9fOWI3NzA4MTUxNzEzOTRlMDhiMWMxODBiZWI0OTQxMjJiYjU0NDAxNSI7YToyOntpOjA7aToxO2k6MTtpOjE0MzgzNzU1ODI7fX19czo0OiJsYW5nIjtzOjI6ImVuIjtzOjg6Im5hdmNhY2hlIjtPOjg6InN0ZENsYXNzIjoxOntzOjEwOiJuYXZpZ2F0aW9uIjthOjM6e3M6MTY6InVzZXJibG9nb3B0aW9uczIiO2E6Mzp7aTowO2k6MTQzODM3NTU2NDtpOjE7czoxOiIyIjtpOjI7czo2ODM6ImE6Mjp7czo0OiJ2aWV3IjthOjI6e3M6Njoic3RyaW5nIjtzOjIyOiJWaWV3IGFsbCBvZiBteSBlbnRyaWVzIjtzOjQ6ImxpbmsiO086MTA6Im1vb2RsZV91cmwiOjk6e3M6OToiACoAc2NoZW1lIjtzOjQ6Imh0dHAiO3M6NzoiACoAaG9zdCI7czo5OiJsb2NhbGhvc3QiO3M6NzoiACoAcG9ydCI7czowOiIiO3M6NzoiACoAdXNlciI7czowOiIiO3M6NzoiACoAcGFzcyI7czowOiIiO3M6NzoiACoAcGF0aCI7czoxNToiL2Jsb2cvaW5kZXgucGhwIjtzOjE2OiIAKgBzbGFzaGFyZ3VtZW50IjtzOjA6IiI7czo5OiIAKgBhbmNob3IiO047czo5OiIAKgBwYXJhbXMiO2E6MTp7czo2OiJ1c2VyaWQiO3M6MToiMiI7fX19czozOiJhZGQiO2E6Mjp7czo2OiJzdHJpbmciO3M6MTU6IkFkZCBhIG5ldyBlbnRyeSI7czo0OiJsaW5rIjtPOjEwOiJtb29kbGVfdXJsIjo5OntzOjk6IgAqAHNjaGVtZSI7czo0OiJodHRwIjtzOjc6IgAqAGhvc3QiO3M6OToibG9jYWxob3N0IjtzOjc6IgAqAHBvcnQiO3M6MDoiIjtzOjc6IgAqAHVzZXIiO3M6MDoiIjtzOjc6IgAqAHBhc3MiO3M6MDoiIjtzOjc6IgAqAHBhdGgiO3M6MTQ6Ii9ibG9nL2VkaXQucGhwIjtzOjE2OiIAKgBzbGFzaGFyZ3VtZW50IjtzOjA6IiI7czo5OiIAKgBhbmNob3IiO047czo5OiIAKgBwYXJhbXMiO2E6MTp7czo2OiJhY3Rpb24iO3M6MzoiYWRkIjt9fX19Ijt9czoxNjoiY29udGV4dGhhc3JlcG9zNSI7YTozOntpOjA7aToxNDM4Mzc1NTY0O2k6MTtzOjE6IjIiO2k6MjtzOjQ6ImI6MDsiO31zOjE3OiJjb250ZXh0aGFzcmVwb3MxNSI7YTozOntpOjA7aToxNDM4Mzc1NTY0O2k6MTtzOjE6IjIiO2k6MjtzOjQ6ImI6MDsiO319fXM6MjI6ImFkbWluX2NyaXRpY2FsX3dhcm5pbmciO2k6MDtzOjIxOiJsb2FkX25hdmlnYXRpb25fYWRtaW4iO2I6MTtzOjIxOiJjYWxlbmRhcnNob3dldmVudHR5cGUiO2k6MTU7fVVTRVJ8Tzo4OiJzdGRDbGFzcyI6NTk6e3M6MjoiaWQiO3M6MToiMiI7czo0OiJhdXRoIjtzOjY6Im1hbnVhbCI7czo5OiJjb25maXJtZWQiO3M6MToiMSI7czoxMjoicG9saWN5YWdyZWVkIjtzOjE6IjAiO3M6NzoiZGVsZXRlZCI7czoxOiIwIjtzOjk6InN1c3BlbmRlZCI7czoxOiIwIjtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6ODoicGFzc3dvcmQiO3M6NjA6IiQyeSQxMCRuQUdMNUtQMTUuZEZGU2g2ejJGTWtPYm1wWHpaalV1SXBmeXBhSm9FaTNqVjkxYnZuWk43QyI7czo4OiJpZG51bWJlciI7czowOiIiO3M6OToiZmlyc3RuYW1lIjtzOjU6IkFkbWluIjtzOjg6Imxhc3RuYW1lIjtzOjQ6IlVzZXIiO3M6NToiZW1haWwiO3M6MjA6ImFiaGluYXkyMTJAZ21haWwuY29tIjtzOjk6ImVtYWlsc3RvcCI7czoxOiIwIjtzOjM6ImljcSI7czowOiIiO3M6NToic2t5cGUiO3M6MDoiIjtzOjU6InlhaG9vIjtzOjA6IiI7czozOiJhaW0iO3M6MDoiIjtzOjM6Im1zbiI7czowOiIiO3M6NjoicGhvbmUxIjtzOjA6IiI7czo2OiJwaG9uZTIiO3M6MDoiIjtzOjExOiJpbnN0aXR1dGlvbiI7czowOiIiO3M6MTA6ImRlcGFydG1lbnQiO3M6MDoiIjtzOjc6ImFkZHJlc3MiO3M6MDoiIjtzOjQ6ImNpdHkiO3M6OToiYmFuZ2Fsb3JlIjtzOjc6ImNvdW50cnkiO3M6MjoiSU4iO3M6NDoibGFuZyI7czoyOiJlbiI7czo1OiJ0aGVtZSI7czowOiIiO3M6ODoidGltZXpvbmUiO3M6MzoiNS41IjtzOjExOiJmaXJzdGFjY2VzcyI7czoxMDoiMTQzODM3NTIwOSI7czoxMDoibGFzdGFjY2VzcyI7aToxNDM4Mzc1ODUzO3M6OToibGFzdGxvZ2luIjtzOjE6IjAiO3M6MTI6ImN1cnJlbnRsb2dpbiI7czoxMDoiMTQzODM3NTIwOSI7czo2OiJsYXN0aXAiO3M6OToiMTI3LjAuMC4xIjtzOjY6InNlY3JldCI7czowOiIiO3M6NzoicGljdHVyZSI7czoxOiIwIjtzOjM6InVybCI7czowOiIiO3M6MTc6ImRlc2NyaXB0aW9uZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxmb3JtYXQiO3M6MToiMSI7czoxMDoibWFpbGRpZ2VzdCI7czoxOiIwIjtzOjExOiJtYWlsZGlzcGxheSI7czoxOiIxIjtzOjEwOiJodG1sZWRpdG9yIjtzOjE6IjEiO3M6MTM6ImF1dG9zdWJzY3JpYmUiO3M6MToiMSI7czoxMToidHJhY2tmb3J1bXMiO3M6MToiMCI7czoxMToidGltZWNyZWF0ZWQiO3M6MToiMCI7czoxMjoidGltZW1vZGlmaWVkIjtzOjEwOiIxNDM4Mzc1MzYxIjtzOjEyOiJ0cnVzdGJpdG1hc2siO3M6MToiMCI7czo4OiJpbWFnZWFsdCI7TjtzOjE2OiJsYXN0Y291cnNlYWNjZXNzIjthOjA6e31zOjE5OiJjdXJyZW50Y291cnNlYWNjZXNzIjthOjE6e2k6MjtpOjE0MzgzNzU1NjQ7fXM6MTE6Imdyb3VwbWVtYmVyIjthOjA6e31zOjc6InByb2ZpbGUiO2E6MDp7fXM6Nzoic2Vzc2tleSI7czoxMDoiV1ZzOWxWWUJQNyI7czoxNzoibWVzc2FnZV9sYXN0cG9wdXAiO2k6MDtzOjI1OiJhamF4X3VwZGF0YWJsZV91c2VyX3ByZWZzIjthOjEwOntzOjI3OiJmaWxlcGlja2VyX3JlY2VudHJlcG9zaXRvcnkiO3M6MzoiaW50IjtzOjI0OiJmaWxlcGlja2VyX3JlY2VudGxpY2Vuc2UiO3M6Nzoic2FmZWRpciI7czoyNToiZmlsZXBpY2tlcl9yZWNlbnR2aWV3bW9kZSI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xIjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzQiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNSI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8zIjtzOjM6ImludCI7czoxMjoiYmxvY2s0aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrNWhpZGRlbiI7czo0OiJib29sIjtzOjEyOiJibG9jazNoaWRkZW4iO3M6NDoiYm9vbCI7fXM6MTA6InByZWZlcmVuY2UiO2E6NDp7czoxODoiZW1haWxfYm91bmNlX2NvdW50IjtzOjE6IjEiO3M6MTY6ImVtYWlsX3NlbmRfY291bnQiO3M6MToiMSI7czoyNzoiZmlsZXBpY2tlcl9yZWNlbnRyZXBvc2l0b3J5IjtzOjE6IjQiO3M6MTE6Il9sYXN0bG9hZGVkIjtpOjE0MzgzNzU4ODU7fXM6MTE6ImRlc2NyaXB0aW9uIjtzOjA6IiI7czo1OiJlbnJvbCI7YToyOntzOjg6ImVucm9sbGVkIjthOjA6e31zOjk6InRlbXBndWVzdCI7YTowOnt9fXM6NjoiYWNjZXNzIjthOjc6e3M6MjoicmEiO2E6Mjp7czoyOiIvMSI7YToxOntpOjc7aTo3O31zOjQ6Ii8xLzIiO2E6MTp7aTo4O2k6ODt9fXM6NDoicmRlZiI7YToyOntzOjQ6Ii8xOjciO2E6NzI6e3M6MzU6ImJsb2NrL2FkbWluX2Jvb2ttYXJrczpteWFkZGluc3RhbmNlIjtpOjE7czoyNjoiYmxvY2svYmFkZ2VzOm15YWRkaW5zdGFuY2UiO2k6MTtzOjM0OiJibG9jay9jYWxlbmRhcl9tb250aDpteWFkZGluc3RhbmNlIjtpOjE7czozNzoiYmxvY2svY2FsZW5kYXJfdXBjb21pbmc6bXlhZGRpbnN0YW5jZSI7aToxO3M6Mjg6ImJsb2NrL2NvbW1lbnRzOm15YWRkaW5zdGFuY2UiO2k6MTtzOjI5OiJibG9jay9jb21tdW5pdHk6bXlhZGRpbnN0YW5jZSI7aToxO3M6MzE6ImJsb2NrL2NvdXJzZV9saXN0Om15YWRkaW5zdGFuY2UiO2k6MTtzOjM1OiJibG9jay9jb3Vyc2Vfb3ZlcnZpZXc6bXlhZGRpbnN0YW5jZSI7aToxO3M6MzU6ImJsb2NrL2dsb3NzYXJ5X3JhbmRvbTpteWFkZGluc3RhbmNlIjtpOjE7czoyNDoiYmxvY2svaHRtbDpteWFkZGluc3RhbmNlIjtpOjE7czoyNzoiYmxvY2svbWVudGVlczpteWFkZGluc3RhbmNlIjtpOjE7czoyODoiYmxvY2svbWVzc2FnZXM6bXlhZGRpbnN0YW5jZSI7aToxO3M6MzA6ImJsb2NrL21uZXRfaG9zdHM6bXlhZGRpbnN0YW5jZSI7aToxO3M6Mjk6ImJsb2NrL215cHJvZmlsZTpteWFkZGluc3RhbmNlIjtpOjE7czozMDoiYmxvY2svbmF2aWdhdGlvbjpteWFkZGluc3RhbmNlIjtpOjE7czozMDoiYmxvY2svbmV3c19pdGVtczpteWFkZGluc3RhbmNlIjtpOjE7czozMjoiYmxvY2svb25saW5lX3VzZXJzOm15YWRkaW5zdGFuY2UiO2k6MTtzOjI3OiJibG9jay9vbmxpbmVfdXNlcnM6dmlld2xpc3QiO2k6MTtzOjMzOiJibG9jay9wcml2YXRlX2ZpbGVzOm15YWRkaW5zdGFuY2UiO2k6MTtzOjMwOiJibG9jay9yc3NfY2xpZW50Om15YWRkaW5zdGFuY2UiO2k6MTtzOjI4OiJibG9jay9zZXR0aW5nczpteWFkZGluc3RhbmNlIjtpOjE7czoyNDoiYmxvY2svdGFnczpteWFkZGluc3RhbmNlIjtpOjE7czoxNToibW9kL2ZvbGRlcjp2aWV3IjtpOjE7czoxNDoibW9kL2ltc2NwOnZpZXciO2k6MTtzOjEzOiJtb2QvcGFnZTp2aWV3IjtpOjE7czoxNzoibW9kL3Jlc291cmNlOnZpZXciO2k6MTtzOjEyOiJtb2QvdXJsOnZpZXciO2k6MTtzOjIzOiJtb29kbGUvYmFkZ2VzOmVhcm5iYWRnZSI7aToxO3M6Mjk6Im1vb2RsZS9iYWRnZXM6bWFuYWdlb3duYmFkZ2VzIjtpOjE7czoyNDoibW9vZGxlL2JhZGdlczp2aWV3YmFkZ2VzIjtpOjE7czoyOToibW9vZGxlL2JhZGdlczp2aWV3b3RoZXJiYWRnZXMiO2k6MTtzOjE3OiJtb29kbGUvYmxvY2s6dmlldyI7aToxO3M6MTg6Im1vb2RsZS9ibG9nOmNyZWF0ZSI7aToxO3M6MjY6Im1vb2RsZS9ibG9nOm1hbmFnZWV4dGVybmFsIjtpOjE7czoxODoibW9vZGxlL2Jsb2c6c2VhcmNoIjtpOjE7czoxNjoibW9vZGxlL2Jsb2c6dmlldyI7aToxO3M6MzI6Im1vb2RsZS9jYWxlbmRhcjptYW5hZ2Vvd25lbnRyaWVzIjtpOjE7czoxOToibW9vZGxlL2NvbW1lbnQ6cG9zdCI7aToxO3M6MTk6Im1vb2RsZS9jb21tZW50OnZpZXciO2k6MTtzOjIxOiJtb29kbGUvY291cnNlOnJlcXVlc3QiO2k6MTtzOjIyOiJtb29kbGUvbXk6bWFuYWdlYmxvY2tzIjtpOjE7czoyMzoibW9vZGxlL3BvcnRmb2xpbzpleHBvcnQiO2k6MTtzOjE4OiJtb29kbGUvcmF0aW5nOnJhdGUiO2k6MTtzOjE4OiJtb29kbGUvcmF0aW5nOnZpZXciO2k6MTtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbGwiO2k6MTtzOjIxOiJtb29kbGUvcmF0aW5nOnZpZXdhbnkiO2k6MTtzOjIzOiJtb29kbGUvc2l0ZTpzZW5kbWVzc2FnZSI7aToxO3M6MTc6Im1vb2RsZS90YWc6Y3JlYXRlIjtpOjE7czoxNToibW9vZGxlL3RhZzplZGl0IjtpOjE7czoxNToibW9vZGxlL3RhZzpmbGFnIjtpOjE7czoyOToibW9vZGxlL3VzZXI6Y2hhbmdlb3ducGFzc3dvcmQiO2k6MTtzOjMzOiJtb29kbGUvdXNlcjplZGl0b3dubWVzc2FnZXByb2ZpbGUiO2k6MTtzOjI2OiJtb29kbGUvdXNlcjplZGl0b3ducHJvZmlsZSI7aToxO3M6Mjc6Im1vb2RsZS91c2VyOm1hbmFnZW93bmJsb2NrcyI7aToxO3M6MjY6Im1vb2RsZS91c2VyOm1hbmFnZW93bmZpbGVzIjtpOjE7czozNToibW9vZGxlL3dlYnNlcnZpY2U6Y3JlYXRlbW9iaWxldG9rZW4iO2k6MTtzOjI0OiJyZXBvc2l0b3J5L2FsZnJlc2NvOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L2JveG5ldDp2aWV3IjtpOjE7czoyMzoicmVwb3NpdG9yeS9kcm9wYm94OnZpZXciO2k6MTtzOjIzOiJyZXBvc2l0b3J5L2VxdWVsbGE6dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvZmxpY2tyOnZpZXciO2k6MTtzOjI5OiJyZXBvc2l0b3J5L2ZsaWNrcl9wdWJsaWM6dmlldyI7aToxO3M6MjY6InJlcG9zaXRvcnkvZ29vZ2xlZG9jczp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS9tZXJsb3Q6dmlldyI7aToxO3M6MjI6InJlcG9zaXRvcnkvcGljYXNhOnZpZXciO2k6MTtzOjIyOiJyZXBvc2l0b3J5L3JlY2VudDp2aWV3IjtpOjE7czoxODoicmVwb3NpdG9yeS9zMzp2aWV3IjtpOjE7czoyMjoicmVwb3NpdG9yeS91cGxvYWQ6dmlldyI7aToxO3M6MTk6InJlcG9zaXRvcnkvdXJsOnZpZXciO2k6MTtzOjIwOiJyZXBvc2l0b3J5L3VzZXI6dmlldyI7aToxO3M6MjU6InJlcG9zaXRvcnkvd2lraW1lZGlhOnZpZXciO2k6MTtzOjIzOiJyZXBvc2l0b3J5L3lvdXR1YmU6dmlldyI7aToxO31zOjQ6Ii8xOjgiO2E6Nzp7czoyMDoiYm9va3Rvb2wvcHJpbnQ6cHJpbnQiO2k6MTtzOjEzOiJtb2QvYm9vazpyZWFkIjtpOjE7czoxODoibW9kL2RhdGE6dmlld2VudHJ5IjtpOjE7czoyOToibW9kL2ZvcnVtOmFsbG93Zm9yY2VzdWJzY3JpYmUiO2k6MTtzOjI0OiJtb2QvZm9ydW06dmlld2Rpc2N1c3Npb24iO2k6MTtzOjE3OiJtb2QvZ2xvc3Nhcnk6dmlldyI7aToxO3M6MTk6Im1vb2RsZS9jb21tZW50OnZpZXciO2k6MTt9fXM6MTA6InJkZWZfY291bnQiO2k6MjtzOjg6InJkZWZfbGNjIjtpOjI7czo2OiJsb2FkZWQiO2E6MDp7fXM6NDoidGltZSI7aToxNDM4Mzc1NTY0O3M6MzoicnN3IjthOjA6e319fQ==', 1438375209, 1438375889, '127.0.0.1', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to accumulate daily stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate daily stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey`
--

CREATE TABLE IF NOT EXISTS `mdl_survey` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Each record is one SURVEY module with its configuration' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mdl_survey`
--

INSERT INTO `mdl_survey` (`id`, `course`, `template`, `days`, `timecreated`, `timemodified`, `name`, `intro`, `introformat`, `questions`) VALUES
(1, 0, 0, 0, 985017600, 985017600, 'collesaname', 'collesaintro', 0, '25,26,27,28,29,30,43,44'),
(2, 0, 0, 0, 985017600, 985017600, 'collespname', 'collespintro', 0, '31,32,33,34,35,36,43,44'),
(3, 0, 0, 0, 985017600, 985017600, 'collesapname', 'collesapintro', 0, '37,38,39,40,41,42,43,44'),
(4, 0, 0, 0, 985017600, 985017600, 'attlsname', 'attlsintro', 0, '65,67,68'),
(5, 0, 0, 0, 985017600, 985017600, 'ciqname', 'ciqintro', 0, '69,70,71,72,73');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='text about each survey submission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext NOT NULL,
  `answer2` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the answers to each questions filled by the users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_questions`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_questions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL DEFAULT '',
  `shorttext` varchar(30) NOT NULL DEFAULT '',
  `multi` varchar(100) NOT NULL DEFAULT '',
  `intro` varchar(50) NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='the questions conforming one survey' AUTO_INCREMENT=74 ;

--
-- Dumping data for table `mdl_survey_questions`
--

INSERT INTO `mdl_survey_questions` (`id`, `text`, `shorttext`, `multi`, `intro`, `type`, `options`) VALUES
(1, 'colles1', 'colles1short', '', '', 1, 'scaletimes5'),
(2, 'colles2', 'colles2short', '', '', 1, 'scaletimes5'),
(3, 'colles3', 'colles3short', '', '', 1, 'scaletimes5'),
(4, 'colles4', 'colles4short', '', '', 1, 'scaletimes5'),
(5, 'colles5', 'colles5short', '', '', 1, 'scaletimes5'),
(6, 'colles6', 'colles6short', '', '', 1, 'scaletimes5'),
(7, 'colles7', 'colles7short', '', '', 1, 'scaletimes5'),
(8, 'colles8', 'colles8short', '', '', 1, 'scaletimes5'),
(9, 'colles9', 'colles9short', '', '', 1, 'scaletimes5'),
(10, 'colles10', 'colles10short', '', '', 1, 'scaletimes5'),
(11, 'colles11', 'colles11short', '', '', 1, 'scaletimes5'),
(12, 'colles12', 'colles12short', '', '', 1, 'scaletimes5'),
(13, 'colles13', 'colles13short', '', '', 1, 'scaletimes5'),
(14, 'colles14', 'colles14short', '', '', 1, 'scaletimes5'),
(15, 'colles15', 'colles15short', '', '', 1, 'scaletimes5'),
(16, 'colles16', 'colles16short', '', '', 1, 'scaletimes5'),
(17, 'colles17', 'colles17short', '', '', 1, 'scaletimes5'),
(18, 'colles18', 'colles18short', '', '', 1, 'scaletimes5'),
(19, 'colles19', 'colles19short', '', '', 1, 'scaletimes5'),
(20, 'colles20', 'colles20short', '', '', 1, 'scaletimes5'),
(21, 'colles21', 'colles21short', '', '', 1, 'scaletimes5'),
(22, 'colles22', 'colles22short', '', '', 1, 'scaletimes5'),
(23, 'colles23', 'colles23short', '', '', 1, 'scaletimes5'),
(24, 'colles24', 'colles24short', '', '', 1, 'scaletimes5'),
(25, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 1, 'scaletimes5'),
(26, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 1, 'scaletimes5'),
(27, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 1, 'scaletimes5'),
(28, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 1, 'scaletimes5'),
(29, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 1, 'scaletimes5'),
(30, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 1, 'scaletimes5'),
(31, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 2, 'scaletimes5'),
(32, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 2, 'scaletimes5'),
(33, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 2, 'scaletimes5'),
(34, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 2, 'scaletimes5'),
(35, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 2, 'scaletimes5'),
(36, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 2, 'scaletimes5'),
(37, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 3, 'scaletimes5'),
(38, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 3, 'scaletimes5'),
(39, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 3, 'scaletimes5'),
(40, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 3, 'scaletimes5'),
(41, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 3, 'scaletimes5'),
(42, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 3, 'scaletimes5'),
(43, 'howlong', '', '', '', 1, 'howlongoptions'),
(44, 'othercomments', '', '', '', 0, NULL),
(45, 'attls1', 'attls1short', '', '', 1, 'scaleagree5'),
(46, 'attls2', 'attls2short', '', '', 1, 'scaleagree5'),
(47, 'attls3', 'attls3short', '', '', 1, 'scaleagree5'),
(48, 'attls4', 'attls4short', '', '', 1, 'scaleagree5'),
(49, 'attls5', 'attls5short', '', '', 1, 'scaleagree5'),
(50, 'attls6', 'attls6short', '', '', 1, 'scaleagree5'),
(51, 'attls7', 'attls7short', '', '', 1, 'scaleagree5'),
(52, 'attls8', 'attls8short', '', '', 1, 'scaleagree5'),
(53, 'attls9', 'attls9short', '', '', 1, 'scaleagree5'),
(54, 'attls10', 'attls10short', '', '', 1, 'scaleagree5'),
(55, 'attls11', 'attls11short', '', '', 1, 'scaleagree5'),
(56, 'attls12', 'attls12short', '', '', 1, 'scaleagree5'),
(57, 'attls13', 'attls13short', '', '', 1, 'scaleagree5'),
(58, 'attls14', 'attls14short', '', '', 1, 'scaleagree5'),
(59, 'attls15', 'attls15short', '', '', 1, 'scaleagree5'),
(60, 'attls16', 'attls16short', '', '', 1, 'scaleagree5'),
(61, 'attls17', 'attls17short', '', '', 1, 'scaleagree5'),
(62, 'attls18', 'attls18short', '', '', 1, 'scaleagree5'),
(63, 'attls19', 'attls19short', '', '', 1, 'scaleagree5'),
(64, 'attls20', 'attls20short', '', '', 1, 'scaleagree5'),
(65, 'attlsm1', 'attlsm1', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64', 'attlsmintro', 1, 'scaleagree5'),
(66, '-', '-', '-', '-', 0, '-'),
(67, 'attlsm2', 'attlsm2', '63,62,59,57,55,49,52,50,48,47', 'attlsmintro', -1, 'scaleagree5'),
(68, 'attlsm3', 'attlsm3', '46,54,45,51,60,53,56,58,61,64', 'attlsmintro', -1, 'scaleagree5'),
(69, 'ciq1', 'ciq1short', '', '', 0, NULL),
(70, 'ciq2', 'ciq2short', '', '', 0, NULL),
(71, 'ciq3', 'ciq3short', '', '', 0, NULL),
(72, 'ciq4', 'ciq4short', '', '', 0, NULL),
(73, 'ciq5', 'ciq5short', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag`
--

CREATE TABLE IF NOT EXISTS `mdl_tag` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `rawname` varchar(255) NOT NULL DEFAULT '',
  `tagtype` varchar(255) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  UNIQUE KEY `mdl_tag_idnam_uix` (`id`,`name`),
  KEY `mdl_tag_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag table - this generic table will replace the old "tags" t' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_correlation`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The rationale for the ''tag_correlation'' table is performance' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  KEY `mdl_taginst_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tag_instance table holds the information of associations bet' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_temp_enroled_template`
--

CREATE TABLE IF NOT EXISTS `mdl_temp_enroled_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tempenrotemp_use_ix` (`userid`),
  KEY `mdl_tempenrotemp_cou_ix` (`courseid`),
  KEY `mdl_tempenrotemp_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary storage for course enrolments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_temp_log_template`
--

CREATE TABLE IF NOT EXISTS `mdl_temp_log_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_templogtemp_act_ix` (`action`),
  KEY `mdl_templogtemp_cou_ix` (`course`),
  KEY `mdl_templogtemp_use_ix` (`userid`),
  KEY `mdl_templogtemp_usecouact_ix` (`userid`,`course`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary storage for daily logs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_timezone`
--

CREATE TABLE IF NOT EXISTS `mdl_timezone` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `year` bigint(11) NOT NULL DEFAULT '0',
  `tzrule` varchar(20) NOT NULL DEFAULT '',
  `gmtoff` bigint(11) NOT NULL DEFAULT '0',
  `dstoff` bigint(11) NOT NULL DEFAULT '0',
  `dst_month` tinyint(2) NOT NULL DEFAULT '0',
  `dst_startday` smallint(3) NOT NULL DEFAULT '0',
  `dst_weekday` smallint(3) NOT NULL DEFAULT '0',
  `dst_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `dst_time` varchar(6) NOT NULL DEFAULT '00:00',
  `std_month` tinyint(2) NOT NULL DEFAULT '0',
  `std_startday` smallint(3) NOT NULL DEFAULT '0',
  `std_weekday` smallint(3) NOT NULL DEFAULT '0',
  `std_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `std_time` varchar(6) NOT NULL DEFAULT '00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rules for calculating local wall clock time for users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) NOT NULL DEFAULT '',
  `original` longtext NOT NULL,
  `master` longtext,
  `local` longtext,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the working checkout of all strings and their custo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang_components`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the list of all installed plugins that provide thei' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_upgrade_log`
--

CREATE TABLE IF NOT EXISTS `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `targetversion` varchar(100) DEFAULT NULL,
  `info` varchar(255) NOT NULL DEFAULT '',
  `details` longtext,
  `backtrace` longtext,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Upgrade logging' AUTO_INCREMENT=881 ;

--
-- Dumping data for table `mdl_upgrade_log`
--

INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1, 0, 'core', '2013051408', '2013051408', 'Upgrade savepoint reached', NULL, '', 0, 1438373722),
(2, 0, 'core', '2013051408', '2013051408', 'Core installed', NULL, '', 0, 1438373804),
(3, 0, 'qtype_calculated', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373805),
(4, 0, 'qtype_calculated', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373808),
(5, 0, 'qtype_calculated', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373810),
(6, 0, 'qtype_calculatedmulti', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373810),
(7, 0, 'qtype_calculatedmulti', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373810),
(8, 0, 'qtype_calculatedmulti', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373812),
(9, 0, 'qtype_calculatedsimple', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373812),
(10, 0, 'qtype_calculatedsimple', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373812),
(11, 0, 'qtype_calculatedsimple', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373814),
(12, 0, 'qtype_description', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373814),
(13, 0, 'qtype_description', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373815),
(14, 0, 'qtype_description', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373816),
(15, 0, 'qtype_essay', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373816),
(16, 0, 'qtype_essay', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373817),
(17, 0, 'qtype_essay', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373818),
(18, 0, 'qtype_match', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373819),
(19, 0, 'qtype_match', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373819),
(20, 0, 'qtype_match', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373821),
(21, 0, 'qtype_missingtype', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373821),
(22, 0, 'qtype_missingtype', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373822),
(23, 0, 'qtype_missingtype', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373823),
(24, 0, 'qtype_multianswer', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373823),
(25, 0, 'qtype_multianswer', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373824),
(26, 0, 'qtype_multianswer', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373825),
(27, 0, 'qtype_multichoice', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373826),
(28, 0, 'qtype_multichoice', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373826),
(29, 0, 'qtype_multichoice', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373828),
(30, 0, 'qtype_numerical', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373828),
(31, 0, 'qtype_numerical', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373829),
(32, 0, 'qtype_numerical', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373832),
(33, 0, 'qtype_random', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373832),
(34, 0, 'qtype_random', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373833),
(35, 0, 'qtype_random', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373836),
(36, 0, 'qtype_randomsamatch', NULL, '2013050103', 'Starting plugin installation', NULL, '', 0, 1438373836),
(37, 0, 'qtype_randomsamatch', '2013050103', '2013050103', 'Upgrade savepoint reached', NULL, '', 0, 1438373836),
(38, 0, 'qtype_randomsamatch', '2013050103', '2013050103', 'Plugin installed', NULL, '', 0, 1438373838),
(39, 0, 'qtype_shortanswer', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373838),
(40, 0, 'qtype_shortanswer', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373839),
(41, 0, 'qtype_shortanswer', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373841),
(42, 0, 'qtype_truefalse', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373841),
(43, 0, 'qtype_truefalse', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373842),
(44, 0, 'qtype_truefalse', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373843),
(45, 0, 'mod_assign', NULL, '2013050101', 'Starting plugin installation', NULL, '', 0, 1438373844),
(46, 0, 'mod_assign', '2013050101', '2013050101', 'Plugin installed', NULL, '', 0, 1438373847),
(47, 0, 'mod_assignment', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373847),
(48, 0, 'mod_assignment', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373850),
(49, 0, 'mod_book', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373850),
(50, 0, 'mod_book', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373853),
(51, 0, 'mod_chat', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373853),
(52, 0, 'mod_chat', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373856),
(53, 0, 'mod_choice', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373856),
(54, 0, 'mod_choice', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373859),
(55, 0, 'mod_data', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373859),
(56, 0, 'mod_data', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373863),
(57, 0, 'mod_feedback', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373863),
(58, 0, 'mod_feedback', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373867),
(59, 0, 'mod_folder', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373867),
(60, 0, 'mod_folder', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373869),
(61, 0, 'mod_forum', NULL, '2013050101', 'Starting plugin installation', NULL, '', 0, 1438373870),
(62, 0, 'mod_forum', '2013050101', '2013050101', 'Plugin installed', NULL, '', 0, 1438373876),
(63, 0, 'mod_glossary', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373876),
(64, 0, 'mod_glossary', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373879),
(65, 0, 'mod_imscp', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373880),
(66, 0, 'mod_imscp', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373882),
(67, 0, 'mod_label', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373882),
(68, 0, 'mod_label', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373884),
(69, 0, 'mod_lesson', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373885),
(70, 0, 'mod_lesson', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373888),
(71, 0, 'mod_lti', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373889),
(72, 0, 'mod_lti', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373890),
(73, 0, 'mod_page', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373891),
(74, 0, 'mod_page', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373892),
(75, 0, 'mod_quiz', NULL, '2013050101', 'Starting plugin installation', NULL, '', 0, 1438373893),
(76, 0, 'mod_quiz', '2013050101', '2013050101', 'Plugin installed', NULL, '', 0, 1438373896),
(77, 0, 'mod_resource', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373896),
(78, 0, 'mod_resource', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373899),
(79, 0, 'mod_scorm', NULL, '2013050105', 'Starting plugin installation', NULL, '', 0, 1438373899),
(80, 0, 'mod_scorm', '2013050105', '2013050105', 'Plugin installed', NULL, '', 0, 1438373903),
(81, 0, 'mod_survey', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373903),
(82, 0, 'mod_survey', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373907),
(83, 0, 'mod_url', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373907),
(84, 0, 'mod_url', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373909),
(85, 0, 'mod_wiki', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373910),
(86, 0, 'mod_wiki', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373913),
(87, 0, 'mod_workshop', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373914),
(88, 0, 'mod_workshop', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373919),
(89, 0, 'auth_cas', NULL, '2013052100', 'Starting plugin installation', NULL, '', 0, 1438373920),
(90, 0, 'auth_cas', '2013052100', '2013052100', 'Upgrade savepoint reached', NULL, '', 0, 1438373920),
(91, 0, 'auth_cas', '2013052100', '2013052100', 'Plugin installed', NULL, '', 0, 1438373922),
(92, 0, 'auth_db', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373923),
(93, 0, 'auth_db', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373923),
(94, 0, 'auth_db', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373925),
(95, 0, 'auth_email', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373925),
(96, 0, 'auth_email', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373926),
(97, 0, 'auth_email', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373928),
(98, 0, 'auth_fc', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373928),
(99, 0, 'auth_fc', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373929),
(100, 0, 'auth_fc', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373931),
(101, 0, 'auth_imap', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373931),
(102, 0, 'auth_imap', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373931),
(103, 0, 'auth_imap', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373933),
(104, 0, 'auth_ldap', NULL, '2013052100', 'Starting plugin installation', NULL, '', 0, 1438373934),
(105, 0, 'auth_ldap', '2013052100', '2013052100', 'Upgrade savepoint reached', NULL, '', 0, 1438373934),
(106, 0, 'auth_ldap', '2013052100', '2013052100', 'Plugin installed', NULL, '', 0, 1438373936),
(107, 0, 'auth_manual', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373937),
(108, 0, 'auth_manual', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373937),
(109, 0, 'auth_manual', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373939),
(110, 0, 'auth_mnet', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373940),
(111, 0, 'auth_mnet', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373940),
(112, 0, 'auth_mnet', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373942),
(113, 0, 'auth_nntp', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373943),
(114, 0, 'auth_nntp', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373943),
(115, 0, 'auth_nntp', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373945),
(116, 0, 'auth_nologin', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373945),
(117, 0, 'auth_nologin', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373946),
(118, 0, 'auth_nologin', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373948),
(119, 0, 'auth_none', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373948),
(120, 0, 'auth_none', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373948),
(121, 0, 'auth_none', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373950),
(122, 0, 'auth_pam', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373951),
(123, 0, 'auth_pam', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373951),
(124, 0, 'auth_pam', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373953),
(125, 0, 'auth_pop3', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373954),
(126, 0, 'auth_pop3', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373954),
(127, 0, 'auth_pop3', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373956),
(128, 0, 'auth_radius', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373957),
(129, 0, 'auth_radius', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373957),
(130, 0, 'auth_radius', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373959),
(131, 0, 'auth_shibboleth', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373960),
(132, 0, 'auth_shibboleth', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373960),
(133, 0, 'auth_shibboleth', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373962),
(134, 0, 'auth_webservice', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373962),
(135, 0, 'auth_webservice', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373963),
(136, 0, 'auth_webservice', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373965),
(137, 0, 'enrol_authorize', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373966),
(138, 0, 'enrol_authorize', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373966),
(139, 0, 'enrol_authorize', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373969),
(140, 0, 'enrol_category', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373969),
(141, 0, 'enrol_category', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373969),
(142, 0, 'enrol_category', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373971),
(143, 0, 'enrol_cohort', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373972),
(144, 0, 'enrol_cohort', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373972),
(145, 0, 'enrol_cohort', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373975),
(146, 0, 'enrol_database', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373975),
(147, 0, 'enrol_database', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373976),
(148, 0, 'enrol_database', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373978),
(149, 0, 'enrol_flatfile', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373978),
(150, 0, 'enrol_flatfile', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373979),
(151, 0, 'enrol_flatfile', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373981),
(152, 0, 'enrol_guest', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373981),
(153, 0, 'enrol_guest', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373982),
(154, 0, 'enrol_guest', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373984),
(155, 0, 'enrol_imsenterprise', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373984),
(156, 0, 'enrol_imsenterprise', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373985),
(157, 0, 'enrol_imsenterprise', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373987),
(158, 0, 'enrol_ldap', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373987),
(159, 0, 'enrol_ldap', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373988),
(160, 0, 'enrol_ldap', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373990),
(161, 0, 'enrol_manual', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373990),
(162, 0, 'enrol_manual', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373990),
(163, 0, 'enrol_manual', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373993),
(164, 0, 'enrol_meta', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373993),
(165, 0, 'enrol_meta', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373993),
(166, 0, 'enrol_meta', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373996),
(167, 0, 'enrol_mnet', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373996),
(168, 0, 'enrol_mnet', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438373997),
(169, 0, 'enrol_mnet', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438373999),
(170, 0, 'enrol_paypal', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438373999),
(171, 0, 'enrol_paypal', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374004),
(172, 0, 'enrol_paypal', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374006),
(173, 0, 'enrol_self', NULL, '2013050101', 'Starting plugin installation', NULL, '', 0, 1438374006),
(174, 0, 'enrol_self', '2013050101', '2013050101', 'Upgrade savepoint reached', NULL, '', 0, 1438374007),
(175, 0, 'enrol_self', '2013050101', '2013050101', 'Plugin installed', NULL, '', 0, 1438374009),
(176, 0, 'message_email', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374010),
(177, 0, 'message_email', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374010),
(178, 0, 'message_email', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374016),
(179, 0, 'message_jabber', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374017),
(180, 0, 'message_jabber', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374017),
(181, 0, 'message_jabber', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374024),
(182, 0, 'message_popup', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374026),
(183, 0, 'message_popup', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374027),
(184, 0, 'message_popup', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374033),
(185, 0, 'block_activity_modules', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374034),
(186, 0, 'block_activity_modules', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374036),
(187, 0, 'block_admin_bookmarks', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374037),
(188, 0, 'block_admin_bookmarks', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374040),
(189, 0, 'block_badges', NULL, '2013050101', 'Starting plugin installation', NULL, '', 0, 1438374040),
(190, 0, 'block_badges', '2013050101', '2013050101', 'Plugin installed', NULL, '', 0, 1438374043),
(191, 0, 'block_blog_menu', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374043),
(192, 0, 'block_blog_menu', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374046),
(193, 0, 'block_blog_recent', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374047),
(194, 0, 'block_blog_recent', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374049),
(195, 0, 'block_blog_tags', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374050),
(196, 0, 'block_blog_tags', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374052),
(197, 0, 'block_calendar_month', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374053),
(198, 0, 'block_calendar_month', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374055),
(199, 0, 'block_calendar_upcoming', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374056),
(200, 0, 'block_calendar_upcoming', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374058),
(201, 0, 'block_comments', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374059),
(202, 0, 'block_comments', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374060),
(203, 0, 'block_community', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374061),
(204, 0, 'block_community', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374064),
(205, 0, 'block_completionstatus', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374064),
(206, 0, 'block_completionstatus', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374067),
(207, 0, 'block_course_list', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374068),
(208, 0, 'block_course_list', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374074),
(209, 0, 'block_course_overview', NULL, '2013050101', 'Starting plugin installation', NULL, '', 0, 1438374075),
(210, 0, 'block_course_overview', '2013050101', '2013050101', 'Plugin installed', NULL, '', 0, 1438374078),
(211, 0, 'block_course_summary', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374079),
(212, 0, 'block_course_summary', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374084),
(213, 0, 'block_feedback', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374085),
(214, 0, 'block_feedback', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374088),
(215, 0, 'block_glossary_random', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374089),
(216, 0, 'block_glossary_random', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374093),
(217, 0, 'block_html', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374094),
(218, 0, 'block_html', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374097),
(219, 0, 'block_login', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374098),
(220, 0, 'block_login', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374106),
(221, 0, 'block_mentees', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374107),
(222, 0, 'block_mentees', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374110),
(223, 0, 'block_messages', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374111),
(224, 0, 'block_messages', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374115),
(225, 0, 'block_mnet_hosts', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374116),
(226, 0, 'block_mnet_hosts', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374118),
(227, 0, 'block_myprofile', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374119),
(228, 0, 'block_myprofile', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374122),
(229, 0, 'block_navigation', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374122),
(230, 0, 'block_navigation', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374125),
(231, 0, 'block_news_items', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374126),
(232, 0, 'block_news_items', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374128),
(233, 0, 'block_online_users', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374129),
(234, 0, 'block_online_users', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374131),
(235, 0, 'block_participants', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374132),
(236, 0, 'block_participants', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374134),
(237, 0, 'block_private_files', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374135),
(238, 0, 'block_private_files', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374137),
(239, 0, 'block_quiz_results', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374138),
(240, 0, 'block_quiz_results', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374140),
(241, 0, 'block_recent_activity', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374141),
(242, 0, 'block_recent_activity', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374143),
(243, 0, 'block_rss_client', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374144),
(244, 0, 'block_rss_client', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374147),
(245, 0, 'block_search_forums', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374148),
(246, 0, 'block_search_forums', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374150),
(247, 0, 'block_section_links', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374151),
(248, 0, 'block_section_links', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374153),
(249, 0, 'block_selfcompletion', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374154),
(250, 0, 'block_selfcompletion', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374156),
(251, 0, 'block_settings', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374157),
(252, 0, 'block_settings', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374160),
(253, 0, 'block_site_main_menu', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374161),
(254, 0, 'block_site_main_menu', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374164),
(255, 0, 'block_social_activities', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374165),
(256, 0, 'block_social_activities', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374167),
(257, 0, 'block_tag_flickr', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374168),
(258, 0, 'block_tag_flickr', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374171),
(259, 0, 'block_tag_youtube', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374171),
(260, 0, 'block_tag_youtube', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374174),
(261, 0, 'block_tags', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374175),
(262, 0, 'block_tags', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374177),
(263, 0, 'filter_activitynames', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374181),
(264, 0, 'filter_activitynames', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374182),
(265, 0, 'filter_activitynames', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374184),
(266, 0, 'filter_algebra', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374185),
(267, 0, 'filter_algebra', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374185),
(268, 0, 'filter_algebra', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374188),
(269, 0, 'filter_censor', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374188),
(270, 0, 'filter_censor', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374189),
(271, 0, 'filter_censor', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374191),
(272, 0, 'filter_data', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374192),
(273, 0, 'filter_data', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374193),
(274, 0, 'filter_data', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374195),
(275, 0, 'filter_emailprotect', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374196),
(276, 0, 'filter_emailprotect', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374196),
(277, 0, 'filter_emailprotect', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374199),
(278, 0, 'filter_emoticon', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374199),
(279, 0, 'filter_emoticon', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374200),
(280, 0, 'filter_emoticon', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374202),
(281, 0, 'filter_glossary', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374203),
(282, 0, 'filter_glossary', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374203),
(283, 0, 'filter_glossary', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374206),
(284, 0, 'filter_mediaplugin', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374207),
(285, 0, 'filter_mediaplugin', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374207),
(286, 0, 'filter_mediaplugin', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374210),
(287, 0, 'filter_multilang', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374210),
(288, 0, 'filter_multilang', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374211),
(289, 0, 'filter_multilang', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374213),
(290, 0, 'filter_tex', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374214),
(291, 0, 'filter_tex', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374214),
(292, 0, 'filter_tex', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374217),
(293, 0, 'filter_tidy', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374218),
(294, 0, 'filter_tidy', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374218),
(295, 0, 'filter_tidy', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374221),
(296, 0, 'filter_urltolink', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374221),
(297, 0, 'filter_urltolink', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374222),
(298, 0, 'filter_urltolink', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374224),
(299, 0, 'editor_textarea', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374224),
(300, 0, 'editor_textarea', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374225),
(301, 0, 'editor_textarea', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374227),
(302, 0, 'editor_tinymce', NULL, '2013050102', 'Starting plugin installation', NULL, '', 0, 1438374227),
(303, 0, 'editor_tinymce', '2013050102', '2013050102', 'Upgrade savepoint reached', NULL, '', 0, 1438374228),
(304, 0, 'editor_tinymce', '2013050102', '2013050102', 'Plugin installed', NULL, '', 0, 1438374230),
(305, 0, 'format_scorm', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374230),
(306, 0, 'format_scorm', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374231),
(307, 0, 'format_scorm', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374233),
(308, 0, 'format_social', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374234),
(309, 0, 'format_social', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374234),
(310, 0, 'format_social', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374237),
(311, 0, 'format_topics', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374237),
(312, 0, 'format_topics', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374237),
(313, 0, 'format_topics', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374240),
(314, 0, 'format_weeks', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374240),
(315, 0, 'format_weeks', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374241),
(316, 0, 'format_weeks', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374243),
(317, 0, 'profilefield_checkbox', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374244),
(318, 0, 'profilefield_checkbox', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374244),
(319, 0, 'profilefield_checkbox', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374247),
(320, 0, 'profilefield_datetime', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374247),
(321, 0, 'profilefield_datetime', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374248),
(322, 0, 'profilefield_datetime', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374250),
(323, 0, 'profilefield_menu', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374251),
(324, 0, 'profilefield_menu', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374251),
(325, 0, 'profilefield_menu', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374254),
(326, 0, 'profilefield_text', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374255),
(327, 0, 'profilefield_text', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374255),
(328, 0, 'profilefield_text', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374258),
(329, 0, 'profilefield_textarea', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374258),
(330, 0, 'profilefield_textarea', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374259),
(331, 0, 'profilefield_textarea', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374261),
(332, 0, 'report_backups', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374262),
(333, 0, 'report_backups', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374263),
(334, 0, 'report_backups', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374265),
(335, 0, 'report_completion', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374266),
(336, 0, 'report_completion', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374266),
(337, 0, 'report_completion', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374269),
(338, 0, 'report_configlog', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374270),
(339, 0, 'report_configlog', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374270),
(340, 0, 'report_configlog', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374273),
(341, 0, 'report_courseoverview', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374273),
(342, 0, 'report_courseoverview', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374274),
(343, 0, 'report_courseoverview', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374276),
(344, 0, 'report_log', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374277),
(345, 0, 'report_log', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374277),
(346, 0, 'report_log', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374280),
(347, 0, 'report_loglive', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374281),
(348, 0, 'report_loglive', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374281),
(349, 0, 'report_loglive', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374284),
(350, 0, 'report_outline', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374285),
(351, 0, 'report_outline', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374285),
(352, 0, 'report_outline', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374288),
(353, 0, 'report_participation', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374288),
(354, 0, 'report_participation', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374289),
(355, 0, 'report_participation', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374292),
(356, 0, 'report_performance', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374292),
(357, 0, 'report_performance', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374293),
(358, 0, 'report_performance', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374296),
(359, 0, 'report_progress', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374297),
(360, 0, 'report_progress', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374297),
(361, 0, 'report_progress', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374300),
(362, 0, 'report_questioninstances', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374301),
(363, 0, 'report_questioninstances', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374301),
(364, 0, 'report_questioninstances', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374304),
(365, 0, 'report_security', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374304),
(366, 0, 'report_security', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374305),
(367, 0, 'report_security', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374308),
(368, 0, 'report_stats', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374308),
(369, 0, 'report_stats', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374309),
(370, 0, 'report_stats', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374312),
(371, 0, 'gradeexport_ods', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374313),
(372, 0, 'gradeexport_ods', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374313),
(373, 0, 'gradeexport_ods', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374317),
(374, 0, 'gradeexport_txt', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374317),
(375, 0, 'gradeexport_txt', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374318),
(376, 0, 'gradeexport_txt', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374321),
(377, 0, 'gradeexport_xls', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374321),
(378, 0, 'gradeexport_xls', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374322),
(379, 0, 'gradeexport_xls', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374325),
(380, 0, 'gradeexport_xml', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374325),
(381, 0, 'gradeexport_xml', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374326),
(382, 0, 'gradeexport_xml', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374329),
(383, 0, 'gradeimport_csv', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374330),
(384, 0, 'gradeimport_csv', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374330),
(385, 0, 'gradeimport_csv', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374333),
(386, 0, 'gradeimport_xml', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374333),
(387, 0, 'gradeimport_xml', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374334),
(388, 0, 'gradeimport_xml', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374337),
(389, 0, 'gradereport_grader', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374338),
(390, 0, 'gradereport_grader', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374338),
(391, 0, 'gradereport_grader', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374340),
(392, 0, 'gradereport_outcomes', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374341),
(393, 0, 'gradereport_outcomes', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374341),
(394, 0, 'gradereport_outcomes', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374344),
(395, 0, 'gradereport_overview', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374345),
(396, 0, 'gradereport_overview', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374345),
(397, 0, 'gradereport_overview', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374348),
(398, 0, 'gradereport_user', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374348),
(399, 0, 'gradereport_user', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374349),
(400, 0, 'gradereport_user', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374352),
(401, 0, 'gradingform_guide', NULL, '2013051401.05', 'Starting plugin installation', NULL, '', 0, 1438374352),
(402, 0, 'gradingform_guide', '2013051401.05', '2013051401.05', 'Upgrade savepoint reached', NULL, '', 0, 1438374353),
(403, 0, 'gradingform_guide', '2013051401.05', '2013051401.05', 'Plugin installed', NULL, '', 0, 1438374356),
(404, 0, 'gradingform_rubric', NULL, '2013051401.05', 'Starting plugin installation', NULL, '', 0, 1438374357),
(405, 0, 'gradingform_rubric', '2013051401.05', '2013051401.05', 'Upgrade savepoint reached', NULL, '', 0, 1438374358),
(406, 0, 'gradingform_rubric', '2013051401.05', '2013051401.05', 'Plugin installed', NULL, '', 0, 1438374361),
(407, 0, 'mnetservice_enrol', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374361),
(408, 0, 'mnetservice_enrol', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374362),
(409, 0, 'mnetservice_enrol', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374365),
(410, 0, 'webservice_amf', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374366),
(411, 0, 'webservice_amf', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374367),
(412, 0, 'webservice_amf', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374370),
(413, 0, 'webservice_rest', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374370),
(414, 0, 'webservice_rest', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374371),
(415, 0, 'webservice_rest', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374374),
(416, 0, 'webservice_soap', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374374),
(417, 0, 'webservice_soap', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374375),
(418, 0, 'webservice_soap', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374378),
(419, 0, 'webservice_xmlrpc', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374379),
(420, 0, 'webservice_xmlrpc', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374379),
(421, 0, 'webservice_xmlrpc', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374382),
(422, 0, 'repository_alfresco', NULL, '2014022500', 'Starting plugin installation', NULL, '', 0, 1438374383),
(423, 0, 'repository_alfresco', '2014022500', '2014022500', 'Upgrade savepoint reached', NULL, '', 0, 1438374383),
(424, 0, 'repository_alfresco', '2014022500', '2014022500', 'Plugin installed', NULL, '', 0, 1438374387),
(425, 0, 'repository_boxnet', NULL, '2013050103', 'Starting plugin installation', NULL, '', 0, 1438374387),
(426, 0, 'repository_boxnet', '2013050103', '2013050103', 'Upgrade savepoint reached', NULL, '', 0, 1438374388),
(427, 0, 'repository_boxnet', '2013050103', '2013050103', 'Plugin installed', NULL, '', 0, 1438374391),
(428, 0, 'repository_coursefiles', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374391),
(429, 0, 'repository_coursefiles', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374392),
(430, 0, 'repository_coursefiles', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374395),
(431, 0, 'repository_dropbox', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374395),
(432, 0, 'repository_dropbox', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374396),
(433, 0, 'repository_dropbox', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374399),
(434, 0, 'repository_equella', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374400),
(435, 0, 'repository_equella', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374400),
(436, 0, 'repository_equella', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374403),
(437, 0, 'repository_filesystem', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374404),
(438, 0, 'repository_filesystem', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374404),
(439, 0, 'repository_filesystem', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374408),
(440, 0, 'repository_flickr', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374408),
(441, 0, 'repository_flickr', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374409),
(442, 0, 'repository_flickr', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374412),
(443, 0, 'repository_flickr_public', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374412),
(444, 0, 'repository_flickr_public', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374413),
(445, 0, 'repository_flickr_public', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374416),
(446, 0, 'repository_googledocs', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374417),
(447, 0, 'repository_googledocs', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374417),
(448, 0, 'repository_googledocs', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374420),
(449, 0, 'repository_local', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374421),
(450, 0, 'repository_local', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374421),
(451, 0, 'repository_local', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374425),
(452, 0, 'repository_merlot', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374426),
(453, 0, 'repository_merlot', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374427),
(454, 0, 'repository_merlot', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374430),
(455, 0, 'repository_picasa', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374430),
(456, 0, 'repository_picasa', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374431),
(457, 0, 'repository_picasa', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374434),
(458, 0, 'repository_recent', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374434),
(459, 0, 'repository_recent', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374435),
(460, 0, 'repository_recent', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374439),
(461, 0, 'repository_s3', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374439),
(462, 0, 'repository_s3', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374440),
(463, 0, 'repository_s3', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374443),
(464, 0, 'repository_upload', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374443),
(465, 0, 'repository_upload', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374444),
(466, 0, 'repository_upload', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374448),
(467, 0, 'repository_url', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374448),
(468, 0, 'repository_url', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374449),
(469, 0, 'repository_url', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374452),
(470, 0, 'repository_user', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374452),
(471, 0, 'repository_user', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374453),
(472, 0, 'repository_user', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374456),
(473, 0, 'repository_webdav', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374457),
(474, 0, 'repository_webdav', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374457),
(475, 0, 'repository_webdav', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374460),
(476, 0, 'repository_wikimedia', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374461),
(477, 0, 'repository_wikimedia', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374462),
(478, 0, 'repository_wikimedia', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374466),
(479, 0, 'repository_youtube', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374466),
(480, 0, 'repository_youtube', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374467),
(481, 0, 'repository_youtube', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374471),
(482, 0, 'portfolio_boxnet', NULL, '2013050102', 'Starting plugin installation', NULL, '', 0, 1438374471);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(483, 0, 'portfolio_boxnet', '2013050102', '2013050102', 'Upgrade savepoint reached', NULL, '', 0, 1438374472),
(484, 0, 'portfolio_boxnet', '2013050102', '2013050102', 'Plugin installed', NULL, '', 0, 1438374475),
(485, 0, 'portfolio_download', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374476),
(486, 0, 'portfolio_download', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374476),
(487, 0, 'portfolio_download', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374480),
(488, 0, 'portfolio_flickr', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374480),
(489, 0, 'portfolio_flickr', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374481),
(490, 0, 'portfolio_flickr', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374484),
(491, 0, 'portfolio_googledocs', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374485),
(492, 0, 'portfolio_googledocs', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374485),
(493, 0, 'portfolio_googledocs', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374488),
(494, 0, 'portfolio_mahara', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374489),
(495, 0, 'portfolio_mahara', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374489),
(496, 0, 'portfolio_mahara', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374493),
(497, 0, 'portfolio_picasa', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374493),
(498, 0, 'portfolio_picasa', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374494),
(499, 0, 'portfolio_picasa', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374497),
(500, 0, 'qbehaviour_adaptive', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374498),
(501, 0, 'qbehaviour_adaptive', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374498),
(502, 0, 'qbehaviour_adaptive', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374501),
(503, 0, 'qbehaviour_adaptivenopenalty', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374501),
(504, 0, 'qbehaviour_adaptivenopenalty', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374502),
(505, 0, 'qbehaviour_adaptivenopenalty', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374504),
(506, 0, 'qbehaviour_deferredcbm', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374505),
(507, 0, 'qbehaviour_deferredcbm', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374505),
(508, 0, 'qbehaviour_deferredcbm', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374508),
(509, 0, 'qbehaviour_deferredfeedback', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374509),
(510, 0, 'qbehaviour_deferredfeedback', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374509),
(511, 0, 'qbehaviour_deferredfeedback', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374512),
(512, 0, 'qbehaviour_immediatecbm', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374513),
(513, 0, 'qbehaviour_immediatecbm', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374513),
(514, 0, 'qbehaviour_immediatecbm', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374516),
(515, 0, 'qbehaviour_immediatefeedback', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374517),
(516, 0, 'qbehaviour_immediatefeedback', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374517),
(517, 0, 'qbehaviour_immediatefeedback', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374521),
(518, 0, 'qbehaviour_informationitem', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374521),
(519, 0, 'qbehaviour_informationitem', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374522),
(520, 0, 'qbehaviour_informationitem', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374525),
(521, 0, 'qbehaviour_interactive', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374526),
(522, 0, 'qbehaviour_interactive', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374526),
(523, 0, 'qbehaviour_interactive', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374529),
(524, 0, 'qbehaviour_interactivecountback', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374529),
(525, 0, 'qbehaviour_interactivecountback', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374530),
(526, 0, 'qbehaviour_interactivecountback', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374533),
(527, 0, 'qbehaviour_manualgraded', NULL, '2013050800', 'Starting plugin installation', NULL, '', 0, 1438374533),
(528, 0, 'qbehaviour_manualgraded', '2013050800', '2013050800', 'Upgrade savepoint reached', NULL, '', 0, 1438374534),
(529, 0, 'qbehaviour_manualgraded', '2013050800', '2013050800', 'Plugin installed', NULL, '', 0, 1438374537),
(530, 0, 'qbehaviour_missing', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374538),
(531, 0, 'qbehaviour_missing', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374538),
(532, 0, 'qbehaviour_missing', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374541),
(533, 0, 'qformat_aiken', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374542),
(534, 0, 'qformat_aiken', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374542),
(535, 0, 'qformat_aiken', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374545),
(536, 0, 'qformat_blackboard_six', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374546),
(537, 0, 'qformat_blackboard_six', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374546),
(538, 0, 'qformat_blackboard_six', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374549),
(539, 0, 'qformat_examview', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374550),
(540, 0, 'qformat_examview', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374551),
(541, 0, 'qformat_examview', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374554),
(542, 0, 'qformat_gift', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374554),
(543, 0, 'qformat_gift', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374555),
(544, 0, 'qformat_gift', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374558),
(545, 0, 'qformat_learnwise', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374559),
(546, 0, 'qformat_learnwise', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374560),
(547, 0, 'qformat_learnwise', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374563),
(548, 0, 'qformat_missingword', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374564),
(549, 0, 'qformat_missingword', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374564),
(550, 0, 'qformat_missingword', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374568),
(551, 0, 'qformat_multianswer', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374569),
(552, 0, 'qformat_multianswer', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374569),
(553, 0, 'qformat_multianswer', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374572),
(554, 0, 'qformat_webct', NULL, '2013050101', 'Starting plugin installation', NULL, '', 0, 1438374573),
(555, 0, 'qformat_webct', '2013050101', '2013050101', 'Upgrade savepoint reached', NULL, '', 0, 1438374574),
(556, 0, 'qformat_webct', '2013050101', '2013050101', 'Plugin installed', NULL, '', 0, 1438374577),
(557, 0, 'qformat_xhtml', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374578),
(558, 0, 'qformat_xhtml', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374579),
(559, 0, 'qformat_xhtml', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374582),
(560, 0, 'qformat_xml', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374583),
(561, 0, 'qformat_xml', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374583),
(562, 0, 'qformat_xml', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374588),
(563, 0, 'tool_assignmentupgrade', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374590),
(564, 0, 'tool_assignmentupgrade', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374591),
(565, 0, 'tool_assignmentupgrade', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374594),
(566, 0, 'tool_behat', NULL, '2013050102', 'Starting plugin installation', NULL, '', 0, 1438374594),
(567, 0, 'tool_behat', '2013050102', '2013050102', 'Upgrade savepoint reached', NULL, '', 0, 1438374595),
(568, 0, 'tool_behat', '2013050102', '2013050102', 'Plugin installed', NULL, '', 0, 1438374599),
(569, 0, 'tool_capability', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374599),
(570, 0, 'tool_capability', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374600),
(571, 0, 'tool_capability', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374603),
(572, 0, 'tool_customlang', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374604),
(573, 0, 'tool_customlang', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374605),
(574, 0, 'tool_customlang', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374609),
(575, 0, 'tool_dbtransfer', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374609),
(576, 0, 'tool_dbtransfer', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374610),
(577, 0, 'tool_dbtransfer', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374614),
(578, 0, 'tool_generator', NULL, '2013051402.04', 'Starting plugin installation', NULL, '', 0, 1438374614),
(579, 0, 'tool_generator', '2013051402.04', '2013051402.04', 'Upgrade savepoint reached', NULL, '', 0, 1438374615),
(580, 0, 'tool_generator', '2013051402.04', '2013051402.04', 'Plugin installed', NULL, '', 0, 1438374618),
(581, 0, 'tool_health', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374619),
(582, 0, 'tool_health', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374620),
(583, 0, 'tool_health', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374623),
(584, 0, 'tool_innodb', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374624),
(585, 0, 'tool_innodb', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374625),
(586, 0, 'tool_innodb', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374629),
(587, 0, 'tool_installaddon', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374630),
(588, 0, 'tool_installaddon', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374630),
(589, 0, 'tool_installaddon', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374634),
(590, 0, 'tool_langimport', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374635),
(591, 0, 'tool_langimport', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374635),
(592, 0, 'tool_langimport', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374639),
(593, 0, 'tool_multilangupgrade', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374639),
(594, 0, 'tool_multilangupgrade', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374640),
(595, 0, 'tool_multilangupgrade', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374644),
(596, 0, 'tool_phpunit', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374644),
(597, 0, 'tool_phpunit', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374645),
(598, 0, 'tool_phpunit', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374648),
(599, 0, 'tool_profiling', NULL, '2013050200', 'Starting plugin installation', NULL, '', 0, 1438374649),
(600, 0, 'tool_profiling', '2013050200', '2013050200', 'Upgrade savepoint reached', NULL, '', 0, 1438374650),
(601, 0, 'tool_profiling', '2013050200', '2013050200', 'Plugin installed', NULL, '', 0, 1438374652),
(602, 0, 'tool_qeupgradehelper', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374653),
(603, 0, 'tool_qeupgradehelper', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374654),
(604, 0, 'tool_qeupgradehelper', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374657),
(605, 0, 'tool_replace', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374658),
(606, 0, 'tool_replace', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374658),
(607, 0, 'tool_replace', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374661),
(608, 0, 'tool_spamcleaner', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374662),
(609, 0, 'tool_spamcleaner', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374663),
(610, 0, 'tool_spamcleaner', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374666),
(611, 0, 'tool_timezoneimport', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374667),
(612, 0, 'tool_timezoneimport', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374668),
(613, 0, 'tool_timezoneimport', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374671),
(614, 0, 'tool_unsuproles', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374672),
(615, 0, 'tool_unsuproles', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374672),
(616, 0, 'tool_unsuproles', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374675),
(617, 0, 'tool_uploaduser', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374676),
(618, 0, 'tool_uploaduser', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374677),
(619, 0, 'tool_uploaduser', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374682),
(620, 0, 'tool_xmldb', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374683),
(621, 0, 'tool_xmldb', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374684),
(622, 0, 'tool_xmldb', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374687),
(623, 0, 'cachestore_file', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374688),
(624, 0, 'cachestore_file', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374689),
(625, 0, 'cachestore_file', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374693),
(626, 0, 'cachestore_memcache', NULL, '2013050700', 'Starting plugin installation', NULL, '', 0, 1438374693),
(627, 0, 'cachestore_memcache', '2013050700', '2013050700', 'Upgrade savepoint reached', NULL, '', 0, 1438374694),
(628, 0, 'cachestore_memcache', '2013050700', '2013050700', 'Plugin installed', NULL, '', 0, 1438374698),
(629, 0, 'cachestore_memcached', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374698),
(630, 0, 'cachestore_memcached', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374699),
(631, 0, 'cachestore_memcached', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374703),
(632, 0, 'cachestore_mongodb', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374703),
(633, 0, 'cachestore_mongodb', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374704),
(634, 0, 'cachestore_mongodb', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374708),
(635, 0, 'cachestore_session', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374709),
(636, 0, 'cachestore_session', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374709),
(637, 0, 'cachestore_session', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374713),
(638, 0, 'cachestore_static', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374714),
(639, 0, 'cachestore_static', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374715),
(640, 0, 'cachestore_static', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374718),
(641, 0, 'theme_afterburner', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374719),
(642, 0, 'theme_afterburner', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374720),
(643, 0, 'theme_afterburner', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374724),
(644, 0, 'theme_anomaly', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374724),
(645, 0, 'theme_anomaly', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374725),
(646, 0, 'theme_anomaly', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374728),
(647, 0, 'theme_arialist', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374729),
(648, 0, 'theme_arialist', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374730),
(649, 0, 'theme_arialist', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374733),
(650, 0, 'theme_base', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374734),
(651, 0, 'theme_base', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374734),
(652, 0, 'theme_base', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374738),
(653, 0, 'theme_binarius', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374738),
(654, 0, 'theme_binarius', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374739),
(655, 0, 'theme_binarius', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374742),
(656, 0, 'theme_bootstrapbase', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374743),
(657, 0, 'theme_bootstrapbase', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374744),
(658, 0, 'theme_bootstrapbase', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374748),
(659, 0, 'theme_boxxie', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374748),
(660, 0, 'theme_boxxie', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374749),
(661, 0, 'theme_boxxie', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374752),
(662, 0, 'theme_brick', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374752),
(663, 0, 'theme_brick', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374753),
(664, 0, 'theme_brick', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374756),
(665, 0, 'theme_canvas', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374757),
(666, 0, 'theme_canvas', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374757),
(667, 0, 'theme_canvas', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374760),
(668, 0, 'theme_clean', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374761),
(669, 0, 'theme_clean', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374761),
(670, 0, 'theme_clean', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374763),
(671, 0, 'theme_formal_white', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374764),
(672, 0, 'theme_formal_white', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374764),
(673, 0, 'theme_formal_white', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374768),
(674, 0, 'theme_formfactor', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374769),
(675, 0, 'theme_formfactor', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374769),
(676, 0, 'theme_formfactor', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374773),
(677, 0, 'theme_fusion', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374774),
(678, 0, 'theme_fusion', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374774),
(679, 0, 'theme_fusion', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374778),
(680, 0, 'theme_leatherbound', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374779),
(681, 0, 'theme_leatherbound', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374780),
(682, 0, 'theme_leatherbound', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374783),
(683, 0, 'theme_magazine', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374784),
(684, 0, 'theme_magazine', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374785),
(685, 0, 'theme_magazine', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374789),
(686, 0, 'theme_mymobile', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374789),
(687, 0, 'theme_mymobile', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374790),
(688, 0, 'theme_mymobile', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374794),
(689, 0, 'theme_nimble', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374795),
(690, 0, 'theme_nimble', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374795),
(691, 0, 'theme_nimble', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374801),
(692, 0, 'theme_nonzero', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374802),
(693, 0, 'theme_nonzero', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374803),
(694, 0, 'theme_nonzero', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374807),
(695, 0, 'theme_overlay', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374807),
(696, 0, 'theme_overlay', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374808),
(697, 0, 'theme_overlay', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374812),
(698, 0, 'theme_serenity', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374813),
(699, 0, 'theme_serenity', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374814),
(700, 0, 'theme_serenity', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374817),
(701, 0, 'theme_sky_high', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374818),
(702, 0, 'theme_sky_high', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374819),
(703, 0, 'theme_sky_high', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374823),
(704, 0, 'theme_splash', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374825),
(705, 0, 'theme_splash', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374830),
(706, 0, 'theme_splash', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374834),
(707, 0, 'theme_standard', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374835),
(708, 0, 'theme_standard', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374836),
(709, 0, 'theme_standard', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374839),
(710, 0, 'theme_standardold', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374840),
(711, 0, 'theme_standardold', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374841),
(712, 0, 'theme_standardold', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374845),
(713, 0, 'assignsubmission_comments', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374846),
(714, 0, 'assignsubmission_comments', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374847),
(715, 0, 'assignsubmission_comments', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374851),
(716, 0, 'assignsubmission_file', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374852),
(717, 0, 'assignsubmission_file', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374853),
(718, 0, 'assignsubmission_file', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374857),
(719, 0, 'assignsubmission_onlinetext', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374858),
(720, 0, 'assignsubmission_onlinetext', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374859),
(721, 0, 'assignsubmission_onlinetext', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374863),
(722, 0, 'assignfeedback_comments', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374864),
(723, 0, 'assignfeedback_comments', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374866),
(724, 0, 'assignfeedback_comments', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374870),
(725, 0, 'assignfeedback_file', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374871),
(726, 0, 'assignfeedback_file', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374872),
(727, 0, 'assignfeedback_file', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374877),
(728, 0, 'assignfeedback_offline', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374877),
(729, 0, 'assignfeedback_offline', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374878),
(730, 0, 'assignfeedback_offline', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374882),
(731, 0, 'assignment_offline', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374883),
(732, 0, 'assignment_offline', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374884),
(733, 0, 'assignment_offline', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374888),
(734, 0, 'assignment_online', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374889),
(735, 0, 'assignment_online', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374889),
(736, 0, 'assignment_online', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374893),
(737, 0, 'assignment_upload', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374894),
(738, 0, 'assignment_upload', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374895),
(739, 0, 'assignment_upload', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374898),
(740, 0, 'assignment_uploadsingle', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374899),
(741, 0, 'assignment_uploadsingle', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374900),
(742, 0, 'assignment_uploadsingle', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374904),
(743, 0, 'booktool_exportimscp', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374905),
(744, 0, 'booktool_exportimscp', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374906),
(745, 0, 'booktool_exportimscp', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374910),
(746, 0, 'booktool_importhtml', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374911),
(747, 0, 'booktool_importhtml', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374911),
(748, 0, 'booktool_importhtml', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374915),
(749, 0, 'booktool_print', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374916),
(750, 0, 'booktool_print', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374917),
(751, 0, 'booktool_print', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374921),
(752, 0, 'datafield_checkbox', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374922),
(753, 0, 'datafield_checkbox', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374923),
(754, 0, 'datafield_checkbox', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374927),
(755, 0, 'datafield_date', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374928),
(756, 0, 'datafield_date', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374928),
(757, 0, 'datafield_date', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374932),
(758, 0, 'datafield_file', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374933),
(759, 0, 'datafield_file', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374934),
(760, 0, 'datafield_file', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374938),
(761, 0, 'datafield_latlong', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374939),
(762, 0, 'datafield_latlong', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374939),
(763, 0, 'datafield_latlong', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374943),
(764, 0, 'datafield_menu', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374944),
(765, 0, 'datafield_menu', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374945),
(766, 0, 'datafield_menu', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374948),
(767, 0, 'datafield_multimenu', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374949),
(768, 0, 'datafield_multimenu', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374950),
(769, 0, 'datafield_multimenu', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374954),
(770, 0, 'datafield_number', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374955),
(771, 0, 'datafield_number', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374956),
(772, 0, 'datafield_number', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374960),
(773, 0, 'datafield_picture', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374960),
(774, 0, 'datafield_picture', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374961),
(775, 0, 'datafield_picture', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374965),
(776, 0, 'datafield_radiobutton', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374966),
(777, 0, 'datafield_radiobutton', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374967),
(778, 0, 'datafield_radiobutton', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374969),
(779, 0, 'datafield_text', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374970),
(780, 0, 'datafield_text', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374971),
(781, 0, 'datafield_text', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374975),
(782, 0, 'datafield_textarea', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374976),
(783, 0, 'datafield_textarea', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374976),
(784, 0, 'datafield_textarea', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374979),
(785, 0, 'datafield_url', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374980),
(786, 0, 'datafield_url', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374981),
(787, 0, 'datafield_url', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374984),
(788, 0, 'datapreset_imagegallery', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374985),
(789, 0, 'datapreset_imagegallery', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374986),
(790, 0, 'datapreset_imagegallery', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374990),
(791, 0, 'quiz_grading', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438374991),
(792, 0, 'quiz_grading', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438374992),
(793, 0, 'quiz_grading', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438374999),
(794, 0, 'quiz_overview', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375000),
(795, 0, 'quiz_overview', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375001),
(796, 0, 'quiz_overview', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375005),
(797, 0, 'quiz_responses', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375006),
(798, 0, 'quiz_responses', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375006),
(799, 0, 'quiz_responses', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375011),
(800, 0, 'quiz_statistics', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375014),
(801, 0, 'quiz_statistics', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375014),
(802, 0, 'quiz_statistics', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375021),
(803, 0, 'quizaccess_delaybetweenattempts', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375022),
(804, 0, 'quizaccess_delaybetweenattempts', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375023),
(805, 0, 'quizaccess_delaybetweenattempts', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375027),
(806, 0, 'quizaccess_ipaddress', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375028),
(807, 0, 'quizaccess_ipaddress', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375029),
(808, 0, 'quizaccess_ipaddress', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375033),
(809, 0, 'quizaccess_numattempts', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375034),
(810, 0, 'quizaccess_numattempts', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375035),
(811, 0, 'quizaccess_numattempts', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375039),
(812, 0, 'quizaccess_openclosedate', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375039),
(813, 0, 'quizaccess_openclosedate', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375040),
(814, 0, 'quizaccess_openclosedate', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375044),
(815, 0, 'quizaccess_password', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375044),
(816, 0, 'quizaccess_password', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375045),
(817, 0, 'quizaccess_password', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375048),
(818, 0, 'quizaccess_safebrowser', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375048),
(819, 0, 'quizaccess_safebrowser', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375049),
(820, 0, 'quizaccess_safebrowser', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375053),
(821, 0, 'quizaccess_securewindow', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375053),
(822, 0, 'quizaccess_securewindow', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375054),
(823, 0, 'quizaccess_securewindow', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375058),
(824, 0, 'quizaccess_timelimit', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375058),
(825, 0, 'quizaccess_timelimit', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375059),
(826, 0, 'quizaccess_timelimit', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375063),
(827, 0, 'scormreport_basic', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375064),
(828, 0, 'scormreport_basic', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375065),
(829, 0, 'scormreport_basic', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375068),
(830, 0, 'scormreport_graphs', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375069),
(831, 0, 'scormreport_graphs', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375070),
(832, 0, 'scormreport_graphs', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375074),
(833, 0, 'scormreport_interactions', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375075),
(834, 0, 'scormreport_interactions', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375076),
(835, 0, 'scormreport_interactions', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375080),
(836, 0, 'workshopform_accumulative', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375081),
(837, 0, 'workshopform_accumulative', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375082),
(838, 0, 'workshopform_accumulative', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375086),
(839, 0, 'workshopform_comments', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375087),
(840, 0, 'workshopform_comments', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375088),
(841, 0, 'workshopform_comments', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375092),
(842, 0, 'workshopform_numerrors', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375093),
(843, 0, 'workshopform_numerrors', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375095),
(844, 0, 'workshopform_numerrors', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375099),
(845, 0, 'workshopform_rubric', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375100),
(846, 0, 'workshopform_rubric', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375101),
(847, 0, 'workshopform_rubric', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375106),
(848, 0, 'workshopallocation_manual', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375107),
(849, 0, 'workshopallocation_manual', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375108),
(850, 0, 'workshopallocation_manual', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375112),
(851, 0, 'workshopallocation_random', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375113),
(852, 0, 'workshopallocation_random', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375113),
(853, 0, 'workshopallocation_random', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375117),
(854, 0, 'workshopallocation_scheduled', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375118),
(855, 0, 'workshopallocation_scheduled', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375119),
(856, 0, 'workshopallocation_scheduled', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375124),
(857, 0, 'workshopeval_best', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375125),
(858, 0, 'workshopeval_best', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375126),
(859, 0, 'workshopeval_best', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375129),
(860, 0, 'tinymce_ctrlhelp', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375131),
(861, 0, 'tinymce_ctrlhelp', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375131),
(862, 0, 'tinymce_ctrlhelp', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375135),
(863, 0, 'tinymce_dragmath', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375136),
(864, 0, 'tinymce_dragmath', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375137),
(865, 0, 'tinymce_dragmath', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375140),
(866, 0, 'tinymce_moodleemoticon', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375141),
(867, 0, 'tinymce_moodleemoticon', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375142),
(868, 0, 'tinymce_moodleemoticon', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375147),
(869, 0, 'tinymce_moodleimage', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375149),
(870, 0, 'tinymce_moodleimage', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375150),
(871, 0, 'tinymce_moodleimage', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375153),
(872, 0, 'tinymce_moodlemedia', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375154),
(873, 0, 'tinymce_moodlemedia', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375155),
(874, 0, 'tinymce_moodlemedia', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375158),
(875, 0, 'tinymce_moodlenolink', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375159),
(876, 0, 'tinymce_moodlenolink', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375160),
(877, 0, 'tinymce_moodlenolink', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375164),
(878, 0, 'tinymce_spellchecker', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1438375165),
(879, 0, 'tinymce_spellchecker', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1438375166),
(880, 0, 'tinymce_spellchecker', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1438375170);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_url`
--

CREATE TABLE IF NOT EXISTS `mdl_url` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `parameters` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one url resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user`
--

CREATE TABLE IF NOT EXISTS `mdl_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(100) NOT NULL DEFAULT '',
  `lastname` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) NOT NULL DEFAULT '',
  `skype` varchar(50) NOT NULL DEFAULT '',
  `yahoo` varchar(50) NOT NULL DEFAULT '',
  `aim` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `phone1` varchar(20) NOT NULL DEFAULT '',
  `phone2` varchar(20) NOT NULL DEFAULT '',
  `institution` varchar(40) NOT NULL DEFAULT '',
  `department` varchar(30) NOT NULL DEFAULT '',
  `address` varchar(70) NOT NULL DEFAULT '',
  `city` varchar(120) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `lang` varchar(30) NOT NULL DEFAULT 'en',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timezone` varchar(100) NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) NOT NULL DEFAULT '',
  `secret` varchar(15) NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `htmleditor` tinyint(1) NOT NULL DEFAULT '1',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='One record for each person' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_user`
--

INSERT INTO `mdl_user` (`id`, `auth`, `confirmed`, `policyagreed`, `deleted`, `suspended`, `mnethostid`, `username`, `password`, `idnumber`, `firstname`, `lastname`, `email`, `emailstop`, `icq`, `skype`, `yahoo`, `aim`, `msn`, `phone1`, `phone2`, `institution`, `department`, `address`, `city`, `country`, `lang`, `theme`, `timezone`, `firstaccess`, `lastaccess`, `lastlogin`, `currentlogin`, `lastip`, `secret`, `picture`, `url`, `description`, `descriptionformat`, `mailformat`, `maildigest`, `maildisplay`, `htmleditor`, `autosubscribe`, `trackforums`, `timecreated`, `timemodified`, `trustbitmask`, `imagealt`) VALUES
(1, 'manual', 1, 0, 0, 0, 1, 'guest', '$2y$10$QGqe7zuQcJNYNHHhE2BhsezEaZ6qqkk7faLnk7yaXuyArj9rRkdOC', '', 'Guest user', ' ', 'root@localhost', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', 'This user is a special user that allows read-only access to some courses.', 1, 1, 0, 2, 1, 1, 0, 0, 1438373711, 0, NULL),
(2, 'manual', 1, 0, 0, 0, 1, 'admin', '$2y$10$nAGL5KP15.dFFSh6z2FMkObmpXzZjUuIpfypaJoEi3jV91bvnZN7C', '', 'Admin', 'User', 'abhinay212@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'bangalore', 'IN', 'en', '', '5.5', 1438375209, 1438375853, 0, 1438375209, '127.0.0.1', '', 0, '', '', 1, 1, 0, 1, 1, 1, 0, 0, 1438375361, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users participating in courses (aka enrolled users) - everyb' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_category`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable fields categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_data`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_userinfodata_usefie_ix` (`userid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data for the customisable user fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_field`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_field` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) NOT NULL DEFAULT 'shortname',
  `name` longtext NOT NULL,
  `datatype` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable user profile fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_lastaccess`
--

CREATE TABLE IF NOT EXISTS `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='To keep track of course page access times, used in online pa' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_user_lastaccess`
--

INSERT INTO `mdl_user_lastaccess` (`id`, `userid`, `courseid`, `timeaccess`) VALUES
(1, 2, 2, 1438375564);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_preferences`
--

CREATE TABLE IF NOT EXISTS `mdl_user_preferences` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(1333) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Allows modules to store arbitrary user preferences' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_user_preferences`
--

INSERT INTO `mdl_user_preferences` (`id`, `userid`, `name`, `value`) VALUES
(1, 2, 'email_bounce_count', '1'),
(2, 2, 'email_send_count', '1'),
(3, 2, 'filepicker_recentrepository', '4');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_private_key`
--

CREATE TABLE IF NOT EXISTS `mdl_user_private_key` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `script` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='access keys used in cookieless scripts - rss, etc.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_webdav_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_webdav_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `expiry` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `recursive` tinyint(1) NOT NULL DEFAULT '0',
  `exclusivelock` tinyint(1) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `owner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_webdlock_tok_uix` (`token`),
  KEY `mdl_webdlock_pat_ix` (`path`),
  KEY `mdl_webdlock_exp_ix` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resource locks for WebDAV users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT 'Wiki',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Wiki activity configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_links`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_links` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Page wiki links' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Manages page locks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT 'title',
  `cachedcontent` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_subwikis`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores subwiki instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_synonyms`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages synonyms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_versions`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  `contentformat` varchar(20) NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki page history' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `evaluation` varchar(30) NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint(3) DEFAULT '1',
  `overallfeedbackfiles` smallint(3) DEFAULT '0',
  `overallfeedbackmaxbytes` bigint(10) DEFAULT '100000',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about the module instances and ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopallocation_scheduled`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) DEFAULT NULL,
  `resultlog` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the allocation settings for the scheduled allocator' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Settings for the grading evaluation subplugin Comparison wit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_accumulative`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Accumulative gradin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Comments strategy f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) DEFAULT NULL,
  `grade1` varchar(50) DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Number of errors gr' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This maps the number of errors to a percentual grade for sub' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Rubric grading stra' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Configuration table for the Rubric grading strategy' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The definition of rubric rating scales' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_aggregations`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Aggregated grades for assessment are stored here. The aggreg' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackauthorattachment` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext,
  `feedbackreviewerformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the made assessment and automatically calculated ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext,
  `teachercomment` longtext,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_assessments table to be dropped later in Moo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_comments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_comments table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_elements_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_elements table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='How the reviewers filled-up the grading forms, given grades ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop table to be dropped later in Moodle 2.x' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_rubrics_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_stockcomments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_stockcomments table to be dropped later in M' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the submission and the aggregation of the grade f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_submissions table to be dropped later in Moo' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
