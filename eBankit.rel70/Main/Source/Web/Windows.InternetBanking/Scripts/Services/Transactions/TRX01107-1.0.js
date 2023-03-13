
eBankit.Presentation.TRX01107 = {}
			

eBankit.Presentation.TRX01107.EndRequest = function () {
    var txtnewCodeAlias = $('[id$=txtnewCodeAlias_txField]');
    //PREVENT WHITE SPACES ON NEW ALTERNATIVE USERNAME INPUT
    txtnewCodeAlias.on("keydown", eBankit.Presentation.TRX01107.PwdCheckSpacesEvent);

    if (txtnewCodeAlias.length > 0) {
        txtnewCodeAlias[0].addEventListener("blur", eBankit.Presentation.TRX01107.UserNameEvent, false);
        txtnewCodeAlias[0].addEventListener("change", eBankit.Presentation.TRX01107.UserNameClearSpacesEvent, false);
    }
}


//METHOD TO BLOCK WHITE SPACES IN ALL PASSWORD INPUTS
eBankit.Presentation.TRX01107.PwdCheckSpacesEvent = function (evt) {
    if (evt.keyCode == 32) {
        evt.preventDefault();
    }
};

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX01107.EndRequest);


$(document).ready(function () {

    //GET NEW ALIAS VALUE TEXT BOX CLIENT ID
    var txtnewCodeAlias = $('[id$=txtnewCodeAlias_txField]');
    var $txtnewCodeAliasName = txtnewCodeAlias.attr("name");
    var pattern = new RegExp(patternValueSettings.val());   
    var lblcurrentCodeAlias = $('[id$=flwcurrentAlternativeCodeAlias_lbLeft]').next().text();

    //SET ONKEYUP TO TRUE FOR USERNAME INPUTS VALIDATION
    jQuery.validator.setDefaults({
        onkeyup: function (element) { $(element).valid() },
        onfocusout: function (element) { $(element).valid(); }
    });
   
    var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };

    $params['rules'][$txtnewCodeAliasName] = { "required": true, 'regex': pattern, 'sameCode': lblcurrentCodeAlias};

    //ADD ERROR MESSAGES TO VALIDATOR
    //-------------------------------MESSAGES FOR NEW ALIAS
    $params['messages'][$txtnewCodeAliasName] = {        
        required: function () {
            eBankit.Presentation.RemoveCustomValidateMsg(txtnewCodeAlias);
            eBankit.Presentation.RemoveValidateMsg(txtnewCodeAlias);   
            var available = $('[id$=spnUserNameActive]');
            available.addClass("hidden");
            return top.eBankit.Presentation.GetResource("ValidationRequiredInputChangeUsernameMessage");
        },
        regex: function () {
            eBankit.Presentation.RemoveCustomValidateMsg(txtnewCodeAlias);
            eBankit.Presentation.RemoveValidateMsg(txtnewCodeAlias);          
            return top.eBankit.Presentation.GetResource("ValidationInvalidInputChangeUsernameMessage");
        },     
        sameCode: function () {
            eBankit.Presentation.RemoveCustomValidateMsg(txtnewCodeAlias);
            eBankit.Presentation.RemoveValidateMsg(txtnewCodeAlias);
            return top.eBankit.Presentation.GetResource("SameCode");
        }
    };

    //VALIDATE IF NEW ALIAS ARE MATCH REGEX BY SERVER SIDE
    jQuery.validator.addMethod("regex", function (value, element, regexp) {        
        eBankit.Presentation.RemoveCustomValidateMsg(txtnewCodeAlias);
        eBankit.Presentation.RemoveValidateMsg(txtnewCodeAlias);
        var available = $('[id$=spnUserNameActive]');
        available.addClass("hidden");
        return this.optional(element) || regexp.test(value);
    }, top.eBankit.Presentation.GetResource("ValidationInvalidInputChangeUsernameMessage"));

    //VALIDATE CURRENT ALTERNATIVE ALIAS AND NEW 
    jQuery.validator.addMethod("sameCode", function (value, element, currentAlternative) {
        if (currentAlternative == value) { 
            eBankit.Presentation.RemoveCustomValidateMsg(txtnewCodeAlias);
            eBankit.Presentation.RemoveValidateMsg(txtnewCodeAlias);
            return false;
        } else {
            return true;
        }       
    }, top.eBankit.Presentation.GetResource("SameCode"));
    

    var validator = $("#aspnetForm").validate($params);


    eBankit.Presentation.TRX01107.EndRequest();

    if (txtnewCodeAlias.length > 0) {
        txtnewCodeAlias[0].addEventListener("blur", eBankit.Presentation.TRX01107.UserNameEvent, false);       
        txtnewCodeAlias[0].addEventListener("change", eBankit.Presentation.TRX01107.UserNameClearSpacesEvent, false);
    }
});


eBankit.Presentation.TRX01107.UserNameClearSpacesEvent = function () {
    $(this).val(function (i, v) { return v.replace(/ /g, ""); });
};

eBankit.Presentation.TRX01107.UserNameEvent = function () {
   
    var username = $(this).val().replace(" ", "");
    if (username.length > 0) {
        var pattern = new RegExp(patternValueSettings.val());
        var valid = pattern.test(username);
        if (!valid ) {            
            var available = $('[id$=spnUserNameActive]');
            available.addClass("hidden");
            return false;
        }
        else {             
            if ($("#aspnetForm").valid()) {
                var btn = $("[id$=btnVerifyUserName]");
                __doPostBack(btn.attr("name"), username);
            } else {
                return false;
            }
        }
    }

};

eBankit.Presentation.TRX01107.ValidateCustom = function () {    

    var txtnewCodeAlias = $('[id$=txtnewCodeAlias_txField]').val(); 
    
    var lblcurrentCodeAlias = $('[id$=flwcurrentAlternativeCodeAlias_lbLeft]').next().text();
    var isBlackListed = $('[id$=isInBlackList]').val();    

    if (txtnewCodeAlias.length > 0 && isBlackListed === 'false' && lblcurrentCodeAlias != txtnewCodeAlias) {
        var elem = $('[id$=txtnewCodeAlias_txField]');
        eBankit.Presentation.InsertCustomValidateMsg(elem, top.eBankit.Presentation.GetResource("ValidationInvalidInputChangeUsernameMessage"));
        var available = $('[id$=spnUserNameActive]');
        available.addClass("hidden");
       return false;
    }
 
    return $("#aspnetForm").valid();
};
