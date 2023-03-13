<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00222_01.ascx.cs" Inherits="TRX00222_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div id="transactionContent" runat="server">
        <it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX00222,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
            <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Always">
                <ContentTemplate>
                    <it:FlowLabel ID="lblPaymentdate" Label="<%$FrontEndResources:TRX00222,PaymentDate%>" runat="server" />
                    <it:NumberTextBoxControl_v3 ID="txtNewPaymentdate" OnlyPositiveValues="True" IsRequired="true" Label="<%$FrontEndResources:TRX00222,NewPaymentDate%>" Width="80"
                        OnKeyUp="eBankit.Presentation.TRX00222.ValidateDate();" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </it:FlowInnerContainer>
    </div>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00222-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00222-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
