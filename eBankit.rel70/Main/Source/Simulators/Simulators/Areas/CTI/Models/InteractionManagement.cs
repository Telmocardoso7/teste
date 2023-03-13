using System;
using System.Collections.Generic;

namespace eBankit.FE.Simulators.CTI.Models
{
    public class InteractionManagement
    {
        public Guid Identifier { get; set; }

        public InteractionManagementType InteractionType { get; set; }

        public DateTime StartedCall { get; set; }

        public bool Attended { get; set; }

        public string ClientNumber { get; set; }

        public bool Authenticate { get; set; }

        public bool TransferBackToIvr { get; set; }

        public string UserOnHoldTransferBackToIvr { get; set; }

        public Dictionary<string, string> extraParams { get; set; }

        public string DestinationNumber { get; set; }

        public bool BlindTransfered { get; set; }
    }

    public enum InteractionManagementType
    {
        Call = 1,
        Email = 2,
    }
}