using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using Hermes.WebApi.Base.SqlSerializer;

namespace Hermes.WebApi.Security
{
    /// <summary>
    /// Authentication context.
    /// </summary>
    public class AuthContext
    {
        /// <summary>
        /// The authentication dal
        /// </summary>
        [ThreadStatic]
        private static SqlSerializer authDal;

        /// <summary>
        /// Gets the security schema.
        /// </summary>
        /// <value>
        /// The security schema.
        /// </value>
        public static string SecuritySchema
        {
            get
            {
                return ConfigurationManager.AppSettings["SecuritySchema"] ?? "[dbo]";
            }
        }

        /// <summary>
        /// Gets or sets the authentication dal.
        /// </summary>
        /// <value>
        /// The authentication dal.
        /// </value>
        public static SqlSerializer AuthDal
        {
            get
            {
                return authDal ?? SqlSerializer.ByName("AuthContext");
            }

            set
            {
                authDal = value;
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
        public static IList<string> SecurityIds
        {
            get
            {
                var securityClaims = Principal.Claims.Where(a => (a.Type == ClaimTypes.Sid || a.Type == ClaimTypes.GroupSid));
                if (securityClaims.Any())
                {
                    return securityClaims.Select(s => s.Value).ToList();
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
        public static string SecurityId
        {
            get
            {
                var securityClaims = Principal.Claims.Where(a => (a.Type == ClaimTypes.Sid));
                if (securityClaims.Any())
                {
                    return securityClaims.FirstOrDefault().Value;
                }

                return string.Empty;
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
                var securityClaims = Principal.Claims.Where(a => (a.Type == "Identity"));
                if (securityClaims.Any())
                {
                    return Convert.ToInt64(securityClaims.FirstOrDefault().Value);
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
                var securityClaims = Principal.Claims.Where(a => (a.Type == "UserAuthToken"));
                if (securityClaims.Any())
                {
                    return Convert.ToString(securityClaims.FirstOrDefault().Value);
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
                var securityClaims = Principal.Claims.Where(a => (a.Type == ClaimTypes.Name));
                if (securityClaims.Any())
                {
                    return Convert.ToString(securityClaims.FirstOrDefault().Value);
                }

                return string.Empty;
            }
        }
    }
}
