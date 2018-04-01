
create table Exam(

Exam_ID int identity(1,1),
Course_ID int,
Exam_Time int not null,
Exam_Date varchar not null,
Exam_Semester varchar(128)not null,
Exam_Type varchar(128),
number_Of_Students int,
Exam_Period int ,
Exam_Notes varchar(200),
primary key(Exam_ID)
)



create table Students_Exams(
Student_ID nvarchar(128),
Exam_ID int,
Exam_Result int DEFAULT(-1), 
primary key(Exam_ID,Student_ID),
foreign key(Exam_ID) references  Exam,
foreign key(Student_ID) references  AspNetUsers,
)


create table Student_Answers(
Exam_ID int, 
Student_ID nvarchar(128),
Question_ID int ,
Student_Answer bit,
primary key(Exam_ID,Student_ID,Question_ID),
foreign key(Exam_ID,Student_ID) references  Students_Exams,
foreign key(Question_ID) references  Questions_Bank(Question_ID)
)




alter table Course_User
add _Drop bit default(0),
Prohibited bit default(0)



