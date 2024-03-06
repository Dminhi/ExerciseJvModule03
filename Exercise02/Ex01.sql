create database if not exists qlbh;
use qlbh;
create table PHIEUXUAT(
soPX int primary key auto_increment, NgayXuat datetime default current_timestamp
);
create table PHIEUNHAP(
SoPN int primary key auto_increment, NgapNhap datetime default current_timestamp
);
create table NHACC(
MaNCC int primary key auto_increment, TenNCC varchar(50) not null,DiaChi varchar(100) not null,SDT varchar(11) not null unique
);
create table DONDH(MaNCC int, foreign key (MaNCC)references NHACC(MaNCC),
SoDH int primary key auto_increment, NgayDH datetime default current_timestamp
);
 create table VATTU(
 MaVTU int primary key auto_increment, TenVTU varchar(50) not null
 );
 create table PHIEUXUATDetail(
 PXDetail_id int primary key auto_increment,
 DGXuat double, SLXuat int,
 soPX int, foreign key (soPX) references PHIEUXUAT(soPX),
 MaVTU int, foreign key(MaVTU) references VATTU(MaVTU)
 );
 create table PHIEUNHAPDetail(
 PNDetail_id int primary key auto_increment,
 DGNhap double, SLNhap int,
 soPN int, foreign key (soPN) references PHIEUNHAP(soPN),
 MaVTU int, foreign key(MaVTU) references VATTU(MaVTU)
 );
 create table DONDHDetail(
 DONDHDetail_id int primary key auto_increment,
 SoDH int , foreign key(SoDH) references DONDH(SoDH),
 MaVTU int, foreign key(MaVTU) references VATTU(MaVTU)
 );
 
 
 
 