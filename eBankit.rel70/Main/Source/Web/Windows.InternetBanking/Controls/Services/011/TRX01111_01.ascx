<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01111_01.ascx.cs" Inherits="TRX01111_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <asp:UpdatePanel ID="updContent" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX01111,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <it:DropDownListControl_v2 ID="ddlChannel" Label="<%$FrontEndResources:TRX01111,ddlChannel%>" runat="server" Visible="false" />
                    <it:DropDownListControl_v2 ID="ddlTransactionType" IsRequired="true" Label="<%$FrontEndResources:TRX01111,ddlTransactionType%>" runat="server" />
                    <it:TextBoxControl_v2 ID="txtTransactionTypeDisabled" IsDisabled="true" IsRequired="true" Visible="false" Label="<%$FrontEndResources:TRX01111,ddlTransactionType%>" runat="server" />
                    <it:DropDownListControl_v2 ID="ddlLimitType" IsRequired="true" Label="<%$FrontEndResources:TRX01111,ddlLimitType%>" runat="server" />
                    <it:DropDownListControl_v2 ID="ddlImpactType" IsRequired="true" Label="<%$FrontEndResources:TRX01111,ddlImpactType%>" runat="server" />
                    <it:FlowLabel_v3 ID="lblCombinations" Label="<%$FrontEndResources:TRX01110,Combination%>" runat="server" Visible="false" />
                    <it:CurrencyTextBoxControlAuto ID="txtLimitValue" IsRequired="true" ValidateWithAccountBalance="false"
                        ShowCurrency="true" AllowValuesUnderOne="true"
                        data-v-max="16" Label="<%$FrontEndResources:TRX01111,txtLimitValue%>" runat="server" Text="0"/>
                    <it:DropDownListControl_v2 ID="ddlCurrency" OnSelectedChanged="ddlCurrency_SelectedChanged" IsRequired="true" Label="<%$FrontEndResources:TRX01111,ddlCurrency%>" AutoPostBack="True" runat="server" />
                </div>
            </it:FlowInnerContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01111-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01111-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
