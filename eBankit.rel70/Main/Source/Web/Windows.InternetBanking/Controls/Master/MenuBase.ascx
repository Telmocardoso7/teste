<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuBase.ascx.cs" Inherits="MenuBase" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="menuContainer">
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("jquery.selectbox.js".ResolveJsUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("ebankit-menu.css".ResolveCssUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <it:TransactionMenus ID="transactionMenus" runat="server" />
</div>
