eBankit.Presentation.TRX00602 = {}

eBankit.Presentation.TRX00602.ValidateCustom = function () {
    var ret = true;
    var validEmail = eBankit.Presentation.TRX00602.ValidateEmail();

    if (!validEmail)
    {
        ret = false;
    }

    return ret;
};

eBankit.Presentation.TRX00602.ValidateEmail = function () {
    var ret = true;
    var emailCtrl = $('[id$=txtEmail_txField]');
    eBankit.Presentation.RemoveValidateMsg(emailCtrl);

    var numCheckedEmail = $('.rbEmail:checkbox:checked').length;

    if ((numCheckedEmail > 0 && (emailCtrl.val() == null || emailCtrl.val() == '')) || eBankit.Presentation.ValidateEmailExp(emailCtrl.val()) == false)
    {
        eBankit.Presentation.InsertValidateMsg_V2(emailCtrl, top.eBankit.Presentation.GetResource("SelectEmail"));
        ret = false;
    }

    return ret;
};
