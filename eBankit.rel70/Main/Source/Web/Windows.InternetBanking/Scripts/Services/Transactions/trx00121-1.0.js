eBankit.Presentation.TRX00121 = {};

var toDate = function (date) {
    var arr = date.split("-");
    return new Date(arr[2], arr[1] - 1, arr[0]);
};

eBankit.Presentation.TRX00121.ValidateIBAN = function () {
    var ibanRegex = /^[A-Z]{2}[0-9]{2}[0-9]{21}/;
    var iban = $('[id$=txtAccountDestIBAN_txField]');
    if (iban.val() != '') {
        iban.val(iban.val().toUpperCase());
        if (!ibanRegex.test(iban.val().replace(/ /g, ''))) {
            eBankit.Presentation.InsertValidateMsg_V2(iban, top.eBankit.Presentation.GetResource("txtAccountDestIBANInvalidFormat"));
        } else {
            eBankit.Presentation.RemoveValidateMsg(iban);
        }
    }
};

eBankit.Presentation.TRX00121.ValidatePeriodicity = function () {
    var ddlperiodicity = $('[id$=ddlPerioInterbank_dlField]');
    var ret = true;
    if (ddlperiodicity.find('option:selected').val() == '-1') {
        eBankit.Presentation.InsertValidateMsg(ddlperiodicity, top.eBankit.Presentation.GetResource("ddlPeriodErroMsg"));
        ret = false;
    } else {
        eBankit.Presentation.RemoveValidateMsg(ddlperiodicity);
    }
    return ret;
};

