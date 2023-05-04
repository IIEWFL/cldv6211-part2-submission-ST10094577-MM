USE MASTER 
IF EXISTS (SELECT * FROM sys.databases WHERE name ='RIDEdb') 
DROP DATABASE RIDEdb
CREATE DATABASE RIDEdb
USE RIDEdb


--TABLE CREATION SECTION
CREATE TABLE car_make (
id INT PRIMARY KEY,
description VARCHAR(250)
);

CREATE TABLE car_bodytype (
id INT PRIMARY KEY,
description VARCHAR(250) NOT NULL
);


CREATE TABLE car (
car_id INT IDENTITY(1,1) PRIMARY KEY,
car_no VARCHAR(250) NOT NULL ,
car_make VARCHAR(250)NOT NULL,
car_bodytype VARCHAR(250) NOT NULL, 
model VARCHAR(250) NOT NULL,
kilometres_travelled  INT NOT NULL,
service_kilometres INT  NOT NULL,
available VARCHAR(250) NOT NULL

);

CREATE TABLE inspector (
inspector_id INT IDENTITY(1,1) PRIMARY KEY,
inspector_no VARCHAR(250)  NOT NULL,
name VARCHAR(250) NOT NULL,
email VARCHAR(250) NOT NULL,
mobile  INT 
);

CREATE TABLE driver (
driver_id INT IDENTITY (1,1) PRIMARY KEY,
name VARCHAR(250) NOT NULL,
address VARCHAR(250) NOT NULL,
email VARCHAR(250) NOT NULL,
mobile INT  NOT NULL,
);

CREATE TABLE rental (
rental_id INT IDENTITY(1,1) PRIMARY KEY,
rental_fee INT  NOT NULL,
inspector VARCHAR(250) NOT NULL,
name VARCHAR(250) NOT NULL,
car_no VARCHAR(250) NOT NULL,
start_date DATE  NOT NULL,
end_date DATE
);

 CREATE TABLE [return](
 return_id INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
 car_no VARCHAR(250) NOT NULL,
 inspector VARCHAR(250) NOT NULL,
 [name] VARCHAR(250) NOT NULL,
 return_date DATE,
 elapsed_date INT NOT NULL,
 fine INT
 );

 INSERT INTO car_make(id,description)VALUES (1,'Hyundai'),
                                            (2,'BMW'),
                                            (3,'Mercedes_benz'),
                                            (4,'Toyota'),
                                            (5,'Ford');

INSERT INTO car_bodytype (id,description) VALUES (1,'Hatchback'),
                                                 (2,'Sedan'),
                                                 (3,'Coupe'),
                                                 (4,'SUV');

INSERT INTO car( car_no, car_make, model, car_bodytype, kilometres_travelled, service_kilometres, available)
VALUES('HYU001', 'Hyundai',' Grand i10 1.0 Motion', 'Hatchback ','1500', ' 15000 ','yes'),
	  ('HYU002', 'Hyundai','i20 1.2 Fluid ', 'Hatchback',' 3000','1500',' yes'),
      ('BMW001', 'BMW',' 320d 1.2 ','Sedan',' 20000',' 50000','yes'),
      ('BMW002',' BMW ','240d 1.4','Sedan',' 9500',' 15000','yes'),
      ('TOY001',' Toyota', ' Corolla 1.0',' Sedan',' 15000','50000','yes'),
      ('TOY002',' Toyota',' Avanza 1.0',' SUV',' 98000',' 15000',' yes'),
      ('TOY003', ' Toyota ','Corolla Quest 1.0', 'Sedan', ' 15000',' 50000',' yes'),
      ('MER001',' Mercedes Benz','c180',' Sedan',' 5200',' 15000',' yes'),
      ('MER002',' Mercedes Benz','A200 Sedan',' Sedan',' 4080',' 15000','yes'),
	  ('FOR001',' Ford',' Fiesta 1.0 ','Sedan',' 7600','15000',' yes');

INSERT INTO inspector (inspector_no, [name] , email, mobile)
VALUES ('I101',' Bud Barnes',' bud@therideyourent.com',' 0821585359'),
       ('I102', 'Tracy Reeves', 'tracy@therideyourent.com',' 0822889988'),
       ('I103', 'Sandra Goodwin', 'sandra@therideyourent.com', ' 0837695468'),
       ('I104', 'Shannon Burke', 'shannon@therideyourent.com',' 0836802514');

