<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00102_01.ascx.cs" Inherits="TRX00102_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="divContent" runat="server">
    <div class="panel-favorit popup" style="border: 0;">
        <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12" Style="padding: 10px 30px; min-height: 300px; border-bottom:2px solid @brand-primary" runat="server">
            <div class="bs-reduced-v2 bs-head-metro bs-popup transp">
                <div id="pnControlsFields" runat="server">

                    <it:FlowLabel_v2 ID="flwDate" runat="server" Label="<%$FrontEndResources:TRX00102,flwDate %>" />
                    <it:FlowLabel_v2 ID="flwOrderNumber" runat="server" Label="<%$FrontEndResources:TRX00102,flwOrderNumber %>" />
                    <it:FlowLabel_v2 ID="flwDocumentNumber" runat="server" Label="<%$FrontEndResources:TRX00102,flwDocumentNumber %>" />
                    <it:FlowLabel_v2 ID="flwDescription" runat="server" Label="<%$FrontEndResources:TRX00102,flwDescription %>" />
                    <it:FlowLabel_v2 ID="flwFormatedValue" runat="server" Label="<%$FrontEndResources:TRX00102,flwFormatedValue %>" />
                    <it:FlowLabel_v2 ID="flwFormatedValueAfterTransaction" runat="server" Label="<%$FrontEndResources:TRX00102,flwFormatedValueAfterTransaction %>" />           
                    <it:FlowLabel_v2 ID="flwValueDate" runat="server" Label="<%$FrontEndResources:TRX00102,flwValueDate %>" />
                    <it:FlowLabel_v2 ID="flwExtractDate" runat="server" Label="<%$FrontEndResources:TRX00102,flwExtractDate %>" />
                    <it:FlowLabel_v2 ID="flwNumberOperation" runat="server" Label="<%$FrontEndResources:TRX00102,flwNumberOperation %>" />

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
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00102-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
