$(".document").ready(function () {  
    if (typeof Morris != 'undefined') { 
        Morris.Donut.prototype.setLabels = function (label1, label2) {
            var inner, maxHeightBottom, maxHeightTop, maxWidth, text1bbox, text1scale, text2bbox, text2scale;
            inner = (Math.min(this.el.width() / 2, this.el.height() / 2) - 10) * 2 / 3;
            maxWidth = 1.8 * inner;
            maxHeightTop = inner / 2;
            maxHeightBottom = inner / 3;
            this.text1.attr({
                text: label1,
                transform: ''
            });
            text1bbox = this.text1.getBBox();
            text1scale = Math.min(maxWidth / text1bbox.width, maxHeightTop / text1bbox.height);
            if (isNaN(text1scale) || text1scale == "-Infinity") {
                text1scale = "0.0";
            }
            this.text1.attr({
                transform: "S" + text1scale + "," + text1scale + "," + (text1bbox.x + text1bbox.width / 2) + "," + (text1bbox.y + text1bbox.height)
            });
            this.text2.attr({
                text: label2,
                transform: ''
            });
            text2bbox = this.text2.getBBox();
            text2scale = Math.min(maxWidth / text2bbox.width, maxHeightBottom / text2bbox.height);
            if (isNaN(text2scale) || text2scale == "-Infinity") {
                text2scale = "0.0";
            }
            var t = {
                transform: "S" + text2scale + "," + text2scale + "," + (text2bbox.x + text2bbox.width / 2) + "," + text2bbox.y
            };
            return this.text2.attr(t);
        };
    }
});


function isJson(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}

//highlight sidebar menu item
var ToggleSideBarMenu = function (menu, submenu) {
    menu.addClass("active");
    submenu.addClass("active");
}

var InitializeTooltip = function () {
    $('[data-toggle="tooltip"]').tooltip({ container: 'body' });
}

var InitializeDropdowns = function () {
    $('.selectpicker').selectpicker();
}

var InitializeRangedDatetimePicker = function (from, to, format) {

    $('.dpicker').datetimepicker({
        format: format
    });

    from.on("dp.change", function (e) {
        if (from.data("DateTimePicker").date().toString() == moment().toString())
            from.data("DateTimePicker").date(from.data("DateTimePicker").date().startOf("day"));
        to.data("DateTimePicker").minDate(e.date);
    });
    to.on("dp.change", function (e) {
        from.data("DateTimePicker").maxDate(e.date);
    });
}

var InitializeAutoComplete = function (obj, url) {
    obj.autocomplete({
        source: url
    });
}

var InitializeSlider = function (obj, min, max, from, to) {
    obj.ionRangeSlider({
        min: parseInt(min),
        max: parseInt(max),
        postfix: " s",
        type: "double",
        grid: true,
        from: parseInt(from),
        to: parseInt(to)
    });
}

var InitializeTableLoading = function (tableid) {
    var height = 100;
    $('#' + tableid).find('tbody').append('<div id="loading-row"><span class="spinner"></span></div>');
    $('#loading-row').height(height);

    $('#' + tableid).on('preXhr.dt', function (e, settings, data) {
        var height = $('#' + tableid + ' tbody').height();
        $('#' + tableid + ' tbody tr').remove();
        $('#' + tableid + ' tbody').append('<div id="loading-row"><span class="spinner"></span></div>');
        $('#loading-row').height(height);
    })

    $('#' + tableid).on('xhr.dt', function (e, settings, data) {
        $('#' + tableid + ' tbody').find('#loading-row').remove();
    })
}

var InitializeTableHoverStyle = function (tableid, tbl) {
    $('#' + tableid + ' > tbody').on('mouseover', 'td', function () {
        var rowIdx = tbl.cell(this).index().row;
        $(tbl.row(rowIdx).node()).addClass('row_selected');
        $(tbl.row(rowIdx).node()).addClass('cursorHand');
    });

    $('#' + tableid + ' > tbody').on('mouseout', 'td', function () {
        var rowIdx = tbl.cell(this).index().row;
        $(tbl.rows().nodes()).removeClass('row_selected');
    });
}

