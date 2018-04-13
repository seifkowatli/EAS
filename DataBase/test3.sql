


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
Teacher_ID nvarchar(128),
Number_of_Student int,
Success_rate float,
primary key(Semster_ID,Course_ID),
foreign key(Semster_ID) references Semesters,
foreign key(Course_ID)references Course,
foreign key (Teacher_ID) references AspNetUsers
)

--hold the data about Exam
create table Exam(
Exam_ID int identity(1,1),
Course_ID int,
Semster_ID int,
Exam_Type varchar(128) check (Exam_Type in('Final','Midterm','Quiz' )) not null,
Exam_Time varchar(128) not null,
Exam_Date varchar(128) not null,
number_Of_Students int,
Exam_Period int ,
Exam_Notes varchar(200),
primary key(Exam_ID),
foreign key(Course_ID,Semster_ID)references Semester_Courses
)

--hold the date about students courses in semester
create table Course_Students(
Course_ID int,  
Student_ID nvarchar(128),
Semster_ID int,
_Drop bit default(0),
Prohibited bit default(0),
Student_Mark float,
primary key(Course_ID,Student_ID,Semster_ID),
foreign key (Course_ID,Semster_ID) references Semester_Courses,
foreign key (Student_ID) references AspNetUsers
)

-- holds the Data of certain topic
create table Topic(
Topic_ID int not null identity(1,1),
Course_ID int not null,
Topic_Description varchar(200)not null,
primary key (Topic_ID),
foreign key (Course_ID) references Course
)

-- holds the Data of Intended Learning Outcomes
create table ILOS(
ILOs_ID int identity(1,1),
Topic_ID int ,
ILOs_Description varchar(200),
_week int,
primary key(ILOs_ID),
foreign key (Topic_ID) references Topic
)


-- This table hold the questions
create table Questions_Bank(
Question_ID int identity(1,1),
Question_Text varchar(255),
Expected_Time varchar(128),
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
Student_Answer varchar(200),
IsTrue bit,
primary key(Exam_ID,Student_ID,Question_ID),
foreign key(Exam_ID,Student_ID) references  Students_Exams,
foreign key(Question_ID) references  Questions_Bank(Question_ID)
)


create table ILO_Question(
ILOs_ID int not null,
Question_ID int not null,
primary key(ILOs_ID,Question_ID),
foreign key (ILOs_ID) references ILOS,
foreign key (Question_ID) references Questions_Bank,
)


