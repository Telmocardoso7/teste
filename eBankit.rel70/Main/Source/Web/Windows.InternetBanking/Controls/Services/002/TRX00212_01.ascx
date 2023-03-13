<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00212_01.ascx.cs" Inherits="TRX00212_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divTransaction" class="transaction-content" runat="server">
    <it:DataListControl ID="dataListUser"
        ResourceKey="Statements"
        SortingData="true"
        MethodName="GetCardTransactions"
        ItemClassName="CoreCardTransaction"
        ItemClassNamespace="eBankit.Business.Entities.Banking.Card"
        ItemClassDll="eBankit.Business.Entities.Banking"
        CssClass="table-resp-to1199 card-movements noarrow"
        runat="server" />
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00212-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $(".trx-container").on("click", ".card-movements tr", function () {
            var spliter = $(this).children("td").children("input[type=hidden]").val().split("|");
            itcore_ui.ShowTopPopupIframe(spliter[0], spliter[1], '', false);
        });
    });
</script>
<script type="text/javascript">
    function showOperations(e) {
        $("#benefsTabContent #favorit").hide();
        $(".col-transaction").hide();
        $("#benefsTabContent #operations").show();
        $("#benefsTabContent").show();
        $(".tabSelectorBackground .tabActive").removeClass("tabActive");
        $(".tabSelectorBackground .tabCardOperacoesDisponiveis").addClass("tabActive");
        $(".head.head-top").html(e.attr("data-title"));
    }
</script>
