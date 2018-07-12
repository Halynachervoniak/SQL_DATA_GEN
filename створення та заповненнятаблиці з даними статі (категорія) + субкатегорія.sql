USE [Haluna1]
GO

/****** Object:  Table [dbo].[Table_1]    Script Date: 13.07.2018 0:11:24 ******/
DROP TABLE [dbo].[Table_1]
GO

/****** Object:  Table [dbo].[Table_1]    Script Date: 13.07.2018 0:11:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Table_1](
	[id] [int] NOT NULL,
	[category] [nchar](10) NOT NULL,
	[ZhinochyyOdyah] [nvarchar](50) NULL,
	[CholovichyyOdyah] [nvarchar](20) NULL,
	[DytyachyyOdyahKhlopchyky] [nvarchar](20) NULL,
	[DytyachyyOdyahDivchata] [nvarchar](20) NULL
) ON [PRIMARY]
GO

INSERT INTO [dbo].[Table_1]
           ([id]
           ,[category]
           ,[ZhinochyyOdyah]
           ,[CholovichyyOdyah]
           ,[DytyachyyOdyahKhlopchyky]
           ,[DytyachyyOdyahDivchata])
     VALUES
           (1,'man','Suknya','Dzhynsy','Dzhynsy','Suknya'), 
(2,'woman ','bluza','tolstovka','tolstovka','bluza'), 
(3,'kids_boy','spidnytsya','sportyvnyy_kostyum','sportyvnyy_kostyum','spidnytsya'),
(4,'kids_girl','futbolka','futbolka','futbolka','futbolka'),
(5,'null','top','mayka','mayka','top'),
(6,'NULL','shorty','shorty','shorty','shorty'),
(7,'NULL','kostyum','kostyum','kostyum','kostyum'),
(8,'NULL','sorochka','sorochka','sorochka','sorochka'),
(9,'NULL','pidzhak','pidzhak','pidzhak','pidzhak'),
(10,'NULL','kardyhan','kardyhan','kardyhan','kardyhan'),
(11,'NULL','svetr','svetr','svetr','svetr'),
(12,'NULL','losyny','zhyletka','zhyletka','losyny'),
(13,'NULL','shtany','shtany','shtany','shtany'),
(14,'NULL','dzhynsy','halstyk','metelyk','dzhynsy'),
(15,'NULL','lehinsy','futbolka_polo','futbolka_polo','lehinsy'),
(16,'NULL','kurtka','kurtka','kurtka','kurtka'),
(18,'NULL','panchokhy','chinosy','chinosy','panchokhy'),
(19,'NULL','shtarpetky','shtarpetky','shtarpetky','shtarpetky'),
(20,'NULL','Vitrivka','Vitrivka','Vitrivka','Vitrivka')

GO


