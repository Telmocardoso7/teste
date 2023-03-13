<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreditSimulationGraphData.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.CreditSimulationGraphData" %>


<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced bs-head-metro bs-reduced-transaction col-max  transp" style="margin-top: 20px;">
    <asp:Panel ID="Panel1" CssClass="col-xs-12 col-sm-12 col-md-6 col-lg-6 " runat="server">
        <div id="container" style="width: 100%; height: 430px; margin: 0 auto"></div>
    </asp:Panel>
    <asp:Panel ID="Panel2" CssClass="col-xs-12 col-sm-12 col-md-6 col-lg-6" Style="text-align: center; border: 1px solid #eee;" runat="server">
        <div id="containerPie"></div>
        <div id="containerDivSerie1" class="divCreditSimulationGraphlegend"></div>
        <div class="clearBoth"></div>
        <div id="containerDivSerie2" class="divCreditSimulationGraphlegend"></div>
    </asp:Panel>
    <div class="clearBoth"></div>
</div>
<div class="clearBoth"></div>



<asp:HiddenField ID="hdngraphCategories" runat="server" />
<asp:HiddenField ID="hdngraphInstallments" runat="server" />
<asp:HiddenField ID="hdngraphInterests" runat="server" />
<asp:HiddenField ID="hdngraphTaxes" runat="server" />
<asp:HiddenField ID="hdnpieGraphCategories" runat="server" />
<asp:HiddenField ID="hdnpieGraphData" runat="server" />
<asp:HiddenField ID="hdnpieChartTooltipData" runat="server" />
<asp:HiddenField ID="hdnpieChartLoanAmount" runat="server" />
<asp:HiddenField ID="hdnpieChartExpensesAmount" runat="server" />
<asp:HiddenField ID="hdnpieChartLoanAmountFormatted" runat="server" />
<asp:HiddenField ID="hdnpieChartExpensesAmountFormatted" runat="server" />
<asp:HiddenField ID="hdnpieChartTotalPrincipal" runat="server" />
<asp:HiddenField ID="hdnpieChartTotalPrincipalFormatted" runat="server" />
<asp:HiddenField ID="hdnpieChartCurrency" runat="server" />

