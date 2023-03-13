<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="ProductPreview.aspx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.ProductPreview" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Register Src="~/Modules/Subscription/Controls/AccountOpening/AccountOpeningIntroduction.ascx" TagPrefix="it" TagName="AccountOpeningintroduction" %>

<asp:Content runat="server" ID="AOIntroductionBodyContent" ContentPlaceHolderID="TransactionMainContent">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("accountOpening.css".ResolveModuleCssUrl(true), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

    <div class="validate-delegates-warning">
        <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
    </div>

    <div class="accountOpening-content">
        <asp:Panel ID="pnAOIntroduction" runat="server" CssClass="accountOpening-introduction-container">
            <it:accountopeningintroduction id="accountOpeningintroduction" runat="server"></it:accountopeningintroduction>
        </asp:Panel>
    </div>
</asp:Content>
