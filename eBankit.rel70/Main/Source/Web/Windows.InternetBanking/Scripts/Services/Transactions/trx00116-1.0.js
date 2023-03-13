eBankit.Presentation.TRX00116 = {};
eBankit.Presentation.TRX00116.ValidateCustom = function () {
    if ($("[id$=hdnHasEntity]").val() === '0') {
        itcore_ui.ShowTopPopupWarning(top.eBankit.Presentation.GetResource("EntityMessage"), top.eBankit.Presentation.GetResource("EntityMessageTitle"), '');
        return false;
    }
    var validAmount =  eBankit.Presentation.TRX00116.ValidateAmount();
        
    if(!validAmount){
        return false;
    }

    return true;
};

eBankit.Presentation.TRX00116.ValidateAmount = function () {
        var ret = true;
        var amount = $('[id$=txtAmount_txField]');
        var amountValue = parseFormattedNumber(amount.val());
        eBankit.Presentation.RemoveValidateMsg(amount);
        if (amountValue === 0) {
            ret = false;
            eBankit.Presentation.InsertValidateMsg_V2(amount, top.eBankit.Presentation.GetResource("mintxtAmountPayment"));
            $('[id$=lblNetInterestReceivable_lblRightIn]').text('');
        }
        else if(amountValue === null ){
             ret = false;   
        }
        return ret;
    };