/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.5.47-0ubuntu0.14.04.1 : Database - cis
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `admin_user` */

DROP TABLE IF EXISTS `admin_user`;

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` enum('journalist','editor','admin') NOT NULL DEFAULT 'journalist',
  `login` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin_user` */

LOCK TABLES `admin_user` WRITE;

insert  into `admin_user`(`id`,`role`,`login`,`email`,`name`,`password`,`active`) values (1,'admin','admin','web@wezoom.net','Admin Name','$2y$10$SrxkWyEx/QIAya7qsZJut.3oHy9LaNIm/qKuk9IRR3Y17TxqHuLT2',1);

UNLOCK TABLES;

/*Table structure for table `cms_configuration` */

DROP TABLE IF EXISTS `cms_configuration`;

CREATE TABLE `cms_configuration` (
  `key` varchar(50) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cms_configuration` */

LOCK TABLES `cms_configuration` WRITE;

insert  into `cms_configuration`(`key`,`value`) values ('ADMIN_EMAIL','webmaster@localhost'),('DEBUG_MODE','1'),('DISPLAY_CHANGELOG','1'),('PROFILER','1'),('TECHNICAL_WORKS','0'),('WIDGETS_CACHE','1');

UNLOCK TABLES;

/*Table structure for table `cms_javascript` */

DROP TABLE IF EXISTS `cms_javascript`;

CREATE TABLE `cms_javascript` (
  `id` varchar(20) NOT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cms_javascript` */

LOCK TABLES `cms_javascript` WRITE;

insert  into `cms_javascript`(`id`,`text`) values ('body','<!-- custom javascript code or any html -->'),('head','<!-- custom javascript code or any html -->');

UNLOCK TABLES;

/*Table structure for table `language` */

DROP TABLE IF EXISTS `language`;

CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(10) NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  `url` varchar(20) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `primary` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iso` (`iso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `language` */

LOCK TABLES `language` WRITE;

insert  into `language`(`id`,`iso`,`locale`,`name`,`short_name`,`url`,`sortorder`,`primary`) values (2,'en','en_EN','English','Eng','en',1,'1'),(4,'vi','vi_VI','Vietnamese','vi','vi',2,'0');

UNLOCK TABLES;

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root` enum('top') NOT NULL DEFAULT 'top',
  `parent_id` int(11) DEFAULT NULL,
  `work_title` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  `left_key` int(11) DEFAULT NULL,
  `right_key` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`work_title`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

LOCK TABLES `menu` WRITE;

UNLOCK TABLES;

/*Table structure for table `menu_translate` */

DROP TABLE IF EXISTS `menu_translate`;

CREATE TABLE `menu_translate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `foreign_id` (`foreign_id`),
  CONSTRAINT `menu_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `menu_translate` */

LOCK TABLES `menu_translate` WRITE;

UNLOCK TABLES;

/*Table structure for table `page` */

DROP TABLE IF EXISTS `page`;

CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `page` */

LOCK TABLES `page` WRITE;

insert  into `page`(`id`,`slug`,`created_at`,`updated_at`) values (1,'index','2014-08-03 15:18:47','2016-04-14 08:37:51'),(2,'contacts','2014-08-03 22:25:13','2015-06-18 16:08:00'),(5,'test-page','2016-04-14 08:33:02','2016-04-14 08:33:03');

UNLOCK TABLES;

/*Table structure for table `page_translate` */

DROP TABLE IF EXISTS `page_translate`;

CREATE TABLE `page_translate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `foreign_id` (`foreign_id`),
  KEY `lang` (`lang`),
  CONSTRAINT `page_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `page_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `page_translate` */

LOCK TABLES `page_translate` WRITE;

insert  into `page_translate`(`id`,`foreign_id`,`lang`,`key`,`value`) values (6,1,'en','title','Homepage'),(7,1,'en','meta_title','Homepage'),(8,1,'en','meta_description','meta-description of homepage'),(9,1,'en','meta_keywords',''),(10,1,'en','text','<h1>Yona CMS</h1>\r\n<p>Yona CMS - open source content management system. Written in <a href=\"http://phalconphp.com/\" target=\"_blank\">Phalcon PHP Framework</a>&nbsp;(version 1.3.x).</p>\r\n<p>Has a convenient modular structure. It is intended for the design of simple sites, and major portals and web applications. Thanks to its simple configuration and architecture, can be easily modified for any task.</p>\r\n<p>The official repository on&nbsp;<a href=\"https://github.com/oleksandr-torosh/yona-cms\" target=\"_blank\">Github</a></p>\r\n<h2>Subtitle</h2>\r\n<p>Proin aliquet eros vel magna semper facilisis. Nunc tellus urna, bibendum vitae malesuada vel, molestie non lectus. Suspendisse sit amet ante arcu. Maecenas interdum eu neque eu dapibus. Sed maximus elementum tortor at dapibus. Phasellus rhoncus odio vel suscipit dapibus. Nullam sed luctus mauris. Nunc blandit vitae nisl at malesuada. Sed ac est ut diam hendrerit sodales quis et massa. Proin aliquet vitae massa luctus ultricies. Nullam accumsan leo nibh, non varius tortor elementum auctor. Fusce sollicitudin a dui porttitor euismod. Ut at iaculis neque, nec finibus diam. Integer pharetra vehicula urna vitae imperdiet.</p>\r\n<h3>sub-subtitle</h3>\r\n<p>List:</p>\r\n<ul>\r\n<li>First item</li>\r\n<li>Second item<br />\r\n<ul>\r\n<li>Inner level of second item</li>\r\n<li>Another one</li>\r\n</ul>\r\n</li>\r\n<li>Third item</li>\r\n</ul>\r\n<p>Table</p>\r\n<table class=\"table\" style=\"width: 100%;\">\r\n<tbody>\r\n<tr><th>Header</th><th>Header</th><th>Header</th></tr>\r\n<tr>\r\n<td>Text in cell</td>\r\n<td>Text in cell</td>\r\n<td>Text in cell</td>\r\n</tr>\r\n<tr>\r\n<td>Text in cell</td>\r\n<td>Text in cell</td>\r\n<td>Text in cell</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Decimal list:</p>\r\n<ol>\r\n<li>First</li>\r\n<li>Second</li>\r\n<li>Third</li>\r\n</ol>'),(16,2,'en','title','Contacts'),(17,2,'en','meta_title','Contacts'),(18,2,'en','meta_description',''),(19,2,'en','meta_keywords',''),(20,2,'en','text','<h1>Contacts</h1>\r\n<p><a href=\"http://yonacms.com\">http://yonacms.com</a></p>'),(21,1,'en','cover_photo','img/original/page_cover_photo/0/1.jpg'),(28,5,'en','title','test page'),(29,5,'en','text',''),(30,5,'en','meta_title','test page'),(31,5,'en','cover_photo','img/original/page_cover_photo/0/5.jpg'),(32,5,'en','thumbnail_photo','img/original/page_thumbnail_photo/0/5.jpg'),(33,1,'en','thumbnail_photo','img/original/page_thumbnail_photo/0/1.jpg');

UNLOCK TABLES;

/*Table structure for table `publication` */

DROP TABLE IF EXISTS `publication`;

CREATE TABLE `publication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `preview_inner` enum('1','0') DEFAULT '1',
  `preview_src` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `publication_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `publication` */

LOCK TABLES `publication` WRITE;

insert  into `publication`(`id`,`type_id`,`slug`,`created_at`,`updated_at`,`date`,`preview_inner`,`preview_src`) values (1,1,'phalcon-132-released',NULL,NULL,NULL,'0','img/original/publication/0/1.jpg'),(2,1,'phalcon-community-hangout',NULL,1460629133,0,'1','img/original/publication/0/2.jpg'),(3,2,'builtwith-phalcon',NULL,NULL,NULL,'1','img/original/publication/0/3.jpg'),(4,2,'vtoraya-statya',NULL,NULL,NULL,'0','img/original/publication/0/4.jpg'),(5,1,'new-modular-widgets-system',NULL,1460625701,1460505600,'0','img/original/publication/0/5.jpg'),(6,1,'test-first-post',NULL,1460625967,1460419200,'0',NULL);

UNLOCK TABLES;

/*Table structure for table `publication_translate` */

DROP TABLE IF EXISTS `publication_translate`;

CREATE TABLE `publication_translate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `foreign_id` (`foreign_id`),
  KEY `lang` (`lang`),
  CONSTRAINT `publication_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `publication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `publication_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

/*Data for the table `publication_translate` */

LOCK TABLES `publication_translate` WRITE;

insert  into `publication_translate`(`id`,`foreign_id`,`lang`,`key`,`value`) values (11,1,'en','title','Phalcon 1.3.2 Released'),(12,1,'en','meta_title','Phalcon 1.3.2 Released'),(13,1,'en','meta_description',''),(14,1,'en','meta_keywords',''),(15,1,'en','text','<p>We are today releasing the much awaited 1.3.2 version.&nbsp;</p>\r\n<p>This version has a ton of contributions from our community and fixes to the framework. We thank everyone that has worked on this release, especially with their contributions both to 1.3.2 and our work in progress 2.0.0.</p>\r\n<p>Many thanks to dreamsxin, <a href=\"https://github.com/mruz\">mruz</a>, <a href=\"https://github.com/kjdev\">kjdev</a>, <a href=\"https://github.com/Cinderella-Man\">Cinderella-Man</a>, <a href=\"https://github.com/andreadelfino\">andreadelfino</a>, <a href=\"https://github.com/kfll\">kfll</a>, <a href=\"https://github.com/brandonlamb\">brandonlamb</a>, <a href=\"https://github.com/zacek\">zacek</a>, <a href=\"https://github.com/joni\">joni</a>, <a href=\"https://github.com/wandersonwhcr\">wandersonwhcr</a>, <a href=\"https://github.com/kevinhatry\">kevinhatry</a>, <a href=\"https://github.com/alkana\">alkana</a> and many others that have contributed either on <a href=\"https://github.com/phalcon/cphalcon\">Github or through discussion in our </a><a href=\"http://forum.phalconphp.com/\">forum</a>.</p>\r\n<p>The changelog can be found <a href=\"https://github.com/phalcon/cphalcon/blob/master/CHANGELOG\">here</a>.</p>\r\n<p>We also have a number of pull requests that have not made it to 1.3.2 but will be included to 1.3.3. We need to make sure that the fix or feature that each pull request offers are present both in 1.3.3 but also in 2.0.0</p>\r\n<p>A big thank you once again to our community! You guys are awesome!</p>\r\n<p>&lt;3 Phalcon Team</p>'),(21,2,'en','title','Phalcon Community Hangout '),(22,2,'en','meta_title','Phalcon Community Hangout'),(23,2,'en','meta_description',''),(24,2,'en','meta_keywords',''),(25,2,'en','text','<p>Yesterday (2014-04-05) we had our first Phalcon community hangout. The main purpose of the hangout was to meet the community, discuss about what Phalcon is and what our future steps are, and hear news, concerns, success stories from the community itself.</p>\r\n<p>We are excited to announce that the first Phalcon community hangout was a great success!</p>\r\n<p>We had an awesome turnout from all around the world, with members of the community filling the hangout (10 concurrent users) and more viewing online, asking questions and interacting with the team.</p>\r\n<p>We talked about where we are, where we came from and what the future steps are with Zephir and Phalcon 2.0. Contributions, bugs and NFRs were also topics in our discussion, as well as who are team and how Phalcon is funded.</p>\r\n<p>More hangouts will be scheduled in the near future, hopefully making this a regular event for our community. We will also cater for members of the community that are not English speakers, by creating hangouts for Spanish speaking, Russian etc. The goal is to engage as many members as possible!</p>\r\n<p>The love and trust you all have shown to our framework is what drives us to make it better, push performance, introduce more features and make Phalcon the best PHP framework there is.&nbsp;</p>\r\n<p>For those that missed it, the video is below.</p>'),(41,3,'en','title','BuiltWith Phalcon'),(42,3,'en','meta_title','BuiltWith Phalcon'),(43,3,'en','meta_description',''),(44,3,'en','meta_keywords',''),(45,3,'en','text','<p>Today we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or tutorials.</p>\r\n<p>Introducing <a href=\"http://builtwith.phalconphp.com/\">builtwith.phalconphp.com</a></p>\r\n<p>Taking the example from our friends at <a href=\"http://www.angularjs.org/\">AngularJS</a> we have cloned their <a href=\"https://github.com/angular/builtwith.angularjs.org\">repository</a> and we have Phalcon-ized it. Special thanks to the <a href=\"http://en.wikipedia.org/wiki/AngularJS\">AngularJS</a>team as well as <a href=\"https://github.com/oaass\">Ole Aass</a> (<a href=\"http://oleaass.com/\">website</a>) who is leading the project.</p>\r\n<p>The new site has a very easy interface that users can navigate to and even search for projects with tags.&nbsp;</p>\r\n<p>You can add your own project by simply cloning our <a href=\"https://github.com/phalcon/builtwith\">repository</a> and adding your project as well as a logo and screenshots and then issue a pull request for it to appear in the live site.</p>\r\n<p>Looking forward to seeing your projects listed up there!</p>\r\n<p>&lt;3 The Phalcon Team</p>'),(51,4,'en','title','Second article'),(52,4,'en','meta_title','Second article'),(53,4,'en','meta_description',''),(54,4,'en','meta_keywords',''),(55,4,'en','text','<p>Second article text</p>'),(61,5,'en','title','New modular widgets system'),(62,5,'en','meta_title','New widgets system'),(63,5,'en','meta_description',''),(64,5,'en','meta_keywords',''),(65,5,'en','text','<p>Here is the new features of YonaCMS - \"System of modular widgets\".</p>\r\n<p>Now, in any of your modules, you can create dynamic widgets with their business logic and templates. Forget about dozens of separate helper and the need to do the same routine operations! Also, this scheme will maintain cleanliness and order in the code for your project.</p>\r\n<p>Call each widget can be produced directly from the template Volt with the transfer set of parameters. Each widget is automatically cached and does not lead to additional load on the database. Caching can be disabled in the administrative panel, see Admin -&gt; Settings, option \"Widgets caching\". Automatic regeneration of the cache is carried out after 60 seconds.</p>\r\n<p>As an example of such a call is made to the widget template\'s main page /app/modules/Index/views/index.volt</p>\r\n<pre>{{Helper.widget (\'Publication\'). LastNews ()}}</pre>\r\n<p><br />Files widget:<br />/app/modules/Publication/Widget/PublicationWidget.php - inherits \\ Application \\ Widget \\ AbstractWidget<br />/app/modules/Publication/views/widget/last-news.volt - template output</p>\r\n<p>The main class of the widget - \\ Application \\ Widget \\ Proxy<br />It is possible to set the default value for time caching.</p>\r\n<p>This system will be very useful for developers who have a lot of individual information units, as well as those who want to keep your code clean and easy tool to use.</p>'),(76,6,'en','title','Test first post'),(77,6,'en','text',''),(78,6,'en','meta_title','Test first post'),(79,6,'en','cover_photo','img/original/publication_cover_photo/0/6.jpg'),(80,6,'en','short_description',''),(81,6,'en','preview_src','img/original/publication_preview_src/0/6.jpg'),(82,6,'en','preview_inner','1'),(83,5,'en','short_description',''),(84,5,'en','preview_inner','1'),(85,5,'en','cover_photo','img/original/publication_cover_photo/0/5.jpg'),(86,5,'en','preview_src','img/original/publication_preview_src/0/5.jpg'),(87,2,'en','preview_inner','0'),(88,2,'en','slug','phalcon-community-hangout'),(89,2,'vi','title','Phalcon Cộng đồng Hangout'),(90,2,'vi','slug','phalcon-cong--ong-hangout'),(91,2,'vi','text','<p>Yesterday (2014-04-05) we had our first Phalcon community hangout. The main purpose of the hangout was to meet the community, discuss about what Phalcon is and what our future steps are, and hear news, concerns, success stories from the community itself.</p>\r\n<p>We are excited to announce that the first Phalcon community hangout was a great success!</p>\r\n<p>We had an awesome turnout from all around the world, with members of the community filling the hangout (10 concurrent users) and more viewing online, asking questions and interacting with the team.</p>\r\n<p>We talked about where we are, where we came from and what the future steps are with Zephir and Phalcon 2.0. Contributions, bugs and NFRs were also topics in our discussion, as well as who are team and how Phalcon is funded.</p>\r\n<p>More hangouts will be scheduled in the near future, hopefully making this a regular event for our community. We will also cater for members of the community that are not English speakers, by creating hangouts for Spanish speaking, Russian etc. The goal is to engage as many members as possible!</p>\r\n<p>The love and trust you all have shown to our framework is what drives us to make it better, push performance, introduce more features and make Phalcon the best PHP framework there is.&nbsp;</p>\r\n<p>For those that missed it, the video is below.</p>');

UNLOCK TABLES;

/*Table structure for table `publication_type` */

DROP TABLE IF EXISTS `publication_type`;

CREATE TABLE `publication_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) DEFAULT NULL,
  `limit` int(4) DEFAULT NULL,
  `format` enum('list','grid') DEFAULT NULL,
  `display_on_home_page` tinyint(1) DEFAULT '1',
  `display_on_menu_footer` tinyint(1) DEFAULT '1',
  `display_date` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `publication_type` */

LOCK TABLES `publication_type` WRITE;

insert  into `publication_type`(`id`,`slug`,`limit`,`format`,`display_on_home_page`,`display_on_menu_footer`,`display_date`) values (1,'news',10,'grid',1,1,'1'),(2,'articles',10,'list',1,1,'0');

UNLOCK TABLES;

/*Table structure for table `publication_type_translate` */

DROP TABLE IF EXISTS `publication_type_translate`;

CREATE TABLE `publication_type_translate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `foreign_id` (`foreign_id`),
  KEY `lang` (`lang`),
  CONSTRAINT `publication_type_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `publication_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `publication_type_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

/*Data for the table `publication_type_translate` */

LOCK TABLES `publication_type_translate` WRITE;

insert  into `publication_type_translate`(`id`,`foreign_id`,`lang`,`key`,`value`) values (54,1,'en','title','News'),(55,1,'en','head_title','News'),(56,1,'en','meta_description',''),(57,1,'en','meta_keywords',''),(58,1,'en','seo_text',''),(70,2,'en','title','Articles'),(71,2,'en','head_title','Articles'),(72,2,'en','meta_description',''),(73,2,'en','meta_keywords',''),(74,2,'en','seo_text','');

UNLOCK TABLES;

/*Table structure for table `seo_manager` */

DROP TABLE IF EXISTS `seo_manager`;

CREATE TABLE `seo_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `head_title` varchar(500) DEFAULT NULL,
  `meta_description` varchar(500) DEFAULT NULL,
  `meta_keywords` varchar(500) DEFAULT NULL,
  `seo_text` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `seo_manager` */

LOCK TABLES `seo_manager` WRITE;

insert  into `seo_manager`(`id`,`url`,`head_title`,`meta_description`,`meta_keywords`,`seo_text`,`created_at`,`updated_at`) values (1,'/news','Latest News','Greate latest and fresh news!','news, latest news, fresh news','<p>Presenting your attention the latest news!</p>','2014-09-30 10:39:23','2015-07-02 11:28:57'),(2,'/contacts.html','Yona CMS Contacts','','','','2015-05-21 16:33:14','2015-07-02 11:19:40');

UNLOCK TABLES;

/*Table structure for table `translate` */

DROP TABLE IF EXISTS `translate`;

CREATE TABLE `translate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) DEFAULT NULL,
  `phrase` varchar(500) DEFAULT NULL,
  `translation` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`),
  CONSTRAINT `translate_ibfk_1` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