eBankit.Presentation.TRX00121.ValidateCustom = function () {
    var ret = true;
    var emailRegex = /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}/;
    var emailTo = $('[id$=txtEmailToNotify_txField]');
    var ddlCategory = $('[id$=ddlCategory_dlField]');
    var ibanRegex = /^[A-Z]{2}[0-9]{2}[0-9]{21}/;
    var iban = $('[id$=txtAccountDestIBAN_txField]');

    var dateInit = $('[id$=dtTransferDatePermInit_txField]');
    var dateEnd = $('[id$=dtTransferDatePermEnd_txField]');
    ddlContas2 = $('[id$=ddlOwnAccounts_dlField]');
    var multiselectOpt = $('[id$=ddlGrpAccount]');

    var divPermanent = $('[id$=divPermanent]');

    var validAmount = eBankit.Presentation.TRX00121.ValidateAmount();

    if (!validAmount) {
        ret = false;
    }

    /*if (divPermanent &&  divPermanent.is(":visible") ) {
        ret = eBankit.Presentation.TRX00121.ValidatePeriodicity();
        if(dateInit.val()==null||dateInit.val()==''){
            eBankit.Presentation.InsertValidateMsg(dateInit, top.eBankit.Presentation.GetResource("InvalidDateTimeMsg"));
            ret = false;
        }else{
            eBankit.Presentation.RemoveValidateMsg(dateInit);
        }
        if(dateEnd.val()==null||dateEnd.val()==''){
            eBankit.Presentation.InsertValidateMsg(dateEnd, top.eBankit.Presentation.GetResource("InvalidDateTimeMsg"));
            ret = false;
        }else{
            eBankit.Presentation.RemoveValidateMsg(dateEnd);
        }
        if(ret){
            var dInit = toDate(dateInit.val());
            var dEnd = toDate(dateEnd.val());
            if (dEnd < dInit) {
                eBankit.Presentation.InsertValidateMsg(dateEnd, top.eBankit.Presentation.GetResource("EndDateErroMsg"));
                ret = false;
            }
            else {
                eBankit.Presentation.RemoveValidateMsg(dateEnd);
            }
        }

    }else{
        var dateTo = $('[id$=dtTransferDates_txField]');
        if(dateTo.val()==null || dateTo.val()==''){
            eBankit.Presentation.InsertValidateMsg(dateTo, top.eBankit.Presentation.GetResource("InvalidDateTimeMsg"));
             ret=false;
        }else{
            eBankit.Presentation.RemoveValidateMsg(dateTo);
        }
    }*/

    if (!emailRegex.test(emailTo.val().replace(/ /g, '')) && emailTo.val() != '') {
        eBankit.Presentation.InsertValidateMsg(emailTo, top.eBankit.Presentation.GetResource("txtEmailInvalidFormat"));
        ret = false;
    } else {
        eBankit.Presentation.RemoveValidateMsg(emailTo);
    }

    if (hdnTransferType.val() == 2) {

        if (iban.val() != '') {
            iban.val(iban.val().toUpperCase());
            if (!ibanRegex.test(iban.val().replace(/ /g, ''))) {
                eBankit.Presentation.InsertValidateMsg(iban, top.eBankit.Presentation.GetResource("txtAccountDestIBANInvalidFormat"));
                ret = false;
            } else {
                eBankit.Presentation.RemoveValidateMsg(iban);
            }
        }

    }

    if (collapseEbankitNIB.hasClass("in") && hdnUrgent.val() == '0') {
        if (ddlCategory.find('option:selected').val() == '-1') {
            eBankit.Presentation.InsertValidateMsg(ddlCategory, top.eBankit.Presentation.GetResource("ddlCategoryErroMsg"));
            ret = false;
        } else {
            eBankit.Presentation.RemoveValidateMsg(ddlCategory);
        }
    }

    $('.field-own .selectbox').each(function () {
        if (collapseEbankitAccount.hasClass("in") && $(this).siblings("select").eq(0).val() == '-1') {
            eBankit.Presentation.InsertValidateMsg($(this), top.eBankit.Presentation.GetResource("ddlContasErroMsg"));
            ret = false;
        } else {
            eBankit.Presentation.RemoveValidateMsg($(this));
        }
    });

    if (collapseEbankitAccount.hasClass("in") && ddlContas2.val() == '-1') {
        eBankit.Presentation.InsertValidateMsg(ddlContas2, top.eBankit.Presentation.GetResource("ddlContasErroMsg"));
        ret = false;
    } else {
        eBankit.Presentation.RemoveValidateMsg(ddlContas2);
    }

    if (userSource.val() == '7') {
        if (collapseEbankitAccount.hasClass("in") && $('.multiselectbox')[0].selectedIndex == '-1') {
            eBankit.Presentation.InsertValidateMsg($('#expandButton'), top.eBankit.Presentation.GetResource("ddlContasErroMsg"));
            ret = false;

        } else {
            eBankit.Presentation.RemoveValidateMsg($('#expandButton'));
        }
    }

    if (hdnTransferType.val() == '') {
        itcore_ui.ShowTopPopupWarning(top.eBankit.Presentation.GetResource("DestinAccountMessage"), top.eBankit.Presentation.GetResource("DestinAccountTitle"), '');
        ret = false;
    }

    return ret;

};

eBankit.Presentation.TRX00121.ValidateAmount = function () {
    var ret = true;
    var amount = $('[id$=txtAmount_txField]');
    var amountValue = parseFormattedNumber(amount.val());
    eBankit.Presentation.RemoveValidateMsg(amount);
    if (amountValue == 0) {
        ret = false;
        eBankit.Presentation.InsertValidateMsg_V2(amount, top.eBankit.Presentation.GetResource("mintxtAmountPayment"));
        $('[id$=lblNetInterestReceivable_lblRightIn]').text('');
    }
    else if (amountValue == null) {
        ret = false;
    }
    return ret;
};

