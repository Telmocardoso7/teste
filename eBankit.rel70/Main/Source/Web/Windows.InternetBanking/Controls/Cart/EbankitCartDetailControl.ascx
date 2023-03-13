<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitCartDetailControl.ascx.cs" Inherits="EbankitCartDetailControl" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Import Namespace="eBankit.Common" %>
<%@ Import Namespace="eBankit.Common.Extensions" %>

<div class="cart-container">

    <asp:ListView ID="rptT" runat="server" ItemPlaceholderID="ItemsDiv" OnItemDataBound="rptT_ItemDataBound" DataKeyNames="CartTransactionItemId">

        <LayoutTemplate>
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                <div runat="server" id="ItemsDiv">
                </div>
            </div>
        </LayoutTemplate>

        <ItemTemplate>
            <div class="transaction">
                <div id="divCartItemRow" class="details-transaction row " runat="server" tabindex="0">
                    <div class="col-md-1 col-sm-1 col-xs-3 ">
                        <div id="transactionIcon" runat="server" class="cart-transaction-icon ">
                            <img id="imgCartOperationType" runat="server">
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-8 col-xs-7 text-truncate ">
                        <p class="key">
                            <asp:Literal ID="litTransactionName" runat="server" Text=' <%# Eval("TransactionTitle") %>' />
                        </p>
                        <p>
                            <asp:Literal ID="transactionDescription" runat="server" Text=' <%# Eval("TransactionDescription") %>' />
                        </p>
                    </div>
                    <div class="col-md-3 col-sm-3 text-truncate ">
                        <p class="key">
                            <asp:Literal ID="Literal3" runat="server" Text='<%$FrontEndResources:TRX01801,inAccount%>' />
                        </p>
                        <p class="text-truncate">

                            <asp:Literal ID="Literal5" runat="server" Text=' <%# Eval("SourceAccount") %>' />
                        </p>
                    </div>
                    <div class="col-md-2 col-sm-2 text-truncate  ">
                        <p class="key">
                            <asp:Literal ID="Literal2" runat="server" Text='<%$FrontEndResources:TRX01801,Amount%>' />
                        </p>
                        <p>
                            <asp:Literal ID="Label3" runat="server" Text='<%# Convert.ToDecimal(Eval("TransactionValue")).ToCurrencyFormat(Convert.ToString(Eval("TransactionCurrency"))) %>' />
                        </p>
                    </div>
                    <div class="col-md-2 col-sm-2 text-truncate  ">
                        <p class="key">
                            <asp:Literal ID="Literal7" runat="server" Text='<%$FrontEndResources:TRX01801,AddedOn%>' />
                        </p>
                        <p>
                            <asp:Literal ID="Literal4" runat="server" Text=' <%# ((DateTime)Eval("Created")).ToString(this.DateFormatConf) %>' />
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-1 col-lg-1 ">
                        <p class="action-buttons">
                            <div class="action-view-expand" runat="server" id="pnCartDetailsButton" tabindex="0" role="button"></div>
                        </p>
                    </div>
                </div>

                <div id="pnControls" cssclass="label-left" runat="server">
                    <div class="clearBoth"></div>
                </div>
            </div>
        </ItemTemplate>

    </asp:ListView>
    <script type="text/javascript">
        $(document).ready(function () {

            $('img[id*=imgCartOperationType_]').attr('alt', '');
            $('div[id*=pnCartDetailsButton_]').on('keydown', function (e) {
                if (e.keyCode === 32) {
                    e.preventDefault();
                    $(this).click();
                }
            });

            $('div[id*=pnCartDetailsButton_]').each(function (index) {
                var ariaLabel = "";
                $(this).parent().siblings('div').find('p').each(function (index) {
                    var thisP = $(this)[0];

                    if (thisP.className === "key") {
                        ariaLabel += thisP.innerText + ": ";
                    }
                    else {
                        ariaLabel += thisP.innerText + ". ";
                    }
                });
                $(this)[0].ariaLabel = ariaLabel;
            });
        });
    </script>
</div>

<link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01801-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
<link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01811-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
