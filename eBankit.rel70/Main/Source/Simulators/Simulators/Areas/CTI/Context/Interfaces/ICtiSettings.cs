using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.CTI.Context.Interfaces
{
    public interface ICtiSettings
    {
        string Prefix { get; set; }
        string Base { get; set; }
        IdentitySettings IdentityClient { get; set; }

        InteractionSettings Interaction { get; set; }

        IvrSettings Ivr { get; set; }
    }
}
