using eBankit.FE.Simulators.Common.Interfaces;
using eBankit.LIB.Common.Authentication.Discovery;
using IdentityModel.Client;
using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Common
{
    public class TokenService : ITokenService
    {
        private readonly DiscoveryCacheFactory _discoveryCacheFactory;
        private readonly string _sectionKey;
        private readonly bool _requireHttps;

        public TokenService(DiscoveryCacheFactory discoveryCacheFactory, string sectionKey, bool requireHttps)
        {
            _discoveryCacheFactory = discoveryCacheFactory;
            _sectionKey = sectionKey;
            _requireHttps = requireHttps;
        }

        public async Task<TokenResponse> GetToken(string clientId, string clientSecret, string scope)
        {
            TokenResponse tokenResponse = null;
            using (var client = new HttpClient())
            {
                var disco = GetDiscoveryCache().GetAsync().GetAwaiter().GetResult();
                if (disco.IsError)
                {
                    throw new Exception(disco.Error);
                }

                tokenResponse = client.RequestClientCredentialsTokenAsync(new ClientCredentialsTokenRequest
                {
                    Address = disco.TokenEndpoint,
                    ClientId = clientId,
                    ClientSecret = clientSecret,
                    Scope = scope
                }).GetAwaiter().GetResult();

                if (tokenResponse.IsError) throw new Exception(tokenResponse.Error);
            }

            return tokenResponse;
        }

        private DiscoveryCache GetDiscoveryCache()
        {
            return _discoveryCacheFactory.GetOrAddWithSectionKey(_sectionKey, _requireHttps);
        }

    }
}
