eBankit.Presentation.TRX00309 = {};

$(document).ready(function () {
    eBankit.Presentation.TRX00309.AccountBlur();
});

eBankit.Presentation.TRX00309.AccountBlur = function () {
    if (hdnAccountRetDrop.val() != '') {
        var ddlOwnAccountsInput = $("#" + $("[id$=ddlOwnAccounts_dlField]").attr("id") + "_input");
        var ddlOwnAccountsSelect = $("#" + $("[id$=ddlOwnAccounts_dlField]").attr("id") + "_input_" + hdnAccountRetDrop.val());
        $("[id$=ddlOwnAccounts_dlField]").val(hdnAccountRetDrop.val());
        ddlOwnAccountsInput.val(hdnAccountRetDropName.val() + " " + hdnAccountRetDrop.val());
        ddlOwnAccountsSelect.addClass("selected-option");
        hdnAccountRetDrop.val("");
        hdnAccountRetDropName.val("");
    }
}

eBankit.Presentation.TRX00309.ValidateCustom = function () {
    var ret = true;
    var validAccount = eBankit.Presentation.TRX00309.ValidateAccount();
    var validAmount = eBankit.Presentation.TRX00309.ValidateAmount();
    if (!validAccount || !validAmount) {
        ret = false;
    }
    return ret;
};

eBankit.Presentation.TRX00309.ValidateAmount = function () {
    var ret = true;
    var maxAmount = parseFloat($("[id*='hdnMaxAmount']").val());
    var amount = parseFloat($('[id$=txtAmount_txField]').autoNumeric('get'));
    eBankit.Presentation.RemoveValidateMsg($('[id$=txtAmount_txField]'));
    if (amount > maxAmount || amount <= 0 || isNaN(amount)) {
        eBankit.Presentation.InsertValidateMsg_V2($('[id$=txtAmount_txField]'), top.eBankit.Presentation.GetResource("InvalidAmout"));
        ret = false;
    }
    return ret;
};

eBankit.Presentation.TRX00309.ValidateAccount = function () {
    var ret = true;
    var account = $('[id$=ddlOwnAccounts_dlField]');
    eBankit.Presentation.RemoveValidateMsg(account);
    if (account.val() == null || account.val() == '' || account.val() == '-1') {
        eBankit.Presentation.InsertValidateMsg_V2(account, top.eBankit.Presentation.GetResource("SelectAccount"));
        ret = false;
    }
    return ret;
};
