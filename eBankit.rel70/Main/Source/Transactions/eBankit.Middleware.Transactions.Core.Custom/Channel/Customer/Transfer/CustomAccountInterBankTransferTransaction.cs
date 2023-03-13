using eBankit.MW.Common.Attributes;
using eBankit.MW.Common.Attributes.Enums;
using eBankit.MW.Common.Entities.Context;
using eBankit.MW.Common.Transactions;
using eBankit.MW.Transactions.Interfaces.Channel.Customer.Transfer;
using System;

namespace eBankit.Middleware.Transactions.Core.Custom.Channel.Customer.Transfer
{
    public class CustomAccountInterBankTransferTransaction : CoreTransaction, IAccountInterBankTransferTransaction
    {
        [TransactionParameter(TransactionParameterDirection.In)]
        public string AccountNumber { get; set; }

        [TransactionParameter(TransactionParameterDirection.In)]
        public string BranchId { get; set; }

        [TransactionParameter(TransactionParameterDirection.In)]
        public string DestinationSwift { get; set; }

        [TransactionParameter(TransactionParameterDirection.In)]
        public string DestinationIban { get; set; }

        [TransactionParameter(TransactionParameterDirection.In)]
        public decimal Amount { get; set; }

        [TransactionParameter(TransactionParameterDirection.In)]
        public string Currency { get; set; }

        [TransactionParameter(TransactionParameterDirection.In)]
        public DateTime Date { get; set; }

        [TransactionParameter(TransactionParameterDirection.In)]
        public string BeneficiaryName { get; set; }

        [TransactionParameter(TransactionParameterDirection.In)]
        public string BeneficiaryAddress { get; set; }

        [TransactionParameter(TransactionParameterDirection.In)]
        public string Description { get; set; }

        [TransactionParameter(TransactionParameterDirection.In)]
        public string RecurrenceTypeId { get; set; }

        [TransactionParameter(TransactionParameterDirection.In)]
        public DateTime? EndDate { get; set; }

        [TransactionParameter(TransactionParameterDirection.In)]
        public int TotalRecurrences { get; set; }

        [TransactionParameter(TransactionParameterDirection.In)]
        public string Email { get; set; }

        [TransactionParameter(TransactionParameterDirection.Out)]
        public decimal? TransferId { get; set; }

        public CustomAccountInterBankTransferTransaction(IBaseContext context) :
            base(context, nameof(CustomAccountInterBankTransferTransaction))
        {
        }

        public override bool ServiceExecute()
        {
            //TODO

            return true;
        }
    }
}
