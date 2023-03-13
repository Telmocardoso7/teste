eBankit.Presentation.Register = {}
eBankit.Presentation.Register.ValidateInputs = function (elem) {
    var ret = true;
    ret=eBankit.Presentation.Register.ValidateInputSmsToken();
    ret=eBankit.Presentation.Register.ValidateInputNewKey();
    ret=eBankit.Presentation.Register.ValidateInputNewKeyConfirm();

    $("select[id*='ddlQuestion']").each(function () {
        ret=eBankit.Presentation.Register.ValidateInputQuestion($(this));
    });
    
    $("input[id*='txtAnswer']").each(function () {
        ret=eBankit.Presentation.Register.ValidateInputAnswer($(this));
    });
    
    return ret;
}

eBankit.Presentation.Register.ValidateInputSmsToken = function () {
    ret=true;
     if (txtSMSToken.val() == '') {
        eBankit.Presentation.InsertValidateMsg(txtSMSToken, top.eBankit.Presentation.GetResource("RequiredSMSToken"));
        ret = false;
    }
    else if (txtSMSToken.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(txtSMSToken);
        txtSMSToken.popover('hide');
    }

    if (ret) {
        if (txtSMSToken.val().length < 5) {
            eBankit.Presentation.InsertValidateMsg(txtSMSToken, top.eBankit.Presentation.GetResource("InvalidSMSToken"));
            ret = false;
        }
        else {
            eBankit.Presentation.RemoveValidateMsg(txtSMSToken);
            txtSMSToken.popover('hide');
        }
    }
    return ret;
}

eBankit.Presentation.Register.ValidateInputsKeys = function () {
    ret=true;
    if (TextBoxNewKey.val() == "1234567" || TextBoxNewKey.val() == "7654321") {
       eBankit.Presentation.InsertValidateMsg(TextBoxNewKey, top.eBankit.Presentation.GetResource("InvalidKey"));
       ret = false;
    }

    var arr = TextBoxNewKey.val().split("");
    var previousitem = arr[0];
    var isDiferent = false;
    
    for (var i = 1; i < arr.length ; i++) {
        if (previousitem != arr[i]) {
            isDiferent = true;
            break;
        }
    }

    if (!isDiferent || TextBoxNewKey.val().length != 7 || !eBankit.Presentation.ValidateNumeric(TextBoxNewKey.val())) {
        if (!eBankit.Presentation.ValidateNumeric(TextBoxNewKey.val()))
            eBankit.Presentation.InsertValidateMsg(TextBoxNewKey, top.eBankit.Presentation.GetResource("InvalidNumericKey"));
        else
            eBankit.Presentation.InsertValidateMsg(TextBoxNewKey, top.eBankit.Presentation.GetResource("InvalidKey"));
        ret = false;
    }
    else {
        TextBoxNewKey.popover('hide');
    }

    if (TextBoxNewKey.val() != TextBoxNewKeyConfirm.val() && TextBoxNewKeyConfirm.val()!='') {
        eBankit.Presentation.InsertValidateMsg(TextBoxNewKeyConfirm, top.eBankit.Presentation.GetResource("InvalidNewKeyConfirm"));
        ret = false;
    }
    else {
        TextBoxNewKeyConfirm.popover('hide');
    }
    return ret;
}

eBankit.Presentation.Register.ValidateInputNewKey = function () {
    ret=true;
    
    if (TextBoxNewKey.val() == '' ) {
        eBankit.Presentation.InsertValidateMsg(TextBoxNewKey, top.eBankit.Presentation.GetResource("RequiredNewKey"));
        ret = false;
    }
    else if (TextBoxNewKey.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(TextBoxNewKey);
        TextBoxNewKey.popover('hide');
    }

    if (ret) {
        ret=eBankit.Presentation.Register.ValidateInputsKeys();
    }
    return ret;
}

eBankit.Presentation.Register.ValidateInputNewKeyConfirm = function () {
    ret=true;
    
    if (TextBoxNewKeyConfirm.val() == '' ) {
        eBankit.Presentation.InsertValidateMsg(TextBoxNewKeyConfirm, top.eBankit.Presentation.GetResource("RequiredNewKeyConfirm"));
        ret = false;
    }
    else if (TextBoxNewKey.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(TextBoxNewKeyConfirm);
        TextBoxNewKeyConfirm.popover('hide');
    }

    if (ret) {
        ret=eBankit.Presentation.Register.ValidateInputsKeys();
    }
    return ret;
}

eBankit.Presentation.Register.ValidateInputAnswer = function (elem) {
    ret=true;
    if (elem.val()=="") {
        eBankit.Presentation.InsertValidateMsg(elem, top.eBankit.Presentation.GetResource("InvalidAnswer"));
        ret = false;
    }
    else if (elem.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(elem);
        elem.popover('hide');
    }

    return ret;
}

