<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00301_01.ascx.cs" Inherits="TRX00301_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divTransaction" class="transaction-content" style="margin-bottom: 10px;" runat="server">
    <asp:UpdatePanel ID="udpPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                <it:FlowInnerContainer ID="flwContainer" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="lblAccountName" Label="<%$FrontEndResources:TRX00301,lblAccountName%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblAccountNumber" Label="<%$FrontEndResources:TRX00301,lblAccountNumber%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblAccountCurrency" Label="<%$FrontEndResources:TRX00301,lblAccountCurrency%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblBranch" Label="<%$FrontEndResources:TRX00301,lblBranch%>" runat="server" visible="false" />
                        <it:FlowLabel_v3 ID="lblBranchName" Label="<%$FrontEndResources:TRX00301,lblBranchName%>" runat="server" visible="false" />
                        <it:FlowLabel_v3 ID="lblStartDate" Label="<%$FrontEndResources:TRX00301,lblStartDate%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblMaturityDate" Label="<%$FrontEndResources:TRX00301,lblMaturityDate%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblMaturityDays" Label="<%$FrontEndResources:TRX00301,lblMaturityDays%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>

                <it:FlowInnerContainer ID="flwContainerInterest" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX00301,litInterest%>" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="lblInterestRate" Label="<%$FrontEndResources:TRX00301,lblInterestRate%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblInterestType" Label="<%$FrontEndResources:TRX00301,lblInterestType%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblCapitalizesInterest" Label="<%$FrontEndResources:TRX00301,lblCapitalizesInterest%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>

                <it:FlowInnerContainer ID="flwContainerBalance" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX00301,litBalance%>" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="lblStartBalance" Label="<%$FrontEndResources:TRX00301,lblStartBalance%>" runat="server" />
                        <%--<it:FlowLabel_v3 ID="lblTransferAtMaturity" Label="<%$FrontEndResources:TRX00301,lblTransferAtMaturity%>" runat="server" />--%>
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

    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00301-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
