using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Hermes.WebApi.Web.Controllers
{
	public class HomeController : ApiController
	{
		public HttpResponseMessage Get()
		{
			return Request.CreateResponse(true);
		}
	}
}