var InitializeDataTable = function (tableid, geturl, columns, order, paging, column2, switchClass, domOptions) {
    if (typeof paging === "undefined" || paging === null) {
        paging = true;
    }

    if (typeof switchClass === "undefined" || switchClass === null) {
        switchClass = 'js-switch';
    }
    
    var options = {
        "sPaginationType": "full_numbers",
        "paging": paging,
        "serverSide": true,
        "processing": true,
        "searching": false,
        "ordering": true,
        "order": order,
        ajax: {
            url: geturl,
            type: "POST",
            dataSrc: 'requests'
        },
        "aoColumns": columns,
        "fnDrawCallback": function () {
            var elems = Array.prototype.slice.call(document.querySelectorAll('.' + switchClass));

            elems.forEach(function (html) {
                var switchery = new Switchery(html, { color: 'rgb(0, 172, 172)' });
            });
        }
    }

    if (typeof domOptions != "undefined" && domOptions != null) {
        options.dom = domOptions;
    }
    table = $('#' + tableid).DataTable(options);

    table.$('td').tooltip({
        "delay": 0,
        "track": true,
        "fade": 250
    });

    InitializeTableLoading(tableid);
    InitializeTableHoverStyle(tableid, table);

    if (typeof column2 !== "undefined" && column2 != null) {
        if (column2 === 'Today' || column2 === '') {
            $(table.column(2).header()).html('Avg<br>Execution(s)');
        }
        else {
            $(table.column(2).header()).html('Avg<br>Execution(ms)');
        }
    }

    $('#' + tableid).css('width', '100%');
}

var InitializeGraph = function (objid, dataurl, clickfunction, type, column2) {
    var timeUnit = 'ms';
    var xKey = 'TimeLine';
    var yKeys = [];
    var labels = [];
    var tendency = '';

    if (typeof type !== "undefined") {
        if (type === 'Requests') {
            yKeys = ['NRequests', 'NRequestsTendency'];
            labels = ['Nº Request', 'Nº Request Tendency'];
            tendency = 'NRequests';
        }
        else {
            yKeys = ['AvgExecutionTime', 'AvgExecutionTimeTendency'];
            labels = ['Response Time(' + timeUnit + ')', 'Response Time(' + timeUnit + ') Tendency'];
            tendency = 'AvgExecutionTime';
        }
    }


    $('#' + objid).append('<div id="loading-row"><span class="spinner"></span></div>');
    $.ajax({
        dataType: "json",
        url: dataurl,
        success: function (data) {
            data = calculateTendencyHelper(data, tendency); //calculateTendencyValues(data);
            $(window).prop("w" + objid, Morris.Area({
                data: data,
                xkey: xKey,
                ykeys: yKeys,
                labels: labels,
                fillOpacity: 0.5,
                hideHover: 'auto',
                behaveLikeLine: true,
                resize: true,
                parseTime: false,
                pointFillColors: ['#ffffff'],
                pointStrokeColors: ['black'],
                element: objid
            }).on('click', clickfunction));

            $("#" + objid).find("#loading-row").remove();

            // Each line have 2 path (first for area, second for line)
            // Each graph has 5 path at begin, before each yKeys
            // Them (initial + (index * 2) + (0 for area || 1 for line)
            // Remove area fill from (AvgExecutionTimeTendency)(5+(1*2)+0)=7  and (NRequestsTendency)(5+(3*2)+0)=11 ykeys 
            $($($("#" + objid).find("path"))[7]).css("fill-opacity", "0.0");
        }
    });

}

var InitializeDonutGraph1 = function (objid, dataurl) {
    $('#' + objid).append('<div id="loading-row"><span class="spinner"></span></div>');
    $.ajax({
        dataType: "json",
        url: dataurl,
        success: function (data) {

            if (data.length > 0) {
                donutchart1 = Morris.Donut({
                    data: data,
                    element: objid,
                    resize: 'true'
                });
                window.donutchart1 = donutchart1;
            }
            else {
                $('#graph1').html('<h3 class="panel-title text-center">No data to show.</h3>');
            }
            $("#" + objid).find("#loading-row").remove();
        }
    });
}

