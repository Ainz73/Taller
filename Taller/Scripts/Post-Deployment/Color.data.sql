IF NOT EXISTS (SELECT codigocolor FROM Color WHERE codigocolor='RO')
    BEGIN
        INSERT INTO [dbo].[Color]([codigocolor],[Nombrecolor],IdTaller)
        VALUES('RO','Rojo',1)
    END
GO