IF NOT EXISTS (SELECT IdTaller FROM Talleres WHERE IdTaller=1)
    BEGIN
        INSERT INTO [dbo].[Talleres]([IdTaller],[NombreTaller],Estado)
        VALUES(1,'Taller 1','A')
    END
GO