using System;
using System.Net.Http;
using System.Security.Principal;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http.Filters;
using Hermes.WebApi.Core.Common;
using Hermes.WebApi.Core.Security;
using Hermes.WebApi.Security.Models;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;

namespace Hermes.WebApi.Extensions.Authentication
{
    /// <summary>
    /// Bearer authenticate controller
    /// </summary>
    /// <seealso cref="BearerAuthenticationBase" />
    public class BearerAuthenticateController : BearerAuthenticationBase
    {
        /// <summary>
        /// Authenticates the token.
        /// </summary>
        /// <param name="accessToken">The access token.</param>
        /// <param name="context"></param>
        /// <param name="cancellationToken">The cancellation token.</param>
        /// <returns>
        /// true whether the token is valid else return false.
        /// </returns>
        public override async Task<bool> AuthenticateToken(string accessToken, HttpAuthenticationContext context, CancellationToken cancellationToken)
        {
            // convert token into authentication ticket
            AuthenticationTicket authTicket = await AuthenticateAsync(accessToken, cancellationToken);
            if (authTicket == null)
            {
                ErrorMessage = AuthorizeResponseMessage.InvalidBearerToken;
                return false;
            }

            // Validate expiration time if present
            DateTimeOffset currentUtc = Startup.OAuthBearerOptions.SystemClock.UtcNow;

            if (authTicket.Properties.ExpiresUtc.HasValue && authTicket.Properties.ExpiresUtc.Value < currentUtc)
            {
                ErrorMessage = AuthorizeResponseMessage.TokenExpired;
                return false;
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
                ErrorMessage = AuthorizeResponseMessage.InvalidBearerToken;
                return false;
            }

            if (Configuration.Current.ValidatePasswordChange)
            {
                long userId = Convert.ToInt64(authTicket.Identity.FindFirst(HermesIdentity.UserIdClaimType).Value);
                long claimsTimeStamp = Convert.ToInt64(authTicket.Identity.FindFirst(HermesIdentity.PasswordTimestampClaimType).Value);
                long timeStamp = AuthenticationCommands.GetPasswordTimestamp(userId);

                if (claimsTimeStamp != timeStamp)
                {
                    ErrorMessage = AuthorizeResponseMessage.AlteredCredential;
                    return false;
                }
            }

            if (Configuration.Current.DBTokenValidationEnabled)
            {
                var userAuthTokenReq =
                    new UserAuthToken(accessToken)
                    {
                        UserId = Convert.ToInt64(authTicket.Identity.FindFirst(HermesIdentity.UserIdClaimType).Value)
                    };

                var userAuthTokenRes = AuthenticationCommands.GetUserAuthToken(userAuthTokenReq);

                if (userAuthTokenRes == null
                    || userAuthTokenRes.IsLoggedIn == false
                    || userAuthTokenRes.IsExpired == true)
                {
                    ErrorMessage = AuthorizeResponseMessage.UserSessionExpired;
                    return false;
                }
            }

            return true;
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
    }
}
