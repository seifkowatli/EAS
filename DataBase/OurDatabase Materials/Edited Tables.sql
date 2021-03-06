USE [EAS_Database]
GO
/****** Object:  Table [dbo].[ILOs]    Script Date: 5/25/2018 7:28:40 AM ******/
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
/****** Object:  Table [dbo].[Question_Answers]    Script Date: 5/25/2018 7:28:40 AM ******/
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
/****** Object:  Table [dbo].[Questions_Bank]    Script Date: 5/25/2018 7:28:40 AM ******/
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
PRIMARY KEY CLUSTERED 
(
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 5/25/2018 7:28:40 AM ******/
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
/****** Object:  Table [dbo].[Topics_ILOs]    Script Date: 5/25/2018 7:28:40 AM ******/
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
ALTER TABLE [dbo].[ILOs]  WITH CHECK ADD  CONSTRAINT [FK_ILOs_Course] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[ILOs] CHECK CONSTRAINT [FK_ILOs_Course]
GO
ALTER TABLE [dbo].[Question_Answers]  WITH CHECK ADD FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Questions_Bank] ([Question_ID])
GO
ALTER TABLE [dbo].[Questions_Bank]  WITH CHECK ADD  CONSTRAINT [FK_Question_Topic] FOREIGN KEY([Topic_Id])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[Questions_Bank] CHECK CONSTRAINT [FK_Question_Topic]
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
