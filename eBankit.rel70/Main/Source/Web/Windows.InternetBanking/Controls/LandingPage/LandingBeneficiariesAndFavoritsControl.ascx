<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingBeneficiariesAndFavoritsControl.ascx.cs" Inherits="LandingBeneficiariesAndFavoritsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts favouritesSliderDashboard">
    <a id="A1" runat="server" class="dashboardSliderTitle">
        <asp:Label ID="lblLastOperationsTitle" Text="<%$FrontEndResources:Operations,Title%>" runat="server"></asp:Label>
    </a>
</div>
<div class="fullWidth header-default">
    <div style="padding-left: 15px;">
    
        <div class="tab-content panel-content" style="border: 0px; padding: 0px 0px; /* background-color: #fff; */ /* margin-bottom: 20px; */">
            <div class="tab-pane fade tab-pane-favs active in" id="favorit">
            <div class="metro bx-wrapper-container bx-wrapper-container-selector col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts" id="flwContainerDetailFavorits" runat="server">
                <asp:Repeater ID="rptFavorits" runat="server" EnableViewState="true" OnItemDataBound="rptFavorits_ItemDataBound">
                    <HeaderTemplate>
                        <div class="slickSlider">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div id="liFavOper" runat="server" class="favOper-item" style="width: 260px !important;">
                            <div id="aFavOper" class="panel-item" runat="server">
                                <div class="panel-image fullWidth">
                                    <img id="imgFavorit" src="#" alt="" runat="server" class="imgFavoritLandingPage"/>
                                    <img id="imgSharedFav" src="<%$ebFile:~/Content/currenttheme/images/icon/action/corporate/action-shared.png%>" alt="" runat="server" class="imgShareIconAbove sharedOnFavSelector"/>
                                </div>
                                <div class="panel-text">
                                    <h4 class="overflowEllipsis">
                                        <asp:Literal ID="litName" runat="server"></asp:Literal>
                                    </h4>
                                    <p>
                                        <asp:Literal ID="litDestination" runat="server"></asp:Literal>
                                    </p>
                                    <p>
                                        <asp:Literal ID="litAmount" runat="server"></asp:Literal>
                                    </p>
                                </div>
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
                <div class="clearBoth"></div>
            </div>

            <div id="flwFavoritsEmpty" class="metro panel-content panel-info-gen" style="height:65px;" runat="server">
                <p style="padding: 10px 0px !important; /* border: 1px solid rgb(245, 245, 245); */ /* margin-right: -12px; */ border-radius: 5px; text-align: center; font-family: 'Gotham Light', sans-serif; color: #fff;">
                    <asp:Literal ID="Literal1" Text='<%$FrontEndResources:Favorits,EmptyMessage %>' runat="server"></asp:Literal>
                </p>
            </div>
        </div>
        <asp:Button ID="btnFavoritSelectedChanged" runat="server" CssClass="hidden" />
        <div class="clearBoth"></div>
    </div>
    <div class="clearBoth"></div>
</div>
</div>
<asp:HiddenField ID="hdnBeneficiarySelectedIndex" Value="" runat="server" />
<asp:HiddenField ID="_hidSelectedBeneficiary" runat="server" />
<asp:HiddenField ID="_hidBeneficiaryArray" runat="server" />

<asp:HiddenField ID="hdnFavoritSelectedIndex" Value="" runat="server" />
<asp:HiddenField ID="_hidSelectedFavorit" runat="server" />
<asp:HiddenField ID="_hidFavoritArray" runat="server" />

<asp:HiddenField ID="hdnBeneficiaryAccountType" runat="server" />

<asp:HiddenField ID="hdnSelectedPanel" Value="" runat="server" />
<script type="text/javascript">
    var _hidBeneficiaryArray = $("#<%=_hidBeneficiaryArray.ClientID %>"); var _hidSelectedBeneficiary = $("#<%=_hidSelectedBeneficiary.ClientID %>"); var hdnSelectedPanel = $("#<%=hdnSelectedPanel.ClientID %>");
    var hdnBeneficiarySelectedIndex = $("#<%=hdnBeneficiarySelectedIndex.ClientID %>"); var AutoPostBack_f = '<%=AutoPostBack %>';

    var _hidFavoritArray = $("#<%=_hidFavoritArray.ClientID %>"); var _hidSelectedFavorit = $("#<%=_hidSelectedFavorit.ClientID %>");
    var hdnFavoritSelectedIndex = $("#<%=hdnFavoritSelectedIndex.ClientID %>"); var btnFavoritSelectedChanged = "<%=btnFavoritSelectedChanged.UniqueID %>";

    var chooseFavorit = '<%=eBankit.Common.Globalization.Translate.GetTransactionString("Favorit","ChooseTitle") %>';
    var chooseBeneficiary = '<%=eBankit.Common.Globalization.Translate.GetTransactionString("Beneficiary","ChooseTitle") %>';
    var hdnBeneficiaryAccountType = $("#<%=hdnBeneficiaryAccountType.ClientID %>");
    var projId = "<%=ConfigurationManager.AppSettings["projectId"].ToString() %>";


    changeIcon = function (type) {

        if (type == ('favorit')) {
            imgFavorite1.attr("src","<%= eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("ic_filter_favorite_selected.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image)%>");
            imgBeneficiary1.attr("src","<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("ic_filter_beneficiary.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image)%>");
        }
    };

    $(document).ready(function () {
        $("img[id*='imgFavorit']").each(function () {
            if ($(this).attr("alt") === undefined)
                $(this).attr("alt", "");
        });

        slider = $('.slickSlider').slick({
            minSlides: 1,
            slidesToShow: 3,
            slideWidth: 280,
            slideMargin: 10,
            infinite: false,
            arrows: true,
            prevArrow: '<button type="button" class="slick-prev slick-prev-light" aria-label="Previous Slide"></button>',
            nextArrow: '<button type="button" class="slick-next slick-next-light" aria-label="Next Slide"></button>',
            responsive: [
                {
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 2.5
                    }
                }, {
                    breakpoint: 576,
                    settings: {
                        slidesToShow: 1.5
                    }
                }, {
                    breakpoint: 400,
                    settings: {
                        slidesToShow: 1
                    }
                }]
        });
               
        slider.slick('slickGoTo', 0);

        if ($(".slickLastSlider .favOper-item").length > 4) {
            slider.slick('slickGoTo', 0, true);
        }

        slider.on('keyup', function (e) {
            if (e.keyCode === 39)//arrowright
                $(this).find("button.slick-next").focus();

            if (e.keyCode === 37) // arrow left
                $(this).find("button.slick-prev").focus();
        });
    });

</script>
<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("beneficiary-1.0.js".ResolveJsUrl("Services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

