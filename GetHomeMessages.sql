USE [Demo]
GO
/****** Object:  StoredProcedure [dbo].[GetHomeMessages]    Script Date: 12/19/2018 10:12:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thomas Lieser
-- Create date: 12/13/2018
-- Description:	gets messages from all friends
-- =============================================
ALTER PROCEDURE [dbo].[GetHomeMessages]
	-- Add the parameters for the stored procedure here
	@UserID		int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	M.MessageID,
			Friends.Sender,
			M.Header,
			M.Body
	FROM dbo.[Messages] AS M INNER JOIN
		(SELECT	U.UserID,
				U.FirstName + ' ' + U.LastName AS Sender
		FROM dbo.Users AS U INNER JOIN dbo.Friends AS F
		ON (U.UserID = F.FriendID AND F.UserID = @UserID) OR (U.UserID = F.UserID AND F.FriendID = @UserID)) AS Friends
	ON M.UserID = Friends.UserID
	WHERE ReceiverID IS NULL
	UNION 
	SELECT	M.MessageID,
			U.FirstName + ' ' + U.LastName AS Sender,
			M.Header,
			M.Body
	FROM dbo.[Messages] AS M INNER JOIN dbo.Users AS U
	ON M.UserID = U.UserID
	WHERE ReceiverID IS NULL AND U.UserID = @UserID
	ORDER BY M.MessageID DESC
END
