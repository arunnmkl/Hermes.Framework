﻿// ***********************************************************************
// Assembly         : Hermes.WebApi.Extensions
// Author           : avinash.dubey
// Created          : 01-19-2016
//
// Last Modified By : avinash.dubey
// Last Modified On : 01-22-2016
// ***********************************************************************
// <copyright file="AuthenticationCommand.cs" company="">
//     Copyright ©  2015
// </copyright>
// <summary></summary>
// ***********************************************************************
using Hermes.Authentication;
using Hermes.WebApi.Core;
using Hermes.WebApi.Core.Common;
using Hermes.WebApi.Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using GTZSecurity = Hermes.WebApi.Core.Security;

namespace Hermes.WebApi.Extensions.Authentication
{
    /// <summary>
    /// Class AuthenticationCommand, which contains all the authentication type classes
    /// </summary>
    public class AuthenticationCommand : SkipAuthorizationBase, IAuthenticationCommand
    {
        /// <summary>
        /// Gets or sets the authentication commands.
        /// </summary>
        /// <value>The authentication commands.</value>
        public HashSet<IAuthentication> AuthenticationCommands { get; set; }

        /// <summary>
        /// Initializes a new instance of the <see cref="AuthenticationCommand" /> class.
        /// </summary>
        public AuthenticationCommand()
        {
            AuthenticationCommands = new HashSet<IAuthentication>();

            // Add all the authentication logic in here
            if (GTZSecurity.Configuration.Current.CookieAuthenticationEnabled)
            {
                AuthenticationCommands.Add(new CookieAuthenticationController());
            }

            if (GTZSecurity.Configuration.Current.BasicAuthenticationEnabled)
            {
                AuthenticationCommands.Add(new BasicAuthenticateController());
            }
        }

        /// <summary>
        /// Adds the new command.
        /// </summary>
        /// <param name="authentication">The authentication.</param>
        public void AddNewCommand(IAuthentication authentication)
        {
            AuthenticationCommands.Add(authentication);
        }

        /// <summary>
        /// Skips the authorization, for OAuth validation.
        /// </summary>
        /// <param name="actionContext">The action context.</param>
        /// <returns></returns>
        public override bool SkipAuthorization(HttpActionContext actionContext)
        {
            var request = actionContext.ControllerContext.Request;
            var authenticationHeader = request.Headers.Authorization;

            if (authenticationHeader != null
                && authenticationHeader.Scheme == "Bearer"
                && !String.IsNullOrEmpty(authenticationHeader.Parameter))
            {
                return true;
            }

            return SkipAuthorization(actionContext);
        }

        /// <summary>
        /// Skips the authorization base class method.
        /// </summary>
        /// <param name="actionContext">The action context.</param>
        /// <returns></returns>
        public bool SkipAuthorizationBaseClassMethod(HttpActionContext actionContext)
        {
            return base.SkipAuthorization(actionContext);
        }

        /// <summary>
        /// Validates the CSRF attack.
        /// </summary>
        /// <param name="context">The context.</param>
        /// <returns><c>true</c> if valid token, <c>false</c> otherwise.</returns>
        public bool ValidateCSRFAttack(HttpAuthenticationContext context)
        {
            bool isCsrf = true;
            ICSRFValidation validator = DependencyResolverContainer.Resolve<ICSRFValidation>();
            if (validator != null)
            {
                var request = context.Request;
                string csrfCookie = request.GetCookie(GTZSecurity.Configuration.Current.CSRFCookieName);
                string csrfHeaderValue = request.GetHeader(GTZSecurity.Configuration.Current.CSRFHeaderName);

                isCsrf = string.IsNullOrEmpty(csrfCookie) || string.IsNullOrEmpty(csrfHeaderValue) ? true : validator.Validate(csrfCookie, csrfHeaderValue);
            }

            return isCsrf;
        }
    }
}