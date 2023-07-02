-- Aggregate table view_customercity_productcateg
-- Estimated 2155 rows, 181020 bytes
CREATE TABLE `view_customercity_productcateg` (
    `dt2_citycountry_Customer_Count` VARCHAR(15),
    `dt2_citycountry_Customer_City` VARCHAR(15),
    `dt_product_CategoryDescription` MEDIUMTEXT,
    `dt_product_CategoryName` VARCHAR(15),
    `dt_product_Category` INT(11),
    `ft_orderdetails_Count` DOUBLE,
    `ft_orderdetails_Quantity_SUM` DOUBLE,
    `ft_orderdetails_Quantity_AVG` DOUBLE,
    `ft_orderdetails_Freight_AVG` DOUBLE,
    `ft_orderdetails_Freight_SUM` DOUBLE,
    `ft_orderdetails_DaysToShip` DOUBLE,
    `ft_orderdetails_TotalPrice` DOUBLE,
    `ft_orderdetails_Price` DOUBLE,
    `ft_orderdetails_fact_count` INTEGER);

-- Aggregate table view_month_shipper
-- Estimated 1050 rows, 54622 bytes
CREATE TABLE `view_month_shipper` (
    `dt_orderdate_Year` INT(5),
    `dt_orderdate_Quarter` INT(5),
    `dt_orderdate_Month` VARCHAR(20),
    `dt_shipper_Shipper_Company_Nam` VARCHAR(40),
    `dt_shipper_Shipper_Id` INT(11),
    `ft_orderdetails_Count` DOUBLE,
    `ft_orderdetails_Quantity_SUM` DOUBLE,
    `ft_orderdetails_Quantity_AVG` DOUBLE,
    `ft_orderdetails_Freight_AVG` DOUBLE,
    `ft_orderdetails_Freight_SUM` DOUBLE,
    `ft_orderdetails_DaysToShip` DOUBLE,
    `ft_orderdetails_TotalPrice` DOUBLE,
    `ft_orderdetails_Price` DOUBLE,
    `ft_orderdetails_fact_count` INTEGER);

-- Aggregate table view_customercity_rangeunitpri
-- Estimated 1862 rows, 111750 bytes
CREATE TABLE `view_customercity_rangeunitpri` (
    `dt2_citycountry_Customer_Count` VARCHAR(15),
    `dt2_citycountry_Customer_City` VARCHAR(15),
    `dt_product_RangeUnitPrice` VARCHAR(40),
    `ft_orderdetails_Count` DOUBLE,
    `ft_orderdetails_Quantity_SUM` DOUBLE,
    `ft_orderdetails_Quantity_AVG` DOUBLE,
    `ft_orderdetails_Freight_AVG` DOUBLE,
    `ft_orderdetails_Freight_SUM` DOUBLE,
    `ft_orderdetails_DaysToShip` DOUBLE,
    `ft_orderdetails_TotalPrice` DOUBLE,
    `ft_orderdetails_Price` DOUBLE,
    `ft_orderdetails_fact_count` INTEGER);

-- Aggregate table view_customer_productdiscontin
-- Estimated 2155 rows, 346955 bytes
CREATE TABLE `view_customer_productdiscontin` (
    `dt2_citycountry_Customer_Count` VARCHAR(15),
    `dt2_citycountry_Customer_City` VARCHAR(15),
    `dt_customer_Customer_CompanyNa` VARCHAR(40),
    `dt_customer_Customer_ContactNa` VARCHAR(30),
    `dt_customer_Customer_ContactTi` VARCHAR(30),
    `dt_customer_Customer_Address` VARCHAR(60),
    `dt_customer_Customer_PostalCod` VARCHAR(10),
    `dt_customer_Customer` VARCHAR(5),
    `dt_product_Discontinued` TINYINT(1),
    `ft_orderdetails_Count` DOUBLE,
    `ft_orderdetails_Quantity_SUM` DOUBLE,
    `ft_orderdetails_Quantity_AVG` DOUBLE,
    `ft_orderdetails_Freight_AVG` DOUBLE,
    `ft_orderdetails_Freight_SUM` DOUBLE,
    `ft_orderdetails_DaysToShip` DOUBLE,
    `ft_orderdetails_TotalPrice` DOUBLE,
    `ft_orderdetails_Price` DOUBLE,
    `ft_orderdetails_fact_count` INTEGER);

