CREATE TABLE Talleres 
(
	IdTaller int NOT NULL,
	NombreTaller varchar(64) NOT NULL,
	Estado char(1) NOT NULL 
);
GO
ALTER TABLE Talleres ADD CONSTRAINT PK_Talleres_IdTaller PRIMARY KEY(IdTaller);
GO
ALTER TABLE Talleres ADD CONSTRAINT DF_Talleres_NombreTaller DEFAULT('') FOR NombreTaller;
GO
ALTER TABLE Talleres ADD CONSTRAINT DF_Talleres_Estado DEFAULT('A') FOR Estado;
GO
ALTER TABLE Talleres ADD CONSTRAINT CK_Talleres_Estado CHECK(Estado in('A','I'));
GO
		