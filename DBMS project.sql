CREATE database vaccination;

use vaccination;

select @@SERVERNAME;

CREATE TABLE Location
(
    pincode numeric(6) PRIMARY KEY,
    area varchar(30) NOT NULL,
    city varchar(20) NOT NULL,
    state varchar(20) NOT NULL
);

CREATE TABLE Inventory
(
    I_id int PRIMARY KEY,    
	I_name varchar(100) NOT NULL,
    I_contactno numeric(10),
    I_address numeric(6) NOT NULL,
    FOREIGN KEY (I_address) REFERENCES Location(pincode) 
);

CREATE TABLE Vaccine
(
    V_name varchar(20) PRIMARY KEY,
    V_company varchar(20) NOT NULL,
    V_cost float NOT NULL
);

CREATE TABLE Hospital
(
    H_id int PRIMARY KEY,
    H_name varchar(30) NOT NULL,
    H_pwd varchar(200),
    H_contactno numeric(10),
    H_address numeric(6) NOT NULL,
    H_email varchar(30),
    H_vac varchar(20),
    FOREIGN KEY (H_address) REFERENCES Location(pincode) ,
    FOREIGN KEY (H_vac) REFERENCES Vaccine(V_name) 
);


CREATE TABLE Supplies
(
    S_id int primary key,
    S_hospital int,
    S_inventory int ,
    S_quantity numeric,
    Foreign key (S_hospital) references hospital(h_id) ,
    Foreign key (S_inventory) references inventory(i_id)
);

CREATE TABLE Person
(
    P_id int PRIMARY KEY ,
    P_name varchar(30) NOT NULL,
    P_Gender char(20) NOT NULL,
    P_DOB DATE NOT NULL,
    P_contactno numeric(10),
    P_address numeric(6),
    P_email varchar(30),
    FOREIGN KEY (P_address) REFERENCES Location(pincode) 
);


CREATE TABLE Doctor
(
    D_id int PRIMARY KEY,
    D_dept varchar(20) NOT NULL,
    FOREIGN KEY (D_id) REFERENCES Person(P_id) 
);

CREATE TABLE Vaccinates
(
    P int,
    Hosp int,
    Date_first DATE,
    Date_second DATE,
    PRIMARY KEY (P, Hosp),
    FOREIGN KEY (P) REFERENCES Person(P_id)  ,
    FOREIGN KEY (Hosp) REFERENCES Hospital(H_id)  
);


CREATE VIEW
hosp_data AS SELECT H_id, H_name, H_contactno, H_address, H_email, H_vac FROM hospital;

CREATE VIEW
vacc_data AS SELECT v.p, v.hosp, h.h_vac FROM vaccinates v JOIN hosp_data h ON h.h_id = v.hosp;

INSERT INTO Location VALUES('400029', 'Andheri', 'Mumbai', 'Maharashtra');
INSERT INTO Location VALUES('400051', 'Bandra East', 'Mumbai', 'Maharashtra');
INSERT INTO Location VALUES('400050', 'Bandra West', 'Mumbai', 'Maharashtra');
INSERT INTO Location VALUES('400069', 'Andheri East', 'Mumbai', 'Maharashtra');
INSERT INTO Location VALUES('400091', 'Borivali', 'Mumbai', 'Maharashtra');
INSERT INTO Location VALUES('400014', 'Dadar', 'Mumbai', 'Maharashtra');

INSERT INTO Inventory VALUES('1', 'Lilavati Hospital And Research Centre', '7789234121', '400050');
INSERT INTO Inventory VALUES('2', 'S L Raheja Fortis Hospital', '8056379544', '400051');
INSERT INTO Inventory VALUES('3', 'Sanghvi Hospital', '8989882310' , '400029');
INSERT INTO Inventory VALUES('4', 'Shreedhar Hospital', '9796465555', '400014');

INSERT INTO Vaccine VALUES('Covaxin', 'Bharat Biotech', '3500');
INSERT INTO Vaccine VALUES('Covishield', 'AstraZeneca', '3000');
INSERT INTO Vaccine VALUES ('Sputnik','Gamaleya National Center','1000');

INSERT INTO Hospital VALUES('1','Lilavati Hospital',NULL,'7789234121','400051',NULL,'Covaxin');
INSERT INTO Hospital VALUES('2','S L R Hospital',NULL,'8056379544','400051',NULL,'Covishield');
INSERT INTO Hospital VALUES('3','Seven Hills Hospital', NULL , '8989898456','400029',NULL,'Covaxin');
INSERT INTO Hospital VALUES('4','Phoenix Hospitals', NULL , '8934561245','400091',NULL,'Covaxin');
INSERT INTO Hospital VALUES('5','Shushrusha Citizens Hospital', NULL , '9999944454','400014',NULL,'Sputnik');

INSERT INTO Supplies VALUES('101','2','1','5000');
INSERT INTO Supplies VALUES('153','5','3','10110');
INSERT INTO Supplies VALUES('213','4','2','8000');
INSERT INTO Supplies VALUES('41','1','1','515');
INSERT INTO Supplies VALUES('36','3','3','3200');

INSERT INTO Person VALUES('1','Sarita Sen','female','1992-03-12','7845461233','400051',NULL);
INSERT INTO Person VALUES('45','Rahul Garg','male','1985-11-02','8565461213','400069',NULL);
INSERT INTO Person VALUES('23','Piya Soni','female','2005-05-15','7964313213','400014',NULL);
INSERT INTO Person VALUES('203','Mina Malhotra','female','1998-12-27','7821985485','400091',NULL);
INSERT INTO Person VALUES('78','Andrew Dsouza','male','1973-08-04','8564652344','400050',NULL);

INSERT INTO Doctor VALUES('1','A');
INSERT INTO Doctor VALUES('45','B');
INSERT INTO Doctor VALUES('23','C');
INSERT INTO Doctor VALUES('203','D');
INSERT INTO Doctor VALUES('78','A');

INSERT INTO Vaccinates VALUES('23','1','2020-08-12','2020-12-13');
INSERT INTO Vaccinates VALUES('203','2','2021-01-15','2021-04-23');
INSERT INTO Vaccinates VALUES('45','3','2020-10-09','2021-02-10');
INSERT INTO Vaccinates VALUES('1','4','2021-05-10','2021-08-14');
INSERT INTO Vaccinates VALUES('78','5','2020-12-06','2021-04-08');

SELECT * FROM Location;
SELECT * FROM Inventory;
SELECT * FROM Vaccine;
SELECT * FROM Hospital;
SELECT * FROM Supplies;
SELECT * FROM Person;
SELECT * FROM Doctor;
SELECT * FROM Vaccinates;

