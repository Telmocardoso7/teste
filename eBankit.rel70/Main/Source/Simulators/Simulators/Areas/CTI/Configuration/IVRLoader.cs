using eBankit.FE.Simulators.CTI.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.CTI.Configuration
{
    public class IVRLoader : IDisposable
    {
        private CtiSettings _settings;


        public IVRLoader(CtiSettings settings)
        {

            _settings = settings;
        }

        public void Dispose()
        {

        }

        public void FillEndpoints(string tokenAuthority)
        {
            try
            {
                //Fill endpoints on the correct way
                if (!string.IsNullOrEmpty(_settings.Prefix))
                {
                    _settings.Base = string.Format(_settings.Base, _settings.Prefix);
                    _settings.IdentityClient.TokenAuthorityUrl = string.Format(tokenAuthority, _settings.Prefix);
                } else
                {
                    _settings.IdentityClient.TokenAuthorityUrl = tokenAuthority;
                }
            }
            catch (Exception)
            {

            }
        }
    }
}
