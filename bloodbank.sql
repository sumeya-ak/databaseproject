-- Drop tables if they already exist
DROP TABLE IF EXISTS BB_Manager;
DROP TABLE IF EXISTS Blood_Donor;
DROP TABLE IF EXISTS BloodSpecimen;
DROP TABLE IF EXISTS City;
DROP TABLE IF EXISTS DiseaseFinder;
DROP TABLE IF EXISTS Hospital_Info_1;
DROP TABLE IF EXISTS Hospital_Info_2;
DROP TABLE IF EXISTS Recipient;
DROP TABLE IF EXISTS Recording_Staff;

-- Create table BB_Manager
CREATE TABLE BB_Manager (
    M_id int NOT NULL,
    mName varchar(255) NOT NULL,
    m_phNo bigint
    -- CONSTRAINT Mid_pk PRIMARY KEY (M_id)
);
-- Insert values into BB_Manager
INSERT INTO BB_Manager VALUES 
(102,'sumeya', 4693959671), 
(103,'mekhluqat', 4693959601), 
(104,'nebil', 4693959677), 
(105,'yusuf', 4693957671), 
(106,'fuad', 4694959671), 
(107,'abebe', 4695959671), 
(108,'bekele', 4663959671), 
(109,'selam', 4673959671), 
(110,'debebe', 4693859671);

-- Create table Blood_Donor
CREATE TABLE Blood_Donor (
    bd_ID int NOT NULL,
    bd_name varchar(255) NOT NULL,
    bd_age int,
    bd_sex varchar(10),
    bd_Bgroup varchar(10),
    bd_reg_date date,
    reco_ID int NOT NULL,
    City_ID int NOT NULL
    -- CONSTRAINT bdID_pk PRIMARY KEY (bd_ID)
);
-- Insert values into Blood_Donor
INSERT INTO Blood_Donor VALUES 
(150221,'sheleme',25,'M','B+','2015-12-17',101212,1100),
(160011,'temkin',35,'F','A+','2016-11-22',101212,1100),
(160101,'sami',22,'M','O+','2016-01-04',101312,1200),
(150011,'aman',29,'M','O+','2015-07-19',101412,1300),
(150021,'fiker',42,'F','A-','2015-12-24',101412,1300),
(150121,'Dan',44,'M','AB+','2015-08-28',101212,1200),
(160031,'sena',33,'F','AB-','2016-02-06',101212,1400),
(160301,'Elsa',31,'F','AB+','2016-09-10',101312,1200),
(160091,'miki',24,'M','B-','2016-10-15',101312,1500),
(160401,'chala',29,'M','O-','2016-12-17',101212,1200);

-- Create table BloodSpecimen
CREATE TABLE BloodSpecimen (
    specimen_number int NOT NULL PRIMARY KEY,
    b_group varchar(10) NOT NULL,
    status int,
    dfind_ID int NOT NULL,
    M_id int NOT NULL
);
-- Insert values into BloodSpecimen
INSERT INTO BloodSpecimen VALUES 
(1001, 'B+', 1, 11, 101),
(1002, 'O+', 1, 12, 102),
(1003, 'AB+', 1, 11, 102),
(1004, 'O-', 1, 13, 103),
(1005, 'A+', 0, 14, 101),
(1006, 'A-', 1, 13, 104),
(1007, 'AB-', 1, 15, 104),
(1008, 'AB-', 0, 11, 105),
(1009, 'B+', 1, 13, 105),
(1010, 'O+', 0, 12, 105),
(1011, 'O+', 1, 13, 103),
(1012, 'O-', 1, 14, 102),
(1013, 'B-', 1, 14, 102),
(1014, 'AB+', 0, 15, 101);

-- Create table City
CREATE TABLE City (
    City_ID int NOT NULL,
    City_name varchar(255) NOT NULL
    -- CONSTRAINT CityID_pk PRIMARY KEY (City_ID)
);
-- Insert values into City
INSERT INTO City VALUES 
(1200,'diredawa'), 
(1300,'harar'), 
(1400,'addisabeba'), 
(1500,'arbaminch'), 
(1600,'jinka'), 
(1700,'afar'), 
(1800,'akaki'), 
(1900,'bole'), 
(2000,'cherkos');

