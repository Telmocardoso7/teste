<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00118_01.ascx.cs" Inherits="TRX00118_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div id="divContainer" runat="server">
                <it:PaymentEntityControl ID="phonePaymentEntitiesList" runat="server" AllowOtherEntities="true" SelectDefaultEntity="false" InServiceType="PhoneBill" />
                <it:FlowInnerContainer ID="flwData" Title="<%$FrontEndResources:TRX00118,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div>
                        <div id="divOperatorSelectionInfo" class="login-info-bottom-text" visible="false" runat="server">
                            <asp:Label ID="lblOperatorSelectionInfo" Text="<%$FrontEndResources:TRX00113,lblOperatorSelectionInfo %>" runat="server"></asp:Label>
                        </div>
                        
                        <div id="divData" runat="server">
                             <it:FlowLabel_v2 ID="lblSelectedEntity" Label="<%$FrontEndResources:TRX00116,lblSelectedEntity %>" runat="server" />
                        <it:NumberTextBoxControl_v2 ID="txtRefCode" OnlyPositiveValues="True" IsRequired="true" MaxLength="15" MinLength="1" Label="<%$FrontEndResources:TRX00118,txtRefCode%>" runat="server" />
                            <it:DropDownListControl_v2 ID="ddlAmount" runat="server" Label="<%$FrontEndResources:TRX00118,ddlAmount%>"  AutoPostBack="true" IsRequired ="true" OnSelectedChanged="ddlAmount_SelectedChanged"/>
                            <div id="divCustomValue" runat="server">
                                <it:CurrencyTextBoxControlAuto ID="txtAmount" IsRequired="true" ValidateWithAccountBalance="true"  OnKeyUp="eBankit.Presentation.TRX00118.ValidateAmount();"
                                    ShowCurrency="true" AllowValuesUnderOne="true" ShowLimitValidation="true" TransactionId="974" AssetImpactTypeId="2"
                                    MaxLength="0" Width="50%" ValidationRequiredMessage="<%$FrontEndResources:TRX00118,txtAmountValidationRequiredMessage %>"
                                    ValidationInvalidInputMessage="<%$FrontEndResources:TRX00118,txtAmountValidationInvalidInputMessage %>"
                                    Label="<%$FrontEndResources:TRX00118,txtAmount%>" runat="server" OnTextChanged="eBankit.Presentation.TRX00118.ValidateAmount();"
                                    OnBlur="eBankit.Presentation.TRX00118.ValidateAmount();" />
                            </div>                           
                        </div>
                        <asp:HiddenField ID="hdnOptionValue" runat="server" />
                        <asp:HiddenField ID="hdnOptionValueMin" runat="server" />
                        <asp:HiddenField ID="hdnOptionValueMax" runat="server" />
                    </div>
                </it:FlowInnerContainer>
            </div>
            <asp:HiddenField ID="hdnHasEntity" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("/Scripts/Services/Transactions/trx00118-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00118-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
