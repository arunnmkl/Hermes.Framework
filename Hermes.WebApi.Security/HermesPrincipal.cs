using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Claims;

namespace Hermes.WebApi.Security
{
    /// <summary>
    /// 
    /// </summary>
    /// <seealso cref="System.Security.Claims.ClaimsPrincipal" />
    public class HermesPrincipal : ClaimsPrincipal
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="HermesPrincipal"/> class.
        /// </summary>
        /// <param name="identity">The identity.</param>
        public HermesPrincipal(HermesIdentity identity): base(identity)
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="HermesPrincipal"/> class.
        /// </summary>
        /// <param name="identity">The identity.</param>
        public HermesPrincipal(ClaimsIdentity identity) : base(identity)
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="HermesPrincipal"/> class.
        /// </summary>
        /// <param name="claimsPrincipal">The claims principal.</param>
        public HermesPrincipal(ClaimsPrincipal claimsPrincipal): base(claimsPrincipal)
        {

        }

        /// <summary>
        /// Gets the roles.
        /// </summary>
        /// <value>
        /// The roles.
        /// </value>
        public IEnumerable<string> Roles
        {
            get
            {
                return from claim in FindAll(HermesIdentity.RolesClaimType) select claim.Value;
            }
        }

        /// <summary>
        /// Gets the user identifier.
        /// </summary>
        /// <value>
        /// The user identifier.
        /// </value>
        public long UserId
        {
            get
            {
                return Convert.ToInt64(FindFirst(HermesIdentity.UserIdClaimType).Value);
            }
        }

        /// <summary>
        /// Gets the username.
        /// </summary>
        /// <value>
        /// The username.
        /// </value>
        public string Username
        {
            get
            {
                return Convert.ToString(FindFirst(HermesIdentity.UsernameClaimType).Value);
            }
        }

        /// <summary>
        /// Gets the name of this claims identity.
        /// </summary>
        /// <value>
        /// The name.
        /// </value>
        public string Name
        {
            get
            {
                return Username;
            }
        }

        /// <summary>
        /// Gets the security identifier.
        /// </summary>
        /// <value>
        /// The security identifier.
        /// </value>
        public string SecurityId
        {
            get
            {
                return Convert.ToString(FindFirst(HermesIdentity.SIDClaimType).Value);
            }
        }

        /// <summary>
        /// Gets the user authentication token identifier.
        /// </summary>
        /// <value>
        /// The user authentication token identifier.
        /// </value>
        public string UserAuthTokenId
        {
            get
            {
                return Convert.ToString(FindFirst(HermesIdentity.AuthTokenClaimType).Value);
            }
        }

        /// <summary>
        /// Gets the security ids.
        /// </summary>
        /// <value>
        /// The security ids.
        /// </value>
        public IEnumerable<string> SecurityIds
        {
            get
            {
                return from claim in FindAll(HermesIdentity.SecurityIdsClaimType) select claim.Value;
            }
        }

        /// <summary>
        /// Finds the first value.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="type">The type.</param>
        /// <returns></returns>
        private T FindFirstValue<T>(string type)
        {
            return Claims
                .Where(p => p.Type == type)
                .Select(p => (T)Convert.ChangeType(p.Value, typeof(T), CultureInfo.InvariantCulture))
                .FirstOrDefault();
        }

        /// <summary>
        /// Finds the values.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="type">The type.</param>
        /// <returns></returns>
        private IEnumerable<T> FindValues<T>(string type)
        {
            return Claims
                .Where(p => p.Type == type)
                .Select(p => (T)Convert.ChangeType(p.Value, typeof(T), CultureInfo.InvariantCulture))
                .ToList();
        }
    }
}
