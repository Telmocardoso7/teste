using eBankit.Business.Entities;
using eBankit.Business.Entities.Banking.Customer;
using eBankit.Business.Entities.Customer.Search;
using eBankit.Business.Entities.Interaction;
using eBankit.Middleware.Core.Transaction;
using eBankit.Middleware.Transactions.eBankit.Provider;

namespace eBankit.Middleware.Transactions.Custom.Provider
{

    // Use this file to override product transaction with your custom code otherwise the transactions will be executed with ebankit's default transaction
    public class CustomCoreProvider : EBankitProvider
    {
        // example override for SearchCustomer
        public override CoreCustomerCollection SearchCustomers(ServiceInputHeader inHeader, BankingInteractionContext interactionContext, SearchCustomersInput searchFilters, out CoreTransaction outTransaction)
        {
            EbankitSample.Customer.CustomerSearchTransaction s = new EbankitSample.Customer.CustomerSearchTransaction(inHeader, interactionContext, searchFilters);
            s.Execute();
            outTransaction = (CoreTransaction)s;
            return s.CustomerCollection;
        }
    }
}