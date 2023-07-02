-- Populate aggregate table view_customercity_productcateg
INSERT INTO `view_customercity_productcateg` (
    `dt2_citycountry_Customer_Count`,
    `dt2_citycountry_Customer_City`,
    `dt_product_CategoryDescription`,
    `dt_product_CategoryName`,
    `dt_product_Category`,
    `ft_orderdetails_Count`,
    `ft_orderdetails_Quantity_SUM`,
    `ft_orderdetails_Quantity_AVG`,
    `ft_orderdetails_Freight_AVG`,
    `ft_orderdetails_Freight_SUM`,
    `ft_orderdetails_DaysToShip`,
    `ft_orderdetails_TotalPrice`,
    `ft_orderdetails_Price`,
    `ft_orderdetails_fact_count`)
select
    `dt2_citycountry`.`country` as `dt2_citycountry_Customer_Count`,
    `dt2_citycountry`.`city` as `dt2_citycountry_Customer_City`,
    `dt_product`.`categoryDescription` as `dt_product_CategoryDescription`,
    `dt_product`.`categoryName` as `dt_product_CategoryName`,
    `dt_product`.`category` as `dt_product_Category`,
    sum(`ft_orderdetails`.`count`) as `ft_orderdetails_Count`,
    sum(`ft_orderdetails`.`quantity`) as `ft_orderdetails_Quantity_SUM`,
    avg(`ft_orderdetails`.`quantity`) as `ft_orderdetails_Quantity_AVG`,
    avg(`ft_orderdetails`.`freight`) as `ft_orderdetails_Freight_AVG`,
    sum(`ft_orderdetails`.`freight`) as `ft_orderdetails_Freight_SUM`,
    avg(`ft_orderdetails`.`daysToShip`) as `ft_orderdetails_DaysToShip`,
    sum(`ft_orderdetails`.`totalPrice`) as `ft_orderdetails_TotalPrice`,
    sum(`ft_orderdetails`.`price`) as `ft_orderdetails_Price`,
    count(*) as `ft_orderdetails_fact_count`
from
    `ft_orderdetails` as `ft_orderdetails`,
    `dt2_citycountry` as `dt2_citycountry`,
    `dt_customer` as `dt_customer`,
    `dt_product` as `dt_product`
where
    `ft_orderdetails`.`id_customer` = `dt_customer`.`id_customer`
and
    `dt_customer`.`customer_city` = `dt2_citycountry`.`id_city`
and
    `ft_orderdetails`.`id_product` = `dt_product`.`id_product`
group by
    `dt2_citycountry`.`country`,
    `dt2_citycountry`.`city`,
    `dt_product`.`categoryDescription`,
    `dt_product`.`categoryName`,
    `dt_product`.`category`;



-- Populate aggregate table view_month_shipper
INSERT INTO `view_month_shipper` (
    `dt_orderdate_Year`,
    `dt_orderdate_Quarter`,
    `dt_orderdate_Month`,
    `dt_shipper_Shipper_Company_Nam`,
    `dt_shipper_Shipper_Id`,
    `ft_orderdetails_Count`,
    `ft_orderdetails_Quantity_SUM`,
    `ft_orderdetails_Quantity_AVG`,
    `ft_orderdetails_Freight_AVG`,
    `ft_orderdetails_Freight_SUM`,
    `ft_orderdetails_DaysToShip`,
    `ft_orderdetails_TotalPrice`,
    `ft_orderdetails_Price`,
    `ft_orderdetails_fact_count`)
select
    `dt_orderdate`.`year` as `dt_orderdate_Year`,
    `dt_orderdate`.`quarter` as `dt_orderdate_Quarter`,
    `dt_orderdate`.`month` as `dt_orderdate_Month`,
    `dt_shipper`.`companyName` as `dt_shipper_Shipper_Company_Nam`,
    `dt_shipper`.`id_shipper` as `dt_shipper_Shipper_Id`,
    sum(`ft_orderdetails`.`count`) as `ft_orderdetails_Count`,
    sum(`ft_orderdetails`.`quantity`) as `ft_orderdetails_Quantity_SUM`,
    avg(`ft_orderdetails`.`quantity`) as `ft_orderdetails_Quantity_AVG`,
    avg(`ft_orderdetails`.`freight`) as `ft_orderdetails_Freight_AVG`,
    sum(`ft_orderdetails`.`freight`) as `ft_orderdetails_Freight_SUM`,
    avg(`ft_orderdetails`.`daysToShip`) as `ft_orderdetails_DaysToShip`,
    sum(`ft_orderdetails`.`totalPrice`) as `ft_orderdetails_TotalPrice`,
    sum(`ft_orderdetails`.`price`) as `ft_orderdetails_Price`,
    count(*) as `ft_orderdetails_fact_count`
