function enableLabelAllAccounts(ddlAccountId, lblMessageAllAccountsId) {
    var allAcountsAreSelected = true;

    $('#' + ddlAccountId + ' option').each(function () {
        if (!$(this).is(':selected')) {
            allAcountsAreSelected = false;
            $('#' + lblMessageAllAccountsId).addClass('hidden');
            return false;
        }
    });

    if (allAcountsAreSelected) {
        $('#' + lblMessageAllAccountsId).removeClass('hidden');
    }
}