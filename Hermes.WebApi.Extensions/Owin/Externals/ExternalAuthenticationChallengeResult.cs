using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;

namespace Hermes.WebApi.Extensions.Owin.Externals
{
	/// <summary>
	/// External Authentication Challenge Result, which is responsible for the login with external providers
	/// </summary>
	public class ExternalAuthenticationChallengeResult : IHttpActionResult
	{
		/// <summary>
		/// Gets or sets the provider.
		/// </summary>
		/// <value>
		/// The provider.
		/// </value>
		public string ProviderName { get; set; }

		/// <summary>
		/// Gets or sets the request.
		/// </summary>
		/// <value>
		/// The request.
		/// </value>
		public HttpRequestMessage Request { get; set; }

		/// <summary>
		/// Initializes a new instance of the <see cref="ExternalAuthenticationChallengeResult"/> class.
		/// </summary>
		/// <param name="loginProvider">The login provider.</param>
		/// <param name="controller">The controller.</param>
		public ExternalAuthenticationChallengeResult(string loginProvider, ApiController controller)
		{
			ProviderName = loginProvider;
			Request = controller.Request;
		}

		/// <summary>
		/// Creates an <see cref="T:System.Net.Http.HttpResponseMessage" /> asynchronously.
		/// </summary>
		/// <param name="cancellationToken">The token to monitor for cancellation requests.</param>
		/// <returns>
		/// A task that, when completed, contains the <see cref="T:System.Net.Http.HttpResponseMessage" />.
		/// </returns>
		public Task<HttpResponseMessage> ExecuteAsync(CancellationToken cancellationToken)
		{
			Request.GetOwinContext().Authentication.Challenge(ProviderName);

			HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.Unauthorized);
			response.RequestMessage = Request;
			return Task.FromResult(response);
		}
	}
}