from
    `ft_orderdetails` as `ft_orderdetails`,
    `dt_orderdate` as `dt_orderdate`,
    `dt_shipper` as `dt_shipper`
where
    `ft_orderdetails`.`id_orderDate` = `dt_orderdate`.`id_orderDate`
and
    `ft_orderdetails`.`id_shipper` = `dt_shipper`.`id_shipper`
group by
    `dt_orderdate`.`year`,
    `dt_orderdate`.`quarter`,
    `dt_orderdate`.`month`,
    `dt_shipper`.`companyName`,
    `dt_shipper`.`id_shipper`;



-- Populate aggregate table view_customercity_rangeunitpri
INSERT INTO `view_customercity_rangeunitpri` (
    `dt2_citycountry_Customer_Count`,
    `dt2_citycountry_Customer_City`,
    `dt_product_RangeUnitPrice`,
    `ft_orderdetails_Count`,
    `ft_orderdetails_Quantity_SUM`,
    `ft_orderdetails_Quantity_AVG`,
    `ft_orderdetails_Freight_AVG`,
    `ft_orderdetails_Freight_SUM`,
    `ft_orderdetails_DaysToShip`,
    `ft_orderdetails_TotalPrice`,
    `ft_orderdetails_Price`,
    `ft_orderdetails_fact_count`)
select
    `dt2_citycountry`.`country` as `dt2_citycountry_Customer_Count`,
    `dt2_citycountry`.`city` as `dt2_citycountry_Customer_City`,
    `dt_product`.`rangeUnitPrice` as `dt_product_RangeUnitPrice`,
    sum(`ft_orderdetails`.`count`) as `ft_orderdetails_Count`,
    sum(`ft_orderdetails`.`quantity`) as `ft_orderdetails_Quantity_SUM`,
    avg(`ft_orderdetails`.`quantity`) as `ft_orderdetails_Quantity_AVG`,
    avg(`ft_orderdetails`.`freight`) as `ft_orderdetails_Freight_AVG`,
    sum(`ft_orderdetails`.`freight`) as `ft_orderdetails_Freight_SUM`,
    avg(`ft_orderdetails`.`daysToShip`) as `ft_orderdetails_DaysToShip`,
    sum(`ft_orderdetails`.`totalPrice`) as `ft_orderdetails_TotalPrice`,
    sum(`ft_orderdetails`.`price`) as `ft_orderdetails_Price`,
    count(*) as `ft_orderdetails_fact_count`
from
    `ft_orderdetails` as `ft_orderdetails`,
    `dt2_citycountry` as `dt2_citycountry`,
    `dt_customer` as `dt_customer`,
    `dt_product` as `dt_product`
where
    `ft_orderdetails`.`id_customer` = `dt_customer`.`id_customer`
and
    `dt_customer`.`customer_city` = `dt2_citycountry`.`id_city`
and
    `ft_orderdetails`.`id_product` = `dt_product`.`id_product`
group by
    `dt2_citycountry`.`country`,
    `dt2_citycountry`.`city`,
    `dt_product`.`rangeUnitPrice`;



-- Populate aggregate table view_customer_productdiscontin
INSERT INTO `view_customer_productdiscontin` (
    `dt2_citycountry_Customer_Count`,
    `dt2_citycountry_Customer_City`,
    `dt_customer_Customer_CompanyNa`,
    `dt_customer_Customer_ContactNa`,
    `dt_customer_Customer_ContactTi`,
    `dt_customer_Customer_Address`,
    `dt_customer_Customer_PostalCod`,
    `dt_customer_Customer`,
    `dt_product_Discontinued`,
    `ft_orderdetails_Count`,
    `ft_orderdetails_Quantity_SUM`,
    `ft_orderdetails_Quantity_AVG`,
    `ft_orderdetails_Freight_AVG`,
    `ft_orderdetails_Freight_SUM`,
    `ft_orderdetails_DaysToShip`,
    `ft_orderdetails_TotalPrice`,
    `ft_orderdetails_Price`,
    `ft_orderdetails_fact_count`)
