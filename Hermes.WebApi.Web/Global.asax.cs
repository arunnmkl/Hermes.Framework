using System;
using System.Web;
using System.Web.Http;

namespace Hermes.WebApi.Web
{
    /// <summary>
    /// Global class.
    /// </summary>
    /// <seealso cref="System.Web.HttpApplication" />
    public class Global : HttpApplication
    {
        /// <summary>
        /// Handles the Start event of the Application control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Application_Start(object sender, EventArgs e)
        {
            WebApiConfig.Register(GlobalConfiguration.Configuration);
        } 
    }
}