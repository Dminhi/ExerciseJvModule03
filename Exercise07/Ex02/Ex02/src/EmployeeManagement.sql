CREATE DATABASE IF NOT EXISTS EmployeeManagement;
use EmployeeManagement;
-- Bảng Department

CREATE TABLE Department
(
    Id   INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE CHECK (LENGTH(Name) >= 6)
);

-- Bảng Levels
CREATE TABLE Levels
(
    Id              INT AUTO_INCREMENT PRIMARY KEY,
    Name            VARCHAR(100) NOT NULL UNIQUE,
    BasicSalary     FLOAT        NOT NULL CHECK (BasicSalary >= 3500000),
    AllowanceSalary FLOAT DEFAULT 500000
);

-- Bảng Employee
CREATE TABLE Employee
(
    Id           INT AUTO_INCREMENT PRIMARY KEY,
    Name         VARCHAR(150) NOT NULL,
    Email        VARCHAR(150) NOT NULL UNIQUE,
    Phone        VARCHAR(50)  NOT NULL UNIQUE,
    Address      VARCHAR(255),
    Gender       TINYINT      NOT NULL CHECK (Gender IN (0, 1, 2)),
    BirthDay     DATE         NOT NULL,
    LevelId      INT          NOT NULL,
    DepartmentId INT          NOT NULL,
    FOREIGN KEY (LevelId) REFERENCES Levels (Id),
    FOREIGN KEY (DepartmentId) REFERENCES Department (Id)
);

-- Bảng Timesheets
CREATE TABLE Timesheets
(
    Id             INT AUTO_INCREMENT PRIMARY KEY,
    AttendanceDate DATETIME       default current_timestamp,
    EmployeeId     INT   NOT NULL,
    Value          FLOAT NOT NULL DEFAULT 1 CHECK (Value IN (0, 0.5, 1)),
    FOREIGN KEY (EmployeeId) REFERENCES Employee (Id)
);

-- Bảng Salary
CREATE TABLE Salary
(
    Id          INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeId  INT   NOT NULL,
    BonusSalary FLOAT DEFAULT 0,
    Insurrance  FLOAT NOT NULL,
    FOREIGN KEY (EmployeeId) REFERENCES Employee (Id)
);
-- Dữ liệu mẫu cho bảng Department
INSERT INTO Department (Name)
VALUES ('IT Department'),
       ('HR Department'),
       ('Finance Department');

-- Dữ liệu mẫu cho bảng Levels
INSERT INTO Levels (Name, BasicSalary)
VALUES ('Junior', 3500000),
       ('Intermediate', 4000000),
       ('Senior', 4500000);



-- Dữ liệu mẫu cho bảng Salary
INSERT
INTO Salary (EmployeeId, Insurrance)
VALUES (1, 10),
       (2, 8),
       (3, 9);

INSERT INTO Employee (Name, Email, Phone, Address, Gender, BirthDay, LevelId, DepartmentId)
VALUES
    ('John Doe', 'john.doe@example.com', '123456789', '123 Main St, City', 1, '1990-01-15', 1, 1),
    ('Jane Smith', 'jane.smith@example.com', '987654321', '456 Oak St, City', 0, '1988-03-22', 2, 1),
    ('Bob Johnson', 'bob.johnson@example.com', '555111222', '789 Pine St, City', 1, '1995-07-10', 3, 2),
    ('Alice Brown', 'alice.brown@example.com', '777888999', '101 Cedar St, City', 0, '1992-11-05', 2, 2),
    ('Charlie Wilson', 'charlie.wilson@example.com', '333444555', '202 Elm St, City', 1, '1987-09-18', 1, 1),
    ('Eva Davis', 'eva.davis@example.com', '999000111', '303 Birch St, City', 0, '1993-04-30', 3, 2),
    ('David White', 'david.white@example.com', '666777888', '404 Maple St, City', 1, '1989-12-02', 2, 1),
    ('Grace Miller', 'grace.miller@example.com', '444555666', '505 Walnut St, City', 0, '1994-06-15', 1, 2),
    ('Frank Lee', 'frank.lee@example.com', '222333444', '606 Oak St, City', 1, '1986-02-25', 3, 1),
    ('Olivia Taylor', 'olivia.taylor@example.com', '111222333', '707 Pine St, City', 0, '1991-08-12', 2, 2),
    ('William Harris', 'william.harris@example.com', '888999000', '808 Main St, City', 1, '1985-10-08', 1, 1),
    ('Sophia Moore', 'sophia.moore@example.com', '333222111', '909 Cedar St, City', 0, '1996-03-17', 3, 2),
    ('Michael Clark', 'michael.clark@example.com', '555444333', '111 Oak St, City', 1, '1984-07-21', 2, 1),
    ('Emily Baker', 'emily.baker@example.com', '777666555', '222 Pine St, City', 0, '1997-01-29', 1, 2),
    ('Daniel King', 'daniel.king@example.com', '999888777', '333 Elm St, City', 1, '1983-05-06', 3, 1);


select *, DATEDIFF(CURDATE(), BirthDay) / 365 AS Age from Employee order by Name;

