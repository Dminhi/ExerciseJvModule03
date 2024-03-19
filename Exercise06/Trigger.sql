create database shoping_management;
use shoping_management;
create table users(
                      id int primary key auto_increment,
                      name varchar(50),
                      address varchar(255),
                      phone varchar(11),
                      dataOfBirth datetime,
                      status bit
);
create table products(
                         id_product int primary key auto_increment,
                         product_name varchar(50),
                         price double,
                         stock int,
                         status bit);
create table shopping_cart(
                              id_cart int primary key  auto_increment,
                              user_id int,
                              product_id int,
                              foreign key (user_id)references users(id),
                              foreign key (product_id)references products(id_product),
                              quantity int,
                              amount double
);

delimiter //
create trigger changeAmount
    after update
    on products
    for each row
begin
    update shopping_cart set amount = quantity * NEW.price where product_id = NEW.id_product;
end //
//delimiter ;


delimiter //
create trigger delete_product
    before delete
    on products
    for each row
begin
    delete from shopping_cart where product_id = OLD.id_product;
end;
// delimiter ;


delimiter //
create trigger update_quantity
    after update
    on shopping_cart
    for each row
begin
    update products set stock = stock-NEW.quantity+OLD.quantity where id_product = NEW.product_id;
end //
// delimiter ;

delimiter //
create trigger insert_quantity_after
    after insert
    on shopping_cart
    for each row
begin
    update products set stock = stock-NEW.quantity where id_product = NEW.product_id;
end //
// delimiter ;

