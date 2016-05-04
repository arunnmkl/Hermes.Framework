using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hermes.WebApi.Security
{
    /// <summary>
    /// I User
    /// </summary>
    public interface IUser
    {
        /// <summary>
        /// Gets or sets the user identifier.
        /// </summary>
        /// <value>
        /// The user identifier.
        /// </value>
        long UserId { get; set; }

        /// <summary>
        /// Gets or sets the security identifier.
        /// </summary>
        /// <value>
        /// The security identifier.
        /// </value>
        Guid SecurityId { get; set; }

        /// <summary>
        /// Gets or sets the username.
        /// </summary>
        /// <value>
        /// The username.
        /// </value>
        string Username { get; set; }
    }

    /// <summary>
    /// Role
    /// </summary>
    public class Role
    {
        /// <summary>
        /// Gets or sets the role identifier.
        /// </summary>
        /// <value>
        /// The role identifier.
        /// </value>
        public long RoleId { get; set; }

        /// <summary>
        /// Gets or sets the security identifier.
        /// </summary>
        /// <value>
        /// The security identifier.
        /// </value>
        public Guid SecurityId { get; set; }

        /// <summary>
        /// Gets or sets the name.
        /// </summary>
        /// <value>
        /// The name.
        /// </value>
        public string Name { get; set; }
    }

    /// <summary>
    /// User Identity
    /// </summary>
    /// <seealso cref="Hermes.WebApi.Extensions.Security.IUser" />
    public class UserIdentity : IUser
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="UserIdentity"/> class.
        /// </summary>
        public UserIdentity()
        {
            this.Roles = new List<Role>();
        }

        /// <summary>
        /// Gets or sets the security identifier.
        /// </summary>
        /// <value>
        /// The security identifier.
        /// </value>
        public Guid SecurityId { get; set; }

        /// <summary>
        /// Gets or sets the user identifier.
        /// </summary>
        /// <value>
        /// The user identifier.
        /// </value>
        public long UserId { get; set; }

        /// <summary>
        /// Gets or sets the username.
        /// </summary>
        /// <value>
        /// The username.
        /// </value>
        public string Username { get; set; }

        /// <summary>
        /// Gets or sets the roles.
        /// </summary>
        /// <value>
        /// The roles.
        /// </value>
        public ICollection<Role> Roles { get; set; }
    }
}
