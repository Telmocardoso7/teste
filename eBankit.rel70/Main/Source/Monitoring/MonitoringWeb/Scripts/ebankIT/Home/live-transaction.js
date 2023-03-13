$(".document").ready(function () {
    var hiddenInput = $("[name='Application']");
    if (hiddenInput.val() != undefined) {
        GetLiveTransactions("/Home/GetLiveTransactions?Application=" + hiddenInput.val() + "&TimeInterval=5", 5000);
    }
    else {
        GetLiveTransactions("/Home/GetLiveTransactions?TimeInterval=5", 5000);
    }
});

var GetLiveTransactions = function (getUrl, interval) {
    setInterval(function () {
        $.ajax({
            dataType: "json",
            url: getUrl,
            success: function (data) {
                // the number of .net ticks at the unix epoch
                var epochTicks = 621355968000000000;
                // there are 10000 .net ticks per millisecond
                var ticksPerMillisecond = 10000;
                // calculate the total number of .net ticks for your date
                //var yourTicks = epochTicks + (yourDate.getTime() * ticksPerMillisecond);
                if (data != null) {
                    $.each(data, function (i, Transaction) {
                        // Globar Buffer, save transaction order by EventTime
                        GlobalBuffer.push({
                            id: epochTicks + (new Date().getTime() * ticksPerMillisecond),
                            date: parseDate(Transaction.date),
                            title: Transaction.title,
                            page: Transaction.title
                        });
                    });
                }
            }
        }
        );
    }, interval);
}

var CreateDummyTransaction = function (number, count, type) {
    // the number of .net ticks at the unix epoch
    var epochTicks = 621355968000000000;
    // there are 10000 .net ticks per millisecond
    var ticksPerMillisecond = 10000;
    // calculate the total number of .net ticks for your date
    //var yourTicks = epochTicks + (yourDate.getTime() * ticksPerMillisecond);
    var d = new Date();
    var sdate = d.getFullYear() + "-" + d.getMonth() + "-" + d.getDay() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds() + ":";

    var obj = {};


    obj["date"] = sdate;
    var data = [];

    if (type == 1) {
        for (var i = 0; i < count; i++) {
            for (var n = 0; n < number; n++) {
                var obj = {};
                obj["title"] = "TransactionTeste" + n;
                if (i < 10)
                    obj["date"] = sdate + "00" + i;
                else
                    obj["date"] = sdate + "0" + i;
                data.push(obj);
            }
        }
    }
    if (type == 2) {
        for (var n = 0; n < number; n++) {
            for (var i = 0; i < count; i++) {
                var obj = {};
                obj["title"] = "TransactionTeste" + n;
                if (i < 10)
                    obj["date"] = sdate + "00" + i;
                else
                    obj["date"] = sdate + "0" + i;
                data.push(obj);
            }
        }
    }
    if (type == 3) {
        for (var n = 0; n < number; n++) {
            for (var i = 0; i < count; i++) {
                var obj = {};
                obj["title"] = "TransactionTeste" + (Math.floor(Math.random() * 79) + 0);
                if (i < 10)
                    obj["date"] = sdate + "00" + i;
                else
                    obj["date"] = sdate + "0" + i;
                data.push(obj);
            }
        }
    }

    if (data != null) {
        $.each(data, function (i, Transaction) {
            GlobalBuffer.push({
                id: epochTicks + ((new Date(Transaction.date)).getTime() * ticksPerMillisecond),
                date: parseDate(Transaction.date),
                title: Transaction.title,
                page: Transaction.title
            });
        });
    }
}
