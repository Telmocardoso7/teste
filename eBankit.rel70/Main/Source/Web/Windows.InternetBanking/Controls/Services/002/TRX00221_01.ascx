<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00221_01.ascx.cs" Inherits="TRX00221_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div id="transactionForm" runat="server">
        <div class="transaction-content" style="margin-bottom: 10px">
            <it:FlowInnerContainer ID="FlowInnerContainer2" Title="<%$FrontEndResources:TRX00221,SelectedCard %>" CustomCssClass="col-max bs-reduced bs-head-metro" runat="server">
                <div class="col-xs-12 accountWrapper" style="padding: 0; border: none !important; margin-bottom: 0;">
                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-4 col-container-center clearPadding fullHeight" style="width: 250px;">
                        <img id="Img" src="<%$ebFile:~/Content/currenttheme/images/credit_card.png%>" alt="credit card" style="max-width: 100%; max-height: 100%;" class="img-responsive img-products" runat="server" />
                    </div>
                    <div class="col-xs-12 col-sm-9 col-md-9 col-lg-8 productexpand" id="trxDepositosPrazoprdexp" style="padding-right: 0; height: 150px">
                        <div class="col-container-center" style="padding: 0; width: 100%; height: 75%;">
                            <h3 class="col-container-center" style="color: rgb(24, 146, 174) !important; font-size: 17px; margin-top: 10px; margin-bottom: 10px; padding: 0; font-family: 'Gotham Medium';">
                                <asp:Literal ID="litProductTitle" runat="server"></asp:Literal></h3>
                            <div class="selPrd-description">
                                <asp:Literal ID="litProductDescription" runat="server"></asp:Literal>
                            </div>
                        </div>
                        <div style="height: 25%">
                            <a id="aChangeProduct" runat="server" class="flLeft ebankit-pointer-text" style="text-align: right; color: #333; cursor: pointer;"><span class="changeIcon" style="color: rgb(242,166,64);">
                                <asp:Literal ID="litChangeProduct" runat="server" Text="<%$FrontEndResources:TRX00221,litChangeProduct %>"></asp:Literal></span></a>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                    <div class="clearBoth"></div>
                </div>
            </it:FlowInnerContainer>
        </div>
        <div class="clearBoth"></div>
        <div class="transaction-content">
            <it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX00221,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Always">
                    <ContentTemplate>
                        <it:TextBoxControl_v2 ID="txtCardName" MaxLength="250" IsRequired="true" Label="<%$FrontEndResources:TRX00221,CardName%>" OnBlur="eBankit.Presentation.TRX00221.ValidateCardName();" runat="server" />
                        <it:CurrencyTextBoxControlAuto ID="txtLimit" Visible="False"
                            ShowCurrency="True" AllowValuesUnderOne="false"
                            MaxLength="23"
                            IsRequired="false"
                            Label="<%$FrontEndResources:TRX00221,Limit%>" runat="server" Style="padding-top: 20px;"
                            OnBlur="eBankit.Presentation.TRX00221.ValidateLimit();" />
                        <it:DropDownListControl_v2 ID="ddlPaymentOption" ShowLabel="true" runat="server" IsRequired="true" Width="195px" Label="<%$FrontEndResources:TRX00221,ddlNewOption %>" AutoPostBack="false" Visible="False"
                            OnChange="eBankit.Presentation.TRX00221.ValidatePaymentOption();" />
                        <asp:HiddenField ID="hdnMaxLimit" runat="server" />
                        <asp:HiddenField ID="hdnCreditCard" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </it:FlowInnerContainer>
        </div>
    </div>
    <script type="text/javascript">
        var inCurrentAccount = '<%=this.AccountListControl.SelectedValue.TransactionalAccountNumber %>';
        var inCurrency = '<%=this.AccountListControl.SelectedValue.Currency %>';
        var projId = "<%=ConfigurationManager.AppSettings["projectId"].ToString() %>";
    </script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00221-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00221-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
