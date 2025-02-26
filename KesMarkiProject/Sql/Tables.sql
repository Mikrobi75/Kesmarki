CREATE TABLE [dbo].[SzemelyiAdatok](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Vezeteknev] [nvarchar](50) NOT NULL,
	[Keresztnev] [nvarchar](50) NOT NULL,
	[SzemelyiAzon] [nvarchar](20) NOT NULL,
	[LakcimAzon] [nvarchar](20) NOT NULL
 	CONSTRAINT [PK_SzemelyiAdat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Lakcimek](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CimTipus] [tinyint] NOT NULL,                	
	[IranyitoSzam] [decimal](4,0) NOT NULL,
	[Telepules] [nvarchar](80) NOT NULL,
	[Utca] [nvarchar](60) NOT NULL,
	[Hazszam] [nvarchar](10) NOT NULL,
	[SzemelyiAdat_Id] [int] NOT NULL
 	CONSTRAINT [FK_Lakcim_SzemelyiAdat] FOREIGN KEY (SzemelyiAdat_Id) REFERENCES SzemelyiAdatok(Id),
 	CONSTRAINT [PK_Lakcim] PRIMARY KEY CLUSTERED
(
	[Id] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
	
GO

CREATE TABLE [dbo].[Elerhetosegek](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ElerhetosegTipus] [tinyint] NOT NULL,
	[Elerhetoseg] [nvarchar](320) NULL,
	[SzemelyiAdat_Id] [int] NOT NULL
 	CONSTRAINT [FK_Elerhetosegek_SzemelyiAdat] FOREIGN KEY (SzemelyiAdat_Id) REFERENCES SzemelyiAdatok(Id),
 	CONSTRAINT [PK_Elerhetosegek] PRIMARY KEY CLUSTERED 
(
	[Id] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]

