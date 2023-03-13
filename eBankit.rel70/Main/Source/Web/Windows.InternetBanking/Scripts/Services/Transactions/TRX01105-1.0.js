document.addEventListener("DOMContentLoaded", function () {

    //remove default validation messages
    var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };
    $("#aspnetForm").validate($params);

    //continue button
    document.querySelector(".btn.btn-primary").addEventListener('click', function (event) {
        if (!customControllerValidation('PhoneTextBoxControl_txField') && !customControllerValidation('TextBoxControlEmail_txField')) {
            event.preventDefault();
            return
        }
        if (!customPhoneValidation() || !customEmailValidation()) {
            event.preventDefault();
            return
        }
    });

    var phoneElem = document.querySelector('[id$=PhoneTextBoxControl_txField]')
    if (phoneElem) {
        phoneElem.addEventListener('keyup', customPhoneValidation);
        phoneElem.addEventListener('blur', customPhoneValidation);
    }

    var emailElem = document.querySelector('[id$=TextBoxControlEmail_txField]')
    if (emailElem) {
        emailElem.addEventListener('keyup', customEmailValidation);
        emailElem.addEventListener('blur', customEmailValidation);
    }
});

customPhoneValidation = function () {
    const phoneInputElem = $('[id$=PhoneTextBoxControl_txField]');
    var phoneValue = phoneInputElem.val();
    eBankit.Presentation.RemoveValidateMsg(phoneInputElem);
    if (phoneValue !== '' && !eBankit.Presentation.ValidateTamanhoRefTelem(phoneValue)) {
        eBankit.Presentation.InsertValidateMsg_V2(phoneInputElem, top.eBankit.Presentation.GetResource("SingleFieldValidation"));
        return false
    }
    return true;
};

customEmailValidation = function () {
    const emailInputElem = $('[id$=TextBoxControlEmail_txField]');
    var emailValue = emailInputElem.val();
    eBankit.Presentation.RemoveValidateMsg(emailInputElem);
    eBankit.Presentation.RemoveCustomValidateMsg(emailInputElem);
    if (emailValue !== '' && !eBankit.Presentation.ValidateEmailExp(emailValue)) {
        eBankit.Presentation.InsertCustomValidateMsg(emailInputElem, top.eBankit.Presentation.GetResource("SingleFieldValidation"));
        return false;
    }
    return true;
};

customControllerValidation = function (controllerID) {
    var elem = $('[id$=' + controllerID + ']');
    eBankit.Presentation.RemoveValidateMsg(elem);
    if (elem.val() == null || elem.val() == '') {
        eBankit.Presentation.InsertValidateMsg_V2(elem, top.eBankit.Presentation.GetResource("MultipleFieldValidation"));
        return false
    }
    return true;
};