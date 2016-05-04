// ***********************************************************************
// Assembly         : Hermes.WebApi.Web
// Author           : avinash.dubey
// Created          : 01-19-2016
//
// Last Modified By : avinash.dubey
// Last Modified On : 01-19-2016
// ***********************************************************************
// <copyright file="LoginController.cs" company="">
//     Copyright ©  2015
// </copyright>
// <summary>This file has a controller which is used for the authentication.</summary>
// ***********************************************************************
using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Security.Principal;
using System.Threading.Tasks;
using System.Web.Http;
using Hermes.WebApi.Core;
using Hermes.WebApi.Extensions;
using Hermes.WebApi.Extensions.Authentication;
using Hermes.WebApi.Extensions.Owin.Externals;
using Hermes.WebApi.Extensions.Validation;
using Hermes.WebApi.Security.Models;
using Hermes.WebApi.Web.Models;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;
using Newtonsoft.Json.Linq;

namespace Hermes.WebApi.Web.Controllers
{
    /// <summary>
    /// This is a controller class that handles the login part.
    /// </summary>
    /// <seealso cref="Hermes.WebApi.ApiControllerBase" />
    [RoutePrefix("api/Account")]
    public class AccountController : ApiControllerBase
    {
        /// <summary>
        /// Gets this instance.
        /// </summary>
        /// <returns></returns>
        public HttpResponseMessage Get()
        {
            return Request.CreateResponse(true);
        }

