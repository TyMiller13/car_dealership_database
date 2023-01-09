-- CAR DEALERSHIP -- DDL

--CREATE TABLES FROM ERD 



--create customer table

CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(20) NOT null,
	last_name VARCHAR(20) NOT null,
	email VARCHAR(50) NOT null,
	address VARCHAR(50) NOT null,
	city VARCHAR(30) NOT null,
	state VARCHAR(30) NOT null
);
--DROP TABLE IF EXISTS customer CASCADE ;

SELECT * 
FROM customer;

--create salesman table

CREATE TABLE salesman (
	salesman_id SERIAL PRIMARY KEY,
	first_name VARCHAR(20) NOT null,
	last_name VARCHAR(20) NOT null,
	email VARCHAR(50) NOT null,
	username VARCHAR(20) NOT null
);
--DROP TABLE IF EXISTS salesman CASCADE ;

SELECT *
FROM salesman;

--create mechanic table

CREATE TABLE mechanic (
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(20) NOT null,
	last_name VARCHAR(20) NOT null,
	email VARCHAR(50) NOT null,
	username VARCHAR(20) NOT null
);
--DROP TABLE IF EXISTS mechanic CASCADE ;

SELECT *
FROM mechanic;


--create car table

CREATE TABLE car (
	car_id SERIAL PRIMARY KEY,
	year_ INTEGER NOT null,
	make VARCHAR(20) NOT null,
	model VARCHAR(20) NOT null,
	color VARCHAR(20),
	vehicle_type VARCHAR(20),
	price NUMERIC(9,2) NOT null,
	customer_id INTEGER,
	FOREIGN KEY (customer_id) REFERENCES "customer" (customer_id),
	salesman_id INTEGER,
	FOREIGN KEY (salesman_id) REFERENCES "salesman"	(salesman_id)
);
--DROP TABLE IF EXISTS car CASCADE ;

SELECT *
FROM car;


--create invoice table

CREATE TABLE invoice (
	invoice_id SERIAL PRIMARY KEY,
	date_of_purchase TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	price_of_purchase NUMERIC(9,2),
	customer_id INTEGER,
	FOREIGN KEY (customer_id) REFERENCES "customer" (customer_id),
	car_id INTEGER,
	FOREIGN KEY (car_id) REFERENCES "car" (car_id),
	salesman_id INTEGER,
	FOREIGN KEY (salesman_id) REFERENCES "salesman"	(salesman_id)
);

SELECT *
FROM invoice;


-- create service ticket table

CREATE TABLE service_ticket (
	service_ticket_id SERIAL PRIMARY KEY,
	date_of_service TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	service_description TEXT,
	customer_id INTEGER,
	FOREIGN KEY (customer_id) REFERENCES "customer" (customer_id),
	car_id INTEGER,
	FOREIGN KEY (car_id) REFERENCES "car" (car_id),
	mechanic_id INTEGER,
	FOREIGN KEY (mechanic_id) REFERENCES "mechanic"	(mechanic_id)
);

SELECT *
FROM service_ticket;


-- add column to service ticket to store cost of service done

ALTER TABLE service_ticket 
ADD COLUMN service_cost NUMERIC(7,2);

-- add column to customer that stores whether the customer is a service reward member
