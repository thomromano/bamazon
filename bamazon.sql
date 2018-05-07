DROP DATABASE IF EXISTS Bamazon;
CREATE DATABASE Bamazon;
USE Bamazon;

-- Create a table called 'products' to contain the store inventory --
CREATE TABLE products (
	item_id INTEGER(11) AUTO_INCREMENT NOT NULL,
	product_name VARCHAR(30) NOT NULL,
	department_name VARCHAR(20) NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	stock_quantity INTEGER(11) NOT NULL,
	PRIMARY KEY (item_id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES  ('Bounty Paper Towels', 'Household', 15.97, 500),
		('Miracle Grow Potting Mix, 8 Quart', 'Lawn & Garden', 5.30, 62),
		('Jacks Thin Crust Pepperoni Pizza', 'Grocery', 2.98, 300),
		('Fujifilm X-T20 Mirrorless Digital Camera', 'Electronics', 990.99, 2),
		('Dr. Strange Blu-ray', 'Movies & Music', 19.99, 80),
		('Cascade Platinum Dishwasher Detergent', 'Household', 15.99, 100),
		('Perky-Pet Panorama Bird Feeder', 'Lawn & Garden', 30.45, 45),
		('Ferrero Rocher Fine Hazelnut Chocolates, 48 Count', 'Grocery', 14.07, 200),
		('Beats by Dre Wireless Headphones', 'Electronics', 279.95, 47),
		('Abbey Road 12" LP', 'Movies & Music', 20.99, 30),
		