<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitBulkDetailControl.ascx.cs" Inherits="EbankitBulkDetailControl" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Import Namespace="eBankit.Common" %>
<%@ Import Namespace="eBankit.Common.Extensions" %>


<div class="bulk-container">

    <asp:ListView ID="rptT" runat="server" ItemPlaceholderID="ItemsDiv" OnItemDataBound="rptT_ItemDataBound" DataKeyNames="TransactionId">

        <LayoutTemplate>
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                <div runat="server" id="ItemsDiv">
                </div>
            </div>
        </LayoutTemplate>

        <ItemTemplate>
            <div class="transaction">
                <div id="divBulkItemRow" class="details-transaction row " runat="server" tabindex="0">
                    <div class="col-xs-12 col-sm-12 col-md-1 col-lg-1">
                        <div id="transactionIcon" runat="server" class="bulk-transaction-icon ">
                             <asp:Image runat="server" ID="imgOpType"></asp:Image>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 text-truncate ">
                        <div>
                            <p class="key">
                                <asp:Literal ID="Literal3" runat="server" Text=' <%# Eval("TransactionDescription") %>' />
                            </p>
                            <p>
                                <asp:Literal ID="AccountNumber" runat="server" Text=' <%# Eval("AccountNumber") %>' />
                            </p>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 text-truncate ">
                        <p class="key">
                            <asp:Literal ID="Amount" runat="server" Text='<%$FrontEndResources:TRX01811,Amount%>' />
                        </p>
                        <p>
                            <asp:Literal ID="TransactionValue" runat="server" Text='<%# Convert.ToDecimal(Eval("TransactionValue")).ToCurrencyFormat(Convert.ToString(Eval("TransactionCurrency"))) %>' />
                        </p>
                    </div>

                    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 text-truncate " runat="server" id="OperationExpireDate">
                        <p class="key">
                            <asp:Literal ID="Literal4" runat="server" Text='<%$FrontEndResources:TRX01811,ExpirationDate%>' />
                        </p>
                        <p class="text-truncate">
                            <asp:Literal ID="Literal7" runat="server" Text=' <%# Eval("ExpirationDate") %>' />
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 text-truncate " runat="server" id="OperationStatus">
                        <p class="key">
                            <asp:Literal ID="Literal1" runat="server" Text='<%$FrontEndResources:TRX01811,OperationStatus%>' />
                        </p>
                        <p class="text-truncate">
                            <asp:Literal ID="Literal2" runat="server" Text=' <%# Eval("OperationStatusDescription") %>' />
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-1 col-lg-1 " style="position: absolute;right:0;">
                        <p class="action-buttons">
                            <div class="action-view-details" runat="server" id="pnDetailsButton" tabindex="0" role="button"></div>
                        </p>
                    </div>

                </div>
                <div id="pnControls" cssclass="label-left" runat="server">
                    <div class="clearBoth"></div>
                </div>
            </div>
        </ItemTemplate>

    </asp:ListView>

</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('div[id*=pnDetailsButton_]').on('keydown', function (e) {
            if (e.keyCode === 32) {
                e.preventDefault();
                $(this).click();
            }
        });

        $('div[id*=pnDetailsButton_]').each(function (index) {
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
<link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01811-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
