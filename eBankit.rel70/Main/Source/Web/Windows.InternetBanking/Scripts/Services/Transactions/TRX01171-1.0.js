eBankit.Presentation.TRX01171 = {};
eBankit.Presentation.TRX01171.ValidateForm = function () {
    debugger;
    if ($('.hdnReasonSelected').val() == '') {
        $('.row-reason-wrapper').addClass('reason-error');
        $('.errorHidden').show();
        return false;
    }
    return true;
}

$(document).ready(function () {
    $('.row-reason-wrapper').parent().attr('style', 'width:100%')
    $('input[type="radio"]').on('click', function () {
       SetReasonSelected();
    });

});

SetReasonSelected = function () {
    $('.hdnReasonSelected').val($('input[type="radio"]:checked').val())
    $('.row-reason-wrapper').removeClass('reason-error');
    $('.errorHidden').hide();

}


