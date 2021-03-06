USE [Demo]
GO
/****** Object:  StoredProcedure [dbo].[GetConversationsWithFriends]    Script Date: 12/19/2018 10:11:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thomas Lieser
-- Create date: 12/13/2018
-- Description:	gets names for private conversations
-- =============================================
ALTER PROCEDURE [dbo].[GetConversationsWithFriends]
	-- Add the parameters for the stored procedure here
	@UserID		int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	U.UserID,
			U.FirstName + ' ' + U.LastName AS Sender
	FROM dbo.Users AS U INNER JOIN dbo.Friends AS F
	ON (U.UserID = F.FriendID AND F.UserID = @UserID) OR (U.UserID = F.UserID AND F.FriendID = @UserID)
END
