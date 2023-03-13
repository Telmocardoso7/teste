<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoanProductsControl.ascx.cs" Inherits="LoanProductsControl" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("_LoanProductsControl.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced bs-head-metro bs-reduced-transaction transp">
    <h3 class="head">
        <asp:Literal ID="Literal1" runat="server" Text="<%$FrontEndResources:LOANPRODUCTSCONTROL,TitleProvider%>"></asp:Literal>
    </h3>
</div>
<div class="scrollContainerLoanProducts">
    <div id="scroolContent" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts overflowHidden">
        <asp:UpdatePanel ID="flwContainerLoanProducts" UpdateMode="Always" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSelectedLoanProductChanged" />
            </Triggers>
            <ContentTemplate>
                <ul id="sliderLoanProducts" class="bxsliderprods">
                    <asp:Repeater ID="rptLoanProducts" runat="server" OnItemDataBound="rptLoanProducts_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <div id="divLoanProductType" class="panel-item entity-img-div" runat="server">
                                    <div id="divLoanProductImage" class="no-update-selector update-products" runat="server"></div>                                          
                                </div>
                                <asp:Label ID="litLoanProductName" CssClass="neg-bot-text" runat="server" />
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <asp:HiddenField ID="hdnLoanProductsArray" runat="server" />
                <asp:HiddenField ID="hdnSelectedLoanProductId" runat="server" />
                <asp:HiddenField ID="hdnSelectedLoanProduct" runat="server" />
                <asp:HiddenField ID="hdnSelectedCurrentLoanProduct" runat="server" />
                <asp:HiddenField ID="hdnScrollContentLenght" runat="server" />
                <asp:HiddenField ID="hdnCount" runat="server" />
                <asp:HiddenField ID="hdnmaxBallonVar" runat="server" />
                <asp:HiddenField ID="hdnmaxInitialVar" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>

<div class="clearBoth"></div>

<asp:Button ID="btnSelectedLoanProductChanged" runat="server" CausesValidation="false" CssClass="hidden" />
<script type="text/javascript">

    eBankit.Presentation.LoanProductsControl = {}
    eBankit.Presentation.LoanProductsControl.PrdClk = function (LoanProductId) {

        var hdnSelectedLoanProduct = $("#<%=hdnSelectedLoanProductId.ClientID %>");
        var btnSelectedLoanProductChangedID = "<%=btnSelectedLoanProductChanged.UniqueID %>";
        hdnSelectedLoanProduct.val(LoanProductId).show();
        __doPostBack(btnSelectedLoanProductChangedID, '');
    }

    eBankit.Presentation.LoanProductsControl.ShowScroll = function () {
        //
    }

    METRO_AUTO_REINIT = true;

    eBankit.Presentation.LoanProductsControl.LoadSlider = function () {
        var posSlide = 0;
        var selectorWidth = $("#scroolContent").width();
        var nElements = 4;//default

        if (selectorWidth <= 600) { nElements = 1; }
        else if (selectorWidth <= 900) { nElements = 2; }
        else if (selectorWidth <= 1200) { nElements = 3; }
        else { nElements = 4 }

        var selected = $('.selected');
        if (selected && selected.length > 1) {
            for (var i = 0; i < selected.length; ++i) {
                if (selected[i].tagName == 'DIV' && selected[i].getAttribute("item-index") != null && (selected[i].className.indexOf("no-update-selector") == -1)) {
                    index = selected[i].getAttribute("item-index");
                    posSlide = Math.floor(parseFloat(index) / nElements);
                }
            }
        } else if (selected) {
            index = selected.attr("item-index");
            posSlide = Math.floor(parseFloat(index) / nElements);
        }

        $('#sliderLoanProducts').bxSlider({
            minSlides: 1,
            maxSlides: 5,
            slideWidth: 280,
            slideMargin: 10,
            infiniteLoop: false,
            hideControlOnEnd: true,
            startSlide: posSlide
        });
    }

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        eBankit.Presentation.LoanProductsControl.LoadSlider();
    });

    $(document).ready(function () {
        eBankit.Presentation.LoanProductsControl.LoadSlider();

        if ($(".div-icon-info_v2").length > 0 && $("#sliderLoanProducts li").length == 1) {
            $(".scrollContainerLoanProducts").hide();
            $(".controlsShowHide").hide();
        }
    });
</script>
