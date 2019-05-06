-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: EXAMEN_UNITEC
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `prospecto`
--

DROP TABLE IF EXISTS `prospecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prospecto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `apellido_paterno` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `apellido_materno` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `edad` tinyint(3) unsigned NOT NULL,
  `email` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `genero_id` int(10) unsigned NOT NULL,
  `estado_civil_id` int(10) unsigned NOT NULL,
  `programa_id` int(10) unsigned NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_prospecto_genero_idx` (`genero_id`),
  KEY `fk_prospecto_estado_civil1_idx` (`estado_civil_id`),
  KEY `fk_prospecto_programa1_idx` (`programa_id`),
  CONSTRAINT `fk_prospecto_estado_civil1` FOREIGN KEY (`estado_civil_id`) REFERENCES `estado_civil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_prospecto_genero` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_prospecto_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospecto`
--

LOCK TABLES `prospecto` WRITE;
/*!40000 ALTER TABLE `prospecto` DISABLE KEYS */;
INSERT INTO `prospecto` VALUES (1,'Blanca Puente','Guerra','Silva',88,'ainara34@latinmail.com','x+#:\'1/3)\"Hx*$0.N',1,1,3,'1995-11-23 03:43:00','1992-10-06 04:22:42'),(2,'Alejandro Leal','Casárez','Escobar',14,'carlota.valencia@live.com','R5agpC{',3,2,2,'2008-02-13 03:48:10','2007-04-30 22:47:34'),(3,'Miriam Granados','Tovar','Tapia',32,'paola53@terra.com',',a<8et@\\$L2w',1,2,3,'2012-04-15 16:48:08','2003-04-27 17:53:34'),(4,'Dr. Iván Lerma','Fuentes','Pons',15,'archuleta.diego@latinmail.com','o+1DfNu7Wu6AK,;M4',4,4,3,'1983-08-09 09:19:00','1997-01-31 15:28:48'),(5,'Raquel Haro','Márquez','Reina',27,'lvalles@villegas.org','?so<>20cF7x4',1,2,3,'2003-11-27 15:50:57','2018-01-15 03:29:28'),(6,'Lic. Miguel Romo Hijo','Oliva','Salcido',42,'ainhoa.esquibel@paredes.com','94wIZsN{p)r',1,4,2,'2013-07-12 08:52:24','1996-09-04 05:25:28'),(7,'Nicolás Ríos','Hernádez','Valle',61,'carrasco.iker@gmail.com','K|@.0EGf\'9e)>+D&r#)',4,1,2,'2011-10-11 23:29:24','2006-11-19 23:41:51'),(8,'Abril Aranda','Ozuna','Colón',23,'gtellez@gmail.com','Oi8]>ISw]\'sY;-^bQ;4',3,1,2,'1989-02-28 05:01:49','2009-02-18 09:23:43'),(9,'Erika Rubio','Partida','Mojica',62,'rmas@negrete.com','[_UE8[&#Igr',3,3,2,'2002-09-01 14:17:21','2009-02-01 20:46:42'),(10,'Lic. Marina Arias Tercero','Oliva','Lorenzo',93,'zmadera@yahoo.com','{#L\"YAN%S',3,4,2,'1991-07-25 08:00:35','1972-07-07 14:52:31'),(11,'Malak de Anda','Tafoya','Alcántar',69,'raul.padron@miramontes.net','dhVY3lUvxv%E$',1,4,3,'2010-02-05 22:35:09','1978-02-05 07:57:51'),(12,'Pol Baeza','Romo','Marrero',90,'isaac53@aguirre.es','BGGG$V.d',1,2,3,'2015-01-05 23:35:31','1971-11-24 11:58:37'),(13,'Gabriel Alcala','Solorzano','González',77,'jose74@rangel.net','cy$Ncc~u',1,3,3,'1985-04-28 23:19:49','1984-02-14 11:59:45'),(14,'Lola Quezada','Mercado','de Jesús',32,'ana.limon@alcantar.com','r^*_mTKS%?;>#j@',1,2,3,'1990-12-22 14:54:49','2002-08-13 15:52:34'),(15,'Alba Arredondo','Olivares','Rosado',71,'jesus.ulloa@gmail.com','ML7grID~JM$p}a&',4,1,3,'2001-04-09 05:42:23','1982-02-19 23:39:58'),(16,'Marc Solís','Vila','Tafoya',98,'bruno51@hotmail.com','!.8pF+(',2,1,3,'2002-11-16 14:47:47','1974-05-13 08:13:34'),(17,'Eva Hurtado','Domínguez','Atencio',75,'giron.adam@yahoo.com','AG7x5#idX,jC',1,2,3,'2011-03-29 18:27:17','2016-01-09 03:38:58'),(18,'Lic. David Zamora','Quezada','Valentín',26,'guevara.patricia@merino.com.es','6Xa2yQH',4,1,2,'1998-12-13 09:00:55','1995-08-16 06:29:57'),(19,'Lucas Calvo Segundo','Arroyo','Nájera',84,'blanca68@roca.com','^j7_+nn',3,2,2,'1985-03-27 09:27:42','1970-06-22 20:16:38'),(20,'Marcos Samaniego Tercero','Padilla','Ordoñez',70,'rivera.aina@palacios.com','.vE#gbSb{Kt',3,1,3,'1997-03-22 16:08:57','2009-07-30 07:43:35'),(21,'Erik','Osornio','Botello',34,'osornio1@live.com','01b307acba4f54f55aafc33bb06bbbf6ca803e9a',2,1,2,'2019-05-04 09:36:13','2019-05-04 09:36:13'),(32,'Erik','Osornio','Botello',25,'osornio2@live.com','01b307acba4f54f55aafc33bb06bbbf6ca803e9a',3,6,4,'2019-05-04 22:11:32','2019-05-04 22:11:32'),(33,'Erik','Osornio','Botello',25,'osornio3@live.com','01b307acba4f54f55aafc33bb06bbbf6ca803e9a',3,6,4,'2019-05-04 22:14:48','2019-05-04 22:14:48'),(35,'Erik Israel','Osornio','Botello',26,'osornio4@live.com','01b307acba4f54f55aafc33bb06bbbf6ca803e9a',2,1,5,'2019-05-04 22:42:39','2019-05-04 22:42:39'),(37,'Erik Israel','Osornio','Botello',26,'osornio6@live.com','01b307acba4f54f55aafc33bb06bbbf6ca803e9a',2,1,5,'2019-05-04 22:45:57','2019-05-04 22:45:57'),(38,'Erik Israel','Osornio','Botello',26,'osornio7@live.com','01b307acba4f54f55aafc33bb06bbbf6ca803e9a',2,1,5,'2019-05-04 23:07:22','2019-05-04 23:07:22'),(39,'Erik Israel','Osornio','Botello',26,'osornio8@live.com','01b307acba4f54f55aafc33bb06bbbf6ca803e9a',2,1,5,'2019-05-04 23:34:47','2019-05-04 23:34:47'),(40,'Erik Israel','Osornio','Botello',111,'osornio9@live.com','01b307acba4f54f55aafc33bb06bbbf6ca803e9a',2,5,3,'2019-05-06 00:52:38','2019-05-06 00:52:38'),(41,'Erik Israel','Osornio','Botello',111,'osornio10@live.com','01b307acba4f54f55aafc33bb06bbbf6ca803e9a',2,1,4,'2019-05-06 01:09:05','2019-05-06 01:09:05'),(42,'Erik Israel','Osornio','Botello',111,'osornio11@live.com','01b307acba4f54f55aafc33bb06bbbf6ca803e9a',1,1,3,'2019-05-06 01:29:31','2019-05-06 01:29:31'),(43,'Erik Israel','Osornio','Botello',111,'osornio12@live.com','01b307acba4f54f55aafc33bb06bbbf6ca803e9a',2,2,3,'2019-05-06 01:34:39','2019-05-06 01:34:39'),(45,'Erik Israel','Osornio','Botello',111,'osornio13@live.com','01b307acba4f54f55aafc33bb06bbbf6ca803e9a',4,2,1,'2019-05-06 09:28:07','2019-05-06 09:28:07'),(46,'Erik Israel','Osornio','Botello',120,'osornio14@live.com','01b307acba4f54f55aafc33bb06bbbf6ca803e9a',1,3,4,'2019-05-06 09:41:19','2019-05-06 09:41:19'),(47,'Erik Israel','Osornio','Botello',111,'osornio20@live.com','01b307acba4f54f55aafc33bb06bbbf6ca803e9a',4,1,3,'2019-05-06 10:02:47','2019-05-06 10:02:47');
/*!40000 ALTER TABLE `prospecto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-06 11:34:02
