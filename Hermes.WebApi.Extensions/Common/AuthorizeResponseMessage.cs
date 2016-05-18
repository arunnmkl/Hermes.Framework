using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hermes.WebApi.Extensions.Common
{


    /// <summary>
    /// Authorize response message
    /// </summary>
    public static class AuthorizeResponseMessage
    {
        /// <summary>
        /// Gets the default.
        /// </summary>
        /// <value>
        /// Authorization has been denied for this request.
        /// </value>
        public static object Default
        {
            get
            {
                return new { Error = new { Code = 401, Message = "Authorization has been denied for this request." } };
            }
        }

        /// <summary>
        /// Gets the require authorization.
        /// </summary>
        /// <value>
        /// The require authorization.
        /// </value>
        public static object RequireAuthorization
        {
            get
            {
                return new { Error = new { Code = 401, Message = "Request require authorization" } };
            }
        }

        /// <summary>
        /// Gets the missing access token.
        /// </summary>
        /// <value>
        /// The missing access token.
        /// </value>
        public static object MissingAccessToken
        {
            get
            {
                return new { Error = new { Code = 401, Message = "Missing access token" } };
            }
        }

        /// <summary>
        /// Gets the invalid bearer token.
        /// </summary>
        /// <value>
        /// The invalid bearer token.
        /// </value>
        public static object InvalidBearerToken
        {
            get
            {
                return new { Error = new { Code = 401, Message = "Invalid bearer token received" } };
            }
        }

        /// <summary>
        /// Gets the user session expired.
        /// </summary>
        /// <value>
        /// The user session expired.
        /// </value>
        public static object UserSessionExpired
        {
            get
            {
                return new { Error = new { Code = 401, Message = "User session has already expired" } };
            }
        }

        /// <summary>
        /// Gets the token expired.
        /// </summary>
        /// <value>
        /// The token expired.
        /// </value>
        public static object TokenExpired
        {
            get
            {
                return new { Error = new { Code = 401, Message = "The Token has expired" } };
            }
        }
    }
}
