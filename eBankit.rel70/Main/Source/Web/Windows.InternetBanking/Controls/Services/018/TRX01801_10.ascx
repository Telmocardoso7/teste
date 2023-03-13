<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01801_10.ascx.cs" Inherits="TRX01801_10" %>
<%@ Register Src="~/Controls/Cart/EbankitCartDetailControl.ascx" TagPrefix="it" TagName="EbankitCartDetailControl" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>


<asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding " runat="server">
    <div class="clearBoth"></div>

    <section class="section-warning content-message metro">
        <div class="stPosition col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max clearPadding">
            <div id="MainContent_TransactionMainContent_divMessage" class="alert alert-warning_v2 fade in widthInherit">
                <h4 class="alert-heading div-warning_v2">
                    <asp:Label runat="server" ID="divGroup" Text='<%$FrontEndResources:transactionCart,checkoutExplanationMessage%>' />
                </h4>
                <div class="clearBoth"></div>
            </div>
        </div>
    </section>

    <div class="clearBoth"></div>

    <it:EbankitCartDetailControl runat="server" id="ebankitCartDetailControl" />
</asp:Panel>
<asp:Panel ID="pnSchedules" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
    <div class="clearBoth"></div>
</asp:Panel>
<div class="clearBoth"></div>

   

