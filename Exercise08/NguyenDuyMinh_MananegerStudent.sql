CREATE DATABASE IF NOT EXISTS NguyenDuyMinh_StudenManagerment;
use NguyenDuyMinh_StudenManagerment;
USE your_name_machine;

CREATE TABLE Class (
    ClassID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName NVARCHAR(MAX) NOT NULL,
    StartDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Status BIT
);

CREATE TABLE Student (
    StudentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StudentName NVARCHAR(30) NOT NULL,
    Address NVARCHAR(50),
    Phone VARCHAR(20),
    Status BIT DEFAULT 1,
    ClassID INT NOT NULL,
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

CREATE TABLE Subject (
    SubID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubName NVARCHAR(30) NOT NULL,
    Credit TINYINT NOT NULL DEFAULT 1 CHECK (Credit >= 1),
    Status BIT DEFAULT 1
);

CREATE TABLE Mark (
    MarkID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubID INT NOT NULL,
    StudentID INT NOT NULL,
    Mark FLOAT DEFAULT 0 CHECK (Mark BETWEEN 0 AND 100),
    FOREIGN KEY (SubID) REFERENCES Subject(SubID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
INSERT INTO Class (ClassName, StartDate, Status) VALUES
                                                     ('A1', '2008-12-20', 1),
                                                     ('A2', '2008-12-22', 1),
                                                     ('B3', CURRENT_DATE(), 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassID) VALUES
                                                                       ('Hung', 'Ha Noi', '0912113113', 1, 1),
                                                                       ('Hoa', 'Hai Phong', NULL, 1, 1),
                                                                       ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject (SubName, Credit, Status) VALUES
                                                  ('CF', 5, 1),
                                                  ('C', 6, 1),
                                                  ('HDJ', 5, 1),
                                                  ('RDBMS', 10, 1);

INSERT INTO Mark (SubID, StudentID, Mark, ExamTimes) VALUES
                                                         (1, 1, 8, 1),
                                                         (1, 2, 10, 2),
                                                         (2, 1, 12, 1);
-- Thêm ràng buộc khóa ngoại cho cột ClassID của bảng Student
ALTER TABLE Student
    ADD CONSTRAINT FK_Student_ClassID FOREIGN KEY (ClassID) REFERENCES Class(ClassID);

-- Thêm ràng buộc cho cột StartDate của bảng Class là ngày hiện hành
ALTER TABLE Class
    ADD CONSTRAINT CK_Class_StartDate CHECK (StartDate = CURRENT_DATE());

-- Thêm ràng buộc mặc định cho cột Status của bảng Student là 1
ALTER TABLE Student
    ALTER COLUMN Status SET DEFAULT 1;

-- Thêm ràng buộc khóa ngoại cho bảng Mark
ALTER TABLE Mark
    ADD CONSTRAINT FK_Mark_SubID FOREIGN KEY (SubID) REFERENCES Subject(SubID),
ADD CONSTRAINT FK_Mark_StudentID FOREIGN KEY (StudentID) REFERENCES Student(StudentID);
-- a. Thay đổi mã lớp (ClassID) của sinh viên có tên ‘Hung’ thành 2
UPDATE Student
SET ClassID = 2
WHERE StudentName = 'Hung';

-- b. Cập nhật cột phone trên bảng sinh viên là ‘No phone’ cho những sinh viên chưa có số điện thoại
UPDATE Student
SET Phone = 'No phone'
WHERE Phone IS NULL OR Phone = '';

-- c. Nếu trạng thái của lớp (Status) là 0 thì thêm từ ‘New’ vào trước tên lớp
UPDATE Class
SET ClassName = CONCAT('New ', ClassName)
WHERE Status = 0;

-- d. Nếu trạng thái của status trên bảng Class là 1 và tên lớp bắt đầu là ‘New’ thì thay thế ‘New’ bằng ‘old’
UPDATE Class
SET ClassName = REPLACE(ClassName, 'New', 'Old')
WHERE Status = 1 AND ClassName LIKE 'New%';

-- e. Nếu lớp học chưa có sinh viên thì thay thế trạng thái là 0 (status=0)
UPDATE Class
SET Status = 0
WHERE ClassID NOT IN (SELECT DISTINCT ClassID FROM Student);

-- f. Cập nhật trạng thái của môn học (bảng subject) là 0 nếu môn học đó chưa có sinh viên dự thi
UPDATE Subject
SET Status = 0
WHERE SubID NOT IN (SELECT DISTINCT SubID FROM Mark);
