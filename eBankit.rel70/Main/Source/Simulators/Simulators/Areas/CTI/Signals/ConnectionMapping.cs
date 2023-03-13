using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using eBankit.FE.Common.Entities.Models;
using Ebankit.Core.MultiTenancy.Common.Retriever.Interfaces;

namespace eBankit.FE.Simulators.CTI.Signals
{
    public class HubsConnections
    {
        private static readonly ConcurrentDictionary<Guid, ConnectionMapping<string>> _tenantSignalRConnections = new ConcurrentDictionary<Guid, ConnectionMapping<string>>();

        public static ConnectionMapping<string> GetConnectionMapping(ITenantRetriever tenantRetriever)
        {
            var tenantId = Guid.Empty;
            var tenant = tenantRetriever.Get();
            if (tenant != null)
                tenantId = tenant.Id;

            ConnectionMapping<string> result;
            if (!(_tenantSignalRConnections.TryGetValue(tenantId, out result) && result != null))
            {
                result = new ConnectionMapping<string>();
                _tenantSignalRConnections.AddOrUpdate(tenantId, result, (id, obj) => result);
            }

            return result;
        }

        public static void SetConnectionMapping(ITenantRetriever tenantRetriever, ConnectionMapping<string> connectionMapping)
        {
            var tenantId = Guid.Empty;
            var tenant = tenantRetriever.Get();
            if (tenant != null)
                tenantId = tenant.Id;

            _tenantSignalRConnections.AddOrUpdate(tenantId, connectionMapping, (id, obj) => connectionMapping);
        }
    }

    public enum ConnectionMappingErrors { ExtensionNotInUse = 0, UserNotRegistered = 1 }
    public class ConnectionMapping<T>
    {
        private readonly Dictionary<T, HashSet<UserConnection>> _connections =
            new Dictionary<T, HashSet<UserConnection>>();



        public void Add(T key, UserConnection connection)
        {
            if (key == null) return;

            lock (_connections)
            {
                if (!_connections.TryGetValue(key, out var connections))
                {
                    connections = new HashSet<UserConnection>();
                    _connections.Add(key, connections);
                }

                lock (connections)
                {
                    connections.Add(connection);
                }
            }
        }
        public IEnumerable<UserConnection> GetConnections(T key)
        {
            if (key == null) return null;
            lock (_connections)
            {
                return _connections.TryGetValue(key, out var connections) ? connections : Enumerable.Empty<UserConnection>();
            }
        }


        public IEnumerable<string> GetConnectionsId(T key)
        {
            if (key == null) return null;
            lock (_connections)
            {
                return _connections.TryGetValue(key, out var connections) ? connections.Select(x => x.ConnectionId) : Enumerable.Empty<string>();
            }
        }

        public UserConnection GetConnectionById(T key, string connectionId)
        {
            if (key == null) return null;
            lock (_connections)
            {
                if (!_connections.TryGetValue(key, out var connections))
                {
                    return null;
                }

                lock (connections)
                {
                    return connections.First(x => x.ConnectionId == connectionId);

                }
            }
        }

        public UserConnection GetConnectionById(string connectionId)
        {
            if (string.IsNullOrEmpty(connectionId)) return null;

            lock (_connections)
            {
                return (from connection in _connections.Values
                        where connection.Any(x => x.ConnectionId == connectionId)
                        select connection.First(x => x.ConnectionId == connectionId))
                    .FirstOrDefault();
            }
        }

        public IEnumerable<UserConnection> GetConnectionsByUser(string userId)
        {
            if (string.IsNullOrEmpty(userId)) return null;

            lock (_connections)
            {
                foreach (var connection in _connections.Values)
                {
                    if (connection.Any(x => x.UserId == userId))
                        return connection.Where(x => x.UserId == userId);
                }
                return Enumerable.Empty<UserConnection>();

            }
        }

        
        public bool IsOnline(T key)
        {
            lock (_connections)
            {
                return _connections.TryGetValue(key, out _);
            }
        }
        public void Remove(T key, string connectionId)
        {
            if (key == null) return;
            lock (_connections)
            {
                if (!_connections.TryGetValue(key, out var connections))
                {
                    return;
                }

                lock (connections)
                {
                    var connection = connections.First(x => x.ConnectionId == connectionId);
                    connections.Remove(connection);

                    if (connections.Count == 0)
                    {
                        _connections.Remove(key);
                    }
                }
            }
        }

        public void Remove(string connectionId)
        {
            if (string.IsNullOrEmpty(connectionId)) return;

            var connection = GetConnectionById(connectionId);
            lock (_connections)
            {
                var key = _connections.FirstOrDefault(x => x.Value.Contains(connection)).Key;
                Remove(key, connectionId);
            }
        }



        public int Count()
        {
            lock (_connections)
            {
                return _connections.Count;
            }
        }
    }
}
