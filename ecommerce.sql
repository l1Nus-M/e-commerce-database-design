-- Database Project for E-Commerce --
/* Creating the Database */
CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

-- Table Schema --
/* 1. Brand Table */
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL
);

/* 2. Color Table */
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL
);

/* 3. Product Category Table */
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

/* 4. Product Table */
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2) NOT NULL
);

/* 5. Product Image Table */
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255) NOT NULL
);

/* 6. Size Category Table */
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

/* 7. Size Option Table */
CREATE TABLE size_option (
    size_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT,
    size_value VARCHAR(20) NOT NULL
);

/* 8. Product Item Table */
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    size_id INT,
    color_id INT,
    stock_quantity INT DEFAULT 0,
    price DECIMAL(10,2)
);

/* 9. Product Variation Table */
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    variation_name VARCHAR(50) NOT NULL
);

/* 10. Attribute Type Table */
CREATE TABLE attribute_type (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);

/* 11. Attribute Category Table */
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

/* 12. Product Attribute Table */
CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attribute_category_id INT,
    type_id INT,
    attribute_name VARCHAR(100),
    attribute_value VARCHAR(100)
);

-- Foreign Keys
ALTER TABLE product
ADD FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
ADD FOREIGN KEY (category_id) REFERENCES product_category(category_id);

ALTER TABLE product_image
ADD FOREIGN KEY (product_id) REFERENCES product(product_id);

ALTER TABLE size_option
ADD FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id);

ALTER TABLE product_item
ADD FOREIGN KEY (product_id) REFERENCES product(product_id),
ADD FOREIGN KEY (size_id) REFERENCES size_option(size_id),
ADD FOREIGN KEY (color_id) REFERENCES color(color_id);

ALTER TABLE product_variation
ADD FOREIGN KEY (product_id) REFERENCES product(product_id);

ALTER TABLE product_attribute
ADD FOREIGN KEY (product_id) REFERENCES product(product_id),
ADD FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
ADD FOREIGN KEY (type_id) REFERENCES attribute_type(type_id);

    
