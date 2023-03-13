
eBankit.Presentation.TRX01170 = {}


eBankit.Presentation.TRX01170.EndRequest = function () {
    $('img[id*=imgIcon_]').attr('alt', '');
    $('img[id$=imgWarningExportedData]').attr('alt', '');
    $('input[id$=cbAuditData]').attr('aria-label', $('input[id$=cbAuditData]').parent().siblings('span').text());
    $('input[id$=cbAuditData]').on('keydown', function (e) {
        if (e.keyCode === 32) {
            e.preventDefault();
            $(".checkmark.all").click();
        }
    });
    $('input[id*=cbAuditData_]').on('keydown', function (e) {
        if (e.keyCode === 32) {
            e.preventDefault();
            $(this).siblings('.checkmark.single').click();
        }
    });

    $(".checkmark.single").on('click', function () {
        $(this).prev().click();
        var row = $(this).closest(".audit-item-body");
        row.toggleClass("selected");

        eBankit.Presentation.TRX01170.VerifyAllCheck();
    });

    $(".checkmark.all").on('click', function () {
        cc = $(this).prev();
        cc.click();

        v = cc.prop('checked');
        var row = $(".audit-item-body.row");
        if (v) { row.addClass("selected"); } else {
            row.removeClass("selected");
        }
        row.find('input:checkbox').each(function () {
            $(this).prop('checked', v);
        });

        eBankit.Presentation.TRX01170.VerifyAllCheck();
    });
}

eBankit.Presentation.TRX01170.ToggleFileType = function (fileTypeActive, fileTypeInactive) {
    $('#' + fileTypeActive).find('input[type="radio"]').prop('checked', true);
    $('#' + fileTypeInactive).find('input[type="radio"]').prop('checked', false);

}

eBankit.Presentation.TRX01170.ShowDataType = function () {
    $('.flwData1Wrapper').show();
    $('#' + hdnExportDataFileTypeID).val('XML');
    $('.audit-header-container.audit-header-filetype-body, .dataTypeWrapper').removeClass('boxError');
    $('.lblErrorChooseTypeMessage').hide();
    $('.lblErrorChooseContentMessage').hide();
}
eBankit.Presentation.TRX01170.HideDataType = function () {
    $('.flwData1Wrapper').hide();
    $('#' + hdnExportDataFileTypeID).val('PDF');
    $('.audit-header-container.audit-header-filetype-body, .dataTypeWrapper').removeClass('boxError');
    $('.lblErrorChooseTypeMessage').hide();
    $('.lblErrorChooseContentMessage').hide();
}

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX01170.EndRequest);


$(document).ready(function () {
    eBankit.Presentation.TRX01170.EndRequest();
    $(".checkmark.single").click();

    $('.flwData1Wrapper').hide();
});

eBankit.Presentation.TRX01170.VerifyAllCheck = function () {
    var cb = $('.audit-item-body.row').find('input:checkbox:checked');
   
    var cbCount = $('.audit-item-body.row').find('input:checkbox').length;
    cbAll = $(".checkmark.all").prev();

    cbAll.prop('checked', cb.length == cbCount);
};

//eBankit.Presentation.TRX01170158 = {};
eBankit.Presentation.TRX01170.ValidateForm = function (e) {
    if ($('input[type="radio"]').is(":checked")) {

        if ($('input[type="radio"]:checked').val() == 'PDF') {
            $(".checkmark.all").click();
            return true;
        }

        var cb = $('.audit-item-body.row').find('input:checkbox:checked');
        if (cb.length > 0) {
            return true;
        } 
        eBankit.Presentation.TRX01170.DisplayErrorBox(1);
        return false;
    }
    else {
        eBankit.Presentation.TRX01170.DisplayErrorBox(0);
        return false;
    }
    return true;
}

eBankit.Presentation.TRX01170.DisplayErrorBox = function (numRadiosChecked) {
    switch (numRadiosChecked) {
        case 0:
            $('.audit-header-container.audit-header-filetype-body').addClass('boxError');
            $('.lblErrorChooseTypeMessage').show();
            break;
        case 1:
            $('.dataTypeWrapper').addClass('boxError');
            $('.lblErrorChooseContentMessage').show();
            break;
    }
}
