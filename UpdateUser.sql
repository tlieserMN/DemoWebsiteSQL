USE [Demo]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 12/19/2018 10:12:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thomas Lieser
-- Create date: 12/14/2018
-- Description:	updates user information
-- =============================================
ALTER PROCEDURE [dbo].[UpdateUser] 
	-- Add the parameters for the stored procedure here
	@UserID			int,
	@FirstName		varchar(50),
	@LastName		varchar(50),
	@Email			varchar(50),
	@Birthday		date,
	@Age			int,
	@AboutMe		varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE dbo.Users
		SET	FirstName = @FirstName,
			LastName = @LastName,
			Email = @Email,
			Birthday = @Birthday,
			Age = @Age,
			AboutMe = @AboutMe
	WHERE UserID = @UserID
END
