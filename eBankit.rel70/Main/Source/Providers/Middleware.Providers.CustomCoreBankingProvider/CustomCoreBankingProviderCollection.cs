using System;
using System.Collections.Generic;
using System.Configuration.Provider;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Middleware.Providers.CustomCoreBankingProvider
{
    public class CustomCoreBankingProviderCollection : ProviderCollection
    {
        public override void Add(ProviderBase provider)
        {
            if (provider == null)
                throw new ArgumentNullException("The provider parameter cannot be null.");

            if (!(provider is CustomCoreBankingProvider))
                throw new ArgumentException("The provider parameter must be of type CustomCoreBankingProvider.");

            base.Add(provider);
        }

        new public CustomCoreBankingProvider this[string name]
        {
            get { return (CustomCoreBankingProvider)base[name]; }
        }

        public void CopyTo(CustomCoreBankingProvider[] array, int index)
        {
            base.CopyTo(array, index);
        }
    }
}
