using System;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using Hermes.WebApi.Core;
using Hermes.WebApi.Core.Exceptions;
using Hermes.WebApi.Extensions.Authentication;
using Hermes.WebApi.Extensions.Owin.Externals;
using Hermes.WebApi.Security.Models;

namespace Hermes.WebApi.Extensions.Validation
{
    /// <summary>
    /// Validates the common things like the token and the URI and all.
    /// </summary>
    public static class CommonValidations
    {
        /// <summary>
        /// Verifies the external access token.
        /// </summary>
        /// <param name="provider">The provider.</param>
        /// <param name="accessToken">The access token.</param>
        /// <returns>true, if valid token false otherwise</returns>
        public static async Task<ParsedExternalAccessToken> VerifyExternalAccessToken(string provider, string accessToken)
        {
            string userId = string.Empty;
            string appId = string.Empty;

            IExternalValidation validator = ExternalValidationFactory.GetExternalValidation(provider);

            var something = await Task.Run(() =>
            {
                try
                {
                    if (validator.VerifyExternalAccessToken(accessToken, out userId, out appId) == true)
                    {
                        ParsedExternalAccessToken parsedToken = new ParsedExternalAccessToken();
                        parsedToken.app_id = appId;
                        parsedToken.user_id = userId;
                        return parsedToken;
                    }

                    return null;
                }
                catch (Exception)
                {
                    return null;
                }
            });

            return something;
        }

        /// <summary>
        /// Validates the redirect URI.
        /// </summary>
        /// <param name="request">The request.</param>
        /// <param name="queryStringName">Name of the query string.</param>
        /// <returns></returns>
        public static string TryParseRedirectUri(HttpRequestMessage request, string queryStringName = "redirect_uri")
        {
            Uri redirectUri;

            var redirectUriString = request.GetQueryString(queryStringName);

            if (string.IsNullOrWhiteSpace(redirectUriString))
            {
                return string.Empty;
            }

            bool validUri = Uri.TryCreate(redirectUriString, UriKind.Absolute, out redirectUri);

            if (!validUri)
            {
                return string.Empty;
            }

            var clientId = request.GetQueryString("client_id");

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

            redirectUriString = redirectUri.AbsoluteUri; 

            return redirectUriString;
        }

        /// <summary>
        /// Gets the query string.
        /// </summary>
        /// <param name="request">The request.</param>
        /// <param name="key">The key.</param>
        /// <returns>
        /// the query string value
        /// </returns>
        private static string GetQueryString(HttpRequestMessage request, string key)
        {
            var queryStrings = request.GetQueryNameValuePairs();

            if (queryStrings == null) return null;

            var match = queryStrings.FirstOrDefault(keyValue => string.Compare(keyValue.Key, key, true) == 0);

            if (string.IsNullOrEmpty(match.Value)) return null;

            return match.Value;
        }
    }
}