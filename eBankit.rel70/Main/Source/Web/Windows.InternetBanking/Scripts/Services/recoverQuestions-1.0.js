eBankit.Presentation.RecoverQuestions = {};

eBankit.Presentation.RecoverQuestions.ValidateQuestions = function (elem) {
    var ret = true; //

    $('.trx-field').each(function () {

        if ($(this).is(":visible") && $(this).val() == '') {
            eBankit.Presentation.InsertValidateMsg($(this), top.eBankit.Presentation.GetResource("InvalidAnswer"));
            ret = false;
        }
        else {
            eBankit.Presentation.RemoveValidateMsg($(this));
        }
    });

    return ret;
};