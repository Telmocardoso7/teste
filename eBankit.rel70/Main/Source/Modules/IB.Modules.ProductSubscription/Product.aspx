<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="Product.aspx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Product" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("accountOpening.css".ResolveModuleCssUrl(true), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("validation-fields.js".ResolveModuleJsUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("AccountOpening/account-opening-common.js".ResolveModuleJsUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="TransactionMainContent">
    <div class="accountOpening-content">
        <asp:UpdatePanel ID="AOContent" runat="server" class="accountOpening-content-container">
            <ContentTemplate>
                <%@ Register Src="~/Modules/Subscription/Controls/AccountOpening/AccountOpeningOrchestrator.ascx" TagPrefix="it" TagName="AccountOpeningOrchestrator" %>
                <it:accountopeningorchestrator id="AccountOpeningOrchestrator" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
