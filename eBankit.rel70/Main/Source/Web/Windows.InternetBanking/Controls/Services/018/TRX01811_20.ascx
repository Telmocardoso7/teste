<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01811_20.ascx.cs" Inherits="TRX01811_20" %>
<%@ Register Src="~/Controls/Bulk/EbankitBulkDetailControl.ascx" TagPrefix="it" TagName="EbankitBulkDetailControl" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="proof-inner">
    <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
</div>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding">
    
    <it:FlowInnerContainer ID="OperationDetails" Title="<%$FrontEndResources:TRX01811,OperationDetails %>" CustomCssClass="bs-reduced bs-head-metro bs-reduced-transaction reasonWordBreak" runat="server" role="button" aria-pressed="false">
        <div>
            <div class="field break" style="width:auto">
                <span class="metro label-left">
                    <asp:Literal runat="server" ID="lblTransactIncludes"  Text='<%$FrontEndResources:TRX01811,OperationsIncluded%>'></asp:Literal>
                </span>            
                <asp:Label runat="server" ID="lblTotalTrx" CssClass="lbl-total"></asp:Label>
            </div>
            <div class="clearBoth"></div>
            <div id="divReason" class="field break" style="width:auto" runat="server">
                <span class="metro label-left">
                    <asp:Literal runat="server" ID="Reasonlbl" Text='<%$FrontEndResources:TRX01811,ReasonLabel%>'></asp:Literal>
                </span>
                <asp:Label runat="server" ID="Reasonvalue" CssClass="label-right"></asp:Label>
            <div class="clearBoth"></div>
            </div>
            
        </div>
    </it:FlowInnerContainer>

    <it:FlowInnerContainer ID="FlowInnerContainer1" Title="<%$FrontEndResources:TRX01811,Operations %>" CustomCssClass="bs-reduced bs-head-metro" runat="server" role="button" aria-pressed="false">

        <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
            <it:EbankitBulkDetailControl runat="server" ID="ebankitBulkDetailControl" />
            <div class="clearBoth"></div>
        </asp:Panel>
    </it:FlowInnerContainer>
</div>
<div class="clearBoth"></div>
