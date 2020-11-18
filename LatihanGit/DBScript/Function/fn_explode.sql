USE [DB_STUDENT]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_explode]    Script Date: 11/18/2020 02:33:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_explode](@Delimiter VARCHAR(20), @s VARCHAR(MAX))
RETURNS @t TABLE (items VARCHAR(MAX))
AS
BEGIN
    DECLARE 
        @i INT = 1, 
        @j INT = DATALENGTH(@s), @k int, 
        @l int = DATALENGTH(@Delimiter), 
        @cut VARCHAR(MAX);    

    WHILE (@i <= @j) 
    BEGIN
        SET @k = CHARINDEX(@Delimiter,@s, @i);
        IF (@k < 1)
        BEGIN
	SET @k= @j+1; 
        END;
	SET @cut = SUBSTRING(@s, @i, @k-@i); 
	SET @i = @k + @l; 

        INSERT INTO @t(ITEMs) VALUES(@cut);
    END
    RETURN
END
GO

