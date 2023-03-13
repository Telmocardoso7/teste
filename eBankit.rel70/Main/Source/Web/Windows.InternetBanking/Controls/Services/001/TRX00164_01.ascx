<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00164_01.ascx.cs" Inherits="TRX00164_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div class="panel-favorit popup" style="border: 0;">
        <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12" Style="padding: 10px 30px; min-height: 300px; border-bottom:2px solid @brand-primary" runat="server">
            <div class="clearBoth"></div>
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
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00164-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>