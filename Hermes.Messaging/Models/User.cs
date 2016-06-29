using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Hermes.Messaging.Models
{
    public class User
    {
        public string UserName { get; set; }

        public long UserId { get; set; }

        public long SessionId { get; set; }

        public string ConnectionId { get; set; }

        public IList<string> Groups { get; set; }
    }
}