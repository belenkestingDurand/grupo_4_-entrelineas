--Aca vamos a crear todas las tablas con CREATE TABLE

CREATE DATABASE IF NOT EXISTS 'entrelineas'
USE 'entrelineas'

-- Table structure for table 'authors'
DROP TABLE IF EXISTS 'authors'
CREATE TABLE 'authors'(
    id INT UNSIGNED  NOT NULL AUTO INCREMENT,
    fullName VARCHAR(60) NOT NULL,
    PRIMARY KEY (id)
    );
--
-- Dumping data for table 'authors'
--
--
-- Table structure for table 'genres'
DROP TABLE IF EXISTS 'genres'
CREATE TABLE 'genres'(
    id INT UNSIGNED  NOT NULL AUTO INCREMENT,
    name VARCHAR(40) NOT NULL,
    PRIMARY KEY (id)
    );
--
-- Dumping data for table 'genres'
--
-- Table strucure for table 'products Types'
DROP TABLE IF EXISTS 'genres'
CREATE TABLE 'productTypes'(
    id INT UNSIGNED  NOT NULL AUTO INCREMENT,
    title VARCHAR(40) NOT NULL,
    PRIMARY KEY (id)
    );
--
-- Dumping data for table 'products Types'
--
-- Table strucure for table 'products Types'
DROP TABLE IF EXISTS 'editorials'
CREATE TABLE 'editorials'(
    id INT UNSIGNED  NOT NULL AUTO INCREMENT,
    title VARCHAR(40) NOT NULL,
    PRIMARY KEY (id)
    );
--
-- Dumping data for table 'products Types'
--
-- Table structure for table 'products'
DROP TABLE IF EXISTS 'products'
CREATE TABLE 'products'(
    id INT UNSIGNED  NOT NULL AUTO INCREMENT,
    name VARCHAR(50) NOT NULL,
    price DECIMAL (5,2) UNSIGNED,
    size VARCHAR(29),
    pages SMALLINT UNSIGNED,
    opinion VARCHAR(500),
    more TEXT,
    picture VARCHAR(200),
    stock SMALLINT UNSIGNED,
    id_author INT UNSIGNED NOT NULL,
    id_genre INT UNSIGNED NOT NULL,
    id_productType INT UNSIGNED NOT NULL
    id_editorial INT UNSIGNED 
    PRIMARY KEY (id),
    FOREIGN KEY (id_author) REFERENCES authors(id),
    FOREIGN KEY (id_genre) REFERENCES genres(id),
    FOREIGN KEY (id_productType) REFERENCES productTypes(id),
    FOREIGN KEY (id_editorial) REFERENCES editorials(id)
    );

--
-- Dumping data for table 'products'
--
-- Table structure for table 'orders'
DROP TABLE IF EXISTS 'orders'
CREATE TABLE 'orders' (
    id INT UNSIGNED  NOT NULL AUTO INCREMENT,
    createdAt DATETIME NOT NULL,
    total INT NOT NULL
    -- aca faltaria la tabla de 'payments'
    id_payment INT UNSIGNED,
    id_user INT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (id_user) REFERENCES users(id)
)

-- Table structure for table 'orderDetails'
DROP TABLE IF EXISTS 'orderDetails'
CREATE TABLE 'orderDetails' (
    id INT UNSIGNED  NOT NULL AUTO INCREMENT,
    id_product INT UNSIGNED,
    item VARCHAR(200) NOT NULL,
    description TEXT ,
    price INT NOT NULL,
    id_order INT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (id_order) REFERENCES orders(id)
)

-- Table structure for table 'cartsDetails'
DROP TABLE IF EXISTS 'cartsDetails'
CREATE TABLE 'cartsDetails' (
    id INT UNSIGNED  NOT NULL AUTO INCREMENT,
    id_product INT UNSIGNED,
    item VARCHAR(200) NOT NULL,
    description TEXT,
    price INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_product) REFERENCES carts(id)
)

-- Table structure for table 'carts
DROP TABLE IF EXISTS 'cartsDetails'
CREATE TABLE 'cartsDetails' (
    id INT UNSIGNED  NOT NULL AUTO INCREMENT,
    id_user INT UNSIGNED,
    id_cartDetails INT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (id_user) REFERENCES users(id)
    FOREIGN KEY (id_cartDetails) REFERENCES cartsDetails(id)
)

-- Table structure for table 'shippings'
DROP TABLE IF EXISTS 'shippings'
CREATE TABLE 'shippings' (
    id INT UNSIGNED  NOT NULL AUTO INCREMENT,
    id_order INT UNSIGNED,
    createdAt DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    updatedAt DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (id_order) REFERENCES orders(id)
)
-- Table structure for table 'userCategories'
DROP TABLE IF EXISTS entrelineas.userCategory;
CREATE TABLE entrelineas.userCategory (
    id INT UNSIGNED  NOT NULL auto_increment,
    name VARCHAR(100),
     PRIMARY KEY (id));


-- Table structure for table 'users'
DROP TABLE IF EXISTS entrelineas.users;
CREATE TABLE entrelineas.users (
    id INT UNSIGNED  NOT NULL auto_increment,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(50) NOT NULL,
    profilePic VARCHAR(100),
    id_userCategory int UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (id_userCategory) REFERENCES userCategory(id)
);
-- Table structure for table 'usersAdress'
DROP TABLE IF EXISTS entrelineas.usersAdress;
CREATE TABLE entrelineas.usersAdress (
    id INT UNSIGNED  NOT NULL auto_increment,
    county VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    street VARCHAR(50) NOT NULL,
    number VARCHAR(100) NOT NULL,
    flor INTEGER,
    dto VARCHAR(100),
    id_user int UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (id_user) REFERENCES users(id)
);

