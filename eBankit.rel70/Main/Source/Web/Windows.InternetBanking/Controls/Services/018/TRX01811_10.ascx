<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01811_10.ascx.cs" Inherits="TRX01811_10" %>
<%@ Register Src="~/Controls/Bulk/EbankitBulkDetailControl.ascx" TagPrefix="it" TagName="EbankitBulkDetailControl" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
    <div class="clearBoth"></div>
    <br />
    <section class="section-warning content-message metro">
        <div class="stPosition col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max clearPadding">
            <div id="MainContent_TransactionMainContent_divMessage" class="alert alert-warning_v2 fade in widthInherit">
                <h4 class="alert-heading div-warning_v2">
                    <asp:Label runat="server" ID="divGroup" Text='<%$FrontEndResources:transactionBulk,checkoutExplanationMessage%>' />
                </h4>
                <div class="clearBoth"></div>
            </div>
        </div>
    </section>

    <it:FlowInnerContainer ID="flwReason" Title="<%$FrontEndResources:TRX01811,ReasonTitle %>" CustomCssClass="bs-reduced bs-head-metro bs-reduced-transaction reasonWordBreak" runat="server" role="button" aria-pressed="false">
        <div>
            <div class="field break">
                <span class="metro label-left">
                    <asp:Literal runat="server" ID="Reasonlbl" Text='<%$FrontEndResources:TRX01811,ReasonLabel%>'></asp:Literal>
                </span>
                <asp:Label runat="server" ID="Reasonvalue" CssClass="label-right"></asp:Label>
            <div class="clearBoth"></div>
            </div>
        </div>
    </it:FlowInnerContainer>
    <it:FlowInnerContainer ID="FlwOperations" Title="<%$FrontEndResources:TRX01811,Operations %>" CustomCssClass="bs-reduced bs-head-metro" runat="server">

        <asp:Panel ID="Panel1" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
            <it:EbankitBulkDetailControl runat="server" ID="ebankitBulkDetailControl" />
            <div class="clearBoth"></div>
        </asp:Panel>
    </it:FlowInnerContainer>
</asp:Panel>
<asp:Panel ID="pnSchedules" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
    <div class="clearBoth"></div>
</asp:Panel>
<div class="clearBoth"></div>
