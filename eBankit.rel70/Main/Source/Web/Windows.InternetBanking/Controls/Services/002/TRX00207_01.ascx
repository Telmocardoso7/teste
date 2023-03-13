<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00207_01.ascx.cs" Inherits="TRX00207_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContainer" class="transaction-content" runat="server">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div id="transactionContent" class="transaction-content accountDetail marginBottom10" runat="server">
                <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                    <it:FlowInnerContainer ID="flwData" Title="<%$FrontEndResources:TRX00207,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                        <div>
                            <it:FlowLabel ID="lblCardNumber" Label="<%$FrontEndResources:TRX00207,lblCardAccountNumber%>" runat="server" />
                            <it:FlowLabel ID="lblCardAccountNumber" Label="<%$FrontEndResources:TRX00207,lblCurrentAccount%>" runat="server" />
                            <it:FlowLabel ID="lblOldLimit" Label="<%$FrontEndResources:TRX00207,lblOldLimit%>" runat="server" />
                            <it:CurrencyTextBoxControlAuto ID="txtNewLimit" IsRequired="true" ValidateWithAccountBalance="true"
                                ShowCurrency="true" AllowValuesUnderOne="true"
                                MaxLength="23" ValidationRequiredMessage="<%$FrontEndResources:TRX00207,txtNewLimitValidationRequiredMessage %>"
                                ValidationInvalidInputMessage="<%$FrontEndResources:TRX00207,txtNewLimitValidationInvalidInputMessage %>"
                                Label="<%$FrontEndResources:TRX00207,txtNewLimit%>" runat="server" />

                        </div>
                    </it:FlowInnerContainer>
                    <asp:HiddenField ID="hdnIsCredit" runat="server" />
                </asp:Panel>
            </div>
            <div class="clearBoth"></div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00207-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
