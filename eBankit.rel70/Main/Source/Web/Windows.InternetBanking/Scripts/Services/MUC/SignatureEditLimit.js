$(document).ready(function () {
    configMultiselect();

    $('#divMultiSelectAccount button.ddlAccountTest').attr("tabindex", "0");
    $('#divMultiSelectTransactions button.ddlAccountTest').attr("tabindex", "0");
    enableLabelAllAccounts('MainContent_TransactionMainContent_flwUserData_ddlAccount', 'lblMessageAllAccounts');
    enableLabelAllAccounts('MainContent_TransactionMainContent_flwUserData_ddlAccount', 'lblMessageAllAccountsPerTransaction');

    //Sequences of whitespace will collapse into a single whitespace. Text will wrap when necessary.
    $('li > a > span.checkbox-label').css("white-space", "normal");

    $('[id$=txtAmountPerTransaction_txField]').attr("OnKeyPress", "return onlynumber();");
    $('[id$=txtAmountPerTransaction_txField]').attr("maxlength", "9");
    $("#MainContent_TransactionMainContent_flwUserData_ddlAccount").on('change', function () {
        enableLabelAllAccounts('MainContent_TransactionMainContent_flwUserData_ddlAccount', 'lblMessageAllAccounts');
        enableLabelAllAccounts('MainContent_TransactionMainContent_flwUserData_ddlAccount', 'lblMessageAllAccountsPerTransaction');
    });
});

var groups = {};
function configMultiselect() {
    $("select option[data-category]").each(function () {
        groups[$.trim($(this).attr("data-category"))] = true;
    });
    $.each(groups, function (c) {
        $("select option[data-category='" + c + "']").wrapAll('<optgroup label="' + c + '">');
    });
    $('.ddlAccountTest').multiselect();
    $('select.ddlAccountTest').attr("tabindex", "-1");
}

eBankit.Presentation.GroupEditRule = {};
eBankit.Presentation.GroupEditRule.ValidateAmount = function () {
    var ret = true;
    var amount = $('[id$=txtAmount_txField]');
    var amountValue = parseFormattedNumber(amount.val());
    eBankit.Presentation.RemoveValidateMsg(amount);
    if (amountValue == 0) {
        ret = false;
        eBankit.Presentation.InsertValidateMsg_V2(amount, top.eBankit.Presentation.GetResource("mintxtAmountPayment"));
        $('[id$=lblNetInterestReceivable_lblRightIn]').text('');
    }
    else if (amountValue == null) {
        ret = false;
    }
    return ret;
};

function onlynumber(evt) {
    var theEvent = evt || window.event;
    var key = theEvent.keyCode || theEvent.which;
    key = String.fromCharCode(key);
    var regex = /^[0-9]+$/;
    if (!regex.test(key)) {
        theEvent.returnValue = false;
        if (theEvent.preventDefault) theEvent.preventDefault();
    }
}