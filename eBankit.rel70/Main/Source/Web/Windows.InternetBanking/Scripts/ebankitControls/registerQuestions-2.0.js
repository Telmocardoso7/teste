eBankit.Presentation.RegisterQuestions = {};

eBankit.Presentation.RegisterQuestions.ValidateQuestions = function (elem) {
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

$(document).ready(function () {

	//
});