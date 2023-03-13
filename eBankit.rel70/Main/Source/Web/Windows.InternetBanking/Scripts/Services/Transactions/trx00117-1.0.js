eBankit.Presentation.TRX00117 = {};

eBankit.Presentation.TRX00117.ValidateCustom = function () {
    var ret = true;
    var ddlAmount = $('[id$=ddlAmount_dlField]');
    var hdnOption = $('[id$=hdnOptionValue]');

    if ($("[id$=hdnHasEntity]").val() === '0') {
        itcore_ui.ShowTopPopupWarning(top.eBankit.Presentation.GetResource("EntityMessage"), top.eBankit.Presentation.GetResource("EntityMessageTitle"), '');
        return false;
    }
    else if ($("[id$=hdnHasAmount]").val() === '-1') {
        itcore_ui.ShowTopPopupWarning(top.eBankit.Presentation.GetResource("PaymentAmountMessage"), top.eBankit.Presentation.GetResource("PaymentAmountMessageTitle"), '');
        return false;
    }

    if (ddlAmount.find('option:selected').val() === '-1') {
        eBankit.Presentation.InsertValidateMsg(ddlAmount, top.eBankit.Presentation.GetResource("ddlAmountPaymentErroMsg"));
        ret = false;
    } else {
        eBankit.Presentation.RemoveValidateMsg(ddlAmount);
        if (ddlAmount.val() === hdnOption.val()) {
            ret = eBankit.Presentation.TRX00117.ValidateAmount();
        }
    }
    return ret;
};

eBankit.Presentation.TRX00117.ValidateAmount = function () {
    var ret = true;
    var hdnOptionMin = $('[id$=hdnOptionValueMin]');
    var hdnOptionMax = $('[id$=hdnOptionValueMax]');
    var txtAmount = $('[id$=txtAmount_txField]');

    var val = $('[id$=txtAmount_txField]').val();
    if (val !== "" && typeof val !== 'undefined') {
        var montante = $('[id$=txtAmount_txField]').autoNumeric('get');
    }

    if (hdnOptionMin.val() !== "-1" && hdnOptionMax.val() !== "-1") {
        var minValue = parseFloat(hdnOptionMin.val());
        var maxValue = parseFloat(hdnOptionMax.val());
        var value = parseFloat(montante);

        if (isNaN(montante) && montante === "") {
            eBankit.Presentation.InsertValidateMsg(txtAmount, top.eBankit.Presentation.GetResource("invalidtxtAmountPayment"));
            ret = false;
        }
        else if (value < minValue) {
            eBankit.Presentation.InsertValidateMsg(txtAmount, top.eBankit.Presentation.GetResource("mintxtAmountPayment"));
            ret = false;
        }
        else if (value > maxValue) {
            eBankit.Presentation.InsertValidateMsg(txtAmount, top.eBankit.Presentation.GetResource("maxtxtAmountPayment"));
            ret = false;
        }
        else {
            eBankit.Presentation.RemoveValidateMsg(txtAmount);
        }
    }
    else {
        eBankit.Presentation.RemoveValidateMsg(txtAmount);
    }
    return ret;
};
