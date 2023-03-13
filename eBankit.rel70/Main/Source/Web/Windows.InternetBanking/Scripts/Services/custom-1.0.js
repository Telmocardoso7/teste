
eBankit.Presentation.Custom = {};
eBankit.Presentation.Custom.CustomClk = function (btnRedirectId) {
    //
}

eBankit.Presentation.Custom.SelectedImage = null;

eBankit.Presentation.Custom.ValidateValidFile = function () {
    var ret = false;
    if (ucAttachUploader.val() != '') {
        ret = true;
    }

    return ret; 
}

eBankit.Presentation.Custom.GetOperations = function () {
    var items = new Array();
    var itemsBenefs = new Array();
    var itemsAccounts = new Array();
    var itemsUnAccounts = new Array();
    var itemsUnBenefs = new Array();
    var itemsUn = new Array();
    var itemsFavShared = new Array();

    $('.operationitem input').each(function () {
        if ($(this).is(':checked')) {
            items.push($(this).attr('value'));
        }
        else {
            itemsUn.push($(this).attr('value'));
        }
        if (hdnSelectedItems) {
            hdnSelectedItems.val(items.join(";"));
        }
        if (hdnUnSelectedItems) {
            hdnUnSelectedItems.val(itemsUn.join(";"));
        }
    });

    $('.operationitemShare input').each(function () {
        if ($(this).is(':checked')) {
            itemsFavShared.push($(this).attr('value'));
        }        
        if (hdnSharedFav) {
            hdnSharedFav.val(itemsFavShared.join(";"));
        }        
    });


    $('.operationitembenef input').each(function () {
        if ($(this).is(':checked')) {
            itemsBenefs.push($(this).attr('value'));
        }
        else {
            itemsUnBenefs.push($(this).attr('value'));
        }
        if (hdnSelectedBenefs) {
            hdnSelectedBenefs.val(itemsBenefs.join(";"));
        }
        if (hdnUnSelectedBenefs) {
            hdnUnSelectedBenefs.val(itemsUnBenefs.join(";"));
        }
    });

    $('.operationitemaccount input').each(function () {
        if ($(this).is(':checked')) {
            itemsAccounts.push($(this).attr('value'));
        }
        else {
            itemsUnAccounts.push($(this).attr('value'));
        }
        if (hdnSelectedAccounts) {
            hdnSelectedAccounts.val(itemsAccounts.join(";"));
        }
        if (hdnUnSelectedAccounts) {
            hdnUnSelectedAccounts.val(itemsUnAccounts.join(";"));
        }
    });

    var itemsModules = new Array();

    $('.list-sortable input[type=checkbox]').each(function () {
        if ($(this).is(':checked')) {
            itemsModules.push($(this).attr('value') + ",1");
        }
        else {
            itemsModules.push($(this).attr('value') + ",0");
        }
        if (hdnSelectedModules) {
            hdnSelectedModules.val(itemsModules.join(";"));
        }
    });
}

eBankit.Presentation.Custom.Preview = function (img, selection) {
    if (!selection.width || !selection.height)
        return;

    var scaleX = 60 / selection.width;
    var scaleY = 70 / selection.height;

    $('#preview img').css({
        width: Math.round(scaleX * 350),
        height: Math.round(scaleY * 300),
        marginLeft: -Math.round(scaleX * selection.x1),
        marginTop: -Math.round(scaleY * selection.y1)
    });

    x1.val(selection.x1);
    y1.val(selection.y1);
    x2.val(selection.x2);
    y2.val(selection.y2);
    imagew.val(selection.width);
    imageh.val(selection.height);
}

eBankit.Presentation.Custom.BeginRequest = function (sender, args) {

}

eBankit.Presentation.Custom.EndRequest = function (sender, args) {
    eBankit.Presentation.Custom.PreviewInit();
}

