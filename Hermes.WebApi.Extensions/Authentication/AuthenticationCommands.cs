using Microsoft.Owin.Security.OAuth;
using System;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Hermes.WebApi.Extensions.Authentication
{
	/// <summary>
	/// The authentication commands which basically deals with the all the authentication  
	/// </summary>
	public static class AuthenticationCommands
	{
		#region Public Methods

		/// <summary>
		/// Authenticates the username password.
		/// </summary>
		/// <param name="userName">Name of the user.</param>
		/// <param name="password">The password.</param>
		/// <returns></returns>
		public static ClaimsPrincipal AuthenticateUsernamePassword(string userName, string password)
		{
			var identity = new ClaimsIdentity("ClaimsIdentityAuth");
			identity.AddClaim(new Claim(ClaimTypes.Name, userName));
			identity.AddClaim(new Claim(ClaimTypes.Role, "User"));

			return new ClaimsPrincipal(identity);
		}

		#endregion Public Methods

		#region Internal Methods

		internal static Task<ClaimsIdentity> AuthenticateUsernamePassword(OAuthGrantResourceOwnerCredentialsContext context)
		{
			var identity = new ClaimsIdentity(context.Options.AuthenticationType);
			identity.AddClaim(new Claim(ClaimTypes.Name, context.UserName));
			identity.AddClaim(new Claim(ClaimTypes.Role, "user"));
			identity.AddClaim(new Claim("sub", context.UserName));

			return Task.FromResult(identity);
		}

		internal static ClaimsIdentity AuthenticateTicket(string ticket)
		{
			var identity = new ClaimsIdentity("Type");
			identity.AddClaim(new Claim(ClaimTypes.Name, "UserName"));
			identity.AddClaim(new Claim(ClaimTypes.Role, "user"));

			return identity;
		}

		#endregion Internal Methods
	}
}