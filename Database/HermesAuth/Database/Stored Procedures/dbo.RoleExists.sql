SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[RoleExists]
(
	@RoleName varchar(50)
)
AS
	SELECT CAST(1 as bit) FROM dbo.[Role] WHERE Name = @RoleName



GO
