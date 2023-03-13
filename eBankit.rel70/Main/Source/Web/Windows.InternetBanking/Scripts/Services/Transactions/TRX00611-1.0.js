eBankit.Presentation.TRX00611 = {};

eBankit.Presentation.TRX00611.ShowBranchSelector = function (divId) {
    var div = $("#" + divId);
    div.show();
};

eBankit.Presentation.TRX00611.HideBranchSelector = function (divId) {
    var div = $("#" + divId);
    div.hide();
};

eBankit.Presentation.TRX00611.ValidateCustom = function () {
    var ret = true;
    var ddlBranch = $('[id$=ddlBankBranch_dlField]');

    if (divBranchDelivery.is(":visible") && ddlBranch.val() == '-1') {
        eBankit.Presentation.InsertValidateMsg(ddlBranch, top.eBankit.Presentation.GetResource("ddlBranch_RequireSelectValue"));
        ret = false;
    }
    else {
        eBankit.Presentation.RemoveValidateMsg(ddlBranch);
    }

    return ret;
};
