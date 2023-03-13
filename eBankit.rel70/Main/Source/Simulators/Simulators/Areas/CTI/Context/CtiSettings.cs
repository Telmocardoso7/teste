using eBankit.FE.Simulators.CTI.Context.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.CTI.Context
{
    public class CtiSettings : ICtiSettings
    {
        public string Prefix { get; set; }
        public string Base { get; set; }
        public IdentitySettings IdentityClient { get; set; }

        public InteractionSettings Interaction { get; set; } = new InteractionSettings();

        public IvrSettings Ivr { get; set; } = new IvrSettings();
    }

    public class InteractionSettings
    {
        public string NewInteraction { get; set; } = "/ContactCenter/NewInteraction";

        public string CloseInteraction { get; set; } = "/ContactCenter/CloseInteraction";

        public string RegisterExtension { get; set; } = "/ContactCenter/Extension/Register";

        public string UnRegisterExtension { get; set; } = "/ContactCenter/Extension/UnRegister";

        public string CallIncoming { get; set; } = "/ContactCenter/Call/Incoming";

        public string CallStarted { get; set; } = "/ContactCenter/Call/Started";

        public string CallEnd { get; set; } = "/ContactCenter/Call/End";

        public string CallTransfer { get; set; } = "/ContactCenter/Call/TransferBetweenOperators/HangUpInOrigin";

        public string EmailIn { get; set; } = "/ContactCenter/Email/In";

        public string IgnoreCall { get; set; } = "/ContactCenter/Call/Ignore";

        public string UserStatus { get; set; } = "/ContactCenter/User/Status";

        public string RemoveHoldCallInOperatorFromIvr { get; set; } = "/ContactCenter/Call/RemoveHoldCallInOperatorFromIvr";
    }

    public class IvrSettings
    {
        public string IdentifyByClientNumber { get; set; } = "/ContactCenter/Identification/ClientNumber";

        public string LoginByClientNumber { get; set; } = "/ContactCenter/Authentication/ClientNumber";

        public string LoginByClientNumberWithoutAccessCode { get; set; } = "/ContactCenter/Impersonate/ClientNumber";

        public string MoneyTransferInterAccounts { get; set; } = "/ContactCenter/Operation/Transfer";

        public string TransferToIvr { get; set; } = "/ContactCenter/Call/Ivr/To";

        public string TransferFromIvr { get; set; } = "/ContactCenter/Call/Ivr/From";
    }

    public class IdentitySettings
    {
        public string TokenAuthorityUrl { get; set; }

        public string ClientId { get; set; }

        public string ClientSecret { get; set; }

        public string Scope { get; set; }

        public bool RequireHTTPS { get; set; } = false;
    }
}
