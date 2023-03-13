<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00107_01.ascx.cs" Inherits="TRX00107_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content accountDetail" style="margin: 60px 0px;">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                <it:FlowInnerContainer ID="flwContainer" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div>
                        <%--<it:FlowLabel_v3 ID="flwNib" ShowToolTipLikeHelp="true" ToolTipKey="flwNib" Label="<%$FrontEndResources:TRX00107,flwNib%>" runat="server" />--%>
                        <it:FlowLabel_v3 ID="flwIBAN" ShowToolTipLikeHelp="true" ToolTipKey="flwIBAN" Label="<%$FrontEndResources:TRX00107,flwIBAN%>" runat="server" />
                        <it:FlowLabel_v3 ID="flwSWIFT" ShowToolTipLikeHelp="true" ToolTipKey="flwSWIFT" Label="<%$FrontEndResources:TRX00107,flwSWIFT%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>
                <div class="clearBoth"></div>
                <div class="proof-inner">
                    <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
                </div>
                <div class="clearBoth"></div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00107-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
