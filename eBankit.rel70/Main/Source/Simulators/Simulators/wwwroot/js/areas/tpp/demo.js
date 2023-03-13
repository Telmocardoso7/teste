$(document).ready(function () {
    
    if ($('#tbLog').find('td').length <= 0) {
        $('.s-traceLog').hide();
    }

    $('#txtBban').keyup(function () {
        if ($(this).val() !== undefined && $(this).val() !== "") {
            $('.btnAddSpecificAccount').prop('disabled', false);
        }
        else {
            $('.btnAddSpecificAccount').prop('disabled', true);
        }
    });
});

$('input').click(function () {
    $('.s-traceLog').show();
});

function ControlPanels() {
    LoadFormHome();
}

function ShowStart() {
    $("#dvStart").slideDown('slow');
    $("#pnlIBAN").slideUp("slow");
    //$("#dvStart").hide();
}

function ShowAccountList() {
    debugger;
    //window.close();
    $.LoadingSpin("show", 'body', $('#loadingSpin-text').val());
    $("#pnlIBAN").slideUp('slow');
    $("#pnlAccountList").slideDown('slow');
    var token = $('#hdToken').val();
    var strBban = $("#txtBban").val();
    $("#btnClose").attr('disabled', 'true');

    //Faz a Chamada do create consents
    $.post("/TPP/Manager/CreateConsent", { token: token, strBban: strBban }, function (vdata) {
        debugger;
        var action = 'Service Call: /aisp/v1/consents' + '&nbsp&nbsp&nbsp---' + new Date($.now()).toString();
        Log(action);

        consentID = vdata;

        if (consentID.length < 30) {
            $.LoadingSpin("hide", 'body'); 
            //alert(consentID);
            
            window.location.reload();
            
        } else {
            $.LoadingSpin("show", 'body', $('#loadingSpin-text').val());
            $('#hdConsentID').val(consentID);
            var blnConsentStatus = false;
            var splitlink = consentID;
            var res = splitlink.split('|');
            consentID = res[0];
            var consentLink = res[1];
            window.open(consentLink, '_blank');

            var objInterval = setInterval(function () {

                $.post("/TPP/Manager/GetConsentStatus", { consentID: consentID, token: token }, function (vstatusData) {
                    
                    var action = 'Service Call: /aisp/v1/consents/' + consentID + '/status' + '&nbsp&nbsp&nbsp---' + new Date($.now()).toString();
                    Log(action);

                    var consentStatus = vstatusData;


                    if (consentStatus.consentStatus === "valid") {
                        blnConsentStatus = true;
                        clearInterval(objInterval);

                        $.post("/TPP/Manager/GetAcountIdList", { consentID: consentID, token: token }, function (lstIdAccountList) {
                            debugger;
                            var action = 'Service Call: /aisp/v1/accounts' + '&nbsp&nbsp&nbsp---' + new Date($.now()).toString();
                            Log(action);

                            //create hiddens for store resourceId
                            for (var i = 0; i < lstIdAccountList.accounts.length; i++) {
                                var tmpHidden = $('<input id="hdAccountList_' + i + '" type="hidden" value="' + lstIdAccountList.accounts[i].resourceId + '" data-iban="' + lstIdAccountList.accounts[i].iban + '" data-balance-endpoint="' + lstIdAccountList.accounts[i]._links.balances.href + '"  class="accountList" />');
                                $("#dvhidden").append(tmpHidden);
                            }

                            //call AccountBalance
                            $(".accountList").each(function () {
                                var accountId = $(this).val();
                                var iban = $(this).attr('data-iban');
                                var balanceEndpoint = $(this).attr('data-balance-endpoint');
                                $.ajax({
                                    type: 'POST',
                                    url: "/TPP/Manager/GetAccountBalance",
                                    data: {
                                        consentID: consentID,
                                        token: token,
                                        accountId: accountId,
                                        balanceEndpoint: balanceEndpoint
                                    },
                                    dataType: 'json',
                                    success: function (dataResult) {
                                        var action = 'Service Call: /aisp/v1/accounts/' + consentID + '/balances' + '&nbsp&nbsp&nbsp---' + new Date($.now()).toString();
                                        Log(action);

                                        var tr = $('<tr class="trline"></tr>');

                                        var bban = "";
                                        if (dataResult.account !== undefined && dataResult.account !== null) {
                                            if (dataResult.account.bban !== undefined)
                                                bban = dataResult.account.bban;
                                        }

                                        //Account
                                        var td = $('<td>' + bban + '</td>');
                                        tr.append(td);

                                        //IBAN
                                        td = $('<td>' + iban + '</td>');
                                        tr.append(td);

                                        //Amount
                                        td = $('<td>' + dataResult.balances[0].balanceAmount._Amount + dataResult.balances[0].balanceAmount.currency + '</td>');
                                        tr.append(td);

                                        //Adding tr to Main Table
                                        $('#tbList').find('tbody').append(tr);

                                    },
                                    error: function (err) {
                                        Log(err.statusText)
                                    },
                                    async: false
                                });
                            });
                            $.LoadingSpin("hide", 'body'); 
                            $("#btnClose").removeAttr('disabled');
                        }, 'json').fail(function (err) {
                            $.LoadingSpin("hide", 'body'); 
                            Log(err.statusText); 
                        });
                    } else if (consentStatus.consentStatus === "rejected") {
                        $.LoadingSpin("hide", 'body'); 
                        //alert('Consent inactive!');
                        window.location.reload();
                    }

                }, 'json').fail(function (err) {
                    $.LoadingSpin("hide", 'body'); 
                    Log(err.statusText); 
                });

            }, 5000);
        }

    }).fail(function (err) {
        $.LoadingSpin("hide", 'body');
        Log(err.statusText); 
    });
}

