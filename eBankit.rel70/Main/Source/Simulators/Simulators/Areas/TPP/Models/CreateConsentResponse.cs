using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.TPP.Models
{


    public class CreateConsentResponse
    {
        public string consentStatus { get; set; }
        public string consentId { get; set; }
        public _Links _links { get; set; }
    }

    public class _Links
    {
        public Scaredirect scaRedirect { get; set; }
        public Self self { get; set; }
        public Status status { get; set; }
        public Scastatus scaStatus { get; set; }
    }

    public class Scaredirect
    {
        public string key { get; set; }
        public string value { get; set; }
    }

    public class Self
    {
        public string key { get; set; }
        public string value { get; set; }
    }

    public class Status
    {
        public string key { get; set; }
        public string value { get; set; }
    }

    public class Scastatus
    {
        public string key { get; set; }
        public string value { get; set; }
    }
}
