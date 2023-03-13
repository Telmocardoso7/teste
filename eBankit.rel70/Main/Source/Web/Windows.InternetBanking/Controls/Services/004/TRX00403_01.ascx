<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00403_01.ascx.cs" Inherits="TRX00403_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divTransaction" class="transaction-content" runat="server">
    <div id="divContainer" class="transaction-content col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max" runat="server">
        <asp:UpdatePanel ID="UpdatePanel33" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <it:FlowInnerContainer ID="flwData" Title="<%$FrontEndResources:TRX00401,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div>
                        <it:DropDownListControl_v2 ID="ddlCurrencyBase" IsRequired="true" Label="<%$FrontEndResources:TRX00403,BaseCurrency %>" runat="server" OnSelectedChanged="ddlCurrency_SelectedChanged" AutoPostBack="true" />
                        <it:DropDownListControl_v2 ID="ddlCurrencyDestination" IsRequired="true" Label="<%$FrontEndResources:TRX00403,CotationCurrency %>" runat="server" OnSelectedChanged="ddlCurrency_SelectedChanged" AutoPostBack="true" />

                        <it:CurrencyTextBoxControlAuto ID="txtAmount" IsRequired="true"
                            ValidateWithAccountBalance="true"
                            ShowCurrency="true"
                            AllowValuesUnderOne="true"
                            data-v-max="16"
                            ValidationRequiredMessage="<%$FrontEndResources:TRX00401,txtAmountValidationRequiredMessage %>"
                            ValidationInvalidInputMessage="<%$FrontEndResources:TRX00401,txtAmountValidationInvalidInputMessage %>"
                            Label="<%$FrontEndResources:TRX00401,txtAmount%>" runat="server" Text="0" />

                        <it:FlowLabel_v2 ID="lblInterestRateToBeApplied" Label="<%$FrontEndResources:TRX00403,ExchangeBuy %>" runat="server" />
                        <it:FlowLabel_v2 ID="lblAmountWithInterest" Label="<%$FrontEndResources:TRX00403,FinalAmount %>" runat="server" />
                        <asp:HiddenField ID="hdnInterestRate" runat="server" />
                        <asp:HiddenField ID="hdnAmountWithRate" runat="server" />

                        <div class="clearBoth"></div>
                    </div>
                </it:FlowInnerContainer>

                <div class="trs_buttons col-lg-8 col-max">
                    <it:LinkButtonControl ID="LinkButtonControl2" ActionType="Back" CustomCssClass="btn-default" Text="<%$FrontEndResources:TRX00901,Back%>" runat="server" />
                </div>

                <%--<div id="divCotation" class="col-xs-12 col-md-12 col-lg-12 text-center" style="background: #f4f4f4; padding: 2px 0px;" runat="server" visible="false">
                    <asp:Label ID="lblCotation" Text="<%$FrontEndResources:TRX00401,lblCotation%>" runat="server" />
                    <h3 class="col-container-center" style="color: #3e98b3; margin-top: 2px; margin-bottom: 5px; padding: 0px; font-weight: bolder;">
                        <asp:Literal ID="litCotation" runat="server"></asp:Literal></h3>
                </div>--%>
                <asp:HiddenField ID="hdnHasCotation" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div class="clearBoth paddingTop20 paddingBottom20"></div>

    <div id="ImgPanel" class="fullWidth noFloatOfHidden landingAccountContainer clearPadding paddingTop20 paddingBottom20">
        <div class="info-bottom-text col-lg-8 col-max">
            <asp:Label ID="lblWarning" Text="<%$FrontEndResources:TRX00403,Warning%>" runat="server"></asp:Label>
        </div>
    </div>

    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00403-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

</div>
<script>
    $(document).ready(function () {
        FormatContent();
    });

    var prm = Sys.WebForms.PageRequestManager.getInstance();

    prm.add_endRequest(function () {
        var ddlCurrencyBase = $('[id$=ddlCurrencyBase_dlField]');
        var ddlCurrencyDestination = $('[id$=ddlCurrencyDestination_dlField]');

        if (ddlCurrencyBase[0].options[ddlCurrencyBase[0].selectedIndex].value != '-1' && ddlCurrencyDestination[0].options[ddlCurrencyDestination[0].selectedIndex].value != '-1') {
            FormatContent();
            montante = $('[id$=txtAmount_txField]').autoNumeric('get');

            var amount = (montante * hdnInterestRate.val().replace(',', '.')).toFixed(2);
            if (isNaN(amount))
                hdnAmountWithRate.text("");
            else {
                switch (positionSymbol) {
                        //prefix case
                        case "p":
                            {
                                hdnAmountWithRate.text(currencySymbol + numberWithCommas(amount.replace('.', ',')) + " " + currency);
                                break;
                            }
                        //sufix and default case
                        case "s":
                        default:
                            {
                                hdnAmountWithRate.text(numberWithCommas(amount.replace('.', ',')) + currencySymbol + " " + currency);
                                break;
                            }
                    }
                
                lblAmountWithInterest.text(hdnAmountWithRate.text());
            }
        }

    });

    FormatContent = function () {
        lblAmountWithInterest.text(hdnAmountWithRate.text());
        txtAmount.keyup(function () {
            
            if (hdnInterestRate.val() != 0) {
                //var amount = txtAmount.val().replace(/,/g, '.');
                //var tax = hdnInterestRate.val().replace(',', '.');
                //var amount = (txtAmount.val().replace(/,/g, '.') * hdnInterestRate.val().replace(',', '.')).toFixed(2);
                montante = $('[id$=txtAmount_txField]').autoNumeric('get');
                var amount = (montante * hdnInterestRate.val().replace(',', '.')).toFixed(2);

                //var amount = (txtAmount.val().replace('.', '').replace(/,/g, '.') * hdnInterestRate.val().replace(',', '.')).toFixed(2);
                if (isNaN(amount))
                    hdnAmountWithRate.text("");
                else {
                    switch (positionSymbol) {
                        //prefix case
                        case "p":
                            {
                                hdnAmountWithRate.text(currencySymbol + numberWithCommas(amount.replace('.', ',')) + " " + currency);
                                break;
                            }
                        //sufix and default case
                        case "s":
                        default:
                            {
                                hdnAmountWithRate.text(numberWithCommas(amount.replace('.', ',')) + currencySymbol + " " + currency);
                                break;
                            }
                    }
                
                }
                lblAmountWithInterest.text(hdnAmountWithRate.text());
            }
        });
    }

    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }
</script>
