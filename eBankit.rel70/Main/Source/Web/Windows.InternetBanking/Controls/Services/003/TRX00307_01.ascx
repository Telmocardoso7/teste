<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00307_01.ascx.cs" Inherits="TRX00307_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divTransaction" class="transaction-content" runat="server">
    <it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX00306,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div style="padding-top: 25px;">
            <%-- <div class="metro">
                <div class="input-control switch switch-field" data-role="input-control" style="padding-left: 0px;">
                    <label class="inline-block">
                        <asp:Label ID="litRateAccount" Text="<%$FrontEndResources:TRX00307,chkRateAccount %>" CssClass="switch-label" runat="server"></asp:Label>
                        <input id="chkRateAccount" type="checkbox" runat="server" value="1" onclick="InterestRateAccount();" />
                        <span class="check" style="margin-right: 10px;"></span>
                    </label>
                </div>
            </div>--%>

            <div class="metro">
                <it:CheckBoxControl_v3 ID="chkRateAccount" value="0" OnClick="InterestRateAccount();" Label="<%$FrontEndResources:TRX00307,chkRateAccount%>" AllowOnOff="true" runat="server" />
            </div>

            <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <it:AutoCompleteDropDownList_v3 ID="ddlOwnAccounts" Style="margin-bottom: 0px;" Label="<%$FrontEndResources:TRX00307,txtOwnAccountDestNumber %>" IsRequired="true" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="clearBoth"></div>

            <div class="metro">
                <it:CheckBoxControl_v3 ID="chkSettlement" value="0" OnClick="chkSettlementValidator();" Label="<%$FrontEndResources:TRX00307,chkSettlement%>" AllowOnOff="true" runat="server" />
            </div>
            <it:CurrencyTextBoxControlAuto ID="txtMobilizationValue" IsRequired="true" ValidateWithAccountBalance="true"
                ShowCurrency="true" AllowValuesUnderOne="true"
                MaxLength="23" ValidationRequiredMessage="<%$FrontEndResources:TRX00307,txtMobilizationValueValidationRequiredMessage %>"
                ValidationInvalidInputMessage="<%$FrontEndResources:TRX00307,txtMobilizationValueValidationInvalidInputMessage %>"
                Label="<%$FrontEndResources:TRX00307,txtMobilizationValue%>" runat="server" />

            <it:DatePickerTextBoxMetroControl_v3 ID="dtMobilizationDate" IsRequired="true" runat="server" Width="120px"
                Label="<%$FrontEndResources:TRX00307,dtMobilizationDate%>" ValidationMinDateMessage="<%$FrontEndResources:TRX00307,dtMobilizationDateValidationMinDateMessage %>"
                ValidationRequiredMessage="<%$FrontEndResources:TRX00307,dtMobilizationDateValidationRequiredMessage %>"
                ValidationMessage="<%$FrontEndResources:TRX00307,dtMobilizationDateValidationMessage %>" />
            <div class="clearBoth"></div>
        </div>

    </it:FlowInnerContainer>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00307-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
<asp:HiddenField ID="hdnAccountRetDrop" runat="server" />
<asp:HiddenField ID="hdnAccountRetDropName" runat="server" />


<script type="text/javascript">
    eBankit.Presentation.TRX00307 = {}

    eBankit.Presentation.TRX00307.ValidateCustom = function () {
        var ret = true;

        if (!$("[id*='chkRateAccount']").is(':checked') && $("[id$=ddlOwnAccounts_dlField] :selected").val() == "-1") {
            eBankit.Presentation.InsertValidateMsg($("[id$=ddlOwnAccounts_dlField]"), top.eBankit.Presentation.GetResource("ddlOwnAccounts_RequireSelectValue"));
            ret = false;
        } else {
            eBankit.Presentation.RemoveValidateMsg($("[id$=ddlOwnAccounts_dlField]"));
        }

        return ret;
    }

    eBankit.Presentation.TRX00307.AccountBlur = function () {
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

    InterestRateAccount = function () {
        var selectbox = $("[id$=ddlOwnAccounts_dlField_input]");
        selectbox.prop("disabled", false);
        selectbox.css("background-color", "rgb(255, 255, 255)");
        if ($("[id*='chkRateAccount']").is(':checked')) {
            selectbox.css("background-color", "rgb(237, 237, 237)");
            selectbox.prop("disabled", true);
            $("#" + $("[id$=ddlOwnAccounts_dlField]").attr("id") + "_input").val("");
            // $("[id$=ddlOwnAccounts_dlField] :selected").val() = "-1";
        }
    }

    chkSettlementValidator = function () {
        var selectbox = $("[id$=txtMobilizationValue_txField]");
        selectbox.prop("disabled", false);
        selectbox.css("background-color", "rgb(255, 255, 255)");
        if ($("[id*='chkSettlement']").is(':checked')) {
            selectbox.css("background-color", "rgb(237, 237, 237)");
            selectbox.prop("disabled", true);
            $("#" + $("[id$=txtMobilizationValue_txField]").attr("id") + "_input").val("");
            // $("[id$=ddlOwnAccounts_dlField] :selected").val() = "-1";
        }
    }

    $(document).ready(function () {
        $("[id$=ddlOwnAccounts_dlField_container]").css('z-index', 9999);
        $("[id$=ddlOwnAccounts_dlField_container]").css('position', 'absolute');
        eBankit.Presentation.TRX00307.AccountBlur();
        if ($("[id*='chkRateAccount']").is(':checked')) {
            InterestRateAccount();
        }
        if ($("[id*='chkSettlement']").is(':checked')) {
            chkSettlementValidator();
        }

        var $calendPickerDateName1 = $calendPickerDate1.attr("name");

        var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };
        $params['rules'][$calendPickerDateName1] = { "ValidateDateFormat": true };

        $params['messages'][$calendPickerDateName1] = {
            ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("dtDataTransferenciaPermErroMsg"); }
        };
        //var validator = $("#aspnetForm").validate($params);

        //jQuery.validator.addMethod("ValidateDateFormat", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate1.val()) && eBankit.Presentation.InternalValidation($calendPickerDate1.val()); });
    });

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        $("[id$=ddlOwnAccounts_dlField_container]").css('z-index', 9999);
        $("[id$=ddlOwnAccounts_dlField_container]").css('position', 'absolute');
        eBankit.Presentation.TRX00307.AccountBlur();
        if ($("[id*='chkRateAccount']").is(':checked')) {
            InterestRateAccount();
        }
        if ($("[id*='chkSettlement']").is(':checked')) {
            chkSettlementValidator();
        }
    });


</script>
