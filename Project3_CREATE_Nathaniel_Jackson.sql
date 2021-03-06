--Nathaniel Jackson: I did not work with a team
--Project3, table creation
DROP TABLE PURCHASE;
DROP TABLE COMPONENT;
DROP TABLE WAREHOUSEEMPLOYEE;
DROP TABLE STORE;
DROP TABLE WAREHOUSECUSTOMER;
DROP TABLE BICYCLE;
DROP TABLE ADDRESS;
DROP TABLE PAINT;
DROP TABLE MODEL;
DROP TABLE PART;

CREATE TABLE PART (
    PARTID NUMBER(38,0) NOT NULL PRIMARY KEY,
    PARTNAME VARCHAR2(30),
    MANUFACTURERNAME VARCHAR2(30),
    DESCRIPTION VARCHAR2(1000),
    LISTPRICE VARCHAR2(30),
    ESTIMATEDCOST VARCHAR2(30)
);

CREATE TABLE MODEL (
    MODELID NUMBER(38,0) NOT NULL PRIMARY KEY,
    MODELNAME VARCHAR2(30)
);

CREATE TABLE PAINT (
    PAINTID NUMBER(38,0) NOT NULL PRIMARY KEY,
    COLORNAME VARCHAR2(30),
    COLORSTYLE VARCHAR2(30),
    COLORLIST VARCHAR2(30),
    DATEINTRODUCED DATE,
    DATEDISCONTINUED DATE
);

CREATE TABLE ADDRESS (
    ADDRESSID NUMBER(38,0) NOT NULL PRIMARY KEY,
    ADDRESS VARCHAR2(300),
    CITY VARCHAR2(100),
    STATE VARCHAR2(30),
    ZIP VARCHAR2(30),
    COUNTRY VARCHAR2(30)
);

CREATE TABLE BICYCLE (
    SERIALNUMBER NUMBER(38,0) NOT NULL PRIMARY KEY,
    MODELID NUMBER(38, 0) NOT NULL,
    PAINTID NUMBER(38, 0) NOT NULL,
    FRAMESIZE VARCHAR2(30),
    FOREIGN KEY (MODELID) REFERENCES MODEL(MODELID),
    FOREIGN KEY (PAINTID) REFERENCES PAINT(PAINTID)
);

CREATE TABLE WAREHOUSECUSTOMER (
    CUSTOMERID NUMBER(38,0) NOT NULL PRIMARY KEY,
    CUSTOMERNAME VARCHAR2(30),
    PHONE VARCHAR2(30),
    ADDRESSID NUMBER(38, 0) NOT NULL,
    FOREIGN KEY (ADDRESSID) REFERENCES ADDRESS(ADDRESSID)
);

CREATE TABLE STORE (
    STOREID NUMBER(38,0) NOT NULL PRIMARY KEY,
    STORENAME VARCHAR2(100),
    PHONE VARCHAR2(30),
    ADDRESSID NUMBER(38, 0) NOT NULL,
    FOREIGN KEY (ADDRESSID) REFERENCES ADDRESS(ADDRESSID)
);

CREATE TABLE WAREHOUSEEMPLOYEE (
    EMPLOYEEID NUMBER(38,0) NOT NULL PRIMARY KEY,
    EMPLOYEENAME VARCHAR2(30),
    HOMEPHONE VARCHAR2(30),
    HIREDATE DATE,
    RELEASEDATE DATE,
    ADDRESSID NUMBER(38, 0) NOT NULL,
    FOREIGN KEY (ADDRESSID) REFERENCES ADDRESS(ADDRESSID)
);

CREATE TABLE COMPONENT (
    COMPONENTID NUMBER(38,0) NOT NULL PRIMARY KEY,
    QUANTITY VARCHAR2(30),
    COST VARCHAR2(30),
    DATEINSTALLED DATE,
    BICYCLESERIALNUMBER NUMBER(38, 0) NOT NULL,
    EMPLOYEEID NUMBER(38, 0) NOT NULL,
    PARTID NUMBER(38, 0) NOT NULL,
    FOREIGN KEY (BICYCLESERIALNUMBER) REFERENCES BICYCLE(SERIALNUMBER),
    FOREIGN KEY (EMPLOYEEID) REFERENCES WAREHOUSEEMPLOYEE(EMPLOYEEID),
    FOREIGN KEY (PARTID) REFERENCES PART(PARTID)
);

CREATE TABLE PURCHASE (
    PURCHASEID NUMBER(38,0) NOT NULL PRIMARY KEY,
    LISTPRICE VARCHAR2(30),
    SALEPRICE VARCHAR2(30),
    SALESTAX VARCHAR2(30),
    SHIPPRICE VARCHAR2(30),
    ORDERDATE DATE,
    STARTDATE DATE,
    SHIPDATE DATE,
    BICYCLESERIALNUMBER NUMBER(38, 0) NOT NULL,
    CUSTOMERID NUMBER(38, 0) NOT NULL,
    STOREID NUMBER(38, 0) NOT NULL,
    EMPLOYEEID NUMBER(38, 0) NOT NULL,
    FOREIGN KEY (BICYCLESERIALNUMBER) REFERENCES BICYCLE(SERIALNUMBER),
    FOREIGN KEY (CUSTOMERID) REFERENCES WAREHOUSECUSTOMER(CUSTOMERID),
    FOREIGN KEY (STOREID) REFERENCES STORE(STOREID),
    FOREIGN KEY (EMPLOYEEID) REFERENCES WAREHOUSEEMPLOYEE(EMPLOYEEID)
);
/