/*Data for the table `translate` */

LOCK TABLES `translate` WRITE;

insert  into `translate`(`id`,`lang`,`phrase`,`translation`) values (8,NULL,'Ошибка валидации формы','Form validation fails'),(9,NULL,'Подробнее','Read more'),(10,NULL,'Назад к перечню публикаций','Back to the publications list'),(11,NULL,'SITE NAME','Yona CMS'),(12,NULL,'Главная','Home'),(13,NULL,'Новости','News'),(14,NULL,'Контакты','Contacts'),(23,NULL,'Статьи','Articles'),(25,NULL,'Home','Home'),(26,NULL,'News','News'),(27,NULL,'Articles','Articles'),(28,NULL,'Contacts','Contacts'),(29,NULL,'Admin','Admin'),(30,NULL,'YonaCms Admin Panel','YonaCms Admin Panel'),(31,NULL,'Back к перечню публикаций','Back to publications list'),(32,NULL,'Страница №','Page num.'),(49,NULL,'Полная версия','Full version'),(50,NULL,'Мобильная версия','Mobile version'),(51,NULL,'Services','Services'),(52,NULL,'Printing','Printing'),(53,NULL,'Design','Design'),(64,NULL,'Latest news','Latest news'),(67,NULL,'Entries not found','Entries not found'),(68,NULL,'Back to publications list','Back to publications list');

