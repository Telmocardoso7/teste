<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00309_01.ascx.cs" Inherits="TRX00309_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divTransaction" class="transaction-content" runat="server">
    <div class="metro">
        <div id="divWarningMessage" runat="server" class="col-xs-12 col-sm-12 col-md-12 col-lg-8 col-max panel-top" visible="false">
            <section class="content-message metro">
                <div id="MainContent_TransactionMainContent_divMessage" class="alert alert-info_v2 fade in">
                    <div class="div-icon-info_v2"><i class="icon-warning"></i></div>
                    <h4 class="alert-heading" style="padding-top: 25px;">
                        <asp:Literal ID="litTitleWarning" runat="server" Text="<%$FrontEndResources:TRX00309,NotAllowSettlementMessage %>" /></h4>
                    <div class="clearBoth"></div>
                </div>
            </section>
            <div class="clearBoth"></div>
        </div>
    </div>
    <div id="SettlementContent" style="margin-bottom: 10px;" runat="server">
        <it:FlowInnerContainer ID="ficSettlementData" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX00309,SettlementData%>" runat="server">
            <div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <it:FormRadioList_v3 ID="frSettlementType3" runat="server" RepeatDirection="Horizontal" LabelText="<%$FrontEndResources:TRX00309,txtSettlementType %>" CssClass="big-radioButton" OnSelectedIndexChanged="frSettlementType_OnSelectedIndexChanged" AutoPostBack="True" />
                        <it:AutoCompleteDropDownList_v2 ID="ddlOwnAccounts" Label="<%$FrontEndResources:TRX00307,txtOwnAccountDestNumber %>" IsRequired="true" runat="server" />
                        <it:CurrencyTextBoxControlAuto ID="txtAmount" ValidateWithAccountBalance="true"
                            ShowCurrency="true" Currency="EUR" AllowValuesUnderOne="False"
                            OnBlur="eBankit.Presentation.TRX00309.ValidateAmount()"
                            Label="<%$FrontEndResources:TRX00309,txtAmount%>" IsRequired="True" runat="server" />
                        <asp:HiddenField ID="hdnMaxAmount" runat="server" Value="-1" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </it:FlowInnerContainer>
    </div>
    <asp:HiddenField ID="hdnAccountRetDrop" runat="server" />
    <asp:HiddenField ID="hdnAccountRetDropName" runat="server" />
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("trx00309-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00309-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
