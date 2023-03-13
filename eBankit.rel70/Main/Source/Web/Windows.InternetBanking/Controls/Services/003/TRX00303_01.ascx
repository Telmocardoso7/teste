<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00303_01.ascx.cs" Inherits="TRX00303_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divTransaction" class="transaction-content" runat="server">
    <asp:Repeater ID="rptAccounts" runat="server" OnItemDataBound="rptAccounts_ItemDataBound">
        <ItemTemplate>
            <div class="lineSeparator fullWidth">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max listItemContainer paddingTop45 paddingBottom45 noPaddingLeft">
                    <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 content-body fullWidth">
                        <section>
                            <div class="col-lg-12 col-left clearPadding">
                                <span>
                                    <div class="trx-container">
                                        <div class="product-list">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding">
                                                <div class=" account">
                                                    <asp:HiddenField ID="hidAccountNumber" runat="server" />
                                                    <%--<div class="listItemOpenButton">
                                                            <span id="btnOpenTable" runat="server" class="btn btn-account-listing-toggle accountExpandicon"></span>
                                                        </div>--%>
                                                    <div class="pull-left col-xs-6 col-sm-6 col-md-4 col-lg-4 content-accounts flLeft">
                                                        <div class="scroll-item-icon">
                                                            <span class="img-icon-savings"></span>
                                                        </div>

                                                        <h4 class="accounts-name">
                                                            <asp:Literal ID="litAccountName" runat="server"></asp:Literal></h4>
                                                        <p class="accountNumber marginTop10 noMarginLeft">
                                                            <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal>
                                                        </p>
                                                    </div>
                                                    <div class="pull-left hidden-xs col-sm-6 col-md-3 col-lg-3 favorit-first_v2">
                                                        <p class="accounts-panel-p">
                                                            <asp:Literal ID="litValueTitle" Text="<%$FrontEndResources:TRX00303,litBalanceTitle%>" runat="server"></asp:Literal>
                                                        </p>
                                                        <h3 class="favorit-center accounts-panel-h field-tooltip" data-toggle="tooltip" data-placement="top" id="hAvailableBalance" runat="server">
                                                            <asp:Literal ID="litValue" runat="server"></asp:Literal>

                                                            <asp:Label ID="litValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                        </h3>
                                                    </div>
                                                     <div class="pull-left col-xs-6 col-sm-6 col-md-3 col-lg-3 favorit-first_v2 content-accounts">
                                                         <p class="accounts-panel-p">
                                                             <asp:Literal ID="litExpDate" Text="<%$FrontEndResources:TRX00131,litExpDate%>" runat="server"></asp:Literal>
                                                         </p>
                                                         <h3 class="favorit-center accounts-panel-h neutral" id="hSAExpDate" runat="server">
                                                             <asp:Literal ID="litExpDateValue" runat="server"></asp:Literal>
                                                         </h3>
                                                     </div>
                                                
                                                    <div class="pull-left hidden-xs hidden-sm col-md-2 col-lg-2 content-accounts" style="text-align: right; padding-top: 8px; padding-right: 15px;">
                                                        <asp:LinkButton NavigateUrl="#" ID="aOpenTable" runat="server" CssClass="statements-expand-icon" OnClick="aOpenTable_Click" OnClientClick="showHideTable_custom.call(this,event)"></asp:LinkButton>
                                                        <asp:LinkButton NavigateUrl="#" ID="aOpenDetail" runat="server" CssClass="accountExpandicon"></asp:LinkButton>

                                                    </div>
                                                    <div class="clearBoth"></div>
                                                    <div id="accountData" runat="server" class="last-statements-table hidden">
                                                        <asp:UpdatePanel runat="server" ID="updPanel" UpdateMode="Conditional">
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="aOpenTable" EventName="Click" />
                                                            </Triggers>
                                                            <ContentTemplate>
                                                                <div class="col-lg-12 clearPadding">
                                                                    <div class="metro inner-table">
                                                                        <it:GridViewControl ID="grdData" runat="server" AutoGenerateColumns="false" CssClass="table table_v2 table-resp-to1199" IsResponsive="true" AllowPag="false"
                                                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>"
                                                                            class="noPaddingBottom">
                                                                            <Columns>
                                                                            </Columns>
                                                                        </it:GridViewControl>
                                                                        <div id="grdDataEmpty" class="grid-novalues marginBottom15 marginLeft15" visible="false" runat="server">
                                                                            <div id="divProductSelectionInfo" class="login-info-bottom-text" runat="server">
                                                                                <asp:Label ID="lblEmptyGrid" runat="server"></asp:Label>
                                                                                <div class="login-info-bottom-text-icon"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding noMarginTop">
                                                        <div>
                                                            <div class="content-accounts">
                                                                <div class="scroll-item-icon noMargin negMarginTop2 marginRight10 flLeft">
                                                                    <span class="marginBottom no-info-img"><span id="icoFavoriteAccount" class="icon-star" visible="false" runat="server"></span></span>
                                                                </div>
                                                            </div>
                                                        </div>
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
    </asp:Repeater>

    <div class="fullWidth lineSeparator dispBlock">
        <div class="col-lg-2 col-md-1 visible-lg visible-md col-max clearPadding" style="height: 80px;"></div>
    </div>
    <div class="clearBoth"></div>
    <script type="text/javascript">
    var IDs = new Array;

    function showHideTable_custom(event) {
        var id = $(this).data('id');
        var table = $('.last-statements-table[data-id=' + id + ']');

        $(".last-statements-table").slideUp('fast'); //Hidding tables
        var x = $('[id*=aOpenTable]');
        $('[id*=aOpenTable]').removeClass().addClass("statements-expand-icon");

        if (table.length > 0 && !table.is(':visible')) {
            table.slideDown('fast');
            table.removeClass('hidden');
            $('a[data-id=' + id + ']').toggleClass("statements-expand-icon statements-collapse-icon");
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
        eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00301<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
    }

    GoToSAAccountReinforcement = function (number) {
        eBankit.Presentation.SetBlockPageCommon();
        $('body').block();
        eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00306<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
    }

    GoToSAAccountSettlement = function (number) {
        eBankit.Presentation.SetBlockPageCommon();
        $('body').block();
        eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00309<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
    }

    GoToSAAccountManager = function (number) {
        //
    }

    GoToSAAccountStatements = function (number) {
        eBankit.Presentation.SetBlockPageCommon();
        $('body').block();
        eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00310<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
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
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00303-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
