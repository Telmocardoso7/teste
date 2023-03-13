$(document).ready(function () {
    $(".tab-pane").first().addClass("active");
    $(".tab-pane").first().addClass("in");

    CreateTooltip();
});

EndPageRequest = function () {
    CreateTooltip();
};

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndPageRequest);

CreateTooltip = function () {
    $(".lengend-tooltip").tooltip({
        html: true,
    });
};
toolTipInitialize: 'tooltip',
    $(function () {
        $('[data-color-type]').each(function () {
            var type = $(this).data("color-type");
            if (type != undefined && type != null) {
                $(this).attr("style", "background-color:" + colors[type] + ";");
            }
        });

        if ($("[id$=hdnCategoriesData]").val() != "" && $("[id$=hdnCategoriesData]").val() !== 'undefined') {
            var dataRaw = JSON.parse($("[id$=hdnCategoriesData]").val());

            var i, j;
            var outsideData = [];
            var insideData = [];
            var totalInside = 0;
            var totalOutside = 0;

            for (i = 0; i < dataRaw.length; i++) { //Get Main Categories
                outsideData.push({
                    x: dataRaw[i].description,
                    y: dataRaw[i].value,
                    text: dataRaw[i].value + "%",
                    type: dataRaw[i].type,
                    fill: colors[dataRaw[i].type]
                });
                totalOutside = totalOutside + dataRaw[i].value;
                var subCategories = dataRaw[i].SubCategorie;

                for (j = 0; j < subCategories.length; j++) { //Get SubCategories

                    if (colors[subCategories[j].type] == undefined) console.log("category type " + subCategories[j].type + " does not have color");
                    insideData.push({
                        x: subCategories[j].description,
                        y: subCategories[j].value,
                        text: subCategories[j].value + "%",
                        type: dataRaw[i].type,
                        fill: colors[subCategories[j].type]
                    });
                    totalInside = totalInside + subCategories[j].value;
                }
            }
            insideData = fillIfEmpty(insideData, totalInside);
            outsideData = fillIfEmpty(outsideData, totalOutside);
            BuildDoughnutChart($('#customerSummary'), insideData, outsideData);
        }
    });

function fillIfEmpty(data, total) {
    if (total <= 0) {
        data.push({
            x: "N/A",
            y: 100,
            text: 100 + "%",
            type: 0,
            fill: colors[0]
        });
    }
    return data;
}

function BuildPieChart(container, insideData, outsideData) {
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
            pointFormat: '{point.tooltipText}',
            valueSuffix: '%'
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
            },
        }]
    });
}



function BuildDoughnutChart(container, insideData, outsideData) {
    container.ejChart({

        commonSeriesOptions:
        {
            type: 'doughnut',
            enableAnimation: true,
            marker: {
                visible: false
            },
            tooltip: {
                visible: true,
                format: "<span style='color:#point.fill#'><b>#point.x# </b></span><br/> #point.text#",
                opacity: 0.8,
            }, highlightSettings: {
                enable: true,
                mode: 'point'
            },
        },
        series: [{
            points: insideData,
            doughnutSize: 0.82,
            doughnutCoefficient: 0.80,
            
        }, {
            points: outsideData,
            doughnutCoefficient: 0.88,
            doughnutSize: 0.9,
       

        }],


        isResponsive: true,
        size: { height: '300' },
        seriesRendering: "seriesRender",
        load: "loadTheme",
        legend: { visible: false }

    });
}