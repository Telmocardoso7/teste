<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrepaydCardsControl.ascx.cs" Inherits="PrepaydCardsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max scroll-item-top">
    <h4>
        <asp:Literal ID="litTitle" Text="<%$FrontEndResources:Card,SelectTitle %>" runat="server"></asp:Literal></h4>
</div>
<div class="scrollContainerAccounts">
    <div id="scroolContent" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts" style="overflow: hidden; visibility: hidden;">

        <asp:UpdatePanel ID="flwContainerCards" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSelectedCardChanged" />
            </Triggers>
            <ContentTemplate>
                <div>
                    <div class="slickSlider">
                        <asp:Repeater ID="rptCreditCards" runat="server" OnItemDataBound="rptCreditCards_ItemDataBound">
                            <ItemTemplate>
                                <div id="divCard" runat="server" onkeydown="eBankit.Presentation.AccountsControl.PrepaydCardKeydownHandler(this, event);" onkeyup="eBankit.Presentation.AccountsControl.PrepaydCardKeyupHandler(this, event);">
                                    <div id="liCardType" class="contentBox box-red" runat="server">
                                        <div class="scroll-item-top card-control-panel accountNameOverflow">
                                            <h4>
                                                <asp:Literal ID="litCardName" runat="server"></asp:Literal></h4>
                                            <h5>
                                                <asp:Literal ID="litCardNumber" runat="server"></asp:Literal></h5>
                                        </div>

                                        <div class="clearBoth"></div>
                                        <div class="scroll-item-noicon">
                                            <span class="img-icon-nobackgroundaccounts"></span>
                                        </div>
                                        <%--                                        <div id="divBalance" class="scroll-item-value positive" runat="server">
                                                        <h5>
                                                            <asp:Literal ID="litBalanceTitle" Text="<%$FrontEndResources:Card,BalanceTitle %>" runat="server"></asp:Literal></h5>
                                                        <h3>
                                                            <asp:Literal ID="litBalanceValue" runat="server"></asp:Literal>
                                                            &nbsp;<asp:Literal ID="litCurrency" runat="server"></asp:Literal></h3>
                                                    </div>--%>

                                        <div id="divBalance" class="scroll-item-value positive" runat="server">
                                            <h3 class="valueFormat" style="margin-left: 5px">
                                                <h3>
                                                    <asp:Literal ID="litBalanceValue" runat="server"></asp:Literal>
                                                </h3>
                                                <div class="formatCurrency" style="margin-top: 2px;">
                                                    <asp:Literal ID="litCurrency" runat="server"></asp:Literal>
                                                </div>
                                            </h3>
                                            <h5 class="balanceTitle">
                                                <asp:Literal ID="litBalanceTitle" Text="<%$FrontEndResources:Account,BalanceTitle %>" runat="server"></asp:Literal>
                                            </h5>
                                        </div>
                                        <div id="divCardType" class="scroll-item-value positive" runat="server" style="display: none">
                                            <%--<div><div id="divCardTypeArrow" class="arrow-corner" runat="server"></div><i class="icon-credit-card"></i></div>--%>
                                            <h5>
                                                <asp:Literal ID="litCardTypeTitle" Text="<%$FrontEndResources:Account,CardProduct %>" runat="server"></asp:Literal></h5>
                                            <h4>
                                                <asp:Literal ID="litCardType" runat="server"></asp:Literal></h4>
                                        </div>

                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <asp:HiddenField ID="hdnCardsArray" runat="server" />
                    <asp:HiddenField ID="hdnSelectedCardId" runat="server" />
                    <asp:HiddenField ID="hdnSelectedCard" runat="server" />
                    <asp:HiddenField ID="hdnSelectedCurrentAccount" runat="server" />
                    <asp:HiddenField ID="hdnSelectedCurrentAccountMessages" runat="server" />
                    <asp:HiddenField ID="hdnScrollContentLenght" runat="server" />
                    <asp:HiddenField ID="hdnCountCards" runat="server" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</div>
<div class="clearBoth"></div>
<asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
    <ContentTemplate>
        <it:TabSelectorControl
            id="TabSelector"
            ControlName="PrepaidCardControl"
            visible="false"
            runat="server"
            titleOperations="<%$FrontEndResources:TRX00219,titleOperations%>"
            titleFavorits="<%$FrontEndResources:TRX00213,titleFavorits%>" />
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Button ID="btnSelectedCardChanged" runat="server" CausesValidation="false" CssClass="hidden" />
<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("/scripts/ebankitControls/product-selector-slick-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
<script type="text/javascript">

    eBankit.Presentation.AccountsControl = {}
    eBankit.Presentation.AccountsControl.AccClk = function (accountId) {

        $("#benefsTabContent #operations").hide();
        $("#benefsTabContent #favorit").hide();
        $(".col-transaction").show();


        //
        var hdnSelectedAccount = $("#<%=hdnSelectedCardId.ClientID %>");
        var btnSelectedAccountChangedID = "<%=btnSelectedCardChanged.UniqueID %>";
        hdnSelectedAccount.val(accountId).show();
        __doPostBack(btnSelectedAccountChangedID, '');
    }

    eBankit.Presentation.AccountsControl.ShowScroll = function () {
        //
    }

    eBankit.Presentation.AccountsControl.PrepaydCardKeydownHandler = function (elem, event) {
        if (event.keyCode === 32) {
            event.preventDefault();
        }
        else if (event.keyCode === 13) {
            event.preventDefault();
            $(elem).click();
        }
    }

    eBankit.Presentation.AccountsControl.PrepaydCardKeyupHandler = function (elem, event) {
        if (event.keyCode === 32) {
            event.preventDefault();
            $(elem).click();
        }
    }

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        ProductSelectorSlick.LoadSlick();
    });

    $(document).ready(function () {
        ProductSelectorSlick.LoadSlick();

        if ($(".div-icon-info_v2").length > 0) {
            $(".controlsShowHide").hide();
            $("#backgrounderLeft").css("background-color", "transparent");
            $("#backgrounderRight").css("background-color", "transparent");

            $(".scrollContainerAccounts").hide();
            $(".tabSelectorBackground").hide();
        }
    });

</script>
