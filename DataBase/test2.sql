create table Course(
Course_ID int not null identity(1,1),
Course_Name varchar(100) not null,
Credit_Hours int not null,
Course_Description varchar(255),
primary key (Course_ID)
)

create table Course_EM(
ECourse_ID int ,
Midterm int,
Lab int,
Quiz int,
Final int,
primary key (ECourse_ID),
foreign key(ECourse_ID) references Course
)

create table Course_User(

CourseID int,  
UserID nvarchar(128),
Semester varchar(200),
primary key(CourseID,UserID,Semester),
foreign key (CourseID) references Course,
foreign key (UserID) references AspNetUsers
)


create table Topic(
Topic_ID int not null identity(1,1),
Course_ID int not null,
Topic_Description varchar(200)not null,
_week int,
primary key (Topic_ID),
foreign key (Course_ID) references Course
)

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

create table Question_Answers(
Question_ID int not null,
Answer_ID int identity (1,1),
Answer_Text varchar(200),
is_trueAnswer bit,
primary key(Question_ID,Answer_ID),
foreign key (Question_ID) references Questions_Bank 
)

create table Topic_Question(
Topic_ID int not null,
Question_ID int not null,
primary key(Topic_ID,Question_ID),
foreign key (Topic_ID) references Topic,
foreign key (Question_ID) references Questions_Bank,
)


create table ILOS(
ILOs_ID int identity(1,1),
ILOs_Description varchar(200),
primary key(ILOs_ID)
)

create table Topic_ILOS(
Topic_ID int not null,
ILOs_ID int not null,
primary key(Topic_ID,ILOs_ID),
foreign key (Topic_ID) references Topic,
foreign key (ILOs_ID) references ILOS,
)