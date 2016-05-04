using Hermes.WebApi.Extensions.Owin.Externals;
using Microsoft.AspNet.Identity;
using System.Net.Http;
using System.Web.Http;

namespace Hermes.WebApi.Web.Controllers
{
	[AllowAnonymous]
	public class UserController : ApiControllerBase
	{
		public HttpResponseMessage Get(string external_access_token = "", string provider = "", string registered_user = "", 
			string external_user_name = "", string local_Bare_token = "")
		{
			var result = string.Format(@"external_access_token={0}
										&provider={1}
										&registered_user={2}
										&external_user_name={3},
										&Logged_User={4},
										&Is_Authenticated={5},
										&local_bearer_token={6}",
											external_access_token,
											provider,
											registered_user,
											external_user_name,
											User.Identity.Name,
											User.Identity.IsAuthenticated,
											local_Bare_token);

			return Request.CreateResponse(result);
		}
	}
}