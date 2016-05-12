using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;
using Newtonsoft.Json.Linq;

namespace Hermes.WebApi.Extensions.Authentication.Result
{
    /// <summary>
    /// Authentication failure result
    /// </summary>
    /// <seealso cref="System.Web.Http.IHttpActionResult" />
    public class AuthenticationFailureResult : IHttpActionResult
    {
        /// <summary>
        /// The response message
        /// </summary>
        private object responseMessage;

        /// <summary>
        /// Initializes a new instance of the <see cref="AuthenticationFailureResult" /> class.
        /// </summary>
        /// <param name="reasonPhrase">The reason phrase.</param>
        /// <param name="request">The request.</param>
        /// <param name="responseMessage">The response message.</param>
        public AuthenticationFailureResult(string reasonPhrase, HttpRequestMessage request, object responseMessage)
        {
            ReasonPhrase = reasonPhrase;
            Request = request;
            this.responseMessage = responseMessage ?? new { Error = new { Code = 401, Message = "Authorization has been denied for this request." } };
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="AuthenticationFailureResult" /> class.
        /// </summary>
        /// <param name="request">The request.</param>
        /// <param name="responseMessage">The response message.</param>
        public AuthenticationFailureResult(HttpRequestMessage request, object responseMessage) : this("Unauthorized", request, responseMessage)
        {
        }

        /// <summary>
        /// Gets the reason phrase.
        /// </summary>
        /// <value>
        /// The reason phrase.
        /// </value>
        public string ReasonPhrase { get; private set; }

        /// <summary>
        /// Gets the request.
        /// </summary>
        /// <value>
        /// The request.
        /// </value>
        public HttpRequestMessage Request { get; private set; }

        /// <summary>
        /// Creates an <see cref="T:System.Net.Http.HttpResponseMessage" /> asynchronously.
        /// </summary>
        /// <param name="cancellationToken">The token to monitor for cancellation requests.</param>
        /// <returns>
        /// A task that, when completed, contains the <see cref="T:System.Net.Http.HttpResponseMessage" />.
        /// </returns>
        public Task<HttpResponseMessage> ExecuteAsync(CancellationToken cancellationToken)
        {
            return Task.FromResult(Execute());
        }

        /// <summary>
        /// Executes this instance.
        /// </summary>
        /// <returns></returns>
        private HttpResponseMessage Execute()
        {
            HttpResponseMessage response = new HttpResponseMessage(HttpStatusCode.Unauthorized);
            MediaTypeFormatter jsonFormatter = new JsonMediaTypeFormatter();
            response.Content = new ObjectContent<object>(this.responseMessage, jsonFormatter);
            response.RequestMessage = Request;
            response.ReasonPhrase = ReasonPhrase;
            return response;
        }
    }
}
