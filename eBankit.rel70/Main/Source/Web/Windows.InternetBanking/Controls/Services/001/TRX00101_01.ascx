<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00101_01.ascx.cs" Inherits="TRX00101_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                <it:DataListControl ID="dataListUser"
                    ResourceKey="Statements"
                    SortingData="true"
                    ShowStatementTypeSelect="false"
                    ShowImageCommand="true"
                    HideDetailLink="true"
                    IsGeneric="true"
                    MethodName="GetAccountTransactionsGeneric"
                    ItemClassName="CoreAccountTransaction"
                    ItemClassNamespace="eBankit.Business.Entities.Banking.Account"
                    ItemClassDll="eBankit.Business.Entities.Banking"
                    CssClass="table-resp-to1199 table-movements"
                    runat="server" />
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript"> 
        $(document).ready(function () {
            $(".trx-container").on("click", ".table-movements tr td", function () {
                var spliter = $(this).siblings().children("input[type=hidden]").val().split("|");
                if ($(this).find(".icon-document").length == 0)
                    itcore_ui.ShowTopPopupIframe(spliter[0], spliter[1], '', false);
            });
            var searchTranslation = "<%=eBankit.Common.Globalization.Translate.GetTransactionString("AccountsControl","Search") %>";
            $('div[id=pnSearchHeader]').children('.img-search-panel').children('img').attr("title", searchTranslation);;
        });
        function pageLoad() {
            var searchTranslation = "<%=eBankit.Common.Globalization.Translate.GetTransactionString("AccountsControl","Search") %>";
            $('div[id=pnSearchHeader]').children('.img-search-panel').children('img').attr("title", searchTranslation);;
        } 
    </script>
    <script type="text/javascript" src="../../Scripts/Services/Transactions/TRX00101-1.0.js"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00101-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