$(document).ready(function () {
    eBankit.Presentation.TRX00121.TooglePanels();
    eBankit.Presentation.TRX00121.AccountBlur();

    var inputControl = $('[id*="_ddlOwnAccounts_"]').siblings('input.selectbox');
    inputControl.attr("role", "combobox");
    //inputControl.attr("aria-autocomplete", "list");
    //inputControl.attr("aria-expanded", "false");
    /*inputControl.attr("data-active-option", $($('[id*="_ddlOwnAccounts_"]').find('li')[0]).attr('id'));*/
    /* inputControl.attr("aria-activedescendant", " ");*/

    $('[id*="_ddlOwnAccounts_"]').find('li').each(function () {
        $(this).attr('aria-live', 'assertive');

        $(this).attr('role', 'listitem');

    });

    $('[id*="_ddlOwnAccounts_"]').find('ul').each(function () {
        $(this).attr('role', 'list');
        $(this).attr('id', 'ulAccountslist');
        $(this).attr('aria-label', 'teste');

    });
    var ulId = $('[id*="_ddlOwnAccounts_"]').children('ul').attr('id');
    inputControl.attr('aria-controls', ulId);

    $("img").each(function () {
        if ($(this).attr("alt") === undefined)
            $(this).attr("alt", "");
    });

    /*var $calendPickerDateName1 = $calendPickerDate1.attr("name");
    var $calendPickerDateName2 = $calendPickerDate2.attr("name");
    var $calendPickerDateName3 = $calendPickerDate3.attr("name");

    var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };

    $params['messages'][$calendPickerDateName1] = {
        ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("dtDataTransferenciaPermErroMsg"); }
    };
    $params['messages'][$calendPickerDateName2] = {
        ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("dtDataTransferenciaPermErroMsg"); }
    };
    $params['messages'][$calendPickerDateName3] = {
        ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("dtDataTransferenciaPermErroMsg"); }
    };
    
    $("[id$=ddlPerioInterbank_dlField]").on('blur', eBankit.Presentation.TRX00121.ValidatePeriodicity);
    */
    //var validator = $("#aspnetForm").validate($params);

    //jQuery.validator.addMethod("ValidateDateFormat", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate1.val()) && eBankit.Presentation.InternalValidation($calendPickerDate1.val()); });
    //jQuery.validator.addMethod("ValidateDateFormat", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate2.val()) && eBankit.Presentation.InternalValidation($calendPickerDate2.val()); });
    //jQuery.validator.addMethod("ValidateDateFormat", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate3.val()) && eBankit.Presentation.InternalValidation($calendPickerDate3.val()); });
});

eBankit.Presentation.TRX00121.TooglePanels = function () {
    $("img").each(function () {
        if ($(this).attr("alt") === undefined)
            $(this).attr("alt", "");
    });

    collapseEbankitNIB = $('[id$=collapseEbankitNIB]');
    collapseEbankitAccount = $('[id$=collapseEbankitAccount]');
    collapseEbankitMyAcc = $('[id$=collapseEbankitMyAcc]');
    
    collapseEbankitNIB.on('show.bs.collapse', function () {
        if (collapseEbankitAccount.hasClass("in")) {
            collapseEbankitAccount.removeClass("in");
            collapseEbankitAccount.addClass("collapse");
            ToogleArrowDownIcon("collapseEbankitAccountIcon");
           }

        if (collapseEbankitMyAcc.hasClass("in")) {
            collapseEbankitMyAcc.removeClass("in");
            collapseEbankitMyAcc.addClass("collapse");
            ToogleArrowDownIcon("collapseEbankitMyAccount");
             }
        ToogleArrowLeftIcon("collapseEbankitNIBIcon");
    });

    collapseEbankitNIB.on('hide.bs.collapse', function () {
        ToogleArrowDownIcon("collapseEbankitNIBIcon");
       });

    collapseEbankitAccount.on('show.bs.collapse', function () {
        if (collapseEbankitNIB.hasClass("in")) {
            collapseEbankitNIB.removeClass("in");
            collapseEbankitNIB.addClass("collapse");
            ToogleArrowDownIcon("collapseEbankitNIBIcon");
             }

        if (collapseEbankitMyAcc.hasClass("in")) {
            collapseEbankitMyAcc.removeClass("in");
            collapseEbankitMyAcc.addClass("collapse");
            ToogleArrowDownIcon("collapseEbankitMyAccount");
               }

        ToogleArrowLeftIcon("collapseEbankitAccountIcon");
    });

    collapseEbankitAccount.on('hide.bs.collapse', function () {
        ToogleArrowDownIcon("collapseEbankitAccountIcon");
          });

    collapseEbankitMyAcc.on('show.bs.collapse', function () {
        if (collapseEbankitNIB.hasClass("in")) {
            collapseEbankitNIB.removeClass("in");
            collapseEbankitNIB.addClass("collapse");
            ToogleArrowDownIcon("collapseEbankitNIBIcon");
        }

        if (collapseEbankitAccount.hasClass("in")) {
            collapseEbankitAccount.removeClass("in");
            collapseEbankitAccount.addClass("collapse");
            ToogleArrowDownIcon("collapseEbankitAccountIcon");
        }
        ToogleArrowLeftIcon("collapseEbankitMyAccount");
    });

    collapseEbankitMyAcc.on('hide.bs.collapse', function () {
        ToogleArrowDownIcon("collapseEbankitMyAccount");
    });
};

