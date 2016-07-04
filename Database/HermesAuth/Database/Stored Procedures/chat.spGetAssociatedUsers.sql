SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Arunkumar K
-- Create date: 03 July 2016
-- Description:	To get the chat accosiated user info.
-- =============================================
CREATE PROCEDURE [chat].[spGetAssociatedUsers]
	-- Add the parameters for the stored procedure here
	@userSecurityId UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	SELECT u.SecurityId
		,u.Username
		,r.[Name] AS GroupName
	FROM [Security].GetUserSecurityIdRelatedSecurityIds(@userSecurityId) usid
	INNER JOIN [Security].[Role] r ON r.SecurityId = usid.SecurityId
	INNER JOIN [Security].[UserRole] ur ON ur.RoleId = r.RoleId
	INNER JOIN [Security].[User] u ON u.UserId = ur.UserId
	WHERE usid.SecurityIdType = 'User Role'
	And u.SecurityId <> @userSecurityId
END
GO
