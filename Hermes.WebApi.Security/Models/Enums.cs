using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hermes.WebApi.Security.Models
{
    /// <summary>
    /// Permissions
    /// </summary>
    public enum Permission
    {
        /// <summary>
        /// The create
        /// </summary>
        Create = -1,

        /// <summary>
        /// The read
        /// </summary>
        Read = -2,

        /// <summary>
        /// The update
        /// </summary>
        Update = -3,

        /// <summary>
        /// The delete
        /// </summary>
        Delete = -4
    }
}
