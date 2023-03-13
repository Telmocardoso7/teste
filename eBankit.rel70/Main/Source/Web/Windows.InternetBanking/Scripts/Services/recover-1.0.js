eBankit.Presentation.Recover = {}
eBankit.Presentation.Recover.ValidateInputsConfirm = function (elem) {
    var ret = true;

    $('.trx-field').each(function () {

        if ($(this).is(":visible") && $(this).val() == '') {
            eBankit.Presentation.InsertValidateMsg($(this), top.eBankit.Presentation.GetResource("InvalidAnswer"));
            ret = false;
        }
        else {
            eBankit.Presentation.RemoveValidateMsg($(this));
        }
    });

    return ret;
}

function AddRequiredFieldValidator(controlElement, elem) {
    var v = true;

    if (controlElement.val() == '' && (elem == undefined || elem.id == controlElement[0].id)) {
        eBankit.Presentation.InsertValidateMsg(controlElement, top.eBankit.Presentation.GetResource("RequiredField"));
        v = false;
    }
    else if (controlElement.val() != '') {
        eBankit.Presentation.RemoveValidateMsg(controlElement);
        controlElement.popover('hide');
    }

    return v;
}

eBankit.Presentation.Recover.ValidateRecover = function (elem) {
    var ret = true;

    if (!AddRequiredFieldValidator(txtAlias, elem)) {
        ret = false;
    }

    var ddlIdentityType = $('[id$=ddlIdentityType_dlField]');
    var ddlIdentityTypeSelected = ddlIdentityType.find('option:selected').val();


    if (divOther.is(":visible") && ddlIdentityTypeSelected == '') {
        eBankit.Presentation.InsertValidateMsg(ddlIdentityType, top.eBankit.Presentation.GetResource("OtherKeyTypeMsg"));
        ret = false;
    }
    else {
        eBankit.Presentation.RemoveValidateMsg(ddlIdentityType);
    }

    if (divOtherValue.is(":visible") && txtOtherKeyValue.val() == '') {
        eBankit.Presentation.InsertValidateMsg(txtOtherKeyValue, top.eBankit.Presentation.GetResource("OtherKeyValueMsg"));
        ret = false;
    }
    else if (ddlIdentityTypeSelected == 'EMAIL' && !eBankit.Presentation.ValidateEmailExp(txtOtherKeyValue.val())) {
        eBankit.Presentation.InsertValidateMsg(txtOtherKeyValue, top.eBankit.Presentation.GetResource("InvalidEmail"));
        ret = false;
    }
    else {
        eBankit.Presentation.RemoveValidateMsg(txtOtherKeyValue);
    }

    return ret;
}

eBankit.Presentation.Recover.toDate = function (date) {
    var arr = date.split("-");
    return new Date(arr[2], arr[1] - 1, arr[0]);
}

eBankit.Presentation.Recover.ToogleOtherField = function () {

    eBankit.Presentation.RemoveValidateMsg(txtOtherKeyValue);

    var ddlIdentityType = $('[id$=ddlIdentityType_dlField]');

    if (divOtherValue.is(":visible") && ddlIdentityType.find('option:selected').val() == '') {
        divOtherValue.addClass('hidden');
        divOtherValue.hide();
    }
    else if (!divOtherValue.is(":visible")) {
        divOtherValue.removeClass('hidden');
        divOtherValue.show();
        lblOtherKeyValue.text(ddlIdentityType.find("option:selected").text());
    }
    else if (ddlIdentityType.find('option:selected').val() != '') {
        lblOtherKeyValue.text(ddlIdentityType.find("option:selected").text());
    }
}

eBankit.Presentation.Recover.ToogleOtherFieldInit = function () {

    var ddlIdentityType = $('[id$=ddlIdentityType_dlField]');

    if (ddlIdentityType.find('option:selected').val() != '') {
        divOtherValue.removeClass('hidden');
        divOtherValue.show();
        lblOtherKeyValue.text(ddlIdentityType.find("option:selected").text());
    }
}

eBankit.Presentation.Recover.ToogleDocumentType = function (divId, divToHideId) {
    div = $("#" + divId);
    div.show();
    $("#" + divToHideId).hide();
    hdnRadio = $('[id$=hdnRadio]');
}

window.onbeforeunload = function () {
    if (!eBankit.Presentation.NoLoading)
        if (typeof (SessionGuid) == 'undefined')
            eBankit.Presentation.BlockPageForNormalRequest();
    $('body').css("position", "");
};

$(document).ready(function () {
    var pnUserData = $('[id$=pnUserData]');
    var pnQuestions = $('[id$=pnQuestions]');

    var liSetp1 = $('[id$=liSetp1]');
    var liSetp2 = $('[id$=liSetp2]');

    $('.carousel').carousel({
        pause: "false",
        interval: 4000
    });

    $('.carousel').css({ 'margin': 0, 'width': $(window).outerWidth(), 'height': $(window).outerHeight() });
    $('.carousel .item').css({ 'position': 'fixed', 'width': '100%', 'height': '100%' });
    $('.carousel-inner div.item img').each(function () {
        var imgSrc = $(this).attr('src');
        $(this).parent().css({ 'background': 'url(' + imgSrc + ') center center no-repeat', '-webkit-background-size': '100% ', '-moz-background-size': '100%', '-o-background-size': '100%', 'background-size': '100%', '-webkit-background-size': 'cover', '-moz-background-size': 'cover', '-o-background-size': 'cover', 'background-size': 'cover' });
        $(this).remove();
    });

    $(window).on('resize', function () {
        $('.carousel').css({ 'width': $(window).outerWidth(), 'height': $(window).outerHeight() });
    });

    $('.step').removeClass('step-selected');

    if (pnUserData.is(":visible")) {
        liSetp1.addClass('step-selected')
    }
    else if (pnQuestions.is(":visible")) {
        liSetp2.addClass('step-selected')
    }

    $('#aspnetForm').on('keyup keypress', function (e) {
        var code = e.keyCode || e.which;
        if (code == 13) {
            var btnCancel = $("input[id*='btnCancel']");
            if (!btnCancel.is(":focus")) {
                e.preventDefault();
                return false;
            }
        }
    });

    eBankit.Presentation.Recover.ToogleOtherFieldInit();

    $('#aspnetForm').keypress(function (e) {
        if (e.keyCode == '13') {
            var btnCancel = $("input[id*='btnCancel']");
            if (!btnCancel.is(":focus")) {
                $("[id*=btnNextStep]").click();
                return false;
            }
        }
    });

    $('#aspnetForm').submit(function (e) {
        $("input").blur();
        $("textarea").blur();
    });
});


$(document).ready(function ($) {
    $("[id$=ddlIdentityType_dlField]").change(function () {
        if ($("[id$=ddlIdentityType_dlField] option:selected").val() == 'PHONE') {
            $("[id$=txtOtherKeyValue_txField]").mask("+999 999 999 999 999", {
                placeholder: "+351 _____ _____ _____"
            });
        }
        else {
            $("[id$=txtOtherKeyValue_txField]").unmask();
            $("[id$=txtOtherKeyValue_txField]").attr("placeholder", top.eBankit.Presentation.GetResource("OtherKeyWatermark"));
        }
    });
});
