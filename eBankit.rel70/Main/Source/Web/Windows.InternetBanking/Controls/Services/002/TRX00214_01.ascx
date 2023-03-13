<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00214_01.ascx.cs" Inherits="TRX00214_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divTransaction" class="transaction-content" runat="server">
    <it:DataListControl ID="dataListUser"
        ResourceKey="Statements"
        SortingData="true"
        MethodName="GetAccountTransactions"
        ItemClassName="CoreAccountTransaction"
        ItemClassNamespace="eBankit.Business.Entities.Banking.Account"
        ItemClassDll="eBankit.Business.Entities.Banking"
        CssClass="table-resp-to1199 table-movements"
        runat="server" />
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00214-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $(".trx-container").on("click", ".table-movements tr", function () {
            var spliter = $(this).children("td").children("input[type=hidden]").val().split("|");
            itcore_ui.ShowTopPopupIframe(spliter[0], spliter[1], '', false);
        });
    });
</script>