var InitializeDonutGraph2 = function (objid, dataurl) {
    $('#' + objid).append('<div id="loading-row"><span class="spinner"></span></div>');
    $.ajax({
        dataType: "json",
        url: dataurl,
        success: function (data) {
            if (data !== null && data !== undefined && data.length > 0) {
                
                donutchart2 = Morris.Donut({
                    data: data,
                    element: objid,
                    resize: 'true'
                });
                window.donutchart2 = donutchart2;

            }
            else {
                $('#graph2').html('<h3 class="panel-title text-center">No data to show.</h3>');
            }
            $("#" + objid).find("#loading-row").remove();
        }
    });
}




function calculateTendencyValues(data) {
    data = calculateTendencyHelper(data, "NRequests");
    return calculateTendencyHelper(data, "AvgExecutionTime");
}

function calculateTendencyHelper(data, field) {
    var a = 0;
    var b = 0;
    var c = 0;
    var d = 0;
    var e = 0;
    var f = 0;
    var m = 0;
    var n = data.length;
    $(data).each(function (index, e) {
        a = a + (index * e[field]);
        b = b + e[field];
        c = c + Math.pow(index, 2);
        d = d + index;
    });
    e = b;
    f = d;

    a = n * a;
    b = d * b;
    c = n * c;
    d = Math.pow(d, 2);
    m = Math.round((a - b) / (c - d) * 100) / 100;

    f = m * f;
    b = Math.round((e - f) / n * 100) / 100;
    $(data).each(function (index, e) {
        var tend = Math.round((m * index + b) * 100) / 100;
        if (tend < 0)
            tend = 0;
        e[field + "Tendency"] = tend;
    });
    return data;
}


function functionLoadTree(id, val) {
    $('#SoapIn').html('<div id="loadingSoapIn"  style="padding-top:100px;"><span class="spinner"></span></div>');
    $('#SoapOut').html('<div id="loadingSoapOut" style="padding-top:100px;"><span class="spinner"></span></div>');

    setTimeout(function () {
        if ($.trim(val).length > 0) {
            if (isJson(val) === false) {
                var xml2json = new X2JS();
                val = JSON.stringify(xml2json.xml_str2json(val));
            }

            $('#actions' + id).css('display', 'block');
            $('#loading' + id).remove();
            $('#' + id).JSONView(val, { collapsed: true });

            var check = "obj level";
            var aux = 0;
            var cls = [];
            var i = 0;
            $('[class^="obj level"]').each(function () {
                // Get array of class names   
                var temp = $(this).attr('class').split(' ');
                var t = temp[1].replace('level', '');
                if (t > aux) {
                    cls[i] = t;
                    aux = t
                }

            });

            var maxLevel = 0;
            if (cls.length > 0) {
                maxLevel = cls[0];
            }

            $('#expand-btn' + id).prop('disabled', false);
            $('#toggle-levelPrevious-btn' + id).prop('disabled', true);
            $('#collapse-btn' + id).prop('disabled', true);

            if (maxLevel == 0) {
                $('#expand-btn' + id).prop('disabled', true);
                $('#toggle-levelNext-btn' + id).prop('disabled', true);
            }

            $('#collapse-btn' + id).on('click', function () {
                $('#' + id).JSONView('collapse');
                i = 0;
                $('#toggle-levelNext-btn' + id).prop('disabled', false);
                $('#expand-btn' + id).prop('disabled', false);
                $('#toggle-levelPrevious-btn' + id).prop('disabled', true);
                $('#collapse-btn' + id).prop('disabled', true);

            });

            $('#expand-btn' + id).on('click', function () {
                $('#' + id).JSONView('expand');
                $('#toggle-levelNext-btn' + id).prop('disabled', true);
                $('#expand-btn' + id).prop('disabled', true);
                $('#toggle-levelPrevious-btn' + id).prop('disabled', false);
                $('#collapse-btn' + id).prop('disabled', false);
                i = maxLevel;
            });

            $('#toggle-levelNext-btn' + id).on('click', function () {

                i += 1;
                $('#' + id).JSONView('toggle', i);
                $('#toggle-levelPrevious-btn' + id).prop('disabled', false);
                $('#collapse-btn' + id).prop('disabled', false);

                if (i == maxLevel) {
                    $('#toggle-levelNext-btn' + id).prop('disabled', true);
                    $('#expand-btn' + id).prop('disabled', true);
                }
            });

            $('#toggle-levelPrevious-btn' + id).on('click', function () {
                if (i > 1 && i <= maxLevel) {
                    $('#' + id).JSONView('toggle', i);
                    i -= 1;
                }
                else {
                    i = 0;
                    $('#' + id).JSONView('collapse');
                    $('#toggle-levelPrevious-btn' + id).prop('disabled', true);
                    $('#collapse-btn' + id).prop('disabled', true);
                }
                $('#toggle-levelNext-btn' + id).prop('disabled', false);
                $('#expand-btn' + id).prop('disabled', false);
            });

        }
        else {
            $('#loading' + id).remove();
            $('#actions' + id).css('display', 'none');

            $('#' + id).html('<br><br>No soap where found in this request');

        }
    }, 1000);

    $('#collapse-btn' + id).off('click');
    $('#collapse-btn' + id).off('click');
    $('#toggle-levelNext-btn' + id).off('click');
    $('#toggle-levelPrevious-btn' + id).off('click');

    var i = 0;
}

