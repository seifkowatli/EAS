USE [EAS_Database]
GO
/****** Object:  Table [dbo].[Calander]    Script Date: 5/28/2018 12:53:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calander](
	[Star_Date] [date] NULL,
	[Ene_Date] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/28/2018 12:53:12 PM ******/
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
/****** Object:  Table [dbo].[Course_Students]    Script Date: 5/28/2018 12:53:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Students](
	[Semster_ID] [int] NOT NULL,
	[Course_ID] [int] NOT NULL,
	[Student_ID] [nvarchar](128) NOT NULL,
	[_Drop] [bit] NULL,
	[Prohibited] [bit] NULL,
	[Student_Practical] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Semster_ID] ASC,
	[Course_ID] ASC,
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exam]    Script Date: 5/28/2018 12:53:12 PM ******/
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
	[Exam_Time] [varchar](128) NOT NULL,
	[Exam_Date] [varchar](128) NOT NULL,
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
/****** Object:  Table [dbo].[ILOs]    Script Date: 5/28/2018 12:53:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ILOs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Course_Id] [int] NOT NULL,
	[Name] [text] NOT NULL,
 CONSTRAINT [PK_ILOs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question_Answers]    Script Date: 5/28/2018 12:53:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question_Answers](
	[Question_ID] [int] NOT NULL,
	[Answer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Answer_Text] [varchar](200) NULL,
	[is_trueAnswer] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Question_ID] ASC,
	[Answer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Questions_Bank]    Script Date: 5/28/2018 12:53:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Questions_Bank](
	[Question_ID] [int] IDENTITY(1,1) NOT NULL,
	[Question_Text] [nvarchar](max) NULL,
	[Expected_Time] [varchar](128) NULL,
	[Difficulty_Level] [int] NULL,
	[Question_Frequency] [int] NULL DEFAULT ((0)),
	[Thinking_Skills] [varchar](200) NULL,
	[Question_Mark] [int] NULL,
	[Topic_Id] [int] NOT NULL,
	[Exam_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester_Courses]    Script Date: 5/28/2018 12:53:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester_Courses](
	[Semster_ID] [int] NOT NULL,
	[Course_ID] [int] NOT NULL,
	[Teacher_ID] [nvarchar](128) NULL,
	[Number_of_Student] [int] NULL,
	[Success_rate] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Semster_ID] ASC,
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Semesters]    Script Date: 5/28/2018 12:53:12 PM ******/
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
/****** Object:  Table [dbo].[Students_Answers]    Script Date: 5/28/2018 12:53:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students_Answers](
	[Std_Id] [nvarchar](128) NOT NULL,
	[Exam_Id] [int] NOT NULL,
	[Answer_Id] [int] NOT NULL,
	[Question_Id] [int] NOT NULL,
 CONSTRAINT [Students_Answers_PK] PRIMARY KEY CLUSTERED 
(
	[Std_Id] ASC,
	[Exam_Id] ASC,
	[Answer_Id] ASC,
	[Question_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students_Exams]    Script Date: 5/28/2018 12:53:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students_Exams](
	[Student_ID] [nvarchar](128) NOT NULL,
	[Exam_ID] [int] NOT NULL,
	[Exam_Result] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC,
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topics]    Script Date: 5/28/2018 12:53:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Topic_Name] [text] NOT NULL,
 CONSTRAINT [PK_Topics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topics_ILOs]    Script Date: 5/28/2018 12:53:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics_ILOs](
	[ILO_Id] [int] NOT NULL,
	[Topic_Id] [int] NOT NULL,
 CONSTRAINT [FK_Topics_ILOs] PRIMARY KEY CLUSTERED 
(
	[ILO_Id] ASC,
	[Topic_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Course_Students] ADD  DEFAULT ((0)) FOR [_Drop]
GO
ALTER TABLE [dbo].[Course_Students] ADD  DEFAULT ((0)) FOR [Prohibited]
GO
ALTER TABLE [dbo].[Students_Exams] ADD  DEFAULT ((-1)) FOR [Exam_Result]
GO
ALTER TABLE [dbo].[Course_Students]  WITH CHECK ADD FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Course_Students]  WITH CHECK ADD FOREIGN KEY([Semster_ID])
REFERENCES [dbo].[Semesters] ([Semster_ID])
GO
ALTER TABLE [dbo].[Course_Students]  WITH CHECK ADD FOREIGN KEY([Student_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([Semster_ID])
REFERENCES [dbo].[Semesters] ([Semster_ID])
GO
ALTER TABLE [dbo].[ILOs]  WITH CHECK ADD  CONSTRAINT [FK_ILOs_Course] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[ILOs] CHECK CONSTRAINT [FK_ILOs_Course]
GO
ALTER TABLE [dbo].[Question_Answers]  WITH CHECK ADD FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Questions_Bank] ([Question_ID])
GO
ALTER TABLE [dbo].[Questions_Bank]  WITH CHECK ADD  CONSTRAINT [Exam_Question_FK] FOREIGN KEY([Exam_Id])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Questions_Bank] CHECK CONSTRAINT [Exam_Question_FK]
GO
ALTER TABLE [dbo].[Questions_Bank]  WITH CHECK ADD  CONSTRAINT [FK_Question_Topic] FOREIGN KEY([Topic_Id])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[Questions_Bank] CHECK CONSTRAINT [FK_Question_Topic]
GO
ALTER TABLE [dbo].[Semester_Courses]  WITH CHECK ADD FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Semester_Courses]  WITH CHECK ADD FOREIGN KEY([Semster_ID])
REFERENCES [dbo].[Semesters] ([Semster_ID])
GO
ALTER TABLE [dbo].[Semester_Courses]  WITH CHECK ADD FOREIGN KEY([Teacher_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Students_Answers]  WITH CHECK ADD  CONSTRAINT [Students_Answers_Ans] FOREIGN KEY([Answer_Id], [Question_Id])
REFERENCES [dbo].[Question_Answers] ([Question_ID], [Answer_ID])
GO
ALTER TABLE [dbo].[Students_Answers] CHECK CONSTRAINT [Students_Answers_Ans]
GO
ALTER TABLE [dbo].[Students_Answers]  WITH CHECK ADD  CONSTRAINT [Students_Answers_Exam_FK] FOREIGN KEY([Exam_Id])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Students_Answers] CHECK CONSTRAINT [Students_Answers_Exam_FK]
GO
ALTER TABLE [dbo].[Students_Answers]  WITH CHECK ADD  CONSTRAINT [Students_Answers_Std_FK] FOREIGN KEY([Std_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Students_Answers] CHECK CONSTRAINT [Students_Answers_Std_FK]
GO
ALTER TABLE [dbo].[Students_Exams]  WITH CHECK ADD FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Students_Exams]  WITH CHECK ADD FOREIGN KEY([Student_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Topics_ILOs]  WITH CHECK ADD  CONSTRAINT [FK_ILOs_Topics_ILOs] FOREIGN KEY([ILO_Id])
REFERENCES [dbo].[ILOs] ([Id])
GO
ALTER TABLE [dbo].[Topics_ILOs] CHECK CONSTRAINT [FK_ILOs_Topics_ILOs]
GO
ALTER TABLE [dbo].[Topics_ILOs]  WITH CHECK ADD  CONSTRAINT [FK_Topics_Topics_ILOs] FOREIGN KEY([Topic_Id])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[Topics_ILOs] CHECK CONSTRAINT [FK_Topics_Topics_ILOs]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD CHECK  (([Exam_Type]='Quiz' OR [Exam_Type]='Midterm' OR [Exam_Type]='Final'))
GO
