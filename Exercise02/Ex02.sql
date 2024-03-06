create database QuanLyBanHang;
use QuanLyBanHang;
create table Customer(
cID int primary key auto_increment,
cName varchar(50) not null,
cAge int check(cAge>0)
);
create table Order1(
oID int primary key auto_increment,
oDate datetime default current_timestamp,
cID int,
foreign key (cID) references Customer(cID),
oPrice double
);
create table Product(
pID int primary key auto_increment,
pName varchar(50) not null,
pPrice double
);
create table Orderdetail(
oID int,
pID int,
odQTY int,
foreign key(oID)references Order1(oID),
foreign key(pID) references Product(pID),
primary key(oID,pID)
)