function functionLoadTreeByPanel(id, val, panel) {
    $('#' + id).html('<div id="loading' + id + '"  style="padding-top:100px;"><span class="spinner"></span></div>');

    setTimeout(function () {
        if ($.trim(val).length > 0) {

            if (isJson(val) === false) {
                var xml2json = new X2JS();
                val = xml2json.xml_str2json(val);
            }
            $('#loading' + id).remove();
            $('#' + id).jsonView(val);

        }
        else {
            $('#loading' + id).remove();

            $('#' + id).jsonView('null');
        }
    }, 1000);
}

var InitializeDetailClickEvent = function (attributeList, dateFormat, hasSoap) {
    $("tbody .detail").live("click", function (event) {

        event.stopPropagation();
        var tableData = table.row(this.parentElement).data();
        for (var i = 0; i < attributeList.length; i++) {
            var attr = attributeList[i];
            var obj = $('#' + attr);
            if (moment(tableData[attr], 'YYYY-MM-DDTHH:mm:ss.SSSS', true).isValid()) {
                obj.html(moment(tableData[attr]).format(dateFormat));
            }
            else {
                if (attr === "Exception") {
                    obj[0].innerHTML = formatException(tableData[attr]);
                }
                else {
                    obj.html($('<div/>').text(tableData[attr]).html()); // encode in a memory div
                }

            }
        }
        if (hasSoap === true) {
            $('input:hidden#txtIn').val(tableData.SoapIn);
            $('input:hidden#txtOut').val(tableData.SoapOut);
        }
    });
};

var InitializeClickRedirect = function (tableid, url, attr) {
    $("#" + tableid + " > tbody > tr").live("click", function () {
        var reqid = table.row(this).data()[attr];

        if ($.trim(reqid).length > 0) {
            window.location.href = url.replace('__reqId__', reqid);
        }
        else {
            $('#ModalMsg').modal('show');
        }

    });
};

var InitializeClickRedirect = function (tableid, url, attr) {
    $("#" + tableid + " > tbody > tr").live("click", function () {
        event.stopPropagation();
        var tableServices = $('#' + tableid).DataTable();
        var reqid = tableServices.row(this).data()[attr];

        if ($.trim(reqid).length > 0) {
            window.location.href = url.replace('__reqId__', reqid);
        }
    });
};

function initTab() {
    $('a[data-toggle="tab"]:first').tab('show');
}

function formatException(exceptionMessage) {
    result = exceptionMessage || '';

    var searchReplaces = [
        {
            find: / at /g,
            repl: '<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  at '
        },
        {
            find: / ---> /g,
            repl: '<br> ---> '
        },
        {
            find: / --- End of inner exception stack trace ---/g,
            repl: '<br>   --- End of inner exception stack trace ---'
        },
        {
            find: /:line/g,
            repl: ': <b>line</b>'
        }
    ];

    for (var i = 0; i < searchReplaces.length; i++) {

        result = result.replace(searchReplaces[i].find, searchReplaces[i].repl);
    }

    searchReplaces.forEach(function (item) {
        result = result.replace(item.find, item.repl);
    });

    return result;
}

