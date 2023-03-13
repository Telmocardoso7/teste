<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingLastOperationsControlRTL.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LandingLastOperationsControlRTL" %>


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
                                <div class="dashboardLastOperationsToday">
                                    <div class="header-default"></div>
                                    <h6>
                                        <asp:Label ID="lblNotAllowed" Text="<%$FrontEndResources:Timeline,Hoje %>" runat="server"></asp:Label>
                                    </h6>
                                </div>
                                <div class="dashboardLastOperationsSliderContainer">
                                    <ul class="bxsliderLastOperations">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li>
                                    <div class="tile-content contentBox box-red">
                                        <a id="aLastOper" href="javascript:void(0)" class="lastoperations list-group-item col-lg-12 list-group-item-inner list-group-item-hover" runat="server">
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
                                                            <asp:Literal ID="litAmount" runat="server"></asp:Literal>
                                                        </p>
                                                        <p class="formatOperation hidden">
                                                            <asp:Literal ID="litChannel" runat="server"></asp:Literal>
                                                        </p>
                                                        <h6>
                                                            <asp:Literal ID="litData" runat="server"></asp:Literal>&nbsp;<asp:Literal ID="litData2" runat="server"></asp:Literal></h6>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
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
        if ($('.bxsliderLastOperations li').length > 0) {
            slider = $('.bxsliderLastOperations').bxSlider({
                minSlides: 1,
                maxSlides: 5,
                slideWidth: 280,
                slideMargin: 10,
                infiniteLoop: false,
                hideControlOnEnd: true
            });

            if ($(".bxsliderLastOperations li").length > 4) {
                slider.goToSlide(-1);
            }

            $(".dashboardLastOperationsToday").click(function () {
                if (!($(".bx-next:last").hasClass('disabled')))
                    slider.goToSlide(-1);
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

    #scroolContentLastOperations ul {
        margin: 0px;
        padding: 0px;
    }

    #scroolContentLastOperations .bx-wrapper .bx-prev {
        background-color: #fff;
    }

    #scroolContentLastOperations .bx-wrapper .bx-next {
        background-color: #fff;
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
</style>