<%--<style>
.legend { list-style: none; font-size: 12px; font-style: Normal; font-family: Segoe UI; font-weight: normal;}
.legend li { float: left; margin-right: 10px; }
.legend span { border: 1px solid #ccc; float: left; width: 12px; height: 12px; margin: 2px; }


</style>--%>

<script type="text/javascript">
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        buildGraphSyncFusion();
    });

    $(document).ready(function () {
        buildGraphSyncFusion();
    });


    function buildGraph() {


        /// <summary>
        /// s this instance.
        /// </summary>
        /// <returns></returns>
        areaChartCategories = JSON.parse($('[id$=hdngraphCategories]').val());
        areaChartInstallments = JSON.parse($('[id$=hdngraphInstallments]').val());
        areaChartInterests = JSON.parse($('[id$=hdngraphInterests]').val());
        if ($('[id$=hdngraphTaxes]').val() != '')
            areaChartTaxes = JSON.parse($('[id$=hdngraphTaxes]').val());
        else
            areaChartTaxes = null;
        pieChartCategories = JSON.parse($('[id$=hdnpieGraphCategories]').val());
        pieChartData = JSON.parse($('[id$=hdnpieGraphData]').val());
        pieChartTooltipData = JSON.parse($('[id$=hdnpieChartTooltipData]').val());
        pieChartLoanAmount = parseFloat($('[id$=hdnpieChartLoanAmount]').val());
        pieChartExpensesAmount = parseFloat($('[id$=hdnpieChartExpensesAmount]').val());
        pieChartLoanAmountFormatted = $('[id$=hdnpieChartLoanAmountFormatted]').val();
        pieChartExpensesAmountFormatted = $('[id$=hdnpieChartExpensesAmountFormatted]').val();
        pieChartTotalPrincipal = parseFloat($('[id$=hdnpieChartTotalPrincipal]').val());
        pieChartTotalPrincipalFormatted = $('[id$=hdnpieChartTotalPrincipalFormatted]').val();
        pieChartCurrency = $('[id$=hdnpieChartCurrency]').val();
        var colors = ["#A45D18", "#88841A"],
            categories = [top.eBankit.Presentation.GetResource("TotalCapital"), top.eBankit.Presentation.GetResource("TotalCharges")],
            data = [{
                y: pieChartLoanAmount,
                tooltipData: pieChartLoanAmountFormatted,
                color: colors[0],
                drilldown:
                {
                    categories: [top.eBankit.Presentation.GetResource("TotalRepayments")],
                    data: [pieChartTotalPrincipal],
                    tooltipData: [pieChartTotalPrincipalFormatted],
                    color: ["#C9741B"]
                }
            },
            {
                y: pieChartExpensesAmount,
                tooltipData: pieChartExpensesAmountFormatted,
                color: colors[1],
                drilldown: {
                    categories: pieChartCategories,
                    data: pieChartData,
                    tooltipData: pieChartTooltipData,
                    color: ["#FFC94A", "#A4B23C", "#669900", "#336600"]
                }
            }],
            contasData = [],
            depositosData = [],
            i,
            j,
            dataLen = data.length,
            drillDataLen,
            brightness;
        for (i = 0; i < dataLen; i += 1) {
            contasData.push({
                name: categories[i],
                y: data[i].y,
                color: data[i].color,
                tooltipText:
                    data[i].tooltipData
            });
            drillDataLen = data[i].drilldown.data.length;
            for (j = 0; j < drillDataLen; j += 1) {
                brightness = 0.2 - (j / drillDataLen) / 5;
                depositosData.push({
                    name: data[i].drilldown.categories[j],
                    y: data[i].drilldown.data[j],
                    color: data[i].drilldown.color[j],
                    tooltipText: data[i].drilldown.tooltipData[j]
                });
            }
        }

        var chartSeries;

        if (areaChartTaxes != null && areaChartTaxes != '') {
            chartSeries = [{
                name: top.eBankit.Presentation.GetResource("Taxes"),
                data: areaChartTaxes,
                color: ["#12D8F3"]
            }, {
                name: top.eBankit.Presentation.GetResource("Repayment"),
                data: areaChartInstallments,
                color: ["#0AAEC5"]
            }, {
                name: top.eBankit.Presentation.GetResource("InterestValue"),
                data: areaChartInterests,
                color: ["@brand-primary"]
            }];
        }
        else {
            chartSeries = [{
                name: top.eBankit.Presentation.GetResource("Repayment"),
                data: areaChartInstallments,
                color: ["#0AAEC5"]
            }, {
                name: top.eBankit.Presentation.GetResource("InterestValue"),
                data: areaChartInterests,
                color: ["@brand-primary"]
            }];
        }

        $('#container').highcharts({
            chart: {
                type: 'area'
            },
            legend: {
                useHTML: true
            },
            title: {
                text: top.eBankit.Presentation.GetResource("PaymentPlan"),
            },
            xAxis: {
                categories: areaChartCategories,
                tickmarkPlacement: 'on',
                title: {
                    enabled: false
                }
            },
            yAxis: {
                title: {
                    text: ''
                },
                labels: {
                    formatter: function () {
                        return this.value;
                    }
                }
            },
            tooltip: {
                shared: true,
                useHTML: true,
                valueSuffix: " " + pieChartCurrency
            },
            plotOptions: {

                area: {
                    stacking: 'normal',
                    lineColor: '#000000',
                    lineWidth: 1,
                    marker: {
                        enabled: false,
                        radius: 2,
                        states: {
                            hover: {
                                enabled: true
                            }
                        }
                    }
                }
            },
            credits: {
                enabled: false
            },
            series: chartSeries
        });


        $('#containerPie').highcharts({
            chart: {
                type: 'pie',
                renderTo: 'container',
                width: 400,
                height: 400
            },
            legend: {
                useHTML: true
            },
            title: {
                text: top.eBankit.Presentation.GetResource("CreditTotalValue")
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    shadow: false,
                    center: ['50%', '50%'],
                    showInLegend: true
                }
            },
            credits: {
                enabled: false
            },
            tooltip: {
                pointFormat: '{point.tooltipText}',
                useHTML: true,
                valueSuffix: '%'
            },
            series: [{
                data: depositosData,
                size: '82%',
                innerSize: '72%',
                borderWidth: 0,
                dataLabels: {
                    enabled: false
                }
            },
            {
                data: contasData,
                size: '100%',
                innerSize: '96%',
                borderWidth: 0,
                dataLabels: {
                    enabled: false
                },
            }]
        });
    }

    function buildGraphSyncFusion() {


        /// <summary>
        /// s this instance.
        /// </summary>
        /// <returns></returns>
        areaChartCategories = JSON.parse($('[id$=hdngraphCategories]').val());
        areaChartInstallments = JSON.parse($('[id$=hdngraphInstallments]').val());
        areaChartInterests = JSON.parse($('[id$=hdngraphInterests]').val());
        if ($('[id$=hdngraphTaxes]').val() != '')
            areaChartTaxes = JSON.parse($('[id$=hdngraphTaxes]').val());
        else
            areaChartTaxes = null;
        pieChartCategories = JSON.parse($('[id$=hdnpieGraphCategories]').val());
        pieChartData = JSON.parse($('[id$=hdnpieGraphData]').val());
        pieChartTooltipData = JSON.parse($('[id$=hdnpieChartTooltipData]').val());
        pieChartLoanAmount = parseFloat($('[id$=hdnpieChartLoanAmount]').val());
        pieChartExpensesAmount = parseFloat($('[id$=hdnpieChartExpensesAmount]').val());
        pieChartLoanAmountFormatted = $('[id$=hdnpieChartLoanAmountFormatted]').val();
        pieChartExpensesAmountFormatted = $('[id$=hdnpieChartExpensesAmountFormatted]').val();
        pieChartTotalPrincipal = parseFloat($('[id$=hdnpieChartTotalPrincipal]').val());
        pieChartTotalPrincipalFormatted = $('[id$=hdnpieChartTotalPrincipalFormatted]').val();
        pieChartCurrency = $('[id$=hdnpieChartCurrency]').val();
        var colors = ["#A45D18", "#88841A"],
            categories = [top.eBankit.Presentation.GetResource("TotalCapital"), top.eBankit.Presentation.GetResource("TotalCharges")],
            data = [{
                y: pieChartLoanAmount,
                tooltipData: pieChartLoanAmountFormatted,
                color: colors[0],
                drilldown:
                {
                    categories: [top.eBankit.Presentation.GetResource("TotalRepayments")],
                    data: [pieChartTotalPrincipal],
                    tooltipData: [pieChartTotalPrincipalFormatted],
                    color: ["#C9741B"]
                }
            },
            {
                y: pieChartExpensesAmount,
                tooltipData: pieChartExpensesAmountFormatted,
                color: colors[1],
                drilldown: {
                    categories: pieChartCategories,
                    data: pieChartData,
                    tooltipData: pieChartTooltipData,
                    color: ["#FFC94A", "#A4B23C", "#669900", "#336600"]
                }
            }],
            contasData = [],
            depositosData = [],
            i,
            j,
            dataLen = data.length,
            drillDataLen,
            brightness;
        for (i = 0; i < dataLen; i += 1) {
            contasData.push({
                x: categories[i],
                y: data[i].y,
                fill: data[i].color,
                text: data[i].tooltipData
            });
            drillDataLen = data[i].drilldown.data.length;
            for (j = 0; j < drillDataLen; j += 1) {
                brightness = 0.2 - (j / drillDataLen) / 5;
                depositosData.push({
                    x: data[i].drilldown.categories[j],
                    y: data[i].drilldown.data[j],
                    fill: data[i].drilldown.color[j],
                    text: data[i].drilldown.tooltipData[j]
                });
            }
        }

        var chartSeries;
        var datasourceTaxes = [];
        var datasourceInstallments = [];
        var datasourceInterests = [];
   
        if (areaChartTaxes != null && areaChartTaxes != '') {

            for (var j = 0; j < areaChartCategories.length; j++) {

                var itemTaxes = {
                    x: j,
                    y: areaChartTaxes[j]
                };

                datasourceTaxes.push(itemTaxes);

                var itemInstallments = {
                    x: j,
                    y: areaChartInstallments[j]
                };

                datasourceInstallments.push(itemInstallments);

                var itemInterests = {
                    x: j,
                    y: areaChartInterests[j]
                };

                datasourceInterests.push(itemInterests);
            }

                chartSeries =
                [
                    {
                        points: datasourceTaxes,
                        xName: 'x', width: 2,
                        yName: 'y',
                        name: top.eBankit.Presentation.GetResource("Taxes"),
                        fill: '#12D8F3',
                        border: { color: 'black', width: 1 }
                    },
                    {
                        points: datasourceInterests,
                        xName: 'x', width: 2,
                        yName: 'y',
                        name: top.eBankit.Presentation.GetResource("InterestValue"),
                        fill: '@brand-primary'
                    },
                    {
                        points: datasourceInstallments,
                        xName: 'x', width: 2,
                        yName: 'y',
                        name: top.eBankit.Presentation.GetResource("Repayment"),
                        fill: '#0AAEC5',
                        border: { color: 'black', width: 1 }
                    }
                ];
        }
        else {

            for (var j = 0; j < areaChartCategories.length; j++) {

                var itemInstallments = {
                    x: j,
                    y: areaChartInstallments[j]
                };

                datasourceInstallments.push(itemInstallments);

                var itemInterests = {
                    x: j,
                    y: areaChartInterests[j]
                };

                datasourceInterests.push(itemInterests);
            }

            chartSeries =
                [
                {
                    points: datasourceInterests,
                    xName: 'x', width: 2,
                    yName: 'y',
                    name: top.eBankit.Presentation.GetResource("InterestValue"),
                    fill: '@brand-primary',
                    border: { color: 'black', width: 1 }
                },
                {
                    points: datasourceInstallments,
                    xName: 'x', width: 2,
                    yName: 'y',
                    name: top.eBankit.Presentation.GetResource("Repayment"),
                    fill: '#0AAEC5',
                    border: { color: 'black', width: 1 }
                }
                
            ];
        }

     

        $('#container').ejChart({
            commonSeriesOptions:
            {
                type: 'stackingarea',
                enableAnimation: true,
                tooltip: {
                    visible: true,
                    format: "#series.name#: #point.y# " + pieChartCurrency,
                    border: { width: 3, color: "#0AAEC5" }

                }

            },
            legend: {
                useHTML: true
            },
            title: {
                text: top.eBankit.Presentation.GetResource("PaymentPlan"),
            },
            xAxis: {
                categories: areaChartCategories,
                tickmarkPlacement: 'on',
                title: {
                    enabled: false
                }
            },
            yAxis: {
                title: {
                    text: ''
                },
                labels: {
                    formatter: function () {
                        return this.value;
                    }
                }
            },
            plotOptions: {

                area: {
                    stacking: 'normal',
                    lineColor: '#000000',
                    lineWidth: 1,
                    marker: {
                        enabled: false,
                        radius: 2,
                        states: {
                            hover: {
                                enabled: true
                            }
                        }
                    }
                }
            },
            credits: {
                enabled: false
            },
            series: chartSeries,
            crosshair:
            {
                marker: { opacity: 2 },
                line: { color: 'gray', width: 1 },
                visible: true,
                type: 'trackball',
                trackballTooltipSettings: {
                    mode: "floating"
                }
            },
            isResponsive: true
        });



        $('#containerPie').ejChart({

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
                    format: "<span style='color:#point.fill#'><b>#point.x# </b></span><br/> #point.text#",
                    opacity: 0.8
                },
            },
            series: [{
                points: depositosData,
                doughnutSize: 0.82,
                doughnutCoefficient: 0.80,
              
            }, {
                points: contasData,
                doughnutCoefficient: 0.88,
                doughnutSize: 0.9,
            }],
            isResponsive: true,
            size: { height: '400' },
            title: {
                text: top.eBankit.Presentation.GetResource("CreditTotalValue")
            },
            legend: { visible: false }

        });

         
        var innerHtml = '<ul class="creditSimulationGraphlegend">';

        var i;
        for (i = 0; i < depositosData.length; i++) {
          innerHtml += "<li><span style=\"border-radius: 15px;background-color:" +depositosData[i].fill +";\"></span>" +  depositosData[i].x +"</li>";
        }
        
        innerHtml += "</ul>";

        document.getElementById("containerDivSerie1").innerHTML = innerHtml;

        innerHtml = '<ul class="creditSimulationGraphlegend">';
        for (i = 0; i < contasData.length; i++) {
          innerHtml += "<li><span style=\"border-radius: 15px;background-color:" +contasData[i].fill +";\"></span>" +  contasData[i].x +"</li>";
        }
        
        innerHtml += "</ul>";

        document.getElementById("containerDivSerie2").innerHTML = innerHtml;


        

    }
</script>
