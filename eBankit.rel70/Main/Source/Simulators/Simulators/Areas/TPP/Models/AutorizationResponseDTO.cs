using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.TPP.Models
{

    public class AutorizationResponseDTO
    {
        public Result Result { get; set; }
        public string status { get; set; }
        public int httpStatusCode { get; set; }
        public int statusCode { get; set; }
    }

    public class Result
    {
        public string access_token { get; set; }
        public string token_type { get; set; }
        public float expires_in { get; set; }
    }
}
