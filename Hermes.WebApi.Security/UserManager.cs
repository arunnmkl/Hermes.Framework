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
        private readonly AuthRepository authRepo;

        /// <summary>
        /// Initializes a new instance of the <see cref="UserManager"/> class.
        /// </summary>
        public UserManager()
        {
            authRepo = new AuthRepository(AuthContext.AuthDal);
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
        /// <returns>user identity details</returns>
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
