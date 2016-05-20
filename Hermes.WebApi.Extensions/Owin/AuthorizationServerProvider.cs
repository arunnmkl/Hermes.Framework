using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Hermes.WebApi.Extensions.Authentication;
using Hermes.WebApi.Extensions.Common;
using Hermes.WebApi.Security.Models;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;
using Security = Hermes.WebApi.Security;
using HermeSecurity = Hermes.WebApi.Core.Security;

namespace GlobalTranz.WebApi.Extensions.Owin
{
    /// <summary>
    /// This is the authentication provider which is responsible for all kind of validation for the client 
    /// and the user name and password as well, when /token means main token service will get called.
    /// </summary>
    /// <seealso cref="Microsoft.Owin.Security.OAuth.OAuthAuthorizationServerProvider" />
    public class AuthorizationServerProvider : OAuthAuthorizationServerProvider
    {
        /// <summary>
        /// Called to validate that the origin of the request is a registered "client_id", and that the correct credentials for that client are
        /// present on the request. If the web application accepts Basic authentication credentials,
        /// context.TryGetBasicCredentials(out clientId, out clientSecret) may be called to acquire those values if present in the request header. If the web
        /// application accepts "client_id" and "client_secret" as form encoded POST parameters,
        /// context.TryGetFormCredentials(out clientId, out clientSecret) may be called to acquire those values if present in the request body.
        /// If context.Validated is not called the request will not proceed further.
        /// </summary>
        /// <param name="context">The context of the event carries information in and results out.</param>
        /// <returns>
        /// Task to enable asynchronous execution
        /// </returns>
        public override Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            string clientId = string.Empty;
            string clientSecret = string.Empty;
            AuthClient client = null;

            var forceLogin = context.TryGetParamValues("forcelogin");
            context.OwinContext.Set<bool>("as:ForceLogin", Convert.ToBoolean(forceLogin?.FirstOrDefault() ?? "false"));

            if (!context.TryGetBasicCredentials(out clientId, out clientSecret))
            {
                context.TryGetFormCredentials(out clientId, out clientSecret);
            }

            if (context.ClientId == null)
            {
                //context.Validated();

                SetValidateClientError(context, "invalid_clientId", "Client id should be sent.");

                return Task.FromResult<object>(null);
            }

            client = AuthenticationCommands.FindAuthClient(context.ClientId);

            if (client == null)
            {
                SetValidateClientError(context, "invalid_clientId", string.Format("Client '{0}' is not registered in the system.", context.ClientId));
                return Task.FromResult<object>(null);
            }

            if (client.ApplicationType == ApplicationTypes.NativeConfidential)
            {
                if (string.IsNullOrWhiteSpace(clientSecret))
                {
                    SetValidateClientError(context, "invalid_clientId", "Client secret should be sent.");
                    return Task.FromResult<object>(null);
                }
                else
                {
                    if (client.Secret != Security.Helper.GetHash(clientSecret))
                    {
                        SetValidateClientError(context, "invalid_clientId", "Client secret is invalid.");
                        return Task.FromResult<object>(null);
                    }
                }
            }

            if (!client.IsActive)
            {
                SetValidateClientError(context, "invalid_clientId", $"Client {client.AuthClientId} is inactive.");
                return Task.FromResult<object>(null);
            }

            context.OwinContext.Set<string>("as:clientAllowedOrigin", client.AllowedOrigin);
            context.OwinContext.Set<string>("as:clientRefreshTokenLifeTime", client.RefreshTokenLifeTime.ToString());

            context.Validated(context.ClientId);
            context.OwinContext.Set<AuthClient>("as:client", client);
            return base.ValidateClientAuthentication(context);  //Task.FromResult<object>(null);
        }

        /// <summary>
        /// Called when a request to the Token endpoint arrives with a "grant_type" of "password". This occurs when the user has provided name and password
        /// credentials directly into the client application's user interface, and the client application is using those to acquire an "access_token" and
        /// optional "refresh_token". If the web application supports the
        /// resource owner credentials grant type it must validate the context.Username and context.Password as appropriate. To issue an
        /// access token the context.Validated must be called with a new ticket containing the claims about the resource owner which should be associated
        /// with the access token. The application should take appropriate measures to ensure that the endpoint isn’t abused by malicious callers.
        /// The default behavior is to reject this grant type.
        /// See also http://tools.ietf.org/html/rfc6749#section-4.3.2
        /// </summary>
        /// <param name="context">The context of the event carries information in and results out.</param>
        /// <returns>
        /// Task to enable asynchronous execution
        /// </returns>
        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            var allowedOrigin = context.OwinContext.Get<string>("as:clientAllowedOrigin");
            var forceLogin = context.OwinContext.Get<bool>("as:ForceLogin");

            if (allowedOrigin == null)
            {
                allowedOrigin = "*";
            }

            context.OwinContext.Response.Headers.Add("Access-Control-Allow-Origin", new[] { allowedOrigin });

            var identity = await Task.Run<ClaimsIdentity>(() =>
            {
                return AuthenticationCommands.AuthenticateUsernamePassword(context);
            });

            if (identity == null)
            {
                context.Rejected();
                context.SetError("invalid_grant", "The user name or password is incorrect.");
                return;
            }

            string authToken = AuthenticationCommands.GenerateAuthToken(context.UserName, !HermeSecurity.Configuration.Current.MultipleInstanceEnabled, forceLogin);

            if (string.IsNullOrEmpty(authToken))
            {
                context.Rejected();
                context.SetError("session_rejected", $"The user {context.UserName}, is already logged in with other device/machine.");
                return;
            }
            else
            {
                var userAuthToken = identity.Claims.FirstOrDefault(c => c.Type == "UserAuthToken");
                if (userAuthToken != null)
                {
                    identity.RemoveClaim(userAuthToken);
                }

                identity.AddClaim(new Claim("UserAuthToken", authToken));
            }

