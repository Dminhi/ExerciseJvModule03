create database QuanLySinhVien;
use QuanLySinhVien;
create table Subject(
subjectsid int(4) primary key auto_increment,
subjectsname nvarchar(50) not null
);
create table classes(
classid int(4) primary key auto_increment,
classname varchar(50) not null
);
create table students(
studentid int(4) primary key auto_increment,
studentname varchar(50) not null,
age int(4) not null,
email varchar(100) not null
);
create table classstudent(
studentid int,
classid int,
foreign key(studentid) references students(studentid),
foreign key(classid) references classes(classid)
);
create table marks(
mark int(4),
subjectid int,
studentid int,
foreign key(studentid) references students(studentid),
foreign key(subjectid) references Subject(subjectsid)
);