var InitializeStackedBarGraph = function (objid, dataurl) {

    $('#' + objid).append('<div id="loading-row"><span class="spinner"></span></div>');
    $.ajax({
        dataType: "json",
        url: dataurl,
        success: function (data) {
            var chart = Morris.Bar({
                stacked: 'true',
                data: data,
                xkey: 'Interval',
                ykeys: ['DataFileSize', 'LogFileSize', 'DataFileSizeFree', 'LogFileSizeFree'],
                labels: ['Data Size Used (Mb)', 'Log Size Used (Mb)', 'Data Size Free (Mb)', 'Log Size Free (Mb)'],
                xLabelMargin: 2,
                fillOpacity: 0.5,
                hideHover: 'auto',
                behaveLikeLine: true,
                resize: true,
                parseTime: false,
                barColors: ['#ff6666', '#ff8d66', '#a0db8e', '#66cdaa'],
                element: objid
            });
            $(window).prop("w" + objid, chart);
            $("#" + objid).find("#loading-row").remove();
            CreateChartLegend(chart, "graphLegend", "stacked");
        }
    });

}


var InitializeStackedBarGraphTable = function (objid, dataurl) {

    $('#' + objid).append('<div id="loading-row"><span class="spinner"></span></div>');
    $.ajax({
        dataType: "json",
        url: dataurl,
        success: function (data) {
            var chart = Morris.Bar({
                stacked: 'true',
                data: data,
                xkey: 'Interval',
                ykeys: ['UsedSpace', 'UnusedSpace'],
                labels: ['UsedSpace (Kb)', 'UnusedSpace (Kb)'],
                xLabelMargin: 2,
                fillOpacity: 0.5,
                hideHover: 'auto',
                behaveLikeLine: true,
                resize: true,
                parseTime: false,
                barColors: ['#ff6666', '#66cdaa'],
                element: objid
            });
            $(window).prop("w" + objid, chart);
            $("#" + objid).find("#loading-row").remove();
            CreateChartLegend(chart, "graphLegend", "stacked");
        }
    });

}

var CreateChartLegend = function (chart, elementId, type) {
    chart.options.labels.forEach(function (label, i) {
        var legendItem = $('<span class="legend-text"></span>').text(label);
        var square = null;
        if (type == 'bar' || type == 'stacked') {
            square = $('<span class="legend-square"></span>').css(
                    {
                        'background-color': chart.options.barColors[i],
                        'border-color': chart.options.barColors[i]
                    });
        }
        else if (type == 'line' || type == 'area') {
            square = $('<span class="legend-square"></span>').css(
                    {
                        'background-color': chart.options.lineColors[i],
                        'border-color': chart.options.lineColors[i]
                    });
        }
        $('#' + elementId).append(legendItem);
        $('#' + elementId).append(square);
    });
}



var InitCarousel = function () {
    $('.carousel').carousel({
        interval: false
    });


    $('.carousel .item').each(function () {
        var next = $(this).next();
        if (!next.length) {
            next = $(this).siblings(':first');
        }
        next.children(':first-child').clone().appendTo($(this));

        var size = 4;
        if ($(this).attr("name") == "cFour")
            size = 2;
        for (var i = 0; i < size; i++) {
            next = next.next();
            if (!next.length) {
                next = $(this).siblings(':first');
            }

            next.children(':first-child').clone().appendTo($(this));
        }
    });
}


var GetDataToRefreshProbes = function (url) {
    $.ajax({
        url: url,
        type: 'POST',
        contentType: 'json',
        success: function (data) {
            if (data !== null && data !== undefined && data.length != 0)
                RefreshProbes(JSON.parse(data));        
        },
        error: function (request, textStatus, errorThrown) {
            errorHandler(request, textStatus, errorThrown);
        }
    });
}


var RefreshProbes = function (data) {
    if (data === null || data === undefined || data.length === 0)
        return;

    // Each Probe
    if (data !== null && data !== undefined) {
        for (var i = 0; i < data.length; i++) {
            var probe = data[i];
            // mark=pc   -> Color
            $("[mark=pc" + probe.Id + "]").each(function () {
                $(this).removeClass("bg-probe-error").removeClass("bg-probe-success");
                if (probe.HaveErrors)
                    $(this).addClass("bg-probe-error");
                else
                    $(this).addClass("bg-probe-success");
            });
            // mark=ps   -> Status 
            $("[mark=ps" + probe.Id + "]").each(function () {
                $(this).html(probe.Status);
            });
            // mark=pi   -> Play/Pause
            $("[mark=pi" + probe.Id + "]").each(function () {
                $(this).removeClass("fa-play").removeClass("fa-pause");
                if (probe.Operation == "Testing")
                    $(this).addClass("fa-pause");
                else
                    $(this).addClass("fa-play");
                if (probe.HaveErrors)
                    $(this).css("color", "#e60000");
                else
                    $(this).css("color", "#00b300");
            });
            // mark=po   -> operation
            $("[mark=po" + probe.Id + "]").each(function () {
                $(this).html(probe.Operation);
            });
            // mark=pc   -> Color
            $("[mark=pcc" + probe.Id + "]").each(function () {
                if (probe.HaveErrors)
                    $(this).css("color", "#e60000");
                else
                    $(this).css("color", "#00b300");
            });

            // Tests
            RefreshTests(probe.Tests);
        }
    }
}

