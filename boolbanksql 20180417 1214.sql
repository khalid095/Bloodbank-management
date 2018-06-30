-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.18-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema bloodbank
--

CREATE DATABASE IF NOT EXISTS bloodbank;
USE bloodbank;

--
-- Definition of table `bloodgroup`
--

DROP TABLE IF EXISTS `bloodgroup`;
CREATE TABLE `bloodgroup` (
  `bloodid` varchar(30) NOT NULL,
  `bloodgroup` varchar(45) NOT NULL,
  PRIMARY KEY  (`bloodid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bloodgroup`
--

/*!40000 ALTER TABLE `bloodgroup` DISABLE KEYS */;
INSERT INTO `bloodgroup` (`bloodid`,`bloodgroup`) VALUES 
 ('negativeA','A-'),
 ('negativeAB','AB-'),
 ('negativeB','B-'),
 ('negativeO','O-'),
 ('positiveA','A+'),
 ('positiveAB','AB+'),
 ('positiveB','B+'),
 ('positiveO','O+');
/*!40000 ALTER TABLE `bloodgroup` ENABLE KEYS */;


--
-- Definition of table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `cityid` varchar(30) NOT NULL,
  `cityname` varchar(45) NOT NULL,
  PRIMARY KEY  USING BTREE (`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`cityid`,`cityname`) VALUES 
 ('azamg','azamgarh'),
 ('del','delhi'),
 ('kan','kanpur'),
 ('lko','lucknow'),
 ('mu','mau');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;


--
-- Definition of table `experience`
--

DROP TABLE IF EXISTS `experience`;
CREATE TABLE `experience` (
  `userid` varchar(20) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `views` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experience`
--

/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` (`userid`,`subject`,`views`,`date`) VALUES 
 ('abid123','registration','easy to registration and login .its good.','2017-11-15'),
 ('asad123','reg','easy reg','2017-11-15'),
 ('hasanali','user homepage','user home page is  designed properly and easy to use','2017-11-15');
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;


--
-- Definition of table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `feedbackid` int(10) unsigned NOT NULL auto_increment,
  `emailid` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `text` varchar(300) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY  (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` (`feedbackid`,`emailid`,`name`,`text`,`date`) VALUES 
 (1,'amir001','amirserver','i love this web','2017-05-12'),
 (3,'khalid007','khalid','it\'s awesome','2017-11-01'),
 (4,'khalid73','khalid','i love this web its good','2017-06-07'),
 (5,'hasanali','hasanali','jhsadzcxbjkzsb','2017-11-15'),
 (6,'amir001','amir server','its awesome web to communicate with donors.','2017-11-15'),
 (7,'khalid73','khalid','GOOD WEBSITE FOR BLOODBANK.','2018-04-16');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;


--
-- Definition of table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
CREATE TABLE `inbox` (
  `msgid` int(10) unsigned NOT NULL auto_increment,
  `senderid` varchar(30) NOT NULL,
  `receiverid` varchar(30) NOT NULL,
  `subject` varchar(80) NOT NULL,
  `message` varchar(500) NOT NULL,
  `dateofmsg` date NOT NULL,
  PRIMARY KEY  (`msgid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inbox`
--

/*!40000 ALTER TABLE `inbox` DISABLE KEYS */;
INSERT INTO `inbox` (`msgid`,`senderid`,`receiverid`,`subject`,`message`,`dateofmsg`) VALUES 
 (1,'abid123','abid123','i need blood','i need blood ','2017-11-15'),
 (2,'fahad kamal','amir01','need blood','I need blood for medical use so call or chat with me.','2017-11-15'),
 (3,'ahmadhh','ahmadhh','donate blood','i want to donate blood','2017-11-16'),
 (4,'moddasir123','amir01','yes, want to donate blood.','i saw your massege for requiring blood A+ so i wanted to donate.please give your address. ','2018-04-10'),
 (5,'khalid73','moddasir123','want to donate blood.','i saw your massege for requiring blood O+ so i want to donate,give me your address.','2018-04-10');
/*!40000 ALTER TABLE `inbox` ENABLE KEYS */;


--
-- Definition of table `logindetails`
--

DROP TABLE IF EXISTS `logindetails`;
CREATE TABLE `logindetails` (
  `userid` varchar(20) NOT NULL,
  `userpass` varchar(30) NOT NULL,
  `usertype` varchar(30) NOT NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logindetails`
--

/*!40000 ALTER TABLE `logindetails` DISABLE KEYS */;
INSERT INTO `logindetails` (`userid`,`userpass`,`usertype`) VALUES 
 ('abid123','abid12345','receiver'),
 ('amir001','amir09876','receiver'),
 ('amir01','amir12345','receiver'),
 ('asad123','asad12345','donor'),
 ('fahad kamal','fahad12345','donor'),
 ('hamesh01','hamesh12345','donor'),
 ('hasanali','hasan123','receiver'),
 ('khalid009','khalid12345','admin'),
 ('khalid73','khalid0007','donor'),
 ('khalid80','khalid12345','donor'),
 ('khalid85','khalid9519','receiver'),
 ('khalid95','khalidmasood','donor'),
 ('masood123','masoodali','donor'),
 ('moddasir123','moddasir','donor'),
 ('nadeem','nadeem123','receiver'),
 ('shihid123','123456789','donor'),
 ('zakir123','zakir12345','donor');
/*!40000 ALTER TABLE `logindetails` ENABLE KEYS */;


--
-- Definition of table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newsid` int(10) unsigned NOT NULL auto_increment,
  `content` varchar(255) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY  (`newsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` (`newsid`,`content`,`subject`,`date`) VALUES 
 (1,'40% off on flight tickets.','winter offer','2017-10-08'),
 (2,'50% off on railway tickets.','eid offer','2018-05-12'),
 (3,'15% caseback on movies.','summar offer','2017-08-15'),
 (4,'blood donation camp in hazratganj','blood donation camp','2017-11-12'),
 (5,'New Blood Donation Center at BBd university.','!!Coming soon!!..\r\nNew Blood center.','2017-11-20'),
 (6,'We provide door to door service at next month.','!!Coming Soon!!....\r\nDoor to Door service','2017-11-14'),
 (7,'blood donation','blood donation','2017-11-15');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;


--
-- Definition of table `senditem`
--

DROP TABLE IF EXISTS `senditem`;
CREATE TABLE `senditem` (
  `msgid` int(10) unsigned NOT NULL auto_increment,
  `senderid` varchar(30) NOT NULL,
  `receiverid` varchar(30) NOT NULL,
  `subject` varchar(80) NOT NULL,
  `message` varchar(500) NOT NULL,
  `dateofmsg` date NOT NULL,
  PRIMARY KEY  (`msgid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `senditem`
--

/*!40000 ALTER TABLE `senditem` DISABLE KEYS */;
INSERT INTO `senditem` (`msgid`,`senderid`,`receiverid`,`subject`,`message`,`dateofmsg`) VALUES 
 (1,'abid123','abid123','i need blood','i need blood ','2017-11-15'),
 (2,'fahad kamal','amir01','need blood','I need blood for medical use so call or chat with me.','2017-11-15'),
 (3,'ahmadhh','ahmadhh','donate blood','i want to donate blood','2017-11-16'),
 (4,'moddasir123','amir01','yes, want to donate blood.','i saw your massege for requiring blood A+ so i wanted to donate.please give your address. ','2018-04-10'),
 (5,'khalid73','moddasir123','want to donate blood.','i saw your massege for requiring blood O+ so i want to donate,give me your address.','2018-04-10');
/*!40000 ALTER TABLE `senditem` ENABLE KEYS */;


--
-- Definition of table `userdetails`
--

DROP TABLE IF EXISTS `userdetails`;
CREATE TABLE `userdetails` (
  `userid` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `phoneno` bigint(20) unsigned NOT NULL,
  `dor` date NOT NULL,
  `dob` date NOT NULL,
  `cityname` varchar(45) NOT NULL,
  `bloodgroup` varchar(8) NOT NULL,
  `picname` varchar(100) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdetails`
--

/*!40000 ALTER TABLE `userdetails` DISABLE KEYS */;
INSERT INTO `userdetails` (`userid`,`name`,`address`,`email`,`gender`,`phoneno`,`dor`,`dob`,`cityname`,`bloodgroup`,`picname`) VALUES 
 ('abid123','abid hamesh','maunath bhanjan','abid12@gmail.com','male',7485961425,'2017-11-04','1992-01-12','others','AB+','IMG_20170826_144413.jpg'),
 ('ahmadhh','ahmad hamesh abid','nomani gate mau','ahmdha@gmail.com','male',8317040575,'2017-11-16','1983-07-13','mau','B+','IMG_20170826_144413.jpg'),
 ('amir001','amir server','lko','amir10@gmail.com','male',80907676476,'2017-11-03','1990-05-20','lucknow','A+','New Doc 2017-09-17_1.jpg'),
 ('amir01','amir arshad','lko','amir65@gmail.com','male',8887676476,'2017-10-25','1993-05-10','lucknow','B-',''),
 ('asad khan','asad khan','kanpur','asadali1@gmail.com','male',9145789632,'2017-11-12','1993-12-11','kanpur','A+',NULL),
 ('asad123','asad','kanpur','asad1@gmail.com','male',9145781263,'2017-11-12','1998-11-11','kanpur','O+','IMG_20170826_144413.jpg'),
 ('asad4444','syed','bhfkuh','dgscgv@gmail.com','male',1212121212,'2017-11-12','2012-05-12','lucknow','O+',NULL),
 ('fahad kamal','mohd fahad','Mirzahadi pura mau ','fahad01@gmail.com','male',9174582563,'2017-11-15','1994-06-11','Mau','B+','IMG-20170216-WA0001.jpg'),
 ('fowad.mohd','surbuk cha','mau','fowad.mohd@gmail.com','male',9005689789,'2017-11-16','1993-07-11','Mau','O+',NULL),
 ('hamesh01','ahmad hamesh','ali house nishatganj','hamesh.01@gmail.com','male',8604401252,'2017-11-04','1994-05-11','lucknow','B+','horse-with-wings-2287095_1920.jpg'),
 ('hasanali','Hasan Ali','shibli national pg college azamgarh','shibli national pg college azamgarh','male',8596741425,'2017-11-04','1989-06-20','gorakhpur','B+','Blood-Bank-Bags.jpg'),
 ('khalid007','khalid','lko','khalid01@gmail.com','male',8090696249,'2017-10-25','1995-01-12','lucknow','O-','New Doc 2017-09-17_1.jpg'),
 ('khalid73','khalid','ALI HOUSE NISHATGANJ','km73@gmail.com','male',8090696249,'2017-11-03','1995-01-12','lucknow','O+','New Doc 2017-10-01_1.jpg'),
 ('khalid85','khalid','BBD UNIVERSITY FAIZABAAD ROAD LUCKNOW','mk1234@gmail.com','male',9944567854,'2018-04-12','1994-12-11','lucknow','A+',NULL),
 ('khalid95','mohd khalid','ALI HOUSE NISHATGANJ\r\nLUCKNOW','km7728@gmail.com','male',9044320552,'2018-04-12','1995-01-12','lucknow','O+','New Doc 2017-09-17_1.jpg'),
 ('khalidm12','masood','ali house nishatganj','kmmk12@gmail.com','male',9044360036,'2017-10-28','1994-02-11','lucknow','O+','mill-1620440_1920.jpg'),
 ('masood010','masood ali','MIRZAHADIPURA MAU','mas001@gmail.com','male',9044320552,'2017-10-25','1968-01-01','others','A-',''),
 ('masood123','masood','lko','mas005@gmail.com','male',90443200052,'2017-10-29','1999-10-24','lucknow','B+','background-1819540_1920.jpg'),
 ('moddasir123','moddasir hasan','azamgarh','modd123@gmail.com','male',8099995421,'2018-04-10','1994-11-12','gorakhpur','A+','New Doc 2017-09-17_1.jpg'),
 ('nadeem','nadeem','mau','nadeem12@gmail.com','male',9001417151,'2017-11-15','1990-08-02','mau','AB+','IMG-20170113-WA0000.jpg'),
 ('shihid123','shahid ahmad','mau nath bhanjan','shd122@gmail.com','male',1234567899,'2018-04-09','1996-01-03','Mau','A+',NULL),
 ('sw@123','swasti','lko','sw@gmail.com','female',43566778,'2017-11-12','1988-10-11','lucknow','A+',NULL),
 ('zakir123','mohd zakir','mau nathbhanjan','zakir123@gmail.com','male',8604401516,'2017-11-14','1993-07-12','others','B+','39551318-the-elements-of-blood-blood-vessel-cut-section.jpg');
/*!40000 ALTER TABLE `userdetails` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
