<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentPrint.aspx.cs" Inherits="eBankit.UI.Modules.Web.OnlineRegistration.DocumentPrint" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("jquery-3.6.0.js".ResolveJsUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("jquery-ui-1.13.js".ResolveJsUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("jquery.blockUI.js".ResolveJsUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <script type="text/javascript">
</script>
</head>
<body>
    <form id="formPrint" runat="server">
        <asp:Button ID="btnPostBackPDFDoc" CssClass="hidden" runat="server" />
        <asp:HiddenField ID="hdnProcessNumber" runat="server" />
        <script type="text/javascript">

            function GeneratePDFDocument(processNumber) {
                var hdnProcessNumber = $("#<%=hdnProcessNumber.ClientID %>");
                hdnProcessNumber.val(processNumber);

                $("#<%=btnPostBackPDFDoc.ClientID %>").click();
            }
        </script>
    </form>
</body>
</html>
