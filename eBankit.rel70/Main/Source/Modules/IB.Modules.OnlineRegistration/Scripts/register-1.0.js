eBankit.Presentation.Register2 = {};
eBankit.Presentation.Register2.ValidateInputsConfirm = function (elem) {

	var regex = /^\d+$/;
	var ret = true;

	if (TextBoxNewKey.val() == '' && (elem == undefined || elem.id == TextBoxNewKey[0].id)) {

		eBankit.Presentation.InsertValidateMsg(TextBoxNewKey, top.eBankit.Presentation.GetResource("RequiredNewKey"));
		//TextBoxLogin.popover({ 'placement': 'top', 'content': top.eBankit.Presentation.GetResource("RequiredUserName") });
		//TextBoxLogin.popover('show');
		//TextBoxLogin.next().addClass('popover-error');
		ret = false;
	}
	else if (TextBoxNewKey.val() != '') {
		eBankit.Presentation.RemoveValidateMsg(TextBoxNewKey);
		TextBoxNewKey.popover('hide');
	}

	if (ret) {

		if (TextBoxNewKey.val() == "1234567" || TextBoxNewKey.val() == "7654321") {
			eBankit.Presentation.InsertValidateMsg(TextBoxNewKey, top.eBankit.Presentation.GetResource("InvalidKey"));
			ret = false;
		}
		else if (regex.test(TextBoxNewKey.val()) && hdnCredentialType.val() == "5") {
			eBankit.Presentation.InsertValidateMsg(TextBoxNewKey, top.eBankit.Presentation.GetResource("InvalidKey"));
			ret = false;
		}

		var arrConfirm = TextBoxConfirmNewKey.val();
		var arr = TextBoxNewKey.val();

		var isDiferent = false;
		if (arrConfirm != arr) {
			isDiferent = true;
		}

		if (isDiferent || (hdnCredentialType.val() == "5" && (TextBoxNewKey.val().length < 6 || TextBoxNewKey.val().length > 48)) || (hdnCredentialType.val() == "0" && TextBoxNewKey.val().length != 7)) {
			eBankit.Presentation.InsertValidateMsg(TextBoxNewKey, top.eBankit.Presentation.GetResource("InvalidKey"));
			ret = false;
		}
	}

	return ret;
};
eBankit.Presentation.Register2.ValidateConfirmKey = function () {

	if (TextBoxNewKey.val() != TextBoxConfirmNewKey.val()) {
		eBankit.Presentation.InsertValidateMsg(TextBoxConfirmNewKey, top.eBankit.Presentation.GetResource("ConfirmInvalidKey"));
		return false;
	} else {
		eBankit.Presentation.RemoveValidateMsg(TextBoxConfirmNewKey);
	}

	return true;
};
eBankit.Presentation.Register2.ValidateRegister = function (elem) {
	var ret = true;
	///VALIDATE INPUTS


	if (!AddRequiredFieldValidator(txtTaxID, elem)) {
		ret = false;
	} else {
		if (!IsValidNIF(txtTaxID.val())) {
			eBankit.Presentation.InsertValidateMsg(txtTaxID, top.eBankit.Presentation.GetResource("InvalidNIF"));
			ret = false;
		}
	}

	if (!AddRequiredFieldValidator(txtName, elem)) {
		ret = false;
	} if (!AddRequiredFieldValidator(txtAccount, elem)) {
		ret = false;
	}
	if (!AddRequiredFieldValidator(txtEmail, elem)) {
		ret = false;
	} else {
		if (!eBankit.Presentation.ValidateEmailExp(txtEmail.val())) {
			eBankit.Presentation.InsertValidateMsg(txtEmail, top.eBankit.Presentation.GetResource("InvalidEmail")); ret = false;
		}
	}
	if (!AddRequiredFieldValidator(txtPhone, elem)) {
		ret = false;
	}

	var dtIDValidate = $('[id$=dtIDValidate_txField]');
	var dtPassport = $('[id$=dtPassport_txField]');

	var d = new Date();

	//var dID = eBankit.Presentation.Register2.toDate(dtIDValidate.val());
	//var dPassport = eBankit.Presentation.Register2.toDate(dtPassport.val());

    var dID = new Date(eBankit.dateJS.getDateFromFormat(dtIDValidate.val(), dateJSFormat));
    var dPassport = new Date(eBankit.dateJS.getDateFromFormat(dtPassport.val(), dateJSFormat));


	var dNow = eBankit.Presentation.Register2.toDate(d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate());

	if (dtIDValidate.is(":visible") && dID < dNow) {
		eBankit.Presentation.InsertValidateMsg(dtIDValidate, top.eBankit.Presentation.GetResource("dtIDDateErroMsg"));
		ret = false;
	}
	else {
		eBankit.Presentation.RemoveValidateMsg(dtIDValidate);
	}

	if (dtPassport.is(":visible") && dPassport < dNow) {
		eBankit.Presentation.InsertValidateMsg(dtPassport, top.eBankit.Presentation.GetResource("dPassportDateErroMsg"));
		ret = false;
	}
	else {
		eBankit.Presentation.RemoveValidateMsg(dtPassport);
	}

	if (txtPhone.val().length < 16) {
		eBankit.Presentation.InsertValidateMsg(txtPhone, top.eBankit.Presentation.GetResource("CellPhoneInvalidMsg"));
		ret = false;
	}
	else {
		eBankit.Presentation.RemoveValidateMsg(txtPhone);
	}

	return ret;
};
eBankit.Presentation.Register2.ValidateQuestions = function (elem) {
	var ret;
	var valQuestion = true;
	var valAnswer = true;
	$('.cd-select').each(function (i, el) {
		if (!$(el).val() == "") {
			eBankit.Presentation.RemoveValidateMsg($(el), top.eBankit.Presentation.GetResource("InvalidSecurityQuestion"));
		} else {
			eBankit.Presentation.InsertValidateMsg($(el), top.eBankit.Presentation.GetResource("InvalidSecurityQuestion"));
			valQuestion = false;

		}
	});


	$('.trx-field').each(function (i, el) {

		if (!($.trim($(el).val()) == "")) {
			eBankit.Presentation.RemoveValidateMsg($(el), top.eBankit.Presentation.GetResource("RequiredSecurityQuestion"));
		} else {
			valAnswer = false;
			eBankit.Presentation.InsertValidateMsg($(el), top.eBankit.Presentation.GetResource("RequiredSecurityQuestion"));


		}
	});


	if (!valQuestion || !valAnswer) {
		ret = false;;
	}
	else {
		ret = true;
	}


	return ret;
};

