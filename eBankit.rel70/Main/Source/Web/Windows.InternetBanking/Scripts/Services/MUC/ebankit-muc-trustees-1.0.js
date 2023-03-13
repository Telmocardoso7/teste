
eBankit.Presentation.EbankitMuc = {}

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.EbankitMuc.EndRequest);

$(document).ready(function () {

    eBankit.Presentation.EbankitMuc.EndRequest();

});


eBankit.Presentation.EbankitMuc.IsAllSiblingsChecked = function (elem) {

    var colnum = $(elem).attr('colchk');

    var body = $(elem).closest('tbody');
    var chks = $(body).find('.cbcontainer[colchk="' + colnum + '"] input[type="checkbox"]');

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

$("input[type=checkbox]").focus(function () {
    var checkmark = this.parentElement.getElementsByClassName("checkmark")[0];
    checkmark.setAttribute("style", "border: solid 2px black;")
});

$("input[type=checkbox]").focusout(function () {
    var checkmark = this.parentElement.getElementsByClassName("checkmark")[0];
    checkmark.removeAttribute("style")
});

eBankit.Presentation.EbankitMuc.EndRequest = function () {

    $(".checkmark.single.checkOwner").on('click', function () {
        var hdnMUCAllowEditContractOwnership = $('[id$=hdnMUCAllowEditContractOwnership]');

        if ($(this).attr('data-flag-owner') == 'true') return;

        if (hdnMUCAllowEditContractOwnership.val().toLowerCase() == 'false') {
            return;
        }

        var colnum = $(this).attr('colchk');
        $(this).prev().click();


        var isChecked = $(this).prev().is(':checked');

        if (isChecked) {
            if (eBankit.Presentation.EbankitMuc.IsAllSiblingsChecked(this)) {
                if (!$(this).closest('table').find('.rowWrapper[colchk="' + colnum + '"] input[type="checkbox"]').is(':checked'))
                    //$(this).closest('table').find('thead .checkmark.select-all[colchk="' + colnum + '"]').trigger('click');
                    $(this).closest('table').find('.rowWrapper[colchk="' + colnum + '"] input[type="checkbox"]').trigger('click');
            }
        }
        else {
            if ($(this).closest('table').find('.rowWrapper[colchk="' + colnum + '"] input[type="checkbox"]').is(':checked')) {
                eBankit.Presentation.EbankitMuc.PreventDuplicateClick = true;
                $(this).closest('table').find('.rowWrapper[colchk="' + colnum + '"] input[type="checkbox"]').trigger('click');
            }
        }

    });
    $(".checkmark.single.checkInclude").on('click', function () {

        if ($(this).attr('data-flag-owner') == 'true') return;
        var colnum = $(this).attr('colchk');
        $(this).prev().click();


        var isChecked = $(this).prev().is(':checked');

        if (isChecked) {
            if (eBankit.Presentation.EbankitMuc.IsAllSiblingsChecked(this)) {
                if (!$(this).closest('table').find('.rowWrapper[colchk="' + colnum + '"] input[type="checkbox"]').is(':checked'))
                    //$(this).closest('table').find('thead .checkmark.select-all[colchk="' + colnum + '"]').trigger('click');
                    $(this).closest('table').find('.rowWrapper[colchk="' + colnum + '"] input[type="checkbox"]').trigger('click');
            }
        }
        else {
            if ($(this).closest('table').find('.rowWrapper[colchk="' + colnum + '"] input[type="checkbox"]').is(':checked')) {
                eBankit.Presentation.EbankitMuc.PreventDuplicateClick = true;
                $(this).closest('table').find('.rowWrapper[colchk="' + colnum + '"] input[type="checkbox"]').trigger('click');
            }
        }

    });


    $(".checkmark.select-all.checkAllOwner").on('click', function () {
        var hdnMUCAllowEditContractOwnership = $('[id$=hdnMUCAllowEditContractOwnership]');
        if (hdnMUCAllowEditContractOwnership.val().toLowerCase() == 'false') {
            return;
        } else {
            var colnum = $(this).attr('colchk');

            $(this).prev().click();

            if (eBankit.Presentation.EbankitMuc.PreventDuplicateClick) {
                eBankit.Presentation.EbankitMuc.PreventDuplicateClick = false;
                return;
            }

            var trSingles = $(this).closest('thead').next();
            var allChkIsChecked = $(this).prev().is(':checked');

            var checkBoxes = $(trSingles).find('.cbcontainer[colchk="' + colnum + '"] input[type="checkbox"]');


            checkBoxes.each(function (index, item) {

                if ($(item).attr('data-flag-owner') == 'true') return;

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
        }
    });

    $(".checkmark.select-all.checkAllInclude").on('click', function () {

        var colnum = $(this).attr('colchk');

        $(this).prev().click();

        if (eBankit.Presentation.EbankitMuc.PreventDuplicateClick) {
            eBankit.Presentation.EbankitMuc.PreventDuplicateClick = false;
            return;
        }

        var trSingles = $(this).closest('thead').next();
        var allChkIsChecked = $(this).prev().is(':checked');

        var checkBoxes = $(trSingles).find('.cbcontainer[colchk="' + colnum + '"] input[type="checkbox"]');


        checkBoxes.each(function (index, item) {

            if ($(item).attr('data-flag-owner') == 'true') return;

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
