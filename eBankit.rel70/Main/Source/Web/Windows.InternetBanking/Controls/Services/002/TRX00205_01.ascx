<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00205_01.ascx.cs" Inherits="TRX00205_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContainer" class="transaction-content" runat="server">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <it:FlowInnerContainer ID="flwData" Title="<%$FrontEndResources:TRX00205,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <it:FlowLabel ID="flwCardAccount" Label="<%$FrontEndResources:TRX00205,lblCardAccount%>" runat="server" />
                    <it:FlowLabel ID="flwCurrentAccount" IsRequired="true" Label="<%$FrontEndResources:TRX00205,ddlCurrentAccounts%>" runat="server" />
                    <it:CurrencyTextBoxControlAuto ID="txtValueToPay" IsRequired="true" ValidateWithAccountBalance="true"
                        ShowCurrency="true" AllowValuesUnderOne="true"
                        MaxLength="23" ValidationRequiredMessage="<%$FrontEndResources:TRX00205,txtValueToPayValidationRequiredMessage %>"
                        ValidationInvalidInputMessage="<%$FrontEndResources:TRX00205,txtValueToPayValidationInvalidInputMessage %>"
                        Label="<%$FrontEndResources:TRX00205,txtValueToPay%>"  runat="server" />
                </div>
            </it:FlowInnerContainer>
            <asp:HiddenField ID="hdnValidCard" runat="server" />
            <asp:HiddenField ID="hdnCurrentAccount" runat="server" />
            <asp:HiddenField ID="hdnAccountRetDrop" runat="server" />
            <asp:HiddenField ID="hdnAccountRetDropName" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("/Scripts/Services/Transactions/TRX00205-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00205-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
