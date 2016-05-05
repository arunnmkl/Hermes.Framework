using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using Hermes.WebApi.Security;
using Hermes.WebApi.Security.Models;
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
                    var identity = new ClaimsIdentity("ClaimsIdentityAuth");
                    identity.AddClaim(new Claim(ClaimTypes.Name, userIdentity.Username));
                    identity.AddClaim(new Claim(ClaimTypes.Sid, userIdentity.SecurityId.ToString()));
                    if (userIdentity.Roles != null)
                    {
                        foreach (var role in userIdentity.Roles)
                        {
                            identity.AddClaim(new Claim(ClaimTypes.Role, role.Name));
                        }
                    }

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

        #endregion Public Methods

        #region Internal Methods

        internal static Task<ClaimsIdentity> AuthenticateUsernamePassword(OAuthGrantResourceOwnerCredentialsContext context)
        {
            using (UserManager um = new UserManager())
            {
                var userIdentity = um.AuthenticateUsernamePassword(context.UserName, context.Password);

                if (userIdentity != null)
                {
                    var identity = new ClaimsIdentity(context.Options.AuthenticationType);
                    identity.AddClaim(new Claim(ClaimTypes.Name, userIdentity.Username));
                    identity.AddClaim(new Claim(ClaimTypes.Sid, userIdentity.SecurityId.ToString()));
                    if (userIdentity.Roles != null)
                    {
                        foreach (var role in userIdentity.Roles)
                        {
                            identity.AddClaim(new Claim(ClaimTypes.Role, role.Name));
                        }
                    }

                    return Task.FromResult(identity);
                }
            }

            context.SetError("invalid_grant", "The user name or password is incorrect.");
            return Task.FromResult<ClaimsIdentity>(null);
        }

        internal static ClaimsIdentity AuthenticateTicket(string ticket)
        {
            var identity = new ClaimsIdentity("Type");
            identity.AddClaim(new Claim(ClaimTypes.Name, "UserName"));
            identity.AddClaim(new Claim(ClaimTypes.Role, "user"));

            return identity;
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