UNLOCK TABLES;

/*Table structure for table `tree_category` */

DROP TABLE IF EXISTS `tree_category`;

CREATE TABLE `tree_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root` enum('articles','news') NOT NULL DEFAULT 'articles',
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  `left_key` int(11) DEFAULT NULL,
  `right_key` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `tree_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tree_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `tree_category` */

LOCK TABLES `tree_category` WRITE;

insert  into `tree_category`(`id`,`root`,`parent_id`,`slug`,`depth`,`left_key`,`right_key`,`created_at`,`updated_at`) values (15,'articles',NULL,'computers',1,2,7,'2015-05-19 16:46:38','2015-05-20 13:31:24'),(16,'articles',NULL,'software',1,14,21,'2015-05-19 16:47:32','2015-05-20 13:31:25'),(17,'articles',NULL,'gadgets',1,8,13,'2015-05-19 16:47:45','2015-05-20 13:31:25'),(18,'articles',16,'microsoft',2,17,18,'2015-05-19 17:23:44','2015-05-20 13:31:25'),(19,'articles',16,'oracle',2,19,20,'2015-05-19 17:24:00','2015-05-20 13:31:25'),(20,'articles',16,'google',2,15,16,'2015-05-19 17:24:24','2015-05-20 13:31:25'),(21,'articles',15,'netbooks',2,3,4,'2015-05-19 17:24:49','2015-05-20 13:31:25'),(22,'articles',15,'laptops',2,5,6,'2015-05-19 17:30:49','2015-05-20 13:31:25'),(23,'articles',17,'smartpfone',2,9,10,'2015-05-19 17:32:06','2015-05-20 13:31:25'),(24,'articles',17,'tablet',2,11,12,'2015-05-19 17:32:53','2015-05-20 13:31:25'),(25,'news',NULL,'world',1,2,3,'2015-05-19 17:33:04','2015-05-20 15:24:45'),(26,'news',NULL,'business',1,6,11,'2015-05-19 17:33:11','2015-05-20 15:24:45'),(27,'news',NULL,'politics',1,4,5,'2015-05-19 17:33:16','2015-05-20 15:24:45'),(28,'news',26,'real-estate',2,7,8,'2015-05-19 17:33:30','2015-05-20 15:24:45'),(29,'news',26,'investitions',2,9,10,'2015-05-19 17:33:54','2015-05-20 15:24:45'),(30,'news',NULL,'life',1,12,17,'2015-05-20 15:24:05','2015-05-20 15:24:45'),(31,'news',30,'health',2,13,14,'2015-05-20 15:24:22','2015-05-20 15:24:45'),(32,'news',30,'family',2,15,16,'2015-05-20 15:24:42','2015-05-20 15:24:45');

UNLOCK TABLES;

/*Table structure for table `tree_category_translate` */

DROP TABLE IF EXISTS `tree_category_translate`;

CREATE TABLE `tree_category_translate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `foreign_id` (`foreign_id`),
  KEY `lang` (`lang`),
  CONSTRAINT `tree_category_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `tree_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tree_category_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `tree_category_translate` */

LOCK TABLES `tree_category_translate` WRITE;

insert  into `tree_category_translate`(`id`,`foreign_id`,`lang`,`key`,`value`) values (14,15,'en','title','Computers'),(15,16,'en','title','Software'),(16,17,'en','title','Gadgets'),(17,18,'en','title','Microsoft'),(18,19,'en','title','Oracle'),(19,20,'en','title','Google'),(20,21,'en','title','Netbooks'),(21,22,'en','title','Laptops'),(22,23,'en','title','Smartpfone'),(23,24,'en','title','Tablet'),(24,25,'en','title','World'),(25,26,'en','title','Business'),(26,27,'en','title','Politics'),(27,28,'en','title','Real estate'),(28,29,'en','title','Investitions'),(29,30,'en','title','Life'),(30,31,'en','title','Health'),(31,32,'en','title','Family');

UNLOCK TABLES;

/*Table structure for table `widget` */

DROP TABLE IF EXISTS `widget`;

CREATE TABLE `widget` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `html` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `widget` */

LOCK TABLES `widget` WRITE;

insert  into `widget`(`id`,`title`,`html`) values ('phone','Phone in header','<div class=\"phone\">+1 (001) 555-44-33</div>');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
