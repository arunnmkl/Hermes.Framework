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
        /// Adds the user.
        /// </summary>
        /// <param name="username">The username.</param>
        /// <param name="password">The password.</param>
        /// <param name="emailAddress">The email address.</param>
        /// <param name="enabled">if set to <c>true</c> [enabled].</param>
        /// <returns>user id</returns>
        public long AddUser(string username, string password, string emailAddress = "", bool enabled = true)
        {
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
            this.authRepo.Dispose();
        }
    }
}
