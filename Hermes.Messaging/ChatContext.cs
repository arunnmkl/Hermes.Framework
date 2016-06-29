using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading;
using System.Web;
using Hermes.WebApi.Core.Security;

namespace Hermes.Messaging
{
    public class ChatContext
    {
        /// <summary>
        /// Gets the hermes principal.
        /// </summary>
        /// <value>
        /// The hermes principal.
        /// </value>
        public static HermesPrincipal HermesPrincipal
        {
            get
            {
                return new HermesPrincipal(Principal);
            }
        }

        /// <summary>
        /// Gets the principal.
        /// </summary>
        /// <value>
        /// The principal.
        /// </value>
        public static ClaimsPrincipal Principal
        {
            get
            {
                return Thread.CurrentPrincipal as ClaimsPrincipal;
            }
        }

        /// <summary>
        /// Gets the security ids.
        /// </summary>
        /// <value>
        /// The security ids.
        /// </value>
        public static IList<Guid> SecurityIds
        {
            get
            {
                if (HermesPrincipal != null)
                {
                    return HermesPrincipal.SecurityIds.ToList();
                }

                return null;
            }
        }

        /// <summary>
        /// Gets the security identifier.
        /// </summary>
        /// <value>
        /// The security identifier.
        /// </value>
        public static Guid SecurityId
        {
            get
            {
                if (HermesPrincipal != null)
                {
                    return HermesPrincipal.SecurityId;
                }

                return Guid.Empty;
            }
        }

        /// <summary>
        /// Gets the user identifier.
        /// </summary>
        /// <value>
        /// The user identifier.
        /// </value>
        public static long UserId
        {
            get
            {
                if (HermesPrincipal != null)
                {
                    return HermesPrincipal.UserId;
                }

                return default(long);
            }
        }

        /// <summary>
        /// Gets the user authentication token identifier.
        /// </summary>
        /// <value>
        /// The user authentication token identifier.
        /// </value>
        public static string UserAuthTokenId
        {
            get
            {
                if (HermesPrincipal != null)
                {
                    return HermesPrincipal.UserAuthTokenId;
                }

                return string.Empty;
            }
        }

        /// <summary>
        /// Gets the username.
        /// </summary>
        /// <value>
        /// The username.
        /// </value>
        public static string Username
        {
            get
            {
                if (HermesPrincipal != null)
                {
                    return HermesPrincipal.Username;
                }

                return string.Empty;
            }
        }

        /// <summary>
        /// Gets the roles.
        /// </summary>
        /// <value>
        /// The roles.
        /// </value>
        public static IList<string> Roles
        {
            get
            {
                if (HermesPrincipal != null)
                {
                    return (IList<string>)HermesPrincipal.Roles;
                }

                return null;
            }
        }
    }
}