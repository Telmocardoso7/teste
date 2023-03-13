using IdentityModel.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Common.Interfaces
{
    public interface ITokenService
    {
        Task<TokenResponse> GetToken(string clientId, string clientSecret, string scope);
    }
}
