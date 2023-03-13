<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX02103_01.ascx.cs" Inherits="TRX02103_01" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="div1" runat="server" class="transaction-content">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                <it:DataListExternalAccountsControl ID="dataListUser"
                    ResourceKey="Statements"
                    SortingData="true"
                    ShowStatementTypeSelect="false"
                    ShowImageCommand="true"
                    IsGeneric="true"
                    CssClass="table-resp-to1199 table-movements"
                    runat="server" />
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript"> 
        $(document).ready(function () {
            $(".trx-container").on("click", ".table-movements tr td", function () {
                event.preventDefault();
                var spliter = $(this).siblings().children("input[type=hidden]").val().split("|");
                itcore_ui.ShowTopPopupIframe(spliter[0], spliter[1], '', false);
            });
        });
    </script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX02103-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
