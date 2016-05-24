using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Hermes.WebApi.Security.Models;

namespace Hermes.WebApi.Security
{
    /// <summary>
    /// User manager
    /// </summary>
    public class UserManager : IDisposable
    {
        /// <summary>
        /// The authentication repo
        /// </summary>
        private readonly AuthSqlRepository authRepo;

        /// <summary>
        /// Initializes a new instance of the <see cref="UserManager"/> class.
        /// </summary>
        public UserManager()
        {
            authRepo = new AuthSqlRepository(AuthContext.AuthDal);
        }

        /// <summary>
        /// Authenticates the username password.
        /// </summary>
        /// <param name="userName">Name of the user.</param>
        /// <param name="password">The password.</param>
        /// <returns>user identity</returns>
        public UserIdentity AuthenticateUsernamePassword(string userName, string password)
        {
            password = SecureString.Encrypt(password);
            var result = authRepo.AuthenticateUsernamePassword(userName, password);
            return result;
        }

        /// <summary>
        /// Finds the authentication client.
        /// </summary>
        /// <param name="clientId">The client identifier.</param>
        /// <returns>authentication client information</returns>
        public AuthClient FindAuthClient(string clientId)
        {
            return authRepo.FindAuthClient(clientId);
        }

        /// <summary>
        /// Finds the login provider.
        /// </summary>
        /// <param name="authProvider">The authentication provider.</param>
        /// <returns>
        /// user identity details
        /// </returns>
        public UserIdentity FindLoginProvider(AuthProvider authProvider)
        {
            return authRepo.FindLoginProvider(authProvider);
        }

        /// <summary>
        /// Adds the refresh token.
        /// </summary>
        /// <param name="token">The token.</param>
        /// <returns>success or failure</returns>
        public bool AddRefreshToken(RefreshToken token)
        {
            return authRepo.AddRefreshToken(token);
        }

        /// <summary>
        /// Removes the refresh token.
        /// </summary>
        /// <param name="tokenId">The token identifier.</param>
        /// <returns>success or failure</returns>
        public bool RemoveRefreshToken(string tokenId)
        {
            return authRepo.RemoveRefreshToken(tokenId);
        }

        /// <summary>
        /// Finds the refresh token.
        /// </summary>
        /// <param name="hashedTokenId">The hashed token identifier.</param>
        /// <returns>refresh token</returns>
        public RefreshToken FindRefreshToken(string hashedTokenId)
        {
            return authRepo.FindRefreshToken(hashedTokenId);
        }

        /// <summary>
        /// Gets all refresh tokens.
        /// </summary>
        /// <returns>all refresh tokens</returns>
        public IList<RefreshToken> GetAllRefreshTokens()
        {
            return authRepo.GetAllRefreshTokens();
        }

        /// <summary>
        /// Adds the user.
        /// </summary>
        /// <param name="username">The username.</param>
        /// <param name="password">The password.</param>
        /// <param name="emailAddress">The email address.</param>
        /// <param name="enabled">if set to <c>true</c> [enabled].</param>
        /// <returns>user id</returns>
        public long AddUser(string username, string password, string emailAddress = "", bool enabled = true)
        {
            password = SecureString.Encrypt(password);
            return authRepo.AddUser(username, password, emailAddress, enabled);
        }

        /// <summary>
        /// Adds the user.
        /// </summary>
        /// <param name="authProvider">The authentication provider.</param>
        /// <returns>
        /// inserted state.
        /// </returns>
        public bool AddNewUserLoginProvider(AuthProvider authProvider)
        {
            return authRepo.AddNewUserLoginProvider(authProvider);
        }

        /// <summary>
        /// Gets the authenticated user by user identifier.
        /// </summary>
        /// <param name="userId">The user identifier.</param>
        /// <returns>
        /// user identity details
        /// </returns>
        public UserIdentity GetAuthenticatedUserByUserId(long userId)
        {
            return authRepo.GetAuthenticatedUserByUserId(userId);
        }

        /// Gets the user permissions.
        /// </summary>
        /// <param name="userId">The user identifier.</param>
        /// <returns>user permissions</returns>
        public IList<ResourceAccessRule> GetUserPermissions(long userId)
        {
            return authRepo.GetUserPermissions(userId);
        }

        /// <summary>
        /// Gets the user resource permission.
        /// </summary>
        /// <param name="securityIds">The security ids.</param>
        /// <returns>user resource permissions</returns>
        public IList<ResourceAccessRule> GetUserResourcePermission(IList<string> securityIds)
        {
            return authRepo.GetUserResourcePermission(securityIds);
        }

        /// <summary>
        /// Saves the user authentication token.
        /// </summary>
        /// <param name="userAuthToken">The user authentication token.</param>
        /// <returns>saved state</returns>
        public bool SaveUserAuthToken(UserAuthToken userAuthToken)
        {
            return authRepo.SaveUserAuthToken(userAuthToken);
        }

        /// <summary>
        /// Gets the user authentication token.
        /// </summary>
        /// <param name="userAuthToken">The user authentication token.</param>
        /// <returns>
        /// the user authentication token details
        /// </returns>
        public UserAuthToken GetUserAuthToken(UserAuthToken userAuthToken)
        {
            return authRepo.GetUserAuthToken(userAuthToken);
        }

        /// <summary>
        /// Sets the token expires.
        /// </summary>
        /// <param name="userId">The user identifier.</param>
        /// <returns>row count</returns>
        public int SetTokenExpires(long userId)
        {
            return authRepo.SetTokenExpires(userId);
        }

        /// <summary>
        /// Generates the authentication token.
        /// </summary>
        /// <param name="username">The username.</param>
        /// <param name="checkExistence">if set to <c>true</c> [check existence].</param>
        /// <param name="killOldSession">if set to <c>true</c> [kill old session].</param>
        /// <returns>the new authentication token</returns>
        public string GenerateAuthToken(string username, bool checkExistence = false, bool killOldSession = false)
        {
            return authRepo.GenerateAuthToken(username, checkExistence, killOldSession);
        }

        /// <summary>
        /// Gets the user authentication token by identifier.
        /// </summary>
        /// <param name="userAuthTokenId">The user authentication token identifier.</param>
        /// <returns>
        /// the user authentication token details
        /// </returns>
        public UserAuthToken GetUserAuthTokenById(string userAuthTokenId)
        {
            return authRepo.GetUserAuthTokenById(userAuthTokenId);
        }

        /// <summary>
        /// Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        /// <summary>
        /// Releases unmanaged and - optionally - managed resources.
        /// </summary>
        /// <param name="disposing"><c>true</c> to release both managed and unmanaged resources; <c>false</c> to release only unmanaged resources.</param>
        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                this.authRepo.Dispose();
            }
        }
    }
}