select
    `dt2_citycountry`.`country` as `dt2_citycountry_Customer_Count`,
    `dt2_citycountry`.`city` as `dt2_citycountry_Customer_City`,
    `dt_customer`.`companyName` as `dt_customer_Customer_CompanyNa`,
    `dt_customer`.`contactName` as `dt_customer_Customer_ContactNa`,
    `dt_customer`.`contactTitle` as `dt_customer_Customer_ContactTi`,
    `dt_customer`.`address` as `dt_customer_Customer_Address`,
    `dt_customer`.`postalCode` as `dt_customer_Customer_PostalCod`,
    `dt_customer`.`customer` as `dt_customer_Customer`,
    `dt_product`.`discontinued` as `dt_product_Discontinued`,
    sum(`ft_orderdetails`.`count`) as `ft_orderdetails_Count`,
    sum(`ft_orderdetails`.`quantity`) as `ft_orderdetails_Quantity_SUM`,
    avg(`ft_orderdetails`.`quantity`) as `ft_orderdetails_Quantity_AVG`,
    avg(`ft_orderdetails`.`freight`) as `ft_orderdetails_Freight_AVG`,
    sum(`ft_orderdetails`.`freight`) as `ft_orderdetails_Freight_SUM`,
    avg(`ft_orderdetails`.`daysToShip`) as `ft_orderdetails_DaysToShip`,
    sum(`ft_orderdetails`.`totalPrice`) as `ft_orderdetails_TotalPrice`,
    sum(`ft_orderdetails`.`price`) as `ft_orderdetails_Price`,
    count(*) as `ft_orderdetails_fact_count`
from
    `ft_orderdetails` as `ft_orderdetails`,
    `dt2_citycountry` as `dt2_citycountry`,
    `dt_customer` as `dt_customer`,
    `dt_product` as `dt_product`
where
    `ft_orderdetails`.`id_customer` = `dt_customer`.`id_customer`
and
    `dt_customer`.`customer_city` = `dt2_citycountry`.`id_city`
and
    `ft_orderdetails`.`id_product` = `dt_product`.`id_product`
group by
    `dt2_citycountry`.`country`,
    `dt2_citycountry`.`city`,
    `dt_customer`.`companyName`,
    `dt_customer`.`contactName`,
    `dt_customer`.`contactTitle`,
    `dt_customer`.`address`,
    `dt_customer`.`postalCode`,
    `dt_customer`.`customer`,
    `dt_product`.`discontinued`;



-- Populate aggregate table view_orderdate_customercountry
INSERT INTO `view_orderdate_customercountry` (
    `dt_orderdate_Year`,
    `dt_orderdate_Quarter`,
    `dt_orderdate_Month`,
    `dt_orderdate_OrderDate`,
    `dt2_citycountry_Customer_Count`,
    `dt_product_CategoryDescription`,
    `dt_product_CategoryName`,
    `dt_product_Category`,
    `dt_product_Product_Id`,
    `dt2_citycountry_Employee_Count`,
    `dt2_citycountry_Employee_City`,
    `dt_employee_Employee_Id`,
    `ft_orderdetails_Count`,
    `ft_orderdetails_Quantity_SUM`,
    `ft_orderdetails_Quantity_AVG`,
    `ft_orderdetails_Freight_AVG`,
    `ft_orderdetails_Freight_SUM`,
    `ft_orderdetails_DaysToShip`,
    `ft_orderdetails_TotalPrice`,
    `ft_orderdetails_Price`,
    `ft_orderdetails_fact_count`)
