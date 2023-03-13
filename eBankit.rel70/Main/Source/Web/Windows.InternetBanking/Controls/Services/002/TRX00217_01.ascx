<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00217_01.ascx.cs" Inherits="TRX00217_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContainer" class="transaction-content" runat="server">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <it:FlowInnerContainer ID="flwData" Title="<%$FrontEndResources:TRX00217,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <it:FlowLabel ID="flwCardNumber" Label="<%$FrontEndResources:TRX00217,flwCardNumber%>" runat="server" />
                    <it:CurrencyTextBoxControlAuto ID="txtValueToPay" IsRequired="true" ValidateWithAccountBalance="true"
                        ShowCurrency="true" AllowValuesUnderOne="true"
                        MaxLength="23" ValidationRequiredMessage="<%$FrontEndResources:TRX00217,txtValueToPayValidationRequiredMessage %>"
                        ValidationInvalidInputMessage="<%$FrontEndResources:TRX00217,txtValueToPayValidationInvalidInputMessage %>"
                        Label="<%$FrontEndResources:TRX00217,txtValueToPay%>" runat="server" />
                    <it:TextBoxControl_v2 ID="txtDescAccountCard" IsRequired="false" Label="<%$FrontEndResources:TRX00217,txtDescAccountCard%>" runat="server" />
                    <it:TextBoxControl_v2 ID="txtDescAccountDO" IsRequired="false" Label="<%$FrontEndResources:TRX00217,txtDescAccountDO%>" runat="server" />
                </div>
            </it:FlowInnerContainer>
            <asp:HiddenField ID="hdnIsCredit" runat="server" />
            <asp:HiddenField ID="hdnCurrentAccount" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00217-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>