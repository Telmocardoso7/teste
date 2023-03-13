eBankit.Presentation.TRX00222 = {};


eBankit.Presentation.TRX00222.EndRequest = function () {
    //   
};

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX00222.EndRequest);


$(document).ready(function () {
    eBankit.Presentation.TRX00222.EndRequest();
});



eBankit.Presentation.TRX00222.ValidateCustom = function () {
    var ret = true;
    var validDate = eBankit.Presentation.TRX00222.ValidateDate();
    if (!validDate) {
        ret = false;
    }
    return ret;
};

eBankit.Presentation.TRX00222.ValidateDate = function () {
    var ret = true;
    var newPaymentDate = $('[id$=txtNewPaymentdate_txField]');
    eBankit.Presentation.RemoveValidateMsg(newPaymentDate);
    if (newPaymentDate.val() == null || newPaymentDate.val() == '' || isNaN(newPaymentDate.val())) {
        ret = false;
        eBankit.Presentation.InsertValidateMsg_V2(newPaymentDate, top.eBankit.Presentation.GetResource("RequiredPaymentDate"));
    } else {
        eBankit.Presentation.RemoveValidateMsg(newPaymentDate);
        if (newPaymentDate.val() < 1 || newPaymentDate.val() > 31) {
            ret = false;
            eBankit.Presentation.InsertValidateMsg_V2(newPaymentDate, top.eBankit.Presentation.GetResource("InvalidDate"));
        } else {
            eBankit.Presentation.RemoveValidateMsg(newPaymentDate);
        }
    }
    return ret;
};