eBankit.Presentation.Register.ValidateInputQuestion = function (elem) {
    ret=true;
    
    
        if(elem.val()=="")
        {
            eBankit.Presentation.InsertValidateMsg(elem, top.eBankit.Presentation.GetResource("InvalidQuestion"));
            ret = false;
        }
        else if (elem.val() != '') {
            eBankit.Presentation.RemoveValidateMsg(elem);
            elem.popover('hide');
        }

    return ret;
}

TextBoxNewKeyConfirm.on('blur', function (e) {
    ret=eBankit.Presentation.Register.ValidateInputNewKeyConfirm();
    return ret;
});

TextBoxNewKeyConfirm.on('focus', function (e) {
    hdnInputTextField.val(1);
});

TextBoxNewKeyConfirm.on('keyup', function (e) {
    if (e.keyCode == 13) {
        e.preventDefault();
        return false;
    }
});

TextBoxNewKeyConfirm.on('keypress', function (e) {
    if (e.keyCode == 13) {
        e.preventDefault();
        return false;
    }
});

TextBoxNewKey.on('blur', function (e) {
    ret=eBankit.Presentation.Register.ValidateInputNewKey();
    return ret;
});

TextBoxNewKey.on('focus', function (e) {
    hdnInputTextField.val(2);
});

TextBoxNewKey.on('keyup', function (e) {
    if (e.keyCode == 13) {
        e.preventDefault();
        return false;
    }
});

TextBoxNewKey.on('keypress', function (e) {
    if (e.keyCode == 13) {
        e.preventDefault();
        return false;
    }
});

txtSMSToken.on('blur', function (e) {
    ret=eBankit.Presentation.Register.ValidateInputSmsToken();
    return ret;
});

txtSMSToken.on('focus', function (e) {
    hdnInputTextField.val(3);
});

txtSMSToken.on('keyup', function (e) {
    if (e.keyCode == 13) {
        e.preventDefault();
        return false;
    }
});

txtSMSToken.on('keypress', function (e) {
    if (e.keyCode == 13) {
        e.preventDefault();
        return false;
    }
});

$('.rpt-security-questions .cd-select').on('change', function(e){
    ret=eBankit.Presentation.Register.ValidateInputQuestion($(e.target));
    return ret;
})

$('.rpt-security-questions .trx-field').on('blur', function (e) {
    ret=eBankit.Presentation.Register.ValidateInputAnswer($(e.target));
    return ret;
});

eBankit.Presentation.Register.ResendSMS = function () {
    __doPostBack(btnResendSMSId, '');
    return false;
}

$(document).ready(function () {


    //////////////////////////////////////////   PHPONE CONTACTS COLLAPSE EVENTS   /////////////////////////////////////////////////

    $('#collapseMobileContacts').on('show.bs.collapse', function () {
        ToogleArrowIcon("collapseMobileContactsIcon");
    });

    $('#collapseMobileContacts').on('hide.bs.collapse', function () {
        ToogleArrowIcon("collapseMobileContactsIcon");
    });

    $('#collapseCallingContacts').on('show.bs.collapse', function () {
        ToogleArrowIcon("collapseCallingContactsIcon");
    });

    $('#collapseCallingContacts').on('hide.bs.collapse', function () {
        ToogleArrowIcon("collapseCallingContactsIcon");
    });


    $('#collapseKeyboard').on('show.bs.collapse', function () {
        $('#keyboardSwitchHeader').html(hideKeyboardTitle);
    });

    $('#collapseKeyboard').on('hide.bs.collapse', function () {
        $('#keyboardSwitchHeader').html(showKeyboardTitle);
    });

    $('#collapseForgetPwd').on('show.bs.collapse', function () {
        ToogleArrowLeftDownIcon("collapseForgetPwdIcon");
    });

    $('#collapseForgetPwd').on('hide.bs.collapse', function () {
        ToogleArrowLeftDownIcon("collapseForgetPwdIcon");
    });

});


function ToogleArrowIcon(iconID) {

    var iconArrow = $('#' + iconID);

    if (iconArrow.hasClass("icon-arrow-down")) {
        iconArrow.removeClass("icon-arrow-down");
        iconArrow.addClass("icon-arrow-up");
    }
    else {
        iconArrow.removeClass("icon-arrow-up");
        iconArrow.addClass("icon-arrow-down");
    }
}


function ToogleArrowLeftDownIcon(iconID) {

    var iconArrow = $('#' + iconID);

    if (iconArrow.hasClass("icon-arrow-right")) {
        iconArrow.removeClass("icon-arrow-right");
        iconArrow.addClass("icon-arrow-down");
    }
    else {
        iconArrow.removeClass("icon-arrow-down");
        iconArrow.addClass("icon-arrow-right");
    }
}