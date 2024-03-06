use QuanLySinhVien;
insert into Class (ClassName,StartDate,Status)
values ('A1','2008-12-20',1),
	   ('A2','2008-02-22',1),
       ('B3',current_date(),0);
insert into Student (StudentName,Address,Phone,Status,ClassId)
values ('Hung','Ha noi','0912113113',1,1),
	   ('Hoa','Hai phong','',1,1),
       ('Manh','HCM','0123123123',0,2);
insert into Subject (SubName,Credit,Status)
values ('CF',5,1),
	   ('C',6,1),
       ('HDJ',5,1),
       ('RDBMS',10,1);
insert into Mark (SubId,StudentId,Mark,ExamTimes)
values (1,1,8,1),
	   (1,2,10,2),
       (2,1,12,1);
select * from Student where status = true;
select * from Subject where Credit<10;
select S.StudentId, S.StudentName, C.ClassName
from Student S join Class C on S.ClassId = C.ClassID;
select S.StudentId,S.StudentName,C.ClassName
from Student S join Class C on S.ClassId = C.ClassID
where C.ClassName = 'A1';
select S.StudentId, S.StudentName, Sub.SubName, M.Mark, C.ClassName
from Student S
join Class C on S.ClassId = C.ClassID
join Mark M on S.StudentId = M.StudentId 
join Subject Sub on M.SubId = Sub.SubId
where Sub.SubName = 'CF';
select * from Student where Student.StudentName like 'h%';
select * from Class where month(StartDate)=12;
select * from subject where credit between 3 and 5;
update Student set ClassId = 2 where StudentName = 'Hung';
select S.StudentName,Sub.SubName,M.Mark
from Student S
join Mark M on S.StudentId = M.StudentId
join Subject Sub on M.SubId = Sub.SubId
order by M.Mark DESC;

       
 