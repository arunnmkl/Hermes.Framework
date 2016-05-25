using System.Net.Http;
using System.Linq;
using System.Security.Claims;
using System.Web.Http;
using System.Net.Http.Formatting;
using System.Collections.Generic;
using System.Net;
using System;
using Hermes.WebApi.Extensions.Authentication;
using Hermes.WebApi.Extensions;

namespace Hermes.WebApi.Web.Controllers
{
    [RoutePrefix("api/User")]
    public class UserController : ApiControllerBase
    {
        [AllowAnonymous]
        public HttpResponseMessage Get(
            string external_access_token = ""
            , string provider = ""
            , string registered_user = ""
            , string external_user_name = ""
            , string local_Bare_token = "")
        {
            var result = string.Format(@"external_access_token={0}
                                        &provider={1}
                                        &registered_user={2}
                                        &external_user_name={3},
                                        &Logged_User={4},
                                        &Is_Authenticated={5},
                                        &local_bearer_token={6}",
                                            external_access_token,
                                            provider,
                                            registered_user,
                                            external_user_name,
                                            User.Identity.Name,
                                            User.Identity.IsAuthenticated,
                                            local_Bare_token);

            return Request.CreateResponse(result);
        }

        [Route("details")]
        public HttpResponseMessage GetDetails()
        {
            ClaimsPrincipal principal = Request.GetRequestContext().Principal as ClaimsPrincipal;

            if (principal != null && principal.Identity.IsAuthenticated)
            {
                string name = principal.Identity.Name;
                string authenticationType = principal.Identity.AuthenticationType;
                string username = string.Empty;
                string securityId = string.Empty;
                string userAuthTokenId = string.Empty;
                int timeInSeconds = 0;
                IEnumerable<string> roles = null;
                var cIdentity = principal.Identities.FirstOrDefault();

                if (cIdentity != null)
                {
                    username = cIdentity.FindFirst(ClaimTypes.Name).Value;
                    securityId = cIdentity.FindFirst(ClaimTypes.Sid).Value;
                    roles = cIdentity.FindAll(ClaimTypes.Role).Select(r => r.Value);
                    userAuthTokenId = cIdentity.FindFirst("UserAuthToken").Value;

                    var userAuthToken = AuthenticationCommands.GetUserAuthTokenById(userAuthTokenId);

                    if (userAuthToken != null)
                    {
                        // Validate expiration time if present
                        DateTimeOffset currentUtc = Startup.OAuthBearerOptions.SystemClock.UtcNow;
                        timeInSeconds = (int)((userAuthToken.ExpiresUtc - currentUtc).TotalSeconds);
                    }
                }

                object responseMessage = new
                {
                    Name = name,
                    AuthenticationType = authenticationType,
                    Username = username,
                    SecurityId = securityId,
                    Roles = roles,
                    UserAuthToken = userAuthTokenId,
                    TimeInSeconds = timeInSeconds

                };

                MediaTypeFormatter jsonFormatter = new JsonMediaTypeFormatter();
                return Request.CreateResponse(new ObjectContent<object>(responseMessage, jsonFormatter));
            }


            return Request.CreateErrorResponse(HttpStatusCode.Unauthorized, "Token Expires");
        }
    }
}