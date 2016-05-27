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
using Hermes.WebApi.Core.Security;

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
        /// Gets the hermes principal.
        /// </summary>
        /// <value>
        /// The hermes principal.
        /// </value>
        public static HermesPrincipal HermesPrincipal
        {
            get
            {
                return Thread.CurrentPrincipal as HermesPrincipal;
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
    }
}
