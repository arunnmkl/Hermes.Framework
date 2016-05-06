using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Hermes.WebApi.Extensions.Authentication;

namespace Hermes.WebApi.Web.Controllers
{
    [RoutePrefix("api/ResourcePermission")]
    public class UserPermissionController : ApiController
    {
        /// <summary>
        /// Gets this instance.
        /// </summary>
        /// <returns></returns>
        [Route("User")]
        public HttpResponseMessage GetUserPermissions()
        {
            var permissions = AuthenticationCommands.GetUserPermissions();
            return Request.CreateResponse(permissions);
        }
        /// <summary>
        /// Gets this instance.
        /// </summary>
        /// <returns></returns>
        [Route("UserGroup")]
        public HttpResponseMessage GetUserResourcePermission()
        {
            var permissions = AuthenticationCommands.GetUserResourcePermission();
            return Request.CreateResponse(permissions);
        }
    }
}
