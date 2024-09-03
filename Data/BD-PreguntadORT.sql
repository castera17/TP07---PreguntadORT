USE [master]
GO
/****** Object:  Database [TP07 - PreguntadORT_DataBase]    Script Date: 3/9/2024 08:44:18 ******/
CREATE DATABASE [TP07 - PreguntadORT_DataBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP07 - PreguntadORT_DataBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP07 - PreguntadORT_DataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP07 - PreguntadORT_DataBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP07 - PreguntadORT_DataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP07 - PreguntadORT_DataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET RECOVERY FULL 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET  MULTI_USER 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TP07 - PreguntadORT_DataBase', N'ON'
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET QUERY_STORE = OFF
GO
USE [TP07 - PreguntadORT_DataBase]
GO
/****** Object:  User [alumno]    Script Date: 3/9/2024 08:44:18 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 3/9/2024 08:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Foto] [varchar](200) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 3/9/2024 08:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[IdDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 3/9/2024 08:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NULL,
	[IdDificultad] [int] NULL,
	[Enunciado] [varchar](150) NULL,
	[Foto] [varchar](200) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 3/9/2024 08:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NULL,
	[Opcion] [int] NULL,
	[Contenido] [varchar](50) NULL,
	[Correcta] [bit] NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (1, N'Geografia', N'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/ad43bb16598909.562ae946d4555.jpg')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'Deportes', N'https://static.wikia.nocookie.net/preguntados-juego/images/9/97/Deportes_Bonzo.png/revision/latest?prefix=es')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'Ciencia', N'https://static.wikia.nocookie.net/preguntados-juego/images/0/0b/Ciencia_Albert.png/revision/latest?cb=20240807174905&path-prefix=es')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (4, N'Historia', N'https://cdn.domestika.org/c_limit,dpr_auto,f_auto,q_80,w_820/v1537492431/content-items/002/525/188/Preguntados_Historia-03-original.jpg?1537492431')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (5, N'Deportes', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (6, N'Geografía', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (7, N'Historia', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (8, N'Ciencia', NULL)
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (1, N'Facil')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (2, N'Medio')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (3, N'Dificil')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (4, N'Fácil')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (5, N'Intermedio')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (6, N'Difícil')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (1, 4, 1, N'en que año fue la segunda guerra mundial?', N'https://encyclopedia.ushmm.org/images/large/faadc2f4-f0cd-4676-97e0-01a89f3a34bd.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (2, 4, 2, N'de que siglo a que siglo fue el feudalismo en alemania?', N'https://concepto.de/wp-content/uploads/2015/04/feudalismo-min-e1504896645566.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (3, 4, 3, N'de que año a que año existio constantinopla?', N'https://eolapaz.com/wp-content/uploads/2021/05/historia-constantinopla.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (4, 1, 1, NULL, NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (5, 1, 1, N'¿Cuál es el país con más Copas del Mundo ganadas en fútbol?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (6, 1, 1, N'¿En qué año se celebraron los primeros Juegos Olímpicos modernos?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (7, 1, 2, N'¿Cuántos jugadores componen un equipo de baloncesto en cancha?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (8, 1, 2, N'¿Cuál es el torneo de tenis más antiguo del mundo?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (9, 1, 3, N'¿Qué nadador ha ganado más medallas olímpicas?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (10, 2, 1, N'¿Cuál es el río más largo del mundo?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (11, 2, 1, N'¿Cuál es el país más grande del mundo por superficie?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (12, 2, 2, N'¿En qué continente se encuentra el desierto del Sahara?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (13, 2, 2, N'¿Cuál es la capital de Australia?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (14, 2, 3, N'¿Qué país tiene más islas en el mundo?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (15, 3, 1, N'¿Quién fue el primer presidente de los Estados Unidos?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (16, 3, 1, N'¿En qué año comenzó la Segunda Guerra Mundial?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (17, 3, 2, N'¿Cuál fue la civilización que construyó las pirámides de Egipto?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (18, 3, 2, N'¿Qué documento firmó Martin Luther King en 1963?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (19, 3, 3, N'¿Cuál fue la primera dinastía de China?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (20, 4, 1, N'¿Qué planeta es conocido como el planeta rojo?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (21, 4, 1, N'¿Cuál es el elemento químico más abundante en la Tierra?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (22, 4, 2, N'¿Quién desarrolló la teoría de la relatividad?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (23, 4, 2, N'¿Qué órgano es responsable de bombear sangre por todo el cuerpo?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (24, 4, 3, N'¿Qué partícula subatómica tiene una carga negativa?', NULL)
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (1, 1, 1, N'Entre 1939 y 1945', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (2, 1, 2, N'Entre 1933 y 1942', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (3, 2, 1, N'entre los siglos XI al XIII', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (4, 2, NULL, NULL, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (5, 1, 1, N'Italia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (6, 1, 2, N'Brasil', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (7, 1, 3, N'Alemania', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (8, 2, 1, N'1896', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (9, 2, 2, N'1900', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (10, 2, 3, N'1888', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (11, 3, 1, N'5', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (12, 3, 2, N'6', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (13, 3, 3, N'7', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (14, 4, 1, N'Roland Garros', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (15, 4, 2, N'Wimbledon', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (16, 4, 3, N'US Open', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (17, 5, 1, N'Mark Spitz', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (18, 5, 2, N'Ian Thorpe', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (19, 5, 3, N'Michael Phelps', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (20, 6, 1, N'Amazonas', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (21, 6, 2, N'Nilo', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (22, 6, 3, N'Yangtsé', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (23, 7, 1, N'Estados Unidos', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (24, 7, 2, N'Canadá', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (25, 7, 3, N'Rusia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (26, 8, 1, N'Asia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (27, 8, 2, N'África', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (28, 8, 3, N'Oceanía', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (29, 9, 1, N'Sídney', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (30, 9, 2, N'Melbourne', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (31, 9, 3, N'Canberra', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (32, 10, 1, N'Indonesia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (33, 10, 2, N'Suecia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (34, 10, 3, N'Filipinas', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (35, 11, 1, N'George Washington', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (36, 11, 2, N'Thomas Jefferson', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (37, 11, 3, N'John Adams', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (38, 12, 1, N'1939', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (39, 12, 2, N'1941', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (40, 12, 3, N'1937', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (41, 13, 1, N'Mesopotamia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (42, 13, 2, N'Incas', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (43, 13, 3, N'Egipcios', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (44, 14, 1, N'Carta desde la cárcel de Birmingham', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (45, 14, 2, N'Declaración de Independencia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (46, 14, 3, N'Manifiesto Comunista', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (47, 15, 1, N'Dinastía Ming', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (48, 15, 2, N'Dinastía Shang', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (49, 15, 3, N'Dinastía Qing', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (50, 16, 1, N'Marte', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (51, 16, 2, N'Júpiter', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (52, 16, 3, N'Saturno', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (53, 17, 1, N'Oxígeno', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (54, 17, 2, N'Hidrógeno', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (55, 17, 3, N'Carbono', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (56, 18, 1, N'Isaac Newton', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (57, 18, 2, N'Albert Einstein', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (58, 18, 3, N'Niels Bohr', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (59, 19, 1, N'Cerebro', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (60, 19, 2, N'Hígado', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (61, 19, 3, N'Corazón', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (62, 20, 1, N'Protón', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (63, 20, 2, N'Neutrón', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (64, 20, 3, N'Electrón', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (65, 6, 1, N'Amazonas', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (66, 6, 2, N'Nilo', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (67, 6, 3, N'Yangtsé', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (68, 7, 1, N'Estados Unidos', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (69, 7, 2, N'Canadá', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (70, 7, 3, N'Rusia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (71, 8, 1, N'Asia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (72, 8, 2, N'África', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (73, 8, 3, N'Oceanía', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (74, 9, 1, N'Sídney', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (75, 9, 2, N'Melbourne', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (76, 9, 3, N'Canberra', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (77, 10, 1, N'Indonesia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (78, 10, 2, N'Suecia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (79, 10, 3, N'Filipinas', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (80, 11, 1, N'George Washington', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (81, 11, 2, N'Thomas Jefferson', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (82, 11, 3, N'John Adams', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (83, 12, 1, N'1939', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (84, 12, 2, N'1941', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (85, 12, 3, N'1937', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (86, 13, 1, N'Mesopotamia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (87, 13, 2, N'Incas', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (88, 13, 3, N'Egipcios', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (89, 14, 1, N'Carta desde la cárcel de Birmingham', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (90, 14, 2, N'Declaración de Independencia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (91, 14, 3, N'Manifiesto Comunista', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (92, 15, 1, N'Dinastía Ming', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (93, 15, 2, N'Dinastía Shang', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (94, 15, 3, N'Dinastía Qing', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (95, 16, 1, N'Marte', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (96, 16, 2, N'Júpiter', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (97, 16, 3, N'Saturno', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (98, 17, 1, N'Oxígeno', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (99, 17, 2, N'Hidrógeno', 0)
GO
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (100, 17, 3, N'Carbono', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (101, 18, 1, N'Isaac Newton', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (102, 18, 2, N'Albert Einstein', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (103, 18, 3, N'Niels Bohr', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (104, 19, 1, N'Cerebro', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (105, 19, 2, N'Hígado', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (106, 19, 3, N'Corazón', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (107, 20, 1, N'Protón', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (108, 20, 2, N'Neutrón', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (109, 20, 3, N'Electrón', 1)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([IdDificultad])
REFERENCES [dbo].[Dificultades] ([IdDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
USE [master]
GO
ALTER DATABASE [TP07 - PreguntadORT_DataBase] SET  READ_WRITE 
GO
