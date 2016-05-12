using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http.Filters;
using Hermes.WebApi.Core.Security;
using Hermes.WebApi.Security.Models;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;

namespace Hermes.WebApi.Extensions.Authentication.Filter
{
    /// <summary>
    /// Bearer authentication filter
    /// </summary>
    /// <seealso cref="System.Web.Http.Filters.ActionFilterAttribute" />
    /// <seealso cref="System.Web.Http.Filters.IAuthenticationFilter" />
    public class BearerAuthenticationFilter : ActionFilterAttribute, IAuthenticationFilter
    {
        /// <summary>
        /// Authenticates the request.
        /// </summary>
        /// <param name="context">The authentication context.</param>
        /// <param name="cancellationToken">The token to monitor for cancellation requests.</param>
        /// <returns>
        /// A Task that will perform authentication.
        /// </returns>
        public async Task AuthenticateAsync(HttpAuthenticationContext context, CancellationToken cancellationToken)
        {
            // 1. Look for token in the request.
            HttpRequestMessage request = context.Request;
            AuthenticationHeaderValue authorization = request.Headers.Authorization;

            // 2. If there are no authorization token in header, do nothing.
            if (authorization == null)
            {
                return;
            }

            // 3. If there are authorization token but the filter does not recognize the 
            //    authentication scheme, do nothing.
            if (authorization.Scheme != "Bearer")
            {
                context.ErrorResult = context.ErrorResult = new Result.AuthenticationFailureResult(context.Request, new { Error = new { Code = 401, Message = "Request require authorization" } });
                return;
            }

            // 4. If there are authorization token that the filter understands, try to validate them.
            // 5. If the authorization token are empty/bad, set the error result.
            if (String.IsNullOrEmpty(authorization.Parameter))
            {
                context.ErrorResult = new Result.AuthenticationFailureResult(request, new { Error = new { Code = 401, Message = "Missing access token" } });
                return;
            }

            // TODO:
            AuthenticationTicket authTicket = await AuthenticateAsync(authorization.Parameter, cancellationToken);
            if (authTicket == null)
            {
                context.ErrorResult = new Result.AuthenticationFailureResult(request, new { Error = new { Code = 401, Message = "Invalid bearer token received" } });
                return;
            }

            // Validate expiration time if present
            DateTimeOffset currentUtc = Startup.OAuthBearerOptions.SystemClock.UtcNow;

            if (authTicket.Properties.ExpiresUtc.HasValue && authTicket.Properties.ExpiresUtc.Value < currentUtc)
            {
                context.ErrorResult = new Result.AuthenticationFailureResult(request, new { Error = new { Code = 401, Message = "The Token has expired" } });
                return;
            }

            // Give application final opportunity to override results
            var authContext = new OAuthValidateIdentityContext(context.Request.GetOwinContext(), Startup.OAuthBearerOptions, authTicket);
            if (authTicket != null && authTicket.Identity != null && authTicket.Identity.IsAuthenticated)
            {
                // bearer token with identity starts validated
                authContext.Validated();
            }

            if (Startup.OAuthBearerOptions.Provider != null)
            {
                await Startup.OAuthBearerOptions.Provider.ValidateIdentity(authContext);
            }

            if (!authContext.IsValidated)
            {
                context.ErrorResult = new Result.AuthenticationFailureResult(request, new { Error = new { Code = 401, Message = "Invalid bearer token received" } });
                return;
            }

            var userAuthTokenReq = new UserAuthToken(authorization.Parameter)
            {
                UserId = Convert.ToInt64(authTicket.Identity.FindFirst("Identity").Value)
            };

            if (Configuration.Current.DBTokenValidationEnabled)
            {
                var userAuthTokenRes = AuthenticationCommands.GetUserAuthToken(userAuthTokenReq);

                if (userAuthTokenRes == null
                    || userAuthTokenRes.IsLoggedIn == false)
                {
                    context.ErrorResult = new Result.AuthenticationFailureResult(request, new { Error = new { Code = 401, Message = "User session has already expired" } });
                    return;
                }
            }

            // 6. If the token is valid, set principal.
            else
            {
                var claimsIdentity = authTicket.Identity as ClaimsIdentity; ;
                if (claimsIdentity != null)
                {
                    context.Principal = new ClaimsPrincipal(claimsIdentity);
                }
            }
        }

        /// <summary>
        /// Authenticates the asynchronous.
        /// </summary>
        /// <param name="token">The token.</param>
        /// <param name="cancellationToken">The cancellation token.</param>
        /// <returns></returns>
        private async Task<AuthenticationTicket> AuthenticateAsync(string token, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested(); // Unfortunately, IClaimsIdenityFactory doesn't support CancellationTokens.
            return await Task.Run(() =>
            {
                return AuthenticationCommands.ConvertTokenAsAuthTicket(token);
            });
        }

        /// <summary>
        /// Challenges the asynchronous.
        /// </summary>
        /// <param name="context">The context.</param>
        /// <param name="cancellationToken">The cancellation token.</param>
        /// <returns></returns>
        public Task ChallengeAsync(HttpAuthenticationChallengeContext context, CancellationToken cancellationToken)
        {
            var challenge = new AuthenticationHeaderValue("Bearer");
            context.Result = new Result.AddChallengeOnUnauthorizedResult(challenge, context.Result);
            return Task.FromResult(0);
        }
    }
}
