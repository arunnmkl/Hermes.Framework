using Microsoft.Owin.Security.Infrastructure;
using System;
using System.Threading.Tasks;

namespace AngularJSAuthentication.API.Providers
{
	/// <summary>
	/// Used in the refresh the token and all.
	/// </summary>
	/// <seealso cref="Microsoft.Owin.Security.Infrastructure.IAuthenticationTokenProvider" />
	public class RefreshTokenProvider : IAuthenticationTokenProvider
	{
		/// <summary>
		/// Creates the asynchronous.
		/// </summary>
		/// <param name="context">The context.</param>
		/// <returns></returns>
		public async Task CreateAsync(AuthenticationTokenCreateContext context)
		{
			// Get it from database or any other source.
			var refreshTokenId = Guid.NewGuid().ToString("n");
			context.SetToken(refreshTokenId);
		}

		/// <summary>
		/// Receives the asynchronous.
		/// </summary>
		/// <param name="context">The context.</param>
		/// <returns></returns>
		public async Task ReceiveAsync(AuthenticationTokenReceiveContext context)
		{
			var allowedOrigin = context.OwinContext.Get<string>("as:clientAllowedOrigin");
			context.OwinContext.Response.Headers.Add("Access-Control-Allow-Origin", new[] { allowedOrigin });

			// Validate the token here.
		}

		/// <summary>
		/// Creates the specified context.
		/// </summary>
		/// <param name="context">The context.</param>
		/// <exception cref="System.NotImplementedException"></exception>
		public void Create(AuthenticationTokenCreateContext context)
		{
			throw new NotImplementedException();
		}

		/// <summary>
		/// Receives the specified context.
		/// </summary>
		/// <param name="context">The context.</param>
		/// <exception cref="System.NotImplementedException"></exception>
		public void Receive(AuthenticationTokenReceiveContext context)
		{
			throw new NotImplementedException();
		}
	}
}