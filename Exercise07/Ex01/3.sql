use QuanLySinhVien;
select * from students;
select * from subject;
select s.studentid,s.studentname,avg(m.mark) averageMark
from students s join marks m on s.studentid=m.studentid
group by s.studentid;
select sub.subjectsid, sub.subjectsname,max(m.mark)
from subject sub join marks m on sub.subjectsid = m.subjectid
group by sub.subjectsid;
select m.mark, s.studentname,sub.subjectsname, row_number()over(order by mark desc) as 'rank'
from marks m
join students s
on m.studentid = s.studentid
join subject sub
on sub.subjectsid = m.subjectid
order by m.mark desc;
alter table subject
modify column subjectsname varchar(1000);
update subject
set subjectsname = concat('Đây là môn học : ',subjectsname);
alter table students
modify column age int check(age between 15 and 50);
alter table classstudent
drop foreign key classstudent_ibfk_1,
drop foreign key classstudent_ibfk_2;
alter table marks
drop foreign key marks_ibfk_1,
drop foreign key marks_ibfk_2;
delete from students
where studentid = 1;
alter table students
drop column status;
alter table students
add column status bit default 1;
update students
set status = 0;