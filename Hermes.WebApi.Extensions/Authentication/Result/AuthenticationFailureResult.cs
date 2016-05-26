using System;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;
using Hermes.WebApi.Extensions.Common;

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
        private ResponseError responseMessage;

        /// <summary>
        /// Initializes a new instance of the <see cref="AuthenticationFailureResult" /> class.
        /// </summary>
        /// <param name="reasonPhrase">The reason phrase.</param>
        /// <param name="request">The request.</param>
        /// <param name="responseMessage">The response message.</param>
        /// <param name="statusCode">The status code.</param>
        public AuthenticationFailureResult(string reasonPhrase, HttpRequestMessage request, ResponseError responseMessage, HttpStatusCode statusCode)
        {
            ReasonPhrase = reasonPhrase;
            Request = request;
            StatusCode = statusCode;
            this.responseMessage = responseMessage ?? AuthorizeResponseMessage.Default;

           //if( Enum.IsDefined(typeof(HttpStatusCode), this.responseMessage.Error.Code) && (HttpStatusCode)this.responseMessage.Error.Code != StatusCode)
           // {
           //     StatusCode = (HttpStatusCode)this.responseMessage.Error.Code;
           // }
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="AuthenticationFailureResult" /> class.
        /// </summary>
        /// <param name="request">The request.</param>
        /// <param name="responseMessage">The response message.</param>
        public AuthenticationFailureResult(HttpRequestMessage request, ResponseError responseMessage) : this(HttpStatusCode.Unauthorized.ToString(), request, responseMessage, HttpStatusCode.Unauthorized)
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="AuthenticationFailureResult" /> class.
        /// </summary>
        /// <param name="request">The request.</param>
        /// <param name="responseMessage">The response message.</param>
        /// <param name="statusCode">The status code.</param>
        public AuthenticationFailureResult(HttpRequestMessage request, ResponseError responseMessage, HttpStatusCode statusCode) : this(statusCode.ToString(), request, responseMessage, statusCode)
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
        /// Gets or sets the status code.
        /// </summary>
        /// <value>
        /// The status code.
        /// </value>
        public HttpStatusCode StatusCode { get; private set; }

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
            HttpResponseMessage response = new HttpResponseMessage(StatusCode);
            MediaTypeFormatter jsonFormatter = new JsonMediaTypeFormatter();
            response.Content = new ObjectContent<ResponseError>(responseMessage, jsonFormatter);
            response.RequestMessage = Request;
            response.ReasonPhrase = ReasonPhrase;
            return response;
        }
    }
}
