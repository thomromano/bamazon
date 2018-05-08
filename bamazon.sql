DROP DATABASE IF EXISTS Bamazon;
CREATE DATABASE Bamazon;
USE Bamazon;

-- Create a table called 'products' to contain the store inventory --
CREATE TABLE products (
	item_id INTEGER AUTO_INCREMENT NOT NULL,
	product_name VARCHAR(100) NOT NULL,
	department_name VARCHAR(55) NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	stock_quantity INTEGER(11) NOT NULL,
	PRIMARY KEY (item_id)
);


INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES  ('Bounty Paper Towels', 'Household', 15.25, 50),
		('Miracle Grow Potting Mix,
        8 Quart', 'Lawn & Garden', 5.30, 62),
		('Jacks Thin Crust Pepperoni Pizza', 'Grocery', 2.50, 300),
		('Fujifilm X-T20 Mirrorless Digital Camera', 'Electronics', 990.00, 2),
		('Dr. Strange Blu-ray', 'Movies & Music', 19.90, 80),
		('Cascade Platinum Dishwasher Detergent', 'Household', 15.75, 10),
		('Perky-Pet Panorama Bird Feeder', 'Lawn & Garden', 30.45, 45),
		('Ferrero Rocher Fine Hazelnut Chocolates, 48 Count', 'Grocery', 14.20, 20),
		('Beats by Dre Wireless Headphones', 'Electronics', 279.00, 47),
		('Abbey Road 12" LP', 'Movies & Music', 20.50, 30);

Select * from products;		