-- Aggregate table view_orderdate_customercountry
-- Estimated 2155 rows, 310320 bytes
CREATE TABLE `view_orderdate_customercountry` (
    `dt_orderdate_Year` INT(5),
    `dt_orderdate_Quarter` INT(5),
    `dt_orderdate_Month` VARCHAR(20),
    `dt_orderdate_OrderDate` DATE,
    `dt2_citycountry_Customer_Count` VARCHAR(15),
    `dt_product_CategoryDescription` MEDIUMTEXT,
    `dt_product_CategoryName` VARCHAR(15),
    `dt_product_Category` INT(11),
    `dt_product_Product_Id` INT(11),
    `dt2_citycountry_Employee_Count` VARCHAR(15),
    `dt2_citycountry_Employee_City` VARCHAR(15),
    `dt_employee_Employee_Id` INT(11),
    `ft_orderdetails_Count` DOUBLE,
    `ft_orderdetails_Quantity_SUM` DOUBLE,
    `ft_orderdetails_Quantity_AVG` DOUBLE,
    `ft_orderdetails_Freight_AVG` DOUBLE,
    `ft_orderdetails_Freight_SUM` DOUBLE,
    `ft_orderdetails_DaysToShip` DOUBLE,
    `ft_orderdetails_TotalPrice` DOUBLE,
    `ft_orderdetails_Price` DOUBLE,
    `ft_orderdetails_fact_count` INTEGER);

-- Aggregate table view_quarter_shipper_employee
-- Estimated 2155 rows, 163780 bytes
CREATE TABLE `view_quarter_shipper_employee` (
    `dt_orderdate_Year` INT(5),
    `dt_orderdate_Quarter` INT(5),
    `dt_shipper_Shipper_Company_Nam` VARCHAR(40),
    `dt_shipper_Shipper_Id` INT(11),
    `dt2_citycountry_Employee_Count` VARCHAR(15),
    `dt2_citycountry_Employee_City` VARCHAR(15),
    `dt_employee_Employee_Id` INT(11),
    `ft_orderdetails_Count` DOUBLE,
    `ft_orderdetails_Quantity_SUM` DOUBLE,
    `ft_orderdetails_Quantity_AVG` DOUBLE,
    `ft_orderdetails_Freight_AVG` DOUBLE,
    `ft_orderdetails_Freight_SUM` DOUBLE,
    `ft_orderdetails_DaysToShip` DOUBLE,
    `ft_orderdetails_TotalPrice` DOUBLE,
    `ft_orderdetails_Price` DOUBLE,
    `ft_orderdetails_fact_count` INTEGER);

-- Aggregate table view_year_rangeunitprice_terri
-- Estimated 2012 rows, 72447 bytes
CREATE TABLE `view_year_rangeunitprice_terri` (
    `dt_orderdate_Year` INT(5),
    `dt_product_RangeUnitPrice` VARCHAR(40),
    `view_bridge_table_Region_(Key)` INT(11),
    `view_bridge_table_Employee_(Ke` INT(11),
    `view_bridge_table_Territory_(K` VARCHAR(20),
    `ft_orderdetails_Count` DOUBLE,
    `ft_orderdetails_Quantity_SUM` DOUBLE,
    `ft_orderdetails_Quantity_AVG` DOUBLE,
    `ft_orderdetails_Freight_AVG` DOUBLE,
    `ft_orderdetails_Freight_SUM` DOUBLE,
    `ft_orderdetails_DaysToShip` DOUBLE,
    `ft_orderdetails_TotalPrice` DOUBLE,
    `ft_orderdetails_Price` DOUBLE,
    `ft_orderdetails_fact_count` INTEGER);