function CloseAccountList() {
    $("#pnlAccountList").slideUp('slow');
    $("#pnlIBAN").slideDown('slow');
    $(".trline").remove('tr');
    $(".accountList").remove('input');
}

function ShowPayment() {

    $.LoadingSpin("show", 'body', $('#loadingSpin-text').val());
    //Load dataform from home to geneate token
    var objHomeModel = new Object();
    objHomeModel.clientID = $('#txtClientId').val();
    objHomeModel.secretID = $('#txtSecretId').val();
    objHomeModel.scope = $('#txtScope').val();
    var token = '';

    //obtem o token de autorização
    $.post("/TPP/Manager/GetHomeData", { objHomeModel: objHomeModel }, function (data) {

        var action = 'Service Call: /connect/token' + '&nbsp&nbsp&nbsp---' + new Date($.now()).toString();
        Log(action);

        token = data;

        if (token === '') {
            alert('Invalid Token!');

        } else {
            $("#dvStart").slideUp("slow");
            $("#dvPayment").show();
            setCookie('tppEndPoint', objHomeModel.endPoint, 7);
            setCookie('tppToken', token, 7);
        }

        $('#hdToken').val(token);

    }, 'json').fail(function (err) {
        Log(err.statusText);
    }).always(function () {
        $.LoadingSpin("hide", 'body');
    });
}

function StartPayment() {
    $.LoadingSpin("show", 'body', $('#loadingSpin-text').val());
    var objPayment = new Object();
    objPayment.paymentAccount = $('#txtPaymentAccount').val();
    objPayment.myAccount = $('#txtMyAccount').val();
    objPayment.value = $('#txtValue').val();
    objPayment.currency = $('#ddlCurrency').val();
    objPayment.token = $('#hdToken').val();
    var token = $('#hdToken').val();
    
    $.post("/TPP/Manager/StartPayment", { objPayment: objPayment }, function (data) {

        var action = 'Service Call: /pisp/v1/payments/payments/sepa-credit-transfers' + '&nbsp&nbsp&nbsp---' + new Date($.now()).toString();
        Log(action);

        var splitlink = data;
        var res = splitlink.split('|');
        var PaymentID = res[0];
        var AutorizationID = res[1];
        var lnkWindow = res[2]; 
        $("#txtPaymentId").val(PaymentID);
        $("#txtAuth").val(AutorizationID);

        window.open(lnkWindow, '_blank');
        
        var objInterval = setInterval(function () {
            $.LoadingSpin("show", 'body', $('#loadingSpin-text').val());
            $.post("/TPP/Manager/GetPaymentStatus", { PaymentID: PaymentID, token: token }, function (vstatusData) {
                
                action = 'Service Call: /common/v1/payments/GetPaymentForCore/' + PaymentID + '&nbsp&nbsp&nbsp---' + new Date($.now()).toString();
                Log(action);
                var paymentStatus = vstatusData;

                if (paymentStatus.paymentStatus === 2 || paymentStatus.paymentStatus === 9) {
                    $.LoadingSpin("hide", 'body');
                    MakePaymentTable(paymentStatus);
                    $('#dvPayment').slideUp('slow');
                    $('#pnlPaymentInformation').slideDown('slow');
                    clearInterval(objInterval); 
                }
            }, 'json').fail(function (err) {
                $.LoadingSpin("hide", 'body');
                Log(err.statusText);
            });

        }, 5000);
    }, 'json').fail(function (err) {
        $.LoadingSpin("hide", 'body');
        Log(err.statusText);
    });

}


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

function ClosePayment() {
    $("#dvPayment").slideUp("slow");
    $("#dvStart").slideDown('slow');
    $(".trline").remove('tr');
}

function LoadFormHome() {

    $.LoadingSpin("show", 'body', $('#loadingSpin-text').val());
    var objHomeModel = new Object();
    objHomeModel.clientID = $('#txtClientId').val();
    objHomeModel.secretID = $('#txtSecretId').val();
    objHomeModel.scope = $('#txtScope').val();
    var token = '';

    //obtem o token de autorização
    $.post("/TPP/Manager/GetHomeData", { objHomeModel: objHomeModel }, function (data) {

        var action = 'Service Call: /connect/token' + '&nbsp&nbsp&nbsp---' + new Date($.now()).toString();
        Log(action);

        token = data;

        if (token === '') {
            alert('Invalid Token!');

        } else {
            $("#dvStart").slideUp("slow");
            $("#pnlIBAN").show();
        }

        $('#hdToken').val(token);

    }, 'json').fail(function (err) {
        Log(err.statusText);
    }).always(function () {
        $.LoadingSpin("hide", 'body');
    });
}

function Log(action) {
    var tr = $('<tr></tr>');
    var td = $('<td>' + action + '</td>');
    tr.append(td);
    $("#tbLog").append(tr);
}

function ClosePaymentInformation() {
    $("#txtPaymentId").val("-");
    $("#txtAuth").val("-");
    $("#txtPaymentAccount").val("");
    $("#txtMyAccount").val("");
    $("#pnlPaymentInformation").slideUp('slow');
    $("#dvStart").slideDown('slow');
}

function setCookie(name, value, days) {
    var expires = "";
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "") + expires + "; path=/";
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
function eraseCookie(name) {
    document.cookie = name + '=; Max-Age=-99999999;';
}