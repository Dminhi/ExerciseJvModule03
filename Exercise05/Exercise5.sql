CREATE DATABASE IF NOT EXISTS demo;
USE demo;
CREATE TABLE IF NOT EXISTS Products (
                                        Id INT AUTO_INCREMENT PRIMARY KEY,
                                        productCode VARCHAR(20) NOT NULL,
    productName VARCHAR(50) NOT NULL,
    productPrice DECIMAL(10, 2) NOT NULL,
    productAmount INT NOT NULL,
    productDescription TEXT,
    productStatus VARCHAR(20) NOT NULL
    );
INSERT INTO Products (productCode, productName, productAmount, productPrice, productDescription, productStatus)
VALUES
    ('C001', 'Toyota', 2022, 25000.00, 'Blue', 'Available'),
    ('C002',  'Honda', 2021, 35000.00, 'Red', 'Sold'),
    ('C003',  'Ford', 2023, 20000.00, 'Silver', 'Available'),
    ('C004',  'Chevrolet', 2022, 28000.00, 'Black', 'Available');

use demo;
drop index index_name on Products;
drop index index_name_price on Products;
explain analyze select * from Products where Id=3;
create unique index index_name on Products(productCode);
create index index_name_price on Products(productname,productprice);
explain analyze select * from Products where Id=3;
create view view_name as select productCode,productName,productPrice,productStatus from Products;
alter view view_name as
select productCode,productName,productPrice,productStatus,productAmount from Products;
drop view view_name;
delimiter //
create procedure display_all ()
begin  select * from Products; end //
delimiter ;
call display_all();
delimiter //
create procedure add_product(code varchar(20),name varchar(50),price decimal(10,2),amount int,description varchar(255),status varchar(20))
begin insert into Products(productcode, productname, productprice, productamount, productdescription, productstatus)
      values (code,name,price,amount,description,status) ;
end //
delimiter ;
call add_product('C005','Mercedes',50000,2000,'Black','Available');

delimiter //
create procedure edit_product(id_product int,code varchar(20),name varchar(50),price decimal(10,2),amount int,description varchar(255),status varchar(20))
begin update Products set productCode = code,
                          productName = name,
                          productPrice = price,
                          productAmount = amount,
                          productDescription = description,
                          productStatus = status where Id=id_product;
end //
delimiter ;
call edit_product(2,'C006','RollRoyce',30000,1999,'Yello','Sold');

delimiter //
create procedure delete_product(id_product int)
begin delete from Products where Id = id_product;
end //
delimiter ;
call delete_product(2);
