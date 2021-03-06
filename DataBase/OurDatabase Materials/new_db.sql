USE [EAS_Database]
GO
/****** Object:  Table [dbo].[Calander]    Script Date: 6/23/2018 12:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calander](
	[Star_Date] [date] NULL,
	[Ene_Date] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 6/23/2018 12:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Course_ID] [int] IDENTITY(1,1) NOT NULL,
	[Course_Name] [varchar](100) NOT NULL,
	[Credit_Hours] [int] NOT NULL,
	[Course_Description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 6/23/2018 12:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Exam](
	[Exam_ID] [int] IDENTITY(1,1) NOT NULL,
	[Course_ID] [int] NULL,
	[Semster_ID] [int] NULL,
	[Exam_Type] [varchar](128) NOT NULL,
	[Exam_Date] [datetime] NOT NULL,
	[Exam_Period] [int] NULL,
	[Exam_Notes] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExamQuestions]    Script Date: 6/23/2018 12:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExamQuestions](
	[Exam_ID] [int] NOT NULL,
	[Question_ID] [int] NOT NULL,
	[Note] [varchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC,
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ILOS]    Script Date: 6/23/2018 12:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ILOS](
	[ILOS_ID] [int] IDENTITY(1,1) NOT NULL,
	[Course_ID] [int] NOT NULL,
	[ILO_Description] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ILOS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ILOS_Topic]    Script Date: 6/23/2018 12:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ILOS_Topic](
	[ILOS_ID] [int] NOT NULL,
	[Topic_ID] [int] NOT NULL,
	[_Description] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ILOS_ID] ASC,
	[Topic_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question_Answers]    Script Date: 6/23/2018 12:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question_Answers](
	[Answer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Question_ID] [int] NOT NULL,
	[Answer] [varchar](max) NULL,
	[is_True] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Answer_ID] ASC,
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Questions_Bank]    Script Date: 6/23/2018 12:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Questions_Bank](
	[Question_ID] [int] IDENTITY(1,1) NOT NULL,
	[Topic_ID] [int] NULL,
	[Question] [varchar](max) NULL,
	[Expected_Time] [varchar](128) NULL,
	[Difficulty_Level] [int] NULL,
	[Question_Frequency] [int] NULL DEFAULT ((0)),
	[Thinking_Skills] [varchar](200) NULL,
	[Question_Mark] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester_Courses]    Script Date: 6/23/2018 12:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester_Courses](
	[Semster_ID] [int] NOT NULL,
	[Course_ID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Number_of_Student] [int] NULL,
	[Success_rate] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Semster_ID] ASC,
	[Course_ID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Semesters]    Script Date: 6/23/2018 12:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semesters](
	[Semster_ID] [int] IDENTITY(1,1) NOT NULL,
	[Semester] [int] NOT NULL,
	[_Year] [varchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[Semster_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student_Answers]    Script Date: 6/23/2018 12:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Answers](
	[Exam_ID] [int] NOT NULL,
	[Student_ID] [nvarchar](128) NOT NULL,
	[Question_ID] [int] NOT NULL,
	[AnswerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC,
	[Student_ID] ASC,
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students_Exams]    Script Date: 6/23/2018 12:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students_Exams](
	[Student_ID] [nvarchar](128) NOT NULL,
	[Exam_ID] [int] NOT NULL,
	[Exam_Result] [int] NULL DEFAULT ((-1)),
PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC,
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentsMarks]    Script Date: 6/23/2018 12:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentsMarks](
	[CourseID] [int] NOT NULL,
	[SemesterID] [int] NOT NULL,
	[StudentID] [nvarchar](128) NOT NULL,
	[Midterm] [int] NOT NULL DEFAULT ((-1)),
	[Final] [int] NOT NULL DEFAULT ((-1)),
	[Practical] [int] NOT NULL DEFAULT ((-1)),
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC,
	[SemesterID] ASC,
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topic]    Script Date: 6/23/2018 12:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Topic](
	[Topic_ID] [int] IDENTITY(1,1) NOT NULL,
	[Topic_Description] [varchar](200) NULL,
	[_week] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Topic_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Credit_Hours], [Course_Description]) VALUES (1, N'Computer Network', 3, NULL)
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Credit_Hours], [Course_Description]) VALUES (16, N'Java', 3, N'Anyone wishing to sharpen their skills on Java programming language')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([Exam_ID], [Course_ID], [Semster_ID], [Exam_Type], [Exam_Date], [Exam_Period], [Exam_Notes]) VALUES (2, 1, 1, N'Midterm', CAST(N'2018-01-01 08:00:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Exam] ([Exam_ID], [Course_ID], [Semster_ID], [Exam_Type], [Exam_Date], [Exam_Period], [Exam_Notes]) VALUES (3, 16, 1, N'Midterm', CAST(N'2018-01-01 08:00:00.000' AS DateTime), NULL, N'')
INSERT [dbo].[Exam] ([Exam_ID], [Course_ID], [Semster_ID], [Exam_Type], [Exam_Date], [Exam_Period], [Exam_Notes]) VALUES (6, 1, 1, N'Final', CAST(N'2018-04-01 08:00:00.000' AS DateTime), 2, NULL)
SET IDENTITY_INSERT [dbo].[Exam] OFF
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 3, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 4, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 5, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 6, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 7, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 8, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 9, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 10, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 11, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 12, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 13, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 14, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 15, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 16, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 17, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 18, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 20, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 21, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 22, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 23, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 24, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 25, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 26, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 27, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 28, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 29, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 30, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 31, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 32, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 33, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 34, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 35, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 36, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 37, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 38, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 39, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 40, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 41, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 42, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 43, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 44, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 45, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 46, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 47, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 48, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 49, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 50, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 51, NULL)
INSERT [dbo].[ExamQuestions] ([Exam_ID], [Question_ID], [Note]) VALUES (2, 52, NULL)
SET IDENTITY_INSERT [dbo].[ILOS] ON 

INSERT [dbo].[ILOS] ([ILOS_ID], [Course_ID], [ILO_Description]) VALUES (1, 1, N'The section contains questions and answers on network basics, access network and reference models.

')
INSERT [dbo].[ILOS] ([ILOS_ID], [Course_ID], [ILO_Description]) VALUES (7, 16, N'Data Types, Variables and Arrays')
INSERT [dbo].[ILOS] ([ILOS_ID], [Course_ID], [ILO_Description]) VALUES (8, 1, N'physical layer, data link layer, transport layer and network layer.')
INSERT [dbo].[ILOS] ([ILOS_ID], [Course_ID], [ILO_Description]) VALUES (9, 1, N'multiplexing, topology, delays & loss, network attacks, physical media, packet and circuit switching.')
SET IDENTITY_INSERT [dbo].[ILOS] OFF
INSERT [dbo].[ILOS_Topic] ([ILOS_ID], [Topic_ID], [_Description]) VALUES (1, 1, NULL)
INSERT [dbo].[ILOS_Topic] ([ILOS_ID], [Topic_ID], [_Description]) VALUES (1, 2, NULL)
INSERT [dbo].[ILOS_Topic] ([ILOS_ID], [Topic_ID], [_Description]) VALUES (8, 3, NULL)
INSERT [dbo].[ILOS_Topic] ([ILOS_ID], [Topic_ID], [_Description]) VALUES (8, 4, NULL)
INSERT [dbo].[ILOS_Topic] ([ILOS_ID], [Topic_ID], [_Description]) VALUES (9, 5, NULL)
INSERT [dbo].[ILOS_Topic] ([ILOS_ID], [Topic_ID], [_Description]) VALUES (9, 6, NULL)
SET IDENTITY_INSERT [dbo].[Question_Answers] ON 

INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (6, 3, N'y9QfJvVT3M4=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (7, 3, N'MK579F7nrd0=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (8, 3, N'GgCkjOTHM3s=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (9, 3, N'TpJcg1VBMHecnjzpZEKWbP1aLiCOhzm0', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (10, 4, N'FF5oK9HZaz8=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (11, 4, N'9gSQ3H1bBT8=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (12, 4, N'EP+JrFbCKzNqy1JN0D/9uA==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (13, 4, N'MyTJT0Kwt3V8YgG+iXgrSg==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (14, 5, N'1BNZp2kT4NM=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (15, 5, N'kqfUKYYzyNbhxOgDngDjxA==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (16, 5, N'LUsAhRLtRQM=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (17, 5, N'TpJcg1VBMHecnjzpZEKWbP1aLiCOhzm0', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (18, 6, N'VdM2/K8XXjM=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (19, 6, N'oOn4JchrR71rQB8kNssl2A==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (20, 6, N'DWEVNt3Fk06Y6WxGwW4udw==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (21, 6, N'n5hjGaCvJi6yjsbZ3ROzpg==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (22, 7, N'soj/fhZxd9s=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (23, 7, N'LhOu8xJjoHU=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (24, 7, N'Nvl4gEjuhVc=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (25, 7, N'dKJ47mHDTBA=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (26, 8, N'0xpicC+5Gfs=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (27, 8, N'BaY2IiF6WqM=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (28, 8, N'1ec78W0X0L/dDuGaeH67rg==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (29, 8, N'tUbZ6Lasabo=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (30, 9, N'Is+8ADLMzu0=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (31, 9, N'+UGtPXYq2uo=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (32, 9, N'ctCogZO8vfk=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (33, 9, N'8u58wT5i1bA=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (34, 10, N'CPYXf7Anboc=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (35, 10, N'9JGKnI3sMug=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (36, 10, N'76LotvkxeSh0vocQOR0c7Q==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (37, 10, N'ZVQJLbgxqkU=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (38, 11, N'1ec78W0X0L9hLUfM19NRpA==', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (39, 11, N'+NsxNGZyJa23UwA+5eeiGw==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (40, 11, N'BNXM+bv/ey0=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (41, 11, N'TpJcg1VBMHecnjzpZEKWbP1aLiCOhzm0', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (42, 12, N'Fi8PmtmoICtztJycd40BNQ==', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (43, 12, N'jURz90gwK05TQkyzWitBtw==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (44, 12, N'nXLlcOuh+i2+ZGFTC/V1JA==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (45, 12, N'TpJcg1VBMHecnjzpZEKWbP1aLiCOhzm0', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (46, 13, N'fl5VJowdizpCgu/4yF0OciSyXD6iJe2I', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (47, 13, N'XCngEC9j9Eu2a1fR9HO/SYIfCVw2Ylam', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (48, 13, N't+wbdPh0mBkre7IzUtLWRnp+HtQf/J9m', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (49, 13, N'hbjElM5Nuu6svRV8eC7n692LY/uRFikC', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (50, 14, N'G67qGrn8fmVRkKgh6R529DB1q3ieehfi60UTl4zzMlNiEaJ7LQiYq8qU/NNFrBNvMwqHUIctFIRcqF2D2a1csef5KsuFUNM96PR17qxNQ2Q5a3tNrmCIudng6Anm9Ygv', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (51, 14, N'G67qGrn8fmWAoGiJ71RlPCm0P2v5mMMR3wK2BLRPKmYPuG1Kzh6HYQ==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (52, 14, N'XkrC1byJkX+JTnrKw5AtthW1SjhbgLQ66nbo1/xaP+OV9gySqlH7UloBfpWAoQJkzxdlziBG8j2bWnRhfVPwmg==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (53, 14, N'hbjElM5Nuu6svRV8eC7n692LY/uRFikC', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (54, 15, N'riINZE83MCebdj9736in2A==', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (55, 15, N'y9r8StceAyVkVaY5zEg+1A==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (56, 15, N'Uh0y0gKa89pi76oSk4yCkg==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (57, 15, N'ePpO7RccpebsWePByZOeMg==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (58, 16, N'ELnftFoeOV0/IXg0OK+vtgdDW1XHi7Km', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (59, 16, N'heOXk8XI//JXnJmkKGcgmw==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (60, 16, N'CsJOQhtRLrCISiVHXUGMheNZ/1WwuJIs', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (61, 16, N'yDQ6E19Bzkis4fWEzJPdeRaimr8rhFNL', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (62, 17, N'IQnr/IPUSAAyZtubeHqUtqiENgzvrU/E', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (63, 17, N'BcFS22LvyBjxZoEUw/VjC87GZYKa6XyI', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (64, 17, N'Ob4FsIz332O4N2ok6k2ed0f6ztNxJ6rRVGkoDZaYy9w=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (65, 17, N'yDQ6E19Bzkis4fWEzJPdeRaimr8rhFNL', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (66, 18, N'Xm1+Qq77ouk=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (67, 18, N'xRiIpNuF5fA=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (68, 18, N'6bKA3MbEh428C6uCxV9JLw==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (69, 18, N'yIcriuC8GqYKUDY5X2pfO/STep1SdPfh', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (70, 20, N'vg4ll5/huZ71/w4/8OB1AQ==', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (71, 20, N'vg4ll5/huZ71/w4/8OB1AQ==', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (72, 20, N'vg4ll5/huZ4pGUFIA9tcXwS/6Jo2To4V', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (73, 20, N'vg4ll5/huZ4pGUFIA9tcXwS/6Jo2To4V', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (74, 20, N'vg4ll5/huZ6UPNB2/COLkw==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (75, 20, N'vg4ll5/huZ6UPNB2/COLkw==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (76, 20, N'yDQ6E19Bzkis4fWEzJPdeRaimr8rhFNL', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (77, 20, N'yDQ6E19Bzkis4fWEzJPdeRaimr8rhFNL', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (78, 21, N'WbRMewhMtPq+ApPNOpjJyZLmfp1uPzc7bE6iUqqdnaI=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (79, 21, N'A8wbsZ5gQ9ZKScFjCq+WNtqLSLZMmrtk1yfqSn4GXK4=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (80, 21, N'K2hmAErUlLShaYCt//U7ciBmlb7UAJ0o8W+ODHe8A3pfFjVpNu08chPjU44j0XeN', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (81, 21, N'hbjElM5Nuu6svRV8eC7n692LY/uRFikC', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (82, 22, N'6AVSutCtd7Fu5DPxV9TN0eAulhfB10iO', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (83, 22, N'dY81nQ331HzyCCh6tGqQvc0YUVXjEYvR', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (84, 22, N'dWSWOVTcNAc+tZXa4H+RM+dy8hOjN2fCpuiTOc1NlJw=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (85, 22, N'rVRtB9tdI40M3DtGNISsCNXr+FGJef6e', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (86, 23, N'cfLiP/38Sx15UXLEzPgIjCzvA0wJLd3Q', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (87, 23, N'CdrjAbIHyKUPcdw24R87NecTNTBxXEC93l9KNP0BXCI=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (88, 23, N'FI9fc3qBNoAbTBokbgpOfDcv0HD4OBT9EjFbN9aPdyUXT/tTZvzy4w==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (89, 23, N'yDQ6E19Bzkis4fWEzJPdeRaimr8rhFNL', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (90, 24, N'eaO7EsRAeIpeWaInVfyAXQ==', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (91, 24, N'CqBbiIVJhyAHTie0ATfHzw==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (92, 24, N'OZFt6bVHQpY09iBcUT5jOE/O0mKfduwj', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (93, 24, N'OEU3d91E/kRkwhYKsf5cROcw6beS5sLO', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (94, 25, N'szXfwoVM93HvzAXWgzN/0tJCZk06ov7K', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (95, 25, N'upBM00ORQEeEo0Eywyt0p84eqkj93pGD', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (96, 25, N'L0Ut+wEcVYbL2A4LB6Jq0cyw0T2mS0wE', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (97, 25, N'9YfL1Xw2cFB0eDhGxExl/LDdeMgFIVNf', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (98, 26, N'a+kKLAFIVVAtNZ84aJ/OjY8aIZa5N2ddDEVMcduEiRs=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (99, 26, N'a+kKLAFIVVB/5fao+5UJBYoJhAYjCSw/', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (100, 26, N'a+kKLAFIVVC6YIT4NUDwatwzT9I2xEii8aMLEbVVPPc=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (101, 26, N'yDQ6E19Bzkis4fWEzJPdeRaimr8rhFNL', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (102, 27, N'7+zz7wMFcZLRSmTwPEvWr8vYiU6y4A0AMx8zhGdBlrg+hoXiRZxfmwmK9LkI6Dw+zdnq4SRgLoP+9GRW6BUi7g==', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (103, 27, N'OEU3d91E/kSFocDw1OfBixqYxVwLU/U3NJBovXOJEl7uV4WHZt5hKDaWHmjZjHqy0ImzcAMZX9EFXR7FcNgLjw==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (104, 27, N'C5Y1LnEkFkv5RkfkNKYfL1LZihNYN7bdKovU1FLqreaqye6nGZqPKLrlQC74mPWl', 0)
GO
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (105, 27, N'yIcriuC8GqYKUDY5X2pfO/STep1SdPfh', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (106, 28, N'VP4ZzT9HIVCcdnMt06fTmggi+oNXpSBbK/m/Egzt5xFsiCjQs9F91jpA/CoueeXW', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (107, 28, N'LhFBPuL7Yi16pHpETvJoYSR+xOXsW0dJTVfzHpmCGiw=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (108, 28, N'iTwHbPhCLNhKdwaQZHWI/Q==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (109, 28, N'yDQ6E19Bzkis4fWEzJPdeRaimr8rhFNL', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (110, 29, N'yIcriuC8GqYKUDY5X2pfO/STep1SdPfh', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (111, 29, N'oim3B9Pu/t91GNB+17liHA==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (112, 29, N'oFLPo1bJwU4rzc9rjJ8HpA==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (113, 29, N'B6OZvT7kSAqrxmLuQ70Wiw==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (114, 30, N'5v4N9+hQIpFuURuoMojvag==', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (115, 30, N'MJ74Ut5iP9KdBX2h5TNzvg==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (116, 30, N'44vMtHDQI9+G0xZp35WLoQ==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (117, 30, N'FI9fc3qBNoDfU5EoKwHo+stp6dh7Ij82', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (118, 31, N'wefvf/PLP19iE+daT0c72A==', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (119, 31, N'zGPvsrNCK6rKs051hgMuuCRQ7em17iP3', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (120, 31, N'szXfwoVM93HvzAXWgzN/0tJCZk06ov7K', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (121, 31, N'yDQ6E19Bzkis4fWEzJPdeRaimr8rhFNL', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (122, 32, N'yIcriuC8GqYKUDY5X2pfO/STep1SdPfh', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (123, 32, N'CXzz8cyfxEAngpTfvcondg==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (124, 32, N'2scuMF5Ch16Qzvw6m4odrQ==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (125, 32, N'V3mvMuX05FiSFAhr2MIF4w==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (126, 33, N'MJ74Ut5iP9KdBX2h5TNzvg==', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (127, 33, N'a+kKLAFIVVAI/yESo8DNrA==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (128, 33, N'ecbR/Qi0a491Vj+GSdzFyw==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (129, 33, N'FI9fc3qBNoDfU5EoKwHo+stp6dh7Ij82', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (130, 34, N'oFLPo1bJwU4rzc9rjJ8HpA==', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (131, 34, N'nyV7MQ+xiFw=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (132, 34, N'ItYkv0Cvv16lEVgwden/8g==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (133, 34, N'iTwHbPhCLNhKdwaQZHWI/Q==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (134, 35, N'zt4c5aUPoWmRlYJft0DnpcaqQUi+gFNR2v9WFmG6+6k=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (135, 35, N'Tv0vpJQdVR2luP1yUsy+wVJz7MazAbPRXryRlvtYiRs=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (136, 35, N'MJ74Ut5iP9JYL7E4bv4mXdp8U9IHXA0fYJlPpDDxr/GTHJVtbcZapQ==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (137, 35, N'yDQ6E19Bzkis4fWEzJPdeRaimr8rhFNL', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (138, 36, N'yIcriuC8GqYKUDY5X2pfO/STep1SdPfh', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (139, 36, N'NXyda0qTwR6DrRedFlxbBXQh9VoNHctm', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (140, 36, N'WRIlwHttbCD5joIALRh2hw==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (141, 36, N'KaV66XV5UkyhxbGDvAL+BG5TalR1bXht', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (142, 37, N'CjK0u888k1SQynD2NZWNyLi2+2e7L4o3nFIEmL1rskM=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (143, 37, N'zt4c5aUPoWmRlYJft0DnpcaqQUi+gFNR2v9WFmG6+6k=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (144, 37, N'4uivGo6USISnuzRedAFsTxV2QxF/VZmc/7xQ9tCKbhb5HXMB6lB4XA==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (145, 37, N'yDQ6E19Bzkis4fWEzJPdeRaimr8rhFNL', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (146, 38, N'G2k51HrFnMjjK8oZaDToMg==', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (147, 38, N'jGEl2iaHmeuZI4ik7KjdSw==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (148, 38, N'fMYLcpHo5KJSHG+nXI7SVg==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (149, 38, N'yDQ6E19Bzkis4fWEzJPdeRaimr8rhFNL', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (150, 39, N'K79OneZiaglu4scNsIki5Q5RLIvSb+5f', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (151, 39, N'GYjXsxRkyQGoVVmaebe3kjbEYyTPY5lr', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (152, 39, N'DRhVSpkX56yYYPvTJrmWiYid63Xl+th3', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (153, 39, N'K79OneZiagnkR2UjQLpHQJ3YF/9AiFAQ', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (154, 40, N'yIcriuC8GqYKUDY5X2pfO/STep1SdPfh', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (155, 40, N'gQDFhLMu8YbmAEZYqpnnsg==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (156, 40, N'L7yehI5vGV/aZxY12jq4pdfbGFFqu2P6', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (157, 40, N'0yFrLVBxIZo=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (158, 41, N'JqHmqxJZh7iSTHO2/8kMUv9Uguf0Qd0s', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (159, 41, N'cCkcp69qqDs=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (160, 41, N'tBY9+bKzlJY=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (161, 41, N'TpJcg1VBMHecnjzpZEKWbP1aLiCOhzm0', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (162, 42, N'QZV0XBxr8sJdVk8ZflFWww==', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (163, 42, N'K79OneZiaglu4scNsIki5Q5RLIvSb+5f', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (164, 42, N'zH4DHjrnDkxf92pgxanMuOZJCyxBawff', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (165, 42, N'yDQ6E19Bzkis4fWEzJPdeRaimr8rhFNL', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (166, 43, N'2w/c8DbmP/pp0UJPD00DJA==', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (167, 43, N'IzwDtGapNgI=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (168, 43, N'G5d/p9S9+sHC1g3mmhwNhA==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (169, 43, N'TpJcg1VBMHecnjzpZEKWbP1aLiCOhzm0', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (170, 44, N'5JpWzjZjvaI=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (171, 44, N'DxiTUwXVeMc=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (172, 44, N'SG8Mco0ca2s=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (173, 44, N'F3YyLiyMXpI=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (174, 45, N'F3YyLiyMXpI=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (175, 45, N'5JpWzjZjvaI=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (176, 45, N'DxiTUwXVeMc=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (177, 45, N'SG8Mco0ca2s=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (178, 46, N'1/wXpZ9k0FU=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (179, 46, N'caTpUpxC+/I=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (180, 46, N'xGvFNtuGIXU=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (181, 46, N'TpJcg1VBMHecnjzpZEKWbP1aLiCOhzm0', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (182, 47, N'caTpUpxC+/I=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (183, 47, N'1/wXpZ9k0FU=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (184, 47, N'xGvFNtuGIXU=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (185, 47, N'TpJcg1VBMHecnjzpZEKWbP1aLiCOhzm0', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (186, 48, N'o7M5LOX1eLGPNBdWo1Z4Vg==', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (187, 48, N'KxwuXjOEuniiqDz4cPgQfA==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (188, 48, N'E5Q5smjN9xR9LjFcQ1yXUg==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (189, 48, N'TpJcg1VBMHecnjzpZEKWbP1aLiCOhzm0', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (190, 49, N'aqTVpmwxuJKcfE/OIwDVabJntdSf/7wM', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (191, 49, N'woIiTz9cEcoT1JisDchTtVxFAc0hUQ9f', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (192, 49, N'LPPbg7WlHHIQs78GFaOGdQ==', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (193, 49, N'TpJcg1VBMHecnjzpZEKWbP1aLiCOhzm0', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (194, 50, N'gL0A0UTnsPc=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (195, 50, N'bYYvrk6mU+w=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (196, 50, N'sygBhiYzDBM=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (197, 50, N'TpJcg1VBMHecnjzpZEKWbP1aLiCOhzm0', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (198, 51, N'h62GIN+QpUw=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (199, 51, N'BvqiOGoVeWY=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (200, 51, N'iPiiXsrYDHo=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (201, 51, N'WbyiV+hGJ28=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (202, 52, N've4NAgiUn8o=', 1)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (203, 52, N'Ue3FSbULFZk=', 0)
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (204, 52, N'TvLsROfg+CzWPPvlD1vYvw==', 0)
GO
INSERT [dbo].[Question_Answers] ([Answer_ID], [Question_ID], [Answer], [is_True]) VALUES (205, 52, N'TpJcg1VBMHecnjzpZEKWbP1aLiCOhzm0', 0)
SET IDENTITY_INSERT [dbo].[Question_Answers] OFF
SET IDENTITY_INSERT [dbo].[Questions_Bank] ON 

INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (3, 1, N'5+Isie3b/GrHoUAF0ALQxEFJTroCH1JdmC+OPMlD+OcoCSuH5DIF+w==', N'3', 1, 0, N'Writing', 1)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (4, 1, N'rDLEX84Qwbj3lk52xUwSnzmG9t0i7SJ41zoYwuiBL/6VlpHCWILs/Ik2YscrjZv/Le3SDwDODNVjMjRBK/f5BXIpO00fpEGC6EnWQhrBzPtE53KwRAAHHOCIyBvFRppKOMuZzKIdVBQ=', N'4', 2, 0, N'Writing', 2)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (5, 1, N'BtxVCzslcQ3fH6FknLIVE3JW+0yfwcTunHqnsfgMLtjTxeHi1ebohIllBrhjRATo', N'5', 3, 0, N'Reading', 3)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (6, 1, N'V5qqNzdY6PxA8otoQUTCyegYiVkMXFd6mzRcIf3AAVn9CEZ1E3ir4hYhQutcw+2TkRnE9wElDv29dFtvJdLpNIKeYA6QNFsjg++V6E+tdMh8QMCtBoEZ6w==', N'6', 4, 0, N'Critical Thiking', 4)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (7, 1, N'Z+5QhZiP+uH1fXl4nCYHzlgBk3e+ggNv', N'7', 5, 0, N'Designing', 5)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (8, 1, N'770UfjZdX76VbYHUwyCtj1VNt13B79BdCjfrs08YYAU0Ctv9RLs0xKL+KJIduRSnXCISduKLX/nxszb7varZPg==', N'3', 1, 0, N'Writing', 1)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (9, 1, N'09BkkFAetC/JST1V9C+PuZmBdVVwPMVwgw5/gYQOeI+F0IXgUeOjSCtnIMHx6SzPrJ8AGshAx5eEyiN7V4sFTaZ4Qy4EnqgyLJd1cl7zv9e3bvj5QQFCTYEHUrwyZUD9NemEebLauSUhwZODyve1CQ==', N'4', 2, 0, N'Reading', 2)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (10, 1, N'nNKDyPy9nvthPHASFn985sfTUaKP7IyIAAixDmDkPRnN9vN7tFUiAiHKN/6EKqAm', N'4', 3, 0, N'Critical Thiking', 3)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (11, 1, N'7uDcbrrADx4q5FUeVAYBbC3JJzMGbDpAWAqbpT56rYojivNdWsdYrrzTfNnA0EoW', N'4', 4, 0, N'Designing', 4)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (12, 1, N'4DHL6b2GtAB8OWVGrMBslPh06xvHseSDodvHRNbJMO0vgjNVziWpSgtyTXamREV86d8+KkUOMgGFkBCv0HdP8Q==', N'5', 5, 0, N'Writing', 5)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (13, 2, N'sQhRux13EAeVw5HLc7i6d6trsyUtawLM8q04He/aD1WDG6/rpBDvOgtqbc5KbRysUgVv0ckjXNle0CWZ1DqypnpvKvZcFIDhL4jNYeY6fAmTO5F5iHa3Fic62JT+gDzjhts30uonDCI=', N'3', 1, 0, N'Writing', 1)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (14, 2, N'ntxZLIiACW6cgTV0UijSkQuIeRKrVcFUkGEsiIPyITY=', N'4', 2, 0, N'Reading', 2)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (15, 2, N'f+uvE/CtnYLBSQMgnteJpb939EnaUeMcX/XrhCpDfeuocKdudt5nna821tRIoEjghQXN7ZUXPSH+fBlC4mtmsQn40/qqGz5C5N1+w1qYoohIPi/9ujVGJA==', N'5', 3, 0, N'Critical Thiking', 3)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (16, 2, N'V5qqNzdY6PwMzvRmoi0uYd9zbk1DClTup5QutGXUtpAeGTMzxWrUyntR6s9VETDg5SibpNHXjZs0DTGpcC3JILWcv3rwKutd', N'6', 4, 0, N'Designing', 4)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (17, 2, N'wYw/TFCLiPTXXKyWEfZKY/zHS1HrUZ6cWLO2mY/tzWQ=', N'7', 5, 0, N'Writing', 5)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (18, 2, N'Ipscp/P9GrcJIWHnwv9t0Xlal49K2wINXvGmucbhErMgAFp9OXvuhVye+twAOE6N31tnoz5iZtWsj/6aOAbnU2NdC94SdSuSYGm+E4ITEmhGLVvXX420Z9W2K0S3tQow0LJgoDbndGwroCgc9YizwiuRC5F/lns+KtBSsmVG98w=', N'3', 1, 0, N'Writing', 1)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (20, 2, N'mov9MSsA3xYUSd1XIRkwCa669SZio4Ebi50pBdsk/VovmrqdNtT/d3kEYIfz2UXXhrsF6+DBypBF8vSXUl0SOTj/A7VBEvnQVaB/TPsJlw0=', N'7', 5, 0, N'Reading', 5)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (21, 2, N'PPfjLyL5KyUMHKGVC8YGnt9/aARrDpgnUbVoBtdQdpM=', N'5', 3, 0, N'Critical Thiking', 3)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (22, 2, N'f+uvE/CtnYLBSQMgnteJpb939EnaUeMceIqMT1mt5A9G7pSnqUMMXaarP/MYNbsxSHjCN9V/goGOBcQY4D4zWh84VoCUGWHxPcwKvHvlBJM=', N'6', 4, 0, N'Critical Thiking', 4)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (23, 3, N'mJjSq0ukTfimyvrf8kePzsl6vHBSJ/FUCF/3NK/Ioax2Rfit3HhdIg==', N'3', 1, 0, N'Writing', 1)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (24, 3, N'qN0tFiJSeFKSMcYdIAFeveG3TKfz47tYn9Q4rnprwK6t0hwDBLAey45ADpG/yOWAYH2J7s0Z2CuLyERfUWDz4nmktSbAYJ6YN32k6Mv5ims=', N'4', 2, 0, N'Reading', 2)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (25, 3, N'GP0dBGBAjXrj1Ljne0KxoR7clLqcHTJHwPOnEYqjLq9+PS0vq8fAegpLa286YVnnTalIz3qNQJKS24164Eajg84cBMNW83bf', N'5', 3, 0, N'Critical Thiking', 3)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (26, 3, N'LbcnsIFX9WjlR/t3p1cRF0yUkHM6pFjjXiys9N2vKrs3CMw246iuZVSG4eI/Mug+dPoSvwySq6OIX6V9EMtb/0kWeboOSMHD7A2O1OsGzmohmyimAT2jPgKXsnAbE+Hr', N'5', 4, 0, N'Designing', 4)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (27, 3, N'a+kKLAFIVVDlawzJJTWD2MPaF9AxAiCZ', N'6', 5, 0, N'Writing', 5)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (28, 3, N'SoNv2KxfDBRZAUjq/xv2GcHytXB7OVCMH+ZQm+CzB5XrQ9RaU2tsCqg3hERkv+qvAwBBszI4rPbdC8CWeWCbk8KzcXH0Wz4Y', N'3', 1, 0, N'Reading', 1)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (29, 3, N'Geix6Xz1+h2Q1vozACDK4S3Urv0D6OZmgA+A2YX9WEYr2GZRwUGX1A==', N'4', 2, 0, N'Reading', 2)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (30, 3, N'mJjSq0ukTfimyvrf8kePzq3J4FNI6v2sjU7NzHKFtMs26FpoQbhVrHjENr8UXWv/3JjLpph/XlHNGWCImk/jB0nx7xrmMpCE5V7t+XLfN1kQ5XPH/UQVpBZV4+pSRxX3QFqbHW6kzyTCL4RF7KdNng==', N'3', 3, 0, N'Critical Thiking', 3)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (31, 3, N'TJXvvUWSCis25bw8MIi4f6Tr9Roca/FEaBWG06XmgmJQDzMinP0W9aUm3wENcF//xo85EXrSZUA=', N'5', 4, 0, N'Reading', 4)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (32, 3, N'IOjZZRyyep5tDba5s2pJIyAiEzll9HdkSt6ybzvc7xeqaoP8+Uw8Ow==', N'6', 5, 0, N'Writing', 5)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (33, 4, N'NLXJ9RalpRah1/JUdw9rwKfvQHbT18oMnqqGwnUuHq7XsFzv7C6Oi+2DCBKHcCjLIXe+K0uoTk0VuTglIJq77/Ms8hGYv+enhlZAsxPOUJfc2BxyxFdVbcEQgU528FlZWbP3VTiXkY7VmLl8H1sF0g==', N'3', 1, 0, N'Writing', 1)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (34, 4, N'f+uvE/CtnYLBSQMgnteJpb939EnaUeMcJWKiayFqPTHdLAJ1RMCEeEZOBHS+aCXJIVS+w6u/4hvMn8LCM2a/wQ==', N'4', 2, 0, N'Reading', 2)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (35, 4, N'BxzTbGxYDsbE7zhAvOx0joEmodjFaQGQshei/LGaTMUAaof7Zu1CbPwurIuWzYxUb3ZfwD9zhuVdyVgUyftC5JvXHD6uyHwat40AZ915cXp351B90nQX3idiNmew+bxQ4WcWiiLl0Xs=', N'5', 3, 0, N'Critical Thiking', 3)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (36, 4, N'Wd6ab4m1IvtdX6D5p47OM2d9WHpEATGs9twLWb6SGzFylGSOf1um8A==', N'5', 4, 0, N'Designing', 4)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (37, 4, N'hVIwcEbut/q7QJz4N9M2tdvUwEZh1wGP/GfbBH1CyDww3y3sDj7qFf2eVuY/HdeBEZvsJzOclCDdyAdSRfGSFIfJtvgUwBrl', N'6', 5, 0, N'Writing', 5)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (38, 4, N'akox9ACjYD8BgRqpyn/atPxccWSksOCDc9qqC2S4whe5TntOAF96h0NUq8J6ntHmyTMnxE4Eq7wFU6COy1f9qzx+/YKX2mr7EPre2JkQCDXnbtHH2cXFkcy85ldGGREoEtq843WD+/I=', N'3', 1, 0, N'Writing', 1)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (39, 4, N'l93vuyo0Ijl2JJ1zsoXGVA==', N'4', 2, 0, N'Reading', 2)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (40, 4, N'f+uvE/CtnYLBSQMgnteJpb939EnaUeMcM0/cL+gJ7CveMFXbEzMBiNGG2wpFjT7Dxow6/ikSjJ8=', N'5', 3, 0, N'Critical Thiking', 3)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (41, 4, N'nNKDyPy9nvtTmSc1soHdpoY2B/gh43t24KiHvIDEOqu4w6+NCp1tJ77sOcobKAvawNUHRKOA88cxigke0UFAnDv0PPgtwVVzMgCZWRVUkjQKzm4mLwbueg==', N'6', 4, 0, N'Designing', 4)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (42, 4, N'494kcg7y6TquyQI70XFMuJKyCjSciVKwdQ1XJISeYgOvpQTpduSK+Gm9cVMJXTUuJsjygu+i+6pvONgd4GGz6DS0l1w8AuYGyjNu1nrR4o42qIIOsrkOsfftENcwbiLj8fLy0mx7Rb4b+KPAfrVVT2q8G8Z3ZgDkccxULeouhxMv1YctBnl+KN1MGnu2qVte', N'7', 5, 0, N'Writing', 5)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (43, 5, N'hc+gJBr7BBz7dZExeZ/Uw67x6TypzyVaWzwionTAEoKy4xl21cHUu3Y06+YfN4De', N'3', 1, 0, N'Writing', 1)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (44, 5, N'+Fz6R7VOsQB1ymZJ6m8w+5cBxaP2JmaH4KEAzP5A/+NO0z4Jwac6lg8r/h3lGV/BCrqnpZawpZA=', N'4', 2, 0, N'Reading', 2)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (45, 5, N'F02Tuk8NWFbyxUbXQkObWyd+FFsxhrw9RzNmOVPdGV8Ok+U9cZ7UtkB93c4Z5a7T', N'5', 3, 0, N'Critical Thiking', 3)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (46, 5, N'WDffaqZFzQFQCezADSOrJOzLF80bORBHjYlHMWn5E2aNJVviBmaI4qfxJbX6N+19QhhV77FhU4E18NU9LnsQBU1FK6dSaFP0SPGpTvE9dSk=', N'5', 4, 0, N'Designing', 4)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (47, 5, N'fdJe/0osWnpUogsl6nrJsm6CTbjyjNXm2T2af/RN7bekl36XpvPakeUOhP0rgaepp/SO7tq23XY7uvPWF4rseA==', N'7', 5, 0, N'Writing', 5)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (48, 6, N'v/zlzSNte9qFpwh16k1NoOmPjSMuS6YuopdaMx60KLtI53XkZXk5an2I0uoPG1MKA8tjE20zLVMfRLetgasRtPESfyOGlZaNzP9szrXMHfE=', N'3', 1, 0, N'Writing', 1)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (49, 6, N'o7M5LOX1eLHoF6D0iF5GJGb8cYEe2av3gde0VconBoY=', N'4', 2, 0, N'Reading', 2)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (50, 6, N'QlyPz8tQMki9krl/y06N9E8r2IoqY3ki2anJ1KRXGvzUtrPEZQriaaxvOnh87dGCZB/QfZtMTYooB3sLPtrS6g==', N'5', 3, 0, N'Critical Thiking', 3)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (51, 6, N'xwaLAUlLfbogRHIIyfb7DJvnDtcQEa/KbFwwwl0H7RBA2TAwcIX6xac3mgk5QRPXak72+PDCTn4Is2s9ybTF5JGaIN1g2wWGZ3AW/ujANRE=', N'6', 4, 0, N'Designing', 4)
INSERT [dbo].[Questions_Bank] ([Question_ID], [Topic_ID], [Question], [Expected_Time], [Difficulty_Level], [Question_Frequency], [Thinking_Skills], [Question_Mark]) VALUES (52, 6, N'oQzsPcqwB60BFuRxKaPWbaTjinjIEyKfJ0EgodvWM41GS2Y8g5c+vGRObppeVNv/V8kBYDAmfPJpTa0gT4ulEbc7BnqN/X2PkAWbNw5EcEb0uWHFyUR8Ch9hvXfct9esf1VpJxBaN+iYS+ALZq9RUg==', N'7', 5, 0, N'Writing', 5)
SET IDENTITY_INSERT [dbo].[Questions_Bank] OFF
INSERT [dbo].[Semester_Courses] ([Semster_ID], [Course_ID], [UserID], [Number_of_Student], [Success_rate]) VALUES (1, 1, N'f723e108-ba10-407a-8cfc-4a85a8258f85', NULL, NULL)
INSERT [dbo].[Semester_Courses] ([Semster_ID], [Course_ID], [UserID], [Number_of_Student], [Success_rate]) VALUES (1, 16, N'd720cddf-00b1-42a7-9aea-85b6ed665f87', 0, -1)
SET IDENTITY_INSERT [dbo].[Semesters] ON 

INSERT [dbo].[Semesters] ([Semster_ID], [Semester], [_Year]) VALUES (1, 1, N'2018')
SET IDENTITY_INSERT [dbo].[Semesters] OFF
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 3, 6)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 4, 11)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 5, 16)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 6, 19)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 7, 22)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 8, 28)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 9, 32)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 10, 35)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 11, 38)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 12, 42)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 13, 48)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 14, 51)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 15, 54)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 16, 59)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 17, 63)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 18, 68)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 20, 70)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 21, 78)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 22, 82)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 23, 86)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 24, 92)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 25, 95)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 26, 99)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 27, 103)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 28, 107)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 29, 110)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 30, 116)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 31, 118)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 32, 122)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 33, 128)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 34, 132)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 35, 136)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 36, 138)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 37, 142)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 38, 146)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 39, 150)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 40, 154)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 41, 160)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 42, 164)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 43, 167)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 44, 170)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 45, 175)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 46, 180)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 47, 184)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 48, 188)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 49, 192)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 50, 195)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 51, 198)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 52, 202)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 3, 7)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 4, 11)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 5, 16)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 6, 18)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 7, 22)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 8, 27)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 9, 30)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 10, 35)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 11, 38)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 12, 43)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 13, 47)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 14, 52)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 15, 55)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 16, 59)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 17, 63)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 18, 66)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 20, 70)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 21, 79)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 22, 82)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 23, 86)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 24, 90)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 25, 96)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 26, 98)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 27, 103)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 28, 108)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 29, 110)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 30, 116)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 31, 120)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 32, 122)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 33, 126)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 34, 132)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 35, 134)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 36, 138)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 37, 143)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 38, 146)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 39, 151)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 40, 154)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 41, 159)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 42, 163)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 43, 167)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 44, 171)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 45, 175)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 46, 180)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 47, 184)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 48, 188)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 49, 192)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 50, 195)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 51, 198)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 52, 202)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 3, 7)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 4, 12)
GO
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 5, 14)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 6, 18)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 7, 22)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 8, 26)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 9, 31)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 10, 35)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 11, 38)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 12, 43)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 13, 48)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 14, 51)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 15, 55)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 16, 59)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 17, 63)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 18, 66)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 20, 70)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 21, 79)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 22, 82)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 23, 86)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 24, 91)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 25, 95)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 26, 98)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 27, 103)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 28, 108)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 29, 110)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 30, 115)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 31, 120)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 32, 124)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 33, 127)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 34, 130)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 35, 135)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 36, 140)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 37, 144)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 38, 148)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 39, 150)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 40, 156)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 41, 160)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 42, 164)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 43, 166)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 44, 171)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 45, 175)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 46, 180)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 47, 184)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 48, 186)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 49, 190)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 50, 194)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 51, 198)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 52, 203)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 3, 7)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 4, 10)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 5, 15)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 6, 18)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 7, 22)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 8, 28)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 9, 30)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 10, 35)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 11, 40)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 12, 42)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 13, 48)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 14, 51)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 15, 54)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 16, 59)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 17, 64)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 18, 66)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 20, 70)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 21, 78)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 22, 83)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 23, 88)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 24, 91)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 25, 96)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 26, 98)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 27, 104)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 28, 106)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 29, 110)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 30, 115)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 31, 120)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 32, 122)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 33, 127)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 34, 130)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 35, 136)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 36, 138)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 37, 142)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 38, 148)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 39, 152)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 40, 154)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 41, 159)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 42, 163)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 43, 166)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 44, 170)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 45, 174)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 46, 180)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 47, 184)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 48, 187)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 49, 192)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 50, 194)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 51, 198)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 52, 202)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 3, 7)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 4, 12)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 5, 16)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 6, 18)
GO
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 7, 22)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 8, 26)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 9, 30)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 10, 34)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 11, 40)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 12, 42)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 13, 47)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 14, 51)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 15, 54)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 16, 58)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 17, 63)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 18, 68)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 20, 72)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 21, 79)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 22, 84)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 23, 88)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 24, 90)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 25, 95)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 26, 99)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 27, 102)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 28, 108)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 29, 110)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 30, 114)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 31, 119)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 32, 123)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 33, 126)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 34, 130)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 35, 135)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 36, 139)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 37, 143)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 38, 146)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 39, 151)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 40, 154)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 41, 160)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 42, 164)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 43, 166)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 44, 171)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 45, 176)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 46, 180)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 47, 184)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 48, 188)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 49, 192)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 50, 194)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 51, 198)
INSERT [dbo].[Student_Answers] ([Exam_ID], [Student_ID], [Question_ID], [AnswerID]) VALUES (2, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 52, 202)
INSERT [dbo].[Students_Exams] ([Student_ID], [Exam_ID], [Exam_Result]) VALUES (N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 2, 71)
INSERT [dbo].[Students_Exams] ([Student_ID], [Exam_ID], [Exam_Result]) VALUES (N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 2, 63)
INSERT [dbo].[Students_Exams] ([Student_ID], [Exam_ID], [Exam_Result]) VALUES (N'9195ffe2-0e5d-4075-9a8a-23945570a704', 2, 52)
INSERT [dbo].[Students_Exams] ([Student_ID], [Exam_ID], [Exam_Result]) VALUES (N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 2, 77)
INSERT [dbo].[Students_Exams] ([Student_ID], [Exam_ID], [Exam_Result]) VALUES (N'f723e108-ba10-407a-8cfc-4a85a8258f85', 2, 62)
INSERT [dbo].[StudentsMarks] ([CourseID], [SemesterID], [StudentID], [Midterm], [Final], [Practical]) VALUES (1, 1, N'5ca37cd0-3b05-4663-bb9f-5babd3fa6c56', 71, -1, 18)
INSERT [dbo].[StudentsMarks] ([CourseID], [SemesterID], [StudentID], [Midterm], [Final], [Practical]) VALUES (1, 1, N'8c3681af-6bc9-47c3-a5c8-0512d6fe7cd7', 63, -1, 2)
INSERT [dbo].[StudentsMarks] ([CourseID], [SemesterID], [StudentID], [Midterm], [Final], [Practical]) VALUES (1, 1, N'9195ffe2-0e5d-4075-9a8a-23945570a704', 52, -1, 24)
INSERT [dbo].[StudentsMarks] ([CourseID], [SemesterID], [StudentID], [Midterm], [Final], [Practical]) VALUES (1, 1, N'e39c133a-fe3b-49e0-ac55-a5d435720e99', 77, -1, 5)
INSERT [dbo].[StudentsMarks] ([CourseID], [SemesterID], [StudentID], [Midterm], [Final], [Practical]) VALUES (1, 1, N'f723e108-ba10-407a-8cfc-4a85a8258f85', 62, -1, 23)
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([Topic_ID], [Topic_Description], [_week]) VALUES (1, N'Basics – 1
', 1)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Description], [_week]) VALUES (2, N'Basics – 2', 2)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Description], [_week]) VALUES (3, N'Physical Layer', 3)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Description], [_week]) VALUES (4, N'Data Link Layer', 4)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Description], [_week]) VALUES (5, N'Topology', 5)
INSERT [dbo].[Topic] ([Topic_ID], [Topic_Description], [_week]) VALUES (6, N'Multiplexing', 6)
SET IDENTITY_INSERT [dbo].[Topic] OFF
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([Semster_ID])
REFERENCES [dbo].[Semesters] ([Semster_ID])
GO
ALTER TABLE [dbo].[ExamQuestions]  WITH CHECK ADD FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[ExamQuestions]  WITH CHECK ADD FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Questions_Bank] ([Question_ID])
GO
ALTER TABLE [dbo].[ILOS]  WITH CHECK ADD FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[ILOS_Topic]  WITH CHECK ADD FOREIGN KEY([ILOS_ID])
REFERENCES [dbo].[ILOS] ([ILOS_ID])
GO
ALTER TABLE [dbo].[ILOS_Topic]  WITH CHECK ADD FOREIGN KEY([Topic_ID])
REFERENCES [dbo].[Topic] ([Topic_ID])
GO
ALTER TABLE [dbo].[Question_Answers]  WITH CHECK ADD FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Questions_Bank] ([Question_ID])
GO
ALTER TABLE [dbo].[Questions_Bank]  WITH CHECK ADD FOREIGN KEY([Topic_ID])
REFERENCES [dbo].[Topic] ([Topic_ID])
GO
ALTER TABLE [dbo].[Semester_Courses]  WITH CHECK ADD FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Semester_Courses]  WITH CHECK ADD FOREIGN KEY([Semster_ID])
REFERENCES [dbo].[Semesters] ([Semster_ID])
GO
ALTER TABLE [dbo].[Semester_Courses]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Student_Answers]  WITH CHECK ADD FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Student_Answers]  WITH CHECK ADD FOREIGN KEY([Student_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Student_Answers]  WITH CHECK ADD FOREIGN KEY([AnswerID], [Question_ID])
REFERENCES [dbo].[Question_Answers] ([Answer_ID], [Question_ID])
GO
ALTER TABLE [dbo].[Students_Exams]  WITH CHECK ADD FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Students_Exams]  WITH CHECK ADD FOREIGN KEY([Student_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[StudentsMarks]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[StudentsMarks]  WITH CHECK ADD FOREIGN KEY([SemesterID])
REFERENCES [dbo].[Semesters] ([Semster_ID])
GO
ALTER TABLE [dbo].[StudentsMarks]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD CHECK  (([Exam_Type]='Quiz' OR [Exam_Type]='Midterm' OR [Exam_Type]='Final'))
GO
