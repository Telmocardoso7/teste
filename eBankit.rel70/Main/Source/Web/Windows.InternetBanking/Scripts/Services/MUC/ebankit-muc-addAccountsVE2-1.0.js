eBankit.Presentation.EbankitMuc = {}

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.EbankitMuc.EndRequest);
eBankit.Presentation.EbankitMuc.PreventDuplicateClick = false;
var numberSingleChecked = 0;
$(document).ready(function () {
    $('[id$=hypAddAccOthereEnt]').on('click', function () {

        $('[id$=updatePanelOtherAcc]').show();
        $('[id$=btnNew]').show();

    });


    eBankit.Presentation.EbankitMuc.EndRequest();

});

var prm = Sys.WebForms.PageRequestManager.getInstance();
prm.add_endRequest(function () {
    $('[id$=updatePanelOtherAcc]').show();
    $('[id$=btnNew]').show();
});

eBankit.Presentation.EbankitMuc.EndRequest = function () {
    var hypAddAccOthereEnt = $('[id$=hypAddAccOthereEnt]');

    $(".checkmark.single").off('click').on('click', function () {
        $(this).prev().click();


        var isChecked = $(this).prev().is(':checked');

        if (isChecked) {
            if (eBankit.Presentation.EbankitMuc.IsAllSiblingsChecked_V2(this)) {
                if (!$(this).closest('table').find('thead .checkmark.select-all').prev().is(':checked'))
                    $(this).closest('table').find('thead .checkmark.select-all').trigger('click');
            }
        }
        else {
            if ($(this).closest('table').find('thead .checkmark.select-all').prev().is(':checked')) {
                eBankit.Presentation.EbankitMuc.PreventDuplicateClick = true;
                $(this).closest('table').find('thead .checkmark.select-all').trigger('click');
            }
        }

    });

    $(".checkmark.select-all").off('click').on('click', function () {
        $(this).prev().click();

        if (eBankit.Presentation.EbankitMuc.PreventDuplicateClick) {
            eBankit.Presentation.EbankitMuc.PreventDuplicateClick = false;
            return;
        }

        var trSingles = $(this).closest('thead').next();
        var allChkIsChecked = $(this).prev().is(':checked');

        var checkBoxes = $(trSingles).find('input[type="checkbox"]');

        var numberChecked = 0;

        checkBoxes.each(function (index, item) {

            if (allChkIsChecked) {
                if (!$(item).is(':checked')) {
                    var p = $(item).parent();
                    var itt = p.find('.single');
                    $(itt).trigger('click');
                }
                numberChecked++;
            }
            else {
                if ($(item).is(':checked')) {
                    var p = $(item).parent();
                    var itt = p.find('.single');
                    $(itt).trigger('click');
                }
                if (numberChecked > 0) {
                    numberChecked--;
                }

            }

        });

        var hdnCounterVal = $(this).prev().parents(6).siblings('.account-subtitle-header').find('.groupCounter').siblings('input').val()
        $(this).prev().parents(6).siblings('.account-subtitle-header').find('.groupCounter').html(hdnCounterVal.format(numberChecked));


    });

};

function hideInsert() {
    $('[id$=updatePanelOtherAcc]').show();
    $('[id$=btnNew]').show();
}


function clearSearch(elem) {
    var searchAcc = $(elem).siblings('input');
    $(searchAcc).val("");
    searchAccountOnGroup(searchAcc);
    $(elem).siblings('span').show();
    $(elem).hide();
}
function clearSearchKeyboard(elem) {
    if (evt.keyCode == '13') {
        var searchAcc = $(elem).siblings('input');
        $(searchAcc).val("");
        searchAccountOnGroup(searchAcc);
        $(elem).siblings('span').show();
        $(elem).hide();
        evt.preventDefault();
    } else if (event.keyCode == "32") {
        event.preventDefault();
    }
}

