

$(document).ready(function () {
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
            $(this).find('.muc-exp-col').removeClass('muc-details-collapse');
            $(this).find('.muc-exp-col').addClass('muc-details-expand');
            $(this).find('.muc-exp-col').attr('data-original-title', textForExpand);

            var actionButton = $(this).find('.step-muc-actions .muc-exp-col');
            actionButton.removeClass('muc-details-expand');
            actionButton.addClass('muc-details-collapse');
            actionButton.attr('data-original-title', textForCollapse);
            actionButton.attr('aria-label', textForCollapse);
            actionButton.mouseleave();
        }

    });

    $('[data-toggle="tooltip"]').tooltip({ trigger: 'hover' });

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

$("input[type=checkbox]").focus(function () {
    var checkmark = this.parentElement.getElementsByClassName("checkmark")[0];
    checkmark.setAttribute("style", "border: solid 2px black;")
});

$("input[type=checkbox]").focusout(function () {
    var checkmark = this.parentElement.getElementsByClassName("checkmark")[0];
    checkmark.removeAttribute("style")
});

eBankit.Presentation.EbankitMuc = {}


$(document).ready(function () {
    eBankit.Presentation.EbankitMuc.EndRequest();

});


eBankit.Presentation.EbankitMuc.IsAllSiblingsChecked = function (elem) {

    var body = $(elem).closest('tbody');
    var chks = $(body).find('input[type="checkbox"]');

    var isAllChecked = true;
    chks.each(function (index, item) {
        if (!$(item).is(':checked')) {
            isAllChecked = false;
            return
        }
    });

    return isAllChecked;
}

eBankit.Presentation.EbankitMuc.PreventDuplicateClick = false;

eBankit.Presentation.EbankitMuc.EndRequest = function () {

    $(".checkmark.single").off('click').on('click', function () {
        if ($(this).hasClass("MUCAddAcoountsDisabled")) {
            event.preventDefault();
        } else {
            $(this).prev().click();


            var isChecked = $(this).prev().is(':checked');

            if (isChecked) {
                if (eBankit.Presentation.EbankitMuc.IsAllSiblingsChecked(this)) {
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

        checkBoxes.each(function (index, item) {
            if (allChkIsChecked) {
                if (!$(item).is(':checked')) {
                    var p = $(item).parent();
                    var itt = p.find('.single');
                    $(itt).trigger('click');
                }
            }
            else {
                if ($(item).is(':checked')) {
                    var p = $(item).parent();
                    var itt = p.find('.single');
                    $(itt).trigger('click');
                }
            }

        });

    });

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


