<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00219_01.ascx.cs" Inherits="TRX00219_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divTransaction" class="transaction-content" style="margin-bottom: 10px;" runat="server">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                <it:FlowInnerContainer ID="flwContainer" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="lblCardName" Label="<%$FrontEndResources:TRX00202,lblCardName%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblCardNumber" Label="<%$FrontEndResources:TRX00202,lblCardNumber%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblSituation" Label="<%$FrontEndResources:TRX00202,lblSituation%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblEmitionDate" Label="<%$FrontEndResources:TRX00202,lblValidfrom%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblExpirationDayMonth" Label="<%$FrontEndResources:TRX00202,lblExpirationDayMonth%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblMinimumPayment" Label="<%$FrontEndResources:TRX00202,lblMinimumPayment%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>
                <it:FlowInnerContainer ID="flwContainerCurrentAccount" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX00301,litCurrentCharacteristics%>" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="lblCurrentAccountNumber" Label="<%$FrontEndResources:TRX00202,lblAssociatedCardAccount%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblCurrentAccountCurrency" Label="<%$FrontEndResources:TRX00202,lblCurrency%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>
                <it:FlowInnerContainer ID="flwContainerCardAccount" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX00301,litCardCharacteristics%>" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="lblCardAccountNumber" Label="<%$FrontEndResources:TRX00202,lblCardAccountNumber%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>
                <it:FlowInnerContainer ID="flwContainerBalance" Visible="false" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX00301,litBalanceTitle%>" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="lblLimit" Label="<%$FrontEndResources:TRX00202,lblLimit%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblBalance" Label="<%$FrontEndResources:TRX00202,lblBalance%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblAvailabaleBalance" Label="<%$FrontEndResources:TRX00202,lblAvailabaleBalance%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblPendentOperations" Label="<%$FrontEndResources:TRX00202,lblPendentOperations%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblCurrency" Label="<%$FrontEndResources:TRX00202,lblCurrency%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>
                <div class="clearBoth"></div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="clearBoth"></div>
    <div class="proof-inner">
        <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
    </div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00219-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
