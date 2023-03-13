using System;

namespace eBankit.FE.Simulators.CTI.ViewModels
{
    public class TransferMoney
    {
        public Guid InteractionId { get; set; }

        public string AccountNumber { get; set; }

        public string BranchId { get; set; } = "00001";

        public string DestinationAccountNumber { get; set; }

        public decimal Amount { get; set; }

        public string Currency { get; set; } = "EUR";

        public DateTime Date { get; set; } = DateTime.Now;

        public string Description { get; set; }

        public int TotalRecurrences { get; set; } = 0;
       
    }
}
