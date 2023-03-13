<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01105_01.ascx.cs" Inherits="TRX01105_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div class="grayContainer bottomBorderInfoTopMessage">
        <div class="metro info-bottom-text col-lg-8 col-max heavyMargin" style="text-align: left !important">
            <asp:Label runat="server" Text="<%$FrontEndResources:TRX01105,ChangeContactInfo %>" CssClass="infoTopMessage"></asp:Label>
        </div>
    </div>

    <it:FlowInnerContainer ID="FlowInnerContainerPhone" Title="<%$FrontEndResources:TRX01105,TitlePhoneSection %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction field-phone" runat="server">
        <div>
            <it:FlowLabel_v3 ID="FlowLabelPhone" Label="<%$FrontEndResources:TRX01105,CurrentPhone %>" runat="server" />
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
                <ContentTemplate>
                    <it:PhoneTextBoxControl ID="PhoneTextBoxControl" Width="200px" DropWidth="80px" autocomplete="off" MinLength="9" Label="<%$FrontEndResources:TRX01105,NewPhone%>"
                        runat="server" TextMode="Phone" DropDownLabel="<%$ FrontEndResources:Onboarding,CountryCode %>"/>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </it:FlowInnerContainer>

    <it:FlowInnerContainer ID="FlowInnerContainerEmail" Title="<%$FrontEndResources:TRX01105,TitleEmailSection %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <it:FlowLabel_v3 ID="FlowLabelEmail" Label="<%$FrontEndResources:TRX01105,CurrentEmail %>" runat="server" />
            <asp:UpdatePanel ID="udpAvailableUserName" UpdateMode="Always" runat="server">
                <ContentTemplate>
                    <it:EmailTextBoxControl_v2 ID="TextBoxControlEmail" autocomplete="off" CssClass="metro field field_v2 break" Label="<%$FrontEndResources:TRX01105,NewEmail%>" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </it:FlowInnerContainer>

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01105-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01105-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

</div>