select
    `dt_orderdate`.`year` as `dt_orderdate_Year`,
    `dt_orderdate`.`quarter` as `dt_orderdate_Quarter`,
    `dt_orderdate`.`month` as `dt_orderdate_Month`,
    `dt_orderdate`.`orderDate` as `dt_orderdate_OrderDate`,
    `dt2_citycountry`.`country` as `dt2_citycountry_Customer_Count`,
    `dt_product`.`categoryDescription` as `dt_product_CategoryDescription`,
    `dt_product`.`categoryName` as `dt_product_CategoryName`,
    `dt_product`.`category` as `dt_product_Category`,
    `dt_product`.`id_product` as `dt_product_Product_Id`,
    `dt2_citycountry_2`.`country` as `dt2_citycountry_Employee_Count`,
    `dt2_citycountry_2`.`city` as `dt2_citycountry_Employee_City`,
    `dt_employee`.`id_employee` as `dt_employee_Employee_Id`,
    sum(`ft_orderdetails`.`count`) as `ft_orderdetails_Count`,
    sum(`ft_orderdetails`.`quantity`) as `ft_orderdetails_Quantity_SUM`,
    avg(`ft_orderdetails`.`quantity`) as `ft_orderdetails_Quantity_AVG`,
    avg(`ft_orderdetails`.`freight`) as `ft_orderdetails_Freight_AVG`,
    sum(`ft_orderdetails`.`freight`) as `ft_orderdetails_Freight_SUM`,
    avg(`ft_orderdetails`.`daysToShip`) as `ft_orderdetails_DaysToShip`,
    sum(`ft_orderdetails`.`totalPrice`) as `ft_orderdetails_TotalPrice`,
    sum(`ft_orderdetails`.`price`) as `ft_orderdetails_Price`,
    count(*) as `ft_orderdetails_fact_count`
from
    `ft_orderdetails` as `ft_orderdetails`,
    `dt_orderdate` as `dt_orderdate`,
    `dt2_citycountry` as `dt2_citycountry`,
    `dt_customer` as `dt_customer`,
    `dt_product` as `dt_product`,
    `dt2_citycountry` as `dt2_citycountry_2`,
    `dt_employee` as `dt_employee`
where
    `ft_orderdetails`.`id_orderDate` = `dt_orderdate`.`id_orderDate`
and
    `ft_orderdetails`.`id_customer` = `dt_customer`.`id_customer`
and
    `dt_customer`.`customer_city` = `dt2_citycountry`.`id_city`
and
    `ft_orderdetails`.`id_product` = `dt_product`.`id_product`
and
    `ft_orderdetails`.`id_employee` = `dt_employee`.`id_employee`
and
    `dt_employee`.`employee_city` = `dt2_citycountry_2`.`id_city`
group by
    `dt_orderdate`.`year`,
    `dt_orderdate`.`quarter`,
    `dt_orderdate`.`month`,
    `dt_orderdate`.`orderDate`,
    `dt2_citycountry`.`country`,
    `dt_product`.`categoryDescription`,
    `dt_product`.`categoryName`,
    `dt_product`.`category`,
    `dt_product`.`id_product`,
    `dt2_citycountry_2`.`country`,
    `dt2_citycountry_2`.`city`,
    `dt_employee`.`id_employee`;



-- Populate aggregate table view_quarter_shipper_employee
INSERT INTO `view_quarter_shipper_employee` (
    `dt_orderdate_Year`,
    `dt_orderdate_Quarter`,
    `dt_shipper_Shipper_Company_Nam`,
    `dt_shipper_Shipper_Id`,
    `dt2_citycountry_Employee_Count`,
    `dt2_citycountry_Employee_City`,
    `dt_employee_Employee_Id`,
    `ft_orderdetails_Count`,
    `ft_orderdetails_Quantity_SUM`,
    `ft_orderdetails_Quantity_AVG`,
    `ft_orderdetails_Freight_AVG`,
    `ft_orderdetails_Freight_SUM`,
    `ft_orderdetails_DaysToShip`,
    `ft_orderdetails_TotalPrice`,
    `ft_orderdetails_Price`,
    `ft_orderdetails_fact_count`)
select
    `dt_orderdate`.`year` as `dt_orderdate_Year`,
    `dt_orderdate`.`quarter` as `dt_orderdate_Quarter`,
    `dt_shipper`.`companyName` as `dt_shipper_Shipper_Company_Nam`,
    `dt_shipper`.`id_shipper` as `dt_shipper_Shipper_Id`,
    `dt2_citycountry_2`.`country` as `dt2_citycountry_Employee_Count`,
    `dt2_citycountry_2`.`city` as `dt2_citycountry_Employee_City`,
    `dt_employee`.`id_employee` as `dt_employee_Employee_Id`,
    sum(`ft_orderdetails`.`count`) as `ft_orderdetails_Count`,
    sum(`ft_orderdetails`.`quantity`) as `ft_orderdetails_Quantity_SUM`,
    avg(`ft_orderdetails`.`quantity`) as `ft_orderdetails_Quantity_AVG`,
    avg(`ft_orderdetails`.`freight`) as `ft_orderdetails_Freight_AVG`,
    sum(`ft_orderdetails`.`freight`) as `ft_orderdetails_Freight_SUM`,
    avg(`ft_orderdetails`.`daysToShip`) as `ft_orderdetails_DaysToShip`,
    sum(`ft_orderdetails`.`totalPrice`) as `ft_orderdetails_TotalPrice`,
    sum(`ft_orderdetails`.`price`) as `ft_orderdetails_Price`,
    count(*) as `ft_orderdetails_fact_count`
