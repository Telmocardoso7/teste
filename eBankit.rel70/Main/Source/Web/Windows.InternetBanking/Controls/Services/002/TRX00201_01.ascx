<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00201_01.ascx.cs" Inherits="TRX00201_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <it:DataListControl ID="dataListUser"
        ResourceKey="Statements"
        SortingData="true"
		IsGeneric="true"
        MethodName="GetCardTransactionsGeneric"
        ItemClassName="CoreCardTransaction"
        ItemClassNamespace="eBankit.Business.Entities.Banking.Card"
        ItemClassDll="eBankit.Business.Entities.Banking"
        CssClass="table-resp-to1199 noarrow"
        runat="server" />
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
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00201-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
