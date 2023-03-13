using eBankit.Business.Entities;
using eBankit.Business.Entities.Account;
using eBankit.Business.Entities.Banking.Customer;
using eBankit.Business.Entities.Customer;
using eBankit.Business.Entities.Customer.Search;
using eBankit.Business.Entities.Interaction;
using eBankit.Common;
using eBankit.Middleware.Common.Transaction;
using eBankit.Middleware.Core.Transaction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eBankit.Middleware.Transactions.EbankitSample.Customer
{
    public class CustomerSearchTransaction : CoreTransaction
    {
        [TransactionParameter(TransactionParameterDirection.IN)]
        public string CustomerId { get; set; }

        [TransactionParameter(TransactionParameterDirection.IN)]
        public string Name { get; set; }

        [TransactionParameter(TransactionParameterDirection.IN)]
        public int PageIndex { get; set; }

        [TransactionParameter(TransactionParameterDirection.IN)]
        public int PageSize { get; set; }

        [TransactionParameter(TransactionParameterDirection.OUT)]
        public CoreCustomerCollection CustomerCollection { get; set; }

        SearchCustomersInput SearchFilters { get; set; }


        public CustomerSearchTransaction(ServiceInputHeader header, BankingInteractionContext context, SearchCustomersInput searchFilters)
            : base(header, context, "CustomerSearchTransaction", null, null, null)
        {
            CustomerId = searchFilters.CustomerId;
            Name = searchFilters.CustomerName;
            PageIndex = searchFilters.PageNumber;
            PageSize = searchFilters.RecordsByPage;
            this.SaveIndexKey = CustomerId;
            SearchFilters = searchFilters;


        }
        public override bool ServiceExecute()
        {

            CustomerCollection = new CoreCustomerCollection();
            CustomerCollection.Customers = new List<CoreCustomer>();
            decimal? customerid = null;
            if (!string.IsNullOrEmpty(this.CustomerId))
            {
                decimal tempCustomerId = -1;
                decimal.TryParse(this.CustomerId, out tempCustomerId);
                if (customerid == 0)
                    throw new CoreException("The Customer Number must be numeric!", "CustomerIDNotNumber");
                if (tempCustomerId != -1)
                    customerid = tempCustomerId;
            }
            
            if (SearchFilters.DocumentNumber != null)
            {
                CoreCustomer cc = new CoreCustomer
                {
                    CustomerType = CoreCustomerType.Individual,
                    BranchId = "123",
                    Number = "10000000",
                    ShortName = "Mock",
                    Name = "Mock",
                    ExtendedProperties = new List<ExtendedPropertie>()
                };

                cc.ExtendedProperties.Add(new ExtendedPropertie()
                {
                    DefaultName = "ClientSince",
                    ID = "ClientCreationDate",
                    Value = DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss")
                });

                ///TODO
                cc.ResidenceCountry = "PT";

                //if (SearchFilters.AccountNumberMandatory && SearchFilters.AccountNumber != null)
                //{
                //    var results2 = ctx.usp_GetEntityAccounts(result.EntityId).ToList();
                //    if (results2.Count > 0 && results2.Where(u => u.AccountId.ToString() == SearchFilters.AccountNumber).Count() > 0)
                //    {
                //        CustomerCollection.Customers.Add(cc);
                //        CustomerCollection.Count++;
                //    }
                //}
                //else
                //{
                CustomerCollection.Customers.Add(cc);
                CustomerCollection.Count++;
                //  }
                return true;
            }
            else
            {
                switch (SearchFilters.CustomerType)
                {
                    case CoreCustomerType.Corporate:
                        break;
                    case CoreCustomerType.Individual:
                        break;
                    case CoreCustomerType.All:
                        break;
                    default:
                        break;
                }

                //        var results = ctx.usp_GetEntitysWithDocuments(customerid, customerType, Name, PageIndex, PageSize);
                //        var entities = results.GetResult<usp_GetEntitysResult>();
                //        var docs = results.GetResult<EntityDocument>().ToList();
                //        foreach (var item in entities)
                //        {
                CoreCustomer cc = new CoreCustomer();
                cc.CustomerType = CoreCustomerType.Corporate;
                
                cc.BranchId = "123";
                cc.Number = "10000000";
                cc.ShortName = "Mock";
                cc.Name = "Mock";
                cc.ExtendedProperties = new List<ExtendedPropertie>();
                cc.ExtendedProperties.Add(new ExtendedPropertie()
                {
                    DefaultName = "ClientSince",
                    ID = "ClientCreationDate",
                    Value = DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss")
                });
                ///TODO
                cc.ResidenceCountry = "PT";
                cc.CustomerDocuments = new List<CoreCustomerDocument>();

                cc.CustomerDocuments.Add(new CoreCustomerDocument()
                {
                    CustomerDocumentType = CoreCustomerDocumentType.TaxPayerCard,
                    Value = "123123123",
                    ExpirationDate = DateTime.Now.AddYears(5),
                    IssuanceDate = DateTime.Now.AddYears(-5),
                    //CustomerDocumentType = doc.EntityDocumentTypeId

                });


                cc.IdentityDocumentNumber = cc.GetDocumentByType(CoreCustomerDocumentType.TaxPayerCard);


                CustomerCollection.Customers.Add(cc);
                //CustomerCollection.Count++;
            }

            CustomerCollection.Count = 1; // TO ALLOW PAGINATION ... OTHERWISE SEARCH CONTRACT PAGE ONLY RETURN 1 PAGE ..
            return true;
        }
    }
}