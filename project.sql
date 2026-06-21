create database food_app_project;

use food_app_project;

-- Table 1: customers (no dependencies)
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    signup_date DATE NOT NULL,
    gender VARCHAR(10)
);

-- Table 2: restaurants (no dependencies)
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(255) NOT NULL,
    city VARCHAR(255),
    cuisine VARCHAR(100),
    rating decimal(3,2)
);

-- Table 3: delivery_agents (no dependencies)
CREATE TABLE delivery_agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(255) NOT NULL,
    city VARCHAR(255),
    joining_date DATE,
    rating DECIMAL(3,2)
);

-- Table 4: orders (depends on customer and restaurants)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_amount DECIMAL(10,2),
    discount DECIMAL(5,2),
    payment_method VARCHAR(50),
    delivery_time INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- Table 5: order_item (depends on orders)
CREATE TABLE order_item (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    item_name VARCHAR(255),
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Running script SQL to check  all tables to verify creation

CREATE DATABASE IF NOT EXISTS food_app_project;
USE food_app_project;

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    signup_date DATE NOT NULL,
    gender VARCHAR(10)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(255) NOT NULL,
    city VARCHAR(255),
    cuisine VARCHAR(100),
    rating DECIMAL(3,2)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS delivery_agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(255) NOT NULL,
    city VARCHAR(255),
    joining_date DATE,
    rating DECIMAL(3,2)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_amount DECIMAL(10,2),
    discount DECIMAL(5,2),
    payment_method VARCHAR(50),
    delivery_time INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS order_item (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    item_name VARCHAR(255),
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
) ENGINE=InnoDB;

