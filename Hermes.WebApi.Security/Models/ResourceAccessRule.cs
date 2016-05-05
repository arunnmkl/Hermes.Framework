using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Hermes.WebApi.Base.SqlSerializer;

namespace Hermes.WebApi.Security.Models
{
    /// <summary>
    /// Class for Logical resource access rule.
    /// </summary>
    public class ResourceAccessRule
    {
        /// <summary>
        /// Gets or sets the name of the resource.
        /// </summary>
        /// <value>
        /// The name of the resource.
        /// </value>
        public string ResourceName { get; set; }

        /// <summary>
        /// Gets or sets the required permission.
        /// </summary>
        /// <value>
        /// The required permission.
        /// </value>
        [PropertyMapping("PermissionId")]
        public Int32 RequiredPermission { get; set; }
    }
}
