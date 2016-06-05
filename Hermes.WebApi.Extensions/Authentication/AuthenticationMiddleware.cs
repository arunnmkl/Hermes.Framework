using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Hermes.WebApi.Core.Common;
using Hermes.WebApi.Extensions.Common;
using Hermes.WebApi.Security;
using Microsoft.Owin;
using Newtonsoft.Json;

namespace Hermes.WebApi.Extensions.Authentication
{
    /// <summary>
    /// It provides strongly typed access to the OWIN environment via IOwinContext.
    /// </summary>
    /// <seealso cref="OwinMiddleware" />
    public class AuthenticationMiddleware : OwinMiddleware
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="AuthenticationMiddleware"/> class.
        /// </summary>
        /// <param name="next">The next.</param>
        public AuthenticationMiddleware(OwinMiddleware next) : base(next) { }

        /// <summary>
        /// Invokes the specified context.
        /// </summary>
        /// <param name="context">The context.</param>
        /// <returns></returns>
        public override async Task Invoke(IOwinContext context)
        {
            try
            {
                await Next.Invoke(context);

                if (context.Response.StatusCode == 400 && context.Response.Headers.ContainsKey(Constants.HermesChallengeFlag))
                {
                    var headerValues = context.Response.Headers.GetValues(Constants.HermesChallengeFlag);
                    context.Response.StatusCode = Convert.ToInt16(headerValues.FirstOrDefault());
                    context.Response.Headers.Remove(Constants.HermesChallengeFlag);
                }
            }
            catch (Exception ex)
            {
                if (ex is ApiException)
                {
                    var exception = ex as ApiException;
                    context.Response.StatusCode = (int)exception.StatusCode;
                    context.Response.ReasonPhrase = exception.StatusCode.ToString();
                    context.Response.ContentType = "application/json";
                    context.Response.Write(JsonConvert.SerializeObject(new
                    {
                        error = "invalid_request",
                        error_description = exception.Message
                    }));
                }
                else
                {
                    throw;
                }
            }

        }
    }
}
