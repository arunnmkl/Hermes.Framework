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
using Hermes.WebApi.Core;
using Hermes.WebApi.Extensions;
using Hermes.WebApi.Extensions.Authentication;
using Hermes.WebApi.Extensions.Owin.Externals;
using Hermes.WebApi.Extensions.Validation;
using Hermes.WebApi.Web.Models;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;
using System;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Security.Principal;
using System.Web.Http;

namespace Hermes.WebApi.Web.Controllers
{
    /// <summary>
    /// This is a controller class that handles the login part.
    /// </summary>
    [AllowAnonymous]
    public class LoginController : ApiControllerBase
    {
        public HttpResponseMessage Get()
        {
            return Request.CreateResponse(true);
        }

        [HttpGet]
        [OverrideAuthentication]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalCookie)]
        public IHttpActionResult External(string provider, string error = null)
        {
            if (error != null) return BadRequest(Uri.EscapeDataString(error));

            if (!User.Identity.IsAuthenticated) return new ExternalAuthenticationChallengeResult(provider, this);

            string redirectUri;
            redirectUri = CommonValidations.TryParseRedirectUri(Request);

            if (string.IsNullOrEmpty(redirectUri)) return BadRequest("Invalid redirect URI(redirect_uri).");

            try
            {
                ExternalData data = new ExternalData(User.Identity as ClaimsIdentity);
                if (data.LoginProvider != provider)
                {
                    ExternalProvider.SignOut(Request, DefaultAuthenticationTypes.ExternalCookie);
                    return new ExternalAuthenticationChallengeResult(provider, this);
                }

                data.LocalBearerToken = GenerateLocalAccessTokenResponse(User.Identity as ClaimsIdentity);

                redirectUri = ExternalProvider.GetCompleteRedirectUri(redirectUri, data);
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
        /// <param name="login">The login object with the username and password.</param>
        /// <returns><c>HttpStatusCode.OK</c> if [login success]; otherwise, <c>HttpStatusCode.Unauthorized</c>.</returns>
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

        /// <summary>
        /// Generates the local access token response.
        /// </summary>
        /// <param name="identity">The identity.</param>
        /// <returns></returns>
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
    }
}