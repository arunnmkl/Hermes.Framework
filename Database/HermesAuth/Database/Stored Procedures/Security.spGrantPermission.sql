SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/***************************************************************************************************
*
* Created By: Arunkumar K
* Created Date: 04/27/2016
* Notes/Description: This will grant permission to the specified resource
*
* Example Usage: EXEC [Security].[spGrantPermission] '<RID GUID>', '<SID GUID>', -3
*
* Updated By:
* Updated Date:
* Notes: <Repeat this section for every update>
* 
***************************************************************************************************/
CREATE PROCEDURE [Security].[spGrantPermission]
	@resourceId UNIQUEIDENTIFIER,
	@securityId UNIQUEIDENTIFIER,
	@permissionId INT,
	@isOwner BIT = 0
AS

SET NOCOUNT ON

BEGIN TRANSACTION 

BEGIN TRY

	DECLARE			
		@rowsAffected INT = 2,
		@SIDList [Security].SecurityIdList

    INSERT INTO @SIDList VALUES (@securityId)

	-- Check to see if the user already has the permission before trying to add it again
	IF [Security].fnCheckAuthorization(@resourceId, @SIDList, @permissionId) = 0
	BEGIN
		INSERT INTO [Security].AccessControlList (ResourceId, SecurityId, IsOwner) VALUES (@resourceId, @securityId, @isOwner)
		SET @rowsAffected = @@ROWCOUNT
		INSERT INTO [Security].AccessPermission (AccessControlListId, PermissionId, [Deny]) VALUES (SCOPE_IDENTITY(), @permissionId, 0)
		SET @rowsAffected = @rowsAffected + @@ROWCOUNT
	END

	-- Check for logical business errors here
	IF @rowsAffected <> 2
		RAISERROR (50017, 11, 1, '[Security].[spGrantPermission]')
END TRY

BEGIN CATCH
	-- Error handling here
	DECLARE @errNumber int, @errSeverity int, @errState int, @errProcedure varchar(500), @errLine int, @errMmessage varchar(500)
	SELECT @errNumber = ERROR_NUMBER(), @errSeverity = ERROR_SEVERITY(), @errState = ERROR_STATE(), @errProcedure = ERROR_PROCEDURE(), @errLine = ERROR_LINE(), @errMmessage = ERROR_MESSAGE()

	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION 
	THROW
END CATCH

IF @@TRANCOUNT > 0 COMMIT TRANSACTION 



GO
