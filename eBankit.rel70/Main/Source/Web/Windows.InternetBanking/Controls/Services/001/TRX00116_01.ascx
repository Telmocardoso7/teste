<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00116_01.ascx.cs" Inherits="TRX00116_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" class="transaction-content" runat="server">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div id="divContainer" runat="server" class="transaction-content servicePaymentForm">
                <it:PaymentEntityControl ID="phonePaymentEntitiesList" runat="server" AllowOtherEntities="true" SelectDefaultEntity="false" InServiceType="UtilityPayment" />
                <it:FlowInnerContainer ID="flwData" Title="<%$FrontEndResources:TRX00116,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div>
                        <div id="divOperatorSelectionInfo" class="login-info-bottom-text" visible="false" runat="server">
                            <asp:Label ID="lblOperatorSelectionInfo" Text="<%$FrontEndResources:TRX00113,lblOperatorSelectionInfo %>" runat="server"></asp:Label>
                        </div>
                        <div id="divData" runat="server">
                            <it:FlowLabel_v2 ID="lblSelectedEntity" Label="<%$FrontEndResources:TRX00116,lblSelectedEntity %>" runat="server" />
                            <it:NumberTextBoxControl_v2 ID="txtSelectedEntity" OnlyPositiveValues="True" IsRequired="true" MaxLength="5" MinLength="1" Label="<%$FrontEndResources:TRX00116,lblSelectedEntity%>" runat="server" />
                            <it:NumberTextBoxControl_v2 ID="txtRefCode" OnlyPositiveValues="True" IsRequired="true" MaxLength="15" MinLength="1" Label="<%$FrontEndResources:TRX00116,txtRefCode%>" runat="server" />
                            <it:CurrencyTextBoxControlAuto ID="txtAmount" IsRequired="true" ValidateWithAccountBalance="true"
                                ShowCurrency="true" AllowValuesUnderOne="true" ShowLimitValidation="true" TransactionId="3" AssetImpactTypeId="2"
                                MaxLength="23" ValidationRequiredMessage="<%$FrontEndResources:TRX00116,txtAmountValidationRequiredMessage %>"
                                ValidationInvalidInputMessage="<%$FrontEndResources:TRX00116,txtAmountValidationInvalidInputMessage %>"
                                Label="<%$FrontEndResources:TRX00116,txtAmount%>" runat="server"
                                OnKeyUp="eBankit.Presentation.TRX00116.ValidateAmount();" />                            
                        </div>
                    </div>
                </it:FlowInnerContainer>
            </div>
            <asp:HiddenField ID="hdnHasEntity" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("/Scripts/Services/Transactions/trx00116-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00116-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
