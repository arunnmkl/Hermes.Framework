using AngularJSAuthentication.API.Providers;
using GlobalTranz.WebApi.Extensions.Owin;
using Hermes.WebApi.Extensions.Owin.Externals;
using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Microsoft.Owin.Cors;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.Facebook;
using Microsoft.Owin.Security.Google;
using Microsoft.Owin.Security.OAuth;
using Owin;
using System;
using System.Web.Http;
using System.Configuration;

[assembly: OwinStartup(typeof(Hermes.WebApi.Extensions.Startup))]

namespace Hermes.WebApi.Extensions
{
    /// <summary>
    /// Startups of the for the
    /// </summary>
    public class Startup
    {
        /// <summary>
        /// Gets the o authentication bearer options.
        /// </summary>
        /// <value>
        /// The o authentication bearer options.
        /// </value>
        public static OAuthBearerAuthenticationOptions OAuthBearerOptions { get; private set; }

        public static OAuthAuthorizationServerOptions OAuthServerOptions { get; private set; }

        /// <summary>
        /// Gets the Google authentication options.
        /// </summary>
        /// <value>
        /// The Google authentication options.
        /// </value>
        public static GoogleOAuth2AuthenticationOptions GoogleAuthOptions { get; private set; }

        /// <summary>
        /// Gets the facebook authentication options.
        /// </summary>
        /// <value>
        /// The facebook authentication options.
        /// </value>
        public static FacebookAuthenticationOptions FacebookAuthOptions { get; private set; }

        /// <summary>
        /// Configurations the specified application.
        /// </summary>
        /// <param name="app">The application.</param>
        public void Configuration(IAppBuilder app)
        {
            HttpConfiguration config = new HttpConfiguration();

            ConfigureOAuth(app);

            ApiConfiguration.Register(config);
            app.UseCors(CorsOptions.AllowAll);
            app.UseWebApi(config);
        }

        /// <summary>
        /// Configures the o authentication.
        /// </summary>
        /// <param name="app">The application.</param>
        public void ConfigureOAuth(IAppBuilder app)
        {
            //use a cookie to temporarily store information about a user logging in with a third party login provider
            app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

            OAuthBearerOptions = new OAuthBearerAuthenticationOptions();
            OAuthServerOptions = new OAuthAuthorizationServerOptions()
            {
                AllowInsecureHttp = true,
                TokenEndpointPath = new PathString("/token"),
                AccessTokenExpireTimeSpan = TimeSpan.FromMinutes(30),
                Provider = new AuthorizationServerProvider(),
                RefreshTokenProvider = new RefreshTokenProvider()
            };

            app.UseOAuthAuthorizationServer(OAuthServerOptions);
            app.UseOAuthBearerAuthentication(OAuthBearerOptions);

            // Enable this for cookie support Authentication
            //app.SetDefaultSignInAsAuthenticationType(DefaultAuthenticationTypes.ExternalCookie);
            //app.UseCookieAuthentication(new CookieAuthenticationOptions
            //{
            //	AuthenticationType = DefaultAuthenticationTypes.ExternalCookie,
            //	Provider = new Hermes.WebApi.Extensions.Owin.OAuthCookieProvider()
            //});

            GoogleAuthOptions = new GoogleOAuth2AuthenticationOptions()
            {
                ClientId = ConfigurationManager.AppSettings["GoogleClientId"] ?? string.Empty,
                ClientSecret = ConfigurationManager.AppSettings["GoogleClientSecret"] ?? string.Empty,
                Provider = new GoogleAuthProvider()
            };
            app.UseGoogleAuthentication(GoogleAuthOptions);

            FacebookAuthOptions = new FacebookAuthenticationOptions()
            {
                AppId = ConfigurationManager.AppSettings["FBClientId"] ?? string.Empty,
                AppSecret = ConfigurationManager.AppSettings["FBClientId"] ?? string.Empty,
                Provider = new FacebookAuthProvider()
            };
            app.UseFacebookAuthentication(FacebookAuthOptions);
        }
    }
}