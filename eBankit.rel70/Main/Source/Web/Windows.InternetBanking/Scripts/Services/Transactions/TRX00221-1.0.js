eBankit.Presentation.TRX00221 = {};
eBankit.Presentation.TRX00221.Blur = function () {

};
$(document).ready(function () {

});

eBankit.Presentation.TRX00221.EndRequest = function () {
    //   
};
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX00221.EndRequest);

eBankit.Presentation.TRX00221.ValidateCustom = function () {
    var ret = true;
    var validAmount = eBankit.Presentation.TRX00221.ValidateLimit();
    var validCardName = eBankit.Presentation.TRX00221.ValidateCardName();
    var validPaymentOption = eBankit.Presentation.TRX00221.ValidatePaymentOption();
    if (!validAmount || !validCardName || !validPaymentOption) {
        ret = false;
    }
    return ret;
};

eBankit.Presentation.TRX00221.ValidateLimit = function () {
    var isCreditCard = $('[id$=hdnCreditCard]').val().toUpperCase() == 'true'.toUpperCase();
    if (isCreditCard) {
        var ret = true;
        var limit = $('[id$=txtLimit_txField]');
        var limitValue = parseFloat(limit.autoNumeric('get'));
        var maxLimit = parseFormattedNumber($('[id$=hdnMaxLimit]').val());
        eBankit.Presentation.RemoveValidateMsg(limit);
        if (limitValue == null || limitValue == '' || isNaN(limitValue)) {
            ret = false;
            eBankit.Presentation.InsertValidateMsg_V2(limit, top.eBankit.Presentation.GetResource("RequiredLimit"));
        } else {
            eBankit.Presentation.RemoveValidateMsg(limit);
            if (limitValue < 0 || limitValue > maxLimit) {
                ret = false;
                eBankit.Presentation.InsertValidateMsg_V2(limit, top.eBankit.Presentation.GetResource("InvalidLimit"));
            } else {
                eBankit.Presentation.RemoveValidateMsg(limit);
            }
        }
        return ret;
    } else {
        return true;
    }
};

eBankit.Presentation.TRX00221.ValidateCardName = function () {
        var ret = true;
        var name = $('[id$=txtCardName_txField]');
        eBankit.Presentation.RemoveValidateMsg(name);
        if (name.val() == null || name.val() == '') {
            ret = false;
            eBankit.Presentation.InsertValidateMsg_V2(name, top.eBankit.Presentation.GetResource("RequiredCardName"));
        } else {
            eBankit.Presentation.RemoveValidateMsg(name);
        }
        return ret;
};

eBankit.Presentation.TRX00221.ValidatePaymentOption = function () {
    var isCreditCard = $('[id$=hdnCreditCard]').val().toUpperCase() == 'true'.toUpperCase();
    if (isCreditCard) {
        var ret = true;
        var paymentOption = $('[id$=ddlPaymentOption_dlField]');
        eBankit.Presentation.RemoveValidateMsg(paymentOption);
        if (paymentOption.find('option:selected').val() == '-1') {
            ret = false;
            eBankit.Presentation.InsertValidateMsg_V2(paymentOption, top.eBankit.Presentation.GetResource("RequiredPaymentoption"));
        } else {
            eBankit.Presentation.RemoveValidateMsg(paymentOption);
        }
        return ret;
    } else {
        return true;
    }
};

GoToChangeProduct = function () {
    eBankit.Presentation.SetBlockPageCommon();
    $('body').block();
    eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00220' + projId;
};