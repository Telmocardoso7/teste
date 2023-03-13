eBankit.Presentation.RegisterUsername = {};

eBankit.Presentation.RegisterUsername.ValidateUsername = function (elem) {
	var ret = true;
	
	if (TextBoxUsername != undefined) {
		if (TextBoxUsername.val() == '' && (elem == undefined || elem.id == TextBoxUsername[0].id)) {

			eBankit.Presentation.InsertValidateMsg(TextBoxUsername, top.eBankit.Presentation.GetResource("RequiredUserName"));
			ret = false;
		}
		else if (TextBoxUsername.val() != '') {
			eBankit.Presentation.RemoveValidateMsg(TextBoxUsername);
			TextBoxUsername.popover('hide');
		}
	}

	return ret;
};

$(document).ready(function () {

	//
});