using Hermes.WebApi.Core;
using Hermes.WebApi.Web.Models;
using System;
using System.Net;
using System.Net.Http;
using System.Security.Principal;
using System.Web;
using System.Web.Http;

namespace Hermes.WebApi.Web.Controllers
{
	[AllowAnonymous]
	public class LoginController : ApiControllerBase
	{
		[AllowAnonymous]
		public HttpResponseMessage Post(Login login)
		{
			HttpResponseMessage response;
			try
			{
				IPrincipal principal = null;

				response = new HttpResponseMessage(HttpStatusCode.OK);
				response.SetAuthentication(HttpUtility.UrlEncode("SecureTicketString"));
			}
			catch (Exception)
			{
				response = new HttpResponseMessage(HttpStatusCode.Unauthorized);
			}

			response.RequestMessage = Request;
			return response;
		}
	}
}