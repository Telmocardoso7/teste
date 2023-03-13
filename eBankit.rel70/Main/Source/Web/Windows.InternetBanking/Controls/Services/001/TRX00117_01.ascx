<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00117_01.ascx.cs" Inherits="TRX00117_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div id="divContainer" runat="server">
                <it:PaymentEntityControl ID="phonePaymentEntitiesList" runat="server" AllowOtherEntities="true" SelectDefaultEntity="false" InServiceType="Recharge" />
                <it:FlowInnerContainer ID="flwData" Title="<%$FrontEndResources:TRX00117,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div>
                        
                        <div id="divOperatorSelectionInfo" class="login-info-bottom-text" visible="false" runat="server">
                            <asp:Label ID="lblOperatorSelectionInfo" Text="<%$FrontEndResources:TRX00113,lblOperatorSelectionInfo %>" runat="server"></asp:Label>
                        </div>
                        <div id="divData" runat="server">
                            <it:FlowLabel_v2 ID="lblSelectedEntity" Label="<%$FrontEndResources:TRX00116,lblSelectedEntity %>" runat="server" />
                            <it:DropDownListControl_v2 ID="ddlAmount" runat="server" Label="<%$FrontEndResources:TRX00118,ddlAmount%>" IsRequired="true" AutoPostBack="true" OnSelectedChanged="ddlAmount_SelectedChanged" />
                            <div id="divCustomValue" runat="server">
                                <it:CurrencyTextBoxControlAuto ID="txtAmount" IsRequired="true" ValidateWithAccountBalance="true" OnKeyUp="eBankit.Presentation.TRX00117.ValidateAmount();"
                                    ShowCurrency="true" AllowValuesUnderOne="true" ShowLimitValidation="true" TransactionId="168" AssetImpactTypeId="2"
                                    MaxLength="0" Width="50%" ValidationRequiredMessage="<%$FrontEndResources:TRX00118,txtAmountValidationRequiredMessage %>"
                                    ValidationInvalidInputMessage="<%$FrontEndResources:TRX00118,txtAmountValidationInvalidInputMessage %>"
                                    Label="<%$FrontEndResources:TRX00118,txtAmount%>" runat="server" OnTextChanged="eBankit.Presentation.TRX00117.ValidateAmount();"
                                    OnBlur="eBankit.Presentation.TRX00117.ValidateAmount();" />
                            </div>
                        </div>
                        <asp:HiddenField ID="hdnOptionValue" runat="server" />
                        <asp:HiddenField ID="hdnOptionValueMin" runat="server" />
                        <asp:HiddenField ID="hdnOptionValueMax" runat="server" />
                    </div>
                </it:FlowInnerContainer>
            </div>
            <asp:HiddenField ID="hdnHasEntity" runat="server" />
            <asp:HiddenField ID="hdnHasAmount" Value="0" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("trx00117-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00117-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
