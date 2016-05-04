using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Hermes.WebApi.Base.SqlSerializer;

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
