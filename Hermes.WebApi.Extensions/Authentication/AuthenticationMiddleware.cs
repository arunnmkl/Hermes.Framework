using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Hermes.WebApi.Extensions.Common;
using Microsoft.Owin;

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
            await Next.Invoke(context);

            if (context.Response.StatusCode == 400 && context.Response.Headers.ContainsKey(Constants.HermesChallengeFlag))
            {
                var headerValues = context.Response.Headers.GetValues(Constants.HermesChallengeFlag);
                context.Response.StatusCode = Convert.ToInt16(headerValues.FirstOrDefault());
                context.Response.Headers.Remove(Constants.HermesChallengeFlag);
            }

        }
    }
}
