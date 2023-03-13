<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01017_01.ascx.cs" Inherits="TRX01017_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div style="margin-right: 50px; margin-left: 50px; margin-bottom: 25px;"></div>
    <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12" Style="padding: 10px 0px; padding-left: 30px; min-height: 250px" runat="server">
    </asp:Panel>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01017-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
