using System;
using System.Security.Claims;
using System.Threading.Tasks;
using Hermes.WebApi.Security;
using Microsoft.Owin.Security.OAuth;

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
            using (UserManager um = new UserManager())
            {
                var userIdentity = um.AuthenticateUsernamePassword(userName, password);

                if (userIdentity != null)
                {
                    var identity = new ClaimsIdentity("ClaimsIdentityAuth");
                    identity.AddClaim(new Claim(ClaimTypes.Name, userIdentity.Username));
                    identity.AddClaim(new Claim(ClaimTypes.Sid, userIdentity.SecurityId.ToString()));
                    if (userIdentity.Roles != null)
                    {
                        foreach (var role in userIdentity.Roles)
                        {
                            identity.AddClaim(new Claim(ClaimTypes.Role, role.Name));
                        }
                    }

                    return new ClaimsPrincipal(identity);
                }
            }

            return null;
        }

		#endregion Public Methods

		#region Internal Methods

		internal static Task<ClaimsIdentity> AuthenticateUsernamePassword(OAuthGrantResourceOwnerCredentialsContext context)
		{
            using (UserManager um = new UserManager())
            {
                var userIdentity = um.AuthenticateUsernamePassword(context.UserName, context.Password);

                if (userIdentity != null)
                {
                    var identity = new ClaimsIdentity(context.Options.AuthenticationType);
                    identity.AddClaim(new Claim(ClaimTypes.Name, userIdentity.Username));
                    identity.AddClaim(new Claim(ClaimTypes.Sid, userIdentity.SecurityId.ToString()));
                    if (userIdentity.Roles != null)
                    {
                        foreach (var role in userIdentity.Roles)
                        {
                            identity.AddClaim(new Claim(ClaimTypes.Role, role.Name));
                        }
                    }

                    return Task.FromResult(identity);
                }
            }

            context.SetError("invalid_grant", "The user name or password is incorrect.");
            return Task.FromResult<ClaimsIdentity>(null);
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