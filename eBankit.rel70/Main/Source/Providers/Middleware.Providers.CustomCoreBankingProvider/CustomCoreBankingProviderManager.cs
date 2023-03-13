using System;
using System.Configuration;
using System.Configuration.Provider;
using System.Web.Configuration;

namespace Middleware.Providers.CustomCoreBankingProvider
{
    public class CustomCoreBankingProviderManager
    {
        //Initialization related variables and logic
        private static Exception initializationException;

        private static object initializationLock = new object();

        static CustomCoreBankingProviderManager()
        {
            Initialize();
        }

        private static void Initialize()
        {

            try
            {
                //Get the feature's configuration info
                CustomCoreBankingProviderConfiguration qc =
                    (CustomCoreBankingProviderConfiguration)ConfigurationManager.GetSection("CustomCoreBankingProvider");

                if (qc == null)
                    throw new ProviderException("A secção CustomCoreBankingProvider não existe no Web.Config, deve ser adicionada.");

                if (qc.DefaultProvider == null || qc.Providers == null || qc.Providers.Count < 1)
                    throw new ProviderException("You must specify a valid default provider.");

                //Instantiate the providers
                providerCollection = new CustomCoreBankingProviderCollection();
                ProvidersHelper.InstantiateProviders(qc.Providers, providerCollection, typeof(CustomCoreBankingProvider));
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
        private static CustomCoreBankingProvider defaultProvider;
        private static CustomCoreBankingProviderCollection providerCollection;

        public static CustomCoreBankingProvider Provider
        {
            get
            {
                return defaultProvider;
            }
        }

        public static CustomCoreBankingProviderCollection Providers
        {
            get
            {
                return providerCollection;
            }
        }


    }

}

