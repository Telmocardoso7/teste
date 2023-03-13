<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CurrencyControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.CurrencyControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<div class="scrollContainerAccounts">
    <div id="scroolContent" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts overflowHidden">
        <asp:UpdatePanel ID="flwContainerCurrency" UpdateMode="Always" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSelectedCurrencyChanged" />
            </Triggers>
            <ContentTemplate>
                <ul class="bxslider currency-slider">
                    <asp:Repeater ID="rptCurrentCurrencies" runat="server" OnItemDataBound="rptCurrentCurrencies_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <div id="divCurrencyType" class="contentBox box-red" runat="server">
                                    <span id="iconCurrency" class="icon-currency" runat="server"></span>
                                    <div class="scroll-currency-info">
                                        <h4>
                                            <asp:Literal ID="litCurrencyName" runat="server"></asp:Literal></h4>
                                        <h5 class="numAcc">
                                            <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal></h5>
                                    </div>
                                    <div class="clearBoth"></div>

                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <asp:HiddenField ID="hdnCurrenciesArray" runat="server" />
                <asp:HiddenField ID="hdnSelectedCurrencyId" runat="server" />
                <asp:HiddenField ID="hdnSelectedCurrency" runat="server" />
                <asp:HiddenField ID="hdnSelectedCurrentCurrency" runat="server" />
                <asp:HiddenField ID="hdnSelectedCurrentCurrencyMessages" runat="server" />
                <asp:HiddenField ID="hdnScrollContentLenght" runat="server" />
                <asp:HiddenField ID="hdnCount" runat="server" />

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>

<div class="clearBoth"></div>

<asp:Button ID="btnSelectedCurrencyChanged" runat="server" CausesValidation="false" CssClass="hidden" />
<script type="text/javascript">

    eBankit.Presentation.CurrencyControl = {}
    eBankit.Presentation.CurrencyControl.Clk = function (accountId) {

        $("#benefsTabContent #operations").hide();
        $("#benefsTabContent #favorit").hide();
        $(".col-transaction").show();

        var hdnSelectedCurrency = $("#<%=hdnSelectedCurrencyId.ClientID %>");
        var btnSelectedAccountChangedID = "<%=btnSelectedCurrencyChanged.UniqueID %>";
        hdnSelectedCurrency.val(accountId).show();
        __doPostBack(btnSelectedAccountChangedID, '');
    }


    METRO_AUTO_REINIT = true;

    //eBankit.Presentation.AccountsControl.LoadSlider = function () {
    //    var posSlide = 0;
    //    var selectorWidth = $("#scroolContent").width();
    //    var nElements = 4;//default

    //    if (selectorWidth <= 600) { nElements = 1; }
    //    else if (selectorWidth <= 900) { nElements = 2; }
    //    else if (selectorWidth <= 1200) { nElements = 3; }
    //    else { nElements = 4 }

    //    var selected = $('.selected');
    //    if (selected && selected.length > 1) {
    //        for (var i = 0; i < selected.length; ++i) {
    //            if (selected[i].tagName == 'DIV' && selected[i].getAttribute("item-index") != null && (selected[i].className.indexOf("no-update-selector") == -1)) {
    //                index = selected[i].getAttribute("item-index");
    //                posSlide = Math.floor(parseFloat(index) / nElements);
    //            }
    //        }
    //    } else if (selected) {
    //        index = selected.attr("item-index");
    //        posSlide = Math.floor(parseFloat(index) / nElements);
    //    }

    //    $('.bxslider').bxSlider({
    //        minSlides: 1,
    //        maxSlides: 5,
    //        slideWidth: 290,
    //        infiniteLoop: false,
    //        hideControlOnEnd: true,
    //        slideMargin: 0,
    //        startSlide: posSlide
    //    });
    //}

    //var prm = Sys.WebForms.PageRequestManager.getInstance();
    //prm.add_endRequest(function () {
    //    eBankit.Presentation.AccountsControl.LoadSlider();
    //});

    //$(document).ready(function () {
    //    eBankit.Presentation.AccountsControl.LoadSlider();

    //    if ($(".div-icon-info_v2").length > 0 && $(".scrollContainerAccounts .bxslider li").length == 1) {
    //        $(".scrollContainerAccounts").hide();
    //        $(".controlsShowHide").hide();
    //    }
    //});
</script>
