USE [Test]
GO
/****** Object:  StoredProcedure [dbo].[GetTriggeredAccounts]    Script Date: 08/07/2015 22:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTriggeredAccounts] 
@LastTriggerDate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	CREATE TABLE #TempAccount 
	( 
		AccountNumber INT NOT NULL, 
	); 

	DECLARE @count INT;
	SET @count = 0;
	WHILE @count < 10000000
	BEGIN 
		INSERT INTO #TempAccount(AccountNumber)
		SELECT ROUND(((100000000 - 1 + 1) * Rand()+1),0)

		SET @count = @count + 1;
	END

	SELECT AccountNumber 
	FROM #TempAccount

	DROP TABLE #TempAccount
END