SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[FindAuthClientById] @authClientId VARCHAR(128)
AS
     BEGIN
         -- SET NOCOUNT ON added to prevent extra result sets from
         -- interfering with SELECT statements.
         SET NOCOUNT ON;

         -- Insert statements for procedure here
         SELECT [AuthClientId],
                [Secret],
                [Name],
                [ApplicationType],
                [IsActive],
                [RefreshTokenLifeTime],
                [AllowedOrigin]
         FROM [dbo].[AuthClient] ac
         WHERE ac.[AuthClientId] = @authClientId;
     END;

GO
