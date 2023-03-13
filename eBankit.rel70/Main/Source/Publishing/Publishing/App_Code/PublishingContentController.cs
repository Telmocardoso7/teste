using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using Umbraco.Web.WebApi;

namespace ebankIT.Publishing.Web
{
    ////public class PublishingContentController : UmbracoApiController
    ////{
    ////    [AcceptVerbs("GET")]
    ////    public string get(string node, string key, string culture)
    ////    {
    ////        string id = "0";
    ////        try
    ////        {
    ////            var rootContent = Services.ContentService.GetRootContent().Where(x => x.ContentType.Name == "Redirect").FirstOrDefault();
    ////            if (rootContent != null)
    ////            {
    ////                var cultureContent = Services.ContentService.GetChildrenByName(rootContent.Id, culture).FirstOrDefault();
    ////                if (cultureContent != null)
    ////                {
    ////                    var ibContent = Services.ContentService.GetChildrenByName(cultureContent.Id, "INTERNETBANKING").FirstOrDefault();
    ////                    if (ibContent != null)
    ////                    {
    ////                        var nodeContent = Services.ContentService.GetChildrenByName(ibContent.Id, node).FirstOrDefault();
    ////                        if (nodeContent != null)
    ////                        {
    ////                            var keyContent = Services.ContentService.GetChildrenByName(nodeContent.Id, key).FirstOrDefault();
    ////                            if (keyContent != null)
    ////                            {
    ////                                id = keyContent.Id.ToString();
    ////                            }
    ////                        }
    ////                    }
    ////                }
    ////            }
    ////        }
    ////        catch { }
    ////        return id;
    ////    }
    ////}
}