var RefreshTests = function (tests) {
    for (var t = 0; t < tests.length; t++) {
        // mark=tc   -> Color
        var test = tests[t];
        $("[mark=tc" + test.Id + "]").each(function () {
            $(this).removeClass("bg-probe-error").removeClass("bg-probe-success").removeClass("bg-probe-slow").removeClass("bg-probe-unknown").removeClass("bg-probe-timeout");
            if (test.LastResult.Status == "Failed")
                $(this).addClass("bg-probe-error");
            else if (test.LastResult.Status == "Slow")
                $(this).addClass("bg-probe-slow");
            else if (test.LastResult.Status == "Working")
                $(this).addClass("bg-probe-success");
            else if (test.LastResult.Status == "Timeout" || test.LastResult.Status == "Conn. Timeout")
                $(this).addClass("bg-probe-timeout");
            else
                $(this).addClass("bg-probe-unknown");
        });
        // mark=ts   -> Status 
        $("[mark=ts" + test.Id + "]").each(function () {
            $(this).html(test.LastResult.Status);
        });
        // mark=tt   -> TimeTaken
        $("[mark=tt" + test.Id + "]").each(function () {
            $(this).html(test.LastResult.TimeTaken);
        });
        // mark=tic   -> icon color
        $("[mark=tic" + test.Id + "]").each(function () {
            if (test.LastResult.Status == "Failed")
                $(this).css("color", "#e60000");
            else if (test.LastResult.Status == "Slow")
                $(this).css("color", "#F5A30E");
            else if (test.LastResult.Status == "Working")
                $(this).css("color", "#00b300");
            else if (test.LastResult.Status == "Timeout" || test.LastResult.Status == "Conn. Timeout")
                $(this).css("color", "#9600A9");
            else
                $(this).css("color", "#fff");
        });
        RefreshTests(test.Tests);
    }
}

var ToogleProbeParent = function (obj, actionsPanel, id, group) {
    // Remove all selected, except him self (will toogle it later)
    $("#" + group).find(".probe-parent-on").each(function () {
        if ($(this).attr('name') != $(obj).attr('name'))
            $(this).removeClass("probe-parent-on");
    });

    // Probes only
    // Only if now in display mode, but in config mode
    if (actionsPanel != null) {
        if (!$(obj).hasClass('probe-parent-on')) {
            $(actionsPanel).collapse('show');
            UpdateSelectedProbe(id);
        }
        else {
            $(actionsPanel).collapse('hide');
            UpdateSelectedProbe(0);
        }
    }

    CloseChild(group);

    // Toogle all copies  (carousel demand multiple copies)
    var name = $(obj).attr('name');
    $("#" + group).find("[name=" + name + "]").each(function () {
        $(this).toggleClass("probe-parent-on");
    });
}

// Recursion to close all Childs
var CloseChild = function (group) {
    var child = $("#" + group).attr("child-group");
    if (typeof child != "undefined") {
        $("#" + child).find(".probe-parent-on").each(function () {
            $(this).removeClass("probe-parent-on");
        });
        $("#" + child + " .panel-collapse").collapse('hide');
        CloseChild(child);
    }
}



/* WOLRD MAP (Users Origin) - DASHBOARD */

