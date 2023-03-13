<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00204_01.ascx.cs" Inherits="TRX00204_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <asp:Repeater ID="rptDebitCards" runat="server" OnItemDataBound="rptDebitCards_ItemDataBound">
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
                                                    <asp:HiddenField ID="hidCCCardNumberDD" runat="server" />
                                                    <div class="pull-left col-xs-6 col-sm-6 col-md-4 col-lg-4 content-accounts flLeft clearPadding">
                                                        <div class="scroll-item-icon" style="margin-top: 0px; margin-left: 10px; margin-right: 10px; margin-bottom: 2px; border-bottom: 0;">
                                                            <span class="img-icon-cards img-icon-cards-deb" id="imgIconCard" runat="server"></span>
                                                        </div>
                                                        <h4 class="accounts-name" style="padding-top:0px">
                                                            <asp:Literal ID="litCCCardNameDD" runat="server"></asp:Literal></h4>
                                                        <p class="accountNumber" style="margin-left: 0px;">
                                                            <asp:Literal ID="litCCCardNumberDD" runat="server"></asp:Literal>
                                                        </p>
                                                          <p class="accounts-panel-p" style="margin-left: 0px;">
                                                                <span id="cardStatus" class="bulletStatus" style="margin-right: 4px;" runat="server"></span>
                                                                <asp:Label ID="litCCCardStatus" runat="server"></asp:Label>
                                                            </p>
                                                    </div>
                                                    <div class="hidden-xs hidden-sm col-md-3 col-lg-3 favorit-first_v2" style="margin-top: 4px;">
                                                        <p class="accounts-panel-p">
                                                            <asp:Literal ID="litDCAvailableBalanceAOADD" Text="<%$FrontEndResources:TRX00203,lblAssociatedCurrentAccount%>" runat="server"></asp:Literal>
                                                        </p>
                                                        <h3 class="favorit-center accounts-panel-h" id="hCCPaymentDateDD" runat="server">
                                                            <asp:Literal ID="litCCPaymentDateValueDD" runat="server"></asp:Literal>
                                                        </h3>
                                                    </div>
                                                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 favorit-first_v2" style="margin-top: 4px;">
                                                        <p class="accounts-panel-p">
                                                            <asp:Literal ID="litCCUsedBalanceDD" Text="<%$FrontEndResources:TRX00131,litBalance2%>" runat="server"></asp:Literal>
                                                        </p>
                                                        <h3 class="favorit-center accounts-panel-h" id="hCCUsedBalanceDD" runat="server">
                                                            <asp:Literal ID="litCCUsedBalanceValueDD" runat="server"></asp:Literal>
                                                            <asp:Label ID="litCCUsedBalanceValueCurrencyDD" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                        </h3>
                                                    </div>
                                                    <div class="col-md-2 col-lg-2 content-accounts" style="text-align: right; padding-top: 8px;">
                                                        <asp:LinkButton NavigateUrl="#" ID="btnCancelCard" runat="server" CssClass="cancel-card-icon" OnClick="btnCancelCard_Click"></asp:LinkButton>
                                                        <asp:LinkButton NavigateUrl="#" ID="btnCAOpenTableDD" runat="server" CssClass="statements-expand-icon" OnClick="btnCAOpenTableDD_Click" OnClientClick="showHideTable_custom.call(this,event)"></asp:LinkButton>
                                                        <asp:LinkButton NavigateUrl="#" ID="aCCCardDetailDD" runat="server" CssClass="accountExpandicon"></asp:LinkButton>

                                                    </div>
                                                    <div class="clearBoth"></div>
                                                    <div id="cardCCDataDD" runat="server" class="last-statements-table hidden">
                                                        <asp:UpdatePanel runat="server" ID="updCCPanelDD" UpdateMode="Conditional">
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnCAOpenTableDD"  EventName="Click"  />
                                                            </Triggers>
                                                            <ContentTemplate>
                                                                <div class="col-lg-12 clearPadding">
                                                                    <div class="metro inner-table">
                                                                        <it:GridViewControl ID="grdCCDataDD" runat="server" AutoGenerateColumns="false" CssClass="table table_v2 table-resp-to1199" IsResponsive="true" AllowPag="false"
                                                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>"
                                                                            class="noPaddingBottom">
                                                                            <Columns>
                                                                            </Columns>
                                                                        </it:GridViewControl>
                                                                        <div id="grdCCDataEmptyDD" class="grid-novalues marginBottom15 marginLeft15" visible="false" runat="server">
                                                                            <div id="divProductSelectionInfoDD" class="login-info-bottom-text" runat="server">
                                                                                <asp:Label ID="grdDataEmptyDD" runat="server"></asp:Label>
                                                                                <div class="login-info-bottom-text-icon"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
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
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00204-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <script type="text/javascript">
    var IDs = new Array;

    function showHideTable_custom(event) {
       
        var id = $(this).data('id');
        var table = $('.last-statements-table[data-id=' + id + ']');

        $(".last-statements-table").slideUp('fast'); //Hidding tables
        $('[id*=btnCAOpenTableDD]').removeClass().addClass("statements-expand-icon");

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
   
    //Controla pelo type para ver se estamos perante cartão de crédito ou débito
    GoToCardDetails = function (number) {
        eBankit.Presentation.SetBlockPageCommon();
        $('body').block();
        eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00213<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&card=' + number;
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
</div>
