
CREATE DATABASE IF NOT EXISTS platzi_operation;


CREATE TABLE IF NOT EXISTS authors(
    author_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(3) 
);

CREATE TABLE books (
    book_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    author INTEGER UNSIGNED,
    title VARCHAR(100) NOT NULL,
    `year` INTEGER UNSIGNED NOT NULL DEFAULT 1900,
    `language` VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 language',
    cover_url VARCHAR(500),
    price DOUBLE(6,2) NOT NULL DEFAULT 10.0,
    sellable TINYINT(1) DEFAULT 1,
    copies INTEGER NOT NULL DEFAULT 1,
    description TEXT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE clients (
    client_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    birthday DATETIME,
    gender ENUM('M', 'F', 'ND') NOT NULL,
    active TINYINT(1) NOT NULL DEFAULT 1,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS operations (
    operation_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    book_id INTEGER UNSIGNED,
    client_id INTEGER UNSIGNED,
    type ENUM('R', 'S', 'NR') NOT NULL,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    finished TINYINT(1) NOT NULL
);

-- select and show the DB
USE platzi_operation;
-- will show tables created on the selected DB
SHOW TABLES
-- will show details from selected table
desc clients;
describe authors;
-- will show warnings
SHOW warnings;

select database();
