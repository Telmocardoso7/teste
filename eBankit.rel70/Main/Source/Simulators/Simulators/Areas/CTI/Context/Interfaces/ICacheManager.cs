using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Caching.Distributed;
using Newtonsoft.Json;

namespace eBankit.FE.Simulators.CTI.Context.Interfaces
{
    public interface ICacheManager
    {
        void SaveCache<T>(string key, T obj);

        T GetCache<T>(string key);

        void SaveSession<T>(string key, T obj);

        T GetSession<T>(string key);
    }
}
