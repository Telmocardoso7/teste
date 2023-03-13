<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="IntegratedPosition.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Security.Transactions.IntegratedPosition" %>



<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent">
    <div class="col-lg-8 col-max">
        <section class="featured">
            <div class="bs-reduced metro">
                <div id="FeaturedContent_TransactionFeaturedContent_UpdatePanel2">
                    <div class="fullWidth spacer10"></div>
                    <hgroup class="title">
                        <h3 class="head head-top">
                            <asp:Literal ID="Literal6" Text="<%$FrontEndResources:INTEGRATEDPOSITION,Title%>" runat="server"></asp:Literal></h3>
                        <h3></h3>
                    </hgroup>
                    <div class="clearBoth"></div>

                </div>
            </div>
        </section>
    </div>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="TransactionMainContent">

    <div class="metro">
        <div class="integratedPositionFilterContainer">
            <div class="info-bottom-text col-lg-8 col-max">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 clearPadding">
                    <it:DropDownListControl_v2 ID="ddlCurrencys" runat="server" OnChange="changeValue()" Label="<%$FrontEndResources:INTEGRATEDPOSITION,ddlCurrencys%>" CssClass="field field_v2 field-full"></it:DropDownListControl_v2>
                </div>
            </div>
        </div>
        <asp:UpdatePanel ID="updPanel" runat="server">
            <ContentTemplate>
                <div class="fullWidth noFloatOfHidden">
                    <div class="col-lg-8 col-max">
                        <div class="hidden">
                            <asp:Repeater ID="rptProductsTabs" runat="server" OnItemDataBound="rptProductsTabs_ItemDataBound">
                                <HeaderTemplate>
                                    <ul id="childs" class="nav nav-tabs nav-favs nav-inner">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li id="liCurrency" runat="server" class="nav-favs-tab inlineBlockCentered"><a href="#curreny<%# Eval("Currency") %>" data-toggle="tab" class="well-no-border">
                                        <asp:Literal ID="litTabCurrency" Text="<%$FrontEndResources:Client,Other%>" runat="server"></asp:Literal></a></li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="Products_ItemDataBound">
                        <HeaderTemplate>
                            <div id="productsTabContent" class="tab-content panel-content">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="tab-pane fade" id='curreny<%# Eval("Currency") %>'>
                                <div class="metro col-lg-8 col-max text-center position-total position-total-interior">

                                    <h4>
                                        <asp:Literal ID="litTotalAmount" Text="<%$FrontEndResources:Client,TotalValue%>" runat="server"></asp:Literal>
                                    </h4>
                                    <span id="totalAmount" class="position-value" runat="server">
                                        <asp:Literal ID="LitAmount" runat="server"></asp:Literal>
                                    </span>
                                    <span class="position-curr">
                                        <asp:Literal ID="LitCurrency" runat="server"></asp:Literal>
                                    </span>
                                </div>
                                <div class="clearBoth"></div>
                                <div class="row lineSeparator">

                                    <div class="metro info-bottom-text col-lg-8 col-max paddingTop65">
                                        <div class="col-xs-12 col-sm-6 col-md-8 col-lg-8">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center position-chart clearPadding noMargin">
                                                <h4 class="text-bold text-bottom-line customer-summary-title-chart">
                                                    <asp:Literal ID="Literal2" Text="<%$FrontEndResources:Client,TotalAssetsLbl%>" runat="server"></asp:Literal>
                                                    <span class="percentage">
                                                        <asp:Literal ID="litPercentageAssets" runat="server"></asp:Literal>
                                                    </span>
                                                </h4>
                                                <span id="spanAssets" runat="server">
                                                    <asp:Literal ID="Literal21" runat="server"></asp:Literal>

                                                </span>
                                                <span class="position-curr">
                                                    <asp:Literal ID="Literal22" runat="server"></asp:Literal></span>

                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-border-left graphWrapper">
                                                <div id="assetsContainer" data-type="assets" runat="server"></div>
                                            </div>
                                            <div class="clearBoth"></div>
                                        </div>

                                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 graphLegWrapper">
                                                <asp:Repeater ID="rptProductsLegendAssets" runat="server" OnItemDataBound="rptProductsLegend_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <div class="metro bs-legend-left">
                                                            <div class="bs-legend">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="bs-legend-title">
                                                            <div>
                                                                <asp:Label ID="lblLegendSerieColor" CssClass="label label-default label-empty" runat="server"></asp:Label>
                                                            </div>
                                                            <div>
                                                                <asp:Label ID="lblLegendSerie" CssClass="label label-transparent label-legend-left" runat="server"></asp:Label>
                                                                <div class="hidden">
                                                                    <asp:Label ID="lblLegendSerieValue" CssClass="label label-transparent label-legend-left bs-legend-ass" runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <asp:Repeater ID="rptProductsSubLegend" runat="server" OnItemDataBound="rptProductsSubLegend_ItemDataBound">
                                                            <HeaderTemplate>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <div style="margin-bottom: 20px; display: block; min-height: 55px;">
                                                                    <div>
                                                                        <asp:Label ID="lblLegendSubSerieColor" CssClass="label label-default sublabel-empty" runat="server"></asp:Label>
                                                                    </div>
                                                                    <div class="marginLeft10" style="margin-top: -60px">
                                                                        <asp:Label ID="lblLegendSubSerie" CssClass="label label-transparent label-legend-left lengend-tooltip overflowEllipsis" data-toggle="tooltip" data-placement="top" runat="server"></asp:Label><asp:Label ID="lblLegendSubSerieValue" CssClass="label label-transparent bs-legend-ass" runat="server"></asp:Label>
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
                                    </div>
                                </div>
                                <div class="row lineSeparator">
                                    <div class="metro info-bottom-text col-lg-8 col-max paddingTop65">
                                        <div class="col-xs-12 col-sm-6 col-md-8 col-lg-8">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center position-chart clearPadding noMargin">
                                                <h4 class="text-bottom-line2 customer-summary-title-chart">
                                                    <asp:Literal ID="Literal3" Text="<%$FrontEndResources:Client,TotalLiabilitiesLbl%>" runat="server"></asp:Literal>
                                                    <span class="percentage">
                                                        <asp:Literal ID="litPercentageLiabilites" runat="server"></asp:Literal>
                                                    </span>
                                                </h4>
                                                <span class="position-value negative">
                                                    <asp:Literal ID="Literal31" runat="server"></asp:Literal>

                                                </span>
                                                <span class="position-curr">
                                                    <asp:Literal ID="Literal32" runat="server"></asp:Literal></span>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-border-left graphWrapper">
                                                <div id="liabilitiesContainer" data-type="liabilities" runat="server"></div>
                                            </div>
                                            <div class="clearBoth"></div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 graphLegWrapper2">
                                                <asp:Repeater ID="rptProductsLegendLiabilities" runat="server" OnItemDataBound="rptProductsLegend_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <div class="metro bs-legend-left">
                                                            <div class="bs-legend">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="bs-legend-title">
                                                            <div>
                                                                <asp:Label ID="lblLegendSerieColor1" CssClass="label label-default label-empty" runat="server"></asp:Label>
                                                            </div>
                                                            <div>
                                                                <asp:Label ID="lblLegendSerie1" CssClass="label label-transparent label-legend-left" runat="server"></asp:Label>
                                                                <div class="hidden">
                                                                    <asp:Label ID="lblLegendSerieValue1" CssClass="label label-transparent label-legend-right bs-legend-liab" runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <asp:Repeater ID="rptProductsSubLegend1" runat="server" OnItemDataBound="rptProductsSubLegend_ItemDataBound">
                                                            <HeaderTemplate>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <div style="margin-bottom: 20px; display: block; min-height: 55px;">
                                                                    <div>
                                                                        <asp:Label ID="lblLegendSubSerieColor1" CssClass="label label-default sublabel-empty" runat="server"></asp:Label>
                                                                    </div>
                                                                    <div class="marginLeft10" style="margin-top: -60px;">
                                                                        <asp:Label ID="lblLegendSubSerie1" CssClass="label label-transparent label-legend-left lengend-tooltip overflowEllipsis" data-toggle="tooltip" data-placement="top" runat="server"></asp:Label><asp:Label ID="lblLegendSubSerieValue1" CssClass="label label-transparent bs-legend-liab" runat="server"></asp:Label>
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
                                    </div>
                                </div>
                                <div id="divOthers" runat="server" class="row lineSeparator">
                                    <div class="metro info-bottom-text col-lg-8 col-max paddingTop65">
                                        <div class="col-xs-12 col-sm-6 col-md-8 col-lg-8">

                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center position-chart clearPadding noMargin">
                                                <h4 class="text-bottom-line2 customer-summary-title-chart">
                                                    <asp:Literal ID="litOthersTitle" Text="<%$FrontEndResources:Client,OthersLbl%>" runat="server"></asp:Literal>
                                                </h4>
                                                <span class="position-value">
                                                    <asp:Literal ID="litOtherValue" runat="server"></asp:Literal>

                                                </span>
                                                <span class="position-curr">
                                                    <asp:Literal ID="litOtherValueCurr" runat="server"></asp:Literal></span>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-border-left graphWrapper">
                                                <div id="othersContainer" data-type="others" runat="server"></div>
                                            </div>
                                            <div class="clearBoth"></div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 graphLegWrapper2">
                                                <asp:Repeater ID="rptProductsLegendOthers" runat="server" OnItemDataBound="rptProductsLegend_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <div class="metro bs-legend-left">
                                                            <div class="bs-legend">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="bs-legend-title">
                                                            <div>
                                                                <asp:Label ID="lblLegendSerieColor2" CssClass="label label-default label-empty" runat="server"></asp:Label>
                                                            </div>
                                                            <div>
                                                                <asp:Label ID="lblLegendSerie2" CssClass="label label-transparent label-legend-left" runat="server"></asp:Label>
                                                                <div class="hidden">
                                                                    <asp:Label ID="lblLegendSerieValue2" CssClass="label label-transparent label-legend-right bs-legend-liab" runat="server"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <asp:Repeater ID="rptProductsSubLegend2" runat="server" OnItemDataBound="rptProductsSubLegend_ItemDataBound">
                                                            <HeaderTemplate>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <div style="margin-bottom: 20px; display: block; min-height: 55px;">
                                                                    <div>
                                                                        <asp:Label ID="lblLegendSubSerieColor2" CssClass="label label-default sublabel-empty" runat="server"></asp:Label>
                                                                    </div>
                                                                    <div style="margin-top: -60px; margin-left: 10px;">
                                                                        <asp:Label ID="lblLegendSubSerie2" CssClass="label label-transparent label-legend-left lengend-tooltip overflowEllipsis" data-toggle="tooltip" data-placement="top" runat="server"></asp:Label><asp:Label ID="lblLegendSubSerieValue2" CssClass="label label-transparent bs-legend-other" runat="server"></asp:Label>
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
                                    </div>
                                </div>
                                <div class="clearBoth"></div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            <div class="row lineSeparator"></div>
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <script type="text/javascript">
        CreateTooltip = function () {
            $(".lengend-tooltip").tooltip({
                html: true,
            });
        };
        $(document).ready(function () {
            $(".tab-pane").first().addClass("active");
            $(".tab-pane").first().addClass("in");
            CreateTooltip();
        });

        EndPageRequest = function () {
            $(".tab-pane").first().addClass("active");
            $(".tab-pane").first().addClass("in");
            CreateTooltip();
        };
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndPageRequest);

        function changeValue() {
            var p = $("[id$=ddlCurrencys_dlField] option:selected").text();
            var k = p;
            //alert(p);


            var array = $("#childs").children();
            for (i = 0; i < array.length; i++) {
                $(array[i]).removeClass('nav-favs-tab');
                $(array[i]).removeClass('active');
                $(array[i]).addClass('nav-favs-tab');
            }

            for (i = 0; i < array.length; i++) {
                var cont = $(array[i]).find('a').text();
                if (cont != null) {
                    cont = cont.trim();
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
        }

        GoToProduct = function (productType, productId) {
            switch (productType) {
                case "1": //CurrentAccounts
                    eBankit.Presentation.SetBlockPageCommon();
                    $('body').block();
                    if (productId != null && productId != '')
                        eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00106<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + productId;
                    else
                        eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00105<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>';
                    break;
                case "3": // SavingAccounts
                    eBankit.Presentation.SetBlockPageCommon();
                    $('body').block();
                    if (productId != null && productId != '')
                        eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00301<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + productId;
                    else
                        eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00303<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>';
                    break;
                case "12": // CreditCards
                    eBankit.Presentation.SetBlockPageCommon();
                    $('body').block();
                    if (productId != null && productId != '')
                        eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00202<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&card=' + productId;
                    else
                        eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00203<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>';
                    break;
                case "6": // payment phone buill
                    eBankit.Presentation.SetBlockPageCommon();
                    $('body').block();
                    if (productId != null && productId != '')
                        eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00502<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + productId;
                    else
                        eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00501<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>';
                    break;
                default:
                    break;
            }

        }
        /*************************************************
             ************ List of chart colors ***************
             *************************************************/
        var colors = {

                '<%= (int)eBankit.Business.Entities.Banking.PrositionType.FinancingCreditAccount %>': { 'main': "#BE1E2D", 'subColors': ['#540804', '#81171B', '#EB5E55', '#6C0E23', '#C75146'] },
                '<%= (int)eBankit.Business.Entities.Banking.PrositionType.EscrowAccount %>': { 'main': "#F3CF34", 'subColors': [] },
                '<%= (int)eBankit.Business.Entities.Banking.PrositionType.CreditCards %>': { 'main': "#EA9603", 'subColors': ['#FFD131', '#EDB458', '#FFE548', '#934B00', '#FFD289'] },
                '<%= (int)eBankit.Business.Entities.Banking.PrositionType.CurrentAccount %>': { 'main': "#8DC63F", 'subColors': ["#1C7C54", "#D0E562", "#DEF4C6", "#1B512D", "#93C48B"] },
                '<%= (int)eBankit.Business.Entities.Banking.PrositionType.SavingAccounts %>': { 'main': "#68B4BD", 'subColors': ["#2081C3", "#A5C4D4", "#C5FFFD", "#336699", "#AFDEDC"] },
                '<%= (int)eBankit.Business.Entities.Banking.PrositionType.Unkwown %>': { 'main': "#CBCBCB", 'subColors': ["#CBCBCB"] }
        };

        var currency = null;
        $(function () {

            var currentType = "0";
            var currentColor = 0;

            $('[data-main-color-type]').each(function () {
                var type = $(this).data("main-color-type");
                if (type != undefined && type != null) {
                    if (currentType != type) {
                        currentColor = 0;
                        currentType = type;
                    }
                    if (currentColor >= colors[type].subColors.length) currentColor = 0;
                    $(this).attr("style", "background-color:" + colors[type].main + ";");
                }
            });

            currentType = "0";
            currentColor = 0;
            $('[data-sub-color-type]').each(function () {
                var type = $(this).data("sub-color-type");
                if (type != undefined && type != null) {
                    if (currentType != type) {
                        currentColor = 0;
                        currentType = type;
                    }
                    if (currentColor >= colors[type].subColors.length) currentColor = 0;
                    $(this).attr("style", "background-color:" + colors[type].subColors[currentColor++] + ";");
                }
            });

            $('[data-type="assets"]').each(function () {
                var elem = $(this);
                currency = elem.data("currency");
                BuildSyncFusionChart(elem, elem.data("val"), elem.data("currency"));
            });
            $('[data-type="liabilities"]').each(function () {
                var elem = $(this);
                currency = elem.data("currency");
                BuildSyncFusionChart(elem, elem.data("val"), elem.data("currency"));
            });
            $('[data-type="others"]').each(function () {
                var elem = $(this);
                currency = elem.data("currency");
                BuildSyncFusionChart(elem, elem.data("val"), elem.data("currency"));
            });
        });

        function BuildPieChart(container, dataRaw, currency) {
            var i, j;
            var outsideData = [];
            var insideData = [];
            var totalInside = 0;
            var totalOutside = 0;
            for (i = 0; i < dataRaw.length; i++) { //Get Main Categories
                if (dataRaw[i].IsPositive)
                    var sign = "";
                else
                    var sign = "-";
                outsideData.push({
                    name: dataRaw[i].description,
                    y: dataRaw[i].value,
                    tooltipText: sign,
                    color: colors[dataRaw[i].type].main
                });
                totalOutside = totalOutside + dataRaw[i].value;
                var subCategories = dataRaw[i].SubCategorie;
                var colorId = 0;
                for (j = 0; j < subCategories.length; j++) { //Get SubCategories
                    if (colors[subCategories[j].type] == undefined) console.log("category type " + subCategories[j].type + " does not have color");
                    else if (colorId >= colors[subCategories[j].type].subColors.length) colorId = 0;
                    if (subCategories[j].IsPositive)
                        sign = "";
                    else
                        sign = "-";
                    insideData.push({
                        name: subCategories[j].description,
                        y: subCategories[j].value,
                        tooltipText: sign,
                        color: colors[subCategories[j].type].subColors[colorId++]
                    });
                    totalInside = totalInside + subCategories[j].value;
                }
            }
            insideData = fillIfEmpty(insideData, totalInside);
            outsideData = fillIfEmpty(outsideData, totalOutside);
            Highcharts.setOptions({
                lang: {
                    decimalPoint: numberDecimalSeparator,
                    thousandsSep: numberGroupSeparator
                }
            });
            container.highcharts({
                chart: {
                    type: 'pie',
                    renderTo: 'container',
                    width: 300,
                    height: 300
                },
                title: {
                    text: ''
                },
                plotOptions: {
                    pie: {
                        shadow: false,
                        center: ['50%', '50%'],
                    }
                },
                credits: {
                    enabled: false
                },
                tooltip: {
                    pointFormat: '{point.y}',
                    useHTML: true,
                    valueSuffix: ' ' + currency,
                    formatter: function () {
                        if (this.point.name == "N/A") {
                            return "<span style='font-size: 10px'>" + this.point.name + "</span> <br /><b>" + Highcharts.numberFormat(0, 2) + " " + currency + "</b>";
                        }

                        return "<span style='font-size: 10px'>" + this.point.name + "</span> <br /><b>" + this.point.tooltipText + Highcharts.numberFormat(this.y, 2) + " " + currency + "</b>";
                    }
                },
                series: [{
                    data: insideData,
                    size: '82%',
                    innerSize: '72%',
                    borderWidth: 0,
                    dataLabels: {
                        enabled: false
                    }
                }, {
                    data: outsideData,
                    size: '100%',
                    innerSize: '96%',
                    borderWidth: 0,
                    dataLabels: {
                        enabled: false
                    }
                }]
            });
        }

        function BuildSyncFusionChart(container, dataRaw, currency) {
            var i, j;
            var outsideData = [];
            var insideData = [];
            var totalInside = 0;
            var totalOutside = 0;
            for (i = 0; i < dataRaw.length; i++) { //Get Main Categories
                if (dataRaw[i].IsPositive)
                    var sign = "";
                else
                    var sign = "-";
                outsideData.push({
                    x: dataRaw[i].description,
                    y: dataRaw[i].value,
                    tooltipText: sign,
                    fill: colors[dataRaw[i].type].main
                });
                totalOutside = totalOutside + dataRaw[i].value;
                var subCategories = dataRaw[i].SubCategorie;
                var colorId = 0;
                for (j = 0; j < subCategories.length; j++) { //Get SubCategories
                    if (colors[subCategories[j].type] == undefined) console.log("category type " + subCategories[j].type + " does not have color");
                    else if (colorId >= colors[subCategories[j].type].subColors.length) colorId = 0;
                    if (subCategories[j].IsPositive)
                        sign = "";
                    else
                        sign = "-";
                    insideData.push({
                        x: subCategories[j].description,
                        y: subCategories[j].value,
                        tooltipText: sign,
                        fill: colors[subCategories[j].type].subColors[colorId++]
                    });
                    totalInside = totalInside + subCategories[j].value;
                }
            }
            insideData = fillIfEmpty(insideData, totalInside);
            outsideData = fillIfEmpty(outsideData, totalOutside);

            container.ejChart({


                commonSeriesOptions:
                {
                    type: 'doughnut',
                    enableAnimation: true,
                    marker: {
                        visible: false
                    },
                    highlightSettings: {
                        enable: true,
                        mode: 'point'
                    },
                    tooltip: {
                        visible: true,
                        opacity: 0.8
                    },
                    useGroupingSeparator: true
                },
                series: [{
                    points: insideData,
                    doughnutSize: 0.82,
                    doughnutCoefficient: 0.80
                },
                {
                    points: outsideData,
                    doughnutCoefficient: 0.88,
                    doughnutSize: 0.9,
                    tooltip: {
                        visible: true,
                        opacity: 0.8
                    }
                }],
                isResponsive: false,
                size: { height: '300', width:'300' },
                seriesRendering: "seriesRender",
                load: "loadTheme",
                legend: { visible: false },
                toolTipInitialize: function (args) {

                    var decimalPoint = numberDecimalSeparator;
                    var thousandsSep = numberGroupSeparator;

                    var serieIndex = args.data.seriesIndex;
                    var pointIndex = args.data.pointIndex;
                    var yValue = args.model.series[serieIndex].points[pointIndex].y;
                    var xLabel = args.model.series[serieIndex].points[pointIndex].x;

                    var formattedValue = ej.format(yValue, 'n2');

                    if (xLabel == "N/A") {

                        formattedValue = ej.format(0, 'n2');
                        var tooltipYValue = formattedValue.replace(/,/g, "__COMMA__").replace(/\./g, decimalPoint).replace(/__COMMA__/g, thousandsSep);
                        args.data.currentText = "<b>" + xLabel + "</b> <br/>" + tooltipYValue + " " + currency;
                    }
                    else {
                        var tooltipYValue = formattedValue.replace(/,/g, "__COMMA__").replace(/\./g, decimalPoint).replace(/__COMMA__/g, thousandsSep);
                        args.data.currentText = "<b>" + xLabel + "</b> <br/>" + tooltipYValue + " " + currency;
                    }




                }

            });

        }
        function fillIfEmpty(data, total) {
            if (total <= 0) {
                data.push({
                    name: "N/A",
                    y: 1,
                    color: colors[0].main
                });
            }
            return data;
        }



    </script>

    <style type="text/css">
        @media (min-width: 980px) {
            .integratedPositionFilterContainer div .col-lg-6:first-child .field.field_v2.field-full .label-wrapper label {
                width: auto;
            }
        }

        .field_v2 .leftField-label {
            font-size: 16px;
        }
    </style>

</asp:Content>
