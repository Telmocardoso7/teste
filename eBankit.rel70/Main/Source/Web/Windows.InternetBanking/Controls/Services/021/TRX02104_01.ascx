
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX02104_01.ascx.cs" Inherits="TRX02104_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="divContent" runat="server" class="transaction-content">
    <div class="panel-favorit popup" style="border: 0;">
        <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12" Style="padding: 10px 30px; min-height: 300px; border-bottom:2px solid @brand-primary" runat="server">
            <div class="bs-reduced-v2 bs-head-metro bs-popup transp">
                <div id="pnControlsFields" runat="server">
                    <it:FlowLabel_v2 ID="flwTransactionDate" runat="server" Label="<%$FrontEndResources:TRX02104,flwTransactionDate %>" />
                    <it:FlowLabel_v2 ID="flwValueDate" runat="server" Label="<%$FrontEndResources:TRX02104,flwValueDate %>" />
                    <it:FlowLabel_v2 ID="flwTransactionID" runat="server" Label="<%$FrontEndResources:TRX02104,flwTransactionID %>" />
                    <it:FlowLabel_v2 ID="flwDescription" runat="server" Label="<%$FrontEndResources:TRX02104,flwDescription %>" />
                    <it:FlowLabel_v2 ID="flwAmount" runat="server" Label="<%$FrontEndResources:TRX02104,flwAmount %>" />
                    <it:FlowLabel_v2 ID="flwAccount" runat="server" Label="<%$FrontEndResources:TRX02104,flwSourceAccount %>" /> 
                </div>
            </div>
        </asp:Panel>
        <div class="clearBoth"></div>
        <div class="proof-inner proof-operations-details">
            <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
        </div>

        <div class="inprint" style="margin-top: 20px;">
            <asp:Label ID="lblOperationID" runat="server"></asp:Label>
            <asp:Label ID="lblPrintDate" Style="display: block; margin-top: 10px;" runat="server"></asp:Label>
        </div>

    </div>
    <div class="clearBoth"></div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX02104-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>