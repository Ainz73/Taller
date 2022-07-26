﻿/*
Deployment script for Taller

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Taller"
:setvar DefaultFilePrefix "Taller"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating Table [dbo].[Color]...';


GO
CREATE TABLE [dbo].[Color] (
    [CodigoColor] CHAR (2)     NOT NULL,
    [NombreColor] VARCHAR (32) NOT NULL,
    [IdTaller]    INT          NOT NULL,
    CONSTRAINT [PK_Color_CodigoColor] PRIMARY KEY CLUSTERED ([CodigoColor] ASC)
);


GO
PRINT N'Creating Default Constraint [dbo].[DF_Color_NombreColor]...';


GO
ALTER TABLE [dbo].[Color]
    ADD CONSTRAINT [DF_Color_NombreColor] DEFAULT ('') FOR [NombreColor];


GO
PRINT N'Creating Default Constraint [dbo].[DF_Color_IdTaller]...';


GO
ALTER TABLE [dbo].[Color]
    ADD CONSTRAINT [DF_Color_IdTaller] DEFAULT (0) FOR [IdTaller];


GO
PRINT N'Creating Default Constraint [dbo].[DF_Talleres_Estado]...';


GO
ALTER TABLE [dbo].[Talleres]
    ADD CONSTRAINT [DF_Talleres_Estado] DEFAULT ('A') FOR [Estado];


GO
PRINT N'Creating Default Constraint [dbo].[DF_Talleres_NombreTaller]...';


GO
ALTER TABLE [dbo].[Talleres]
    ADD CONSTRAINT [DF_Talleres_NombreTaller] DEFAULT ('') FOR [NombreTaller];


GO
PRINT N'Creating Foreign Key [dbo].[FK_Color_IdTaller]...';


GO
ALTER TABLE [dbo].[Color] WITH NOCHECK
    ADD CONSTRAINT [FK_Color_IdTaller] FOREIGN KEY ([IdTaller]) REFERENCES [dbo].[Talleres] ([IdTaller]);


GO
PRINT N'Creating Check Constraint [dbo].[CK_Color_CodigoColor]...';


GO
ALTER TABLE [dbo].[Color] WITH NOCHECK
    ADD CONSTRAINT [CK_Color_CodigoColor] CHECK (LEN(CodigoColor)=2);


GO
PRINT N'Creating Check Constraint [dbo].[CK_Talleres_Estado]...';


GO
ALTER TABLE [dbo].[Talleres] WITH NOCHECK
    ADD CONSTRAINT [CK_Talleres_Estado] CHECK (Estado in('A','I'));


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Color] WITH CHECK CHECK CONSTRAINT [FK_Color_IdTaller];

ALTER TABLE [dbo].[Color] WITH CHECK CHECK CONSTRAINT [CK_Color_CodigoColor];

ALTER TABLE [dbo].[Talleres] WITH CHECK CHECK CONSTRAINT [CK_Talleres_Estado];


GO
PRINT N'Update complete.';


GO
