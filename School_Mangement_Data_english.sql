--CREATE DATABASE [SchoolDB]

ALTER DATABASE [SchoolDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SchoolDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SchoolDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SchoolDB] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchoolDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchoolDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SchoolDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SchoolDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SchoolDB] SET QUERY_STORE = OFF
GO
USE [SchoolDB]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountriesID] [int] IDENTITY(1,1) NOT NULL,
	[ISO] [nvarchar](10) NOT NULL,
	[CountryName] [nvarchar](100) NOT NULL,
	[PhoneCode] [int] NOT NULL,
	[ISO3] [nchar](10) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouresSubjects](
	[CoursesSubjectsID] [int] IDENTITY(1,1) NOT NULL,
	[CoursesID] [int] NOT NULL,
	[SubjectsID] [int] NOT NULL,
 CONSTRAINT [PK_CouresSubjects] PRIMARY KEY CLUSTERED 
(
	[CoursesSubjectsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CoursesID] [int] IDENTITY(1,1) NOT NULL,
	[CoursesName] [nvarchar](50) NOT NULL,
	[CoursesDescription] [nvarchar](500) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CoursesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentsID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Gender] [nchar](10) NULL,
	[DateOfBirth] [datetime] NULL,
	[Address] [nvarchar](100) NULL,
	[CountriesID] [int] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentsCourses](
	[StudentsCoursesID] [int] IDENTITY(1,1) NOT NULL,
	[StudentsID] [int] NOT NULL,
	[CoursesID] [int] NOT NULL,
	[Passed] [bit] NULL,
	[StartDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StudentsCourses] PRIMARY KEY CLUSTERED 
(
	[StudentsCoursesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](50) NOT NULL,
	[SubjectDescription] [nvarchar](500) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeachersID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](20) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Adress] [nvarchar](100) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[TeachersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachersCourses](
	[TeachersCoursesID] [int] IDENTITY(1,1) NOT NULL,
	[TeachersID] [int] NOT NULL,
	[CoursesID] [int] NOT NULL,
 CONSTRAINT [PK_TeachersCourses] PRIMARY KEY CLUSTERED 
(
	[TeachersCoursesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UsersID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[Administrator] [bit] NULL,
	[UserEmail] [nvarchar](50) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UsersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
ALTER TABLE [dbo].[Countries] ADD  CONSTRAINT [DF_Countries_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Courses] ADD  CONSTRAINT [DF_Courses_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Subjects] ADD  CONSTRAINT [DF_Subjects_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Teachers] ADD  CONSTRAINT [DF_Teachers_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
-----------------------------------------------------------------------------------------
ALTER TABLE [dbo].[CouresSubjects]  WITH CHECK ADD  CONSTRAINT [FK_CouresSubjects_Courses] FOREIGN KEY([CoursesID])
REFERENCES [dbo].[Courses] ([CoursesID])
GO
ALTER TABLE [dbo].[CouresSubjects] CHECK CONSTRAINT [FK_CouresSubjects_Courses]
GO
ALTER TABLE [dbo].[CouresSubjects]  WITH CHECK ADD  CONSTRAINT [FK_CouresSubjects_Subjects] FOREIGN KEY([SubjectsID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[CouresSubjects] CHECK CONSTRAINT [FK_CouresSubjects_Subjects]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Countries] FOREIGN KEY([CountriesID])
REFERENCES [dbo].[Countries] ([CountriesID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Countries]
GO
ALTER TABLE [dbo].[StudentsCourses]  WITH CHECK ADD  CONSTRAINT [FK_StudentsCourses_Courses] FOREIGN KEY([CoursesID])
REFERENCES [dbo].[Courses] ([CoursesID])
GO
ALTER TABLE [dbo].[StudentsCourses] CHECK CONSTRAINT [FK_StudentsCourses_Courses]
GO
ALTER TABLE [dbo].[StudentsCourses]  WITH CHECK ADD  CONSTRAINT [FK_StudentsCourses_Students] FOREIGN KEY([StudentsID])
REFERENCES [dbo].[Students] ([StudentsID])
GO
ALTER TABLE [dbo].[StudentsCourses] CHECK CONSTRAINT [FK_StudentsCourses_Students]
GO
ALTER TABLE [dbo].[TeachersCourses]  WITH CHECK ADD  CONSTRAINT [FK_TeachersCourses_Courses] FOREIGN KEY([CoursesID])
REFERENCES [dbo].[Courses] ([CoursesID])
GO
ALTER TABLE [dbo].[TeachersCourses] CHECK CONSTRAINT [FK_TeachersCourses_Courses]
GO
ALTER TABLE [dbo].[TeachersCourses]  WITH CHECK ADD  CONSTRAINT [FK_TeachersCourses_Teachers1] FOREIGN KEY([TeachersID])
REFERENCES [dbo].[Teachers] ([TeachersID])
GO
ALTER TABLE [dbo].[TeachersCourses] CHECK CONSTRAINT [FK_TeachersCourses_Teachers1]
GO
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountriesID], [ISO], [CountryName], [PhoneCode], [ISO3], [Deleted]) VALUES (5041, N'sr', N'Srbija', 381, N'srb       ', 0)
INSERT [dbo].[Countries] ([CountriesID], [ISO], [CountryName], [PhoneCode], [ISO3], [Deleted]) VALUES (5042, N'ch', N'China', 86, N'chn       ', 0)
INSERT [dbo].[Countries] ([CountriesID], [ISO], [CountryName], [PhoneCode], [ISO3], [Deleted]) VALUES (5043, N'de', N'Germany', 49, N'DEU       ', 0)
INSERT [dbo].[Countries] ([CountriesID], [ISO], [CountryName], [PhoneCode], [ISO3], [Deleted]) VALUES (5044, N'it', N'Italy', 39, N'ita       ', 0)
INSERT [dbo].[Countries] ([CountriesID], [ISO], [CountryName], [PhoneCode], [ISO3], [Deleted]) VALUES (5045, N'fr', N'France', 33, N'fra       ', 0)
INSERT [dbo].[Countries] ([CountriesID], [ISO], [CountryName], [PhoneCode], [ISO3], [Deleted]) VALUES (5046, N'tu', N'Turkey', 90, N'tur       ', 0)
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[Courses] ON 
INSERT [dbo].[Courses] ([CoursesID], [CoursesName], [CoursesDescription], [Deleted]) 
VALUES (8056, N'Microsoft Development', 
N'The Microsoft Development education program at ITAcademy', 0)

INSERT [dbo].[Courses] ([CoursesID], [CoursesName], [CoursesDescription], [Deleted]) 
VALUES (8057, N'PHP Web Development', 
N'PHP is a simple yet powerful scripting programming language for creating dynamic web content.', 0)

INSERT [dbo].[Courses] ([CoursesID], [CoursesName], [CoursesDescription], [Deleted]) 
VALUES (8058, N'Frontend JavaScript Development', 
N'The development of interactive websites and web applications is one of the most in-demand professions today.  ', 0)

INSERT [dbo].[Courses] ([CoursesID], [CoursesName], [CoursesDescription], [Deleted]) 
VALUES (8059, N'Software Engineering', 
N'In the modern world, software is practically unavoidable and omnipresent.', 0)
SET IDENTITY_INSERT [dbo].[Courses] OFF
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted])  VALUES (5015, N'Introduction to Programming in C#', 
N'The C# programming course will enable you to acquire highly useful knowledge and skills in one of the most widely used programming languages in the IT world.', 0)

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) 
VALUES (5016, N'Advanced C# Programming', 
N'The Advanced Programming in C# course is designed as a logical continuation of the introductory course "Introduction to Programming in C#."', 0)

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) 
VALUES (5017, N'Application Testing and Debugging', 
N'The Application Testing and Debugging course covers various approaches for detecting and fixing errors and testing .NET applications.', 0)

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) 
VALUES (5018, N'SQL Programming and Administration', 
N'SQL, or Structured Query Language, is a language based on the relational database model.', 0)

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) 
VALUES (5019, N'Data Access Course', 
N'Data handling is fundamental to almost every application, regardless of its type and size.', 0)

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) 
VALUES (5020, N'Introduction to HTML and CSS', 
N'HTML, or HyperText Markup Language, is a descriptive language used to create websites, specifically defining the functionality of web page elements.
', 0)

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) 
VALUES (5021, N'Core PHP Programming', 
N'Before providing key information about the PHP programming language itself, this course introduces the concept of Core PHP.', 0)

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) 
VALUES (5022, N'Adobe Dreamweaver CC', 
N'The Adobe Dreamweaver software is among the most well-known programs for creating and editing web content.', 0)

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) 
VALUES (5023, N'Building Web Applications', 
N'PHP is one of the most popular programming languages, primarily due to its simplicity and ease of learning, which allows beginners to progress quickly.', 0)

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) 
VALUES (5024, N'Introduction to Frontend Development', 
N'The Introduction to Frontend Development course is primarily intended for beginners in this field.', 0)

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) 
VALUES (5025, N'HTML & CSS Fundamentals', 
N'This course contains all the essential building blocks needed to create or modify HTML pages.', 0)

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) 
VALUES (5026, N'JavaScript Programming Fundamentals', 
N'The JavaScript Programming Fundamentals course covers the JavaScript scripting language, which is designed for defining web page functionality on the client side.', 0)

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) 
VALUES (5027, N'User Requirements for Software Development', 
N'Software is now an integral part of everyday life in the 21st century.', 0)

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) 
VALUES (5028, N'Software Design Fundamentals', 
N'The Software Design Fundamentals course focuses on software design, which is a crucial activity in the software engineering lifecycle.', 0)

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) 
VALUES (5029, N'Unified Modeling Language', 
N'Unified Modeling Language (UML) is a visual modeling language used for specifying, visualizing, constructing, and documenting software systems.', 0)

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectDescription], [Deleted]) 
VALUES (9999, N'C++', 
N'C++', 0)
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[CouresSubjects] ON 

INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8060, 8056, 5015)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8061, 8056, 5016)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8062, 8056, 5017)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8063, 8056, 5018)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8064, 8056, 5019)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8065, 8057, 5020)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8066, 8057, 5021)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8067, 8057, 5022)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8068, 8057, 5023)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8069, 8058, 5024)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8070, 8058, 5025)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8071, 8058, 5026)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8072, 8059, 5027)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8073, 8059, 5028)
INSERT [dbo].[CouresSubjects] ([CoursesSubjectsID], [CoursesID], [SubjectsID]) VALUES (8074, 8059, 5029)
SET IDENTITY_INSERT [dbo].[CouresSubjects] OFF
GO
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentsID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Address], [CountriesID], [Deleted]) VALUES (5118, N'Boris', N'Paunovic', N'dimenzije23@gmail.com', N'Male      ', CAST(N'2001-11-21T01:24:40.000' AS DateTime), N'Prote mateje 4 vinca', 5041, 0)
INSERT [dbo].[Students] ([StudentsID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Address], [CountriesID], [Deleted]) VALUES (5119, N'Borivoje', N'Shurdilovic', N'Borivoje@gmail.com', N'Male      ', CAST(N'2015-06-03T01:25:43.000' AS DateTime), N'Borivoja surdilovica 56', 5043, 0)
INSERT [dbo].[Students] ([StudentsID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Address], [CountriesID], [Deleted]) VALUES (5120, N'Kristina', N'Ramic', N'Kika@gmail.com', N'Female    ', CAST(N'2022-01-01T01:26:36.000' AS DateTime), N'Kristine kirsanove', 5041, 0)
INSERT [dbo].[Students] ([StudentsID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Address], [CountriesID], [Deleted]) VALUES (5121, N'Brankica', N'Branicic', N'Brankica@gmail.com', N'Female    ', CAST(N'2022-01-12T01:27:28.000' AS DateTime), N'Branislava 87', 5042, 0)
INSERT [dbo].[Students] ([StudentsID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Address], [CountriesID], [Deleted]) VALUES (5122, N'Sonja', N'Svetlanovic', N'asidid@.com', N'Male      ', CAST(N'2003-08-08T01:28:14.000' AS DateTime), N'pabla pikasa3', 5041, 0)
INSERT [dbo].[Students] ([StudentsID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Address], [CountriesID], [Deleted]) VALUES (5123, N'Probanka', N'probankovic', N'Proba34@.com', N'Female    ', CAST(N'2021-12-30T01:29:21.000' AS DateTime), N'Proba 34', 5042, 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[StudentsCourses] ON 

INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7099, 5118, 8056, NULL, CAST(N'2020-07-10T01:24:40.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7100, 5119, 8056, NULL, CAST(N'2021-12-29T01:25:43.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7101, 5120, 8056, NULL, CAST(N'2021-12-30T01:26:36.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7102, 5120, 8057, NULL, CAST(N'2021-12-30T01:26:36.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7103, 5120, 8058, NULL, CAST(N'2021-12-30T01:26:36.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7104, 5120, 8059, NULL, CAST(N'2021-12-30T01:26:36.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7105, 5121, 8056, NULL, CAST(N'2022-01-06T01:27:28.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7106, 5121, 8057, NULL, CAST(N'2022-01-06T01:27:28.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7107, 5121, 8059, NULL, CAST(N'2022-01-06T01:27:28.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7108, 5122, 8056, NULL, CAST(N'2022-01-05T01:28:14.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7109, 5122, 8057, NULL, CAST(N'2022-01-05T01:28:14.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7110, 5122, 8058, NULL, CAST(N'2022-01-05T01:28:14.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7111, 5122, 8059, NULL, CAST(N'2022-01-05T01:28:14.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7112, 5123, 8056, NULL, CAST(N'2021-12-30T01:29:21.000' AS DateTime))
INSERT [dbo].[StudentsCourses] ([StudentsCoursesID], [StudentsID], [CoursesID], [Passed], [StartDate]) VALUES (7113, 5123, 8059, NULL, CAST(N'2021-12-30T01:29:21.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[StudentsCourses] OFF
GO
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([TeachersID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Adress], [Deleted]) VALUES (6017, N'Milan', N'Milankovic', N'Milan@gmai.com', N'Male', CAST(N'1980-11-14T01:21:23.000' AS DateTime), N'Milana milica 4', 0)
INSERT [dbo].[Teachers] ([TeachersID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Adress], [Deleted]) VALUES (6018, N'Pera', N'Peric', N'Pera@gmail.com', N'Male', CAST(N'2022-01-14T01:22:31.000' AS DateTime), N'Perijevska 45', 0)
INSERT [dbo].[Teachers] ([TeachersID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Adress], [Deleted]) VALUES (6019, N'Mira', N'Miric', N'Mira@gmail.com', N'Female', CAST(N'2022-01-21T01:23:08.000' AS DateTime), N'Mirijevska 76', 0)
INSERT [dbo].[Teachers] ([TeachersID], [FirstName], [LastName], [Email], [Gender], [DateOfBirth], [Adress], [Deleted]) VALUES (6020, N'Ema ', N'Fisher', N'Ema@gmail.com', N'Female', CAST(N'2022-01-15T01:23:53.000' AS DateTime), N'Some random location', 0)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[TeachersCourses] ON 

INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6017, 6017, 8056)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6018, 6017, 8059)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6019, 6018, 8056)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6020, 6018, 8058)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6021, 6019, 8056)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6022, 6019, 8057)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6023, 6019, 8058)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6024, 6019, 8059)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6025, 6020, 8056)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6026, 6020, 8058)
INSERT [dbo].[TeachersCourses] ([TeachersCoursesID], [TeachersID], [CoursesID]) VALUES (6027, 6020, 8059)
SET IDENTITY_INSERT [dbo].[TeachersCourses] OFF
GO
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UsersID], [UserName], [UserPassword], [Administrator], [UserEmail], [Deleted]) VALUES (5038, N'Boris1', N'Boris1', 1, N'Boris1@.com', 0)
INSERT [dbo].[Users] ([UsersID], [UserName], [UserPassword], [Administrator], [UserEmail], [Deleted]) VALUES (5039, N'Pera123', N'Pera123', 1, N'Pera123@gmail.com', 0)
INSERT [dbo].[Users] ([UsersID], [UserName], [UserPassword], [Administrator], [UserEmail], [Deleted]) VALUES (5040, N'Mira123', N'Mira123', 0, N'Mira123@.com', 0)
INSERT [dbo].[Users] ([UsersID], [UserName], [UserPassword], [Administrator], [UserEmail], [Deleted]) VALUES (5041, N'Kika12', N'Kika12', 0, N'Kika12@.com', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCourseSubject] (@CoursesID int,@SubjectsID int)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO CouresSubjects(CoursesID,SubjectsID) 
	VALUES(@CoursesID,@SubjectsID)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[AddStudentCourse] (@StudentId int,@CourseId int,@Startdate datetime)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO StudentsCourses(StudentsID,CoursesID,StartDate)
	VALUES(@StudentId,@CourseId,@Startdate)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[AddTeacherCourses](@TeachersID int,@CoursesID int)	
