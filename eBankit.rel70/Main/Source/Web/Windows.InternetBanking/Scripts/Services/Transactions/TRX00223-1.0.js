
eBankit.Presentation.TRX00223 = {}
			

eBankit.Presentation.TRX00223.EndRequest = function () {
    //..  
}

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX00223.EndRequest);


$(document).ready(function () {
    eBankit.Presentation.TRX00223.EndRequest();
});

//When change card Status (freeze or unfreeze)  changes de content above hide/display
ChangeStatusFreeze = function (elem) {
    if (elem.checked === true)
        $('[id$=FlowInnerContainer1]').css('display', 'none');
    else
        $('[id$=FlowInnerContainer1]').css('display', 'block');

};