            var authDictonary = new Dictionary<string, string>
            {
                {
                    "as:client_id", (context.ClientId == null) ? string.Empty : context.ClientId
                },
                {
                    "userName", context.UserName
                }
            };

            var ticket = new AuthenticationTicket(identity, new AuthenticationProperties(authDictonary));
            context.Validated(ticket);
        }

        /// <summary>
        /// Called when a request to the Token endpoint arrives with a "grant_type" of "refresh_token". This occurs if your application has issued a "refresh_token"
        /// along with the "access_token", and the client is attempting to use the "refresh_token" to acquire a new "access_token", and possibly a new "refresh_token".
        /// To issue a refresh token the an Options.RefreshTokenProvider must be assigned to create the value which is returned. The claims and properties
        /// associated with the refresh token are present in the context.Ticket. The application must call context.Validated to instruct the
        /// Authorization Server middleware to issue an access token based on those claims and properties. The call to context.Validated may
        /// be given a different AuthenticationTicket or ClaimsIdentity in order to control which information flows from the refresh token to
        /// the access token. The default behavior when using the OAuthAuthorizationServerProvider is to flow information from the refresh token to
        /// the access token unmodified.
        /// See also http://tools.ietf.org/html/rfc6749#section-6
        /// </summary>
        /// <param name="context">The context of the event carries information in and results out.</param>
        /// <returns>
        /// Task to enable asynchronous execution
        /// </returns>
        public override Task GrantRefreshToken(OAuthGrantRefreshTokenContext context)
        {
            var originalClient = context.Ticket.Properties.Dictionary["as:client_id"];
            var currentClient = context.ClientId;

            if (originalClient != currentClient)
            {
                context.SetError("invalid_clientId", "Refresh token is issued to a different clientId.");
                return Task.FromResult<object>(null);
            }

            // Change authentication ticket for refresh token requests
            var newIdentity = new ClaimsIdentity(context.Ticket.Identity);

            // TODO: to add new claims....
            var newClaim = newIdentity.Claims.Where(c => c.Type == "newClaim").FirstOrDefault();
            if (newClaim != null)
            {
                newIdentity.RemoveClaim(newClaim);
            }

            newIdentity.AddClaim(new Claim("newClaim", "newValue"));

            var newTicket = new AuthenticationTicket(newIdentity, context.Ticket.Properties);
            context.Validated(newTicket);

            return Task.FromResult<object>(null);
        }

        /// <summary>
        /// Called at the final stage of a successful Token endpoint request. An application may implement this call in order to do any final
        /// modification of the claims being used to issue access or refresh tokens. This call may also be used in order to add additional
        /// response parameters to the Token endpoint's JSON response body.
        /// </summary>
        /// <param name="context">The context of the event carries information in and results out.</param>
        /// <returns>
        /// Task to enable asynchronous execution
        /// </returns>
        public override Task TokenEndpoint(OAuthTokenEndpointContext context)
        {
            foreach (KeyValuePair<string, string> property in context.Properties.Dictionary)
            {
                context.AdditionalResponseParameters.Add(property.Key, property.Value);
            }

            return Task.FromResult<object>(null);
        }

        /// <summary>
        /// Called before the TokenEndpoint redirects its response to the caller.
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public override Task TokenEndpointResponse(OAuthTokenEndpointResponseContext context)
        {
            var userAuthToken = new UserAuthToken(context.AccessToken)
            {
                AuthClientId = Convert.ToString(context.AdditionalResponseParameters.GetValueByKey("as:client_id")),
                ExpiresUtc = Convert.ToDateTime(context.AdditionalResponseParameters.GetValueByKey(".issued")),
                IssuedUtc = Convert.ToDateTime(context.AdditionalResponseParameters.GetValueByKey(".expires")),
                UserId = Convert.ToInt64(context.Identity.FindFirst("Identity").Value),
                UserAuthTokenId = Convert.ToString(context.Identity.FindFirst("UserAuthToken").Value),
                IsLoggedIn = true
            };

            bool isSaved = AuthenticationCommands.SaveUserAuthToken(userAuthToken);
            return base.TokenEndpointResponse(context);
        }

        /// <summary>
        /// Called for each request to the Token endpoint to determine if the request is valid and should continue.
        /// The default behavior when using the OAuthAuthorizationServerProvider is to assume well-formed requests, with
        /// validated client credentials, should continue processing. An application may add any additional constraints.
        /// </summary>
        /// <param name="context">The context of the event carries information in and results out.</param>
        /// <returns>
        /// Task to enable asynchronous execution
        /// </returns>
        public override Task ValidateTokenRequest(OAuthValidateTokenRequestContext context)
        {
            return base.ValidateTokenRequest(context);
        }

        /// <summary>
        /// Sets the validate client error.
        /// </summary>
        /// <param name="context">The context.</param>
        /// <param name="error">The error.</param>
        /// <param name="errorDescription">The error description.</param>
        private void SetValidateClientError(OAuthValidateClientAuthenticationContext context, string error, string errorDescription)
        {
            context.Rejected();
            context.SetError(error, errorDescription);

            if (context.OwinContext.Request.Headers.ContainsKey("Origin")
                && !context.OwinContext.Request.Headers.ContainsKey("Access-Control-Allow-Origin"))
            {
                var origin = context.OwinContext.Request.Headers.GetValues("Origin");
                context.OwinContext.Response.Headers.Add("Access-Control-Allow-Origin", new[] { origin.FirstOrDefault() });
            }
        }
    }
}