AS
BEGIN
	SET NOCOUNT ON;
	insert into TeachersCourses(TeachersID,CoursesID) values(@TeachersID,@CoursesID)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCountry] (@CountryId int)
AS
BEGIN
	SET NOCOUNT ON;
   UPDATE Countries
   SET Deleted= 1
   WHERE CountriesID=@CountryId
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCourse](@CoursesID int)	 
AS
BEGIN
	SET NOCOUNT ON;
UPDATE Courses
   SET Deleted=1
   WHERE CoursesID=@CoursesID
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStudent] (@StudentsID int)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Students
   SET Deleted=1
   WHERE StudentsID=@StudentsID
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteSubject](@SubjectId int)
AS
BEGIN
	SET NOCOUNT ON;
UPDATE Subjects
   SET Deleted=1
   WHERE SubjectID=@SubjectId
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTeacher](@TeachersID int)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Teachers
   SET Deleted=1
   WHERE TeachersID=@TeachersID
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUser](@UserID int) 
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Users
   SET Deleted=1
   WHERE UsersID=@UserID
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserByUsername](@Username nvarchar(50)) 
AS
BEGIN
	SET NOCOUNT ON;
	Select Username,UserPassword,UserEmail,Administrator 
	FROM Users 
	where Username=@Username and Deleted=0
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUser](@UserName nvarchar(50),@UserPassword nvarchar(50),@UserEmail nvarchar(50),@Administrator bit)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Users(UserName,UserPassword,UserEmail,Administrator)
	VALUES(@UserName,@UserPassword,@UserEmail,@Administrator)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveCountry](@ISO nvarchar(2),@CountryName nvarchar(50),@PhoneCode int,@ISO3 nvarchar(3))
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Countries(ISO,CountryName,PhoneCode,ISO3)
	VALUES(@ISO,@CountryName,@PhoneCode,@ISO3)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveCourse](@CoursesName nvarchar(50),@CoursesDescription nvarchar(500))
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Courses(CoursesName,CoursesDescription)
	VALUES (@CoursesName,@CoursesDescription)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveStudent](@FirstName nvarchar(50),@LastName nvarchar(50),@Email nvarchar(50),@Gender nvarchar(10),@DateOfBirth datetime,@Adress nvarchar(50),@CountriesID int) 
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Students(FirstName,LastName,Email,Gender,DateOfBirth,Address,CountriesID) 
	VALUES(@FirstName,@LastName,@Email,@Gender,@DateOfBirth,@Adress,@CountriesID)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveSubject] (@SubjectName nvarchar(50),@SubjectDescription nvarchar (500))