var handleVisitorsVectorMap = function (geturl, mapId) {
    $.ajax({
        url: geturl,
        type: 'POST',
        contentType: 'json',
        success: function (data) {
            var values = {};
            for (var i = 0; i < data.length; i++) {
                values[data[i].CountryCode] = data[i].Value;
            }

            if (data.length >= 3)
                $('#' + mapId).height('217px');
            else if (data.length == 2)
                $('#' + mapId).height('254px');
            else if (data.length == 1)
                $('#' + mapId).height('291px');
            DrawVisitorsVectorMap(values, mapId);
            CreateMapLegend(data.slice(0, 3), mapId);
        },
        error: function (request, textStatus, errorThrown) {
            errorHandler(request, textStatus, errorThrown);
        }
    });
}

var DrawVisitorsVectorMap = function (data, mapId) {
    $('#' + mapId).vectorMap({
        map: 'world_mill',
        container: $('#' + mapId),
        regionStyle: {
            initial: {
                fill: "rgb(97,109,125)",
                "fill-opacity": 1,
                stroke: "none",
                "stroke-width": .4,
                "stroke-opacity": 1
            },
            hover: {
                "fill-opacity": .6
            },
            selected: {
                fill: "yellow"
            }
        },
        series: {
            regions: [{
                values: data,
                scale: ['#C8EEFF', '#0071A4'],
                normalizeFunction: 'polynomial'
            }]
        },
        backgroundColor: "#2d353c",
        onRegionTipShow: function (e, tip, code) {
            if (typeof data[code] != "undefined")
                tip.html(tip.html() + ' (Users - ' + data[code] + ')');
            else
                tip.html(tip.html() + ' (No Users)');
        }
    });
}

// data sliced by 3
var CreateMapLegend = function (data, mapId) {
    if (data.length > 0) {
        $('#' + mapId).parent().append("<div id=\"MapUsersLegend\" class=\"list-group\">");

        for (var i = 0; i < data.length; i++) {
            $("#MapUsersLegend").append("<span class=\"list-group-item list-group-item-inverse text-ellipsis\" style=\"border-top-left-radius:0; border-top-right-radius:0;\">" +
                                        "<span class=\"badge badge-" + (i == 0 ? "success" : (i == 1 ? "primary" : "inverse")) + "\">" + data[i].Percentage + "%</span>" +
                                        (i + 1) + ". " + data[i].Country + "</span>");
        }
    }
}
/* END WOLRD MAP (Users Origin) - DASHBOARD */

var InitializeEnabledClick = function (dataUrl, tableId, fieldName, className, inputClass) {
    $("tbody ." + className).live("click", function (event) {
        event.stopPropagation();
        var index = this.parentElement;
        var input = $(this).find('.' + inputClass); // Checkbox
        var switchery = $(this).find('.switchery'); // Switch
        if (input.attr("Ignore") == undefined) {  // Validate if is a dummy click (rollback switch)
            // Create Confirmation modal
            $('#confirmModalTitle').text("Dangerous Operation");
            $('#confirmModalMessage').text("Do you really want to proceed with this action?");

            $('#confirmModalButton').prop('onclick', null).off('click'); // Remove previous click

            $('#confirmModalButton').on('click', function () { // Add need Onclick 
                EnabledClickAction(dataUrl, tableId, index, fieldName, className);
                input.attr("Ignore", "true"); // Will not change switch on 'hidden.bs.modal'
                $('#confirmModal').modal('hide');
            });
            $('#confirmModal').on('hidden.bs.modal', function () { // If Close is pressed, must revert switch
                if (input.attr("Ignore") == undefined) {
                    input.attr("Ignore", "true"); // Dummy condition
                    switchery.click(); // Press click
                }
            })
            $('#confirmModal').modal('show');
        }
        else {
            input.removeAttr("Ignore"); // Remove dummy condition
            $('#confirmModal').unbind('hidden.bs.modal'); // Remove event from this switch (prevent multiple switch turning on/off at same time)
            $('#confirmModal').modal('hide'); // Close just in case
        }
    });
}

var EnabledClickAction = function (dataUrl, tableId, index, fieldName, className) {

    waitLoading();
    event.stopPropagation();

    var _table = $('#' + tableId).DataTable();
    var tableData = _table.row(index).data();

    var aux = tableData[fieldName];

    $.ajax({
        url: dataUrl,
        type: 'POST',
        data: JSON.stringify(tableData),
        contentType: "application/json;charset=utf-8",
        async: true,
        success: function (data) {
            _table.row(index).data()[fieldName] = !aux;
            _table.draw(false);
            
            if (className == 'IsEnabledMethod')
            {
                var _tableServices = $('#results-table-Services').DataTable();
                _tableServices.draw(false);
            }

        },
        error: function (request, textStatus, errorThrown) {
            errorHandler(request, textStatus, errorThrown);
        }
    });

    stopLoading();
}


