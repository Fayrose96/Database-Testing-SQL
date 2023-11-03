-- creating a database
CREATE DATABASE database_assignment;


--  before working on a database, you need to select it 
USE database_assignment;

-- creating a table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    phone VARCHAR(15),
    address VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(2),
    points INT
);

-- showing the table
SELECT * FROM customers;

-- inserting data/record into a table
INSERT INTO customers (first_name, last_name, dob, phone, address, city, state, points)
VALUES
    ('Babara', 'MacCaffrey', '1986-03-28', '781-932-9754', '0 Sage Terrace', 'Waltham', 'MA', 2273),
    ('Ines', 'Brushfield', '1986-04-13', '804-427-9456', '14187 Commercial Trail', 'Hampton', 'VA', 947),
    ('Freddi', 'Boagey', '1985-02-07', '719-724-7869', '251 Springs Junction', 'Colorado Springs', 'CO', 2967),
    ('Ambur', 'Roseburgh', '1974-04-14', '407-231-8017', '30 Arapahoe Terrace', 'Orlando', 'FL', 457),
    ('Clemmie', 'Betchley', '1973-11-07', NULL, '5 Spohn Circle', 'Arlington', 'TX', 3675);

-- Showinf Members whose Points > 1000
SELECT * FROM customers WHERE points > 1000 LIMIT 2;

-- finding Customers Born Between 1980-1990 or Points < 1000
SELECT * FROM customers WHERE (YEAR(dob) BETWEEN 1980 AND 1990) OR (points < 1000);

-- ordering by Points in Ascending Order
SELECT * FROM customers ORDER BY points ASC;

-- finding Customers Whose Name Contains 'burgh'using a regular expresion
SELECT * FROM customers WHERE last_name REGEXP 'burgh';

-- finding a Customer Without Phone Number
SELECT * FROM customers WHERE phone IS NULL;

-- changing 'Date of Birth' Column Name to 'dob'
ALTER TABLE customers CHANGE COLUMN dob dob DATE;

-- showing the table
SELECT * FROM customers;

-- Finding the Max Point Holder Customer Name
SELECT * FROM customers WHERE points =(SELECT MAX(points) FROM customers);

-- Executing a Query for Membership Categories
SELECT 
    first_name,
    points,
CASE
WHEN points < 1000 THEN ' Bronze'
WHEN points >= 1000 AND points < 2000 THEN 'Silver'
WHEN points >= 2000 AND points < 3000 THEN 'Gold'
WHEN points >= 3000 THEN 'Platinum'
END AS membership_category FROM customers;













