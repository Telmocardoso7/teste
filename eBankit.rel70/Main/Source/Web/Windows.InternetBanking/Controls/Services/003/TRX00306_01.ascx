<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00306_01.ascx.cs" Inherits="TRX00306_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divTransaction" class="transaction-content" runat="server">
    <it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX00306,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div style="padding-top: 25px;">
            <asp:UpdatePanel ID="updPanel" UpdateMode="Always" runat="server">
                <ContentTemplate>
                <it:AutoCompleteDropDownList_v2 ID="ddlOwnAccounts" Label="<%$FrontEndResources:TRX00306,txtOwnAccountDestNumber %>"
                    IsRequired="true" runat="server" />
                <div class="clearBoth"></div>
                <it:CurrencyTextBoxControlAuto ID="txtValueToIncrement" IsRequired="true" ValidateWithAccountBalance="true"
                    ShowCurrency="true" AllowValuesUnderOne="false" ShowLimitValidation="true" TransactionId="209" AssetImpactTypeId="2"
                    MaxLength="23" ValidationRequiredMessage="<%$FrontEndResources:TRX00306,txtValueToIncrementValidationRequiredMessage %>"
                    ValidationInvalidInputMessage="<%$FrontEndResources:TRX00306,txtValueToIncrementValidationInvalidInputMessage %>"
                    Label="<%$FrontEndResources:TRX00306,txtValueToIncrement%>" runat="server" 
                    OnKeyUp="eBankit.Presentation.TRX00306.ValidateAmount();" />
                <div class="clearBoth"></div>
                <it:DatePickerTextBoxMetroControl_v3 ID="dtDateToIncrement" IsRequired="true" runat="server" Width="100px"
                    Label="<%$FrontEndResources:TRX00306,dtDateToIncrement%>" ValidationMinDateMessage="<%$FrontEndResources:TRX00306,dtDateToIncrementValidationMinDateMessage %>"
                    ValidationRequiredMessage="<%$FrontEndResources:TRX00306,dtDateToIncrementValidationRequiredMessage %>"
                    ValidationMessage="<%$FrontEndResources:TRX00306,dtDateToIncrementValidationMessage %>" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </it:FlowInnerContainer>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00306-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
<asp:HiddenField ID="hdnAccountRetDrop" runat="server" />
<asp:HiddenField ID="hdnAccountRetDropName" runat="server" />


<script type="text/javascript">
    eBankit.Presentation.TRX00306 = {}

    eBankit.Presentation.TRX00306.ValidateCustom = function () {
        var ret = true;

        var validAmount =  eBankit.Presentation.TRX00306.ValidateAmount();
        
        if(!validAmount){
            ret = false;
        }

        if ($("[id$=ddlOwnAccounts_dlField] :selected").val() == "-1") {
            eBankit.Presentation.InsertValidateMsg($("[id$=ddlOwnAccounts_dlField]"), top.eBankit.Presentation.GetResource("ddlOwnAccounts_RequireSelectValue"));
            ret = false;
        } else {
            eBankit.Presentation.RemoveValidateMsg($("[id$=ddlOwnAccounts_dlField]"));
        }
        

        return ret;
    }

    eBankit.Presentation.TRX00306.AccountBlur = function () {
        if (hdnAccountRetDrop.val() != '') {
            var ddlOwnAccountsInput = $("#" + $("[id$=ddlOwnAccounts_dlField]").attr("id") + "_input");
            var ddlOwnAccountsSelect = $("#" + $("[id$=ddlOwnAccounts_dlField]").attr("id") + "_input_" + hdnAccountRetDrop.val());
            $("[id$=ddlOwnAccounts_dlField]").val(hdnAccountRetDrop.val());
            ddlOwnAccountsInput.val(hdnAccountRetDropName.val() + " " + hdnAccountRetDrop.val());
            ddlOwnAccountsSelect.addClass("selected-option");
            hdnAccountRetDrop.val("");
            hdnAccountRetDropName.val("");
        }
    }

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        $("[id$=txtValueToIncrement_txField]").val('');
        $("[id$=txtValueToIncrement_txField]")[0].disabled = true;

        var ddlOwnAccount = $("[id$=ddlOwnAccounts_dlField]");
        ddlOwnAccount.on("change", function () {
            $("[id$=txtValueToIncrement_txField]")[0].disabled = false;
        });
    });

    $(document).ready(function () {
        eBankit.Presentation.TRX00306.AccountBlur();

        var $calendPickerDateName1 = $calendPickerDate1.attr("name");

        var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };
        $params['rules'][$calendPickerDateName1] = { "ValidateDateFormat": true };

        $params['messages'][$calendPickerDateName1] = {
            ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("dtDataTransferenciaPermErroMsg"); }
        };
    });

    var ddlOwnAccount = $("[id$=ddlOwnAccounts_dlField]");
    ddlOwnAccount.on("change", function () {
        $("[id$=txtValueToIncrement_txField]")[0].disabled = false;
    });

    eBankit.Presentation.TRX00306.ValidateAmount = function () {
        var ret = true;
        var amount = $('[id$=txtValueToIncrement_txField]');
        var amountValue = parseFormattedNumber(amount.val());
        eBankit.Presentation.RemoveValidateMsg(amount);
        if (amountValue == 0) {
            ret = false;
            eBankit.Presentation.InsertValidateMsg_V2(amount, top.eBankit.Presentation.GetResource("mintxtAmountPayment"));
            $('[id$=lblNetInterestReceivable_lblRightIn]').text('');
        }
        else if(amountValue == null ){
             ret = false;   
        }
        return ret;
    };

</script>
