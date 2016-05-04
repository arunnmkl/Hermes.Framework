using System.Net.Http;

namespace Hermes.WebApi.Extensions.Owin.Externals
{
	/// <summary>
	/// This class is responsible for the all kind of the external communication, and data provider.
	/// </summary>
	public static class ExternalProvider
	{
		/// <summary>
		/// Signs the out.
		/// </summary>
		/// <param name="Request">The request.</param>
		/// <param name="authenticationType">Type of the authentication.</param>
		public static void SignOut(HttpRequestMessage Request, string authenticationType)
		{
			Request.GetOwinContext().Authentication.SignOut(authenticationType);
		}

		/// <summary>
		/// Determines whether [is user exists] [the specified login provider].
		/// </summary>
		/// <param name="loginProvider">The login provider.</param>
		/// <param name="providerKey">The provider key.</param>
		/// <returns>True if the user exits.</returns>
		public static bool IsUserExists(string loginProvider, string providerKey)
		{
			return false;
		}

		/// <summary>
		/// Gets the complete redirect URI.
		/// </summary>
		/// <param name="redirectUri">The redirect URI.</param>
		/// <param name="data">The data.</param>
		/// <returns>The data which is returned from the external login.</returns>
		public static string GetCompleteRedirectUri(string redirectUri, ExternalData data)
		{
			bool isUserExists = IsUserExists(data.LoginProvider, data.ProviderKey);

			return string.Format("{0}?external_access_token={1}&provider={2}&registered_user={3}&external_user_name={4}&local_Bare_token={5}",
											redirectUri,
											data.ExternalAccessToken,
											data.LoginProvider,
											isUserExists.ToString(),
											data.UserName,
											data.LocalBearerToken);
		}
	}
}