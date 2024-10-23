CREATE TABLE `Users` (
    `username` varchar(32),
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`username`)
);
CREATE TABLE `Schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `type` ENUM('Primary' , 'Secondary' , 'Higher Education') NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    `year` SMALLINT NOT NULL;
    PRIMARY KEY(`id`)
);
CREATE TABLE `Companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `industry` ENUM('Technology' , 'Education' , 'Business') NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `Connections_with_People` (
    `id` INT AUTO_INCREMENT,
    `userA_id` INT,
    `userB_id` INT,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`userA_id`) REFERENCES `Users`(`id`),
    FOREIGN KEY(`userB_id`) REFERENCES `Users`(`id`)
);
CREATE TABLE `Connections_with_Schools` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `school_id` INT,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `type` VARCHAR(8) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `Schools`(`id`)
);
CREATE TABLE `Connections_with_Companies` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `company_id` INT,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `Companies`(`id`)
);
