using eBankit.Business.Entities;
using eBankit.Common.Sites;
using System;
using System.Collections.Generic;
using System.Reflection;
using Middleware.Providers.CustomBankingProvider;

namespace Common.InternetBanking.Services
{
    public class CustomServicesDataInternetBanking
    {
        public static DataClass<T> GetDataList<T>(string methodName, string ItemClassDll, string ItemClassName, string ItemClassNamespace, string ServiceClassDll, string ServiceClassName, string ServiceClassNamespace, string sortName, string accountNumber, bool isSearchWithFilters, CoreContext context, string nextPageItem, bool IsGeneric = false, FilterData filter = null) where T : class
        {
            List<T> items = new List<T>();
            List<T> itemsReturn = new List<T>();
            var ret = new DataClass<T>();
            object result = null;
            bool hasmore = false;
            int totalrecs = 0;
            TransactionProof proof = null;

            Type type = typeof(CustomServicesDataInternetBanking);

            object[] parametersArray = new object[] { context, methodName, ItemClassDll, ItemClassName, ItemClassNamespace, ServiceClassDll, ServiceClassName, ServiceClassNamespace, accountNumber, filter.RegByPage, filter.Type, filter.DateInitData, filter.DateEndData, sortName, isSearchWithFilters, filter, proof, nextPageItem, hasmore, totalrecs };

            MethodInfo methodInfo = type.GetMethod(methodName);
            if (methodInfo != null)
            {
                if (IsGeneric) methodInfo = methodInfo.MakeGenericMethod(typeof(T));

                ParameterInfo[] parameters = methodInfo.GetParameters();
                object classInstance = Activator.CreateInstance(type, null);

                if (parameters.Length == 0)
                {
                    //This works fine
                    result = methodInfo.Invoke(classInstance, null);
                }
                else
                {

                    //The invoke does NOT work it throws "Object does not match target type"             
                    result = methodInfo.Invoke(classInstance, parametersArray);
                }
            }

            if (result != null)
                items = (List<T>)result;

            ret.HasMorePages = bool.Parse(parametersArray[parametersArray.Length - 2].ToString());
            ret.RecordsCount = int.Parse(parametersArray[parametersArray.Length - 1].ToString());

            if (parametersArray[parametersArray.Length - 3] != null)
            {
                ret.NextPageItem = parametersArray[parametersArray.Length - 3].ToString();
            }

            ret.Proof = (TransactionProof)parametersArray[parametersArray.Length - 4];

            ret.Items = items;

            return ret;
        }
    }
}
