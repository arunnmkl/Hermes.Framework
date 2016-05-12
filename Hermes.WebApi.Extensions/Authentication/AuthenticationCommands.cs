using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using Hermes.WebApi.Extensions.Common;
using Hermes.WebApi.Security;
using Hermes.WebApi.Security.Models;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;

namespace Hermes.WebApi.Extensions.Authentication
{
    /// <summary>
    /// The authentication commands which basically deals with the all the authentication  
    /// </summary>
    public static class AuthenticationCommands
    {
        #region Public Methods

        /// <summary>
        /// Authenticates the username password.
        /// </summary>
        /// <param name="userName">Name of the user.</param>
        /// <param name="password">The password.</param>
        /// <returns></returns>
        public static ClaimsPrincipal AuthenticateUsernamePassword(string userName, string password)
        {
            using (UserManager um = new UserManager())
            {
                var userIdentity = um.AuthenticateUsernamePassword(userName, password);

                if (userIdentity != null)
                {
                    var identity = ClaimsIdentityProvider.GetClaimsIdentity(userIdentity, "ClaimsIdentityAuth");

                    return new ClaimsPrincipal(identity);
                }
            }

            return null;
        }

        /// <summary>
        /// Adds the user.
        /// </summary>
        /// <param name="username">The username.</param>
        /// <param name="password">The password.</param>
        /// <returns>
        /// user id
        /// </returns>
        public static long AddUser(string username, string password)
        {
            using (UserManager um = new UserManager())
            {
                return um.AddUser(username, password);
            }
        }

        /// <summary>
        /// Adds the user.
        /// </summary>
        /// <param name="authProvider">The authentication provider.</param>
        /// <returns>
        /// inserted state.
        /// </returns>
        public static bool AddNewUserLoginProvider(AuthProvider authProvider)
        {
            using (UserManager um = new UserManager())
            {
                return um.AddNewUserLoginProvider(authProvider);
            }
        }

        /// <summary>
        /// Gets the authenticated user by user identifier.
        /// </summary>
        /// <param name="userId">The user identifier.</param>
        /// <returns>
        /// user identity details
        /// </returns>
        public static UserIdentity GetAuthenticatedUserByUserId(long userId)
        {
            using (UserManager um = new UserManager())
            {
                return um.GetAuthenticatedUserByUserId(userId);
            }
        }

        /// <summary>
        /// Removes the refresh token.
        /// </summary>
        /// <param name="tokenId">The token identifier.</param>
        /// <returns>success or failure</returns>
        public static bool RemoveRefreshToken(string tokenId)
        {
            using (UserManager um = new UserManager())
            {
                return um.RemoveRefreshToken(tokenId);
            }
        }

        /// <summary>
        /// Gets all refresh tokens.
        /// </summary>
        /// <returns>all refresh tokens</returns>
        public static IList<RefreshToken> GetAllRefreshTokens()
        {
            using (UserManager um = new UserManager())
            {
                return um.GetAllRefreshTokens();
            }
        }

        /// <summary>
        /// Finds the login provider.
        /// </summary>
        /// <param name="loginProvider">The login provider.</param>
        /// <param name="providerKey">The provider key.</param>
        /// <returns>
        /// user identity details
        /// </returns>
        public static UserIdentity FindLoginProvider(string loginProvider, string providerKey)
        {
            using (UserManager um = new UserManager())
            {
                return um.FindLoginProvider(new AuthProvider(loginProvider, providerKey));
            }
        }

        /// <summary>
        /// Gets the user permissions.
        /// </summary>
        /// <returns></returns>
        public static IList<ResourceAccessRule> GetUserPermissions()
        {
            using (UserManager um = new UserManager())
            {
                return um.GetUserPermissions(AuthContext.UserId);
            }
        }

        /// <summary>
        /// Gets the user resource permission.
        /// </summary>
        /// <returns>
        /// user resource permissions
        /// </returns>     
        public static IList<ResourceAccessRule> GetUserResourcePermission()
        {
            using (UserManager um = new UserManager())
            {
                return um.GetUserResourcePermission(AuthContext.SecurityIds);
            }
        }

