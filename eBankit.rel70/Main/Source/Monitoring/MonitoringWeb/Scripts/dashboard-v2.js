
var blue = "#348fe2",
    blueLight = "#5da5e8",
    blueDark = "#1993E4",
    aqua = "#49b6d6",
    aquaLight = "#6dc5de",
    aquaDark = "#3a92ab",
    green = "#00acac",
    greenLight = "#33bdbd",
    greenDark = "#008a8a",
    orange = "#f59c1a",
    orangeLight = "#f7b048",
    orangeDark = "#c47d15",
    dark = "#2d353c",
    grey = "#b6c2c9",
    purple = "#727cb6",
    purpleLight = "#8e96c5",
    purpleDark = "#5b6392",
    red = "#ff5b57";

function randomIntFromInterval(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
}
/*   
Template Name: Color Admin - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.5
Version: 1.9.0
Author: Sean Ngu
Website: http://www.seantheme.com/color-admin-v1.9/admin/
*/
var getMonthName = function (e) {
    var t = [];
    t[0] = "0h";
    t[1] = "1h";
    t[2] = "2h";
    t[3] = "3h";
    t[4] = "4h";
    t[5] = "5h";
    t[6] = "6h";
    t[7] = "7h";
    t[8] = "8h";
    t[9] = "9h";
    t[10] = "10h";
    t[11] = "11h";
    t[12] = "12h";
    t[13] = "13h";
    t[14] = "14h";
    t[15] = "15h";
    t[16] = "16h";
    t[17] = "17h";
    t[18] = "18h";
    t[19] = "19h";
    t[20] = "20h";
    t[21] = "21h";
    t[22] = "22h";
    t[23] = "23h";
    return t[e]
};
var getDate = function (e) {
    var t = new Date(e);
    var n = t.getDate();
    var r = t.getMonth() + 1;
    var i = t.getFullYear();
    if (n < 10) {
        n = "0" + n
    }
    if (r < 10) {
        r = "0" + r
    }
    t = i + "-" + r + "-" + n;
    return t
};

var dummyData = [];

for (var i = 0; i < 24; i++) {
    dummyData[i] = {
        x: "2015-23-10 " + i + ":00",
        s: randomIntFromInterval(100, 500),
        u: randomIntFromInterval(100, 200),
        t: randomIntFromInterval(500, 1500),
        e: randomIntFromInterval(0, 50),
    };
}

var handleVisitorsLineChart = function () {

    var s = "#2A72B5";
    var u = "#00ACAC";
    var t = "#DDCCAA";
    var e = "#CC4946";
    var i = "rgba(0,0,0,0.6)";
    var s = "rgba(255,255,255,0.4)";



    Morris.Line({
        element: "visitors-line-chart",
        data: dummyData,
        xkey: "x",
        ykeys: ["s", "u", "t", "e"],
        xLabelFormat: function (e) {
            e = getMonthName(e.getHours());
            return e.toString()
        },
        xLabels: "hour",
        labels: ["Sessions", "Users", "Transactions", "Errors"],
        lineColors: [s, u, t, e],
        pointFillColors: [s, u, t, e],
        lineWidth: "2px",
        pointStrokeColors: [s, u, t, e],
        resize: true,
        gridTextFamily: "Open Sans",
        gridTextColor: s,
        gridTextWeight: "normal",
        gridTextSize: "11px",
        gridLineColor: "rgba(0,0,0,0.5)",
        hideHover: "auto"
    })
};

var handleVisitorsDonutChart = function () {
    var s = "#2A72B5";
    var u = "#00ACAC";
    var t = "#DDCCAA";
    var e = "#CC4946";
    var totals = 0;
    var totalu = 0;
    var totalt = 0;
    var totale = 0;

    for (var i = 0; i < 24; i++) {
        totals = totals + dummyData[i].s;
        totalu = totalu + dummyData[i].u;
        totalt = totalt + dummyData[i].t;
        totale = totale + dummyData[i].e;
    };


    Morris.Donut({
        element: "visitors-donut-chart",
        data: [{
            label: "Sessions",
            value: totals
        }, {
            label: "Users",
            value: totalu
        }, {
            label: "Transactions",
            value: totalt
        }, {
            label: "Errors",
            value: totale
        }],
        colors: [s, u, t, e],
        labelFamily: "Open Sans",
        labelColor: "rgba(255,255,255,0.4)",
        labelTextSize: "12px",
        backgroundColor: "#242a30"
    })
};


var buildPercentageString = function (perc) {
    var result = perc+'% ';
    if (perc < 0)
    {
        result += 'less ';
    }
    else {
        result += 'more ';
    }
    result += 'than yesterday';
    return result;
}

var fillStats = function (obj, total, perc) {
    obj.find('.stats-number').html(total);
    obj.find('.progress-bar').width(perc + '%');
    obj.find('.stats-desc').html(buildPercentageString(perc));
}

var handleDashboardStats = function (data) {
    var sessionObj = $('#sessionStats');
    var userObj = $('#userStats');
    var transactionObj = $('#transactionStats');
    var errorObj = $('#errorStats');

    fillStats(sessionObj, data.sessionTotal, data.sessionPerc);
    fillStats(userObj, data.userTotal, data.userPerc);
    fillStats(transactionObj, data.transactionTotal, data.transactionPerc);
    fillStats(errorObj,data.errorTotal,data.errorPerc);
}



var DashboardV2 = function (data) {
    "use strict";
    return {
        init: function (data) {
            handleVisitorsLineChart();
            handleVisitorsDonutChart();
            //handleVisitorsVectorMap();
            //handleDonutChart();
            //handleDashboardStats(data);
        }
    }
}()