AS
BEGIN
	SET NOCOUNT ON;
	insert into Subjects(SubjectName,SubjectDescription) values(@SubjectName,@SubjectDescription)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SaveTeacher](@FirstName nvarchar(50),@LastName nvarchar(50),@Email nvarchar(50),@Gender nvarchar (10),@DateOfBirth datetime,@Adress nvarchar(50))
AS
BEGIN
	SET NOCOUNT ON;
	insert into Teachers(FirstName,LastName,Email,Gender,DateOfBirth,Adress)
	values(@FirstName,@LastName,@Email,@Gender,@DateOfBirth,@Adress)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllCountryes] 
AS
BEGIN
	SET NOCOUNT ON;
    select countriesid,CountryName,ISO,iso3,PhoneCode,Deleted from Countries where Deleted=0
END
GO
EXEC  [dbo].[SelectAllCountryes] 
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SelectAllCourses]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT CoursesID,CoursesName,CoursesDescription,Deleted FROM Courses where Deleted=0
END
GO
EXEC  [dbo].[SelectAllCourses]
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllCoursesSubjects]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT CoursesSubjectsID,CoursesID,SubjectsID FROM CouresSubjects
END
GO
EXEC [dbo].[SelectAllCoursesSubjects]
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllStudentsResault]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT S.StudentsID ,S.FirstName,S.LastName,S.Email,s.Gender,s.DateOfBirth,s.Address,C.CoursesName,SC.Passed,SC.StartDate,C.CoursesDescription,Co.CountryName
	FROM Students AS S 
	left join StudentsCourses AS SC ON S.StudentsID=SC.StudentsID 
	left join Courses AS C ON SC.CoursesID=C.CoursesID
	left join Countries AS Co ON S.CountriesID=Co.CountriesID
	where s.Deleted=0 and c.Deleted=0 