-- Create table DiseaseFinder
CREATE TABLE DiseaseFinder (
    dfind_ID int NOT NULL,
    dfind_name varchar(255) NOT NULL,
    dfind_PhNo bigint
    -- CONSTRAINT dfindID_pk PRIMARY KEY (dfind_ID)
);
-- Insert values into DiseaseFinder
INSERT INTO DiseaseFinder VALUES 
(11,'selam',4693804223), 
(12,'ababu',4693804223), 
(13,'Jerry',4693804223), 
(14,'Mark',4693804223), 
(15,'ayna',4693804223), 
(16,'iman',4693804123), 
(17,'fetiya',4693804223), 
(18,'sitra',4693804323), 
(19,'bontu',4693804423), 
(20,'kebede',4693804523);

-- Create table Hospital_Info_1
CREATE TABLE Hospital_Info_1 (
    hosp_ID int NOT NULL PRIMARY KEY,
    hosp_name varchar(255) NOT NULL,
    City_ID int NOT NULL,
    M_id int NOT NULL
);
-- Insert values into Hospital_Info_1
INSERT INTO Hospital_Info_1 VALUES 
(1,'meklitclinic',1100,101), 
(2,'teklehaymanothospital',1200,103), 
(3,'ymranclinic',1300,103),
(4,'Baylor',1400,104),
(5,'Goh',1800,103),
(6,'abeselom',1300,106),
(7,'abrehot',1300,102),
(8,'truneshbeijing',1200,106),
(9,'Pawlos',1500,109),
(10,'mentewabclinic',1700,105);

-- Create table Hospital_Info_2
CREATE TABLE Hospital_Info_2 (
    hosp_ID int NOT NULL,
    hosp_name varchar(255) NOT NULL,
    hosp_needed_Bgrp varchar(10),
    hosp_needed_qnty int,
    PRIMARY KEY (hosp_ID, hosp_needed_Bgrp)
);
-- Insert values into Hospital_Info_2
INSERT INTO Hospital_Info_2 VALUES 
(1,'meklitclinic','A+',20), 
(1,'meklitclinic','AB+',0), 
(1,'meklitclinic','A-',40), 
(1,'meklitclinic','B-',10), 
(1,'meklitclinic','AB-',20),
(2,'teklehaymanothospital','A+',40), 
(2,'teklehaymanothospital','AB+',20), 
(2,'teklehaymanothospital','A-',10), 
(2,'teklehaymanothospital','B-',30), 
(2,'teklehaymanothospital','B+',0), 
(2,'teklehaymanothospital','AB-',10), 
(3,'ymranclinic','A+',0), 
(3,'ymranclinic','AB+',0), 
(3,'ymranclinic','A-',0), 
(3,'ymranclinic','B-',20),
(3,'ymranclinic','B+',10), 
(3,'ymranclinic','AB-',0), 
(4,'Baylor','A+',10), 
(5,'abeselom','B+',30), 
(4,'Baylor','A-',40), 
(7,'abrehot','B-',40), 
(8,'truneshbeijing','B+',10), 
(9,'Pawlos','AB-',20);

-- Create table Recipient
CREATE TABLE Recipient (
    reci_ID int NOT NULL,
    reci_name varchar(255) NOT NULL,
    reci_age int,
    reci_Brgp varchar(10),
    reci_Bqnty float,
    reco_ID int NOT NULL,
    City_ID int NOT NULL,
    M_id int NOT NULL,
    reci_sex varchar(10),
    reci_reg_date date
    -- CONSTRAINT reciid_pk PRIMARY KEY (reci_id)
);
-- Insert values into Recipient
INSERT INTO Recipient VALUES 
(10001,'chala',25,'B+',1.5,101212,1100,101,'M','2015-12-17'),
(10002,'Dan',60,'A+',1,101312,1100,102,'M','2015-12-16'),
(10003,'chube',35,'AB+',0.5,101312,1200,102,'M','2015-10-17'),
(10004,'yoseph',66,'B+',1,101212,1300,104,'M','2016-11-17'),
(10005,'coba',53,'B-',1,101412,1400,105,'M','2015-04-17'),
(10006,'sehin',45,'O-',2,101512,1500,106,'M','2015-02-28');
-- Check data in BB_Manager
SELECT * FROM BB_Manager;

-- Check data in Blood_Donor
SELECT * FROM Blood_Donor;

-- Check data in BloodSpecimen
SELECT * FROM BloodSpecimen;

-- Check data in City
SELECT * FROM City;

-- Check data in DiseaseFinder
SELECT * FROM DiseaseFinder;

-- Check data in Hospital_Info_1
SELECT * FROM Hospital_Info_1;

-- Check data in Hospital_Info_2
SELECT * FROM Hospital_Info_2;

-- Check data in Recipient
SELECT * FROM Recipient;