var ChangeTimeOut = function (tableId, dataUrl, id, value) {
    waitLoading();
    event.stopPropagation();

    var _table = $('#' + tableId).DataTable();

    var input = JSON.stringify({
        'Id': id,
        'Timeout': value
    });

    $.ajax({
        url: dataUrl,
        type: 'POST',
        data: input,
        contentType: "application/json;charset=utf-8",
        async: false,
        success: function (data) {
            _table.draw(false);
        },
        error: function (request, textStatus, errorThrown) {
            errorHandler(request, textStatus, errorThrown);
        }
    });

    stopLoading();
}




var DeleteRecordFunc = function (tableId, dataUrl, id, secondaryTable) {

    event.stopPropagation();

    var _table = $('#' + tableId).DataTable();
    var _secundaryTable = $('#' + secondaryTable).DataTable();
    var input = JSON.stringify({
        'Id': id
    });

    $.ajax({
        url: dataUrl,
        type: 'POST',
        data: input,
        contentType: "application/json;charset=utf-8",
        async: true,
        success: function (data) {
            $('.modal').modal('hide');
            stopLoading();
            _table.draw(false);
            _secundaryTable.draw(false);
        },
        error: function (request, textStatus, errorThrown) {
            errorHandler(request, textStatus, errorThrown);
        }
    });
}


var InsertRecordFunc = function (tableId, dataUrl, values, secondaryTable) {

    event.stopPropagation();

    var _table = $('#' + tableId).DataTable();

    var input = JSON.stringify(values);

    $.ajax({
        url: dataUrl,
        type: 'POST',
        data: input,
        contentType: "application/json;charset=utf-8",
        async: true,
        success: function (data) {
            stopLoading();
            //alert(data);
            if (data == "False") {
                $('#modalError').modal('show');
            }
            _table.draw(false);

            if (typeof secondaryTable === "undefined" || secondaryTable === null) {
                //Do nothing
            }
            else {
                var tableServices = $('#' + secondaryTable).DataTable();
                tableServices.draw(false);
            }


        },
        error: function (request, textStatus, errorThrown) {
            errorHandler(request, textStatus, errorThrown);
            $('#modalError').modal('show');
        }
    });
}

var SetSwitchery = function (element, value) {
    element.checked = value;
    if (typeof Event === 'function' || !document.fireEvent) {
        var event = document.createEvent('HTMLEvents');
        event.initEvent('change', true, true);
        element.dispatchEvent(event);
    } else {
        element.fireEvent('onchange');
    }
}


var parseDate = function (isoDateString) {
    var d = isoDateString.split(/[: -]/);
    return new Date(Date.UTC(d[0], d[1] - 1, d[2], d[3], d[4], d[5]));
}

/* END LIVE TRANSACTIONS */ 
var waitLoading = function () {
    $('#page-loader').removeClass('fade in hide');
    $('#page-loader').addClass('modal-backdrop fade in');
    $('#page-loader').css('background-color', '#000000');
    $('#page-loader').css('display', 'block');
    
} 

var stopLoading = function () {
    $('#page-loader').addClass('fade in hide');
    $('#page-loader').removeClass('modal-backdrop fade in');
    $('#page-loader').css('background-color', 'transparent');
    $('#page-loader').css('display', 'none');

}

var openModalError = function (errorMsg) {
    $('#modalErrorMsg').html('<b>Exception:</b>  ' + errorMsg);
    $('#modalError').modal('show');
}

function TryParseInt(str, defaultValue) {
    var retValue = defaultValue;
    if (str !== null) {
        if (str.length > 0) {
            if (!isNaN(str)) {
                retValue = parseInt(str);
            }
        }
    }
    return retValue;
}

var SelectTimeInterval = function (interval) {
    $("[type=radio]").each(function () {
        if ($(this).val() == interval)
            $(this).prop("checked", true)
    });
}

var ChangeTimeInterval = function (value, formId, hiddenId) {
    $("#" + hiddenId).val(value);
    $("#" + formId).submit();
}
