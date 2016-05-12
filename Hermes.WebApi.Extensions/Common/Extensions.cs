using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hermes.WebApi.Extensions.Common
{
    public static class Extensions
    {
        /// <summary>
        /// Gets the value by key.
        /// </summary>
        /// <param name="dictionary">The dictionary.</param>
        /// <param name="key">The key.</param>
        /// <returns></returns>
        public static object GetValueByKey(this IDictionary<string, object> dictionary, string key)
        {
            object value = null;
            if (!dictionary.TryGetValue(key, out value))
            {
                return value;
            }

            return value;
        }
    }
}