eBankit.Presentation.Register2.ValidateImages = function (elem) {
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
		if (!($.trim($('#securityImagesList :text').val()) == "")) {
			valCaption = true;
			eBankit.Presentation.RemoveValidateMsg($('#securityImagesList :text'), top.eBankit.Presentation.GetResource("ImageCaptionInvalid"));

		} else {
			eBankit.Presentation.InsertValidateMsg($('#securityImagesList :text'), top.eBankit.Presentation.GetResource("ImageCaptionInvalid"));
			valCaption = false;
		}
	}

	if ((!valImage && hdnHasImage.val() == "true") || (!valCaption && hdnHasCaption.val() == "true")) {
		ret = false;
	} else {
		ret = true;
	}
	//if (!valImage && hdnHasImage.val() == "true") {
	//    ret = false;
	//    $('.image-container-item').css("border", "2px solid red");

	//} else {
	//    ret = true;
	//    $('.image-container-item').css("border", "0px");
	//}
	//    if (!($.trim($('#securityImagesList :text').val()) == "")) {
	//    valCaption = true;
	//}

	//    if (!valCaption && hdnHasCaption.val() =="true") {
	//    eBankit.Presentation.InsertValidateMsg($('#securityImagesList :text'), top.eBankit.Presentation.GetResource("ImageCaptionInvalid"));
	//    ret = false;;
	//}
	//else {
	//    ret = true;
	//    $('#imageCaption :text').css("border", "0px");
	//}
	return ret;
};
eBankit.Presentation.Register2.ToogleDocumentType = function (divId, divToHideId) {
	div = $("#" + divId);
	div.show();
	div.removeClass("hidden");
	$("#" + divToHideId).hide();
};
eBankit.Presentation.Register2.toDate = function (date) {
	var arr = date.split("-");
	return new Date(arr[2], arr[1] - 1, arr[0]);
};
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
eBankit.Presentation.Register2.SetInitPhoneNumber = function () {
	if (txtPhone.val() == "")
		txtPhone.val("+351");
};
TextBoxNewKey.on('keyup', function (e) {
	eBankit.Presentation.Register2.ValidateInputsConfirm(TextBoxNewKey[0]);
});

