﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Hermes.WebApi.Security.Models;

namespace Hermes.WebApi.Extensions.Common
{
    /// <summary>
    /// Identity provider.
    /// </summary>
    public class IdentityProvider
    {
        /// <summary>
        /// Gets the claims identity.
        /// </summary>
        /// <param name="userIdentity">The user identity.</param>
        /// <param name="authenticationType">Type of the authentication.</param>
        /// <returns>claims identity</returns>
        public static ClaimsIdentity GetClaimsIdentity(UserIdentity userIdentity, string authenticationType)
        {
            ClaimsIdentity identity = new ClaimsIdentity(authenticationType);
            identity.AddClaim(new Claim(ClaimTypes.Name, userIdentity.Username));
            identity.AddClaim(new Claim(ClaimTypes.Sid, userIdentity.SecurityId.ToString()));
            identity.AddClaim(new Claim("Identity", userIdentity.UserId.ToString()));
            if (userIdentity.Roles != null)
            {
                foreach (var role in userIdentity.Roles)
                {
                    identity.AddClaim(new Claim(ClaimTypes.Role, role.Name));
                    identity.AddClaim(new Claim(ClaimTypes.GroupSid, role.SecurityId.ToString()));
                }
            }

            return identity;
        }
    }
}
