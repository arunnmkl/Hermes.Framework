using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Hermes.WebApi.Extensions.Authentication;
using Hermes.WebApi.Security.Models;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;
using Newtonsoft.Json.Linq;

namespace Hermes.WebApi.Extensions.Common
{
    /// <summary>
    /// Common helper object
    /// </summary>
    public class Helper
    {
        /// <summary>
        /// Generates the local access token response.
        /// </summary>
        /// <param name="userIdentity">The user identity.</param>
        /// <returns></returns>
        public static JObject GenerateLocalAccessTokenResponse(UserIdentity userIdentity)
        {
            TimeSpan tokenExpiration = TimeSpan.FromDays(1);

            ClaimsIdentity identity = ClaimsIdentityProvider.GetClaimsIdentity(userIdentity, OAuthDefaults.AuthenticationType);

            var props = new AuthenticationProperties()
            {
                IssuedUtc = DateTime.UtcNow,
                ExpiresUtc = DateTime.UtcNow.Add(tokenExpiration),
            };

            var ticket = new AuthenticationTicket(identity, props);

            var accessToken = ProtectAccessToken(ticket);

            JObject tokenResponse = new JObject(
                new JProperty("userName", userIdentity.Username)
                , new JProperty("access_token", accessToken)
                , new JProperty("token_type", "bearer")
                , new JProperty("expires_in", tokenExpiration.TotalSeconds.ToString())
                , new JProperty(".issued", ticket.Properties.IssuedUtc.ToString())
                , new JProperty(".expires", ticket.Properties.ExpiresUtc.ToString())
            );

            SaveAuthToken(identity, ticket, accessToken);

            return tokenResponse;
        }

        /// <summary>
        /// Protects the access token.
        /// </summary>
        /// <param name="ticket">The ticket.</param>
        /// <returns>
        /// protected access token
        /// </returns>
        public static string ProtectAccessToken(AuthenticationTicket ticket)
        {
            return Startup.OAuthBearerOptions.AccessTokenFormat.Protect(ticket);
        }

        /// <summary>
        /// Unprotects the access token.
        /// </summary>
        /// <param name="protectedText">The protected text.</param>
        /// <returns>
        /// authentication ticket
        /// </returns>
        public static AuthenticationTicket UnprotectAccessToken(string protectedText)
        {
            return Startup.OAuthBearerOptions.AccessTokenFormat.Unprotect(protectedText);
        }

        /// <summary>
        /// Saves the authentication token.
        /// </summary>
        /// <param name="identity">The identity.</param>
        /// <param name="ticket">The ticket.</param>
        /// <param name="accessToken">The access token.</param>
        private static void SaveAuthToken(ClaimsIdentity identity, AuthenticationTicket ticket, string accessToken)
        {
            var userAuthToken = new UserAuthToken(accessToken)
            {
                AuthClientId = Convert.ToString(string.Empty),
                ExpiresUtc = Convert.ToDateTime(ticket.Properties.ExpiresUtc.ToString()),
                IssuedUtc = Convert.ToDateTime(ticket.Properties.IssuedUtc.ToString()),
                UserId = Convert.ToInt64(identity.FindFirst("Identity").Value),
                UserAuthTokenId = Convert.ToString(identity.FindFirst("UserAuthToken").Value),
                IsLoggedIn = true
            };

            bool isSaved = AuthenticationCommands.SaveUserAuthToken(userAuthToken);
        }
    }
}