txtPhone.on('blur', function (e) {
	eBankit.Presentation.Register2.SetInitPhoneNumber();
});

$(document).ready(function () {
	var pnUserData = $('[id$=pnUserData]');
	var pnNewKey = $('[id$=pnNewKey]');
	var pnSecurityQuestions = $('[id$=pnSecurityQuestions]');
	var pnSecurityImages = $('[id$=pnSecurityImages]');
	var liSetp1 = $('[id$=liSetp1]');
	var liSetp2 = $('[id$=liSetp2]');
	var liSetp3 = $('[id$=liSetp3]');

	$('.step').removeClass('step-selected');

	if (pnUserData.is(":visible")) {
		liSetp1.addClass('step-selected');
	}
	else if (pnNewKey.is(":visible") || pnSecurityQuestions.is(":visible") || pnSecurityImages.is(":visible")) {
		liSetp2.addClass('step-selected');
	}

	//txtPhone.mask("+999 999 999 999");

	txtPhone.mask("+999 999 999 999 999", {
		placeholder: "+351 _____ _____ _____"
	});

	eBankit.Presentation.Register2.SetInitPhoneNumber();

	$('#aspnetForm').on('keyup keypress', function (e) {
		var code = e.keyCode || e.which;
		if (code == 13) {
			e.preventDefault();
			return false;
		}
	});

	var $calendPickerDateName1 = $calendPickerDate1.attr("name");
	var $calendPickerDateName2 = $calendPickerDate2.attr("name");

	var $params = {
		debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); }
	};
	$params['rules'][$calendPickerDateName1] = {
		"ValidateDateFormat": true
	};
	$params['rules'][$calendPickerDateName2] = {
		"ValidateDateFormat": true
	};

	$params['messages'][$calendPickerDateName1] = {
		ValidateDateFormat: function () {
			return top.eBankit.Presentation.GetResource("dtDataTransferenciaPermErroMsg");
		}
	};
	$params['messages'][$calendPickerDateName2] = {
		ValidateDateFormat: function () {
			return top.eBankit.Presentation.GetResource("dtDataTransferenciaPermErroMsg");
		}
	};

});

function IsValidNIF(nif) {
	//var c;
	//var checkDigit = 0;
	////Check if is not null, is numeric and if has 9 numbers
	//if (nif != null && IsNumeric(nif) && nif.length == 9) {
	//    //Get the first number of NIF
	//    c = nif.charAt(0);
	//    //Check firt number is (1, 2, 5, 6, 8 or 9)
	//    if (c == '1' || c == '2' || c == '5' || c == '6' || c == '8' || c == '9') {
	//        //Perform CheckDigit calculations
	//        checkDigit = c * 9;
	//        var i = 0;
	//        for (i = 2; i <= 8; i++) {
	//            checkDigit += nif.charAt(i - 1) * (10 - i);
	//        }
	//        checkDigit = 11 - (checkDigit % 11);
	//        //if checkDigit is higher than ten set it to zero
	//        if (checkDigit >= 10)
	//            checkDigit = 0;
	//        //Compare checkDigit with the last number of NIF
	//        //If equal the NIF is Valid.
	//        if (checkDigit == nif.charAt(8))
	//            return true;
	//    }
	//}
	//return false;
	return true;
}
function IsNumeric(ObjVal) {
	return /^\d+$/.test(ObjVal);
}
function selectImage(divImage) {
	unselectAllImages();
	var divImageContainer = $(divImage).find(".image-container-selector");
	divImageContainer.addClass("selected");
	divImageContainer.find(".image-container-selector-fill").html("&#10004;");
	hdnSecurityImage.val($(divImage).find("img").attr('key'));
};
function unselectAllImages() {

	$('.image-container-item').css("border", "0px");
	$('.image-container-item').each(function (i, el) {
		var divImageContainer = $(el).find(".image-container-selector");
		divImageContainer.removeClass("selected");
		divImageContainer.find(".image-container-selector-fill").html("");
	});
};
