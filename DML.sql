-- ADD ROWS TO EACH TABLE IN DATABASE
-- INCLUDE 2 INSERTS FROM STORED PROCEDURE(S)

SELECT *
FROM customer;
--create procedure to add customers to customer table
CREATE OR REPLACE PROCEDURE add_customer(first_name VARCHAR(20), last_name VARCHAR(20), email VARCHAR(50), address VARCHAR(50), city VARCHAR(30), state VARCHAR(30))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO customer(first_name, last_name, email, address, city, state)
	VALUES (first_name, last_name, email, address, city, state);
END;
$$;

CALL add_customer('Tyler', 'Miller', 'tymiller@fake.com', '2131 Miller Lane', 'Sioux Falls', 'South Dakota'); 
CALL add_customer('Jermaine', 'Cole', 'jcole@coleworld.com', '3637 Forest Hills Drive', 'Fayetteville', 'North Carolina'); 
CALL add_customer('Tom', 'Brady', 'TB12@GOAT.com', '1212 Brady Street', 'Tampa Bay', 'Florida'); 


--create procedure to add mechanic to mechanic table
SELECT *
FROM mechanic
ORDER BY mechanic_id;

CREATE OR REPLACE PROCEDURE add_mechanic(first_name VARCHAR(20), last_name VARCHAR(20), email VARCHAR(50), username VARCHAR(20))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO mechanic(first_name, last_name, email, username)
	VALUES (first_name, last_name, email, username);
END;
$$;

CALL add_mechanic('Ryan', 'Gonzales', 'RyanG@fakey.com', 'RyanG4');
CALL add_mechanic('Michael', 'Lockett', 'MLockett@jourrapide.com', 'RyanG4');
CALL add_mechanic('Ruby', 'Scott', 'RubyJScott@teleworm.us', 'RScott654');

-- updated username on mechanic 
UPDATE mechanic 
SET username = 'MLock21'
WHERE mechanic_id = 2;

--create procedure to add salesman to salesman table
SELECT *
FROM salesman;

CREATE OR REPLACE PROCEDURE add_salesman(first_name VARCHAR(20), last_name VARCHAR(20), email VARCHAR(50), username VARCHAR(20))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO salesman(first_name, last_name, email, username)
	VALUES (first_name, last_name, email, username);
END;
$$;

CALL add_salesman('Tim', 'Smith', 'TimSmith@carsales.com', 'TimmyS48');
CALL add_salesman('Joel', 'Greenberg', 'JoelGreenberg@carsales.com', 'JGreenberg23');
CALL add_salesman('Emma', 'Jones', 'EmmaJones@carsales.com', 'EmmaJ14');

-- create procedure for car
SELECT *
FROM car; 

CREATE OR REPLACE PROCEDURE add_car(year_ INTEGER, make VARCHAR(20), model VARCHAR(20), color VARCHAR(20), vehicle_type VARCHAR(20), price NUMERIC(9,2), customer_id INTEGER, salesman_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO car(year_, make, model, color, vehicle_type, price, customer_id, salesman_id)
	VALUES (year_, make, model, color, vehicle_type, price, customer_id, salesman_id);
END;
$$;

CALL add_car(2023, 'Mercedes-Benz', 'G550', 'Black', 'SUV', 139900.00, 1, 2);
CALL add_car(2023, 'Bugatti', 'Veyron', 'Blue', 'Car', 2000000.00, 3, 1);
CALL add_car(2023, 'Tesla', 'Model X', 'Black', 'SUV', 112590.00, 2, 3);


-- create procedure for invoice

SELECT *
FROM invoice;

CREATE OR REPLACE PROCEDURE add_invoice(date_of_purchase TIMESTAMP, price_of_purchase NUMERIC(9,2), customer_id INTEGER, car_id INTEGER, salesman_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO invoice(date_of_purchase, price_of_purchase, customer_id, car_id, salesman_id)
	VALUES (date_of_purchase, price_of_purchase, customer_id, car_id, salesman_id);
END;
$$;

INSERT INTO invoice(date_of_purchase, price_of_purchase, customer_id, car_id, salesman_id)
VALUES (NOW(), 139900.00, 1, 3, 2);

INSERT INTO invoice(date_of_purchase, price_of_purchase, customer_id, car_id, salesman_id)
VALUES (NOW(), 2000000.00, 3, 2, 1);

INSERT INTO invoice(date_of_purchase, price_of_purchase, customer_id, car_id, salesman_id)
VALUES (NOW(), 112590.00, 2, 1, 3);

--CALL add_invoice(NOW(), 139900.00, 1, 3, 2);

-- create procedure for service ticket

SELECT *
FROM service_ticket;


	INSERT INTO service_ticket(date_of_service, service_description, customer_id, car_id, mechanic_id, service_cost)
	VALUES (NOW(), 'oil change', 2, 1, 2, 75.00);

	INSERT INTO service_ticket(date_of_service, service_description, customer_id, car_id, mechanic_id, service_cost)
	VALUES (NOW(), 'oil change, new tires, air filter', 1, 3, 1, 3500.00);



