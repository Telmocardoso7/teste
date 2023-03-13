<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00501_01.ascx.cs" Inherits="TRX00501_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divTransaction" class="transaction-content" runat="server">
    <div class="clearBoth"></div>
    <asp:Repeater ID="rptAccounts" runat="server" OnItemDataBound="rptAccounts_ItemDataBound">
        <ItemTemplate>
            <div style="display: block; width: 100%; border-top: 3px solid #EEE;">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max listItemContainer clearPadding" style="padding: 45px 0px;">
                    <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 content-body fullWidth">
                        <section>
                            <div class="col-lg-12 col-left clearPadding">
                                <span>
                                    <div class="trx-container">

                                        <div class="product-list">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding">
                                                <div class=" account">
                                                    <asp:HiddenField ID="hidAccountNumber" runat="server" />
                                                    <div class="pull-left col-xs-6 col-sm-6 col-md-4 col-lg-4 content-accounts flLeft clearPadding">
                                                        <div class="scroll-item-icon">
                                                            <span class="img-icon-loan"></span>
                                                        </div>
                                                        <h4 class="accounts-name">
                                                            <asp:Literal ID="litAccountName" runat="server"></asp:Literal></h4>
                                                        <p class="accountNumber marginTop10 noMarginLeft">
                                                            <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal>
                                                        </p>
                                                    </div>
                                                    <div class="pull-left hidden-xs hidden-sm col-md-3 col-lg-3 favorit-first_v2">
                                                        <p class="accounts-panel-p textAlignLeft">
                                                            <asp:Literal ID="litAvailableBalance" Text="<%$FrontEndResources:TRX00131,litExpDate%>" runat="server"></asp:Literal>
                                                        </p>
                                                        <h3 class="favorit-center accounts-panel-h field-tooltip" data-toggle="tooltip" data-placement="top" id="hAvailableBalance" runat="server">
                                                            <asp:Literal ID="litNextPaymentDate" runat="server"></asp:Literal>
                                                        </h3>
                                                    </div>
                                                    <div class="pull-left col-xs-6 col-sm-6 col-md-3 col-lg-3 favorit-first_v2">
                                                        <p class="accounts-panel-p">
                                                            <asp:Literal ID="litBalance" Text="<%$FrontEndResources:TRX00501,RemainingBalanceTitle%>" runat="server"></asp:Literal>
                                                        </p>
                                                        <h3 class="favorit-center accounts-panel-h field-tooltip" data-toggle="tooltip" data-placement="top" id="hBalance" runat="server">
                                                            <asp:Literal ID="litRemainingBalance" runat="server"></asp:Literal>
                                                            <asp:Label ID="litAvailableBalanceValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                        </h3>
                                                    </div>
                                                    <div class="col-md-2 col-lg-2 content-accounts" style="text-align: right; padding-top: 8px;">
                                                        <asp:LinkButton NavigateUrl="#" ID="aOpenDetail" runat="server" CssClass="accountExpandicon"></asp:LinkButton>
                                                    </div>
                                                    <div class="clearBoth"></div>
                                                    <div class="nav-bottons col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0px 0px; margin-top: 0px; display: none;">
                                                        <div class="box-grey">
                                                            <div class="content-accounts">
                                                                <div class="scroll-item-icon" style="border-bottom-left-radius: 5px; border-top-left-radius: 0px; margin-top: -1px; margin-left: 0px; margin-right: 10px; border-bottom: 0; float: left">
                                                                    <span class="img-icon-accounts metro" style="margin-bottom: 6px; background-image: none !important;"><i id="icoFavoriteAccount" class="icon-star-4" visible="false" runat="server"></i></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <ul class="nav nav-pills pull-right links hidden">
                                                            <li>
                                                                <span id="aAccountDetail" style="padding: 15px 30px 15px 15px; color: rgb(163, 0, 51)" runat="server">
                                                                    <asp:Literal ID="litAccountDetail" Text="<%$FrontEndResources:TRX00501,AccountLoanDetail %>" runat="server"></asp:Literal>
                                                                </span>
                                                            </li>
                                                        </ul>
                                                        <div class="clearBoth"></div>
                                                    </div>
                                                    <div class="clearBoth"></div>
                                                </div>
                                                <div id="accountData" runat="server" class="tableWrapper" hidden="hidden"></div>
                                            </div>
                                        </div>
                                    </div>
                                </span>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
            <div class="clearBoth"></div>
        </ItemTemplate>
        <FooterTemplate>
            <div style="display: block; width: 100%; border-top: 3px solid #EEE;">
                <div class="col-lg-2 col-md-1 visible-lg visible-md col-max" style="height: 80px; padding: 0px;"></div>
            </div>
            <div class="clearBoth"></div>
        </FooterTemplate>
    </asp:Repeater>
    <div class="clearBoth"></div>
    <script type="text/javascript">
    var IDs = new Array;

    function showHideTable_custom(event) {
        var id = $(this).data('id');
        var table = $('.tableWrapper[data-id=' + id + ']');

        $(".tableWrapper").slideUp('fast'); //Hidding tables
        $('button').find("i").removeClass().addClass("glyphicon glyphicon-plus");
        //$('.accountWrapper').removeClass("accountActive");

        if (table.length > 0 && !table.is(':visible')) {
            table.slideDown('fast');
            //$(this).closest($('.accountWrapper')).addClass("accountActive");
            $('button[data-id=' + id + ']').find("i").toggleClass("glyphicon-plus glyphicon-minus");
            if (!include(IDs, id)) {
                IDs.push(id);
                return true;
            }
        }

        event.preventDefault();
        IDs.push(id);

        return false;
    }

    function include(arr, obj) {
        return (arr.indexOf(obj) != -1);
    }

    GoToAccountDetail = function (number) {
        eBankit.Presentation.SetBlockPageCommon();
        $('body').block();
        eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00502<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
    }

    GoToAccountManager = function (number) {
        //
    }

    //GoToAccountStatements = function (number) {
    //    eBankit.Presentation.SetBlockPageCommon();
    //    $('body').block();
    //    eBankit.document.location.href = '#';
    //}


    $(document).ready(function () {
        CreateTooltip();
    });

    EndPageRequest = function () {
        CreateTooltip();
    }

    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndPageRequest);

    CreateTooltip = function () {
        $(".accounts-panel-h").tooltip({
            html: true,
        });
    };


</script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00501-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
