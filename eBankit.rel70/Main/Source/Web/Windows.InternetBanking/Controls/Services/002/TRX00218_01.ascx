<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00218_01.ascx.cs" Inherits="TRX00218_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContainer" class="transaction-content" runat="server">
    <it:FlowInnerContainer ID="flwCreditCards" CustomCssClass="col-max bs-reduced bs-head-metro" runat="server">
        <asp:Repeater ID="rptCreditCards" runat="server" OnItemDataBound="rptCreditCards_ItemDataBound">
            <ItemTemplate>
                <div style="display: block; width: 100%; border-top: 3px solid #EEE;">
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max listItemContainer clearPadding" style="padding: 45px 0px;">
                        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 content-body fullWidth">
                            <section>
                                <div class="col-lg-12 col-left clearPadding">
                                    <span>
                                        <div class="trx-container">
                                            <div class="product-list">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0;">
                                                    <div class=" account">
                                                        <asp:HiddenField ID="hidCCCardNumberCPP" runat="server" />
                                                        <div id="divCCSelectedCardCC" visible="false" runat="server">
                                                            <div class="arrow-corner">
                                                                <div class="metro"><i class="icon-star-3"></i></div>
                                                            </div>
                                                        </div>
                                                        <div id="PrepaidCards" class="hidden">
                                                            <button id="btnCAOpenTableCPP" runat="server" class="btn btn-DarkRed accountExpandicon" onserverclick="btnCAOpenTableCPP_ServerClick" onclick="if(showHideTableCC_custom.call(this,event))">
                                                                <i class="glyphicon glyphicon-arrow-down"></i>
                                                            </button>
                                                        </div>
                                                        <div class="col-xs-8 col-sm-8 col-md-4 col-lg-4 content-accounts col-xxs clearPadding">
                                                            <div class="scroll-item-icon">
                                                                <span class="img-icon-prepayd" id="imgIconCard" runat="server"></span>
                                                            </div>
                                                            <h4 class="accounts-name"  style="margin-top:-15px">
                                                                <asp:Literal ID="litCCCardName" runat="server"></asp:Literal></h4>
                                                            <p class="accountNumber">
                                                                <asp:Literal ID="litCCCardNumber" runat="server"></asp:Literal>
                                                            </p>
                                                            <p class="accounts-panel-p" style="margin-left: 0px;">
                                                                <span id="cardStatus" class="bulletStatus" style="margin-right: 4px;" runat="server"></span>
                                                                <asp:Label ID="litCCCardStatus" runat="server"></asp:Label>
                                                            </p>
                                                        </div>
                                                        <div class="pull-left col-xs-12 col-sm-3 col-md-3 col-lg-3 favorit-first_v2 col-sm-noBorder col-sm-noPaddingLeft sm-hidden saldoContabilistico">
                                                            <p class="accounts-panel-p">
                                                                <asp:Literal ID="litDCAvailableBalanceAOA" Text="<%$FrontEndResources:TRX00203,lblCardAccountAssociated%>" runat="server"></asp:Literal>
                                                            </p>
                                                            <h3 class="favorit-center accounts-panel-h" id="hCCPaymentDateCC" runat="server">
                                                                <asp:Literal ID="litCCPaymentDateValue" runat="server"></asp:Literal>
                                                            </h3>
                                                        </div>
                                                        <div class="pull-left col-xs-12 col-sm-3 col-md-3 col-lg-3 _v2 favorit-first_v2 col-xxs content-accounts saldoDisponivel">
                                                            <p class="accounts-panel-p">
                                                                <asp:Literal ID="litCCUsedBalance" Text="<%$FrontEndResources:TRX00203,litBalance2%>" runat="server"></asp:Literal>
                                                            </p>
                                                            <h3 class="favorit-center accounts-panel-h" id="hCCUsedBalanceCC" runat="server">
                                                                <asp:Literal ID="litLimitValue" runat="server"></asp:Literal>
                                                                <asp:Label ID="litLimitValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>

                                                            </h3>
                                                        </div>
                                                        <div class="col-md-2 col-lg-2 content-accounts" style="text-align: right;">
                                                            <div class="clearBoth"></div>
                                                            <asp:LinkButton NavigateUrl="#" ID="btnCancelCard" runat="server" CssClass="cancel-card-icon" OnClick="btnCancelCard_Click" style="display: inline-flex;"></asp:LinkButton>
                                                            <asp:LinkButton NavigateUrl="#" ID="aCCOpenTableCPP" runat="server" OnClick="aCCOpenTableCPP_Click" OnClientClick="showHideTableCC_custom.call(this,event)" style="display: inline-flex;">
                                                                <span id="btnOpenTable" runat="server" class="btn btn-account-listing-toggle accountExpandicon"></span>
                                                            </asp:LinkButton>
                                                        </div>


                                                        <div class="clearBoth"></div>
                                                        <div id="cardCCDataCPP" runat="server" class="tableWrapper_v4 hidden">
                                                            <asp:UpdatePanel runat="server" ID="updCCPanelCPP" UpdateMode="Conditional">
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="btnCAOpenTableCPP" EventName="ServerClick" />
                                                                    <asp:AsyncPostBackTrigger ControlID="aCCOpenTableCPP" EventName="Click" />
                                                                </Triggers>
                                                                <ContentTemplate>
                                                                    <div class="col-lg-12 clearPadding">
                                                                        <div class="metro inner-table">
                                                                            <it:GridViewControl ID="grdCCDataCPP" runat="server" AutoGenerateColumns="false" CssClass="table table-resp-to1199" IsResponsive="true" AllowPag="false"
                                                                                GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>"
                                                                                Style="padding-bottom: 0px;">
                                                                                <Columns>
                                                                                </Columns>
                                                                            </it:GridViewControl>
                                                                            <div id="grdCCDataEmptyCPP" class="grid-novalues" style="margin-bottom: 15px; margin-left: 15px;" visible="false" runat="server">
                                                                                <div id="divProductSelectionInfo_v4" class="login-info-bottom-text" runat="server">
                                                                                    <asp:Label ID="lblCCEmptyGridCPP" runat="server"></asp:Label>
                                                                                    <div class="login-info-bottom-text-icon"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                        <div class="nav-bottons col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding hidden">

                                                            <div class="box-red">
                                                                <div class="content-accounts">
                                                                    <div class="scroll-item-icon">
                                                                        <span class="img-icon-accounts metro"><i id="icoFavoriteAccount" class="icon-star-4" visible="false" runat="server"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <ul class="nav nav-pills pull-right links">
                                                                <li><span id="aCCCardDetail" runat="server">
                                                                    <asp:Literal ID="litCCCardDetail" Text="<%$FrontEndResources:TRX00131,litCardDetail %>" runat="server"></asp:Literal></span></li>
                                                                <li><span id="aCCCardStatement" runat="server">
                                                                    <asp:Literal ID="litCCCardStatement" Text="<%$FrontEndResources:TRX00131,litCardStatement %>" runat="server"></asp:Literal></span></li>


                                                            </ul>
                                                            <div class="clearBoth"></div>
                                                        </div>
                                                        <div class="clearBoth"></div>
                                                    </div>

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
            </FooterTemplate>
        </asp:Repeater>
        <div class="clearBoth"></div>
    </it:FlowInnerContainer>
    <script type="text/javascript">
    var IDs = new Array;

    function showHideTable_custom(event) {
        var id = $(this).data('id');
        var table = $('.tableWrapper[data-id=' + id + ']');

        $(".tableWrapper").slideUp('fast'); //Hidding tables
        $('button').find("i").removeClass().addClass("glyphicon glyphicon-plus");

        if (table.length > 0 && !table.is(':visible')) {
            table.slideDown('fast');
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


    function showHideTableDD_custom(event) {
        var id = $(this).data('id');
        var table = $('.tableWrapper_v3[data-id=' + id + ']');

        $(".tableWrapper_v3").slideUp('fast'); //Hidding tables
        $('button').find("i").removeClass().addClass("glyphicon glyphicon-arrow-down");

        if (table.length > 0 && !table.is(':visible')) {
            table.slideDown('fast');
            $('button[data-id=' + id + ']').find("i").toggleClass("glyphicon-arrow-down glyphicon-arrow-up");
            if (!include(IDs, id)) {
                IDs.push(id);
                return true;
            }
        }

        event.preventDefault();
        IDs.push(id);

        return false;
    }

    function showHideTableCC_custom(event) {
        var id = $(this).data('id');
        var table = $('.tableWrapper_v4[data-id=' + id + ']');

        $(".tableWrapper_v4").slideUp('fast'); //Hidding tables
        $('button').find("i").removeClass().addClass("glyphicon glyphicon-arrow-down");

        if (table.length > 0 && !table.is(':visible')) {
            table.slideDown('fast');
            $('button[data-id=' + id + ']').find("i").toggleClass("glyphicon-arrow-down glyphicon-arrow-up");
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

    GoToCPPCardDetail = function (number) {
        eBankit.Presentation.SetBlockPageCommon();
        $('body').block();
        eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00219<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&card=' + number;
    }

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
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00218-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