INSERT INTO driver ([name], address, email, mobile)
VALUES ('Gabrielle Clarke',' 917 Heuvel St Botshabelo Free State 9781','gorix10987@macauvpn.com',' 0837113269'),
       ('Geoffrey Franklin', '1114 Dorp St Paarl Western Cape 7655','noceti8743@drlatvia.com',' 0847728052'),
       ('Fawn Cooke',' 2158 Prospect St Garsfontein Gauteng 0042', 'yegifav388@enamelme.com',' 0821966584'),
       ('Darlene Peters', '2529 St. John Street Somerset West Western Cape 7110', 'mayeka4267@macauvpn.com',' 0841221244'),
       ('Vita Soto',' 1474 Wolmarans St Sundra Mpumalanga 2200', 'wegog55107@drlatvia.com', '0824567924'),
       ('Opal Rehbein', ' 697 Thutlwa St Letaba Limpopo 0870', 'yiyow34505@enpaypal.com', ' 082686493'),
       ('Vernon Hodgson', '1935 Thutlwa St Letsitele Limpopo 0885', 'gifeh11935@enamelme.com',' 0855991446'),
       ('Crispin Wheatly', '330 Sandown Rd Cape Town Western Cape 8018', 'likon78255@macauvpn.com',' 0838347945'),
       ('Melanie Cunningham', '616 Loop St Atlantis Western Cape 7350', 'sehapeb835@macauvpn.com',' 0827329001'),
       ('Kevin Peay',' 814 Daffodil Dr Elliotdale Eastern Cape 5118','xajic53991@enpaypal.com',' 0832077149');


INSERT INTO [return] (car_no, inspector,[name], return_date, elapsed_date, fine)
VALUES ('HYU001',' Bud Barnes', 'Gabrielle Clarke',' 2021-08-31','0',' 0'),
       ('HYU002',' Bud Barnes',' Gabrielle Clarke','2021-09-10','0',' 0'),
       ('FOR001','Bud Barnes',' Geoffrey Franklin',' 2021-09-10','0',' 0'),
       ('BMW002', 'Tracy Reeves',' Vita Soto',' 2021-09-30','5','2500'),
       ('TOY002',' Tracy Reeves',' Darlene Peters',' 2021-10-31','2','1000'),
       ('MER001 ','Sandra Goodwin ','Darlene Peters ','2021-10-15','1',' 500'),
       ('HYU002','Shannon Burke',' Vernon Hodgson',' 2022-02-10','0',' 0'),
       ('TOY003',' Shannon Burke',' Melanie Cunningham','2021-08-31','0',' 0');

INSERT INTO rental (car_no, inspector, [name], rental_fee, [start_date], end_date)
VALUES ('HYU001',' Bud Barnes', 'Gabrielle Clarke',' 5000',' 2021-08-30',' 2021-08-31'),
       ('HYU002','Bud Barnes', ' Gabrielle Clarke',' 5000',' 2021-09-01', ' 2021-09-10'),
       ('FOR001',' Bud Barnes', 'Geoffrey Franklin',' 6500',' 2021-09-01',' 2021-09-10'),
       ('BMW002',' Tracy Reeves',' Vita Soto ','7000',' 2021-09-20',' 2021-09-25'),
       ('TOY002',' Tracy Reeves',' Darlene Peters',' 5000',' 2021-10-03',' 2021-10-31'),
       ('MER001',' Sandra Goodwin',' Darlene Peters',' 8000', '2021-10-05',' 2021-10-15'),
       ('HYU002',' Shannon Burke', 'Vernon Hodgson',' 5000', '2021-12-01',' 2022-02-10'),
       ('TOY003',' Shannon Burke',' Melanie Cunningham','5000',' 2021-08-10 ','2021-08-31');

SELECT *
FROM rental
WHERE start_date >= '2021-08-01' AND end_date <= '2021-10-30';


SELECT * 
FROM rental
WHERE inspector = 'Bud Barnes';

SELECT *
FROM car
WHERE  car_make ='Toyota';

SELECT COUNT(*)
FROM car
WHERE car_make = 'Hyundai';


UPDATE car
SET model = 'FOCUS'
WHERE car_no = 'FOR001';


SELECT c.car_no, r.name, r.rental_fee, r.start_date, r.end_date, c.available
FROM car c , rental r;


SELECT DISTINCT (car_make) 
FROM car
WHERE available = 'yes';

SELECT car_no, kilometres_travelled, service_kilometres 
FROM Car 
WHERE (service_kilometres - kilometres_travelled) <= 9000;


DECLARE @finePerDay DECIMAL(10,2) = 500.00;

SELECT car_no, name, return_date, elapsed_date, fine, 
       CASE WHEN return_date <= GETDATE() THEN DATEDIFF(DAY, return_date, GETDATE()) * @finePerDay
            ELSE 0 END AS fine
FROM [return];