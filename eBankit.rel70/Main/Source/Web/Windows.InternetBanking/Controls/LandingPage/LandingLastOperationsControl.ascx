<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingLastOperationsControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LandingLastOperationsControl" %>


<div class="ultimasOperacoesDashboard">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts">
        <a id="aLastOperations" runat="server" class="dashboardSliderTitle">
            <asp:Label ID="lblLastOperationsTitle" Text="<%$FrontEndResources:Custom,PanelLastOperations%>" runat="server"></asp:Label>
        </a>
    </div>
    <div class="fullWidth landingOperationContainer">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts">

            <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <it:FlowContainerDetail_v2 ID="flwOperationContainer" CssClass="metro header-small formatTitle" runat="server">
                        <asp:Repeater ID="rptLastOperations" runat="server" EnableViewState="true" OnItemDataBound="rptLastOperations_ItemDataBound">
                            <HeaderTemplate>
                                <div class="dashboardLastOperationsSliderContainer">
                                    <div class="slickLastSlider" dir="ltr">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div id="aLastOper" runat="server" class="lastOper-item">
                                    <div class="tile-content contentBox box-red lastoperations list-group-item col-lg-12 list-group-item-inner list-group-item-hover">
                                      
                                            <div class="list-group-item-text col-lg-12 fullWidth" style="min-height: 50px; padding: 0px;">
                                                <div class="list-group-item-des col-xs-10 col-sm-10 col-md-10 col-lg-10 fullWidth" style="padding: 5px 10px;">
                                                    <div class="img-operation-div">
                                                        <span class="img-operation-span"></span>
                                                        <img id="imgOperation" src="<%$ebFile:~/Content/currenttheme/images/benef_1.png%>" alt="" class="img-operation" runat="server" />
                                                    </div>
                                                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 last-operation-data fullWidth" runat="server">
                                                        <h6 class="overflowEllipsis formatOperation">
                                                            <asp:Literal ID="litDescription" runat="server"></asp:Literal></h6>
                                                        <p id="divLastOperationAmount" class="amountOperation" runat="server" style="font-weight: normal !important; font-family: 'Gotham Book' !important; font-size: 19px !important; width: 100%; text-align: center;">
                                                            <asp:Literal ID="litAmount" runat="server"></asp:Literal></p>
                                                        <p class="formatOperation hidden">
                                                            <asp:Literal ID="litChannel" runat="server"></asp:Literal></p>
                                                        <h6>
                                                            <asp:Literal ID="litData" runat="server"></asp:Literal>&nbsp;<asp:Literal ID="litData2" runat="server"></asp:Literal></h6>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                            </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                </div>
                        </div>
                        <div class="dashboardLastOperationsToday" tabindex="0">
                            <div class="header-default"></div>
                            <h6>
                                <asp:Label ID="lblNotAllowed" Text="<%$FrontEndResources:Timeline,Hoje %>" runat="server"></asp:Label>
                            </h6>
                        </div>

                            </FooterTemplate>
                        </asp:Repeater>
                        <div id="divNotAllowed" class="metro" visible="false" runat="server">
                            <div class="warn" style="text-align: center; margin: 10px 0px;">
                                <asp:Label ID="lblNotAllowed" Text="<%$FrontEndResources:Custom,NoData %>" runat="server"></asp:Label>
                            </div>
                        </div>
                    </it:FlowContainerDetail_v2>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</div>
<script type="text/javascript">

    $(document).ready(function () {
        $("img[id*='imgOperation']").each(function () {
            if ($(this).attr("alt") === undefined)
                $(this).attr("alt", "");
        });

        if ($('.slickLastSlider .lastOper-item').length > 0) {
            slider = $('.slickLastSlider').slick({
                minSlides: 1,
                slidesToShow: 3,
                slideWidth: 280,
                slideMargin: 10,
                infinite: false,
                arrows: true,
                rtl:false,
                prevArrow: '<button type="button" class="slick-prev" aria-label="Previous Slide"></button>',
                nextArrow: '<button type="button" class="slick-next" aria-label="Next Slide"></button>',
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
                        breakpoint: 320,
                        settings: {
                            slidesToShow: 1
                        }
                    }]
            });

            slider.slick('slickGoTo', 0);

            if ($(".slickLastSlider lastOper-item").length > 4) {
                slider.slick('slickGoTo', 0, true);
            }

            slider.on('keyup', function (e) {
                if (e.keyCode === 39)//arrowright
                    $(this).find("button.slick-prev").focus();

                if (e.keyCode === 37) // arrow left
                    $(this).find("button.slick-next").focus();
            });
            
          $(".dashboardLastOperationsToday").on("click keypress", function () {
                if (!($(".slick-next:last").hasClass('disabled')))
                    slider.slick('slickGoTo', 0, true);
            });
        }
        
        
    });
    
</script>

<style type="text/css">
    #scroolContentLastOperations .panel-heading div {
        width: 100% !important;
        color: rgb(77,171,185);
        text-transform: uppercase;
        text-align: center !important;
    }

    #scroolContentLastOperations .contentBox {
        padding: 0px !important;
        margin: 0px !important;
    }

    #scroolContentLastOperations div {
        margin: 0px;
        padding: 0px;
    }

    .slickLastSlider .slick-next:hover,
    .slickLastSlider .slick-next:active
    {
      background-color: rgba(255,255,255,.4) !important;
    }

    .slickLastSlider .slick-prev:hover,
    .slickLastSlider .slick-prev:active{
        background-color: rgba(255,255,255,.4) !important;
    }

    #scroolContentLastOperations {
        margin: 0px;
        padding: 0px;
    }

    #scroolContentLastOperations .panel-body {
            margin: 0px;
            padding: 0px;
        }

    #scroolContentLastOperations .list-group-item-inner > div:first-child {
            border: none;
        }

    #scroolContentLastOperations .bx-wrapper img {
            float: none;
            margin: 0 auto;
        }

    .bx-wrapper {
        min-height: 204px;
    }

    .overflowEllipsis {
      white-space: normal !important;
    }
</style>
