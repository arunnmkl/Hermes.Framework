﻿// ***********************************************************************
// Assembly         : Hermes.WebApi.Web
// Author           : avinash.dubey
// Created          : 01-19-2016
//
// Last Modified By : avinash.dubey
// Last Modified On : 01-19-2016
// ***********************************************************************
// <copyright file="WebApiConfig.cs" company="">
//     Copyright ©  2015
// </copyright>
// <summary>This file is responsible for the API configuration.</summary>
// ***********************************************************************
using System.Web.Http;
using Hermes.WebApi.Security;

namespace Hermes.WebApi.Web
{
    /// <summary>
    /// This class provides the configuration for the web api.
    /// </summary>
    public static class WebApiConfig
    {
        /// <summary>
        /// Registers the specified configuration of web api.
        /// </summary>
        /// <param name="config">The configuration.</param>
        public static void Register(HttpConfiguration config)
        {
            //config.Configure(RoutingConfig.Default);
            config.MapHttpAttributeRoutes();
            Core.DependencyResolverContainer.RegisterInstance<ISecurityCommand>(new Common.SecurityCommand());
        }
    }
}