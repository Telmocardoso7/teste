<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00511_01.ascx.cs" Inherits="TRX00511_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
        <div class="clearBoth"></div>
    </asp:Panel>
    <div class="clearBoth"></div>
    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <it:FlowInnerContainer ID="flwData" Title="<%$FrontEndResources:TRX00511,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <it:DropDownListControl_v2 ID="ddlProduct" IsRequired="true" Label="<%$FrontEndResources:TRX00511,Product %>" runat="server" OnSelectedChanged="ddlProduct_SelectedChanged" AutoPostBack="true" />
                    <it:CurrencyTextBoxControlAuto ID="txtlblLoanAmount" IsRequired="true" ValidateWithAccountBalance="false"
                        ShowCurrency="true" AllowValuesUnderOne="false"
                        MaxLength="0" Width="50%" ValidationRequiredMessage="<%$FrontEndResources:TRX00121,txtAmountValidationRequiredMessage %>"
                        ValidationInvalidInputMessage="<%$FrontEndResources:TRX00121,txtAmountValidationInvalidInputMessage %>"
                        Label="<%$FrontEndResources:TRX00511,LoanAmount %>" runat="server" />
                    <it:NumberTextBoxControl_v3 ID="txtlblLoanDuration" RegexExpression="/^[0-9]{1,2}$/" IsRequired="true" MinLength="0" 
                        MinValueMessageValidation="<%$FrontEndResources:TRX00121,txtAmountValidationInvalidInputMessage %>" MaxValueMessageValidation="<%$FrontEndResources:TRX00121,txtAmountValidationInvalidInputMessage %>" 
                        Label="<%$FrontEndResources:TRX00511,LoanDuration %>" runat="server" />
                </div>
            </it:FlowInnerContainer>
            <it:FlowInnerContainer ID="flowConfiguration" Visible="false" IsVisible="false" Title="<%$FrontEndResources:TRX00511,TitleConfiguration %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <it:DropDownListControl_v2 ID="ddlPaymentFrequency" Visible="false" IsRequired="false" Label="<%$FrontEndResources:TRX00511,ddlPaymentFrequency%>" runat="server" />
                    <it:CurrencyTextBoxControlAuto ID="txtInitialPayment" IsRequired="false" ValidateWithAccountBalance="false" Visible="false" 
                        ShowCurrency="true" Currency="EUR" AllowValuesUnderOne="true"
                        MaxLength="0" Width="50%" ValidationRequiredMessage="<%$FrontEndResources:TRX00121,txtAmountValidationRequiredMessage %>"
                        ValidationInvalidInputMessage="<%$FrontEndResources:TRX00121,txtAmountValidationInvalidInputMessage %>"
                        Label="<%$FrontEndResources:TRX00511,InitialPayment %>" runat="server" />
                    <it:CurrencyTextBoxControlAuto ID="txtBalloonPayment" IsRequired="false" ValidateWithAccountBalance="false" Visible="false" 
                        ShowCurrency="true" AllowValuesUnderOne="true"
                        MaxLength="0" Width="50%" ValidationRequiredMessage="<%$FrontEndResources:TRX00121,txtAmountValidationRequiredMessage %>"
                        ValidationInvalidInputMessage="<%$FrontEndResources:TRX00121,txtAmountValidationInvalidInputMessage %>"
                        Label="<%$FrontEndResources:TRX00511,BalloonPayment %>" runat="server" />
                    <it:NumberTextBoxControl_v3 ID="txtInterestOnlyPeriods" RegexExpression="/^[0-9]{1,2}$/" MinLength="0" MaxLength="2" Visible="false" IsRequired="false" 
                        MinValueMessageValidation="<%$FrontEndResources:TRX00121,txtAmountValidationInvalidInputMessage %>" MaxValueMessageValidation="<%$FrontEndResources:TRX00121,txtAmountValidationInvalidInputMessage %>" 
                        Label="<%$FrontEndResources:TRX00511,tbInterestOnlyPeriods%>" runat="server" />
                </div>
            </it:FlowInnerContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="clearBoth"></div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00511-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>

<div class="clearBoth paddingTop20 paddingBottom20"></div>

<div id="ImgPanel" class="fullWidth noFloatOfHidden landingAccountContainer clearPadding paddingTop20 paddingBottom20">
    <div class="info-bottom-text col-lg-8 col-max">
        <asp:Label ID="lblWarning" Text="<%$FrontEndResources:TRX00511,Warning%>" runat="server"></asp:Label>
    </div>
</div>
