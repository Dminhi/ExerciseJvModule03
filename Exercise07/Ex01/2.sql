insert into students (studentname,age,email)
value ('Nguyen Quang An', 18,'an@yahoo.com'),
	  ('Nguyen Cong Vinh', 20,'vinh@yahoo.com'),
	  ('Nguyen Van Quyen', 19,'quyen'),
	  ('Pham Thanh Binh', 25,'binh@com'),
	  ('Nguyen Van Tai Em', 30,'taiem@sport.vn');
insert into classes(classname)
value ('C0706L'),('C0708G');
insert into classstudent(studentid,classid)
value(1,1),(2,1),(3,1),(4,2),(5,2);
insert into subject(subjectsid,subjectsname)
value(1,'SQL'),(2,'Java'),(3,'C'),(4,'Visual Basic');
insert into marks (mark,subjectid,studentid)
value(8,1,1),(4,2,1),(9,1,1),(7,1,3),(3,1,4),(5,2,5),(8,3,3),(1,3,5),(3,2,4);



