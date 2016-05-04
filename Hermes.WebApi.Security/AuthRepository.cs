using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Hermes.WebApi.Base.SqlSerializer;
using Hermes.WebApi.Security.Models;

namespace Hermes.WebApi.Security
{
    /// <summary>
    /// Authentication repository.
    /// </summary>
    public class AuthRepository : IDisposable
    {
        /// <summary>
        /// The SQL serializer
        /// </summary>
        private readonly SqlSerializer sqlSerializer;

        /// <summary>
        /// Initializes a new instance of the <see cref="AuthRepository"/> class.
        /// </summary>
        /// <param name="sqlSerializer">The SQL serializer.</param>
        public AuthRepository(SqlSerializer sqlSerializer)
        {
            this.sqlSerializer = sqlSerializer;
        }

        /// <summary>
        /// Authenticates the username password.
        /// </summary>
        /// <param name="username">Name of the user.</param>
        /// <param name="password">The password.</param>
        /// <returns>
        /// user identity details
        /// </returns>
        public UserIdentity AuthenticateUsernamePassword(string username, string password)
        {
            string commandText = "[dbo].[AuthenticateUsernamePassword]";

            SetCollection sets = new SetCollection();
            sets.AddSet<UserIdentity>("UserIdentiry");
            sets.AddSet<Role>("Role");
            sets.AddSet<AuthProvider>("AuthProvider");

            var parameters = new[]
            {
                new Parameter("@Username", username),
                new Parameter("@Password", password)
            };

            this.sqlSerializer.DeserializeMultiSets(sets, commandText, parameters: parameters, storedProcedure: true);

            var userIdentity = sets.GetSet<UserIdentity>("UserIdentiry").FirstOrDefault();

            if (userIdentity == null)
                return null;

            sets.GetSet<Role>("Role").ForEach(r => { userIdentity.Roles.Add(r); });

            sets.GetSet<AuthProvider>("AuthProvider").ForEach(r => { userIdentity.AuthProviders.Add(r); });

            return userIdentity;
        }

        /// <summary>
        /// Finds the authentication client.
        /// </summary>
        /// <param name="clientId">The client identifier.</param>
        /// <returns>authentication client information</returns>
        public AuthClient FindAuthClient(string clientId)
        {
            string commandText = "[dbo].[FindAuthClientById]";

            var param = new Parameter("@authClientId", clientId);

            return this.sqlSerializer.DeserializeSingleRecord<AuthClient>(commandText, param, storedProcedure: true);
        }

        /// <summary>
        /// Finds the login provider.
        /// </summary>
        /// <param name="authProvider">The authentication provider.</param>
        /// <returns>user identity details</returns>
        public UserIdentity FindLoginProvider(AuthProvider authProvider)
        {
            string commandText = "[dbo].[FindLoginProvider]";

            SetCollection sets = new SetCollection();
            sets.AddSet<UserIdentity>("UserIdentiry");
            sets.AddSet<Role>("Role");
            sets.AddSet<AuthProvider>("AuthProvider");

            var parameters = new[]
            {
                new Parameter("@loginProvider", authProvider.LoginProvider),
                new Parameter("@providerKey", authProvider.ProviderKey)
            };

            this.sqlSerializer.DeserializeMultiSets(sets, commandText, parameters: parameters, storedProcedure: true);

            var userIdentity = sets.GetSet<UserIdentity>("UserIdentiry").FirstOrDefault();

            if (userIdentity == null)
                return null;

            sets.GetSet<Role>("Role").ForEach(r => { userIdentity.Roles.Add(r); });

            sets.GetSet<AuthProvider>("AuthProvider").ForEach(r => { userIdentity.AuthProviders.Add(r); });

            return userIdentity;
        }

        /// <summary>
        /// Adds the user.
        /// </summary>
        /// <param name="username">The username.</param>
        /// <param name="password">The password.</param>
        /// <param name="emailAddress">The email address.</param>
        /// <param name="enabled">if set to <c>true</c> [enabled].</param>
        /// <returns>user id</returns>
        public long AddUser(string username, string password, string emailAddress, bool enabled)
        {
            string commandText = "[dbo].[AddNewUser]";

            var parameters = new[]
            {
                new Parameter("@UserName", username),
                new Parameter("@Password", string.IsNullOrEmpty(password)? null : password),
                new Parameter("@EmailAddress", string.IsNullOrEmpty(emailAddress)? null : emailAddress),
                new Parameter("@Enabled", enabled)
            };

            return this.sqlSerializer.ExecuteScalar<long>(commandText, parameters: parameters, storedProcedure: true);
        }

        /// <summary>
        /// Adds the user.
        /// </summary>
        /// <param name="authProvider">The authentication provider.</param>
        /// <returns>
        /// inserted state.
        /// </returns>
        public bool AddNewUserLoginProvider(AuthProvider authProvider)
        {
            string commandText = "[dbo].[AddNewUserLoginProvider]";

            var parameters = new[]
            {
                new Parameter("@UserId", authProvider.UserId),
                new Parameter("@LoginProvider", authProvider.LoginProvider),
                new Parameter("@ProviderKey", authProvider.ProviderKey)
            };

            this.sqlSerializer.Execute(commandText, parameters: parameters, storedProcedure: true);

            return true;
        }

        /// <summary>
        /// Gets the authenticated user by user identifier.
        /// </summary>
        /// <param name="userId">The user identifier.</param>
        /// <returns>
        /// user identity details
        /// </returns>
        public UserIdentity GetAuthenticatedUserByUserId(long userId)
        {
            string commandText = "[dbo].[GetAuthenticatedUser]";

            SetCollection sets = new SetCollection();
            sets.AddSet<UserIdentity>("UserIdentiry");
            sets.AddSet<Role>("Role");
            sets.AddSet<AuthProvider>("AuthProvider");

            var param =new Parameter("@UserId", userId);

            this.sqlSerializer.DeserializeMultiSets(sets, commandText, parameter: param, storedProcedure: true);

            var userIdentity = sets.GetSet<UserIdentity>("UserIdentiry").FirstOrDefault();

            if (userIdentity == null)
                return null;

            sets.GetSet<Role>("Role").ForEach(r => { userIdentity.Roles.Add(r); });

            sets.GetSet<AuthProvider>("AuthProvider").ForEach(r => { userIdentity.AuthProviders.Add(r); });

            return userIdentity;
        }

        /// <summary>
        /// Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
        /// </summary>
        public void Dispose()
        {
        }
    }
}