eBankit.Presentation.Custom.PreviewInit = function () {
    //
    $('.nav-tabs a').click(function () {
        if (hdnSelectedTab)
            hdnSelectedTab.val($(this).tab().attr("href").substr(1));
    });

    try {
        if (hdnSelectedTab) {
            if (hdnSelectedTab.val() != "") {
                $('.nav-tabs a[href="#' + hdnSelectedTab.val() + '"]').tab('show');
            }
        }
    }
    catch (err) {
        //
    }

    $.fn.editable.defaults.mode = 'popup';

    $('button[id^="btnEditAccountName_"]').click(function (e) {
        e.stopPropagation();
    });
}


$.fn.editableform.buttons = '<button class="btn btn-primary btn-popover">' + top.eBankit.Presentation.GetResource("Save") + '</button>';

$.fn.editableform.loading = '<div class="editableform-loading"><img src="' + loading_image + '" /></div>';

function callback(code, message, newValue) {
    switch (code) {
        case 0: //error
            break;
        case 1: //success  
            var accountToChange = hdnAccountToChange.val();
            var JSONText = JSON.stringify(eval(hdnAccounts.val()));
            var jsonObj = JSON.parse(JSONText);
            for (var i = 0; i < jsonObj.length; i++) {
                if (jsonObj[i].SecurityCenterAccountNumber == accountToChange.trim()) {
                    //
                    jsonObj[i].AccountName = newValue.name;
                    hdnAccounts.val(JSON.stringify(jsonObj));
                    break;
                }
            }
            break;
        case 2: //warning
            break;
        case 3: //info
            break;
    }
};

var IDs = new Array;

function GetAccountNumber(elem) {
    var hdnValue = $("#" + elem.id).parent().children(":first");
    hdnAccountToChange.val(hdnValue.val());
}

function showHideTable(event) {
    var id = $(this).data('id');
    var table = $('.tableWrapper[data-id=' + id + ']');

    $(".tableWrapper").slideUp('fast'); //Hidding tables
    $('.accountExpandicon').find("i").removeClass().addClass("glyphicon glyphicon-plus");

    if (table.length > 0 && !table.is(':visible')) {
        table.slideDown('fast');
        $('button[data-id=' + id + ']').find("i").toggleClass("glyphicon-plus glyphicon-minus");
        if (!include(IDs, id)) {
            IDs.push(id);
            return true;
        }
    }

    event.preventDefault();
    IDs.push(id);

    return false;
}

function include(arr, obj) {
    return (arr.indexOf(obj) != -1);
}

GoToBeneficiaryDetail = function (id) {
    hdnBeneficiaryId.val(id);
    __doPostBack(btnGotoEditId, '');
}

GoToFavoritDetail = function (id) {
    hdnFavoritId.val(id);
    __doPostBack(btnGotoFavoritEdit, '');
}

DeleteBeneficiary = function (id) {
    hdnBeneficiaryId.val(id);
    __doPostBack(btnDeleteId, '');
}

DeleteFavorit = function (id) {
    hdnFavoritId.val(id);
    __doPostBack(btnFavoritDeleteId, '');
}

InactiveCompanyUser = function (id, status) {
    hdnInactiveUserId.val(id);
    hdnInactiveUserStatus.val(status);
    __doPostBack(btnInactiveUser, '');
}

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.Custom.EndRequest);

$(document).ready(function () {

    $.fn.editable.defaults.mode = 'popup';

    $('button[id^="btnEditAccountName_"]').click(function (e) {
        e.stopPropagation();
    });

    $('.nav-tabs a').click(function () {
        if (hdnSelectedTab)
            hdnSelectedTab.val($(this).tab().attr("href").substr(1));
    });

    var tab = eBankit.Presentation.QueryString("tab");
    if (tab != null) {
        if (hdnSelectedTab) {
            if (hdnSelectedTab.val() != "") {
                $('.nav-tabs a[href="#' + hdnSelectedTab.val() + '"]').tab('show');
            }
            else {
                $('.nav-tabs a[href="#' + tab + '"]').tab('show');
            }
        } 
    }
});
