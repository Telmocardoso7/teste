<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01801_20.ascx.cs" Inherits="TRX01801_20" %>
<%@ Register Src="~/Controls/Bulk/EbankitBulkDetailControl.ascx" TagPrefix="it" TagName="EbankitBulkDetailControl" %>
<%@ Register Src="~/Controls/Cart/EbankitCartResultDetailControl.ascx" TagPrefix="it" TagName="EbankitCartDetailControl" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="proof-inner">
    <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
</div>

<div class="bulk-header col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-head-metro">
    <div tabindex="0" role="button" aria-pressed="false">
        <h3 class="head">
            <asp:Literal runat="server" ID="lblTransactDetails" Text='<%$FrontEndResources:TRX01801,TransactionDetails%>'></asp:Literal>
        </h3>

        <div class="bulk-container">
            <div class="transaction transaction-group-counter">
                <span class="lbl-resource">
                    <asp:Literal runat="server" ID="lblTransactIncludes" Text='<%$FrontEndResources:TRX01801,TransactionsIncluded%>'></asp:Literal>
                </span>
                <asp:Label runat="server" ID="lblTotalTrx" CssClass="lbl-total"></asp:Label>
            </div>
        </div>
    </div>
    <it:FlowInnerContainer ID="FlwExecuted" Title="<%$FrontEndResources:TRX01801,TransactionsList %>" CustomCssClass="bs-reduced bs-head-metro" runat="server">
        <div>
            <it:EbankitBulkDetailControl runat="server" ID="ebankitBulkDetailControl" />
            <div class="clearBoth"></div>
        </div>
    </it:FlowInnerContainer>

    <it:FlowInnerContainer ID="FlwNotExecuted" Title="<%$FrontEndResources:TRX01801,TransactionsNotExecuted %>" CustomCssClass="cart-wrapper bs-reduced bs-head-metro" runat="server">
        <div>
            <it:EbankitCartDetailControl runat="server" ID="ecdNotExecuted" />
            <div class="clearBoth"></div>
        </div>
    </it:FlowInnerContainer>
</div>
<asp:Panel ID="pnSchedules" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
    <div class="clearBoth"></div>
</asp:Panel>
<div class="inprint" style="margin-top: 20px;">
    <asp:Label ID="lblOperationID" runat="server"></asp:Label>
    <asp:Label ID="lblPrintDate" Style="display: block; margin-top: 10px;" runat="server"></asp:Label>
</div>
<div class="clearBoth"></div>

<asp:HiddenField ID="hdnFavoritImageId" runat="server" />
<asp:HiddenField ID="hdnFavoritBenef" runat="server" />

<script type="text/javascript">
    eBankit.Presentation.ResultControl = {};

    eBankit.Presentation.ResultControl.ToogleExecuteType = function (divId, status) {
        var div = $("#" + divId);
        if (status == 1) {
            div.show();
        }
        else {
            div.hide();
        }
    }
</script>
