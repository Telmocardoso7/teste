<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerSummary.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.CustomerSummary" %>

<h4 class="single-head" style="font-weight: normal; padding-bottom: 5px;">
    <asp:Literal ID="Literal1" Text="<%$FrontEndResources:LandingPage,IntegratedPosition %>" runat="server"></asp:Literal></h4>

<div class="drop-currencies">
    <it:DropDownListControl_v3 ID="ddlCurrencys" runat="server" OnChange="changeValue()"></it:DropDownListControl_v3>
</div>
<div class="hidden">
    <asp:Repeater ID="rptProductsTabs" runat="server" OnItemDataBound="rptProductsTabs_ItemDataBound">
        <HeaderTemplate>
            <ul id="childs" class="nav nav-tabs nav-favs nav-inner" style="border: 0; text-align: right; margin-top: -50px; margin-bottom: 10px;">
        </HeaderTemplate>
        <ItemTemplate>
            <li id="liCurrency" runat="server" class="nav-favs-tab" style="float: none; display: inline-block;"><a id="htab" href="#curreny<%# Eval("Currency") %>" data-toggle="tab" style="border: 0;">
                <asp:Literal ID="litTabCurrency" Text="<%$FrontEndResources:Client,Other%>" runat="server"></asp:Literal></a></li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</div>
<it:FlowInnerContainer runat="server">
    <div style="background-color: #fff; border: solid 1px rgb(231,231,231); border-radius: 5px; margin-top: 10px;">
        <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="Products_ItemDataBound">
            <HeaderTemplate>
                <div id="productsTabContent" class="tab-content panel-content" style="border: 0; margin-bottom: 0px;">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="tab-pane fade" id="curreny<%# Eval("Currency") %>">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 clearPadding">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center clearPadding">
                            <h4 class="text-bold text-bottom-line">
                                <asp:Literal Text="<%$FrontEndResources:Client,TotalAssetsLbl%>" runat="server"></asp:Literal></h4>
                        </div>
                        <div class="clearBoth"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-border-left graphWrapper">
                            <it:ChartDynamicControlV3 ID="chtAccountsTypeAssets" CssClass="elem-chart visible-lg" TypeOfChart="DONUT" runat="Server"></it:ChartDynamicControlV3>
                            <it:ChartDynamicControlV3 ID="chtAccountsTypeAssets2" CssClass="elem-chart elem-chart-small visible-xs visible-sm visible-md" TypeOfChart="DONUT" runat="Server"></it:ChartDynamicControlV3>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 clearPadding" style="margin-top: 0px; background-color: rgb(245, 245, 245);">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 graphLegWrapper">
                            <asp:Repeater ID="rptProductsLegendAssets" runat="server" OnItemDataBound="rptProductsLegend_ItemDataBound">
                                <HeaderTemplate>
                                    <div class="metro bs-legend-left">
                                        <div class="bs-legend">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Repeater ID="rptProductsSubLegend" runat="server" OnItemDataBound="rptProductsSubLegend_ItemDataBound">
                                        <HeaderTemplate>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <div style="padding-bottom: 5px;">
                                                <div class="bs-legend-tb-left">
                                                    <asp:Label ID="lblLegendSubSerieColor" CssClass="label label-default label-empty" runat="server"></asp:Label>
                                                </div>
                                                <div class="bs-legend-tb-right">
                                                    <asp:Label ID="lblLegendSubSerie" CssClass="label label-transparent label-legend-left lengend-tooltip" data-toggle="tooltip" data-placement="top" runat="server"></asp:Label><asp:Label ID="lblLegendSubSerieValue" CssClass="label label-transparent bs-legend-ass" runat="server"></asp:Label>
                                                </div>
                                                <div class="clearBoth"></div>
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </div>
                                        </div>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                    <div class="clearBoth"></div>
                    <hr class="hr-inner" style="margin-bottom: 0px; margin-top: 0px;" />
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 clearPadding" style="margin-top: 0px;">

                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center clearPadding">
                            <h4 class="text-bold text-bottom-line">
                                <asp:Literal Text="<%$FrontEndResources:Client,TotalLiabilitiesLbl%>" runat="server"></asp:Literal></h4>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-border-left graphWrapper">
                            <it:ChartDynamicControlV3 ID="chtAccountsTypeLiabilities" CssClass="elem-chart visible-lg" TypeOfChart="DONUT" runat="Server"></it:ChartDynamicControlV3>
                            <it:ChartDynamicControlV3 ID="chtAccountsTypeLiabilities2" CssClass="elem-chart elem-chart-small visible-xs visible-sm visible-md" TypeOfChart="DONUT" runat="Server"></it:ChartDynamicControlV3>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 clearPadding" style="margin-top: 0px; background-color: rgb(245, 245, 245);">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 graphLegWrapper">
                            <asp:Repeater ID="rptProductsLegendLiabilities" runat="server" OnItemDataBound="rptProductsLegend_ItemDataBound">
                                <HeaderTemplate>
                                    <div class="metro bs-legend-left">
                                        <div class="bs-legend">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%-- <div style="padding-bottom: 5px;">
                                            <asp:Label ID="lblLegendSerieColor" CssClass="label label-default label-empty pull-left" runat="server"></asp:Label><asp:Label ID="lblLegendSerie" CssClass="label label-transparent label-underline label-legend-left" runat="server"></asp:Label><asp:Label ID="lblLegendSerieValue" CssClass="label label-transparent label-underline label-legend-right" runat="server"></asp:Label>
                                        </div>--%>
                                    <asp:Repeater ID="rptProductsSubLegend" runat="server" OnItemDataBound="rptProductsSubLegend_ItemDataBound">
                                        <HeaderTemplate>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <div style="padding-bottom: 5px;">
                                                <div class="bs-legend-tb-left">
                                                    <asp:Label ID="lblLegendSubSerieColor" CssClass="label label-default label-empty" runat="server"></asp:Label>
                                                </div>
                                                <div class="bs-legend-tb-right">
                                                    <asp:Label ID="lblLegendSubSerie" CssClass="label label-transparent label-legend-left lengend-tooltip" data-toggle="tooltip" data-placement="top" runat="server"></asp:Label><asp:Label ID="lblLegendSubSerieValue" CssClass="label label-transparent bs-legend-liab" runat="server"></asp:Label>
                                                </div>
                                                <div class="clearBoth"></div>
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </div>
                                        </div>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                    <div class="clearBoth"></div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</it:FlowInnerContainer>

<script type="text/javascript">
    $(document).ready(function () {
        $(".tab-pane").first().addClass("active");
        $(".tab-pane").first().addClass("in");

        CreateTooltip();
    });

    EndPageRequest = function () {
        CreateTooltip();
    };

    function changeValue() {
        var p = $("#MainContent_TransactionMainContent_cstSummary_ddlCurrencys_dlField option:selected").text();
        var k = p;
        //alert(p);


        var array = $("#childs").children();
        for (i = 0; i < array.length; i++) {
            $(array[i]).removeClass('nav-favs-tab');
            $(array[i]).removeClass('active');
            $(array[i]).addClass('nav-favs-tab');
        }

        for (i = 0; i < array.length; i++) {
            var cont = array[i].innerText;
            if (k == cont) {
                var hrf = $(array[i]).find('a').attr('href');
                try {
                    if (hrf != "") {
                        $('.nav-tabs a[href="' + hrf + '"]').tab('show');
                    }
                }
                catch (err) {
                    //
                }

                break;
            }
        }
    }

    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndPageRequest);

    CreateTooltip = function () {
        $(".lengend-tooltip").tooltip({
            html: true,
        });
    };
</script>