function searchAccountOnGroup(elem) {

    var accounts = $(elem).parent().siblings('.container-accounts').find('.infoAccount');

    if ($(elem).val().length < 3 && $(elem).val().length > 0) {

        $('#searchacc').hide();
        $('#clearacc').show();
    } else if ($(elem).val().length >= 3) {
        $('#searchacc').hide();
        $('#clearacc').show();
        $(accounts).each(function () {
            var accountNumberArray = [];
            var spanId =
                $($(this).children()[1]).children('span').text();
            accountNumberArray.push($($(this).children()[1]).children('span').text());
            var foundNumber = false;
            $.each(accountNumberArray, function (i, val) {
                if (val.indexOf($(elem).val()) >= 0) {
                    foundNumber = true;
                }
            });

            if (foundNumber == true) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    } else {
        $('#searchacc').show();
        $('#clearacc').hide();
        $(accounts).each(function () {
            $(this).show();
        });
    }

}


String.prototype.format = function () {
    // store arguments in an array
    var args = arguments;
    // use replace to iterate over the string
    // select the match and check if related argument is present
    // if yes, replace the match with the argument
    return this.replace(/{([0-9]+)}/g, function (match, index) {
        // check if the argument is present
        return typeof args[index] == 'undefined' ? match : args[index];
    });
};


eBankit.Presentation.EbankitMuc.IsAllSiblingsChecked_V2 = function (elem) {

    var body = $(elem).closest('tbody');
    var chks = $(body).find('input[type="checkbox"]');
    numberSingleChecked = 0;
    var isAllChecked = true;
    chks.each(function (index, item) {
        if (!$(item).is(':checked')) {
            isAllChecked = false;

            return
        }
    });

    return isAllChecked;
}


ValidateAccount = function (elem) {
    var hdnAccountsInContract = $('[id$=hdnAccountsInContract]').val();
    var hdnAccountsNotInContract = $('[id$=hdnAccountsNotInContract]').val();
    var hdnAccountsOtherEntities = $('[id$=hdnAccountsOtherEntities]').val();
    var hdnAccountsOtherRepeated = $('[id$=hdnAccountsOtherRepeated]').val();


    var parsedHdnAccountsInContract = hdnAccountsInContract.split(',');
    var parsedHdnAccountsNotInContract = hdnAccountsNotInContract.split(',');
    var parsedHdnAccountsOtherEntities = hdnAccountsOtherEntities.split(',');
    var parsedHdnAccountsRepeated = hdnAccountsOtherRepeated.split(',');
    var existsAccountInContract = false;
    var existsAccountInNotContract = false;
    var existsAccountOtherEntities = false;
    var existsAccountRepeated = false;

    $.each(parsedHdnAccountsInContract, function (i, val) {
        if (val == $(elem).val()) {
            existsAccountInContract = true;
        }
    });

    $.each(parsedHdnAccountsNotInContract, function (i, val) {
        if (val == $(elem).val()) {
            existsAccountInNotContract = true;
        }
    });

    if (hdnAccountsOtherEntities != "") {
        $.each(parsedHdnAccountsOtherEntities, function (i, val) {
            if (val == $(elem).val()) {
                existsAccountOtherEntities = true;
            }
        });
    }

    $.each($('.otherEntTxtBox'), function (i, val) {
        debugger;
        if ($(val).val().trim() == $(elem).val() && $(val).attr('id') != $(elem).attr('id')) {
            existsAccountRepeated = true;
        }
    });


    if (existsAccountInContract) {
        eBankit.Presentation.InsertValidateMsg_V2($(elem), top.eBankit.Presentation.GetResource("txtAddAccountsOtherEntitiesInContractError"));
    } else if (existsAccountInNotContract) {
        eBankit.Presentation.InsertValidateMsg_V2($(elem), top.eBankit.Presentation.GetResource("txtAddAccountsOtherEntitiesOutContractError"));
    } else if (existsAccountOtherEntities) {
        eBankit.Presentation.InsertValidateMsg_V2($(elem), top.eBankit.Presentation.GetResource("txtAddAccountsOtherEntitiesError"));
    } else if (existsAccountRepeated) {
        eBankit.Presentation.InsertValidateMsg_V2($(elem), top.eBankit.Presentation.GetResource("txtAddAccountsRepeatedError"));
    } else {
        eBankit.Presentation.RemoveValidateMsg($(elem));
    }


}

VerifyErrors = function () {

    var txtWithErrors = $('.otherEntTxtBox');
    var withErrors = false;
    $.each(txtWithErrors, function () {
        if ($(this).hasClass('error')) {
            withErrors = true;
        }
    });

    if (withErrors) {
        event.stopPropagation();
        event.preventDefault();
        return false;
    }

}