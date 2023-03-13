

//$('.muc-details-collapse').hide();


$(document).ready(function () {
    var hdnMUCEditOwnerCanEditOwnPermissionGroup = $('[id$=hdnMUCEditOwnerCanEditOwnPermissionGroup]');
    var hdnNumberOfOwners = $('[id$=hdnNumberOfOwners]');
    var lnkEditPermissionGroups = $('[id$=lnkEditPermissionGroups]');
    if (hdnMUCEditOwnerCanEditOwnPermissionGroup.val().toLowerCase() == 'false' && parseInt(hdnNumberOfOwners.val())>1) {
        lnkEditPermissionGroups.addClass("MUCEditOwnerCanEditOwnPermissionGroup");
        lnkEditPermissionGroups.attr("tabindex","-1");
    } else {
        lnkEditPermissionGroups.removeClass("MUCEditOwnerCanEditOwnPermissionGroup");
    }
    $('.panel-heading').on('click', function () {
        if (!$(this).hasClass('collapsed')) {
            //closed
            var actionButton = $(this).find('.step-muc-actions .muc-exp-col');
            actionButton.removeClass('muc-details-collapse');
            actionButton.addClass('muc-details-expand');
            actionButton.attr('data-original-title', textForExpand);
            actionButton.attr('aria-label', textForExpand);
            actionButton.mouseleave();
        }
        else {
            //open
            $('.muc-exp-col').removeClass('muc-details-collapse');
            $('.muc-exp-col').addClass('muc-details-expand');
            $('.muc-exp-col').attr('data-original-title', textForExpand);

            var actionButton = $(this).find('.step-muc-actions .muc-exp-col');
            actionButton.removeClass('muc-details-expand');
            actionButton.addClass('muc-details-collapse');
            actionButton.attr('data-original-title', textForCollapse);
            actionButton.attr('aria-label', textForCollapse);
            actionButton.mouseleave();
        }

    });

    //$('.muc-details-collapse').on('click', function () {
    //    $('.muc-details-expand').hide();

    //});


    $('.muc-edit').on('keyup', function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            e.stopImmediatePropagation();
            $(this).trigger('click');
            return false;
        }
        return true;
    });

    $('[data-toggle="tooltip"]').tooltip({ trigger: 'hover' });


    $('.edit-accounts-button').on('click', function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        if (isVirtualEntity)
            window.location = "AccountGroupEdit.aspx";
        else
            window.location = "AccountEdit.aspx";

    });

    $('.edit-trustees-button').on('click', function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        window.location = "TrusteeEdit.aspx";
    });


    $('.edit-permissiongroups-button').on('click', function (e) {
        if (hdnMUCEditOwnerCanEditOwnPermissionGroup.val().toLowerCase() == 'false' && parseInt(hdnNumberOfOwners.val())> 1) {
            e.preventDefault();
            e.stopImmediatePropagation();
            return;
        } else {
            e.preventDefault();
            e.stopImmediatePropagation();
            window.location = "PermissionGroupEdit.aspx";
        }
    });

    $('.edit-signature-button').on('click', function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        window.location = "SignatureEdit.aspx";
    });

    $("img[id*='imgContractProfile'], img[id*='imgPackage'], img.imgAccount").each(function () {
        if ($(this).attr("alt") === undefined)
            $(this).attr("alt", "");
    });

});
var allTooltipElem = document.getElementsByClassName('isAlias');
for (var i = 0; i < allTooltipElem.length; i = i + 1) {

    $(allTooltipElem[i]).bind('mouseenter', function () {
        var $this = $(this);

        if ((this.parentElement.offsetWidth - 20) < this.offsetWidth) {
            $this.attr('data-original-title', $this.text());
        }
    });
}

eBankit.Presentation.ContractDetails = {}
eBankit.Presentation.ContractDetails.KeydownHandler = function (elem, event) {
    if (event.keyCode === 32) {
        event.preventDefault();
    }
    else if (event.keyCode === 13) {
        event.preventDefault();
        $(elem).click();
    }
}

