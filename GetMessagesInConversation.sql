USE [Demo]
GO
/****** Object:  StoredProcedure [dbo].[GetMessagesInConversation]    Script Date: 12/19/2018 10:12:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thomas Lieser
-- Create date: 12/13/2018
-- Description:	gets private messages from friend
-- =============================================
ALTER PROCEDURE [dbo].[GetMessagesInConversation] 
	-- Add the parameters for the stored procedure here
	@UserID		int,
	@FriendID	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	M.MessageID,
			U.FirstName + ' ' + U.LastName AS Sender,
			M.Header,
			M.Body
	FROM dbo.[Messages] AS M INNER JOIN dbo.Users AS U
	ON M.UserID = U.UserID
	WHERE M.UserID = @UserID AND M.ReceiverID = @FriendID OR M.UserID = @FriendID AND M.ReceiverID = @UserID
END
