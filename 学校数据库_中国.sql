ALTER DATABASE [学校数据库] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
BEGIN
EXEC [学校数据库].[dbo].[sp_fulltext_database] @action = 'enable'
END
GO
ALTER DATABASE [学校数据库] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [学校数据库] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [学校数据库] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [学校数据库] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [学校数据库] SET ARITHABORT OFF 
GO
ALTER DATABASE [学校数据库] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [学校数据库] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [学校数据库] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [学校数据库] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [学校数据库] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [学校数据库] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [学校数据库] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [学校数据库] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [学校数据库] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [学校数据库] SET DISABLE_BROKER 
GO
ALTER DATABASE [学校数据库] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [学校数据库] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [学校数据库] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [学校数据库] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [学校数据库] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [学校数据库] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [学校数据库] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [学校数据库] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [学校数据库] SET MULTI_USER 
GO
ALTER DATABASE [学校数据库] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [学校数据库] SET DB_CHAINING OFF 
GO
ALTER DATABASE [学校数据库] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [学校数据库] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [学校数据库] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [学校数据库] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [学校数据库] SET QUERY_STORE = OFF
GO
USE [学校数据库]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[国家](
	[国家编号] [int] IDENTITY(1,1) NOT NULL,
	[国际标准化组织代码] [nvarchar](10) NOT NULL,
	[国家名称] [nvarchar](100) NOT NULL,
	[电话区号] [int] NOT NULL,
	[国际标准化组织三字代码]  [nchar](10) NOT NULL,
	[已删除] [bit] NULL,
 CONSTRAINT [PK_国家编号] PRIMARY KEY CLUSTERED 
(
	[国家编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[课程科目](
	[课程科目编号] [int] IDENTITY(1,1) NOT NULL,
	[课程编号] [int] NOT NULL,
	[科目编号] [int] NOT NULL,
 CONSTRAINT [PK_课程科目] PRIMARY KEY CLUSTERED 
(
	[课程科目编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[课程](
	[课程编号] [int] IDENTITY(1,1) NOT NULL,
	[课程名称] [nvarchar](50) NOT NULL,
	[课程描述] [nvarchar](500) NOT NULL,
	[已删除] [bit] NULL,
 CONSTRAINT [PK_课程] PRIMARY KEY CLUSTERED 
(
	[课程编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[学生](
	[学生编号] [int] IDENTITY(1,1) NOT NULL,
	[名字] [nvarchar](20) NOT NULL,
	[姓氏] [nvarchar](20) NULL,
	[电子邮件] [nvarchar](50) NULL,
	[性别] [nchar](10) NULL,
	[出生日期] [datetime] NULL,
	[地址] [nvarchar](100) NULL,
	[国家编号] [int] NULL,
	[已删除] [bit] NULL,
 CONSTRAINT [PK_学生] PRIMARY KEY CLUSTERED 
(
	[学生编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[学生课程](
	[学生课程编号] [int] IDENTITY(1,1) NOT NULL,
	[学生编号] [int] NOT NULL,
	[课程编号] [int] NOT NULL,
	[通过] [bit] NULL,
	[开始日期] [datetime] NOT NULL,
 CONSTRAINT [PK_学生课程] PRIMARY KEY CLUSTERED 
(
	[学生课程编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[科目](
	[科目编号] [int] IDENTITY(1,1) NOT NULL,
	[科目名称] [nvarchar](50) NOT NULL,
	[科目描述] [nvarchar](500) NOT NULL,
	[已删除] [bit] NULL,
 CONSTRAINT [PK_科目] PRIMARY KEY CLUSTERED 
(
	[科目编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教师](
	[教师编号] [int] IDENTITY(1,1) NOT NULL,
	[名字] [nvarchar](20) NOT NULL,
	[姓氏] [nvarchar](20) NOT NULL,
	[电子邮件] [nvarchar](20) NOT NULL,
	[性别] [nvarchar](10) NOT NULL,
	[出生日期] [datetime] NOT NULL,
	[地址] [nvarchar](100) NOT NULL,
	[已删除] [bit] NULL,
 CONSTRAINT [PK_教师] PRIMARY KEY CLUSTERED 
(
	[教师编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教师课程](
	[教师课程编号] [int] IDENTITY(1,1) NOT NULL,
	[教师编号] [int] NOT NULL,
	[课程编号] [int] NOT NULL,
 CONSTRAINT [PK_教师课程] PRIMARY KEY CLUSTERED 
(
	[教师课程编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[用户](
	[用户编号] [int] IDENTITY(1,1) NOT NULL,	
	[用户名] [nvarchar](50) NOT NULL,
	[用户密码] [nvarchar](50) NOT NULL,
	[管理员] [bit] NULL,
	[用户邮箱] [nvarchar](50) NOT NULL,
	[已删除] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[用户编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-----------------------------------------------------------------------------------------
ALTER TABLE [dbo].[国家] ADD  CONSTRAINT [DF_国家_已删除]  DEFAULT ((0)) FOR [已删除]
GO
ALTER TABLE [dbo].[课程] ADD  CONSTRAINT [DF_课程_已删除]  DEFAULT ((0)) FOR [已删除]
GO
ALTER TABLE [dbo].[学生] ADD  CONSTRAINT [DF_学生_已删除]  DEFAULT ((0)) FOR [已删除]
GO
ALTER TABLE [dbo].[科目] ADD  CONSTRAINT [DF_科目_已删除]  DEFAULT ((0)) FOR [已删除]
GO
ALTER TABLE [dbo].[教师] ADD  CONSTRAINT [DF_教师_已删除]  DEFAULT ((0)) FOR [已删除]
GO
ALTER TABLE [dbo].[用户] ADD  CONSTRAINT [DF_用户_Deleted]  DEFAULT ((0)) FOR [已删除]
GO
-----------------------------------------------------------------------------------------
ALTER TABLE [dbo].[课程科目]  WITH CHECK ADD  CONSTRAINT [FK_课程科目_课程] FOREIGN KEY([课程编号])
REFERENCES [dbo].[课程] ([课程编号])
GO
ALTER TABLE [dbo].[课程科目]   CHECK CONSTRAINT [FK_课程科目_课程]
GO
ALTER TABLE [dbo].[课程科目]  WITH CHECK ADD  CONSTRAINT [FK_课程科目_科目] FOREIGN KEY([科目编号])
REFERENCES [dbo].[科目] ([科目编号])
GO
ALTER TABLE [dbo].[课程科目] CHECK CONSTRAINT [FK_课程科目_科目]
GO
ALTER TABLE [dbo].[学生]  WITH CHECK ADD  CONSTRAINT [FK_学生_国家] FOREIGN KEY([国家编号])
REFERENCES [dbo].[国家] ([国家编号])
GO
ALTER TABLE [dbo].[学生] CHECK CONSTRAINT [FK_学生_国家]
GO
ALTER TABLE [dbo].[学生课程] WITH CHECK ADD  CONSTRAINT [FK_学生课程_课程] FOREIGN KEY([课程编号])
REFERENCES [dbo].[课程] ([课程编号])
GO
ALTER TABLE [dbo].[学生课程] CHECK CONSTRAINT [FK_学生课程_课程]
GO
ALTER TABLE [dbo].[学生课程]  WITH CHECK ADD  CONSTRAINT [FK_学生课程_学生] FOREIGN KEY([学生编号])
REFERENCES [dbo].[学生] ([学生编号])
GO
ALTER TABLE [dbo].[学生课程] CHECK CONSTRAINT [FK_学生课程_学生]
GO
ALTER TABLE [dbo].[教师课程]  WITH CHECK ADD  CONSTRAINT [FK_教师课程_课程] FOREIGN KEY([课程编号])
REFERENCES [dbo].[课程] ([课程编号])
GO
ALTER TABLE [dbo].[教师课程] CHECK CONSTRAINT [FK_教师课程_课程]
GO
ALTER TABLE [dbo].[教师课程]  WITH CHECK ADD  CONSTRAINT [FK_教师课程_教师] FOREIGN KEY([教师编号])
REFERENCES [dbo].[教师] ([教师编号])
GO
ALTER TABLE [dbo].[教师课程] CHECK CONSTRAINT [FK_教师课程_教师]
GO
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[国家] ON 

INSERT [dbo].[国家] ([国家编号], [国际标准化组织代码], [国家名称], [电话区号], [国际标准化组织三字代码], [已删除]) VALUES (5041, N'sr', N'Srbija', 381, N'srb       ', 0)
INSERT [dbo].[国家] ([国家编号], [国际标准化组织代码], [国家名称], [电话区号], [国际标准化组织三字代码], [已删除]) VALUES (5042, N'ch', N'China', 86, N'chn       ', 0)
INSERT [dbo].[国家] ([国家编号], [国际标准化组织代码], [国家名称], [电话区号], [国际标准化组织三字代码], [已删除]) VALUES (5043, N'de', N'Germany', 49, N'DEU       ', 0)
INSERT [dbo].[国家] ([国家编号], [国际标准化组织代码], [国家名称], [电话区号], [国际标准化组织三字代码], [已删除]) VALUES (5044, N'it', N'Italy', 39, N'ita       ', 0)
INSERT [dbo].[国家] ([国家编号], [国际标准化组织代码], [国家名称], [电话区号], [国际标准化组织三字代码], [已删除]) VALUES (5045, N'fr', N'France', 33, N'fra       ', 0)
INSERT [dbo].[国家] ([国家编号], [国际标准化组织代码], [国家名称], [电话区号], [国际标准化组织三字代码], [已删除]) VALUES (5046, N'tu', N'Turkey', 90, N'tur       ', 0)
SET IDENTITY_INSERT [dbo].[国家] OFF
GO
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[课程] ON 

INSERT [dbo].[课程] ([课程编号], [课程名称], [课程描述], [已删除]) VALUES (8056, N'微软开发', N'ITAcademy 的微软开发教育课程。', 0)

INSERT [dbo].[课程] ([课程编号], [课程名称], [课程描述], [已删除]) VALUES (8057, N'PHP Web 开发', N'PHP 是一种简单而强大的脚本编程语言，用于创建动态 Web 内容。', 0)

INSERT [dbo].[课程] ([课程编号], [课程名称], [课程描述], [已删除]) VALUES (8058, N'前端 JavaScript 开发', N'开发交互式网站和 Web 应用程序是当今最受欢迎的职业之一。', 0)

INSERT [dbo].[课程] ([课程编号], [课程名称], [课程描述], [已删除])  VALUES (8059, N'软件工程', N'在现代世界中，软件几乎无处不在。', 0)

SET IDENTITY_INSERT [dbo].[课程] OFF 
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[科目] ON 
INSERT [dbo].[科目] ([科目编号], [科目名称], [科目描述], [已删除])  
VALUES (5015, N'C#编程入门', N'C#编程课程将使您掌握IT行业中最广泛使用的编程语言之一的关键知识和技能。', 0)

INSERT [dbo].[科目] ([科目编号], [科目名称], [科目描述], [已删除])   
VALUES (5016, N'高级C#编程', N'高级C#编程课程是“C#编程入门”课程的逻辑延续。', 0)

INSERT [dbo].[科目] ([科目编号], [科目名称], [科目描述], [已删除])   
VALUES (5017, N'应用程序测试与调试', N'应用程序测试与调试课程涵盖检测和修复错误以及测试.NET应用程序的各种方法。', 0)

INSERT [dbo].[科目] ([科目编号], [科目名称], [科目描述], [已删除])  
VALUES (5018, N'SQL编程与管理', N'SQL（结构化查询语言）是一种基于关系数据库模型的语言。', 0)

INSERT [dbo].[科目] ([科目编号], [科目名称], [科目描述], [已删除])   
VALUES (5019, N'数据访问课程', N'数据处理几乎是所有应用程序的基础，无论其类型和规模如何。', 0)

INSERT [dbo].[科目] ([科目编号], [科目名称], [科目描述], [已删除])   
VALUES (5020, N'HTML与CSS入门', N'HTML（超文本标记语言）是一种描述性语言，用于创建网站，特别是定义网页元素的功能。', 0)

INSERT [dbo].[科目] ([科目编号], [科目名称], [科目描述], [已删除])  
VALUES (5021, N'核心PHP编程', N'在介绍PHP编程语言的关键信息之前，本课程将首先介绍核心PHP的概念。', 0)

INSERT [dbo].[科目] ([科目编号], [科目名称], [科目描述], [已删除])   
VALUES (5022, N'Adobe Dreamweaver CC', N'Adobe Dreamweaver软件是最知名的网页内容创建和编辑工具之一。', 0)

INSERT [dbo].[科目] ([科目编号], [科目名称], [科目描述], [已删除])  
VALUES (5023, N'构建Web应用程序——高级PHP编程', N'PHP因其简单性和易学性而成为最受欢迎的编程语言之一，使初学者能够快速进步。', 0)

INSERT [dbo].[科目] ([科目编号], [科目名称], [科目描述], [已删除])  
VALUES (5024, N'前端开发入门', N'前端开发入门课程主要面向该领域的初学者。', 0)

INSERT [dbo].[科目] ([科目编号], [科目名称], [科目描述], [已删除])  
VALUES (5025, N'HTML与CSS基础', N'本课程包含创建或修改HTML页面所需的所有基本构建模块。', 0)

INSERT [dbo].[科目] ([科目编号], [科目名称], [科目描述], [已删除])  
VALUES (5026, N'JavaScript编程基础', N'JavaScript编程基础课程涵盖JavaScript脚本语言，该语言用于定义客户端网页的功能。', 0)

INSERT [dbo].[科目] ([科目编号], [科目名称], [科目描述], [已删除])   
VALUES (5027, N'软件开发用户需求', N'在21世纪，软件已成为日常生活中不可或缺的一部分。', 0)

INSERT [dbo].[科目] ([科目编号], [科目名称], [科目描述], [已删除])   
VALUES (5028, N'软件设计基础', N'软件设计基础课程专注于软件设计，它是软件工程生命周期中的关键活动。', 0)

INSERT [dbo].[科目] ([科目编号], [科目名称], [科目描述], [已删除])  
VALUES (5029, N'统一建模语言', N'统一建模语言（UML）是一种可视化建模语言，用于指定、可视化、构建和记录软件系统。', 0)

INSERT [dbo].[科目] ([科目编号], [科目名称], [科目描述], [已删除])  
VALUES (9999, N'C++', N'C++', 0)
SET IDENTITY_INSERT [dbo].[科目] OFF 
GO
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT  [dbo].[课程科目] ON

INSERT [dbo].[课程科目] ([课程科目编号], [课程编号], [科目编号]) VALUES (8060, 8056, 5015)
INSERT [dbo].[课程科目] ([课程科目编号], [课程编号], [科目编号]) VALUES (8061, 8056, 5016)
INSERT [dbo].[课程科目] ([课程科目编号], [课程编号], [科目编号]) VALUES (8062, 8056, 5017)
INSERT [dbo].[课程科目] ([课程科目编号], [课程编号], [科目编号]) VALUES (8063, 8056, 5018)
INSERT [dbo].[课程科目] ([课程科目编号], [课程编号], [科目编号]) VALUES (8064, 8056, 5019)
INSERT [dbo].[课程科目] ([课程科目编号], [课程编号], [科目编号]) VALUES (8065, 8057, 5020)
INSERT [dbo].[课程科目] ([课程科目编号], [课程编号], [科目编号]) VALUES (8066, 8057, 5021)
INSERT [dbo].[课程科目] ([课程科目编号], [课程编号], [科目编号]) VALUES (8067, 8057, 5022)
INSERT [dbo].[课程科目] ([课程科目编号], [课程编号], [科目编号]) VALUES (8068, 8057, 5023)
INSERT [dbo].[课程科目] ([课程科目编号], [课程编号], [科目编号]) VALUES (8069, 8058, 5024)
INSERT [dbo].[课程科目] ([课程科目编号], [课程编号], [科目编号]) VALUES (8070, 8058, 5025)
INSERT [dbo].[课程科目] ([课程科目编号], [课程编号], [科目编号]) VALUES (8071, 8058, 5026)
INSERT [dbo].[课程科目] ([课程科目编号], [课程编号], [科目编号]) VALUES (8072, 8059, 5027)
INSERT [dbo].[课程科目] ([课程科目编号], [课程编号], [科目编号]) VALUES (8073, 8059, 5028)
INSERT [dbo].[课程科目] ([课程科目编号], [课程编号], [科目编号]) VALUES (8074, 8059, 5029)
SET IDENTITY_INSERT [dbo].[课程科目] OFF
GO
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[学生] ON

INSERT [dbo].[学生] ([学生编号], [名字], [姓氏], [电子邮件], [性别], [出生日期], [地址], [国家编号], [已删除]) VALUES (5118, N'Boris', N'Paunovic', N'dimenzije23@gmail.com', N'男      ', CAST(N'2001-11-21T01:24:40.000' AS DateTime), N'Prote mateje 4 vinca', 5041, 0)
INSERT [dbo].[学生] ([学生编号], [名字], [姓氏], [电子邮件], [性别], [出生日期], [地址], [国家编号], [已删除]) VALUES (5119, N'Borivoje', N'Shurdilovic', N'Borivoje@gmail.com', N'男      ', CAST(N'2015-06-03T01:25:43.000' AS DateTime), N'Borivoja surdilovica 56', 5043, 0)
INSERT [dbo].[学生] ([学生编号], [名字], [姓氏], [电子邮件], [性别], [出生日期], [地址], [国家编号], [已删除]) VALUES (5120, N'Kristina', N'Ramic', N'Kika@gmail.com', N'男      ', CAST(N'2022-01-01T01:26:36.000' AS DateTime), N'Kristine kirsanove', 5041, 0)
INSERT [dbo].[学生] ([学生编号], [名字], [姓氏], [电子邮件], [性别], [出生日期], [地址], [国家编号], [已删除]) VALUES (5121, N'Brankica', N'Branicic', N'Brankica@gmail.com', N'男      ', CAST(N'2022-01-12T01:27:28.000' AS DateTime), N'Branislava 87', 5042, 0)
INSERT [dbo].[学生] ([学生编号], [名字], [姓氏], [电子邮件], [性别], [出生日期], [地址], [国家编号], [已删除]) VALUES (5122, N'Sonja', N'Svetlanovic', N'asidid@.com', N'男      ', CAST(N'2003-08-08T01:28:14.000' AS DateTime), N'pabla pikasa3', 5041, 0)
INSERT [dbo].[学生] ([学生编号], [名字], [姓氏], [电子邮件], [性别], [出生日期], [地址], [国家编号], [已删除]) VALUES (5123, N'Probanka', N'probankovic', N'Proba34@.com', N'男      ', CAST(N'2021-12-30T01:29:21.000' AS DateTime), N'Proba 34', 5042, 1)
SET IDENTITY_INSERT [dbo].[学生] OFF
GO
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT  [dbo].[学生课程] ON

INSERT [dbo].[学生课程]  ([学生课程编号], [学生编号], [课程编号], [通过], [开始日期]) VALUES (7099, 5118, 8056, NULL, CAST(N'2020-07-10T01:24:40.000' AS DateTime))
INSERT [dbo].[学生课程]  ([学生课程编号], [学生编号], [课程编号], [通过], [开始日期]) VALUES (7100, 5119, 8056, NULL, CAST(N'2021-12-29T01:25:43.000' AS DateTime))
INSERT [dbo].[学生课程]  ([学生课程编号], [学生编号], [课程编号], [通过], [开始日期]) VALUES (7101, 5120, 8056, NULL, CAST(N'2021-12-30T01:26:36.000' AS DateTime))
INSERT [dbo].[学生课程]  ([学生课程编号], [学生编号], [课程编号], [通过], [开始日期]) VALUES (7102, 5120, 8057, NULL, CAST(N'2021-12-30T01:26:36.000' AS DateTime))
INSERT [dbo].[学生课程]  ([学生课程编号], [学生编号], [课程编号], [通过], [开始日期]) VALUES (7103, 5120, 8058, NULL, CAST(N'2021-12-30T01:26:36.000' AS DateTime))
INSERT [dbo].[学生课程]  ([学生课程编号], [学生编号], [课程编号], [通过], [开始日期]) VALUES (7104, 5120, 8059, NULL, CAST(N'2021-12-30T01:26:36.000' AS DateTime))
INSERT [dbo].[学生课程]  ([学生课程编号], [学生编号], [课程编号], [通过], [开始日期]) VALUES (7105, 5121, 8056, NULL, CAST(N'2022-01-06T01:27:28.000' AS DateTime))
INSERT [dbo].[学生课程]  ([学生课程编号], [学生编号], [课程编号], [通过], [开始日期]) VALUES (7106, 5121, 8057, NULL, CAST(N'2022-01-06T01:27:28.000' AS DateTime))
INSERT [dbo].[学生课程]  ([学生课程编号], [学生编号], [课程编号], [通过], [开始日期]) VALUES (7107, 5121, 8059, NULL, CAST(N'2022-01-06T01:27:28.000' AS DateTime))
INSERT [dbo].[学生课程]  ([学生课程编号], [学生编号], [课程编号], [通过], [开始日期]) VALUES (7108, 5122, 8056, NULL, CAST(N'2022-01-05T01:28:14.000' AS DateTime))
INSERT [dbo].[学生课程]  ([学生课程编号], [学生编号], [课程编号], [通过], [开始日期]) VALUES (7109, 5122, 8057, NULL, CAST(N'2022-01-05T01:28:14.000' AS DateTime))
INSERT [dbo].[学生课程]  ([学生课程编号], [学生编号], [课程编号], [通过], [开始日期]) VALUES (7110, 5122, 8058, NULL, CAST(N'2022-01-05T01:28:14.000' AS DateTime))
INSERT [dbo].[学生课程]  ([学生课程编号], [学生编号], [课程编号], [通过], [开始日期]) VALUES (7111, 5122, 8059, NULL, CAST(N'2022-01-05T01:28:14.000' AS DateTime))
INSERT [dbo].[学生课程]  ([学生课程编号], [学生编号], [课程编号], [通过], [开始日期]) VALUES (7112, 5123, 8056, NULL, CAST(N'2021-12-30T01:29:21.000' AS DateTime))
INSERT [dbo].[学生课程]  ([学生课程编号], [学生编号], [课程编号], [通过], [开始日期]) VALUES (7113, 5123, 8059, NULL, CAST(N'2021-12-30T01:29:21.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[学生课程] OFF
GO
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[教师] ON 
INSERT [dbo].[教师] ([教师编号], [名字], [姓氏], [电子邮件], [性别], [出生日期], [地址], [已删除]) VALUES (6017, N'Milan', N'Milankovic', N'Milan@gmai.com', N'男', CAST(N'1980-11-14T01:21:23.000' AS DateTime), N'Milana milica 4', 0)
INSERT [dbo].[教师] ([教师编号], [名字], [姓氏], [电子邮件], [性别], [出生日期], [地址], [已删除]) VALUES (6018, N'Pera', N'Peric', N'Pera@gmail.com', N'男', CAST(N'2022-01-14T01:22:31.000' AS DateTime), N'Perijevska 45', 0)
INSERT [dbo].[教师] ([教师编号], [名字], [姓氏], [电子邮件], [性别], [出生日期], [地址], [已删除]) VALUES (6019, N'Mira', N'Miric', N'Mira@gmail.com', N'女', CAST(N'2022-01-21T01:23:08.000' AS DateTime), N'Mirijevska 76', 0)
INSERT [dbo].[教师] ([教师编号], [名字], [姓氏], [电子邮件], [性别], [出生日期], [地址], [已删除]) VALUES (6020, N'Ema ', N'Fisher', N'Ema@gmail.com', N'女', CAST(N'2022-01-15T01:23:53.000' AS DateTime), N'Some random location', 0)
SET IDENTITY_INSERT [dbo].[教师] OFF
GO
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[教师课程] ON 
INSERT [dbo].[教师课程] ([教师课程编号], [教师编号], [课程编号]) VALUES (6017, 6017, 8056)
INSERT [dbo].[教师课程] ([教师课程编号], [教师编号], [课程编号]) VALUES (6018, 6017, 8059)
INSERT [dbo].[教师课程] ([教师课程编号], [教师编号], [课程编号]) VALUES (6019, 6018, 8056)
INSERT [dbo].[教师课程] ([教师课程编号], [教师编号], [课程编号]) VALUES (6020, 6018, 8058)
INSERT [dbo].[教师课程] ([教师课程编号], [教师编号], [课程编号]) VALUES (6021, 6019, 8056)
INSERT [dbo].[教师课程] ([教师课程编号], [教师编号], [课程编号]) VALUES (6022, 6019, 8057)
INSERT [dbo].[教师课程] ([教师课程编号], [教师编号], [课程编号]) VALUES (6023, 6019, 8058)
INSERT [dbo].[教师课程] ([教师课程编号], [教师编号], [课程编号]) VALUES (6024, 6019, 8059)
INSERT [dbo].[教师课程] ([教师课程编号], [教师编号], [课程编号]) VALUES (6025, 6020, 8056)
INSERT [dbo].[教师课程] ([教师课程编号], [教师编号], [课程编号]) VALUES (6026, 6020, 8058)
INSERT [dbo].[教师课程] ([教师课程编号], [教师编号], [课程编号]) VALUES (6027, 6020, 8059)
SET IDENTITY_INSERT [dbo].[教师课程] OFF
GO
-----------------------------------------------------------------------------------------
SET IDENTITY_INSERT [dbo].[用户] ON 
INSERT [dbo].[用户] ([用户编号], [用户名], [用户密码], [管理员], [用户邮箱], [已删除]) VALUES (5038, N'Boris1', N'Boris1', 1, N'Boris1@.com', 0)
INSERT [dbo].[用户] ([用户编号], [用户名], [用户密码], [管理员], [用户邮箱], [已删除]) VALUES (5039, N'Pera123', N'Pera123', 1, N'Pera123@gmail.com', 0)
INSERT [dbo].[用户] ([用户编号], [用户名], [用户密码], [管理员], [用户邮箱], [已删除]) VALUES (5040, N'Mira123', N'Mira123', 0, N'Mira123@.com', 0)
INSERT [dbo].[用户] ([用户编号], [用户名], [用户密码], [管理员], [用户邮箱], [已删除]) VALUES (5041, N'Kika12', N'Kika12', 0, N'Kika12@.com', 0)
SET IDENTITY_INSERT [dbo].[用户] OFF
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[增加课程科目] (@课程编号 int,@科目编号 int)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO 课程科目(课程编号,科目编号) 
	VALUES(@课程编号,@科目编号)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[增加学生课程] (@学生编号 int,@课程编号 int,@开始日期 datetime)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO 学生课程(学生编号,课程编号,开始日期)
	VALUES(@学生编号,@课程编号,@开始日期)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[增加教师课程](@教师编号 int,@课程编号 int)	
AS
BEGIN
	SET NOCOUNT ON;
	insert into 教师课程(教师编号,课程编号) values(@教师编号,@课程编号)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[除国家] (@国家编号 int)
AS
BEGIN
	SET NOCOUNT ON;
   UPDATE [国家]
   SET [已删除]= 1
   WHERE [国家编号]=@国家编号
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[除课程](@课程编号 int)	 
AS
BEGIN
	SET NOCOUNT ON;
UPDATE 课程
   SET [已删除]=1
   WHERE 课程编号=@课程编号
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[除学生] (@学生编号 int)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE 学生
   SET [已删除]=1
   WHERE 学生编号=@学生编号
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[除科目](@科目编号 int)
AS
BEGIN
	SET NOCOUNT ON;
UPDATE 科目
   SET [已删除]=1
   WHERE 科目编号=@科目编号
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[除教师](@教师编号 int)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE 教师
   SET [已删除]=1
   WHERE 教师编号=@教师编号
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[除用户](@用户编号 int) 
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE 用户
   SET [已删除]=1
   WHERE 用户编号=@用户编号
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[根据用户名获取用户](@用户名 nvarchar(50)) 
AS
BEGIN
	SET NOCOUNT ON;
	Select [用户名], [用户密码], [管理员], [用户邮箱]
	FROM 用户 
	where 用户.用户名=@用户名 and [已删除]=0
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[增加用户](@用户名 nvarchar(50),@用户密码 nvarchar(50),@用户邮箱 nvarchar(50),@管理员 bit)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO 用户([用户名],[用户密码],[用户邮箱],[管理员])
	VALUES(@用户名,@用户密码,@用户邮箱,@管理员)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[保存国家](@国际标准化组织代码 nvarchar(2),@国家名称 nvarchar(50),@电话区号 int,@国际标准化组织三字代码 nvarchar(3))
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO 国家([国际标准化组织代码],[国家名称],[电话区号],[国际标准化组织三字代码])
	VALUES(@国际标准化组织代码,@国家名称,@电话区号,@国际标准化组织三字代码)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[保存课程](@课程名称 nvarchar(50),@课程描述 nvarchar(500))
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO 课程(课程名称,课程描述)
	VALUES (@课程名称,@课程描述)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[保存学生](@名字 nvarchar(50),@姓氏 nvarchar(50),@电子邮件 nvarchar(50),@性别 nvarchar(10),@出生日期 datetime,
@地址 nvarchar(50),@国家编号 int) 
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO 学生(名字,姓氏,电子邮件,性别,出生日期,地址,国家编号) 
	VALUES(@名字,@姓氏,@电子邮件,@性别,@出生日期,@地址,@国家编号)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[保存科目] (@科目名称 nvarchar(50),@科目描述 nvarchar (500))
AS
BEGIN
	SET NOCOUNT ON;
	insert into 科目(科目名称,科目描述) values(@科目名称,@科目描述)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[保存教师](@名字 nvarchar(50),@姓氏 nvarchar(50),@电子邮件 nvarchar(50),@性别 nvarchar (10),@出生日期 datetime,@地址 nvarchar(50))
AS
BEGIN
	SET NOCOUNT ON;
	insert into 教师(名字,姓氏,电子邮件,性别,出生日期,地址)
	values(@名字,@姓氏,@电子邮件,@性别,@出生日期,@地址)
END
GO
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[选择所有国家] 
AS
BEGIN
	SET NOCOUNT ON;
    select 国家编号,国家名称,国际标准化组织代码,国际标准化组织三字代码,电话区号,已删除 from 国家 where 已删除=0
END
GO
EXEC [dbo].[选择所有国家]
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[选择所有课程]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 课程编号,课程名称,课程描述,已删除 FROM 课程 where 已删除=0
END
GO
EXEC [dbo].[选择所有课程]
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[选择所有课程科目]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 课程科目编号,课程编号,科目编号 FROM 课程科目
END
GO
EXEC [dbo].[选择所有课程科目]
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[选择所有学生成绩]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 学生.学生编号 ,学生.名字,学生.姓氏,学生.电子邮件,学生.性别,学生.出生日期,学生.地址,课程.课程名称,学生课程.通过,学生课程.开始日期,课程.课程描述,国家.国家名称
	FROM 学生 
	left join 学生课程  ON 学生.学生编号= 学生课程.学生编号
	left join 课程  ON 学生课程.课程编号= 课程.课程编号
	left join 国家  ON 学生.国家编号 = 国家.国家编号
	where 学生.已删除=0 and 课程.已删除=0 
END
GO
EXEC [dbo].[选择所有学生成绩];
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[选择所有科目]
AS
BEGIN
	SET NOCOUNT ON;
	select 科目编号,科目名称,科目描述,已删除
	from 科目
	where 已删除=0
END
GO
EXEC [dbo].[选择所有科目]
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[选择所有参与课程的教师]
AS
BEGIN
	SET NOCOUNT ON;
	select 教师.教师编号,教师.名字,教师.姓氏,教师.电子邮件,教师.性别,教师.出生日期,教师.地址,教师课程.教师课程编号,课程.课程编号,课程.课程名称,课程.课程描述
	from 教师 
	left join 教师课程 on 教师.教师编号= 教师课程.教师编号
	left join 课程 on 教师课程.课程编号= 课程.课程编号
	where 课程.已删除=0 and 教师.已删除=0
END
GO
EXEC [dbo].[选择所有参与课程的教师]
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[选择所有用户] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 用户编号,用户名,用户邮箱,用户密码,管理员,已删除 
	FROM 用户
	where 已删除=0
END
GO
EXEC  [dbo].[选择所有用户] 
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[根据名称查询国家](@国家名称 nvarchar(50))
AS
BEGIN
	SET NOCOUNT ON;
	select 国家编号 from 国家 where 国家名称 = @国家名称 and 已删除=0
END
GO
EXEC [dbo].[根据名称查询国家] @国家名称 = 'China'
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[根据名称查询课程](@课程名称 nvarchar(50))
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 课程编号,课程名称,课程描述 
	FROM 课程
	WHERE 课程名称=@课程名称 and 已删除=0
END
GO
EXEC [dbo].[根据名称查询课程] @课程名称 = '微软开发'
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[根据编号查询课程科目] (@课程编号 int)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 课程科目编号,课程编号,科目编号
	FROM 课程科目 
	WHERE 课程编号=@课程编号
END
GO
EXEC [dbo].[根据编号查询课程科目] @课程编号 = 8056;
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[选择最后一位学生]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT top 1 学生编号,名字,姓氏,电子邮件,性别,出生日期,地址,国家编号 
	FROM 学生  
	where 已删除=0
	ORDER BY 学生编号 DESC
END
GO
EXEC [dbo].[选择最后一位学生]
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[根据名字查询学生](@名字 nvarchar(50))
AS
BEGIN
	SET NOCOUNT ON;
	select 学生编号,名字,姓氏,电子邮件,性别,出生日期,地址,国家编号
	from 学生 
	where 名字=@名字 and 已删除=0
END
GO
EXEC [dbo].[根据名字查询学生] @名字 = 'Kristina'
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[根据名称查询科目](@科目名称 nvarchar(50))
AS
BEGIN
	SET NOCOUNT ON;
	select 科目编号,科目描述,科目名称
	from 科目
	where 科目名称=@科目名称 and 已删除=0
END
GO
EXEC [dbo].[根据名称查询科目] @科目名称 = '应用程序测试与调试'
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[根据名字查询教师](@名字 nvarchar(50))	
AS
BEGIN
	SET NOCOUNT ON;
	 select 教师编号,名字,姓氏,电子邮件,性别,出生日期,地址
	 from 教师
	 where 名字 = @名字 and 已删除=0
END
GO
EXEC [dbo].[根据名字查询教师] @名字 = 'Mira'
-----------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[更新课程科目](@科目编号 int,@课程科目编号 int,@课程编号 int)
AS
BEGIN
	SET NOCOUNT ON;
	update 课程科目 
	set 科目编号=@科目编号 
	where 课程科目编号=@课程科目编号 and 课程编号=@课程编号
END
GO
EXEC [dbo].[更新课程科目] @科目编号 = 9999,@课程科目编号 = 8064,@课程编号 =8056
-----------------------------------------------------------------------------------------











-----------------------------------------------------------------------------------------
select * from [dbo].[国家]
select * from [dbo].[课程]
select * from [dbo].[科目]
select * from [dbo].[课程科目]
select * from [dbo].[学生]
select * from [dbo].[学生课程]
select * from [dbo].[教师]
select * from [dbo].[教师课程]
select * from [dbo].[用户]