function ToogleArrowLeftDownIcon(iconID) {
    var iconArrow = $('[id$=' + iconID + ']');
    if (iconArrow.hasClass("icon-transfers-up")) {
        iconArrow.removeClass("icon-transfers-up");
        iconArrow.addClass("icon-transfers-down");
    }
    else {
        iconArrow.removeClass("icon-transfers-down");
        iconArrow.addClass("icon-transfers-up");
    }
}

function ToogleArrowLeftIcon(iconID) {
    var iconArrow = $('[id$=' + iconID + ']');
    if (iconArrow.hasClass("icon-transfers-down")) {
        iconArrow.removeClass("icon-transfers-down");
        iconArrow.addClass("icon-transfers-up");
    }
}

function ToogleArrowDownIcon(iconID) {
    var iconArrow = $('[id$=' + iconID + ']');
    if (iconArrow.hasClass("icon-transfers-up")) {
        iconArrow.removeClass("icon-transfers-up");
        iconArrow.addClass("icon-transfers-down");
    }
}

eBankit.Presentation.TRX00121.AccountBlur = function () {
    ddlContas2 = $('[id$=ddlOwnAccounts]');
    ddlCorpContas = $('[id$=divGroupOwnAccount]');
    ddlContas2val = $('[id$=ddlOwnAccounts_dlField]');
    hdnAccountRetDrop = $('[id$=hdnAccountRetDrop]');
    hdnAccountRetDropName = $('[id$=hdnAccountRetDropName]');
    if (ddlContas2val.val() == '-1' && hdnAccountRetDrop.val() !== '') {
        var ddlConta2Input = $("#" + ddlContas2val.attr("id") + "_input");
        var ddlConta2Select = $("#" + ddlContas2val.attr("id") + "_input_" + hdnAccountRetDrop.val());
        ddlContas2val.val(hdnAccountRetDrop.val());
        ddlConta2Input.val(hdnAccountRetDropName.val() + " " + hdnAccountRetDrop.val());
        ddlConta2Select.addClass("selected-option");
        hdnAccountRetDrop.val("");
        hdnAccountRetDropName.val("");
    }
    else {
        eBankit.Presentation.RemoveValidateMsg(ddlContas2);
    }
};
eBankit.Presentation.TRX00121.SetAccountType = function (obj, typ) {
    var iconArrowNIB = $('[id$=collapseEbankitNIBIcon]');
    var iconArrowNumber = $('[id$=collapseEbankitAccountIcon]');
    var iconArrowMyAcc = $('[id$=collapseEbankitMyAccount]');
    var collapseNIB = $('[id$=collapseEbankitNIB]');
    var collapseNumber = $('[id$=collapseEbankitAccount]');
    var collapseMyAcc = $('[id$=collapseEbankitMyAcc]');
    divUrgent = $('[id$=divUrgent]');
    divDescriptionIntrabank = $('[id$=divDescriptionIntrabank]');
    divDescriptionInterbank = $('[id$=divDescriptionInterbank]');
    divMotive = $('[id$=divMotive]');
    hdnTransferType = $('[id$=hdnTransferType]');
    var ob = $("#" + obj.id);

    if (ob.is(":disabled") == false) {
        if (typ == 2 && !collapseNIB.hasClass("in")) {
            hdnTransferType.val(typ);
            if (hdnUrgent.val() == '0')
                divUrgent.show();
            else
                divUrgent.hide();
            divDescriptionIntrabank.hide();
            divDescriptionInterbank.show();
            divMotive.show();
            $("input[id*='txtAccountDestIBAN_txField']").focus();
        }
        else if (typ == 3 && !collapseNumber.hasClass("in")) {
            hdnTransferType.val(typ);
            divUrgent.hide();
            divDescriptionIntrabank.show();
            divDescriptionInterbank.hide();
            divMotive.hide();
            $("input[id*='ddlOwnAccounts_dlField']").focus();
        }
        else if (typ == 1 && !collapseMyAcc.hasClass("in")) {
            hdnTransferType.val(typ);
            divUrgent.hide();
            divDescriptionIntrabank.show();
            divDescriptionInterbank.hide();
            divMotive.hide();
            $("input[id*='frlTypeAcc_tb']").first().focus();
        }
        else {
            if (collapseNumber.hasClass("in")) {
                iconArrowNumber.removeClass("icon-transfers-up");
                iconArrowNumber.addClass("icon-transfers-down");
                collapseNumber.focus();
            }

            if (collapseNIB.hasClass("in")) {
                iconArrowNIB.removeClass("icon-transfers-up");
                iconArrowNIB.addClass("icon-transfers-down");
                collapseNIB.focus();
            }

            if (collapseMyAcc.hasClass("in")) {
                iconArrowMyAcc.removeClass("icon-transfers-up");
                iconArrowMyAcc.addClass("icon-transfers-down");
                collapseMyAcc.focus();
             }

            hdnTransferType.val('');
        }
    }

    $(".btnRefreshLimitValidation").click();
};
eBankit.Presentation.TRX00121.ToogleTranferType = function (divId, divToHideId) {
    var div = $("#" + divId);
    var divToHide = $("#" + divToHideId);
    div.show();
    divToHide.hide();
};
var prm = Sys.WebForms.PageRequestManager.getInstance();
prm.add_endRequest(function () {
    eBankit.Presentation.TRX00121.EndRequest();
});

