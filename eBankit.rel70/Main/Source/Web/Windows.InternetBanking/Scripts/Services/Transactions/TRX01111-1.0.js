eBankit.Presentation.TRX01111 = {};

eBankit.Presentation.TRX01111.ValidateCustom = function () {
    var ret = true;
    var validTransactionOption = eBankit.Presentation.TRX01111.ValidateTransactionOption();
    var validLimitTypeOption = eBankit.Presentation.TRX01111.ValidateLimitTypeOption();
    var validImpactOption = eBankit.Presentation.TRX01111.ValidateImpactOption();
    var validLimitValue = eBankit.Presentation.TRX01111.ValidateLimitValue();
    var validCurrencyOption = eBankit.Presentation.TRX01111.ValidateCurrencyOption();

    if (!validTransactionOption || !validLimitTypeOption || !validImpactOption || !validLimitValue || !validCurrencyOption) {
        ret = false;
    }

    return ret;
};

eBankit.Presentation.TRX01111.ValidateTransactionOption = function () {
    var ret = true;
    var selectedOption = $('[id$=ddlTransactionType_dlField]');

    if (selectedOption.val() == '-1') {
        ret = false;
        eBankit.Presentation.InsertValidateMsg(selectedOption, top.eBankit.Presentation.GetResource("RequiredTransactionOption"));
    } else {
        eBankit.Presentation.RemoveValidateMsg(selectedOption);
    }
    return ret;
};

eBankit.Presentation.TRX01111.ValidateLimitTypeOption = function () {
    var ret = true;
    var selectedOption = $('[id$=ddlLimitType_dlField]');

    if (selectedOption.val() == '-1') {
        ret = false;
        eBankit.Presentation.InsertValidateMsg(selectedOption, top.eBankit.Presentation.GetResource("RequiredLimitTypeOption"));
    } else {
        eBankit.Presentation.RemoveValidateMsg(selectedOption);
    }
    return ret;
};

eBankit.Presentation.TRX01111.ValidateImpactOption = function () {
    var ret = true;
    var selectedOption = $('[id$=ddlImpactType_dlField]');

    if (selectedOption.val() == '-1') {
        ret = false;
        eBankit.Presentation.InsertValidateMsg(selectedOption, top.eBankit.Presentation.GetResource("RequiredImpactOption"));
    } else {
        eBankit.Presentation.RemoveValidateMsg(selectedOption);
    }
    return ret;
};

eBankit.Presentation.TRX01111.ValidateLimitValue = function () {
    var ret = true;
    var limit = $('[id$=txtLimitValue_txField]');
    var currencySymbol = $('[id$=txtLimitValue_txField]').val();
    currencySymbol = currencySymbol.replace(/\.|\,/g, "");
    currencySymbol = currencySymbol.replace(/[0-9]/g, "");
    var limitValue = parseCurrencyWithSymbol(limit.val(), currencySymbol);
    eBankit.Presentation.RemoveValidateMsg(limit);
    if (limitValue == null || limitValue == '' || isNaN(limitValue)) {
        ret = false;
        eBankit.Presentation.InsertValidateMsg_V2(limit, top.eBankit.Presentation.GetResource("RequiredLimit"));
    } else {
        eBankit.Presentation.RemoveValidateMsg(limit);
    }
    return ret;
};


eBankit.Presentation.TRX01111.ValidateCurrencyOption = function () {
    var ret = true;
    var selectedOption = $('[id$=ddlCurrency_dlField]');

    if (selectedOption.val() == '-1') {
        ret = false;
        eBankit.Presentation.InsertValidateMsg(selectedOption, top.eBankit.Presentation.GetResource("RequiredCurrencyOption"));
    } else {
        eBankit.Presentation.RemoveValidateMsg(selectedOption);
    }
    return ret;
};
