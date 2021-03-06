USE [Demo]
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 12/19/2018 10:12:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thomas Lieser
-- Create date: 12/14/2018
-- Description:	get user information
-- =============================================
ALTER PROCEDURE [dbo].[GetUser] 
	-- Add the parameters for the stored procedure here
	@UserID		int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	UserID,
			FirstName,
			LastName,
			Email,
			Birthday,
			Age,
			AboutMe
	FROM dbo.Users
	WHERE UserID = @UserID
END
