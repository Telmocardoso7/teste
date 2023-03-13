<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00514_01.ascx.cs" Inherits="TRX00514_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Register TagPrefix="st" TagName="LoanControl" Src="~/Controls/Generic/LoanProductsControl.ascx" %>
<div id="divContent" runat="server" class="transaction-content">
    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                <asp:PlaceHolder ID="phSelector" runat="server">
                    <st:LoanControl ID="prdControl" runat="server" />
                    <div class="clearBoth"></div>
                </asp:PlaceHolder>
            </asp:Panel>
            <div class="clearBoth"></div>

            <it:FlowInnerContainer ID="flwData" Title="<%$FrontEndResources:TRX00511,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <it:CurrencyTextBoxControlAuto ID="tbLoanAmount" IsRequired="true" ValidateWithAccountBalance="false"
                        ShowCurrency="true" AllowValuesUnderOne="false"
                        MaxLength="0" Width="50%" ValidationRequiredMessage="<%$FrontEndResources:TRX00121,txtAmountValidationRequiredMessage %>"
                        ValidationInvalidInputMessage="<%$FrontEndResources:TRX00121,txtAmountValidationInvalidInputMessage %>"
                        Label="<%$FrontEndResources:TRX00511,LoanAmount %>" runat="server" />
                    <it:CurrencyTextBoxControlAuto ID="tbCollateralValue" IsRequired="true" ValidateWithAccountBalance="false"
                        ShowCurrency="true" AllowValuesUnderOne="false"
                        MaxLength="0" Width="50%" ValidationRequiredMessage="<%$FrontEndResources:TRX00121,txtAmountValidationRequiredMessage %>"
                        ValidationInvalidInputMessage="<%$FrontEndResources:TRX00121,txtAmountValidationInvalidInputMessage %>"
                        Label="<%$FrontEndResources:TRX00512,CollateralValue %>" runat="server" />
                    <it:TextBoxControl_v2 ID="tbLoanDuration" ShowLabel="true" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:TRX00511,LoanDuration %>" runat="server" />
                </div>
            </it:FlowInnerContainer>
            <it:FlowInnerContainer ID="flowConfiguration" Visible="false" IsVisible="false" Title="<%$FrontEndResources:TRX00511,TitleConfiguration %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <it:DropDownListControl_v2 ID="ddPaymentFrequency" Visible="false" IsRequired="false" Label="<%$FrontEndResources:TRX00511,ddlPaymentFrequency%>" runat="server" />
                    <it:CurrencyTextBoxControlAuto ID="tbInitialPayment" IsRequired="false" ValidateWithAccountBalance="false" Visible="false"
                        ShowCurrency="true" AllowValuesUnderOne="true"
                        MaxLength="0" Width="50%" ValidationRequiredMessage="<%$FrontEndResources:TRX00121,txtAmountValidationRequiredMessage %>"
                        ValidationInvalidInputMessage="<%$FrontEndResources:TRX00121,txtAmountValidationInvalidInputMessage %>"
                        Label="<%$FrontEndResources:TRX00511,InitialPayment %>" runat="server" />
                    <it:CurrencyTextBoxControlAuto ID="tbBalloonPayment" IsRequired="false" ValidateWithAccountBalance="false" Visible="false"
                        ShowCurrency="true" AllowValuesUnderOne="true"
                        MaxLength="0" Width="50%" ValidationRequiredMessage="<%$FrontEndResources:TRX00121,txtAmountValidationRequiredMessage %>"
                        ValidationInvalidInputMessage="<%$FrontEndResources:TRX00121,txtAmountValidationInvalidInputMessage %>"
                        Label="<%$FrontEndResources:TRX00511,BalloonPayment %>" runat="server" />
                    <it:TextBoxControl_v2 ID="tbInterestOnlyPeriod" IsRequired="true"
                        Label="<%$FrontEndResources:TRX00511,tbInterestOnlyPeriods%>" runat="server" />
                </div>
            </it:FlowInnerContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="clearBoth"></div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00514-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>

<div class="clearBoth paddingTop20 paddingBottom20"></div>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
    <ContentTemplate>
        <div id="ImgPanel" runat="server" class="fullWidth noFloatOfHidden landingAccountContainer clearPadding paddingTop20 paddingBottom20">
            <div class="info-bottom-text col-lg-8 col-max">
                <asp:Label ID="lblWarning" Text="<%$FrontEndResources:TRX00514,Warning%>" runat="server"></asp:Label>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
<script src="../../Scripts/Services/Transactions/TRX00514-1.0.js"></script>