from
    `ft_orderdetails` as `ft_orderdetails`,
    `dt_orderdate` as `dt_orderdate`,
    `dt_shipper` as `dt_shipper`,
    `dt2_citycountry` as `dt2_citycountry_2`,
    `dt_employee` as `dt_employee`
where
    `ft_orderdetails`.`id_orderDate` = `dt_orderdate`.`id_orderDate`
and
    `ft_orderdetails`.`id_shipper` = `dt_shipper`.`id_shipper`
and
    `ft_orderdetails`.`id_employee` = `dt_employee`.`id_employee`
and
    `dt_employee`.`employee_city` = `dt2_citycountry_2`.`id_city`
group by
    `dt_orderdate`.`year`,
    `dt_orderdate`.`quarter`,
    `dt_shipper`.`companyName`,
    `dt_shipper`.`id_shipper`,
    `dt2_citycountry_2`.`country`,
    `dt2_citycountry_2`.`city`,
    `dt_employee`.`id_employee`;



-- Populate aggregate table view_year_rangeunitprice_terri
INSERT INTO `view_year_rangeunitprice_terri` (
    `dt_orderdate_Year`,
    `dt_product_RangeUnitPrice`,
    `view_bridge_table_Region_(Key)`,
    `view_bridge_table_Employee_(Ke`,
    `view_bridge_table_Territory_(K`,
    `ft_orderdetails_Count`,
    `ft_orderdetails_Quantity_SUM`,
    `ft_orderdetails_Quantity_AVG`,
    `ft_orderdetails_Freight_AVG`,
    `ft_orderdetails_Freight_SUM`,
    `ft_orderdetails_DaysToShip`,
    `ft_orderdetails_TotalPrice`,
    `ft_orderdetails_Price`,
    `ft_orderdetails_fact_count`)
select
    `dt_orderdate`.`year` as `dt_orderdate_Year`,
    `dt_product`.`rangeUnitPrice` as `dt_product_RangeUnitPrice`,
    `view_bridge_table`.`region` as `view_bridge_table_Region_(Key)`,
    `view_bridge_table`.`id_employee` as `view_bridge_table_Employee_(Ke`,
    `view_bridge_table`.`id_territory` as `view_bridge_table_Territory_(K`,
    sum(`ft_orderdetails`.`count`) as `ft_orderdetails_Count`,
    sum(`ft_orderdetails`.`quantity`) as `ft_orderdetails_Quantity_SUM`,
    avg(`ft_orderdetails`.`quantity`) as `ft_orderdetails_Quantity_AVG`,
    avg(`ft_orderdetails`.`freight`) as `ft_orderdetails_Freight_AVG`,
    sum(`ft_orderdetails`.`freight`) as `ft_orderdetails_Freight_SUM`,
    avg(`ft_orderdetails`.`daysToShip`) as `ft_orderdetails_DaysToShip`,
    sum(`ft_orderdetails`.`totalPrice`) as `ft_orderdetails_TotalPrice`,
    sum(`ft_orderdetails`.`price`) as `ft_orderdetails_Price`,
    count(*) as `ft_orderdetails_fact_count`
from
    `ft_orderdetails` as `ft_orderdetails`,
    `dt_orderdate` as `dt_orderdate`,
    `dt_product` as `dt_product`,
    `view_bridge_table` as `view_bridge_table`
where
    `ft_orderdetails`.`id_orderDate` = `dt_orderdate`.`id_orderDate`
and
    `ft_orderdetails`.`id_product` = `dt_product`.`id_product`
and
    `ft_orderdetails`.`id_employee` = `view_bridge_table`.`id_employee`
group by
    `dt_orderdate`.`year`,
    `dt_product`.`rangeUnitPrice`,
    `view_bridge_table`.`region`,
    `view_bridge_table`.`id_employee`,
    `view_bridge_table`.`id_territory`;



