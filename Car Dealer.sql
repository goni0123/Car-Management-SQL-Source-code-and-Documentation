--CREATING DATABASE
USE MASTER
GO
--now we are able to delete database, if exists
if (DB_ID('CAR_DEALERSHIP') is not null)
drop database CAR_DEALERSHIP
go
--RECREATING DATABASE
CREATE DATABASE CAR_DEALERSHIP
GO
--USE OF DATABASE
USE CAR_DEALERSHIP
GO 
--TABLE CREATION
CREATE TABLE Location (
    locid   VARCHAR(5) PRIMARY KEY,
	--define not null as a constraint
    locname VARCHAR(10) CONSTRAINT locname_not_null NOT NULL
)
GO
--TABLE CREATION
CREATE TABLE salesman (
    sid            VARCHAR(5) PRIMARY KEY,
	--define not null as a constraint for all three atributes
    sname          VARCHAR(10) CONSTRAINT sname_not_null NOT NULL,
    ssurname       VARCHAR(10) CONSTRAINT ssurname_not_null NOT NULL,
    stype          VARCHAR(5) CONSTRAINT stype_not_null NOT NULL,
)
GO
--TABLE CREATION
CREATE TABLE car (
    carid          VARCHAR(5) PRIMARY KEY,
	--define not null as a constraint
    carmark        VARCHAR(10) CONSTRAINT carmark_not_null NOT NULL,
  	--define not null as a constraint
    carmodel       VARCHAR(10) CONSTRAINT carmodel_not_null NOT NULL,
    caryear        DATE,
    new_or_used    CHAR(4),	
	--define not null as a constraint
	cprice         NUMERIC(10, 2) CONSTRAINT cprice_not_null NOT NULL,
    cardetail      VARCHAR(10),
)
GO
--TABLE CREATION
CREATE TABLE client (
    cid                     VARCHAR(5) PRIMARY KEY,
	--define not null as a constraint
    cname                   VARCHAR(10) CONSTRAINT cname_not_null NOT NULL,
	--define not null as a constraint
    csurname                VARCHAR(10) CONSTRAINT csurname_not_null NOT NULL,
    ccountry                VARCHAR(10),
	--define not null as a constraint
    caddres                 VARCHAR(10) CONSTRAINT caddres_not_null NOT NULL,
    cphone                  NUMERIC(10),
    cemail                  VARCHAR(15),

);
--TABLE CREATION
CREATE TABLE customervisit (
    cvid                           VARCHAR(5) PRIMARY KEY,
	--define not null as a constraint
    visitdate                      DATE CONSTRAINT visitdate_not_null NOT NULL,
    testdrive                      CHAR(1),
    visitdetail                    VARCHAR(10),
)
GO
--TABLE CREATION
CREATE TABLE deal (
    did                            VARCHAR(5) PRIMARY KEY,
	--define not null as a constraint for all three atributes
    saleprice                      NUMERIC(10, 2) CONSTRAINT saleprice_not_null NOT NULL,
    deliverydate                   DATE CONSTRAINT deliverydate_not_null NOT NULL,
    saledate                       DATE CONSTRAINT saledate_not_null NOT NULL,
  
)
GO
--Relational integrity, defining the foreign keys this
--part also can be defined inside the table creation
ALTER TABLE Salesman ADD
CONSTRAINT Location_FK FOREIGN KEY (locid) REFERENCES Location
GO
ALTER TABLE car ADD
CONSTRAINT Location_FK FOREIGN KEY (locid) REFERENCES Location
GO
ALTER TABLE client ADD
CONSTRAINT salesman_FK FOREIGN KEY (sid) REFERENCES Salesman
GO
ALTER TABLE customervisit ADD
CONSTRAINT salesman_FK FOREIGN KEY (sid) REFERENCES Salesman,
CONSTRAINT client_FK FOREIGN KEY (cid) REFERENCES client
GO
ALTER TABLE deal ADD
CONSTRAINT salesman_FK FOREIGN KEY (sid) REFERENCES Salesman,
CONSTRAINT client_FK FOREIGN KEY (cid) REFERENCES client,
CONSTRAINT car_FK FOREIGN KEY (carid) REFERENCES car
GO
