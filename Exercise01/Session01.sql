create database if not exists student_management;
use student_management;
create table if not exists class(
id int, name varchar(255));
create table if not exists teacher(
id int, name varchar(255), country varchar(255), age int);