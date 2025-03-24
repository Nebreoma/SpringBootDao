DROP DATABASE IF EXISTS netology_usersdb;

CREATE DATABASE netology_test;

USE netology_usersdb;

CREATE TABLE IF NOT EXISTS CUSTOMERS
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    surname VARCHAR(20) NOT NULL,
    age INT,
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    CONSTRAINT cust_chk_age CHECK (age > 1),
    CONSTRAINT cust_chk_email CHECK (phone_number REGEXP '[+]?[0-9]{1,3} ?\\(?[0-9]{3}\\)? ?[0-9]{2}[0-9 -]+[0-9]{2}')
);

ALTER TABLE CUSTOMERS AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS ORDERS
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    date DATETIME NOT NULL DEFAULT now(),
    customer_id BIGINT NOT NULL,
    product_name VARCHAR(30) NOT NULL,
    amount INT NOT NULL CHECK (amount > 0),
    CONSTRAINT orders_chk_date CHECK (date > '1900-01-01'),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS (id)
);

insert into CUSTOMERS(name, surname, age, phone_number)
values ('Иван', 'Иванов', 35, '8(495)555-55-55');
insert into CUSTOMERS(name, surname, age, phone_number)
values ('Грегор', 'Петров', 17, '8(495)666-66-66');
insert into CUSTOMERS(name, surname, age, phone_number)
values ('Игорь', 'Борисович', 3, '123456789');
insert into CUSTOMERS(name, surname, age)
values ('Ольга', 'Орлова', 71);

insert into ORDERS(customer_id, product_name, amount)
values (2, 'phone', 1000);
insert into ORDERS(customer_id, product_name, amount)
values (2, 'cup', 400);
insert into ORDERS(customer_id, product_name, amount)
values (1, 'flower', 350);
insert into ORDERS(customer_id, product_name, amount)
values (3, 'steak', 50);