eBankit.Presentation.TRX00121.EndRequest = function () {
    eBankit.Presentation.TRX00121.AccountBlur();
    hdnTransferType = $('[id$=hdnTransferType]');
    var type = hdnTransferType.val();
    collapseEbankitNIB = $('[id$=collapseEbankitNIB]');
    collapseEbankitAccount = $('[id$=collapseEbankitAccount]');
    collapseEbankitMyAcc = $('[id$=collapseEbankitMyAcc]');
    divUrgent = $('[id$=divUrgent]');
    divDescriptionIntrabank = $('[id$=divDescriptionIntrabank]');
    divDescriptionInterbank = $('[id$=divDescriptionInterbank]');
    divMotive = $('[id$=divMotive]');

    eBankit.Presentation.TRX00121.TooglePanels();
    if (type == "2") {
        if (hdnUrgent.val() == '0')
            divUrgent.show();
        else
            divUrgent.hide();
        divDescriptionIntrabank.hide();
        divDescriptionInterbank.show();
        divMotive.show();
        $("input[id*='txtAccountDestIBAN_txField']").focus();
    }
    else if (type == "3") {
        divUrgent.hide();
        divDescriptionIntrabank.show();
        divDescriptionInterbank.hide();
        divMotive.hide();
        $("input[id*='ddlOwnAccounts_dlField']").focus();
    }
    else if (type == "1") {
        divUrgent.hide();
        divDescriptionIntrabank.show();
        divDescriptionInterbank.hide();
        divMotive.hide();
        $("input[id*='frlTypeAcc_tb']").first().focus();
    }
};
