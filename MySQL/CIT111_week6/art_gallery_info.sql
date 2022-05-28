-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema art_gallery
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `art_gallery` ;

-- -----------------------------------------------------
-- Schema art_gallery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `art_gallery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `art_gallery` ;

-- -----------------------------------------------------
-- Table `art_gallery`.`artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`artist` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`artist` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(20) NOT NULL,
  `mname` VARCHAR(20) NULL DEFAULT NULL,
  `lname` VARCHAR(25) NOT NULL,
  `dob` INT NOT NULL,
  `dod` INT NULL DEFAULT NULL,
  `country` VARCHAR(25) NOT NULL,
  `local_artist` ENUM('y', 'n') NULL DEFAULT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `art_gallery`.`artwork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`artwork` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`artwork` (
  `artwork_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `artyear` INT NOT NULL,
  `period` VARCHAR(25) NULL DEFAULT NULL,
  `arttype` VARCHAR(20) NULL DEFAULT NULL,
  `artfile` VARCHAR(25) NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`artwork_id`),
  INDEX `fk_artwork_artist1_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_artwork_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `art_gallery`.`artist` (`artist_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `art_gallery`.`keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`keyword` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`keyword` (
  `keyword_id` INT NOT NULL AUTO_INCREMENT,
  `keyword` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`keyword_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `art_gallery`.`artwork_has_keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`artwork_has_keyword` ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`artwork_has_keyword` (
  `artwork_id` INT NOT NULL,
  `keyword_id` INT NOT NULL,
  PRIMARY KEY (`artwork_id`, `keyword_id`),
  INDEX `fk_artwork_has_keyword_keyword1_idx` (`keyword_id` ASC) VISIBLE,
  INDEX `fk_artwork_has_keyword_artwork1_idx` (`artwork_id` ASC) VISIBLE,
  CONSTRAINT `fk_artwork_has_keyword_artwork1`
    FOREIGN KEY (`artwork_id`)
    REFERENCES `art_gallery`.`artwork` (`artwork_id`),
  CONSTRAINT `fk_artwork_has_keyword_keyword1`
    FOREIGN KEY (`keyword_id`)
    REFERENCES `art_gallery`.`keyword` (`keyword_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



USE art_gallery;

INSERT INTO artist
(artist_id, fname, mname, lname, dob, dod, country, local_artist)

VALUES
(1, "Vincent", "", "van Gogh", 1853, 1890, "France", 'n'),
(2, "Rembrandt", "Harmenszoon", "van Rijn", 1606, 1669, "Netherlands", 'n'),
(3, "Leonardo", "", "da Vinci", 1452, 1519, "Italy", 'n'),
(4, "Venture", "Lonzo", "Coy", 1965, NULL, "United States", 'y'),
(5, "Deborah", "", "Gill", 1970, NULL, "United States", 'y'),
(6, "Claude", "", "Monet", 1840, 1926, "France", 'n'),
(7, "Pablo", "", "Picasso", 1904, 1973, "Spain", 'n'),
(8, "Michelangelo", "di Lodovico", "Simoni", 1475, 1564, "Italy", 'n');


INSERT INTO artwork
(artwork_id, title, artyear, period, arttype, artfile, artist_id)

VALUES
(101, "Irises", 1889, "Impressionism", "Oil", "irises.jpg", 1),
(102, "The Starry Night", 1889, "Post-Impressionism", "Oil", "starrynight.jpg", 1),
(103, "Sunflowers", 1888, "Post-impressionism", "Oil", "sunflowers.jpg", 1),
(104, "Night Watch", 1642, "Baroque", "Oil", "nightwatch.jpg", 2),
(105, "Storm on the Sea of Galilee", 1633, "Dutch Golden Age", "Oil", "stormgalilee.jpg", 2),
(106, "Head of a Woman", 1508, "High Renaissance", "Oil", "headwoman.jpg", 3),
(107, "Last Supper", 1498, "Renaissance", "Tempra", "lastsupper.jpg", 3),
(108, "Mona Lisa", 1517, "Renaissance", "Oil", "monalisa.jpg", 3),
(109, "Hillside Stream", 2005, "Modern", "Oil", "hillsidestream.jpg", 4),
(110, "Old Barn", 1992, "Modern", "Oil", "oldbarn.jpg", 4),
(111, "Beach Baby", 1999, "Modern", "Watercolor", "beachbaby.jpg", 5),
(112, "Women in the Garden", 1866, "Impressionism", "Oil", "womengarden.jpg", 6),
(113, "Old Guitarist", 1904, "Modern", "Oil", "guitarist.jpg", 7);


INSERT INTO keyword
(keyword_id, keyword)

VALUES
(10001, "flowers"),
(10002, "blue"),
(10003, "landscape"),
(10004, "girl"),
(10005, "people"),
(10006, "battle"),
(10007, "boat"),
(10008, "water"),
(10009, "Christ"),
(10010, "food"),
(10011, "baby");

INSERT INTO artwork_has_keyword
(artwork_id, keyword_id)

VALUES
(101, 10001),
(102, 10002),
(102, 10003),
(103, 10001),
(104, 10004),
(104, 10005),
(104, 10006),
(105, 10007),
(105, 10008),
(105, 10005),
(105, 10009),
(106, 10004),
(106, 10005),
(107, 10010),
(107, 10005),
(107, 10009),
(108, 10004),
(108, 10005),
(109, 10008),
(109, 10003),
(110, 10003),
(111, 10008),
(111, 10005),
(111, 10011),
(112, 10003),
(112, 10005),
(112, 10001),
(113, 10002),
(113, 10005);