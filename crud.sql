SET SQL_MODE = 'TRADITIONAL';       -- https://dev.mysql.com/doc/refman/5.6/en/sql-mode.html#sqlmode_traditional
DROP DATABASE IF EXISTS `crud`;
CREATE DATABASE IF NOT EXISTS `crud` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `crud`;

/* ============================================================================================= */
/* Table structure for table `students`                                                          */
/* ============================================================================================= */
DROP TABLE IF EXISTS `crud`.`students`;
CREATE TABLE IF NOT EXISTS `crud`.`students` (
      `id`                          INT          NOT NULL AUTO_INCREMENT                                            COMMENT 'Student Primary Key.'
    , `name`                        VARCHAR(256) NOT NULL                                                           COMMENT 'Student Name Field.'
    , `email`                       VARCHAR(512) NOT NULL                                                           COMMENT 'Student Email Address Field.'
    , `phone`                       VARCHAR(512) NOT NULL                                                           COMMENT 'Student Phone Address Field.'
    , `createdDate`                 DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP                                 COMMENT 'Student Creation Date          Of Record In A DateTime Format.'
    , `lastModifiedDate`            DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP     COMMENT 'Student Last Modification Date Of Record In A DateTime Format.'
    , `createdTimestamp`            TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP                                 COMMENT 'Student Creation Date          Of Record In A Timestamp Format.'
    , `lastModifiedTimestamp`       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP     COMMENT 'Student Last Modification Date Of Record In A Timestamp Format.'
    , PRIMARY KEY (`id`)
    , UNIQUE INDEX `UDX_STUDENT_EMAILADDRESS` (`email` ASC) VISIBLE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci
COMMENT 'Contact Table To Manage Known Contacts.'
;

/* ============================================================================================= */
-- Add data for table `students`
/* ============================================================================================= */
INSERT INTO `students` (`name`, `email`, `phone`)
VALUES
('Jay Rizzo',   'JayRizzo@JayRizzo.us', '+1 (312) 837-5309'),
('Parwiz',      'parwiz.f@gmail.com',   '009378976767'),
('John Doe',    'johndoe@gmail.com',    '999999999'),
('Karimja',     'ka@gmail.com',         '7333392'),
('Jamal',       'ja@gmail.com',         '3434343'),
('Nawid',       'na@gmail.com',         '343434'),
('Tom Logan',   'Tom@gmail.com',        '7347374347'),
('Tom Logan',   'tom2@gmail.com',       '11111111111'),
('Fawad',       'fa@gmail.com',         '347374837483'),
('Wahid',       'wa@gmail.com',         '4354354345')
;
