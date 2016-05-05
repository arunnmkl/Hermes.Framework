using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using Hermes.WebApi.Extensions.Authentication;

namespace Hermes.WebApi.Web.Controllers
{
    [RoutePrefix("api/RefreshTokens")]
    public class RefreshTokenController : ApiController
    {
        [Authorize(Users = "Admin")]
        [Route("")]
        public IHttpActionResult Get()
        {
            return Ok(AuthenticationCommands.GetAllRefreshTokens());
        }

        //[Authorize(Users = "Admin")]
        [AllowAnonymous]
        [Route("")]
        public IHttpActionResult Delete(string tokenId)
        {
            var result = AuthenticationCommands.RemoveRefreshToken(tokenId);
            if (result)
            {
                return Ok();
            }
            return BadRequest("Token Id does not exist");

        } 
    }
}
