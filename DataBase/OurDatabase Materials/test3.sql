
-- Course table holds the data of a course
create table Course(
Course_ID int not null identity(1,1),
Course_Name varchar(100) not null,
Credit_Hours int not null,
Course_Description varchar(255),
primary key (Course_ID)
)

--University Semesters
create table Semesters(
Semster_ID int identity(1,1),
Semester int not null ,
_Year varchar(128),
primary key(Semster_ID)
)

-- hold the data about the semester courses ,courses Teacher,number of student in course and Success_rate
Create table Semester_Courses(
Semster_ID int,
Course_ID int,
UserID nvarchar(128),
Number_of_Student int,
Success_rate float,
primary key(Semster_ID,Course_ID,UserID),
foreign key(Semster_ID) references Semesters,
foreign key(Course_ID)references Course,
foreign key (UserID) references AspNetUsers
)

--hold the data about Exam
create table Exam(
Exam_ID int identity(1,1),
Course_ID int,
Semster_ID int,
Exam_Type varchar(128) check (Exam_Type in('Final','Midterm','Quiz' )) not null,
Exam_Date DATETIME  not null,
Exam_Period int ,
Exam_Notes varchar(200),
primary key(Exam_ID),
foreign key(Semster_ID)references Semesters,
foreign key(Course_ID)references Course
)

--hold the date about students courses in semester
--create table Course_Students(
--Semster_ID int,
--Course_ID int,  
--Student_ID nvarchar(128),
--_Drop bit default(0),
--Prohibited bit default(0),
--Student_Practical int,
--primary key(Semster_ID,Course_ID,Student_ID),
--foreign key(Course_ID)references Course,
--foreign key (Student_ID) references AspNetUsers,
--foreign key(Semster_ID)references Semesters,
--)

 -- holds the Data of Intended Learning Outcomes
create table  ILOS(
ILOS_ID int not null identity(1,1),
Course_ID int not null,
ILO_Description varchar(200)not null,
primary key (ILOS_ID),
foreign key (Course_ID) references Course
)

-- holds the Data of certain topic
create table Topic(
Topic_ID int identity(1,1),
Topic_Description varchar(200),
_week int,
primary key(Topic_ID),
)

create table ILOS_Topic(
ILOS_ID int not null,
Topic_ID int  not null,
_Description varchar(100),
primary key(ILOS_ID,Topic_ID),
foreign key(ILOS_ID)references ILOS,
foreign key(Topic_ID)references Topic
)

-- This table hold the questions
create table Questions_Bank(
Question_ID int identity(1,1),
Topic_ID int,
Question varchar(max),
Expected_Time varchar(128),
Difficulty_Level int,
Question_Frequency int default(0),
Thinking_Skills varchar(200),
Question_Mark int,
primary key(Question_ID),
foreign key(Topic_ID)references Topic
)


--This table hold the Answer of certain Question
create table Question_Answers(
Answer_ID int identity (1,1),
Question_ID int not null,	
Answer varchar(max),
is_True	 bit,
primary key(Answer_ID,Question_ID),
foreign key (Question_ID) references Questions_Bank 
)
-- This table hold the student Exam Result
create table Students_Exams(
Student_ID nvarchar(128),
Exam_ID int,
Exam_Result int DEFAULT(-1), 
primary key(Exam_ID,Student_ID),
foreign key(Exam_ID) references  Exam,
foreign key(Student_ID) references  AspNetUsers,
)

-- This table hold the student Answer Details
create table Student_Answers(
Exam_ID int, 
Student_ID nvarchar(128),
Question_ID int ,
AnswerID int ,
primary key(Exam_ID,Student_ID,Question_ID),
foreign key(Exam_ID) references  Exam(Exam_ID),
foreign key(Student_ID) references  AspNetUsers,
foreign key(AnswerID,Question_ID) references  Question_Answers(Answer_ID,Question_ID)
)

create table Calander(

Star_Date date,
Ene_Date date
)

Create table ExamQuestions(

Exam_ID int,
Question_ID int,
Note varchar(128),
primary key(Exam_ID,Question_ID),
foreign key(Exam_ID)references Exam,
foreign key(Question_ID)references Questions_Bank 
)


create table StudentsMarks(
CourseID int not null,
SemesterID int not null,
StudentID nvarchar(128) not null,
Midterm int default(-1) not null,
Final int default(-1) not null,
Practical int default(-1) not null
primary key(CourseID,SemesterID,StudentID),
foreign key(CourseID) references Course,
foreign key(SemesterID) references Semesters,
foreign key(StudentID) references AspNetUsers
)
