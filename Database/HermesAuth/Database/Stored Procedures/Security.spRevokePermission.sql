SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/***************************************************************************************************
*
* Created By: Arunkumar K
* Created Date: 04/27/2016
* Notes/Description: This will revoke the permission for a resource (ResourceId) from the user or group
* represented by the specified securityId
*
* Example Usage: EXEC [Security].[spRevokePermission] '<resourceId GUId>', '<securityId GUId>', -3
* 
* Updated By:
* Updated Date:
* Notes: <Repeat this section for every update>
* 
***************************************************************************************************/
CREATE PROCEDURE [Security].[spRevokePermission]
	@resourceId UNIQUEIdENTIFIER,
	@securityId UNIQUEIdENTIFIER,
	@permissionId INT
AS

SET NOCOUNT ON

BEGIN TRANSACTION 

BEGIN TRY

	DECLARE	
		@rowsAffected INT = 2,
		@accessControlListId INT,
		@securityIdList [Security].SecurityIdList

    INSERT INTO @securityIdList VALUES (@securityId)

	-- Check to see if the user already has the permission before trying to revoke it
	IF [Security].fnCheckAuthorization(@resourceId, @securityIdList, @permissionId) = 1
	BEGIN
		SET @AccessControlListId = (SELECT A.AccessControlListId FROM [Security].AccessControlList A INNER JOIN [Security].AccessPermission B ON B.AccessControlListId = A.AccessControlListId WHERE A.ResourceId = @resourceId AND A.SecurityId = @securityId AND B.PermissionId = @permissionId)

		DELETE [Security].AccessPermission WHERE AccessControlListId = @accessControlListId AND PermissionId = @permissionId
		SET @rowsAffected = @@ROWCOUNT
		DELETE [Security].AccessControlList WHERE AccessControlListId = @accessControlListId
		SET @rowsAffected = @rowsAffected + @@ROWCOUNT
	END

	-- Check for logical business errors here
	IF @rowsAffected <> 2
		RAISERROR (50017, 11, 1, '[Security].[spRevokePermission]')
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
