-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ProjectPart1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ProjectPart1` ;

-- -----------------------------------------------------
-- Schema ProjectPart1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProjectPart1` DEFAULT CHARACTER SET utf8 ;
USE `ProjectPart1` ;

-- -----------------------------------------------------
-- Table `ProjectPart1`.`colleges`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjectPart1`.`colleges` ;

CREATE TABLE IF NOT EXISTS `ProjectPart1`.`colleges` (
  `college_id` INT NOT NULL,
  `college_name` VARCHAR(45) NULL,
  PRIMARY KEY (`college_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectPart1`.`departments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjectPart1`.`departments` ;

CREATE TABLE IF NOT EXISTS `ProjectPart1`.`departments` (
  `departments_id` INT NOT NULL,
  `department` VARCHAR(45) NULL,
  `department_code` VARCHAR(45) NULL,
  `college_id` INT NOT NULL,
  PRIMARY KEY (`departments_id`),
  INDEX `fk_departments_colleges_idx` (`college_id` ASC) VISIBLE,
  CONSTRAINT `fk_departments_colleges`
    FOREIGN KEY (`college_id`)
    REFERENCES `ProjectPart1`.`colleges` (`college_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectPart1`.`courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjectPart1`.`courses` ;

CREATE TABLE IF NOT EXISTS `ProjectPart1`.`courses` (
  `courses_id` INT NOT NULL,
  `courses_num` INT NULL,
  `course_title` VARCHAR(45) NULL,
  `credits` INT NULL,
  `departments_id` INT NOT NULL,
  PRIMARY KEY (`courses_id`),
  INDEX `fk_courses_departments1_idx` (`departments_id` ASC) VISIBLE,
  CONSTRAINT `fk_courses_departments1`
    FOREIGN KEY (`departments_id`)
    REFERENCES `ProjectPart1`.`departments` (`departments_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectPart1`.`students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjectPart1`.`students` ;

CREATE TABLE IF NOT EXISTS `ProjectPart1`.`students` (
  `students_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `gender` ENUM('M', 'F') NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(2) NULL,
  `birthdate` DATE NULL,
  PRIMARY KEY (`students_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectPart1`.`faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjectPart1`.`faculty` ;

CREATE TABLE IF NOT EXISTS `ProjectPart1`.`faculty` (
  `faculty_id` INT NOT NULL,
  `faculty_fname` VARCHAR(45) NULL,
  `faculty_lname` VARCHAR(45) NULL,
  PRIMARY KEY (`faculty_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectPart1`.`term`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjectPart1`.`term` ;

CREATE TABLE IF NOT EXISTS `ProjectPart1`.`term` (
  `term_id` INT NOT NULL,
  `year` INT NULL,
  `term` ENUM('Fall', 'Winter') NULL,
  PRIMARY KEY (`term_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectPart1`.`section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjectPart1`.`section` ;

CREATE TABLE IF NOT EXISTS `ProjectPart1`.`section` (
  `section_id` INT NOT NULL,
  `section` INT NULL,
  `capacity` INT NULL,
  `courses_id` INT NOT NULL,
  `faculty_id` INT NOT NULL,
  `term_id` INT NOT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `fk_section_courses1_idx` (`courses_id` ASC) VISIBLE,
  INDEX `fk_section_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  INDEX `fk_section_term1_idx` (`term_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_courses1`
    FOREIGN KEY (`courses_id`)
    REFERENCES `ProjectPart1`.`courses` (`courses_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `ProjectPart1`.`faculty` (`faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_term1`
    FOREIGN KEY (`term_id`)
    REFERENCES `ProjectPart1`.`term` (`term_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectPart1`.`section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjectPart1`.`section` ;

CREATE TABLE IF NOT EXISTS `ProjectPart1`.`section` (
  `section_id` INT NOT NULL,
  `section` INT NULL,
  `capacity` INT NULL,
  `courses_id` INT NOT NULL,
  `faculty_id` INT NOT NULL,
  `term_id` INT NOT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `fk_section_courses1_idx` (`courses_id` ASC) VISIBLE,
  INDEX `fk_section_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  INDEX `fk_section_term1_idx` (`term_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_courses1`
    FOREIGN KEY (`courses_id`)
    REFERENCES `ProjectPart1`.`courses` (`courses_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `ProjectPart1`.`faculty` (`faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_term1`
    FOREIGN KEY (`term_id`)
    REFERENCES `ProjectPart1`.`term` (`term_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectPart1`.`section_has_students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProjectPart1`.`section_has_students` ;

CREATE TABLE IF NOT EXISTS `ProjectPart1`.`section_has_students` (
  `section_id` INT NOT NULL,
  `students_id` INT NOT NULL,
  PRIMARY KEY (`section_id`, `students_id`),
  INDEX `fk_section_has_students_students1_idx` (`students_id` ASC) VISIBLE,
  INDEX `fk_section_has_students_section1_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_has_students_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `ProjectPart1`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_has_students_students1`
    FOREIGN KEY (`students_id`)
    REFERENCES `ProjectPart1`.`students` (`students_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

USE projectpart1;

INSERT INTO colleges
(college_id, college_name)
VALUES
(1, "College of Physical Science and Engineering"),
(2, "College of Business and Communication"),
(3, "College of Language and Letters");

INSERT INTO departments
(departments_id, department, department_code, college_id)
VALUES
(101, "Computer Information Technology", "CIT", 1),
(102, "Economics", "ECON", 2),
(103, "Humanities and Philosophy", "HUM", 3);

INSERT INTO courses
(courses_id, courses_num, course_title, credits, departments_id)
VALUES
(10001, 111, "Intro to Databases", 3, 101),
(10002, 388, "Econometrics", 4, 102),
(10003, 150, "Micro Economics", 3, 102),
(10004, 376, "Classical Heritage", 2, 103);

INSERT INTO term
(term_id, year, term)
VALUES
(1000001, 2019, "Fall"),
(1000002, 2018, "Winter");

INSERT INTO faculty
(faculty_id, faculty_fname, faculty_lname)
VALUES
(100000001,"Marty", "Morring"),
(100000002,"Nate", "Norris"),
(100000003,"Ben", "Barrus"),
(100000004,"John", "Jensen"),
(100000005,"Bill", "Barney");

INSERT INTO section
(section_id, section, capacity, courses_id, faculty_id, term_id)
VALUES
(501, 1, 30, 10001, 100000001, 1000001),
(502, 1, 50, 10003, 100000002, 1000001),
(503, 2, 50, 10003, 100000002, 1000001),
(504, 1, 35, 10002, 100000003, 1000001),
(505, 1, 30, 10004, 100000004, 1000001),
(506, 2, 30, 10001, 100000001, 1000002),
(507, 3, 35, 10001, 100000005, 1000002),
(508, 1, 50, 10003, 100000002, 1000002),
(509, 2, 50, 10003, 100000002, 1000002),
(510, 1, 30, 10004, 100000004, 1000002);

INSERT INTO students
(students_id, first_name, last_name, gender, city, state, birthdate)
VALUES
(901, "Paul", "Miller", "M", "Dallas", "TX", "1996-02-22"),
(902, "Katie", "Smith", "F", "Provo", "UT", "1995-07-22"),
(903, "Kelly", "Jones", "F", "Provo", "UT", "1998-06-22"),
(904, "Devon", "Merrill", "M", "Mesa", "AZ", "2000-07-22"),
(905, "Mandy", "Murdock", "F", "Topeka", "KS", "1996-11-22"),
(906, "Alece", "Adams", "F", "Rigby", "ID", "1997-05-22"),
(907, "Bryce", "Carlson", "M", "Bozeman", "MT", "1997-11-22"),
(908, "Preston", "Larsen", "M", "Decatur", "TN", "1996-09-22"),
(909, "Julia", "Madsen", "F", "Rexburg", "ID", "1998-09-22"),
(910, "Susan", "Sorensen", "F", "Mesa", "AZ", "1998-08-09");


INSERT INTO section_has_students
(students_id, section_id)
VALUES
(906, 507),
(907, 506),
(907, 508),
(907, 510),
(904, 505),
(909, 509),
(902, 504),
(903, 504),
(905, 504),
(905, 505),
(901, 501),
(901, 503),
(908, 509),
(910, 506);

SELECT college_name AS college, department, department_code, courses_num, course_title, credits
FROM colleges AS cl
	INNER JOIN departments AS d ON cl.college_id = d.college_id
    INNER JOIN courses AS cr ON cr.departments_id = d.departments_id
    INNER JOIN section AS s ON s.courses_id = cr.courses_id
    INNER JOIN faculty AS f ON s.faculty_id = f.faculty_id
    INNER JOIN term AS t ON t.term_id = s.term_id;
    
-- 1    
SELECT first_name AS fname, last_name AS lname, DATE_FORMAT(birthdate, "%M %d, %x") AS "Sept Birthdays"
FROM students
WHERE MONTH(birthdate) = 9
ORDER BY last_name;


-- 2
-- ???

-- 3
SELECT first_name AS fname, last_name AS lname
FROM students AS s 
	INNER JOIN section_has_students AS shs ON s.students_id = shs.students_id
    INNER JOIN section AS se ON se.section_id = shs.section_id
    INNER JOIN faculty AS f ON f.faculty_id = se.faculty_id
WHERE faculty_fname = "John"
ORDER BY last_name;

-- 4
SELECT faculty_fname AS fname, faculty_lname AS lname
FROM students AS s 
	INNER JOIN section_has_students AS shs ON s.students_id = shs.students_id
    INNER JOIN section AS se ON se.section_id = shs.section_id
    INNER JOIN faculty AS f ON f.faculty_id = se.faculty_id
WHERE first_name = "Bryce"
ORDER BY faculty_lname;

-- 5
SELECT first_name AS fname, last_name AS lname
FROM students AS s 
	INNER JOIN section_has_students AS shs ON s.students_id = shs.students_id
    INNER JOIN section AS se ON se.section_id = shs.section_id
    INNER JOIN courses AS c ON c.courses_id = se.courses_id
    INNER JOIN term AS t ON t.term_id = se.term_id
WHERE course_title = "Econometrics" AND year = 2019 AND term = "Fall"
ORDER BY last_name;

-- 6
SELECT department_code, courses_num, course_title AS "name"
FROM students AS s 
	INNER JOIN section_has_students AS shs ON s.students_id = shs.students_id
    INNER JOIN section AS se ON se.section_id = shs.section_id
    INNER JOIN courses AS c ON c.courses_id = se.courses_id
    INNER JOIN departments AS d ON d.departments_id = c.departments_id
    INNER JOIN term AS t ON t.term_id = se.term_id
WHERE first_name = "Bryce" AND term = "Winter"
ORDER BY course_title;

-- 7
SELECT term, year, COUNT(s.students_id) AS Enrollment
FROM students AS s
	INNER JOIN section_has_students AS shs ON s.students_id = shs.students_id
    INNER JOIN section AS se ON se.section_id = shs.section_id
    INNER JOIN term AS t ON t.term_id = se.term_id
WHERE term = "Fall";

-- 8
SELECT college_name AS Colleges, COUNT(courses_id) AS Courses
FROM colleges AS c
	INNER JOIN departments AS d ON c.college_id = d.college_id
    INNER JOIN courses AS cs ON cs.departments_Id = d.departments_id
GROUP BY college_name
ORDER BY college_name;

-- 9
SELECT faculty_fname AS fname, faculty_lname AS lname, SUM(capacity) AS TeachingCapacity
FROM faculty AS f 
	INNER JOIN section AS s ON f.faculty_id = s.faculty_id
    INNER JOIN term AS t on t. term_Id = s.term_id
WHERE term = "Winter"
GROUP BY faculty_fname
ORDER BY TeachingCapacity;

-- 10
SELECT last_name AS lname, first_name AS fname, SUM(credits) AS Credits
FROM students AS s 
	INNER JOIN section_has_students AS shs ON s.students_id = shs.students_id
    INNER JOIN section AS se ON se.section_id = shs.section_id
    INNER JOIN courses AS c ON c.courses_id = se.courses_id
    INNER JOIN term AS t ON t.term_id = se.term_id
WHERE term = "Fall" AND year = 2019
GROUP BY last_name
HAVING credits >= 3
ORDER BY Credits desc;
