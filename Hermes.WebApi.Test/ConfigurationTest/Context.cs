using Hermes.WebApi.Base.SqlSerializer;
using Hermes.WebApi.Core.Common;

namespace Hermes.WebApi.Test.ConfigurationTest
{
	public class Context : ComponentConfiguration<FirstComponentConfiguration>
	{
		public static SqlSerializer GtCommon
		{
			get { return SqlSerializer.ByName("auth"); }
		}
	}
}