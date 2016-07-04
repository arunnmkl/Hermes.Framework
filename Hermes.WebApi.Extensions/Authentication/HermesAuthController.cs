using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Web.Http;
using Hermes.WebApi.Core.Security;

namespace Hermes.WebApi.Extensions.Authentication
{
    /// <summary>
    /// Base controller for hermes authentication.
    /// </summary>
    /// <seealso cref="Hermes.WebApi.ApiControllerBase" />
    public class HermesAuthController : ApiControllerBase
    {
        /// <summary>
        /// Gets the details.
        /// </summary>
        /// <returns></returns>
        public HttpResponseMessage GetDetails()
        {
            HermesPrincipal principal = Request.GetRequestContext().Principal as HermesPrincipal;

            if (principal != null && principal.Identity.IsAuthenticated)
            {
                string name = principal.Identity.Name;
                string authenticationType = principal.Identity.AuthenticationType;
                string username = principal.Username;
                Guid securityId = principal.SecurityId;
                string userAuthTokenId = principal.UserAuthTokenId;
                string userAuthClient = principal.AuthClient;
                IEnumerable<string> roles = principal.Roles;
                int timeInSeconds = 0;

                var userAuthToken = AuthenticationCommands.GetUserAuthTokenById(userAuthTokenId);

                if (userAuthToken != null)
                {
                    // Validate expiration time if present
                    DateTimeOffset currentUtc = Startup.OAuthBearerOptions.SystemClock.UtcNow;
                    timeInSeconds = (int)((userAuthToken.ExpiresUtc - currentUtc).TotalSeconds);
                }


                object responseMessage = new
                {
                    Name = name,
                    AuthenticationType = authenticationType,
                    Username = username,
                    SecurityId = securityId,
                    Roles = roles,
                    UserAuthToken = userAuthTokenId,
                    TimeInSeconds = timeInSeconds,
                    AuthClient = userAuthClient
                };

                MediaTypeFormatter jsonFormatter = new JsonMediaTypeFormatter();
                return Request.CreateResponse(new ObjectContent<object>(responseMessage, jsonFormatter));
            }


            return Request.CreateErrorResponse(HttpStatusCode.Unauthorized, "Token Expires");
        }
    }
}
