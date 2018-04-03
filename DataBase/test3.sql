-- Exam table holds the data for Exam
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

-- Course table holds the data of a course
create table Course(
Course_ID int not null identity(1,1),
Course_Name varchar(100) not null,
Credit_Hours int not null,
Course_Description varchar(255),
primary key (Course_ID)
)

-- holds the Data of certain topic
create table Topic(
Topic_ID int not null identity(1,1),
Course_ID int not null,
Topic_Description varchar(200)not null,
_week int,
primary key (Topic_ID),
foreign key (Course_ID) references Course
)

-- Please Add commment explains the work of this table
create table Course_EM(
ECourse_ID int ,
Midterm int,
Lab int,
Quiz int,
Final int,
primary key (ECourse_ID),
foreign key(ECourse_ID) references Course
)

-- This table hold the questions
create table Questions_Bank(
Question_ID int identity(1,1),
Question_Text varchar(255),
Expected_Time int,
Difficulty_Level int,
Question_Frequency int default(0),
Thinking_Skills varchar(200),
Question_Mark int,
primary key(Question_ID)
)


--This table hold the Answer of certain Question
create table Question_Answers(
Question_ID int not null,
Answer_ID int identity (1,1),
Answer_Text varchar(200),
is_trueAnswer bit,
primary key(Question_ID,Answer_ID),
foreign key (Question_ID) references Questions_Bank 
)


-- This table hold the ILOs of certain topic
create table ILOS(
ILOs_ID int identity(1,1),
ILOs_Description varchar(200),
primary key(ILOs_ID)
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


create table Course_User(
CourseID int,  
UserID nvarchar(128),
Semester varchar(200),
primary key(CourseID,UserID,Semester),
foreign key (CourseID) references Course,
foreign key (UserID) references AspNetUsers
)


create table Topic_Question(
Topic_ID int not null,
Question_ID int not null,
primary key(Topic_ID,Question_ID),
foreign key (Topic_ID) references Topic,
foreign key (Question_ID) references Questions_Bank,
)

create table Topic_ILOS(
Topic_ID int not null,
ILOs_ID int not null,
primary key(Topic_ID,ILOs_ID),
foreign key (Topic_ID) references Topic,
foreign key (ILOs_ID) references ILOS,
)




alter table Course_User
add _Drop bit default(0),
Prohibited bit default(0)




