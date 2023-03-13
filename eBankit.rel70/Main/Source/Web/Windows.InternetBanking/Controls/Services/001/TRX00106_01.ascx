<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00106_01.ascx.cs" Inherits="TRX00106_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="divContent" runat="server" class="transaction-content accountDetail marginBottom10">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                <it:FlowInnerContainer ID="flwContainer" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX00106,litCharacteristics%>" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="flwAccountName" Label="<%$FrontEndResources:TRX00106,litAccountName%>" runat="server" />
                        <it:FlowLabel_v3 ID="flwAccountNumber" Label="<%$FrontEndResources:TRX00106,litAccountNumber%>" runat="server" />
                        <%--<it:FlowLabel_v3 ID="flwNib" ShowToolTipLikeHelp="true" ToolTipKey="flwNib" Label="<%$FrontEndResources:TRX00106,flwNib%>" runat="server" />--%>
                        <it:FlowLabel_v3 ID="flwIBAN" ShowToolTipLikeHelp="true" ToolTipKey="flwIBAN" Label="<%$FrontEndResources:TRX00106,flwIBAN%>" runat="server" />
                        <it:FlowLabel_v3 ID="flwSWIFT" ShowToolTipLikeHelp="true" ToolTipKey="flwSWIFT" Label="<%$FrontEndResources:TRX00106,flwSWIFT%>" runat="server" />
                        <it:FlowLabel_v3 ID="flwBranchName" Label="<%$FrontEndResources:TRX00106,litBranchName%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>
                <it:FlowInnerContainer ID="flwContainerBalance" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX00106,litBalanceTitle%>" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="flwBalance" ShowToolTipLikeHelp="true" ToolTipKey="flwBalance" Label="<%$FrontEndResources:TRX00106,litBalance%>" runat="server" />
                        <it:FlowLabel_v3 ID="flwAvailableBalance" ShowToolTipLikeHelp="true" ToolTipKey="flwAvailableBalance" Label="<%$FrontEndResources:TRX00106,litAvailableBalance%>" runat="server" />
                           <%-- <it:FlowLabel_v3 ID="flwDebitCaptive" Label="<%$FrontEndResources:TRX00106,litDebitCaptive%>" runat="server" />
                            <it:FlowLabel_v3 ID="flwCrebitCaptive" Label="<%$FrontEndResources:TRX00106,litCrebitCaptive%>" runat="server" />
                            <it:FlowLabel_v3 ID="flwDiscoverLimit" Label="<%$FrontEndResources:TRX00106,litDiscoverLimit%>" runat="server" />
                            <it:FlowLabel_v3 ID="flwMinBalance" Label="<%$FrontEndResources:TRX00106,litMinBalance%>" runat="server" />
                            <it:FlowLabel_v3 ID="flwAverage" Label="<%$FrontEndResources:TRX00106,litAverage%>" runat="server" />--%>
                    </div>
                </it:FlowInnerContainer>
                <div class="clearBoth"></div>
                <div class="proof-inner">
                    <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
                </div>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="clearBoth"></div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00106-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
