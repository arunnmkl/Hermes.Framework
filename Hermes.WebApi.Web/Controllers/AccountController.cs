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
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using Hermes.WebApi.Core;
using Hermes.WebApi.Extensions;
using Hermes.WebApi.Extensions.Authentication;
using Hermes.WebApi.Extensions.Common;
using Hermes.WebApi.Extensions.Owin.Externals;
using Hermes.WebApi.Extensions.Validation;
using Hermes.WebApi.Security.Models;
using Hermes.WebApi.Web.Models;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;
using Newtonsoft.Json.Linq;
using HermesSecurity = Hermes.WebApi.Core.Security;


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
            bool isValidUri = CommonValidations.TryParseRedirectUri(Request, out redirectUri);

            if (isValidUri == false)
            {
                if (string.IsNullOrEmpty(redirectUri))
                {
                    return BadRequest("Invalid redirect URI(redirect_uri).");
                }

                return BadRequest(redirectUri);
            }

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

            var verifiedAccessToken = await CommonValidations.VerifyExternalAccessToken(provider, externalAccessToken);
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

            string authToken = AuthenticationCommands.GenerateAuthToken(userIdentity.Username, !HermesSecurity.Configuration.Current.MultipleInstanceEnabled);

            if (string.IsNullOrEmpty(authToken))
            {
                return BadRequest(string.Format("The user {0}, is already logged in with other device/machine.", userIdentity.Username));
            }
            else
            {
                userIdentity.UserAuthTokenId = authToken;
            }

            //generate access token response
            var accessTokenResponse = Helper.GenerateLocalAccessTokenResponse(userIdentity);

            return Ok(accessTokenResponse);

        }

        /// <summary>
        /// Posts the specified login.
        /// </summary>
        /// <param name="login">The login.</param>
        /// <returns></returns>  
        [AllowAnonymous]
        public HttpResponseMessage Post(Login login)
        {
            string loginMessage = string.Empty;
            try
            {
                AuthClient client;
                bool isValidClient = ValidateClient(login.ClientId, ref loginMessage, out client);

                if (isValidClient)
                {
                    var userIdentity = AuthenticationCommands.AuthenticateUsernamePassword(login.Username, login.Password);

                    if (userIdentity != null)
                    {
                        string authToken = AuthenticationCommands.GenerateAuthToken(userIdentity.Username, !HermesSecurity.Configuration.Current.MultipleInstanceEnabled);

                        if (string.IsNullOrEmpty(authToken))
                        {
                            loginMessage = (string.Format("The user {0}, is already logged in with other device/machine.", userIdentity.Username));
                        }
                        else
                        {
                            userIdentity.UserAuthTokenId = authToken;
                        }

                        var identity = ClaimsIdentityProvider.GetHermesClaimsIdentity(userIdentity, DefaultAuthenticationTypes.ApplicationCookie);

                        if (identity != null)
                        {
                            loginMessage = "Login was successful!";
                            var response = Request.CreateResponse(HttpStatusCode.OK, true);

                            var properties = new AuthenticationProperties()
                            {
                                IssuedUtc = DateTime.UtcNow,
                                ExpiresUtc = client.AccessTokenExpireTimeSpan.HasValue ? DateTime.UtcNow.AddMinutes(client.AccessTokenExpireTimeSpan.Value) : DateTime.UtcNow.AddDays(1),
                            };

                            var ticket = new AuthenticationTicket(identity, properties);
                            var accessToken = Helper.ProtectAccessToken(ticket);
                            var userAuthToken = new UserAuthToken(accessToken)
                            {
                                AuthClientId = Convert.ToString(string.Empty),
                                ExpiresUtc = ticket.Properties.ExpiresUtc.Value,
                                IssuedUtc = ticket.Properties.IssuedUtc.Value,
                                UserId = Convert.ToInt64(identity.FindFirst(HermesSecurity.HermesIdentity.UserIdClaimType).Value),
                                UserAuthTokenId = Convert.ToString(identity.FindFirst(HermesSecurity.HermesIdentity.AuthTokenClaimType).Value),
                                IsLoggedIn = true,
                                IPAddress = HttpContext.Current.Request.UserHostAddress,
                                UserAgent = HttpContext.Current.Request.UserAgent
                            };

                            bool isSaved = AuthenticationCommands.SaveUserAuthToken(userAuthToken);
                            response.SetAuthentication(accessToken, login.RememberMe);

                            return response;
                        }

                    }

                    loginMessage = "Invalid username or password";
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
        [ApiExceptionFilter]
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

            var verifiedAccessToken = await CommonValidations.VerifyExternalAccessToken(model.Provider, model.ExternalAccessToken);
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

            var userId = AuthenticationCommands.AddUser(model.UserName, model.Password);

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
            var accessTokenResponse = Helper.GenerateLocalAccessTokenResponse(AuthenticationCommands.GetAuthenticatedUserByUserId(userId));

            return Ok(accessTokenResponse);
        }

        /// <summary>
        /// Determines whether this instance is authorized.
        /// </summary>
        /// <returns>send whether the user is authorized or not</returns>
        [AllowAnonymous]
        [Route("IsAuthorized")]
        [HttpGet]
        public HttpResponseMessage IsAuthorized()
        {
            return Request.CreateResponse(User.Identity.IsAuthenticated);
        }

        /// <summary>
        /// Posts the specified login.
        /// </summary>
        /// <param name="login">The login.</param>
        /// <returns></returns>
        [HttpPost]
        [AllowAnonymous]
        [Route("Login")]
        public async Task<HttpResponseMessage> Login(BearerLogin model)
        {
            if (model == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Invalid user data");
            }

            HttpResponseMessage response = Request.CreateResponse();

            // Ugly hack: I use a server-side HTTP POST because I cannot directly invoke the service (it is deeply hidden in the OAuthAuthorizationServerHandler class)
            HttpRequest request = HttpContext.Current.Request;
            string tokenServiceUrl = request.Url.GetLeftPart(UriPartial.Authority) + request.ApplicationPath + "/Token";
            using (var client = new HttpClient())
            {
                var requestParams = new List<KeyValuePair<string, string>>
                {
                    new KeyValuePair<string, string>("grant_type", "password"),
                    new KeyValuePair<string, string>("username", model.Username),
                    new KeyValuePair<string, string>("password", model.Password)
                };

                if (string.IsNullOrEmpty(model.ClientId) == false)
                {
                    requestParams.Add(new KeyValuePair<string, string>("client_id", model.ClientId));
                }

                if (model.ForceLogin)
                {
                    requestParams.Add(new KeyValuePair<string, string>("forceLogin", model.ForceLogin.ToString()));
                }

                var requestParamsFormUrlEncoded = new FormUrlEncodedContent(requestParams);
                var tokenServiceResponse = await client.PostAsync(tokenServiceUrl, requestParamsFormUrlEncoded);
                var responseString = await tokenServiceResponse.Content.ReadAsStringAsync();

                response.StatusCode = tokenServiceResponse.StatusCode;
                response.Content = new StringContent(responseString, Encoding.UTF8, "application/json");
                return response;
            }
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

            var accessToken = Helper.ProtectAccessToken(ticket);

            return accessToken;
        }

        /// <summary>
        /// Validates the client.
        /// </summary>
        /// <param name="clientId">The client identifier.</param>
        /// <param name="loginMessage">The login message.</param>
        /// <param name="client">The client.</param>
        /// <returns>is valid client</returns>
        private static bool ValidateClient(string clientId, ref string loginMessage, out AuthClient client)
        {
            client = null;

            if (string.IsNullOrEmpty(clientId))
            {
                loginMessage = "Client id should be sent.";
                return false;
            }
            else
            {
                client = AuthenticationCommands.FindAuthClient(clientId);
            }

            if (client == null)
            {
                loginMessage = string.Format("Client '{0}' is not registered in the system.", clientId);
                return false;
            }
            else
            {
                if (!client.IsActive)
                {
                    loginMessage = string.Format("Client {0} is inactive.", client.AuthClientId);
                    return false;
                }
            }

            return true;
        }
    }
}