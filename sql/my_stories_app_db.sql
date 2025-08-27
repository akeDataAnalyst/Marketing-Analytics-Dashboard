-- Create a new database
CREATE DATABASE my_stories_app_db;

-- Use the new database
USE my_stories_app_db;

-- Create the campaigns table
CREATE TABLE campaigns (
    campaign_id INT,
    campaign_name VARCHAR(255),
    platform VARCHAR(50),
    cost INT,
    start_date DATE,
    end_date DATE
);

-- Create the users table
CREATE TABLE users (
    user_id INT,
    signup_date DATE,
    country VARCHAR(50),
    acquisition_channel VARCHAR(255)
);

-- Create the app_events table
CREATE TABLE app_events (
    user_id INT,
    event_name VARCHAR(255),
    timestamp DATETIME
);