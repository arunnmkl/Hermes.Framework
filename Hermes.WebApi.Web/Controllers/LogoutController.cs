using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using Hermes.WebApi.Extensions.Authentication;
using Hermes.WebApi.Extensions.Owin.Externals;

namespace Hermes.WebApi.Web.Controllers
{
    /// <summary>
    /// API controller of the common login resource which is generic in nature.
    /// </summary>
    /// <seealso cref="System.Web.Http.ApiController" />
    [AllowAnonymous]
    [RoutePrefix("API")]
    public class LogoutController : ApiController
    {
        /// <summary>
        /// Logouts this instance.
        /// </summary>
        /// <returns>HTTP response message including the status code and data</returns>
        [HttpPost]
        [Route("Logout")]
        [AllowAnonymous]
        public IHttpActionResult Logout()
        {
            ExternalProvider.SignOut(Request, HttpContext.Current.User.Identity.AuthenticationType);
            AuthenticationCommands.SetTokenExpires();
            return this.Ok(new
            {
                message = "Logout successful."
            });
        }
    }
}
