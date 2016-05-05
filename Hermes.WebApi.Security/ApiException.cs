using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Hermes.WebApi.Security
{
    /// <summary>
    /// Api exception
    /// </summary>
    /// <seealso cref="System.Exception" />
    public class ApiException : Exception
    {
        /// <summary>
        /// The status code
        /// </summary>
        private readonly HttpStatusCode statusCode;

        /// <summary>
        /// Initializes a new instance of the <see cref="ApiException"/> class.
        /// </summary>
        /// <param name="statusCode">The status code.</param>
        /// <param name="message">The message.</param>
        /// <param name="ex">The ex.</param>
        public ApiException(HttpStatusCode statusCode, string message, Exception ex)
            : base(message, ex)
        {
            this.statusCode = statusCode;
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="ApiException"/> class.
        /// </summary>
        /// <param name="statusCode">The status code.</param>
        /// <param name="message">The message.</param>
        public ApiException(HttpStatusCode statusCode, string message)
            : base(message)
        {
            this.statusCode = statusCode;
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="ApiException"/> class.
        /// </summary>
        /// <param name="statusCode">The status code.</param>
        public ApiException(HttpStatusCode statusCode)
        {
            this.statusCode = statusCode;
        }

        /// <summary>
        /// Gets the status code.
        /// </summary>
        /// <value>
        /// The status code.
        /// </value>
        public HttpStatusCode StatusCode
        {
            get { return this.statusCode; }
        }
    }

    /// <summary>
    /// Bad request exception
    /// </summary>
    /// <seealso cref="Hermes.WebApi.Security.ApiException" />
    public class BadRequestException : ApiException
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="BadRequestException"/> class.
        /// </summary>
        public BadRequestException() : base(HttpStatusCode.BadRequest)
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="BadRequestException"/> class.
        /// </summary>
        /// <param name="message">The message that describes the error.</param>
        public BadRequestException(string message) : base(HttpStatusCode.BadRequest, message)
        {
        }
    }
}
