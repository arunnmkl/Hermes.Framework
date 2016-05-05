using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Hermes.WebApi.Security.Models;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;
using Newtonsoft.Json.Linq;

namespace Hermes.WebApi.Extensions.Common
{
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

            ClaimsIdentity identity = IdentityProvider.GetClaimsIdentity(userIdentity, OAuthDefaults.AuthenticationType);

            var props = new AuthenticationProperties()
            {
                IssuedUtc = DateTime.UtcNow,
                ExpiresUtc = DateTime.UtcNow.Add(tokenExpiration),
            };

            var ticket = new AuthenticationTicket(identity, props);

            var accessToken = Startup.OAuthBearerOptions.AccessTokenFormat.Protect(ticket);

            JObject tokenResponse = new JObject(
                new JProperty("userName", userIdentity.Username)
                , new JProperty("access_token", accessToken)
                , new JProperty("token_type", "bearer")
                , new JProperty("expires_in", tokenExpiration.TotalSeconds.ToString())
                , new JProperty(".issued", ticket.Properties.IssuedUtc.ToString())
                , new JProperty(".expires", ticket.Properties.ExpiresUtc.ToString())
            );

            return tokenResponse;
        }
    }
}