eBankit.Presentation.ContractDetails.KeyupHandler = function (elem, event) {
    if (event.keyCode === 32) {
        event.preventDefault();
        $(elem).click();
    }
}
function addEditClassDivPermissionGroup(edit) {
    if (edit) {
        $("#divPermissionGroup").removeClass("panel-heading");
        $("#divPermissionGroup").addClass("panel-heading-edit");
    }
    else {
        $("#divPermissionGroup").removeClass("panel-heading-edit");
        $("#divPermissionGroup").addClass("panel-heading");
    }
}

function addEditClassDivContractSignatures(edit) {
    if (edit) {
        $("#divContractSignatures").removeClass("panel-heading");
        $("#divContractSignatures").addClass("panel-heading-edit");
    }
    else {
        $("#divContractSignatures").removeClass("panel-heading-edit");
        $("#divContractSignatures").addClass("panel-heading");
    }

}

function addEditClassDivContractAccounts(edit) {
    if (edit) {
        $("#divContractAccounts").removeClass("panel-heading");
        $("#divContractAccounts").addClass("panel-heading-edit");
    }
    else {
        $("#divContractAccounts").removeClass("panel-heading-edit");
        $("#divContractAccounts").addClass("panel-heading");
    }

}

function addEditClassDivContractTrustrees(edit) {
    if (edit) {
        $("#divContractTrustrees").removeClass("panel-heading");
        $("#divContractTrustrees").addClass("panel-heading-edit");
    }
    else {
        $("#divContractTrustrees").removeClass("panel-heading-edit");
        $("#divContractTrustrees").addClass("panel-heading");
    }
}

function addEditClass(editPGroup, editAccout, editSignature, editTrustees) {
    // Permission Group
    if (editPGroup) {
        //$("#divPermissionGroup").removeClass("panel-heading");
        $("#divPermissionGroup").addClass("panel-heading-edit");
        $("#divPermissionGroup").children().addClass("edit-title");
        $("#divPermissionGroup").children().children().addClass("edit-title");
    }
    else {
        $("#divPermissionGroup").removeClass("panel-heading-edit");
        //$("#divPermissionGroup").addClass("panel-heading");
    }

    // Account
    if (editAccout) {
        //$("#divContractAccounts").removeClass("panel-heading");
        $("#divContractAccounts").addClass("panel-heading-edit");
        $("#divContractAccounts").children().addClass("edit-title");
        $("#divContractAccounts").children().children().addClass("edit-title");
    }
    else {
        $("#divContractAccounts").removeClass("panel-heading-edit");
        //$("#divContractAccounts").addClass("panel-heading");
    }

    // Signature
    if (editSignature) {
        // $("#divContractSignatures").removeClass("panel-heading");
        $("#divContractSignatures").addClass("panel-heading-edit");
        $("#divContractSignatures").children().addClass("edit-title");
        $("#divContractSignatures").children().children().addClass("edit-title");
    }
    else {
        $("#divContractSignatures").removeClass("panel-heading-edit");
        //$("#divContractSignatures").addClass("panel-heading");
    }

    // Trustees
    if (editTrustees) {
        //$("#divContractTrustrees").removeClass("panel-heading");
        $("#divContractTrustrees").addClass("panel-heading-edit");
        $("#divContractTrustrees").children().addClass("edit-title");
        $("#divContractTrustrees").children().children().addClass("edit-title");
    }
    else {
        $("#divContractTrustrees").removeClass("panel-heading-edit");
        //$("#divContractTrustrees").addClass("panel-heading");
    }
}

eBankit.Presentation.ContractDetails = {}
eBankit.Presentation.ContractDetails.KeydownHandler = function (elem, event) {
    if (event.keyCode === 32) {
        event.preventDefault();
    }
    else if (event.keyCode === 13) {
        event.preventDefault();
        $(elem).click();
    }
}

eBankit.Presentation.ContractDetails.KeyupHandler = function (elem, event) {
    if (event.keyCode === 32) {
        event.preventDefault();
        $(elem).click();
    }
}