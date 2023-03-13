using eBankit.Business.Entities;
using eBankit.Middleware.Common.Transaction;
using eBankit.Middleware.Core.Transaction;
using eBankit.Middleware.eBankitServices;
using Middleware.Providers.CustomCoreBankingProvider;
using System;

namespace Ebankit
{
    public class EbankitCustomService : CommonBaseService, IEbankitCustomService
    {
        //public OutputObjectSample GetDataObject(InputObjectSample data)
        //{
        //	CoreTransaction ct = null;
        //	try
        //	{
        //		OutputObjectSample result = CustomCoreBankingProviderManager.Provider.GetDataObject(this.ServiceInputHeader, this.CurrentContext.InteractionContext, data, out ct);
        //		if (ct.TransactionStatus == CoreTransactionStatus.Failed)
        //		{
        //			ManageError(this.ServiceInputHeader, ct.Ex);
        //			return null;
        //		}
        //		else
        //		{
        //			return ct.Result;
        //		}
        //	}
        //	catch (Exception ex)
        //	{
        //		ManageError(this.ServiceInputHeader, ex);
        //		return null;
        //	}
        //	finally
        //	{
        //		SetResponseHeader(ct);
        //	}
        //}			
        public void SampleMethod()
        {
            throw new NotImplementedException();
        }

    }
}