        /// <summary>
        /// Externals the specified provider.
        /// </summary>
        /// <param name="provider">The provider.</param>
        /// <param name="error">The error.</param>
        /// <returns></returns>
        [HttpGet]
        [OverrideAuthentication]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalCookie)]
        [Route("ExternalLogin", Name = "ExternalLogin")]
        public IHttpActionResult ExternalLogin(string provider, string error = null)
        {
            if (error != null)
            {
                return BadRequest(Uri.EscapeDataString(error));
            }

            if (!User.Identity.IsAuthenticated)
            {
                return new ExternalAuthenticationChallengeResult(provider, this);
            }

            string redirectUri;
            redirectUri = CommonValidations.TryParseRedirectUri(Request);

            if (string.IsNullOrEmpty(redirectUri)) return BadRequest("Invalid redirect URI(redirect_uri).");

            try
            {
                ExternalData externalLoginData = new ExternalData(User.Identity as ClaimsIdentity);
                if (externalLoginData == null)
                {
                    return InternalServerError();
                }

                if (externalLoginData.LoginProvider != provider)
                {
                    ExternalProvider.SignOut(Request, DefaultAuthenticationTypes.ExternalCookie);
                    return new ExternalAuthenticationChallengeResult(provider, this);
                }

                externalLoginData.LocalBearerToken = GenerateLocalAccessTokenResponse(User.Identity as ClaimsIdentity);

                redirectUri = ExternalProvider.GetCompleteRedirectUri(redirectUri, externalLoginData);
                return Redirect(redirectUri);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        /// <summary>
        /// Posts the specified login object to authentication of the API.
        /// </summary>
        /// <param name="provider">The provider.</param>
        /// <param name="externalAccessToken">The external access token.</param>
        /// <returns>
        ///   <c>HttpStatusCode.OK</c> if [login success]; otherwise, <c>HttpStatusCode.Unauthorized</c>.
        /// </returns>
        [AllowAnonymous]
        [HttpGet]
        [Route("ObtainLocalAccessToken")]
        public async Task<IHttpActionResult> ObtainLocalAccessToken(string provider, string externalAccessToken)
        {

            if (string.IsNullOrWhiteSpace(provider) || string.IsNullOrWhiteSpace(externalAccessToken))
            {
                return BadRequest("Provider or external access token is not sent");
            }

            var verifiedAccessToken = await VerifyExternalAccessToken(provider, externalAccessToken);
            if (verifiedAccessToken == null)
            {
                return BadRequest("Invalid Provider or External Access Token");
            }

            UserIdentity userIdentity = AuthenticationCommands.FindLoginProvider(provider, verifiedAccessToken.user_id);

            bool hasRegistered = userIdentity != null;

            if (!hasRegistered)
            {
                return BadRequest("External user is not registered");
            }

            //generate access token response
            var accessTokenResponse = GenerateLocalAccessTokenResponse(userIdentity);

            return Ok(accessTokenResponse);

        }

        /// <summary>
        /// Posts the specified login.
        /// </summary>
        /// <param name="login">The login.</param>
        /// <returns></returns>
        public HttpResponseMessage Post(Login login)
        {
            string loginMessage = string.Empty;
            try
            {
                IPrincipal principal = null;
                principal = AuthenticationCommands.AuthenticateUsernamePassword(login.Username, login.Password);

                if (principal != null)
                {
                    loginMessage = "Login was successful!";
                    var response = Request.CreateResponse(HttpStatusCode.OK, true);

                    var properties = new AuthenticationProperties()
                    {
                        IssuedUtc = DateTime.UtcNow,
                        ExpiresUtc = DateTime.UtcNow.AddDays(1),
                    };

                    var ticket = new AuthenticationTicket(principal.Identity as ClaimsIdentity, properties);
                    var accessToken = Startup.OAuthBearerOptions.AccessTokenFormat.Protect(ticket);
                    response.SetAuthentication(accessToken, login.RememberMe);

                    return response;
                }
            }
            catch (Exception ex)
            {
                loginMessage = ex.ToString();
            }

            return Request.CreateResponse(HttpStatusCode.Unauthorized, loginMessage);
        }

        [AllowAnonymous]
        [Route("Register")]
        public IHttpActionResult Register(UserModel userModel)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = AuthenticationCommands.AddUser(userModel.UserName, userModel.Password);

            if (result < 1)
            {
                return BadRequest("Unable to create user.");
            }

            return Ok();
        }

        // POST api/Account/RegisterExternal
        [AllowAnonymous]
        [Route("RegisterExternal")]
        public async Task<IHttpActionResult> RegisterExternal(RegisterExternalBindingModel model)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var verifiedAccessToken = await VerifyExternalAccessToken(model.Provider, model.ExternalAccessToken);
            if (verifiedAccessToken == null)
            {
                return BadRequest("Invalid Provider or External Access Token");
            }

            UserIdentity userIdentity = AuthenticationCommands.FindLoginProvider(model.Provider, verifiedAccessToken.user_id);

            bool hasRegistered = userIdentity != null;

            if (hasRegistered)
            {
                return BadRequest("External user is already registered");
            }

            var userId = AuthenticationCommands.AddUser(model.UserName, string.Empty);

            if (userId < 1)
            {
                return BadRequest("Unable to create user.");
            }

            var authProvider = new AuthProvider
            {
                LoginProvider = model.Provider,
                ProviderKey = verifiedAccessToken.user_id,
                UserId = userId
            };

            var isInserted = AuthenticationCommands.AddNewUserLoginProvider(authProvider);

            //generate access token response
            var accessTokenResponse = GenerateLocalAccessTokenResponse(AuthenticationCommands.GetAuthenticatedUserByUserId(userId));

            return Ok(accessTokenResponse);
        }

        /// <summary>
        /// Generates the local access token response.
        /// </summary>
        /// <param name="identity">The identity.</param>
        /// <returns>
        /// the local access token string
        /// </returns>
        private string GenerateLocalAccessTokenResponse(ClaimsIdentity identity)
        {
            var tokenExpiration = TimeSpan.FromDays(1);

            var props = new AuthenticationProperties()
            {
                IssuedUtc = DateTime.UtcNow,
                ExpiresUtc = DateTime.UtcNow.Add(tokenExpiration),
            };

            var ticket = new AuthenticationTicket(identity, props);

            var accessToken = Startup.OAuthBearerOptions.AccessTokenFormat.Protect(ticket);

            return accessToken;
        }

        /// <summary>
        /// Validates the client and redirect URI.
        /// </summary>
        /// <param name="request">The request.</param>
        /// <param name="redirectUriOutput">The redirect URI output.</param>
        /// <returns></returns>
        private string ValidateClientAndRedirectUri(HttpRequestMessage request, ref string redirectUriOutput)
        {

            Uri redirectUri;

            var redirectUriString = GetQueryString(Request, "redirect_uri");

            if (string.IsNullOrWhiteSpace(redirectUriString))
            {
                return "redirect_uri is required";
            }

            bool validUri = Uri.TryCreate(redirectUriString, UriKind.Absolute, out redirectUri);

            if (!validUri)
            {
                return "redirect_uri is invalid";
            }

            var clientId = GetQueryString(Request, "client_id");

            if (string.IsNullOrWhiteSpace(clientId))
            {
                return "client_Id is required";
            }

            var client = AuthenticationCommands.FindAuthClient(clientId);

            if (client == null)
            {
                return string.Format("Client_id '{0}' is not registered in the system.", clientId);
            }

            if (!string.Equals(client.AllowedOrigin, redirectUri.GetLeftPart(UriPartial.Authority), StringComparison.OrdinalIgnoreCase))
            {
                return string.Format("The given URL is not allowed by Client_id '{0}' configuration.", clientId);
            }

            redirectUriOutput = redirectUri.AbsoluteUri;

            return string.Empty;

        }

        /// <summary>
        /// Gets the query string.
        /// </summary>
        /// <param name="request">The request.</param>
        /// <param name="key">The key.</param>
        /// <returns>
        /// the query string value
        /// </returns>
        private string GetQueryString(HttpRequestMessage request, string key)
        {
            var queryStrings = request.GetQueryNameValuePairs();

            if (queryStrings == null) return null;

            var match = queryStrings.FirstOrDefault(keyValue => string.Compare(keyValue.Key, key, true) == 0);

            if (string.IsNullOrEmpty(match.Value)) return null;

            return match.Value;
        }

        /// <summary>
        /// Generates the local access token response.
        /// </summary>
        /// <param name="userIdentity">The user identity.</param>
        /// <returns></returns>
        private JObject GenerateLocalAccessTokenResponse(UserIdentity userIdentity)
        {
            TimeSpan tokenExpiration = TimeSpan.FromDays(1);

            ClaimsIdentity identity = new ClaimsIdentity(OAuthDefaults.AuthenticationType);
            identity.AddClaim(new Claim(ClaimTypes.Name, userIdentity.Username));
            identity.AddClaim(new Claim(ClaimTypes.Sid, userIdentity.SecurityId.ToString()));
            if (userIdentity.Roles != null)
            {
                foreach (var role in userIdentity.Roles)
                {
                    identity.AddClaim(new Claim(ClaimTypes.Role, role.Name));
                }
            }

            var props = new AuthenticationProperties()
            {
                IssuedUtc = DateTime.UtcNow,
                ExpiresUtc = DateTime.UtcNow.Add(tokenExpiration),
            };

            var ticket = new AuthenticationTicket(identity, props);

            var accessToken = Startup.OAuthBearerOptions.AccessTokenFormat.Protect(ticket);

            JObject tokenResponse = new JObject(
                new JProperty("userName", userIdentity.Username)
                , new JProperty("access_token", accessToken)
                , new JProperty("token_type", "bearer")
                , new JProperty("expires_in", tokenExpiration.TotalSeconds.ToString())
                , new JProperty(".issued", ticket.Properties.IssuedUtc.ToString())
                , new JProperty(".expires", ticket.Properties.ExpiresUtc.ToString())
            );

            return tokenResponse;
        }

        /// <summary>
        /// Verifies the external access token.
        /// </summary>
        /// <param name="provider">The provider.</param>
        /// <param name="accessToken">The access token.</param>
        /// <returns></returns>
        private async Task<ParsedExternalAccessToken> VerifyExternalAccessToken(string provider, string accessToken)
        {
            ParsedExternalAccessToken parsedToken = null;

            var verifyTokenEndPoint = "";

            if (provider == "Facebook")
            {
                //You can get it from here: https://developers.facebook.com/tools/accesstoken/
                //More about debug_tokn here: http://stackoverflow.com/questions/16641083/how-does-one-get-the-app-access-token-for-debug-token-inspection-on-facebook
                var appToken = "xxxxxx";
                verifyTokenEndPoint = string.Format("https://graph.facebook.com/debug_token?input_token={0}&access_token={1}", accessToken, appToken);
            }
            else if (provider == "Google")
            {
                verifyTokenEndPoint = string.Format("https://www.googleapis.com/oauth2/v1/tokeninfo?access_token={0}", accessToken);
            }
            else
            {
                return null;
            }

            var client = new HttpClient();
            var uri = new Uri(verifyTokenEndPoint);
            var response = await client.GetAsync(uri);

            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();

                dynamic jObj = (JObject)Newtonsoft.Json.JsonConvert.DeserializeObject(content);

                parsedToken = new ParsedExternalAccessToken();

                if (provider == "Facebook")
                {
                    parsedToken.user_id = jObj["data"]["user_id"];
                    parsedToken.app_id = jObj["data"]["app_id"];

                    if (!string.Equals(Startup.FacebookAuthOptions.AppId, parsedToken.app_id, StringComparison.OrdinalIgnoreCase))
                    {
                        return null;
                    }
                }
                else if (provider == "Google")
                {
                    parsedToken.user_id = jObj["user_id"];
                    parsedToken.app_id = jObj["audience"];

                    if (!string.Equals(Startup.GoogleAuthOptions.ClientId, parsedToken.app_id, StringComparison.OrdinalIgnoreCase))
                    {
                        return null;
                    }

                }

            }

            return parsedToken;
        }
    }
}