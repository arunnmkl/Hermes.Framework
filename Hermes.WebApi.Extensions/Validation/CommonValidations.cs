using Hermes.WebApi.Core;
using Hermes.WebApi.Core.Exceptions;
using Hermes.WebApi.Extensions.Owin.Externals;
using System;
using System.Net.Http;
using System.Threading.Tasks;

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
		public static async Task<bool> VerifyExternalAccessToken(string provider, string accessToken)
		{
			string userId = string.Empty;
			string appId = string.Empty;

			IExternalValidation validator = ExternalValidationFactory.GetExternalValidation(provider);

			var something = await Task.Run(() =>
			{
				try
				{
					return validator.VerifyExternalAccessToken(accessToken, out userId, out appId);
				}
				catch (Exception)
				{
					return false;
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

			if (string.IsNullOrWhiteSpace(redirectUriString)) return string.Empty;

			bool validUri = Uri.TryCreate(redirectUriString, UriKind.Absolute, out redirectUri);

			if (!validUri) return string.Empty;

			return redirectUriString;
		}
	}
}