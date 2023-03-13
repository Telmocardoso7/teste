eBankit.Presentation.ResultControl = {};

eBankit.Presentation.ResultControl.ToogleExecuteType = function(divId,status){
	var div = $("#" + divId);
	if(status==1){
		div.show();
	}
	else {
		div.hide();
	}
}