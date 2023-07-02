DROP DATABASE northwind_dw;
CREATE DATABASE northwind_dw;
USE northwind_dw;

-- ****************************************************
-- *                    DT_SHIPPER                    *
-- ****************************************************
create table DT_SHIPPER (
   id_shipper  INTEGER(11) not null,
   companyName VARCHAR(40),
   constraint PK_DT_SHIPPER primary key (id_shipper)
);


-- ****************************************************
-- *                  DT2_CITYCOUNTRY                 *
-- ****************************************************
create table DT2_CITYCOUNTRY (
   id_city INTEGER(11) not null,
   city    VARCHAR(15),
   country VARCHAR(15),
   constraint PK_DT2_CITYCOUNTRY primary key (id_city)
);


-- ****************************************************
-- *                   DT2_TERRITORY                  *
-- ****************************************************
create table DT2_TERRITORY (
   id_territory         VARCHAR(20) not null,
   territoryDescription VARCHAR(50),
   region               INTEGER(11),
   regionDescription    VARCHAR(50),
   constraint PK_DT2_TERRITORY primary key (id_territory)
);


-- ****************************************************
-- *                   DT_ORDERDATE                   *
-- ****************************************************
create table DT_ORDERDATE (
   id_orderDate INTEGER(11) not null,
   orderDate    DATE,
   month        VARCHAR(20),
   quarter      INTEGER(5),
   year         INTEGER(5),
   constraint PK_DT_ORDERDATE primary key (id_orderDate)
);


-- ****************************************************
-- *                    DT_CUSTOMER                   *
-- ****************************************************
create table DT_CUSTOMER (
   id_customer   INTEGER(11) not null,
   customer      VARCHAR(5),
   companyName   VARCHAR(40),
   contactName   VARCHAR(30),
   contactTitle  VARCHAR(30),
   address       VARCHAR(60),
   postalCode    VARCHAR(10),
   customer_city INTEGER(11) not null,
   constraint PK_DT_CUSTOMER primary key (id_customer)
);

alter table DT_CUSTOMER
   add constraint R_citycountry1
   foreign key (customer_city) references DT2_CITYCOUNTRY (id_city);


-- ****************************************************
-- *                    DT_EMPLOYEE                   *
-- ****************************************************
create table DT_EMPLOYEE (
   id_employee   INTEGER(11) not null,
   fullName      VARCHAR(40),
   title         VARCHAR(30),
   address       VARCHAR(60),
   salary        VARCHAR(20),
   sex           VARCHAR(5),
   supervisor    INTEGER(11),
   employee_city INTEGER(11) not null,
   constraint PK_DT_EMPLOYEE primary key (id_employee)
);

alter table DT_EMPLOYEE
   add constraint R_EMPLOYEECITY
   foreign key (employee_city) references DT2_CITYCOUNTRY (id_city);


-- ****************************************************
-- *                    DT_PRODUCT                    *
-- ****************************************************
create table DT_PRODUCT (
   id_product          INTEGER(11) not null,
   productName         VARCHAR(40),
   quantityPerUnit     VARCHAR(20),
   rangeUnitPrice      VARCHAR(40),
   unitPrice           DECIMAL(10, 4),
   discontinued        BOOLEAN,
   category            INTEGER(11),
   categoryName        VARCHAR(15),
   categoryDescription MEDIUMTEXT,
   supplier            INTEGER(11),
   companyName         VARCHAR(40),
   contactName         VARCHAR(30),
   contactTitle        VARCHAR(30),
   address             VARCHAR(60),
   postalCode          VARCHAR(10),
   supplier_city       INTEGER not null,
   constraint PK_DT_PRODUCT primary key (id_product)
);

alter table DT_PRODUCT
   add constraint R_suppliercity
   foreign key (supplier_city) references DT2_CITYCOUNTRY (id_city);


-- ****************************************************
-- *              BRIDGE_EMPLOYTERRITORY              *
-- ****************************************************
create table BRIDGE_EMPLOYTERRITORY (
   employee  INTEGER(11) not null,
   territory VARCHAR(20) not null,
   constraint PK_BRIDGE_EMPLOYTERRITORY primary key (employee, territory)
);

alter table BRIDGE_EMPLOYTERRITORY
   add constraint R_bridge
   foreign key (territory) references DT2_TERRITORY (id_territory);

alter table BRIDGE_EMPLOYTERRITORY
   add constraint R_bridge2
   foreign key (employee) references DT_EMPLOYEE (id_employee);


-- ****************************************************
-- *                  FT_ORDERDETAILS                 *
-- ****************************************************
create table FT_ORDERDETAILS (
   id_customer  INTEGER(11) not null,
   id_employee  INTEGER(11) not null,
   id_product   INTEGER(11) not null,
   id_shipper   INTEGER(11) not null,
   id_orderDate INTEGER(11) not null,
   quantity     DOUBLE,
   freight      DECIMAL(10, 4),
   daysToShip   INTEGER(5),
   price        DECIMAL(10, 4),
   totalPrice   DECIMAL(10, 4),
   count        INTEGER(5),
   constraint PK_FT_ORDERDETAILS primary key (id_customer, id_employee, id_product, id_shipper, id_orderDate)
);

alter table FT_ORDERDETAILS
   add constraint R_OrderDate
   foreign key (id_orderDate) references DT_ORDERDATE (id_orderDate);

alter table FT_ORDERDETAILS
   add constraint R_Customer
   foreign key (id_customer) references DT_CUSTOMER (id_customer);

alter table FT_ORDERDETAILS
   add constraint R_PRODUCT
   foreign key (id_product) references DT_PRODUCT (id_product);

alter table FT_ORDERDETAILS
   add constraint R_SHIPPER
   foreign key (id_shipper) references DT_SHIPPER (id_shipper);

alter table FT_ORDERDETAILS
   add constraint R_EMPLOYEE
   foreign key (id_employee) references DT_EMPLOYEE (id_employee);


-- ****************************************************
-- *                 NAVIGATE_EMPLOYEE                *
-- ****************************************************
create table NAVIGATE_EMPLOYEE (
   supervisor INTEGER(11) not null,
   employee   INTEGER(11) not null,
   level      INTEGER(3),
   leaf       BOOLEAN,
   constraint PK_NAVIGATE_EMPLOYEE primary key (supervisor, employee)
);

alter table NAVIGATE_EMPLOYEE
   add constraint NAVIGATE1
   foreign key (supervisor) references DT_EMPLOYEE (id_employee);

alter table NAVIGATE_EMPLOYEE
   add constraint NAVIGATE2
   foreign key (employee) references DT_EMPLOYEE (id_employee);


