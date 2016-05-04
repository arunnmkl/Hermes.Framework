using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Hermes.WebApi.Base.SqlSerializer;

namespace Hermes.WebApi.Security
{
    /// <summary>
    /// Authentication context.
    /// </summary>
    public class AuthContext
    {
        /// <summary>
        /// The authentication dal
        /// </summary>
        [ThreadStatic]
        private static SqlSerializer authDal;

        /// <summary>
        /// Gets or sets the authentication dal.
        /// </summary>
        /// <value>
        /// The authentication dal.
        /// </value>
        public static SqlSerializer AuthDal
        {
            get
            {
                return authDal ?? SqlSerializer.ByName("AuthContext");
            }

            set
            {
                authDal = value;
            }
        }

    }
}
