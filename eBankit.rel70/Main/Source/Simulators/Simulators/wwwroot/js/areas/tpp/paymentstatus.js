setTimeout(function () {
    $.LoadingSpin("show", 'body', $('#loadingSpin-text').val());
    $(document).ready(function () {
        
        var URL = window.location.href;

        $.post("/TPP/Manager/DecodePayment", { URL }, function (vPaymentID) {
            var paymentID = vPaymentID;
            var token = getCookie('tppToken');
            $.post("/TPP/Manager/GetPaymentStatus", { paymentID, token }, function (vstatusData) {

                var paymentStatus = vstatusData;

                if (paymentStatus.paymentStatus === 2 || paymentStatus.paymentStatus === 9) {
                    MakePaymentTable(paymentStatus);
                    $.LoadingSpin("hide", 'body'); 
                }
            }, 'json').fail(function (err) {
                Log(err.statusText);
            });

        }).fail(function (err) {
            Log(err.statusText);
        }).always(function () {
            $.LoadingSpin("hide", 'body');
            if ($("#automaticClose").val().toUpperCase().toLowerCase() === 'true') {
                $("#automaticCloseTxt").removeAttr("hidden");
                setTimeout('self.close()', 5000);
            } else {
                $("#manualCloseTxt").removeAttr("hidden");
            }
        });
    });

}, 1000);

function MakePaymentTable(data) {
    var tb = $('#tbPaymentDetails');
    var tr = '';
    $(".trline").remove('tr');

    //PAYMENT ID
    var td1 = $('<td class="title">Payment ID</td>');
    var td2 = $('<td>' + data.paymentId + '</td>');
    tr = $('<tr class="trline"></tr>');
    tr.append(td1);
    tr.append(td2);
    tb.append(tr);

    //CLIENT ID
    td1 = $('<td class="title">Client ID</td>');
    td2 = $('<td>' + data.clientId + '</td>');
    tr = $('<tr class="trline"></tr>');
    tr.append(td1);
    tr.append(td2);
    tb.append(tr);

    //CREATE DATE
    td1 = $('<td class="title">Creation date</td>');
    td2 = $('<td>' + data.createDate + '</td>');
    tr = $('<tr class="trline"></tr>');
    tr.append(td1);
    tr.append(td2);
    tb.append(tr);

    //DESC PAYMENT STATUS
    var status = data.paymentStatus;
    if (status === 2) {
        status = 'SUCCESS';
    } else {
        status = 'FAILED';
    }

    td1 = $('<td class="title">Payment status</td>');
    td2 = $('<td>' + status + '</td>');
    tr = $('<tr class="trline"></tr>');
    tr.append(td1);
    tr.append(td2);
    tb.append(tr);

    //DEBTOR NUMBER
    td1 = $('<td class="title">Source account number</td>');
    td2 = $('<td>' + data.debtorNumber + '</td>');
    tr = $('<tr class="trline"></tr>');
    tr.append(td1);
    tr.append(td2);
    tb.append(tr);

    //CREDITOR ACCOUNT
    td1 = $('<td class="title">Beneficiary account number</td>');
    td2 = $('<td>' + data.creditorAccount + '</td>');
    tr = $('<tr class="trline"></tr>');
    tr.append(td1);
    tr.append(td2);
    tb.append(tr);

    //CREDITOR NAME
    td1 = $('<td class="title">Beneficiary account name</td>');
    td2 = $('<td>' + data.creditorName + '</td>');
    tr = $('<tr class="trline"></tr>');
    tr.append(td1);
    tr.append(td2);
    tb.append(tr);

    //AMOUNT
    td1 = $('<td class="title">Amount</td>');
    td2 = $('<td>' + data.amount + '</td>');
    tr = $('<tr class="trline"></tr>');
    tr.append(td1);
    tr.append(td2);
    tb.append(tr);

    //CURRENCY
    td1 = $('<td class="title">Currency</td>');
    td2 = $('<td>' + data.currency + '</td>');
    tr = $('<tr class="trline"></tr>');
    tr.append(td1);
    tr.append(td2);
    tb.append(tr);

    //ProcessTransactionId
    td1 = $('<td class="title">Process ID</td>');
    td2 = $('<td>' + data.processTransactionId + '</td>');
    tr = $('<tr class="trline"></tr>');
    tr.append(td1);
    tr.append(td2);
    tb.append(tr);
}

function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) === ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
}