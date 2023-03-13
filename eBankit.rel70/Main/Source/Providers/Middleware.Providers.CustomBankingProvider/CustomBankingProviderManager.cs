using System;
using System.Collections.Generic;
using System.Configuration;
using System.Configuration.Provider;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;

namespace Middleware.Providers.CustomBankingProvider
{
    public class CustomBankingProviderManager
    {
        //Initialization related variables and logic
        private static Exception initializationException;

        private static object initializationLock = new object();

        static CustomBankingProviderManager()
        {
            Initialize();
        }

        private static void Initialize()
        {

            try
            {
                //Get the feature's configuration info
                CustomBankingProviderConfiguration qc =
                    (CustomBankingProviderConfiguration)ConfigurationManager.GetSection("CustomBankingProvider");

                if (qc == null)
                    throw new ProviderException("A secção CustomBankingProvider não existe no Web.Config, deve ser adicionada.");

                if (qc.DefaultProvider == null || qc.Providers == null || qc.Providers.Count < 1)
                    throw new ProviderException("You must specify a valid default provider.");

                //Instantiate the providers
                providerCollection = new CustomBankingProviderCollection();
                ProvidersHelper.InstantiateProviders(qc.Providers, providerCollection, typeof(CustomBankingProvider));
                providerCollection.SetReadOnly();
                defaultProvider = providerCollection[qc.DefaultProvider];
                if (defaultProvider == null)
                {
                    throw new ConfigurationErrorsException(
                        "You must specify a default provider for the feature.",
                        qc.ElementInformation.Properties["defaultProvider"].Source,
                        qc.ElementInformation.Properties["defaultProvider"].LineNumber);
                }
            }
            catch (Exception ex)
            {
                initializationException = ex;
                throw;
            }
        }

        //Public feature API
        private static CustomBankingProvider defaultProvider;
        private static CustomBankingProviderCollection providerCollection;

        public static CustomBankingProvider Provider
        {
            get
            {
                return defaultProvider;
            }
        }

        public static CustomBankingProviderCollection Providers
        {
            get
            {
                return providerCollection;
            }
        }


    }

}

