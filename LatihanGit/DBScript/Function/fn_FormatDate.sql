USE [DB_STUDENT]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_FormatDate]    Script Date: 11/18/2020 02:33:05 PM ******/
SET ANSI_NULLS ON
GO

--Comment Melani
--Comment 2
--18/11/2020

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_FormatDate]
(
@ri_d_date datetime
)
RETURNS varchar(11)
AS
BEGIN
DECLARE @strDate varchar(11)

select @strDate = REPLACE(REPLACE(CONVERT(VARCHAR(11),@ri_d_date,113), ' ','-'), ',','')
RETURN @strDate

END
GO

