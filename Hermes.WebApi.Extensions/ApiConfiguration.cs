// ***********************************************************************
// Assembly         : Hermes.WebApi.Extensions
// Author           : avinash.dubey
// Created          : 01-19-2016
//
// Last Modified By : avinash.dubey
// Last Modified On : 01-20-2016
// ***********************************************************************
// <copyright file="ApiConfiguration.cs" company="">
//     Copyright ©  2015
// </copyright>
// <summary></summary>
// ***********************************************************************
using Hermes.WebApi.Core;
using Hermes.WebApi.Core.Enums;
using Hermes.WebApi.Core.Filters;
using Hermes.WebApi.Core.Handlers;
using Hermes.WebApi.Core.Interfaces;
using Hermes.WebApi.Core.Services;
using Hermes.WebApi.Extensions.Authentication;
using Hermes.WebApi.Extensions.Validation;
using System.Web.Http;
using System.Web.Http.ExceptionHandling;
using System.Web.Mvc;
using HermesSecurity = Hermes.WebApi.Core.Security;

namespace Hermes.WebApi.Extensions
{
    /// <summary>
    /// A class to configure the Configuration using API.
    /// </summary>
    public static class ApiConfiguration
    {
        /// <summary>
        /// Configurations the specified configuration, to the web api calls.
        /// </summary>
        /// <param name="config">The configuration.</param>
        /// <param name="routingConfig">The routing configuration.</param>
        public static void Configure(this HttpConfiguration config, RoutingConfig routingConfig = RoutingConfig.Namespace)
        {
            // Web API configuration and services
            RegisterDefaultValues();

            // Web API routes
            config.MapHttpAttributeRoutes();

            Config.Configure(config, routingConfig);

            if (HermesSecurity.Configuration.Current.AuthenticationEnabled)
            {
                config.Filters.Add(new AuthenticationAttribute());

                if (HermesSecurity.Configuration.Current.HermesAuthorizationEnabled)
                {
                    config.Filters.Add(new HermesAuthorizationAttribute());
                }
            }

            if (HermesSecurity.Configuration.Current.CSRFAttackPrevented)
            {
                config.MessageHandlers.Add(new CSRFHandler());
            }

            if (HermesSecurity.Configuration.Current.OAuthAuthenticationEnabled)
            {
                config.Filters.Add(new HostAuthenticationAttribute("bearer"));
                config.Filters.Add(new BearerAuthenticationFilter());

                if (HermesSecurity.Configuration.Current.HermesAuthorizationEnabled)
                {
                    config.Filters.Add(new HermesAuthorizationAttribute());
                }
            }

            config.Services.Replace(typeof(IExceptionHandler), new GeneralExceptionHandler());
        }

        /// <summary>
        /// Configurations the specified configuration, for MVC web application.
        /// </summary>
        /// <param name="filterCollection">The filter collection.</param>
        public static void ConfigureMVC(this GlobalFilterCollection filterCollection)
        {
            // Web MVC configuration and services
            DependencyResolverContainer.RegisterInstance<IAuthenticationCommand>(new AuthenticationCommand());

            // Web MVC web application routes
            filterCollection.Add(new MVCAuthenticationAttribute());
        }

        /// <summary>
        /// Registers the default values.
        /// </summary>
        private static void RegisterDefaultValues()
        {
            if (HermesSecurity.Configuration.Current.AuthenticationEnabled)
            {
                DependencyResolverContainer.RegisterInstance<IAuthenticationCommand>(new AuthenticationCommand());

                if (HermesSecurity.Configuration.Current.HermesAuthorizationEnabled)
                {
                    DependencyResolverContainer.RegisterInstance<IAuthorization>(new AuthorizationController());
                }
            }

            if (HermesSecurity.Configuration.Current.CSRFAttackPrevented)
            {
                DependencyResolverContainer.RegisterInstance<ICSRFValidation>(new CSRFValidation());
            }

            if (HermesSecurity.Configuration.Current.OAuthAuthenticationEnabled)
            {
                DependencyResolverContainer.RegisterInstance<IBearerAuthenticationCommand>(new BearerAuthenticationCommand());

                if (HermesSecurity.Configuration.Current.HermesAuthorizationEnabled)
                {
                    DependencyResolverContainer.RegisterInstance<IAuthorization>(new AuthorizationController());
                }
            }

            DependencyResolverContainer.RegisterInstance<ILog>(new Logging.Logging());
        }

        /// <summary>
        /// Registers the specified configuration.
        /// </summary>
        /// <param name="config">The configuration.</param>
        /// <returns></returns>
        public static HttpConfiguration Register(HttpConfiguration config)
        {
            config.Configure(RoutingConfig.Default);

            return config;
        }
    }
}