eBankit.Presentation.Login = {}
eBankit.Presentation.Login.ValidateInputs = function (elem) {
    var ret = true;
    if (TextBoxLogin.val() == '' && (elem == undefined || elem.id == TextBoxLogin[0].id)) {
        eBankit.Presentation.InsertValidateMsg(TextBoxLogin, top.eBankit.Presentation.GetResource("RequiredUserName"));
        ret = false;
    }
    else if (TextBoxLogin.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(TextBoxLogin);
        TextBoxLogin.popover('hide');
    }

    if (TextBoxPassword.val() == '' && (elem == undefined || elem.id == TextBoxPassword[0].id)) {
        eBankit.Presentation.InsertValidateMsg(TextBoxPassword, top.eBankit.Presentation.GetResource("RequiredPassword"));
        ret = false;
    }
    else if (TextBoxPassword.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(TextBoxPassword);
        TextBoxPassword.popover('hide');
    }

    return ret;
}

function selectImage(divImage) {
    unselectAllImages();
    var divImageContainer = $(divImage).find(".image-container-selector");
    divImageContainer.addClass("selected");
    divImageContainer.find(".image-container-selector-fill").html("&#10004;");
    hdnSecurityImage.val($(divImage).find("img").attr('key'));
};
function unselectAllImages() {
    $('.image-container-item').each(function (i, el) {
        var divImageContainer = $(el).find(".image-container-selector");
        divImageContainer.removeClass("selected");
        divImageContainer.find(".image-container-selector-fill").html("");
    });
};

eBankit.Presentation.Login.ValidateUserName = function (elem) {
    var ret = true;
    if (TextBoxLogin.val() == '' && (elem == undefined || elem.id == TextBoxLogin[0].id)) {
        eBankit.Presentation.InsertValidateMsg(TextBoxLogin, top.eBankit.Presentation.GetResource("RequiredUserName"));
        ret = false;
    }
    else if (TextBoxLogin.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(TextBoxLogin);
        TextBoxLogin.popover('hide');
    }

    return ret;
}

eBankit.Presentation.Login.Validate2ndAccessCode = function (elem) {
    var ret = true;
    if (TextBox2ndAccessCode.val() == '' && (elem == undefined || elem.id == TextBox2ndAccessCode[0].id)) {
        eBankit.Presentation.InsertValidateMsg(TextBox2ndAccessCode, top.eBankit.Presentation.GetResource("Required2ndAccessCode"));
        ret = false;
    }
    else if (TextBox2ndAccessCode.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(TextBox2ndAccessCode);
        TextBox2ndAccessCode.popover('hide');
    }

    return ret;
}

eBankit.Presentation.Login.ValidatePassword = function (elem) {
    var ret = true;
    if (TextBoxPassword.val() == '' && (elem == undefined || elem.id == TextBoxPassword[0].id)) {
        eBankit.Presentation.InsertValidateMsg(TextBoxPassword, top.eBankit.Presentation.GetResource("RequiredPassword"));
        ret = false;
    }
    else if (TextBoxPassword.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(TextBoxPassword);
        TextBoxPassword.popover('hide');
    }

    if (TextBoxHardToken.val() == '' && (elem == undefined || elem.id == TextBoxHardToken[0].id)) {
        eBankit.Presentation.InsertValidateMsg(TextBoxHardToken, top.eBankit.Presentation.GetResource("RequiredHardToken"));
        ret = false;
    }
    else if (TextBoxHardToken.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(TextBoxHardToken);
        TextBoxHardToken.popover('hide');
    }

    return ret;
}

eBankit.Presentation.Login.ValidatePasswordAndImage = function (elem) {
    var ret = true;
    if (TextBoxPassword.val() == '' && (elem == undefined || elem.id == TextBoxPassword[0].id)) {
        eBankit.Presentation.InsertValidateMsg(TextBoxPassword, top.eBankit.Presentation.GetResource("RequiredPassword"));
        ret = false;
    }
    else if (TextBoxPassword.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(TextBoxPassword);
        TextBoxPassword.popover('hide');
    }

    if (SecurityImageCheck.is(":checked")) {
        eBankit.Presentation.Login.RemoveCheckBoxValidateMsg(SecurityImageCheck);
        SecurityImageCheck.popover('hide');
    }
    else {
        eBankit.Presentation.Login.InsertCheckBoxValidateMsg(SecurityImageCheck, top.eBankit.Presentation.GetResource("RequiredImageAndCaption"));
        ret = false;
    }

    return ret;
}

eBankit.Presentation.Login.InsertCheckBoxValidateMsg = function (elem, text) {
    var newElem = document.createElement("label");
    elem.addClass("login-check-with-error")
    if (elem[0] != undefined && elem[0].parentNode.lastChild.className != "login-check-with-error") {
        newElem.className = "login-check-with-error";
        newElem.setAttribute("id", elem[0].id);
        if (document.all)
            newElem.innerText = text;
        else
            newElem.textContent = text;

        elem[0].parentNode.appendChild(newElem);
    }
}

