<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01006_01.ascx.cs" Inherits="TRX01006_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div style="border-top: 1px @brand-primary solid; margin-right: 50px; margin-left: 50px; margin-bottom: 25px;"></div>
    <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
        <it:FlowInnerContainer ID="flwContainer" CustomCssClass="col-max bs-reduced bs-head-metro bs-popup" HideTitle="true" Title="<%$FrontEndResources:TRX01006,litCharacteristics%>" runat="server">
            <div>
                <it:FlowLabel_v3 ID="txtUserName" Label="<%$FrontEndResources:TRX01005,txtUserName%>" runat="server" />
                <it:FlowLabel_v3 ID="txtCodUtilizador" Label="<%$FrontEndResources:TRX01005,txtCodUtilizador%>" runat="server" />
                <it:FlowLabel_v3 ID="txtDescricaoUtilizador" Label="<%$FrontEndResources:TRX01005,txtDescricaoUtilizador%>" runat="server" />
                <it:FlowLabel_v3 ID="txtStatus" Label="<%$FrontEndResources:TRX01005,Status%>" runat="server" />
                <it:FlowLabel_v3 ID="txtProfile" Label="<%$FrontEndResources:TRX01005,Profile%>" runat="server" />
                <it:FlowLabel_v3 ID="txtLastDate" Label="<%$FrontEndResources:TRX01005,LastDate%>" runat="server" />
                <div class="clearBoth"></div>
            </div>
        </it:FlowInnerContainer>
        <div class="clearBoth"></div>
    </asp:Panel>
    <div class="clearBoth"></div>
    <div class="proof-inner">
        <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
    </div>
    <div class="inprint" style="margin-top: 20px;">
        <asp:Label ID="lblOperationID" runat="server"></asp:Label>
        <asp:Label ID="lblPrintDate" Style="display: block; margin-top: 10px;" runat="server"></asp:Label>
    </div>
    <div class="clearBoth"></div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01006-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>