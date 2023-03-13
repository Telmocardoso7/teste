<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01106_01.ascx.cs" Inherits="TRX01106_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <it:FlowInnerContainer ID="FlowInnerContainer1" Title="<%$FrontEndResources:TRX01102,flwContractData %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <it:FlowLabel_v2 ID="flwContract" Label="<%$FrontEndResources:TRX01102,lblContract %>" runat="server" />
        </div>
    </it:FlowInnerContainer>
    <it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX01106,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <asp:HiddenField EnableViewState="true" ID="hdnCurrentLoginAlias" runat="server" />
            <it:FlowLabel_v2 ID="lblcurrentCode" Label="<%$FrontEndResources:TRX01106,lblcurrentCode %>" runat="server" />
            <it:FlowLabel_v2 ID="lblcurrentCodeAlias" Label="<%$FrontEndResources:TRX01106,lblcurrentCodeAlias %>" runat="server" />
            <asp:UpdatePanel ID="udpAvailableUserName" UpdateMode="Always" runat="server">
                <ContentTemplate>
                    <div class="textbox-available">
                        <span id="spnUserNameActive" class="not-available-icon hidden" runat="server">
                            <asp:Literal ID="txtUserNameActive" Text="no" runat="server"></asp:Literal></span>
                        
                        <it:TextBoxControl_v2 ID="txtnewCodeAlias" IsRequired="true" Label="<%$FrontEndResources:TRX01106,txtnewCodeAlias %>" runat="server" />
                        <asp:Button ID="btnVerifyUserName" runat="server" CssClass="hidden" OnClick="btnVerifyUserName_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </it:FlowInnerContainer>
    <div class="clearBoth paddingTop20 paddingBottom20"></div>
    <div id="divWarningMessage" runat="server" class="fullWidth noFloatOfHidden landingAccountContainer clearPadding paddingTop20 paddingBottom20">
        <div class="info-bottom-text col-lg-8 col-max">
            <asp:Label ID="lblWarning" Text="<%$FrontEndResources:TRX01106,Warning%>" runat="server"></asp:Label>
        </div>
    </div>
    <div class="clearBoth"></div>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01106-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01106-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
