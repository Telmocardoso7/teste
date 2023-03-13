using System;
using System.Collections.Generic;
using System.Configuration.Provider;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Middleware.Providers.CustomBankingProvider
{
    public class CustomBankingProviderCollection : ProviderCollection
    {
        public override void Add(ProviderBase provider)
        {
            if (provider == null)
                throw new ArgumentNullException("The provider parameter cannot be null.");

            if (!(provider is CustomBankingProvider))
                throw new ArgumentException("The provider parameter must be of type CustomBankingProvider.");

            base.Add(provider);
        }

        new public CustomBankingProvider this[string name]
        {
            get { return (CustomBankingProvider)base[name]; }
        }

        public void CopyTo(CustomBankingProvider[] array, int index)
        {
            base.CopyTo(array, index);
        }
    }
}