END
GO
EXEC [dbo].[SelectAllStudentsResault];
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllSubjects]
AS
BEGIN
	SET NOCOUNT ON;
	select SubjectID,SubjectName,SubjectDescription,Deleted
	from Subjects
	where Deleted=0
END
GO
EXEC [dbo].[SelectAllSubjects]
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllTeachersJoinCourses]
AS
BEGIN
	SET NOCOUNT ON;
	select T.TeachersID,T.FirstName,T.LastName,T.Email,T.Gender,T.DateOfBirth,T.Adress,TC.TeachersCoursesID,C.CoursesID,C.CoursesName,C.CoursesDescription 
	from Teachers as T
	left join TeachersCourses as TC on t.TeachersID= TC.TeachersID
	left join Courses as C on TC.CoursesID= C.CoursesID  
	where C.Deleted=0 and T.Deleted=0
END
GO
EXEC [dbo].[SelectAllTeachersJoinCourses]
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllUsers] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT UsersID,UserName,UserEmail,UserPassword,Administrator,Deleted 
	FROM Users
	where Deleted=0
END
GO
EXEC  [dbo].[SelectAllUsers] 
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectCountryByName](@CountryName nvarchar(50))
AS
BEGIN
	SET NOCOUNT ON;
	select CountriesID from Countries where CountryName = @CountryName and Deleted=0