        /// <summary>
        /// Saves the user authentication token.
        /// </summary>
        /// <param name="userAuthToken">The user authentication token.</param>
        /// <returns>saved state.</returns>
        public static bool SaveUserAuthToken(UserAuthToken userAuthToken)
        {
            using (UserManager um = new UserManager())
            {
                if (userAuthToken.UserId == 0)
                {
                    userAuthToken.UserId = AuthContext.UserId;
                }

                return um.SaveUserAuthToken(userAuthToken);
            }
        }

        /// <summary>
        /// Sets the token expires.
        /// </summary>
        /// <returns>row count</returns>
        public static int SetTokenExpires()
        {
            using (UserManager um = new UserManager())
            {
                return um.SetTokenExpires(AuthContext.UserId);
            }
        }

        #endregion Public Methods

        #region Internal Methods 

        internal static Task<ClaimsIdentity> AuthenticateUsernamePassword(OAuthGrantResourceOwnerCredentialsContext context)
        {
            using (UserManager um = new UserManager())
            {
                if (string.IsNullOrEmpty(context.UserName) || string.IsNullOrEmpty(context.UserName))
                {
                    context.SetError("invalid_grant", "The user name or password is incorrect.");
                    return Task.FromResult<ClaimsIdentity>(null);
                }

                var userIdentity = um.AuthenticateUsernamePassword(context.UserName, context.Password);

                if (userIdentity != null)
                {
                    var identity = ClaimsIdentityProvider.GetClaimsIdentity(userIdentity, context.Options.AuthenticationType);

                    return Task.FromResult(identity);
                }
            }

            context.SetError("invalid_grant", "The user name or password is incorrect.");
            return Task.FromResult<ClaimsIdentity>(null);
        }

        /// <summary>
        /// Gets the user authentication token.
        /// </summary>
        /// <param name="userAuthToken">The user authentication token.</param>
        /// <returns>
        /// the user authentication token details
        /// </returns>
        internal static UserAuthToken GetUserAuthToken(UserAuthToken userAuthToken)
        {
            using (UserManager um = new UserManager())
            {
                if (userAuthToken.UserId == 0)
                {
                    userAuthToken.UserId = AuthContext.UserId;
                }

                return um.GetUserAuthToken(userAuthToken);
            }
        }

        /// <summary>
        /// Converts the token as claims identity.
        /// </summary>
        /// <param name="accessToken">The access token.</param>
        /// <returns>claims identity</returns>
        internal static ClaimsIdentity ConvertTokenAsClaimsIdentity(string accessToken)
        {
            var ticket = Common.Helper.UnprotectAccessToken(accessToken);
            if (ticket is AuthenticationTicket)
            {
                return ticket.Identity as ClaimsIdentity;
            }

            return null;
        }

        /// <summary>
        /// Converts the token as authentication ticket.
        /// </summary>
        /// <param name="accessToken">The access token.</param>
        /// <returns>authentication ticket</returns>
        internal static AuthenticationTicket ConvertTokenAsAuthTicket(string accessToken)
        {
            var ticket = Common.Helper.UnprotectAccessToken(accessToken);
            return ticket as AuthenticationTicket;
        }

        /// <summary>
        /// Finds the authentication client.
        /// </summary>
        /// <param name="clientId">The client identifier.</param>
        /// <returns>authentication client information</returns>
        internal static AuthClient FindAuthClient(string clientId)
        {
            using (UserManager um = new UserManager())
            {
                return um.FindAuthClient(clientId);
            }
        }

        /// <summary>
        /// Finds the login provider.
        /// </summary>
        /// <param name="authProvider">The authentication provider.</param>
        /// <returns>user identity details</returns>
        internal static UserIdentity FindLoginProvider(AuthProvider authProvider)
        {
            using (UserManager um = new UserManager())
            {
                return um.FindLoginProvider(authProvider);
            }
        }

        #endregion Internal Methods
    }
}