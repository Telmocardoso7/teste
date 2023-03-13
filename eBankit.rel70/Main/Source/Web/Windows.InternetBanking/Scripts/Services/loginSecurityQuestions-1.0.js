eBankit.Presentation.LoginSecurityQuestions = {}
eBankit.Presentation.LoginSecurityQuestions.ValidateQuestions = function (elem) {
    var ret = true;

    hdnQuestions.val('');
    $("select[id*='ddlQuestion']").each(function () {
        if ($(this).val() == "") {
            eBankit.Presentation.InsertValidateMsg($(this), top.eBankit.Presentation.GetResource("InvalidQuestion"));
            ret = false;
        }
        else if ($(this).val() != '') {
            hdnQuestions.val(hdnQuestions.val() + "|" + $(this).val())
            eBankit.Presentation.RemoveValidateMsg($(this));
            $(this).popover('hide');
        }
    });

    hdnAnswers.val('');
    $("input[id*='txtAnswer']").each(function () {
        if ($(this).val() == "") {
            eBankit.Presentation.InsertValidateMsg($(this), top.eBankit.Presentation.GetResource("InvalidAnswer"));
            ret = false;
        }
        else if ($(this).val() != '') {
            hdnAnswers.val(hdnAnswers.val() + "|" + $(this).val())
            eBankit.Presentation.RemoveValidateMsg($(this));
            $(this).popover('hide');
        }
    });

    return ret;
};


eBankit.Presentation.LoginSecurityQuestions.ValidateImages = function (elem) {
    var valImage;
    var valCaption;
    var ret = false;

    if (hdnHasImage.val() == "true") {
        $('.image-container-item').each(function (i, el) {
            var divImageContainer = $(el).find(".image-container-selector");
            if (divImageContainer.hasClass("selected")) {
                valImage = true;
                $('.image-container-item').css("border", "0px");
            }
        });
    }
    if (!valImage && hdnHasImage.val() == "true") {
        $('.image-container-item').css("border", "2px solid red");
    }

    if (hdnHasCaption.val() == "true") {
        if (TextBoxImageCaption.val() == '' && (elem == undefined || elem.id == TextBoxImageCaption[0].id)) {
            eBankit.Presentation.InsertValidateMsg(TextBoxImageCaption, top.eBankit.Presentation.GetResource("ImageCaptionInvalid"));;
            valCaption = false;
        }
        else if (TextBoxImageCaption.val() != '') {
            eBankit.Presentation.RemoveValidateMsg(TextBoxImageCaption);
            TextBoxImageCaption.popover('hide');
            valCaption = true;
        }
    }

    if ((!valImage && hdnHasImage.val() == "true") || (!valCaption && hdnHasCaption.val() == "true")) {
        ret = false;
    } else {
        ret = true;
    }

    return ret;
};

eBankit.Presentation.LoginSecurityQuestions.ValidateNewAccessCode = function (elem) {

    var ret = true;

    if (TextBoxNewUsername.val() == '' && (elem == undefined || elem.id == TextBoxNewUsername[0].id)) {
        eBankit.Presentation.InsertValidateMsg(TextBoxNewUsername, top.eBankit.Presentation.GetResource("RequiredNewUsername"));;
        ret = false;
    }
    else if (TextBoxNewUsername.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(TextBoxNewUsername);
        TextBoxNewUsername.popover('hide');
    }

    if (TextBoxNewKey.val() == '' && (elem == undefined || elem.id == TextBoxNewKey[0].id)) {
        eBankit.Presentation.InsertValidateMsg(TextBoxNewKey, top.eBankit.Presentation.GetResource("RequiredNewKey"));;
        ret = false;
    }
    else if (TextBoxNewKey.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(TextBoxNewKey);
        TextBoxNewKey.popover('hide');
    }

    if (TextBoxNewKeyConfirm.val() == '' && (elem == undefined || elem.id == TextBoxNewKeyConfirm[0].id)) {
        eBankit.Presentation.InsertValidateMsg(TextBoxNewKeyConfirm, top.eBankit.Presentation.GetResource("RequiredNewKeyConfirm"));
        ret = false;
    }
    else if (TextBoxNewKeyConfirm.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(TextBoxNewKeyConfirm);
        TextBoxNewKeyConfirm.popover('hide');
    }

    if (TextBoxNewKeyConfirm.val() == '' && (elem == undefined || elem.id == TextBoxNewKeyConfirm[0].id)) {
        eBankit.Presentation.InsertValidateMsg(TextBoxNewKeyConfirm, top.eBankit.Presentation.GetResource("RequiredNewKeyConfirm"));
        ret = false;
    }
    else if (TextBoxNewKeyConfirm.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(TextBoxNewKeyConfirm);
        TextBoxNewKeyConfirm.popover('hide');
    }

    if (ret) {

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

        if (TextBoxNewKey.val() != TextBoxNewKeyConfirm.val()) {
            eBankit.Presentation.InsertValidateMsg(TextBoxNewKeyConfirm, top.eBankit.Presentation.GetResource("InvalidNewKeyConfirm"));
            ret = false;
        }
        else {
            TextBoxNewKeyConfirm.popover('hide');
        }
    }

    return ret;
};

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

