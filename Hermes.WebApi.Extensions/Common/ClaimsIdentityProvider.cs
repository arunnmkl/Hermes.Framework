using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Hermes.WebApi.Core.Security;
using Hermes.WebApi.Security;
using Hermes.WebApi.Security.Models;

namespace Hermes.WebApi.Extensions.Common
{
    /// <summary>
    /// Claims identity provider.
    /// </summary>
    public class ClaimsIdentityProvider
    {
        /// <summary>
        /// Gets the claims identity.
        /// </summary>
        /// <param name="userIdentity">The user identity.</param>
        /// <param name="authenticationType">Type of the authentication.</param>
        /// <returns>
        /// hermes identity
        /// </returns>
        public static HermesIdentity GetHermesClaimsIdentity(UserIdentity userIdentity, string authenticationType)
        {
            HermesIdentity identity = new HermesIdentity(ConvertToClaims(userIdentity), authenticationType);
            return identity;
        }

        /// <summary>
        /// Converts to claims.
        /// </summary>
        /// <param name="userIdentity">The user identity.</param>
        /// <returns>claim collection</returns>
        private static IEnumerable<Claim> ConvertToClaims(UserIdentity userIdentity)
        {
            IList<Claim> claims = new List<Claim>();
            // Username
            claims.Add(new Claim(HermesIdentity.UsernameClaimType, userIdentity.Username));

            // UserId
            claims.Add(new Claim(HermesIdentity.UserIdClaimType, userIdentity.UserId.ToString()));

            // SID
            claims.Add(new Claim(HermesIdentity.SIDClaimType, userIdentity.SecurityId.ToString()));

            // Authentication Token
            if (string.IsNullOrEmpty(userIdentity.UserAuthTokenId) == false)
            {
                claims.Add(new Claim(HermesIdentity.AuthTokenClaimType, userIdentity.UserAuthTokenId));
            }

            if (userIdentity.Roles != null)
            {
                foreach (var role in userIdentity.Roles)
                {
                    // Roles
                    claims.Add(new Claim(HermesIdentity.RolesClaimType, role.Name));

                    // Security Id's
                    claims.Add(new Claim(HermesIdentity.SecurityIdsClaimType, role.SecurityId.ToString()));
                }
            }

            return claims;
        }
    }
}
