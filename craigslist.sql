DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

-- Create Region Table
CREATE TABLE Region (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(50)
);

-- Create User Table
CREATE TABLE User (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(50),
    preferred_region_id INT,
    FOREIGN KEY (preferred_region_id) REFERENCES Region(region_id)
);

-- Create Post Table
CREATE TABLE Post (
    post_id INT PRIMARY KEY,
    title VARCHAR(50),
    text TEXT,
    user_id INT,
    location VARCHAR(50),
    region_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (region_id) REFERENCES Region(region_id)
);

-- Create Category Table
CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

-- Create Post_Category Table
CREATE TABLE Post_Category (
    post_id INT,
    category_id INT,
    PRIMARY KEY (post_id, category_id),
    FOREIGN KEY (post_id) REFERENCES Post(post_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
