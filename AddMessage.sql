USE [Demo]
GO
/****** Object:  StoredProcedure [dbo].[AddMessage]    Script Date: 12/19/2018 10:11:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thomas Lieser
-- Create date: 12/13/2018
-- Description:	adds a new message
-- =============================================
ALTER PROCEDURE [dbo].[AddMessage]
	-- Add the parameters for the stored procedure here
	@UserID		int,
	@Header		varchar(max),
	@Body		varchar(max),
	@ReceiverID	int = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO dbo.[Messages] (UserID, Header, Body, ReceiverID)
	VALUES (@UserID, @Header, @Body, @ReceiverID)
END
