using eBankit.FE.Simulators.CTI.Context.Interfaces;
using Ebankit.Core.Caching;
using Ebankit.Core.MultiTenancy.Common.Builder.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Caching.Distributed;
using Newtonsoft.Json;

namespace eBankit.FE.Simulators.CTI.Context
{
    public class CacheManager : ICacheManager
    {
        private readonly ILCache _cache;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ITenantKeyBuilder _tenantKeyBuilder;

        public CacheManager(ILCache cache, IHttpContextAccessor httpContextAccessor, ITenantKeyBuilder tenantKeyBuilder)
        {
            _cache = cache;
            _httpContextAccessor = httpContextAccessor;
            _tenantKeyBuilder = tenantKeyBuilder;
        }

        public void SaveCache<T>(string key, T obj)
        {
            var jset = new JsonSerializerSettings { TypeNameHandling = TypeNameHandling.Objects };
            key = BuildKey(key).ToLowerInvariant();
            var stringObject = JsonConvert.SerializeObject(obj, jset);
            _cache.Set<string>(key, stringObject);
        }

        public T GetCache<T>(string key)
        {
            var jset = new JsonSerializerSettings { TypeNameHandling = TypeNameHandling.Objects };
            key = BuildKey(key).ToLowerInvariant();
            var resultString = _cache.Get<string>(key);
            return resultString == null ? default(T) : JsonConvert.DeserializeObject<T>(resultString, jset);
        }

        public void SaveSession<T>(string key, T obj)
        {
            var jset = new JsonSerializerSettings { TypeNameHandling = TypeNameHandling.Objects };
            key = BuildKey(key).ToLowerInvariant();
            var stringObject = JsonConvert.SerializeObject(obj, jset);
            _httpContextAccessor.HttpContext.Session.SetString(key, stringObject);
        }

        public T GetSession<T>(string key)
        {
            var jset = new JsonSerializerSettings { TypeNameHandling = TypeNameHandling.Objects };
            key = BuildKey(key).ToLowerInvariant();
            var value = _httpContextAccessor.HttpContext.Session.GetString(key);
            return value == null ? default(T) : JsonConvert.DeserializeObject<T>(value, jset);
        }

        private string BuildKey(string key)
        {
            if (_tenantKeyBuilder == null)
                return key;

            var tenantPrefix = _tenantKeyBuilder.GetTenantShortNameKey();
            return !string.IsNullOrEmpty(tenantPrefix) ? tenantPrefix + "__" + key : key;
        }
    }
}
