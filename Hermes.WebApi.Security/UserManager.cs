using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hermes.WebApi.Security
{
    /// <summary>
    /// User manager
    /// </summary>
    public class UserManager : IDisposable
    {
        /// <summary>
        /// The authentication repo
        /// </summary>
        private readonly AuthRepository authRepo;

        /// <summary>
        /// Initializes a new instance of the <see cref="UserManager"/> class.
        /// </summary>
        public UserManager()
        {
            authRepo = new AuthRepository(AuthContext.AuthDal);
        }

        /// <summary>
        /// Authenticates the username password.
        /// </summary>
        /// <param name="userName">Name of the user.</param>
        /// <param name="password">The password.</param>
        /// <returns>user identity</returns>
        public UserIdentity AuthenticateUsernamePassword(string userName, string password)
        {
            password = SecureString.Encrypt(password);
            var result = authRepo.AuthenticateUsernamePassword(userName, password);
            return result;
        }

        /// <summary>
        /// Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
        /// </summary>
        public void Dispose()
        {
            this.authRepo.Dispose();
        }
    }
}