END
GO
EXEC [dbo].[SelectCountryByName] @CountryName = 'China'
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectCourseByName](@CoursesName nvarchar(50))
AS
BEGIN
	SET NOCOUNT ON;
	SELECT CoursesID,CoursesName,CoursesDescription 
	FROM Courses
	WHERE CoursesName=@CoursesName and Deleted=0
END
GO
EXEC  [dbo].[SelectCourseByName] @CoursesName = 'Microsoft Development'
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectCoursesSubjectsById] (@CoursesID int)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT CoursesSubjectsID,CoursesID,SubjectsID
	FROM CouresSubjects 
	WHERE CoursesID=@CoursesID
END
GO
EXEC [dbo].[SelectCoursesSubjectsById] @CoursesID = 8056;
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectLastStudent]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT top 1 StudentsID,FirstName,LastName,Email,Gender,DateOfBirth,Address,CountriesID 
	FROM Students  
	where Deleted=0
	ORDER BY StudentsID DESC
END
GO
EXEC [dbo].[SelectLastStudent]
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectStudentByName](@FirstName nvarchar(50))
AS
BEGIN
	SET NOCOUNT ON;
	select StudentsID,FirstName,LastName,Email,Gender,DateOfBirth,Address,CountriesID
	from Students 
	where FirstName=@FirstName and Deleted=0
END
GO
EXEC [dbo].[SelectStudentByName] @FirstName = 'Kristina'
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectSubjectByName](@SubjectName nvarchar(50))
AS
BEGIN
	SET NOCOUNT ON;
	select SubjectID,SubjectDescription,SubjectName
	from Subjects
	where SubjectName=@SubjectName and Deleted=0
END
GO
EXEC [dbo].[SelectSubjectByName] @SubjectName = 'Advanced C# Programming'
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectTeacherByName](@FirstName nvarchar(50))	
AS
BEGIN
	SET NOCOUNT ON;
	 select TeachersID,FirstName,LastName,Email,Gender,DateOfBirth,Adress
	 from Teachers
	 where FirstName = @FirstName and Deleted=0
END
GO
EXEC [dbo].[SelectTeacherByName] @FirstName = 'Mira'
-----------------------------------------------------------------------------------------	
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[UpdateCourseSubject](@SubjectsID int,@CoursesSubjectsID int,@CoursesID int)
AS
BEGIN
	SET NOCOUNT ON;
	update CouresSubjects 
	set SubjectsID=@SubjectsID 
	where CoursesSubjectsID=@CoursesSubjectsID and CoursesID=@CoursesID
END
GO
EXEC [dbo].[UpdateCourseSubject] @SubjectsID = 9999, @CoursesSubjectsID = 8064, @CoursesID = 8056
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------









select * from [dbo].[Countries]
select * from [dbo].[Courses]
select * from [dbo].[Subjects]
select * from [dbo].[CouresSubjects]
select * from [dbo].[Students]
select * from [dbo].[StudentsCourses]
select * from [dbo].[Teachers]
select * from [dbo].[TeachersCourses]
select * from [dbo].[Users]