eBankit.Presentation.Login.RemoveCheckBoxValidateMsg = function (elem) {
    elem.removeClass("login-check-with-error");
    if (elem != null && elem[0] != null && elem[0].parentNode != null && elem[0].parentNode.lastChild.className == "login-check-with-error") {
        elem[0].parentNode.removeChild(elem[0].parentNode.lastChild);
    }
}

eBankit.Presentation.Login.ValidateSecurityQuestion = function (elem) {
    var ret = true;
    if (TextSecurityQuestion.val() == '' && (elem == undefined || elem.id == TextSecurityQuestion[0].id)) {
        eBankit.Presentation.InsertValidateMsg(TextSecurityQuestion, top.eBankit.Presentation.GetResource("RequiredSecurityQuestion"));
        ret = false;
    }
    else if (TextSecurityQuestion.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(TextSecurityQuestion);
        TextSecurityQuestion.popover('hide');
    }

    return ret;
}

eBankit.Presentation.Login.SetKey = function (keyvalue) {
    if (hdnInputTextField.val() != '2') {
        TextBoxLogin.val(TextBoxLogin.val() + keyvalue.innerText);
        eBankit.Presentation.RemoveValidateMsg(TextBoxLogin);
    }
    else {
        TextBoxPassword.val(TextBoxPassword.val() + keyvalue.innerText);
        eBankit.Presentation.RemoveValidateMsg(TextBoxPassword);
    }
}

TextBoxLogin.on('keyup', function (e) {
    eBankit.Presentation.Login.ValidateInputs(TextBoxLogin[0]);
});

TextBoxLogin.on('keydown', function (e) {
    if (e.keyCode == 32)
        return false;
});

TextBoxLogin.on("change", function (evt) {
    $(this).val(function (i, v) { return v.replace(/ /g, ""); });
});

TextBoxLogin.on('focus', function (e) {
    hdnInputTextField.val(1);
});

TextBoxPassword.on('keyup', function (e) {
    eBankit.Presentation.Login.ValidateInputs(TextBoxPassword[0]);
});

TextBoxHardToken.on('keyup', function (e) {
    eBankit.Presentation.Login.ValidatePassword(TextBoxHardToken[0]);
});

TextBoxPassword.on('focus', function (e) {
    hdnInputTextField.val(2);
});

$(document).ready(function () {
    var btnKey_0a = $('#btnKey_0a');
    var btnKey_1a = $('#btnKey_1a');
    var btnKey_2a = $('#btnKey_2a');
    var btnKey_3a = $('#btnKey_3a');
    var btnKey_4a = $('#btnKey_4a');
    var btnKey_5a = $('#btnKey_5a');
    var btnKey_6a = $('#btnKey_6a');
    var btnKey_7a = $('#btnKey_7a');
    var btnKey_8a = $('#btnKey_8a');
    var btnKey_9a = $('#btnKey_9a');

    var numbers = "0123456789";
    var rnum = 0;
    var randomnumber = 0;

    for (var i = 0; i < 10; i++) {
        rnum = Math.floor(Math.random() * numbers.length);
        randomnumber = parseInt(numbers.substring(rnum, rnum + 1));

        numbers = numbers.replace(randomnumber, "");
        switch (i) {
            case 0:
                btnKey_0a.text(randomnumber);
                break;
            case 1:
                btnKey_1a.text(randomnumber);
                break;
            case 2:
                btnKey_2a.text(randomnumber);
                break;
            case 3:
                btnKey_3a.text(randomnumber);
                break;
            case 4:
                btnKey_4a.text(randomnumber);
                break;
            case 5:
                btnKey_5a.text(randomnumber);
                break;
            case 6:
                btnKey_6a.text(randomnumber);
                break;
            case 7:
                btnKey_7a.text(randomnumber);
                break;
            case 8:
                btnKey_8a.text(randomnumber);
                break;
            case 9:
                btnKey_9a.text(randomnumber);
                break;
            default:
        }
    }

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

    $("#carousel-generic").carousel();

    $('#aspnetForm').keypress(function (e) {
        if (e.keyCode == '13') {
            var btnCancel = $("input[id*='btnCancel']");
            if (!btnCancel.is(":focus")) {
                $('[id$=btn2ndLevelLogin]').click();
                $('[id$=btnGoToSecondStep]').click();
                $('[id$=btnGoToThirdStep]').click();
                $('[id$=btnLogin]').click();
                return false;
            }
        }
    });

    $('#aspnetForm').submit(function (e) {
        $("input").blur();
        $("textarea").blur();
    });

    $('.login-button').hide();

    getLocation();
});

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    }
}
function showPosition(position) {
    var lat = $('[id$=trackLat]');
    lat.val(position.coords.latitude);
    var lon = $('[id$=trackLon]');
    lon.val(position.coords.longitude);
}

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
